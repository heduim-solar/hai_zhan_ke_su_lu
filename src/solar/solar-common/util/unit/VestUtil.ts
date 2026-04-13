/**
 * 马甲工具
 */
import {Trigger} from "@/trigger";
import BaseUtil from "@/util/BaseUtil";
import DataBase from "@/DataBase";
import UnitStateUtil from "@/UnitStateUtil";
import UnitUtil from "@/UnitUtil";
import ActorItemUtil from "@/ActorItemUtil";

/** @noSelf **/
export default class VestUtil {

    /**
     * @deprecated see  VestUtil.createVestByUnit(
     * @param u
     * @param x
     * @param y
     * @param model
     * @param moveType
     * @param timer
     * @param player
     * @constructor
     */
    static SunCreateVestByUnit(u: unit, x: number = GetUnitX(u), y: number = GetUnitY(u), model: string = "", moveType: number = 0, timer: number = 2, player?: player): unit {
        return VestUtil.createVestByUnit(u, x, y, model, moveType, timer, player);
    }

    /***  u: 所属玩家单位
     **   x，y：马甲创建的坐标
     **   model：模型路径，默认为空
     **   moveType：默认为没有类型, 作为投射物时填1,为飞行类型
     **   timer: 马甲存活时间,默认为2秒.  填0,为自己排泄
     **   player: 默认不填，填就是为‘玩家所属’创建单位
     */
    static createVestByUnit(u: unit, x: number = GetUnitX(u), y: number = GetUnitY(u), model: string = "", moveType: number = 0, timer: number = 2, player?: player): unit {
        if (player) {
            return VestUtil.createVest(player, x, y, model, moveType, timer);
        } else {
            return VestUtil.createVest(GetOwningPlayer(u), x, y, model, moveType, timer);
        }
    }

    static createVest(player: player, x: number, y: number, model: string = "", moveType: number = 0, timer: number = 2): unit {
        let mj: unit = CreateUnit(player, FourCC('hrdh'), x, y, 0);
        DzSetUnitModel(mj, model)
        if (moveType == 1) {
            // 飞行类型
            EXSetUnitMoveType(mj, 0x04)
        } else {
            // 没有类型
            EXSetUnitMoveType(mj, 0x00)
            ShowUnit(mj, false)
        }
        SetUnitPosition(mj, x, y)
        SetUnitMoveSpeed(mj, 0)
        SetUnitState(mj, UNIT_STATE_MAX_MANA, 99999)
        SetUnitState(mj, UNIT_STATE_MANA, 99999)
        UnitAddAbility(mj, FourCC('Aloc'))
        if (timer > 0) {
            BaseUtil.runLater(timer, () => {
                RemoveUnit(mj)
            })
        }
        return mj
    }


    private static _sl_createPhantomUnitTrigger: Trigger = null;

    /**
     * 简单模拟一下 幻像属性  如果对属性计算要求高的话 请不要使用此幻象。
     * 创建幻像单位
     * @param unit
     * @param lifeTime 持续时间
     * @param damageP 施加伤害 1 = 100%
     * @param underDamageP 承受伤害 1 = 100%
     */
    static createPhantomUnit(unit: unit, lifeTime: number = 15, damageP: number = 1, underDamageP: number = 2) {
        if (!IsHandle(unit)) {
            return
        }
        //初始化属性
        if (VestUtil._sl_createPhantomUnitTrigger == null) {
            let trigger = new Trigger();
            trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_SUMMON)
            trigger.addAction(() => {
                let vest = GetSummoningUnit();
                let srcUnit = DataBase.getUnitSolarData(vest, false)?.createPhantomUnit_srcUnit;
                if (!IsHandle(srcUnit)) {
                    return
                }
                //手动设置属性
                let phantomUnit = GetSummonedUnit()
                if (!IsHandle(phantomUnit)) {
                    return;
                }
                for (let i = 0; i < 6; i++) {
                    let item = UnitItemInSlot(phantomUnit, i);
                    if (IsHandle(item) && ActorItemUtil.getActorItem(item) == null) {
                        RemoveItem(item);
                    }
                }
                if (UnitUtil.isHero(phantomUnit)) {
                    //镜像设置3维无效
                    UnitUtil.setExtraStr(phantomUnit, UnitUtil.getExtraStr(srcUnit))
                    UnitUtil.setExtraAgi(phantomUnit, UnitUtil.getExtraAgi(srcUnit))
                    UnitUtil.setExtraInt(phantomUnit, UnitUtil.getExtraInt(srcUnit))
                }
                UnitUtil.setExtraAttack(phantomUnit, UnitUtil.getExtraAttack(srcUnit))
                UnitUtil.setExtraAttackSpd(phantomUnit, UnitUtil.getExtraAttackSpd(srcUnit))
                UnitUtil.setExtraDef(phantomUnit, UnitUtil.getExtraDef(srcUnit))
                // 同步生命魔法
                UnitStateUtil.setMaxLife(phantomUnit, UnitStateUtil.getMaxLife(srcUnit))
                UnitStateUtil.setLife(phantomUnit, UnitStateUtil.getLife(srcUnit))
                UnitStateUtil.setMaxMana(phantomUnit, UnitStateUtil.getMaxMana(srcUnit))
                UnitStateUtil.setMana(phantomUnit, UnitStateUtil.getMana(srcUnit))
            });
            VestUtil._sl_createPhantomUnitTrigger = trigger;
        }
        //马甲释放 幻像物品
        let vest = VestUtil.createVestByUnit(unit);
        DataBase.getUnitSolarData(vest, true).createPhantomUnit_srcUnit = unit;
        UnitAddAbility(vest, "AIil")
        let abilityTemp = EXGetUnitAbility(vest, "AIil")
        EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DATA_A, damageP)
        EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DATA_B, underDamageP)
        EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DUR, lifeTime)
        EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_HERODUR, lifeTime)
        IncUnitAbilityLevel(vest, "AIil")
        DecUnitAbilityLevel(vest, "AIil")
        IssueTargetOrderById(vest, 852274, unit)

    }

}