import Actor from "@/Actor";
import ObjectTemplateUtil from "@/ObjectTemplateUtil";
import DataBase from "@/DataBase";
import ActorAbility from "@/ActorAbility";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";
import FrameControl from "@/FrameControl";
import UnitStateUtil from "@/UnitStateUtil";

/**
 * 演员单位
 * 演员单位的类型是公用的。
 *
 */
export default class ActorUnit extends Actor {
    /** 拥有UI的单位 比如模拟血条*/
    static _sl_hasFrameActorUnits: { [uuid: string]: ActorUnit } = {}
    //
    unitTypeID: string
    sellItemAbilityList: ActorAbility[] = []

    constructor(actorTypeId: string, player: player, x: number, y: number) {
        super(actorTypeId)
        //单位模板 即用即还
        let templateType = this.getTemplateType();
        ObjectTemplateUtil._sl_init();
        if (ObjectTemplateUtil.templateInfo[templateType] == null) {
            //直接使用原生物编id 当模板
            this.unitTypeID = templateType;
        } else {
            this.unitTypeID = ObjectTemplateUtil.borrowTemplate(templateType);
            //单位模板 即用即还
            ObjectTemplateUtil.returnTemplate(templateType, this.unitTypeID);
        }
        if (this.unitTypeID == null || this.unitTypeID.length != 4) {
            log.errorWithTraceBack("物编模板id获取失败:" + tostring(templateType) + " -> " + tostring(this.unitTypeID))
            return;
        }
        //
        if (this.actorType.sellItems && this.actorType.sellItems.length > 0 && this.actorType.onUnitInterval == null) {
            ActorTypeShopUtil.autoDisableSellingAbilityOnNoStoreTarget(actorTypeId)
        }
        //
        this.unit = CreateUnit(player, this.unitTypeID, x, y, 270)
        //
        DataBase.getUnitSolarData(this.unit)._SL_solarActorUnit = this;
        this._sl_init();
        this.update();
        //设置英雄左上角图标
        if (IsHeroUnitId(GetUnitTypeId(this.unit)) && FrameSetOriginButtonTexture && GetLocalPlayer() == player) {
            for (let i = 5; i >= 0; i--) {
                let heroBarButton = DzFrameGetHeroBarButton(i);
                //把最后一个图标 设置为正确的英雄图标
                if (FrameIsShow(heroBarButton)) {
                    FrameSetOriginButtonTexture(heroBarButton, this.getIcon());
                    break;
                }
            }
        }
    }

    /**
     * 获取演员的类型
     */
    get actorType(): AppActorUnitType {
        return this._actorType;
    }

    protected _sl_rawset<Key extends keyof AppActorUnitType>(key: Key, value: AppActorUnitType[Key]) {
        super._sl_rawset(key, value);
        if (!IsHandle(this.unit)) {
            return
        }
        switch (key) {
            case "name":
                SetUnitName?.(this.unit, value)
                SetUnitProperName?.(this.unit, value)
                break;
            case "model":
                if (SetUnitModel) {
                    SetUnitModel(this.unit, value)
                } else {
                    DzSetUnitModel(this.unit, value)
                    //设置大头像
                    SetUnitPortrait?.(this.unit, value)
                }
                break;
            case "modelScale":
                SetUnitScale(this.unit, value, value, value)
                break;
            case "colorR":
                SetUnitVertexColor(this.unit, value || 255, this.get("colorG", 255),
                    this.get("colorB", 255), this.get("alpha", 255))
                break;
            case "colorG":
                SetUnitVertexColor(this.unit, this.get("colorR", 255), value || 255,
                    this.get("colorB", 255), this.get("alpha", 255))
                break;
            case "colorB":
                SetUnitVertexColor(this.unit, this.get("colorR", 255), this.get("colorG", 255),
                    value || 255, this.get("alpha", 255))
                break;
            case "alpha":
                SetUnitVertexColor(this.unit, this.get("colorR", 255), this.get("colorG", 255),
                    this.get("colorB", 255), value || 255)
                break;
            case "missileModel":
                SetUnitMissileModel?.(this.unit, value)
                break;
            case "moveType":
                UnitStateUtil.setMoveType(this.unit, value)
                break;
            case "flyHeight":
                UnitAddAbility(this.unit, FourCC('Amrf'));
                UnitRemoveAbility(this.unit, FourCC('Amrf'));
                SetUnitFlyHeight(this.unit, value, 0)
                break;
            case "maxLife":
                SetUnitState(this.unit, UNIT_STATE_MAX_LIFE, value)
                SetUnitState(this.unit, UNIT_STATE_LIFE, value)
                break;
            case "maxMana":
                SetUnitState(this.unit, UNIT_STATE_MAX_MANA, value)
                SetUnitState(this.unit, UNIT_STATE_MANA, value)
                break;
            //设置感知敌人距离
            case "acquireRange":
                SetUnitAcquireRange(this.unit, value)
                break;
            case "range":
                SetUnitState(this.unit, UnitStateDamageRange, value)
                break;
            case "damage":
                SetUnitState(this.unit, UnitStateDamageBase, value)
                break;
            case "damageCd":
                SetUnitState(this.unit, UnitStateDamageCool, value)
                break;
            case "strength":
                SetHeroStr(this.unit, value, true)
                break;
            case "agility":
                SetHeroAgi(this.unit, value, true)
                break;
            case "intelligence":
                SetHeroInt(this.unit, value, true)
                break;
            case "def":
                SetUnitState(this.unit, UnitStateArmor, value)
                break;
            case "moveSpeed":
                SetUnitMoveSpeed(this.unit, value)
                break;
            case "sellItems":
                let sellItems: string[] = value as any;
                if (sellItems && sellItems.length > 0) {
                    this.addSellItem(...sellItems)
                }
                break;
            case "abilities":
                let abilities: string[] = value as any;
                if (abilities && abilities.length > 0) {
                    this.addAbility(...abilities)
                }
                break;
        }
    }


