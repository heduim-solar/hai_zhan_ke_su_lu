import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "./主炮基础事件";
import SelectUtil from "@/SelectUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import BounceMissileController from "@/BounceMissileController";
import UnitStateUtil from "@/UnitStateUtil";
import EffectUtil from "@/EffectUtil";
import BaseUtil from "@/BaseUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import 魔改道具 from "../商城/魔改道具";

export default class 船基础主炮 {


    constructor() {

        let actorType: AppActorType = null;
        /**
         * 射程：300
         * 伤害：攻击力x2.5
         * 射速：0.6
         * 特殊：该主炮每次攻击对450范围内的敌人造成80%溅射伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("铁达尼号");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let flsh = projectile.damage * 0.8;
                let range = 魔改道具.主炮是否拥有魔改道具(actor) ? 650 : 450;
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(),
                    projectile.source, range, flsh, DamageType.s_物理, projectile.x, projectile.y)
            }
        }
        /**
         * 射程：300
         * 伤害：攻击力x2.5
         * 射速：0.6
         * 特殊：该主炮每次攻击对600范围内的敌人造成100%溅射伤害
         */
        //one case
        actorType = ActorTypeUtil.getActorType("泰坦尼克号");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let flsh = projectile.damage;
                let range = 魔改道具.主炮是否拥有魔改道具(actor) ? 800 : 600;
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(),
                    projectile.source, range, flsh, DamageType.s_物理, projectile.x, projectile.y)
            }
        }

        /**
         * 射程：600
         * 伤害：攻击力x9（仙女龙平A）
         * 射速：2.5
         * 特殊：该主炮弹射9次，可来回弹
         */
        //one case
        actorType = ActorTypeUtil.getActorType("桑尼号");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let bounceMissileController = new BounceMissileController(attackController.unit);
                bounceMissileController.loopCount = 9;
                bounceMissileController.range = 600;
                bounceMissileController.damageStateFormula = attackController.damageStateFormula;
                bounceMissileController.hitUnitList.push(projectile.target);
                bounceMissileController.launch();
            }
        }
        /**
         * 射程：600
         * 伤害：攻击力x9（仙女龙平A）
         * 射速：2.5
         * 特殊：该主炮弹射9次，可来回弹
         */
        //one case
        actorType = ActorTypeUtil.getActorType("阳光桑尼号");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let bounceMissileController = new BounceMissileController(attackController.unit);
                bounceMissileController.loopCount = 9;
                bounceMissileController.range = 600;
                bounceMissileController.damageStateFormula = attackController.damageStateFormula;
                bounceMissileController.hitUnitList.push(projectile.target);
                bounceMissileController.launch();
            }
        }
        /**
         * 射程：300
         * 伤害：攻击力x10
         * 射速：2
         * 特殊：该主炮对目标范围600的所有单位造成100%的溅射伤害
         */
        //one case
        actorType = ActorTypeUtil.getActorType("歼星号");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                SelectUtil.forEnemyUnitsInRange(actor.unit, 600, enemyUnit => {
                    if (enemyUnit == projectile.target) {
                        return
                    }
                    let flsh = projectile.damage;
                    DamageRecordUtil.damage(actor.getName(), projectile.source, enemyUnit, flsh)
                }, GetUnitX(projectile.target), GetUnitY(projectile.target))
            }
        }

        /**
         * 射程：300
         * 伤害：0
         * 射速：2
         * 特殊：对目标单位投射一团可致死的瘟疫，持续5秒，每秒对400范围造成力量x2的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("瘟疫号");
        actorType.onUnitChange = (actor, unit) => {
            if (魔改道具.主炮是否拥有魔改道具(actor)) {
                //瘟疫号每秒回血10%
                actor.attribute = {reply_life_by_p_on_pers: 0.1}
            }
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let x = GetUnitX(projectile.target);
                let y = GetUnitY(projectile.target);
                BaseUtil.runLater(1, () => {
                    let damage = UnitStateUtil.calculateStateFormula({str: 2}, actor.unit);
                    DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 400), damage, DamageType.s_物理, x, y)
                    EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                        x, y, actor.get("modelScale", 0.8))
                }, 5, true)
            }
        }
        /**
         * 射程：200
         * 伤害：攻击力x2
         * 射速：2
         * 特殊：对350范围造成伤害并眩晕0.5秒。
         */
        //地震buff
        ActorTypeUtil.registerActorType({
            id: "海皇波塞冬_主炮_buff",
            name: "海皇波塞冬主炮",
            icon: "ReplaceableTextures\\CommandButtons\\BTNCorpseExplode.blp",
            describe: "眩晕",
            dur: 0.5,
            attribute: {move_speed: -600}
        })
        //one case
        actorType = ActorTypeUtil.getActorType("海皇波塞冬");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let x = GetUnitX(projectile.target);
                let y = GetUnitY(projectile.target);
                let damage = UnitStateUtil.calculateStateFormula({str: 2}, actor.unit);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 350), damage, DamageType.s_物理, x, y)
                EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                    x, y, actor.get("modelScale", 0.8))
                SelectUtil.forEnemyUnitsInRange(actor.unit, 350, u => {
                    ActorBuffUtil.addActorBuff(u, "海皇波塞冬_主炮_buff")
                }, x, y);
            }
        }


    }


}