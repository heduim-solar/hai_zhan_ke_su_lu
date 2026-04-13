import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "./主炮基础事件";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";
import RandomUtil from "@/RandomUtil";
import SelectUtil from "@/SelectUtil";
import JumpUtil from "@/JumpUtil";
import MathUtil from "@/MathUtil";
import TextTagUtil from "@/TextTagUtil";
import ActorUtil from "@/ActorUtil";

export default class 船长号主炮 {


    /**
     射程：300
     伤害：攻击力x3
     射速：0.5
     特殊：该主炮造成伤害时有13%（25%）概率击飞目标点350范围内所有敌人，造成力量x6的伤害
     */

    constructor() {

        //one case
        let actorType = ActorTypeUtil.getActorType("船长号");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = (projectile) => {
                if (!RandomUtil.isInChance(ActorUtil.isUnitHasActor(actor.unit, "麦哲伦") ? 0.25 : 0.13)) {
                    return
                }
                TextTagUtil.text("击飞", projectile.target)
                let damage = UnitStateUtil.calculateStateFormula({str: 6}, actor.unit);
                let x = GetUnitX(projectile.target);
                let y = GetUnitY(projectile.target)
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(),actor.unit, 350, damage, DamageType.s_物理, x, y)
                EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                    x, y, actor.get("modelScale", 0.5))
                SelectUtil.forEnemyUnitsInRange(projectile.source, 350, enemy => {
                    let enemyX = GetUnitX(enemy);
                    let enemyY = GetUnitY(enemy);
                    let pv = MathUtil.polarProjection(enemyX, enemyY, 200, MathUtil.angleBetweenCoords(x, y, enemyX, enemyY));
                    JumpUtil.jump(enemy, pv.x, pv.y, 300)
                }, x, y)


            }
        }
    }

}