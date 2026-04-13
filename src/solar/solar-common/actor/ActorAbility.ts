import Actor from "@/Actor";
import ObjectTemplateUtil from "@/ObjectTemplateUtil";
import AbilityUtil from "@/AbilityUtil";
import AbilityButtonUtil from "@/AbilityButtonUtil";
import BaseUtil from "@/BaseUtil";
import DataBase from "@/DataBase";

/**
 * 优先保证写法兼容ActorBuff 这样吞噬后才有效果（既不要过多使用此子类中的具体功能）
 */
export default class ActorAbility extends Actor {


    abilityId?: string
    startPosNum?: number
    posNum?: number

    /**
     * 添加一个演员技能
     * @param actorTypeId
     * @param unit 拥有技能的单位 不能为空
     * @param startPosNum 指定技能位置 可为null 从技能起始位置开始找到的空位值 (比如5则为第二排左到右第1个位置。9为最下面1排的左到右第一个位置)
     */
    constructor(actorTypeId: string, unit?: unit, startPosNum?: number) {
        super(actorTypeId)
        this.startPosNum = startPosNum;
        if (unit == null) {
            //演员物品继承此类 但是物品创建时是没有关联单位的 物品是在拾取时才有关联单位
            return;
        }
        if (startPosNum != null) {//优先从传入的startPos 开始查找空位  未传startPos 则按演员技能定义的xy当做起始位置查找空位
            this.posNum = ObjectTemplateUtil.getUnitAbilityTemplateNextNumber(unit, startPosNum)
        } else if (this.get("y") != null) {
            let basePos = AbilityButtonUtil.getNumberByPos(this.get("x", 0), this.get("y"))
            this.posNum = ObjectTemplateUtil.getUnitAbilityTemplateNextNumber(unit, basePos)
        } else {
            this.posNum = ObjectTemplateUtil.getUnitAbilityTemplateNextNumber(unit, 1)
        }
        //
        this.unit = unit
        this.addUnitAbilityTemplate(this.posNum);
        //
        this._sl_init()
        this.update()
    }


