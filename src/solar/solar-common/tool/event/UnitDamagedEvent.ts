/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import DataBase from "../../common/DataBase";
import {Unit} from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";

export default class UnitDamagedEvent extends UnitEvent {

    static instance: UnitDamagedEvent = new UnitDamagedEvent();

    protected constructor() {
        super();
    }

    /**
     * 伤害值
     */
    get damage(): number {
        return GetEventDamage();
    }

    /**
     * 是否有伤害来源单位
     */
    get hasDamageSource(): boolean {
        return IsHandle(GetEventDamageSource());
    }

    /**
     * 伤害来源单位
     */
    get damageSource(): unit {
        return GetEventDamageSource();
    }

    /**
     * 伤害来源单位类型id str
     */
    get damageSourceTypeIdStr(): string {
        return id2string(GetUnitTypeId(GetEventDamageSource()));
    }

    /**
     * 伤害来源单位名字
     */
    get damageSourceName(): string {
        return GetUnitName(GetEventDamageSource());
    }

    /**
     * 伤害类型Id
     */
    get damageTypeId(): number {
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE);
    }

    /**
     * 攻击类型Id
     */
    get attackTypeId(): number {
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE);
    }

    /**
     * 武器类型Id
     */
    get weaponTypeId(): number {
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE);
    }

    /**
     * 伤害来源单位(包装对象)
     */
    get damageSourceObj(): Unit {
        return Unit.fromHandle(GetEventDamageSource());
    }

    /**
     * 获得单位自定义值
     */
    get damageSourceSolarData(): AppUnitData {
        return DataBase.getUnitSolarData(GetEventDamageSource());
    }

    /**
     * 获得单位属性
     */
    get damageSourceAttribute(): AppAttribute {
        return AttributeUtil.getUnitAttribute(GetEventDamageSource());
    }

    /**
     * 获得单位类型的自定义值
     */
    get damageSourceTypeSolarData(): AppUnitTypeData {
        return DataBase.getUnitTypeSolarData(id2string(GetUnitTypeId(GetEventDamageSource())));
    }

    get damageSourceX(): number {
        return GetUnitX(GetEventDamageSource());
    }

    get damageSourceY(): number {
        return GetUnitY(GetEventDamageSource());
    }

    get damageSourceFacing(): number {
        return GetUnitFacing(GetEventDamageSource());
    }

    /**
     * 伤害来源所属玩家
     */
    get damageSourceOwner(): player {
        return GetOwningPlayer(GetEventDamageSource());
    }

    get damageSourceOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(GetEventDamageSource()));
    }
}