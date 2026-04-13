/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import {Unit} from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";

export default class UnitDeathEvent extends UnitEvent {

    static instance: UnitDeathEvent = new UnitDeathEvent();

    protected constructor() {
        super();
    }

    /**
     * 是否有凶手单位
     * 触发杀死的单位 没有凶手单位
     */
    get hasKillingUnit(): boolean {
        return IsHandle(GetKillingUnit());
    }

    /**
     * 凶手单位是否是英雄
     */
    get isHeroUnitkiller(): boolean {
        let unitHandle = GetKillingUnit();
        if (IsUnitType(unitHandle, UNIT_TYPE_HERO)
            && !IsUnitType(unitHandle, UNIT_TYPE_PEON)
            && !IsUnitType(unitHandle, UNIT_TYPE_SUMMONED)
            && !IsUnitIllusion(unitHandle)
            && !IsUnitHidden(unitHandle)) {
            return true;
        }
        return false;
    }

    /**
     * 凶手单位
     */
    get killingUnit(): unit {
        return GetKillingUnit();
    }

    /**
     * 凶手单位名字
     */
    get killingUnitName(): string {
        return GetUnitName(GetKillingUnit());
    }

    /**
     * 凶手单位(包装对象)
     */
    get killingUnitObj(): Unit {
        return Unit.fromHandle(GetKillingUnit());
    }

    /**
     * 获得单位自定义值
     */
    get killingUnitSolarData(): AppUnitData {
        return DataBase.getUnitSolarData(GetKillingUnit());
    }

    get killingUnitAttribute(): AppAttribute {
        return AttributeUtil.getUnitAttribute(GetKillingUnit());
    }

    /**
     * 获得单位类型的自定义值
     */
    get killingUnitTypeSolarData(): AppUnitTypeData {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetKillingUnit())));
    }

    get killingUnitX(): number {
        return GetUnitX(GetKillingUnit());
    }

    get killingUnitY(): number {
        return GetUnitY(GetKillingUnit());
    }

    get killingUnitFacing(): number {
        return GetUnitFacing(GetKillingUnit());
    }

    /**
     * 凶手单位所属玩家
     */
    get killingUnitOwner(): player {
        return GetOwningPlayer(GetKillingUnit());
    }

    get killingUnitOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(GetKillingUnit()));
    }
}