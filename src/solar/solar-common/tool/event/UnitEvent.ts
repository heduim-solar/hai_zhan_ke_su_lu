/**
 * 单位事件 里的常用函数集合
 */
import DataBase from "@/common/DataBase";
import {Unit} from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";

export default class UnitEvent {

    static instance = new UnitEvent();

    protected constructor() {

    }


    /**
     * 被贩卖单位
     */
    get soldUnit(): unit {
        return GetSoldUnit();
    }


    /**
     * 被贩卖单位 id字符串
     */
    get soldUnitTypeIdStr(): string {
        return id2string(GetUnitTypeId(GetSoldUnit()));
    }

    /**
     * 获得触发单位(handle)
     */
    get trigUnit(): unit {
        return GetTriggerUnit();
    }

    /**
     * 触发单位是否是英雄
     */
    get isHeroUnitTrig(): boolean {
        let unitHandle = GetTriggerUnit();
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
     * 获得触发单位名字
     */
    get trigUnitName(): string {
        return GetUnitName(GetTriggerUnit());
    }

    /**
     * 获得触发单位(包装对象)
     */
    get trigUnitObj(): Unit {
        return Unit.fromHandle(GetTriggerUnit());
    }

    /**
     * 获得触发单位类型 id字符串
     */
    get trigUnitTypeIdStr(): string {
        return id2string(GetUnitTypeId(GetTriggerUnit()));
    }

    /**
     * 获得触发单位自定义值
     */
    get trigUnitSolarData(): AppUnitData {
        return DataBase.getUnitSolarData(GetTriggerUnit());
    }

    get trigUnitAttribute(): AppAttribute {
        return AttributeUtil.getUnitAttribute(GetTriggerUnit());
    }

    /**
     * 获得触发单位类型的自定义值
     */
    get trigUnitTypeSolarData(): AppUnitTypeData {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetTriggerUnit())));
    }

    get trigUnitX(): number {
        return GetUnitX(GetTriggerUnit());
    }

    get trigUnitY(): number {
        return GetUnitY(GetTriggerUnit());
    }

    get trigUnitFacing(): number {
        return GetUnitFacing(GetTriggerUnit());
    }

    /**
     * 触发单位所属玩家
     */
    get trigUnitOwner(): player {
        return GetOwningPlayer(GetTriggerUnit());
    }

    get trigUnitOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(GetTriggerUnit()));
    }


}