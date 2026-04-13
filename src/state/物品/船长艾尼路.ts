import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";
import MathUtil from "@/MathUtil";
import DamageRecordUtil from "@/DamageRecordUtil";

export default class 船长艾尼路 {


    constructor() {
        let actorType: AppActorType = null;
        /**
         * 生命值+20000
         * 护甲+200
         * 航速+360节
         * 每秒对周围造成3000+15%生命值的伤害。
         */
        actorType = ActorTypeUtil.getActorType("艾尼路");
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({base: 3000, hp: 0.15}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, damage, DamageType.s_物理, actor.unitX, actor.unitY)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model\\基本技能\\地震.mdx"), actor.unitX, actor.unitY,
                actor.get("modelScale", 0.9))
        }
        /**
         * 生命值+30000
         * 护甲+300
         * 航速+360节
         * 1、每秒对周围造成3000+15%生命值的伤害。
         * 2、身边环绕3颗雷球，对碰到的单位造成攻击力x2的伤害。
         */
        actorType = ActorTypeUtil.getActorType("神·艾尼路");
        actorType.interval = 0.05
        actorType.onUnitChange = (actor, unit) => {
            if (IsHandle(unit)) {
                let modelPath = "model\\特效\\白雷球.mdx"
                let modelScale = actor.get("modelScale", 1)
                actor.effect = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY, modelScale)
                actor.effect2 = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY, modelScale)
                actor.effect3 = EffectUtil.addSpecialEffect(modelPath, actor.unitX, actor.unitY, modelScale)
            } else {
                if (actor.effect != null) {
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect)
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect2)
                    EffectUtil.destroyEffectNoDeathAnim(actor.effect3)
                    actor.effect = null;
                }
            }
        }
        actorType.onUnitInterval = (actor) => {
            actor.aface = (actor.aface || 0) - 6;
            if (actor.aface <= -360) {
                actor.aface = 0;
            }
            if (actor.effect) {
                //
                let damage = UnitStateUtil.calculateStateFormula({attack: 2}, actor.unit);
                //
                let loc: Vector = null;
                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface)
                EXSetEffectXY(actor.effect, loc.x, loc.y)
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)
                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + 120)
                EXSetEffectXY(actor.effect2, loc.x, loc.y)
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)
                //一个球
                loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + 240)
                EXSetEffectXY(actor.effect3, loc.x, loc.y)
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 200, damage, DamageType.s_物理, loc.x, loc.y)

            }


        }

    }


}