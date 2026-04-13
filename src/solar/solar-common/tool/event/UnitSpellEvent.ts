/**
 * 单位施法事件 里的常用函数集合
 */
import UnitEvent from "./UnitEvent";
import {Unit} from "../../w3ts/handles/unit";
import AttributeUtil from "../../util/system/AttributeUtil";

export default class UnitSpellEvent extends UnitEvent {

    static instance = new UnitSpellEvent();

    protected constructor() {
        super();
    }

    /**
     * 施法技能
     */
    get spellAbilityId(): number {
        return GetSpellAbilityId();
    }

    /**
     * 施法技能 字符串类型
     */
    get spellAbilityIdStr(): string {
        return id2string(GetSpellAbilityId());
    }

    /**
     * 施法目标(handle)
     */
    get spellTargetUnit(): unit {
        return GetSpellTargetUnit();
    }

    /**
     * 施法目标单位名字
     */
    get spellTargetUnitName(): string {
        return GetUnitName(GetSpellTargetUnit());
    }

    /**
     * 施法点
     * 请使用变量保存 以便与清理
     */
    get spellTargetLoc(): location {
        return GetSpellTargetLoc();
    }

    /**
     * 施法点
     */
    get spellTargetX(): number {
        return GetSpellTargetX();
    }

    /**
     * 施法点
     */
    get spellTargetY(): number {
        return GetSpellTargetY();
    }

    /**
     * 施法目标(包装对象)
     */
    get spellTargetUnitObj(): Unit {
        return Unit.fromHandle(GetSpellTargetUnit());
    }

    get spellTargetUnitAttribute(): AppAttribute {
        return AttributeUtil.getUnitAttribute(GetSpellTargetUnit());
    }

    get spellTargetUnitX(): number {
        return GetUnitX(GetSpellTargetUnit());
    }

    get spellTargetUnitY(): number {
        return GetUnitY(GetSpellTargetUnit());
    }

    get spellTargetUnitFacing(): number {
        return GetUnitFacing(GetSpellTargetUnit());
    }

    /**
     * 施法目标单位所属玩家
     */
    get spellTargetUnitOwner(): player {
        return GetOwningPlayer(GetSpellTargetUnit());
    }

    get spellTargetUnitOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(GetSpellTargetUnit()));
    }
}