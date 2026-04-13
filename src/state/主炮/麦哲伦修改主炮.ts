import ActorTypeUtil from "@/ActorTypeUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import ActorUtil from "@/ActorUtil";
import HeroUtil from "@/HeroUtil";
import 主炮基础事件 from "./主炮基础事件";
import SelectUtil from "@/SelectUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import RandomUtil from "@/RandomUtil";
import UnitStateUtil from "@/UnitStateUtil";
import EffectUtil from "@/EffectUtil";
import BaseUtil from "@/BaseUtil";
import MathUtil from "@/MathUtil";
import LeapUtil from "@/LeapUtil";
import 魔改道具 from "../商城/魔改道具";
import AttributeUtil from "@/AttributeUtil";

export default class 麦哲伦修改主炮 {


    constructor() {


        let actorType: AppActorType = null;
        /**
         * 射程：600
         * 伤害：攻击力x0.8
         * 射速：0.5
         * 特殊：该主炮可攻击2（3）个单位，附带敏捷x0.5（0.65）的伤害
         */
        actorType = ActorTypeUtil.getActorType("水手号");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let aController: AutoMissileAttackController = actor.autoMissileAttackController;

            if (aController) {
                let add = 魔改道具.主炮是否拥有魔改道具(actor) ? 1 : 0
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    aController.targetCount = 3 + add;
                    aController.damageStateFormula = {attack: 0.8, agi: 0.65};
                } else {
                    aController.targetCount = 2 + add;
                    aController.damageStateFormula = {attack: 0.8, agi: 0.5};
                }
            }
        }
        /**
         * 射程：600
         * 伤害：攻击力x1
         * 射速：0.5
         * 特殊：该主炮可攻击3（4）个单位，附带敏捷x0.65（0.9）的伤害。
         */
        actorType = ActorTypeUtil.getActorType("水手号·改");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let aController: AutoMissileAttackController = actor.autoMissileAttackController
            if (aController) {
                let add = 魔改道具.主炮是否拥有魔改道具(actor) ? 1 : 0
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    aController.targetCount = 4 + add;
                    aController.damageStateFormula = {attack: 1, agi: 0.9};
                } else {
                    aController.targetCount = 3 + add;
                    aController.damageStateFormula = {attack: 1, agi: 0.65};
                }
            }
        }
        /**
         * 射程：600
         * 伤害：攻击力x5
         * 射速：0.5
         * 特殊：任意杀敌全属性+2（5）
         */
        actorType = ActorTypeUtil.getActorType("死神号");
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            let add = ActorUtil.isUnitHasActor(actor.unit, "麦哲伦") ? 5 : 2;
            if (魔改道具.主炮是否拥有魔改道具(actor)) {
                add++;
            }
            HeroUtil.addHeroProperty(actor.unit, add)
        }

        /**
         * 射程：800
         * 伤害：智力x3
         * 射速：0.6
         * 特殊：对目标范围300（600）造成等额伤害，该伤害类型是魔法。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("毁灭号");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let radius = ActorUtil.isUnitHasActor(actor.unit, "麦哲伦") ? 600 : 300;
                if (魔改道具.主炮是否拥有魔改道具(actor)) {
                    radius += 200;
                }
                SelectUtil.forEnemyUnitsInRange(projectile.source, radius, enemyUnit => {
                    if (enemyUnit == projectile.target) {
                        return
                    }
                    let flsh = projectile.damage;
                    DamageRecordUtil.damage(actor.getName(), projectile.source, enemyUnit, flsh, DamageType.s_法术)
                }, projectile.x, projectile.y)
            }
        }
        /**
         * 射程：300
         * 伤害：攻击力x4
         * 射速：0.5
         * 特殊：力量+2000（5000），该主炮每次造成伤害，恢复20%生命值。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("嗜血号");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let add = 魔改道具.主炮是否拥有魔改道具(actor) ? 3000 : 0
            if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                actor.attribute = {strength: 5000 + add, blood_sucking: 0.2};
            } else {
                actor.attribute = {strength: 2000 + add, blood_sucking: 0.2};
            }
        }
        /**
         * 射程：300
         * 伤害：攻击力x3
         * 射速：0.3
         * 特殊：任意伤害有20%的概率造成200%（350%）的伤害。
         */
        //one case
        actorType = ActorTypeUtil.getActorType("蛮族号");
        actorType.onUnitDamageEnemy = (actor, enemy, event) => {
            let c = 魔改道具.主炮是否拥有魔改道具(actor) ? 0.35 : 0.2
            if (RandomUtil.isInChance(c)) {
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    event.resultDamage *= 3.5
                } else {
                    event.resultDamage *= 2
                }
            }
        }


        /**
         * 射程：500（900）
         * 伤害：攻击力x1
         * 射速：0.15
         * 特殊：该主炮攻击周围8个敌人
         */
        actorType = ActorTypeUtil.getActorType("武装直升机");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let aController: AutoMissileAttackController = actor.autoMissileAttackController
            if (aController) {
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    aController.extRange = 400;
                } else {
                    aController.extRange = 0;
                }
            }
        }

        /**
         * 射程：300
         * 伤害：攻击力x5
         * 射速：1
         * 特殊：该主炮攻击时对目标范围300造成力量x1.5（2.5）的伤害
         */
        //one case
        actorType = ActorTypeUtil.getActorType("顽石号");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let damage = UnitStateUtil.calculateStateFormula(actor.get("stateFormula", {
                    str: ActorUtil.isUnitHasActor(actor.unit, "麦哲伦") ? 2.5 : 1.5
                }), actor.unit);
                DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 300, damage)
                EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\地震.mdx",
                    GetUnitX(actor.unit), GetUnitY(actor.unit), actor.get("modelScale", 0.8))
            }
        }


        /**
         * 射程：1200
         * 伤害：攻击力x10
         * 射速：2
         * 特殊：该主炮会留下一个持续2秒的AOE伤害，每秒力量x1（3）
         */
        //one case
        actorType = ActorTypeUtil.getActorType("巡洋舰");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let x = GetUnitX(projectile.target);
                let y = GetUnitY(projectile.target);
                BaseUtil.runLater(1, () => {
                    let damage = UnitStateUtil.calculateStateFormula({
                        str: ActorUtil.isUnitHasActor(actor.unit, "麦哲伦") ? 3 : 1
                    }, actor.unit);
                    DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 400), damage, DamageType.s_物理, x, y)
                    EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "model\\基本技能\\地震.mdx"),
                        x, y, actor.get("modelScale", 0.3))
                }, 2, true)
            }
        }
        /**
         * 射程：300
         * 伤害：攻击力x4（10）
         * 射速：0.5
         * 特殊：任意伤害击杀单位恢复5%生命值
         */
        //one case
        actorType = ActorTypeUtil.getActorType("猩红之女");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let aController: AutoMissileAttackController = actor.autoMissileAttackController
            if (aController) {
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    aController.damageStateFormula = {attack: 10};
                } else {
                    aController.damageStateFormula = {attack: 4};
                }
            }
        }
        actorType.onUnitKillEnemy = actor => {
            UnitStateUtil.addLife(actor.unit, UnitStateUtil.getLife(actor.unit) * 0.05)
        }
        /**
         * 射程：600
         * 伤害：攻击力x0.1
         * 射速：0.5
         * 特殊：该主炮可攻击6个单位，附带全属性x0.2（0.5）的伤害
         */
        //one case
        actorType = ActorTypeUtil.getActorType("天使号");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let aController: AutoMissileAttackController = actor.autoMissileAttackController
            if (aController) {
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    aController.damageStateFormula = {attack: 0.1, fullPros: 0.5};
                } else {
                    aController.damageStateFormula = {attack: 0.1, fullPros: 0.2};
                }
            }
        }


        /**
         * 射程：800
         * 伤害：攻击力x3（5）
         * 射速：0.5
         * 特殊：该主炮会对目标一条线上造成AOE的物理伤害.
         */
        //one case
        actorType = ActorTypeUtil.getActorType("安妮女王复仇号");
        actorType.onUnitActorsChange = (actor, isRemove, changeActor) => {
            let aController: AutoMissileAttackController = actor.autoMissileAttackController
            if (aController) {
                if (ActorUtil.isUnitHasActor(actor.unit, "麦哲伦")) {
                    aController.damageStateFormula = {attack: 5};
                } else {
                    aController.damageStateFormula = {attack: 3};
                }
            }
        }
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onBeforeLaunchMissile = (c, target) => {
                //
                let angle = MathUtil.angleBetweenCoords(
                    GetUnitX(c.unit),
                    GetUnitY(c.unit),
                    GetUnitX(target),
                    GetUnitY(target),
                );
                let damage = UnitStateUtil.calculateStateFormula({attack: 3}, c.unit)
                //
                let range = c.range + c.extRange;
                let unitAttribute = AttributeUtil.getUnitAttribute(c.unit, false);
                if (unitAttribute) {
                    if (unitAttribute.autoMissileAttackRange) {
                        range += unitAttribute.autoMissileAttackRange;
                    }
                    if (unitAttribute.autoMissileAttackRange_p) {
                        range *= (1 + unitAttribute.autoMissileAttackRange_p);
                    }
                }
                range = math.min(range, c.rangeMaxLimit || AutoMissileAttackController.defaultRangeMaxLimit);
                //
                LeapUtil.leap(c.unit, angle, range + 100, 1, damage, DamageType.s_物理,
                    "Abilities\\Weapons\\KeeperGroveMissile\\KeeperGroveMissile.mdx")
                return false;
            }
        }


    }


}