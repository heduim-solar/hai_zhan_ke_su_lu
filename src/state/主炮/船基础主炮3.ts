import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "./主炮基础事件";
import ActorBuffUtil from "@/ActorBuffUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import SelectUtil from "@/SelectUtil";
import UnitStateUtil from "@/UnitStateUtil";
import MathUtil from "@/MathUtil";
import ActorItemUtil from "@/ActorItemUtil";
import EffectUtil from "@/EffectUtil";
import BaseUtil from "@/BaseUtil";
import TextTagUtil from "@/TextTagUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import ActorUtil from "@/ActorUtil";
import 魔改道具 from "../商城/魔改道具";

export default class 船基础主炮3 {


    //new add 3
    constructor() {
        let actorType: AppActorType = null;

        /**
         * 射程：500（800）
         * 伤害：智力x2
         * 射速：1.5
         * 特殊：该主炮造成魔法伤害，且攻击范围内所有敌人，该主炮在雷雨天气伤害翻三倍
         */
        //one case
        actorType = ActorTypeUtil.getActorType("雷雨号主炮");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let aController: AutoMissileAttackController = actor.autoMissileAttackController
            if (aController) {
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    aController.range = 800;
                } else {
                    aController.range = 500;
                }
            }
        }
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                if (ActorBuffUtil.isUnitHasActorBuff(projectile.source, "雷雨天气")) {
                    projectile.damage *= 3;
                }
            }
        }
        /**
         * 射程：600
         * 伤害：攻击力x1
         * 射速：0.1
         * 特殊：该主炮攻击附带300范围的溅射和50%减速。
         */
        ActorTypeUtil.registerActorType({
            id: "狂风呼啸号主炮减速",
            attribute: {
                move_speed_p: -1
            },
            dur: 3
        })
        actorType = ActorTypeUtil.getActorType("狂风呼啸号主炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), projectile.source, 300, projectile.damage, DamageType.s_物理, projectile.x, projectile.y)
                projectile.damage = 0;
                SelectUtil.forEnemyUnitsInRange(projectile.source, 300, u => {
                    ActorBuffUtil.addActorBuff(u, "狂风呼啸号主炮减速")
                }, projectile.x, projectile.y)
            }
        }


        /**
         * 射程：700
         * 伤害：攻击力x5
         * 射速：3
         * 特殊：该主炮对范围600的所有敌人造成伤害，距离每缩短100，造成的伤害+50%
         */
        actorType = ActorTypeUtil.getActorType("刀扇号主炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.damageStateFormula = null;
            attackController.onHitTarget = projectile => {
                let baseDamage = UnitStateUtil.calculateStateFormula({attack: 5}, projectile.source);
                SelectUtil.forEnemyUnitsInRange(projectile.source, 600, u => {
                    let distance = MathUtil.distanceBetweenPoints(projectile.x, projectile.y, GetUnitX(u), GetUnitY(u));
                    let damage = baseDamage + ((600 - distance) / 100 * 0.5 * baseDamage)
                    DamageRecordUtil.damage(actor.getName(), projectile.source, u, damage)
                }, projectile.x, projectile.y)
            }
        }
        /**
         * 射程：700
         * 伤害：攻击力x5
         * 射速：0.5
         * 特殊：任意杀敌+15（25）攻击力
         */
        actorType = ActorTypeUtil.getActorType("最强攻击号主炮");
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (ActorItemUtil.isUnitHasActorItem(actor.unit, "麦哲伦")) {
                UnitStateUtil.addDamageBase(actor.unit, 10)
            } else {
                UnitStateUtil.addDamageBase(actor.unit, 5)
            }
        }

        /**
         * 射程：450
         * 伤害：攻击力x3
         * 射速：1.2
         * 特殊：该主炮1秒后会在攻击目标点落下一块300范围的巨石，对范围造成同样伤害。
         */
        actorType = ActorTypeUtil.getActorType("科多号主炮");
        actorType.onUnitChange = (actor, unit) => {
            let autoMissileAttackController = 主炮基础事件.onUnitChange(actor, unit);
            if (autoMissileAttackController == null) {
                return;
            }
            autoMissileAttackController.onHitTarget = (projectile) => {
                let x = projectile.x;
                let y = projectile.y;
                EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\巡洋舰巨石掉落.mdx",
                    x, y, 0.6, 1)
                BaseUtil.runLater(1, () => {
                    DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 300, projectile.damage, DamageType.s_物理, x, y)
                })
            }


        }
        /**
         * 射程：550
         * 伤害：攻击力x20（40）
         * 射速：4
         * 特殊：该主炮对800范围内的敌人造成50%的溅射
         */
        ActorTypeUtil.registerActorType({
            id: "冰霜巨龙魔改道具",
            icon: "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
            describe: "冰霜巨龙减少周围移速30%",
            attribute: {
                move_speed_p: -0.3,
            },
            dur: 3,
        })
        actorType = ActorTypeUtil.getActorType("冰霜巨龙主炮");
        actorType.onUnitChange = (actor, unit) => {
            let autoMissileAttackController = 主炮基础事件.onUnitChange(actor, unit);
            if (autoMissileAttackController == null) {
                return;
            }
            autoMissileAttackController.onLaunchMissile = (controller, projectile) => {
                if (ActorItemUtil.isUnitHasActorItem(actor.unit, "麦哲伦")) {
                    projectile.damage *= 2;
                }
            }
            autoMissileAttackController.onHitTarget = (projectile) => {
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), projectile.source, 800, projectile.damage * 0.5)
                EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\devilslam.mdx",
                    GetUnitX(projectile.target), GetUnitY(projectile.target), 1.2)
            }
        }
        actorType.interval = 2
        actorType.onUnitInterval = (actor) => {
            if (魔改道具.主炮是否拥有魔改道具(actor)) {
                SelectUtil.forEnemyUnitsInRange(actor.unit, 600, u => {
                    ActorBuffUtil.addActorBuff(u, "冰霜巨龙魔改道具")
                });
            }
        }

        /**
         * 射程：750
         * 伤害：攻击力x10
         * 射速：2
         * 特殊：该主炮命中目标后，眩晕目标1秒，对800范围内的敌人造成75%的溅射。
         */
        actorType = ActorTypeUtil.getActorType("黑龙主炮");
        actorType.onUnitChange = (actor, unit) => {
            let autoMissileAttackController = 主炮基础事件.onUnitChange(actor, unit);
            if (autoMissileAttackController == null) {
                return;
            }
            autoMissileAttackController.onHitTarget = (projectile) => {
                UnitStateUtil.stunUnit(projectile.target, 1)
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), projectile.source, 800, projectile.damage * 0.5)
                EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\devilslam.mdx",
                    GetUnitX(projectile.target), GetUnitY(projectile.target), 1.2)
            }
        }
        /**
         * 射程：1000
         * 伤害：攻击力x10
         * 射速：0.3
         * 特殊：该主炮攻击8个单位。
         * 全属性+10000，被排斥，无法携带胶胶果实、鲁灰、尼卡·鲁灰，死亡无法复活
         */
        actorType = ActorTypeUtil.getActorType("神之号主炮");
        actorType.onUnitPickupItem = (actor, item) => {
            let actorItemTypeId = ActorItemUtil.getActorItemTypeId(item);
            if (actorItemTypeId == "鲁灰" || actorItemTypeId == "尼卡·鲁灰" || actorItemTypeId == "胶胶果实" || GetItemName(item) == "胶胶果实") {
                BaseUtil.runLater(0.05, () => {
                    UnitDropItemPoint(actor.unit, item, actor.unitX, actor.unitY)
                    TextTagUtil.textWarn("神之号主炮 无法携带胶胶果实、鲁灰、尼卡·鲁灰，死亡无法复活!", actor.unit)
                })
            }
        }

        /**
         * 射程：200
         * 伤害：攻击力x1（剑刃风暴）
         * 射速：1
         * 特殊：每秒对550范围造成伤害。
         */
        actorType = ActorTypeUtil.getActorType("剑圣主炮");
        actorType.interval = 1;
        // actorType.onUnitChange = null;
        actorType.onDestroy = null;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({attack: 1}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 550, damage)
            EffectUtil.addSpecialEffectAndDestroy("model\\主炮投射物\\刀扇光.mdx",
                actor.unitX, actor.unitY, 1.8)
        }


    }

}