import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import EffectUtil from "@/EffectUtil";
import SelectUtil from "@/SelectUtil";

export default class 雷霆支配者 {


    constructor() {

        let actorType: AppActorType = null;
        /**
         * 攻击力+10000
         * 智力+4000
         * 拥有雷霆时针（星河之上那个机关），对触碰到的敌人造成智力x0.3的伤害（伤害触发判定0.1s一次，转速和那个一样）
         */

        actorType = ActorTypeUtil.getActorType("雷霆支配者");
        actorType.interval = 0.05;
        actorType.onUnitChange = (actor, unit) => {
            if (IsHandle(unit)) {
                actor.effect = EffectUtil.addSpecialEffect("model\\雷霆支配者.mdx", actor.unitX, actor.unitY, 0.66)
            } else if (actor.effect != null) {
                EXSetEffectZ(actor.effect, -5000)
                DestroyEffect(actor.effect)
                actor.effect = null;
            }
        }
        actorType.onUnitInterval = (actor) => {
            actor.aface = (actor.aface || 0) - 3;
            if (actor.aface <= -360) {
                actor.aface = 0;
            }
            if (actor.effect) {
                EXSetEffectXY(actor.effect, actor.unitX, actor.unitY)
                EXEffectMatReset(actor.effect)
                EXEffectMatRotateZ(actor.effect, actor.aface)
            }
            let damage = UnitStateUtil.calculateStateFormula({int: 0.15}, actor.unit);
            SelectUtil.forEnemyUnitsInLine(actor.unit, actor.unitX, actor.unitY, 1200, actor.aface, 100, u => {
                DamageRecordUtil.damage(actor.getName(), actor.unit, u, damage)
            });
        }
        /**
         * 攻击力+15000
         * 智力+6000
         * 魔法免疫
         * 拥有雷霆时针，对触碰到的敌人造成智力x0.5的伤害（伤害触发判定0.1s一次，转速和那个一样）
         */
        actorType = ActorTypeUtil.getActorType("雷霆毁灭者");
        actorType.interval = 0.05;
        actorType.onUnitChange = (actor, unit) => {
            if (IsHandle(unit)) {
                UnitAddAbility(unit, "AImx")
                SetPlayerAbilityAvailable(GetOwningPlayer(unit), "AImx", false)
                actor.effect = EffectUtil.addSpecialEffect("model\\雷霆支配者.mdx", actor.unitX, actor.unitY, 0.66)
            } else {
                UnitRemoveAbility(actor.lastUnit, "AImx")
                if (actor.effect != null) {
                    EXSetEffectZ(actor.effect, -5000)
                    DestroyEffect(actor.effect)
                    actor.effect = null;
                }
            }
        }
        actorType.onUnitInterval = (actor) => {
            actor.aface = (actor.aface || 0) - 5;
            if (actor.aface <= -360) {
                actor.aface = 0;
            }
            if (actor.effect) {
                EXSetEffectXY(actor.effect, actor.unitX, actor.unitY)
                EXEffectMatReset(actor.effect)
                EXEffectMatRotateZ(actor.effect, actor.aface)
            }
            let damage = UnitStateUtil.calculateStateFormula({int: 0.25}, actor.unit);
            SelectUtil.forEnemyUnitsInLine(actor.unit, actor.unitX, actor.unitY, 1200, actor.aface, 100, u => {
                DamageRecordUtil.damage(actor.getName(), actor.unit, u, damage)
            });
        }
    }


}