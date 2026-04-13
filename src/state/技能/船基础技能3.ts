import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import EffectUtil from "@/EffectUtil";
import DamageType from "@/DamageType";
import BaseUtil from "@/BaseUtil";
import MathUtil from "@/MathUtil";

export default class 船基础技能3 {

    constructor() {


        let actorType: AppActorType = null;

        /**
         * 猩红之女
         * 以任何形式杀死的敌人会产生300范围的爆炸，造成攻击力x0.5的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("猩红之女基础技能");
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            //限制范围 不然秒全图 卡退
            if (MathUtil.distanceBetweenUnits(actor.unit, deathEnemy) > 2000) {
                return
            }
            let damage = UnitStateUtil.calculateStateFormula({attack: 0.5}, actor.unit);
            let x = GetUnitX(deathEnemy);
            let y = GetUnitY(deathEnemy);
            BaseUtil.runLater(0.01, () => {
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 300), damage, DamageType.s_物理, x, y);
                EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                    x, y, actor.get("modelScale", 0.3));
            })

        }


        /**
         * 光明号
         * 每秒对600范围造成35+攻击力x0.1的真实伤害。（辉耀）
         */
        //one case
        actorType = ActorTypeUtil.getActorType("光明号基础技能");
        actorType.interval = actorType.interval || 1
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({base: 35, attack: 0.1}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 600), damage, DamageType.s_真实伤害)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                actor.unitX, actor.unitY, actor.get("modelScale", 2))
        }
        /**
         * 潜水艇
         * 伤害减免-30%，攻击力-50%
         */
        //one case
        // actorType = ActorTypeUtil.getActorType("潜艇基础技能");
        // actorType.onCreated = (actor) => {
        //     UnitAddAbility(actor.unit, "Avul")
        // }
        // actorType.onDestroy = (actor) => {
        //     UnitRemoveAbility(actor.unit, "Avul")
        // }

        /**
         * 船长号
         * 每间隔3秒，对1200范围造成攻击力x1的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("船长号基础技能");
        actorType.interval = actorType.interval || 3
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({attack: 1}, actor.unit);
            let area = actor.get("area", 1200);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, area, damage, DamageType.s_真实伤害)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                actor.unitX, actor.unitY, actor.get("modelScale", 1.5))
        }

    }
}