    protected _sl_rawset<Key extends keyof AppActorAbilityType>(key: Key, value: AppActorAbilityType[Key]) {
        super._sl_rawset(key, value);
        let ability = this.getAbility();
        if (ability == null) {
            return
        }
        switch (key) {
            case "id":
                EXSetAbilityDataString(ability, 1, ABILITY_DATA_NAME, this.uuid)
                break;
            case "name":
                EXSetAbilityDataString(ability, 1, ABILITY_DATA_TIP, value)
                break;
            case "icon":
                EXSetAbilityDataString(ability, 1, ABILITY_DATA_ART, value)
                break;
            case "disable":
                if (this.get("disable")) {
                    this.getRootFrameControl().getDisableFrame().visible = true;
                } else {
                    let disableFrame = this.getRootFrameControl(false)?.getDisableFrame(false);
                    if (disableFrame) {
                        disableFrame.visible = false;
                    }
                }
                break;
            case "describe":
                EXSetAbilityDataString(ability, 1, ABILITY_DATA_UBERTIP, value)
                break;
            case "passive":
                //在其他地方判断是否是被动 然后取消释放命令
                //设置为瞬发无目标类型的 以在准备施法时停止单位(如果是点目标 会有选择的步骤)
                if (value == true) {
                    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
                    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0);
                } else if (this.get("targetType") != null) {
                    AbilityUtil.setTargetType(ability, value)
                }
                break;
            case "hide":
                SetPlayerAbilityAvailable(GetOwningPlayer(this.unit), this.abilityId, !value);
                break;
            case "hotKey":
                EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_HOTKET, char2number(value) || 0)
                break;
            case "range":
                EXSetAbilityDataReal(ability, 1, 0x6B, value)
                break;
            case "area":
                EXSetAbilityDataReal(ability, 1, 0x6A, value)
                break;
            case "targetType":
                if (this.isPassive()) {//被动物品的技能 只能是无目标
                    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
                    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0);
                } else {
                    AbilityUtil.setTargetType(ability, value)
                }
                break;
            case "targetAllow":
                AbilityUtil.setTargetAllow(ability, value)
                break;
            case "dur":
                EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_DUR, value)
                EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_HERODUR, value)
                break;
            case "manaCost":
                EXSetAbilityDataInteger(ability, 1, 0x68, value)
                break;
            case "maxCd":
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_COOL, value)
                break;
        }
    }

    get<Key extends keyof AppActorAbilityType>(key: Key, defaultValue?: AppActorAbilityType[Key]): AppActorAbilityType[Key] {
        return super.get(key, defaultValue);
    }

    /**
     * 获取演员的类型
     */
    get actorType(): AppActorAbilityType {
        return this._actorType;
    }

    setPassive(passive: boolean) {
        this.set("passive", passive)
    }


    isPassive(): boolean {
        return this.get("passive", false)
    }


    setXY(x: number, y: number) {
        super.setXY(x, y);
        this.setAbilityPos(AbilityButtonUtil.getNumberByPos(x, y))
    }

    /**
     * 设置位置
     * @param pos
     */
    setAbilityPos(pos: number) {
        let ability = this.getAbility();
        if (ability == null) {
            return
        }
        this.removeUnitAbilityTemplate();
        this.addUnitAbilityTemplate(pos);
        this.update();
    }


    private addUnitAbilityTemplate(pos: number) {
        this.abilityId = ObjectTemplateUtil.addUnitAbilityTemplate(this.unit, pos);
        this.templateId = this.abilityId
        SetPlayerAbilityAvailable(GetOwningPlayer(this.unit), this.abilityId, true);
        DataBase.getAbilityTypeSolarData(this.abilityId, true)._SL_solarActorAbility = this;
    }

    private removeUnitAbilityTemplate() {
        if (this.abilityId != null) {
            DataBase.getAbilityTypeSolarData(this.abilityId, true)._SL_solarActorAbility = null;
            if (this.unit != null) {
                //移除技能
                ObjectTemplateUtil.removeUnitAbilityTemplate(this.unit, this.abilityId);
            }
        }

    }

    /**
     * 获取技能Handle
     */
    getAbility(): ability | null {
        if (this.abilityId != null && this.unit != null) {
            return EXGetUnitAbility(this.unit, this.abilityId);
        }
        return null
    }

    /**
     * 获取最大 maxCd
     */
    getMaxCd(): number {
        return this.get("maxCd", 0)
    }

    /**
     * 设置最大cd
     * @param maxCd
     */
    setMaxCd(maxCd: number) {
        this.set("maxCd", maxCd)
    }

    /**
     * 设置当前cd
     * @param cd
     */
    setCooldown(cd: number) {
        EXSetAbilityState(this.getAbility(), 1, cd)
    }

    /**
     * 获取当前cd
     * @param cd
     */
    getCooldown(): number {
        return EXGetAbilityState(this.getAbility(), 1)
    }

    /**
     * 设置当前热键
     * @param hotKey
     */
    setHotKey(hotKey: string) {
        this.set("hotKey", hotKey)
    }


    update() {
        if (this._sl_isDestroyed) {
            return
        }
        super.update();
        let ability = this.getAbility();
        if (ability == null) {
            return
        }
        AbilityUtil.refreshAbility(this.unit, this.abilityId)
        //待证实  目标要延迟设置才能保证100%成功
        if (this.get("targetAllow") || this.get("targetType")) {
            BaseUtil.runLater(0.01, () => {
                if (this.get("targetType")) {
                    this._sl_rawset("targetType", this.get("targetType"))
                }
                if (this.get("targetAllow")) {
                    this._sl_rawset("targetAllow", this.get("targetAllow"))
                }
                AbilityUtil.refreshAbility(this.unit, this.abilityId)
            })
        }
    }

    action(x: number, y: number, targetUnit?: unit) {
        if (this.isPassive()) {
            return
        }
        super.action(x, y, targetUnit);
    }


    destroy() {
        this.removeUnitAbilityTemplate();
        super.destroy();
    }


}