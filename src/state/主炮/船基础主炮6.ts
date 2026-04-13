import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "./主炮基础事件";
import ActorAbilityUtil from "@/ActorAbilityUtil";
import RandomUtil from "@/RandomUtil";
import TextTagUtil from "@/TextTagUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";
import SelectUtil from "@/SelectUtil";
import MathUtil from "@/MathUtil";
import JumpUtil from "@/JumpUtil";
import UnitUtil from "@/UnitUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import ActorAbility from "@/ActorAbility";
import ActorUnitUtil from "@/ActorUnitUtil";
import BaseUtil from "@/BaseUtil";
import LeapUtil from "@/LeapUtil";
import PlayerUtil from "@/PlayerUtil";
import HeroUtil from "@/HeroUtil";
import TextUtil from "@/TextUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";

export default class 船基础主炮6 {

    constructor() {

        /**
         * 射程：600
         * 伤害：攻击力x0.8
         * 射速：0.8
         * 特殊：该主炮每次命中将减少吞吞号主动技能0.5秒冷却
         */
        let actorType = ActorTypeUtil.getActorType("吞吞号主炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController) {
                attackController.onHitTarget = (projectile) => {
                    if (!IsHandle(actor.unit)) {
                        return
                    }
                    let actorAbility = ActorAbilityUtil.getUnitActorAbility(actor.unit, "吞吞号基础技能");
                    if (actorAbility != null) {
                        actorAbility.setCooldown(actorAbility.getCooldown() - 0.5)
                    }

                }
            }
        }
        /**
         * 射程：700
         * 伤害：攻击力x1.5
         * 射速：1
         * 特殊：该主炮对目标范围350的单位同时造成伤害并击退250码
         */
        actorType = ActorTypeUtil.getActorType("步惊云号主炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController) {

                attackController.onHitTarget = (projectile) => {
                    // TextTagUtil.text("击退", projectile.target)
                    let damage = UnitStateUtil.calculateStateFormula({str: 6}, actor.unit);
                    let x = GetUnitX(projectile.target);
                    let y = GetUnitY(projectile.target);
                    DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 350, damage, DamageType.s_物理, x, y)
                    EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "圆形范围伤害特效\\devilslam.mdx"),
                        x, y, actor.get("modelScale", 0.5))
                    SelectUtil.forEnemyUnitsInRange(projectile.source, 350, enemy => {
                        let enemyX = GetUnitX(enemy);
                        let enemyY = GetUnitY(enemy);
                        let pv = MathUtil.polarProjection(enemyX, enemyY, 250, MathUtil.angleBetweenCoords(actor.unitX, actor.unitY, enemyX, enemyY));
                        JumpUtil.jump(enemy, pv.x, pv.y, 300);
                    }, x, y);
                }
            }
        }
        /**
         * 射程：700
         * 伤害：攻击力x1
         * 射速：0.3
         * 特殊：该主炮命中敌人有10%概率把敌人吓傻（眩晕60s，boss2秒）
         */
        actorType = ActorTypeUtil.getActorType("吓死个人号主炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController) {
                attackController.onHitTarget = (projectile) => {
                    if (!RandomUtil.isInChance(0.1)) {
                        return
                    }
                    TextTagUtil.text("吓傻", projectile.target)
                    if (UnitUtil.isHero(projectile.target)) {
                        UnitStateUtil.stunUnit(projectile.target, 2)
                    } else {
                        UnitStateUtil.stunUnit(projectile.target, 60)
                    }
                }
            }
        }

        /**
         * 射程：500
         * 伤害：攻击力x2
         * 射速：1
         * 特殊：杀敌金币+10，经验+1，当杀敌达到2000时，自动吞噬该主炮且不占据主炮位置
         */
        actorType = ActorTypeUtil.getActorType("以杀证道号主炮");
        actorType.attribute = {
            add_gold_on_kill: 10,
            杀敌经验: 1,
        }
        actorType.onCreated = (actor) => {
            if (actor instanceof ActorAbility) {
                actor.numberOverlay = 2000
            }
        }
        actorType.onUnitKillEnemy = (actor, unit) => {
            if (actor instanceof ActorAbility) {
                actor.numberOverlay--;
                if (actor.numberOverlay <= 0) {
                    let actorBuff = ActorBuffUtil.addActorBuff(actor.unit, actor.actorTypeId);
                    actorBuff.set("class", "吞噬");
                    actorBuff.set("kind", "吞天石吞噬");
                    actorBuff.set("tag", "进化继承");
                    //
                    TextTagUtil.text("吞噬该主炮", actor.unit)
                    //
                    actor.destroy();
                }
            }
        }
        //
        /**
         * "射程：200
         * 伤害：攻击力x1
         * 射速：1
         * 特殊：护甲+100，生命值+10000，对周围200的单位每秒造成生命值x50%的伤害"
         */
        actorType = ActorTypeUtil.getActorType("烧起来了号主炮");
        actorType.attribute = {
            def: 100,
            life: 10000,
        }
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 350, {hp: 0.5}, DamageType.s_物理)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "单位\\新加英雄2\\模型\\烧起来了号\\49b7acd46003852c.mdx"), actor.unitX, actor.unitY)
        }

        /**
         * 射程：2000
         * 伤害：攻击力x2
         * 射速：1
         * 特殊：击杀目标，将在目标点生成一根攻击力50%，每秒攻击1次的触手，触手拥有800射程且无敌，至多拥有12根触手。触手持续时间为10秒
         */
        actorType = ActorTypeUtil.getActorType("克苏鲁号主炮");
        actorType.attribute = {
            def: 100,
            life: 10000,
        }
        actorType.interval = 1;
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (actor.tempNum && actor.tempNum >= 12) {
                return
            }
            let actorUnit = ActorUnitUtil.createActorUnit(actor.unitOwner, "跟踪小触手单位", GetUnitX(deathEnemy), GetUnitY(deathEnemy));
            actorUnit.applyTimedLife(10);
            UnitStateUtil.setInvulnerable(actorUnit.unit, true);
            UnitStateUtil.setDamageRange(actorUnit.unit, 800);
            UnitStateUtil.setDamageCool(actorUnit.unit, 1);
            UnitStateUtil.setDamageBase(actorUnit.unit, UnitStateUtil.getDamageMax(actor.unit));
            actor.tempNum = (actor.tempNum || 0) + 1;
            BaseUtil.runLater(10, () => {
                actor.tempNum--;
            })
        }
        /**
         * 射程：1000
         * 伤害：攻击力x2.5
         * 射速：1
         * 特殊：该主炮只会从船尾释放一道震荡波
         */
        actorType = ActorTypeUtil.getActorType("无始大帝号主炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController) {
                attackController.onBeforeLaunchMissile = (controller, target) => {
                    let damage = UnitStateUtil.calculateStateFormula({attack: 2.5}, controller.unit);
                    LeapUtil.leap(controller.unit, GetUnitFacing(controller.unit) + 180, controller.getRealRange(), 0.4, damage,
                        DamageType.s_物理, actor.get("model", "Abilities\\Spells\\Orc\\Shockwave\\ShockwaveMissile.mdl"));
                    return false;
                }
            }
        }
        /**
         * 射程：600
         * 伤害：攻击力x2
         * 射速：1.2
         * 特殊：立刻获得全场属性最高的玩家35%的额外属性，也可以是自己
         */
        actorType = ActorTypeUtil.getActorType("大佬体验号主炮");
        actorType.onCreated = (actor) => {
            let maxSX = 0;
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                let fullProperty = HeroUtil.getFullProperty(hero);
                maxSX = Math.max(maxSX, fullProperty);
            });
            maxSX = Math.floor(maxSX * 0.33 * 0.35);
            TextTagUtil.text("大佬体验获得属性:" + TextUtil.toCnUnit(maxSX), actor.unit);
            HeroUtil.addHeroProperty(actor.unit, maxSX);
        }
        /**
         * 射程：550
         * 伤害：攻击力x2
         * 射速：0.8
         * 特殊：减少850范围内敌人60%攻速和移速
         */
        ActorTypeUtil.registerActorType({
            id: "极寒号主炮减速",
            icon: "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
            describe: "减少850范围内敌人60%攻速和移速",
            attribute: {
                move_speed_p: -0.6,
                attack_p: -0.6,
                damage_reduction: -0.5,
            },
            dur: 3,
        })
        actorType = ActorTypeUtil.getActorType("极寒号主炮");
        actorType.interval = 2
        actorType.onUnitInterval = (actor) => {
            SelectUtil.forEnemyUnitsInRange(actor.unit, 850, u => {
                ActorBuffUtil.addActorBuff(u, "极寒号主炮减速")
            });
        }
        //射程：1200
        // 伤害：攻击力x5
        // 射速：3
        // 特殊：每隔三秒，将1200范围内的敌人拉至身边并眩晕1.5秒 释放该技能时获得1秒无敌
        actorType = ActorTypeUtil.getActorType("一袋米扛几楼号主炮");
        actorType.interval = 3
        actorType.onUnitInterval = (actor) => {
            UnitStateUtil.addInvulnerableIfNot(actor.unit, 1);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 1200, {attack: 5}, DamageType.s_物理)
            EffectUtil.addSpecialEffectAndDestroy(actor.get("model", "单位\\新加英雄3\\模型\\一袋米扛几楼号\\4ea69c4499dac105.mdx"), actor.unitX, actor.unitY)

            SelectUtil.forEnemyUnitsInRange(actor.unit, 1200, u => {
                SetUnitPosition(u, actor.unitX, actor.unitY);
                UnitStateUtil.stunUnit(u, 1.5);
            });
        }
        /**
         *
         * 射程：800
         * 伤害：攻击力x1
         * 射速：0.2
         * 特殊：被攻击过的单位，攻速移速+100%
         *
         */
        ActorTypeUtil.registerActorType({
            id: "搞事情",
            icon: "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
            describe: "攻速移速+100%",
            attribute: {
                move_speed_p: 1,
                attack_p: 1,
            },
            dur: 60,
        })
        actorType = ActorTypeUtil.getActorType("搞事情号主炮");
        actorType.onUnitDamageEnemy = (actor, enemy, event) => {
            ActorBuffUtil.addActorBuff(enemy, "搞事情")
        }
        /**
         * 射程：800
         * 伤害：攻击力x0.1
         * 射速：1
         * 特殊：可攻击5个单位，每移动500码，该主炮伤害+25%，至多增加至500%，停止移动超过2秒后消失！
         */
        actorType = ActorTypeUtil.getActorType("不要停下来号主炮");
        actorType.onCreated = (actor) => {
            actor.tempNum = 0;
        }
        actorType.interval = 2;
        actorType.onUnitInterval = (actor) => {
            let x = actor.unitX;
            let y = actor.unitY;
            //移动后
            let jl = MathUtil.distanceBetweenPoints(x, y, actor.lastX || x, actor.lastY || y);
            if (jl < 10) {
                actor.tempNum = 0;
            }
            if (actor.tempNum < 10000) {
                //进阶
                actor.tempNum = actor.tempNum + Math.floor(jl)
            }
            //计算增伤
            let zs = Math.min(actor.tempNum / 500 * 0.25, 5);
            if (actor.autoMissileAttackController) {
                (actor.autoMissileAttackController as AutoMissileAttackController).damageStateFormula.increased = zs;
                actor.getRootFrameControl().setNumberOverlayText(TextUtil.toPercentage(zs))
            }
            actor.lastX = x;
            actor.lastY = y;
        }
    }

}