    get<Key extends keyof AppActorUnitType>(key: Key, defaultValue?: AppActorUnitType[Key]): AppActorUnitType[Key] {
        return super.get(key, defaultValue);
    }

    setXY(x: number, y: number) {
        super.setXY(x, y);
        SetUnitPosition(this.unit, x, y)
    }

    getRootFrameControl(createDefault: boolean = true): FrameControl {
        if (createDefault && this._sl_rootFrameControl == null) {
            ActorUnit._sl_hasFrameActorUnits[this.uuid] = this;
        }
        return super.getRootFrameControl(createDefault);
    }

    /**
     * 安全的添加售卖物品。区别是可以重复调用此方法 不会添加重复的物品去售卖
     */
    addSellItem(...sellItems: string[]) {
        if (sellItems == null || sellItems.length == 0) {
            return
        }
        if (sellItems.length > 12) {
            log.errorWithTraceBack(this.getName() + ":sellItems售卖物品超过12个。" + sellItems.length)
            return;
        }

        for (let sellItemId of sellItems) {
            if (!this.hasSellItem(sellItemId)) {
                let sellingAbilityTypeId = ActorTypeShopUtil.warpActorItem2SellingAbility(sellItemId).id;
                let actorAbility = this.addActorAbility(sellingAbilityTypeId);
                this.sellItemAbilityList.push(actorAbility);
            }
        }
    }

    /**
     * 是否已有某个演员物品的售卖
     * @param sellItemId
     */
    hasSellItem(sellItemId: string): boolean {
        let sellingAbilityTypeId = ActorTypeShopUtil.warpActorItem2SellingAbility(sellItemId).id;
        for (let sellItemAbility of this.sellItemAbilityList) {
            if (sellItemAbility.actorType.id == sellingAbilityTypeId) {
                return true;
            }
        }
        return false;
    }

    /**
     * 移除某个演员物品的售卖
     * @param sellItemId
     */
    removeSellItem(sellItemId: string): boolean {
        let sellingAbilityTypeId = ActorTypeShopUtil.warpActorItem2SellingAbility(sellItemId).id;
        for (let i = 0; i < this.sellItemAbilityList.length; i++) {
            let sellItemAbility = this.sellItemAbilityList[i];
            if (sellItemAbility.actorType.id == sellingAbilityTypeId) {
                sellItemAbility.destroy();
                this.sellItemAbilityList = this.sellItemAbilityList.splice(i, 1)
            }
        }
        return false;
    }

    applyTimedLife(duration: number, buffid: number | string = 'BHwe') {
        UnitApplyTimedLife(this.unit, buffid, duration)
    }


    /**
     * 添加技能(或者演员技能)
     */
    addAbility(...abilities: string[]): void {
        if (abilities && abilities.length > 0) {
            for (let ability of abilities) {
                if (DataBase.getSolarActorType(ability) != null) {
                    if (this.getActorAbility(ability) == null) {
                        this.addActorAbility(ability)
                    }
                } else {
                    UnitAddAbility(this.unit, ability)
                }
            }
        }
    }

    /**
     * 添加一个演员技能
     * @param actorAbilityTypeId
     * @param posNum 指定技能位置
     * @param startPos 若为指定技能位置则从技能起始位置开始找到后面的空位值
     */
    addActorAbility(actorAbilityTypeId: string, posNum?: number): ActorAbility {
        let actorAbility = new ActorAbility(actorAbilityTypeId, this.unit, posNum);
        return actorAbility;
    }


    /**
     * 获取单位身上的指定类型的演员技能
     * @param actorTypeId
     */
    getActorAbility(actorTypeId: string): ActorAbility {
        let abilityTemplate = DataBase.getUnitSolarData(this.unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return;
        }
        for (let abilityTemplateKey in abilityTemplate) {
            let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
            if (actor != null && actor.actorTypeId == actorTypeId) {
                return actor as ActorAbility;
            }
        }
        return null;
    }


    /**
     * 销毁此单位身上的所有 演员技能
     * @param unit
     */
    destroyAllActorAbility(): void {
        let abilityTemplate = DataBase.getUnitSolarData(this.unit, false)?._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return null;
        }
        for (let abilityTemplateKey in abilityTemplate) {
            let actor = DataBase.getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)?._SL_solarActorAbility;
            if (actor != null) {
                actor.destroy();
            }
        }
    }

    destroy() {
        let unit = this.unit
        super.destroy();
        if (this._sl_RootFrame != null) {
            deleteKey(ActorUnit._sl_hasFrameActorUnits, this.uuid)
        }
        //这里可能为null 比如多次调用了destroy 后面调用的都没有东西可以清理了
        if (IsHandle(unit)) {
            RemoveUnit(unit)
        }
    }

}