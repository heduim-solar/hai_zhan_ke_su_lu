import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import MathUtil from "@/MathUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";

export default class 白胡子船长 {


    constructor() {

        let actorType: AppActorType = null;
        /**
         * 攻击力+10000
         * 护甲+300
         * 每秒对前方600范围造成一次地震，伤害为全属性x1。
         */

        actorType = ActorTypeUtil.getActorType("白胡子");
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({fullPros: 1}, actor.unit);
            let projection = MathUtil.polarProjection(GetUnitX(actor.unit), GetUnitY(actor.unit), 300, GetUnitFacing(actor.unit));
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, damage, DamageType.s_物理, projection.x, projection.y)
            EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\地震.mdx", projection.x, projection.y, 0.9)
        }

        /**
         * 攻击力+13500
         * 护甲+500
         * 1、每秒对前方600范围造成一次地震，伤害为全属性x1。
         * 2、每3秒对身边600范围造成一次海震，伤害为全属性x4。
         */
        actorType = ActorTypeUtil.getActorType("年轻·白胡子");
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            actor.time = (actor.time || 0) + 1;
            let damage = UnitStateUtil.calculateStateFormula({fullPros: 1}, actor.unit);
            let projection = MathUtil.polarProjection(GetUnitX(actor.unit), GetUnitY(actor.unit), 300, GetUnitFacing(actor.unit));
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, damage, DamageType.s_物理, projection.x, projection.y)
            EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\地震.mdx", projection.x, projection.y, 0.9)
            //
            if (actor.time == 3) {
                actor.time = 0;
                let damage = UnitStateUtil.calculateStateFormula({fullPros: 4}, actor.unit);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 600, damage, DamageType.s_物理, actor.unitX, actor.unitY)
                EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\地震.mdx", actor.unitX, actor.unitY, 0.9)
            }
        }

    }


}