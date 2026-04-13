/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import {Unit} from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";

export default class UnitAttackedEvent extends UnitEvent {

    static instance: UnitAttackedEvent = new UnitAttackedEvent();

    protected constructor() {
        super();
    }

    /**
     * 攻击单位
     */
    get attacker(): unit {
        return GetAttacker();
    }

    /**
     * 攻击单位名字
     */
    get attackerName(): string {
        return GetUnitName(GetAttacker());
    }

    /**
     * 攻击单位(包装对象)
     */
    get attackerObj(): Unit {
        return Unit.fromHandle(GetAttacker());
    }

    /**
     * 获得单位自定义值
     */
    get attackerSolarData(): AppUnitData {
        return DataBase.getUnitSolarData(GetAttacker());
    }

    /**
     * 获得单位属性
     */
    get attackerAttribute(): AppAttribute {
        return AttributeUtil.getUnitAttribute(GetAttacker());
    }

    /**
     * 获得单位类型的自定义值
     */
    get attackerTypeSolarData(): AppUnitTypeData {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetAttacker())));
    }

    get attackerX(): number {
        return GetUnitX(GetAttacker());
    }

    get attackerY(): number {
        return GetUnitY(GetAttacker());
    }

    get attackerFacing(): number {
        return GetUnitFacing(GetAttacker());
    }

    /**
     * 攻击者所属玩家
     */
    get attackerOwner(): player {
        return GetOwningPlayer(GetAttacker());
    }

    get attackerOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(GetAttacker()));
    }
}