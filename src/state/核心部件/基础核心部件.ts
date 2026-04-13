import ActorTypeUtil from "@/ActorTypeUtil";
import PlayerUtil from "@/PlayerUtil";
import Actor from "@/Actor";
import ActorFrameUtil from "@/ActorFrameUtil";
import RandomUtil from "@/RandomUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import SingletonUtil from "@/SingletonUtil";
import HeroUtil from "@/HeroUtil";
import TextTagUtil from "@/TextTagUtil";
import VestAbilityUtil from "@/VestAbilityUtil";
import 主炮基础事件 from "../主炮/主炮基础事件";
import ActorBuffUtil from "@/ActorBuffUtil";
import UnitStateUtil from "@/UnitStateUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";
import TextUtil from "@/TextUtil";
import MathUtil from "@/MathUtil";
import BaseUtil from "@/BaseUtil";

export default class 基础核心部件 {

    constructor() {


        ActorTypeUtil.forAllActorTypes((actorType, index) => {
            // actorType.onAction = (actor) => {
            //     if (PlayerUtil.costEnoughState(actor.unitOwner, 20000)) {
            //         if (actor.attribute) {
            //             actor.attribute.full_property = (actor.attribute.full_property || 0) + 500
            //         }
            //     } else {
            //         MouseFrameUtil.showTipText("【施工中的效果】暂时需要2万金币+500全属性")
            //     }
            // }
            // actorType.onCreated = (actor)=>{
            //     actor.level = 0;
            // }
            actorType.onAction = (actor) => {
                基础核心部件.基础强化核心部件(actor)
            }
            // if (isDebug) {
            //     ActorItemUtil.createActorItem(actorType.id, l_起始点[1].x + (index * 128), l_起始点[1].y)
            // }


        }, "核心部件")
        /**
         * 伤害加成+30%（+5%）
         * 力量加成+20%
         * 主炮：
         * 射程：800
         * 伤害：攻击力x5
         * 射速：0.8
         * 强化+10：
         * 力量加成+30%
         * 强化+15：
         * 重炮伤害翻倍。
         */
        let actorType: AppActorItemType = null;
        //one case
        actorType = ActorTypeUtil.getActorType("极限重炮");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.damage_increased = actor.level * 0.05 + 0.3
            //10级效果
            actor.attribute.strength_p = actor.level >= 10 ? 0.5 : 0.2
            //15级效果
            let ctrl: AutoMissileAttackController = actor.autoMissileAttackController
            if (ctrl) {
                ctrl.damageStateFormula.increased = actor.level >= 15 ? 2 : 1
            }
            // actor.setDescribe(actor.actorType.describe + "|n|cffcccccc当前伤害加成" + TextUtil.toPercentage(actor.attribute.damage_increased))
        }
        //one case
        /*
        绝杀	核心部件	FALSE	${id}	"攻击加成+30%（+5%）
敏捷加成+20%
主炮：
射程：800
伤害：攻击力x1
射速：0.1
强化+10：
当前敏捷+15%，仅生效一次。
强化+15：
绝杀主炮有5%的概率造成10倍伤害。"

         */
        actorType = ActorTypeUtil.getActorType("绝杀");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.attack_p = actor.level * 0.05 + 0.3
            //10级效果
            if (actor.level == 10) {
                SingletonUtil.executeOnce("绝杀:" + GetHandleId(actor.unit), () => {
                    PlayerUtil.message("绝杀：当前敏捷+15%，仅生效一次。", 5, actor.unitOwner)
                    HeroUtil.addHeroPropertyP(actor.unit, false, 0, 0.15, 0)
                });
            }
            //15级效果
            let ctrl: AutoMissileAttackController = actor.autoMissileAttackController
            if (ctrl) {
                if (actor.level >= 15) {
                    ctrl.onHitTarget = projectile => {
                        if (RandomUtil.isInChance(0.05)) {
                            projectile.damage *= 10;
                            TextTagUtil.textWarn("绝杀*10", projectile.target)
                        }

                    }
                } else {
                    ctrl.onHitTarget = null;
                }
            }
        }
        //one case
        /*
巫术炮弹	核心部件	FALSE	${id}	"技能伤害+30%（+5%）
智力加成+20%
主炮：
射程：600
伤害：攻击力x20
射速：5
特殊：该主炮可攻击目标范围内550的所有敌人。
强化+10：
该炮弹造成伤害时有25%的概率变羊1秒。
强化+15：
该主炮射速翻倍。"
         */
        actorType = ActorTypeUtil.getActorType("巫术炮弹");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.magic_damage_increased = actor.level * 0.05 + 0.3
            let ctrl: AutoMissileAttackController = actor.autoMissileAttackController
            if (ctrl) {
                //10级效果
                if (actor.level >= 10) {
                    ctrl.onHitTarget = projectile => {
                        if (RandomUtil.isInChance(0.25)) {
                            VestAbilityUtil.polymorph(projectile.target, 1)
                        }
                    }
                } else {
                    ctrl.onHitTarget = null;
                }
                //15级效果
                ctrl.coolDown = actor.level >= 15 ? 2.5 : 5
            }
        }
        //one case
        /*
洲际导弹	核心部件	FALSE	${id}	"力量+2000（+500）
敏捷+2000（+500）
智力+2000（+500）
强化+10：
无
强化+15：
所有主炮射程翻倍"

         */
        actorType = ActorTypeUtil.getActorType("洲际导弹");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.full_property = actor.level * 1000 + 2000
            if (actor.level >= 15) {
                actor.attribute.autoMissileAttackRange_p = 1;
            } else {
                actor.attribute.autoMissileAttackRange_p = 0;
            }
        }
        //one case
        /*
毒火炮	核心部件	FALSE	${id}	"伤害加成+30%（+5%）
主炮：
射程：700
伤害：攻击力x0.1
射速：0.5
特殊：毒火炮可攻击5个目标，该主炮造成伤害有10%概率使敌人进入毒火状态，受到任意伤害增加50%（+5%）的伤害，持续3秒。
强化+10：
毒火概率+5%
强化+15：
毒火持续时间+3秒。"
         */
        ActorTypeUtil.registerActorType({
            id: "毒火炮毒火状态",
            icon: "ReplaceableTextures\\CommandButtons\\BTNUnholyFrenzy.blp",
            attribute: {
                damage_reduction: -0.5,
            },
            model: "Abilities\\Spells\\Undead\\UnholyFrenzy\\UnholyFrenzyTarget.mdx",
            dur: 3

        })
        actorType = ActorTypeUtil.getActorType("毒火炮");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.damage_increased = actor.level * 0.05 + 0.3
        }
        actorType.onUnitChange = (actor, unit) => {
            let controller = 主炮基础事件.onUnitChange(actor, unit);
            if (controller == null) {
                return
            }
            controller.onHitTarget = projectile => {
                let chance = actor.level >= 10 ? 0.15 : 0.1;
                if (RandomUtil.isInChance(chance)) {
                    let actorBuff = ActorBuffUtil.addActorBuff(projectile.target, "毒火炮");
                    actorBuff.attribute.damage_reduction = actor.level * -0.05 - 0.5;
                    actorBuff.setDur(actor.level >= 15 ? 6 : 3)
                }
            }
        }


        //one case
        /*
            不朽甲板	核心部件	FALSE	${id}	"力量+2000（+500）
            敏捷+2000（+500）
            智力+2000（+500）
            强化+10：
            受到超过生命值25%的伤害时无敌0.5s
            强化+15：
            受到伤害不会超过生命值的30%"
         */
        actorType = ActorTypeUtil.getActorType("不朽甲板");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.full_property = actor.level * 1000 + 2000
        }
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (actor.level >= 10) {
                let maxLife = UnitStateUtil.getMaxLife(actor.unit);
                if (actor.level >= 15) {
                    event.resultDamage = Math.min(event.resultDamage, maxLife * 0.3)
                }
                if (event.resultDamage > (maxLife * 0.25)) {
                    actor.ifReady(5, () => {
                        UnitStateUtil.addInvulnerableIfNot(actor.unit, 0.5)
                    }, "无敌");
                }
            }
        }
        //one case
        /*
            光壁	核心部件	FALSE	${id}	"护甲加成+30%（+5%）
            强化+10：
            受到伤害减少30%
            强化+15：
            每秒对身边500范围的敌人造成10000+3%生命最大值的真实伤害。"

         */
        actorType = ActorTypeUtil.getActorType("光壁");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.def_p = actor.level * 0.05 + 0.3
            actor.attribute.damage_reduction = actor.level >= 10 ? 0.3 : 0;
        }
        actorType.interval = 3;
        actorType.onUnitInterval = (actor) => {
            let damage = UnitStateUtil.calculateStateFormula({base: 10000, hp: 0.03}, actor.unit);
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 500), damage, DamageType.s_物理)
            EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\devilslam.mdx", actor.unitX, actor.unitY,
                actor.get("modelScale", 0.8))
        }

        //one case
        /*
全面覆盖	核心部件	FALSE	${id}	"力量+2000（+500）
敏捷+2000（+500）
智力+2000（+500）
强化+10：
当前三围+10%，仅生效一次。
强化+15：
你三围最低的2个，会变得和最高的一样。"
         */
        actorType = ActorTypeUtil.getActorType("全面覆盖");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.full_property = actor.level * 1000 + 2000
            //10级效果
            if (actor.level == 10) {
                SingletonUtil.executeOnce("全面覆盖:" + GetHandleId(actor.unit), () => {
                    PlayerUtil.message("全面覆盖：当前三围+10%，仅生效一次。", 5, actor.unitOwner)
                    HeroUtil.addHeroPropertyP(actor.unit, false, 0.1)
                });
            }
            if (actor.level == 15) {
                let str = GetHeroStr(actor.unit, false);
                let agi = GetHeroAgi(actor.unit, false);
                let int = GetHeroInt(actor.unit, false);
                let max = Math.max(str, agi, int);
                SetHeroStr(actor.unit, max, true);
                SetHeroAgi(actor.unit, max, true);
                SetHeroInt(actor.unit, max, true);
                PlayerUtil.message("全面覆盖：三围最低的2个，会变得和最高的一样", 5, actor.unitOwner)
            }
        }
        //one case
        /*
            古老者甲板	核心部件	FALSE	${id}
            "力量+2000（+500）
            敏捷+2000（+500）
            智力+2000（+500）
            强化+10：
            每分钟获得1%全属性加成。
            强化+15：
            杀敌全属性+10"
         */
        actorType = ActorTypeUtil.getActorType("古老者甲板");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.full_property = actor.level * 1000 + 2000
        }
        actorType.interval = 60
        actorType.onUnitInterval = (actor) => {
            if (actor.level >= 10) {
                PlayerUtil.message("获得1%全属性加成!(绿字百分比)", 5, actor.unitOwner)
                actor.attribute.full_property_p = (actor.attribute.full_property_p || 0) + 0.01
                // actor.setDescribe(actor.actorType.describe + "|n|cffcccccc当前全属性加成:" + TextUtil.toPercentage(actor.attribute.full_property_p))
                actor.setExtDescribe("|cffcccccc当前全属性加成:", TextUtil.toPercentage(actor.attribute.full_property_p));
            }
        }
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (actor.level >= 15) {
                HeroUtil.addHeroProperty(actor.unit, 5)
            }
        }
        //one case
        /*
曲率推进装置	核心部件	FALSE	${id}	"航速+100（+20）
强化+10：
移动后会在路径上残留5秒的曲率波动，对触碰到的敌人每秒造成攻击力x3的伤害。
强化+15：
航速+100%"

         */
        actorType = ActorTypeUtil.getActorType("曲率推进装置");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.move_speed = actor.level * 20 + 100
            actor.attribute.move_speed_p = actor.level >= 15 ? 1 : 0;
        }
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            let x = actor.unitX;
            let y = actor.unitY;
            //移动后
            if (MathUtil.distanceBetweenPoints(x, y, actor.lastX || 0, actor.lastY || 0) > 16) {
                BaseUtil.runLater(1, () => {
                    DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, actor.get("area", 300),
                        {attack: 3}, DamageType.s_物理, x, y)
                    EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\devilslam.mdx", x, y,
                        actor.get("modelScale", 0.8))
                }, 5, true);
            }
            actor.lastX = x;
            actor.lastY = y;
        }
        //one case
        /*
未来装置	核心部件	FALSE	${id}	"航速-100(+5)
特殊：每次升级增加1%当前全属性。
强化+10：
经验加成+100%
强化+15：
杀敌经验值+1"
         */
        actorType = ActorTypeUtil.getActorType("未来装置");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.move_speed = actor.level * 5 - 100
            actor.attribute.经验倍率 = actor.level >= 10 ? 1 : 0
            actor.attribute.杀敌经验 = actor.level >= 15 ? 1 : 0
        }
        actorType.onUnitLevelChange = (actor) => {
            PlayerUtil.message("未来装置:升级增加1%当前全属性", 5, actor.unitOwner)
            HeroUtil.addHeroPropertyP(actor.unit, false, 0.01);
        }

        //one case
        /*
神避	核心部件	FALSE	${id}	"BOSS增伤+30%（+5%）
主炮：
射程：1000
伤害：攻击力x10
射速：0.5
特殊：该主炮只会对BOSS进行攻击。
强化+10：
BOSS伤害+50%
强化+15：
击杀BOSS增加当前15%攻击力。
"
         */
        actorType = ActorTypeUtil.getActorType("神避");
        actorType.onUnitDamageEnemy = (actor, enemy, event) => {
            if (HeroUtil.isHero(enemy)) {
                event.resultDamage *= (1 + actor.level * 5 + 0.3)
                if (actor.level > 10) {
                    event.resultDamage *= 1.5
                }
            }
        }
        actorType.onUnitChange = (actor, unit) => {
            let controller = 主炮基础事件.onUnitChange(actor, unit);
            if (controller == null) {
                return
            }
            controller.onBeforeLaunchMissile = (controller, target) => {
                return HeroUtil.isHero(target);
            }
        }
        actorType.onUnitKillEnemy = (actor, deathEnemy) => {
            if (HeroUtil.isHero(deathEnemy) && actor.level > 15) {
                PlayerUtil.message("神避:击杀BOSS增加当前15%攻击力。", 5, actor.unitOwner)
                UnitStateUtil.addDamageBase(actor.unit, UnitStateUtil.getDamageBase(actor.unit) * 0.15)
            }
        }

        //one case
        /*
荒火引擎	核心部件	FALSE	${id}	"力量+2000（+500）
敏捷+2000（+500）
智力+2000（+500）
特殊：无敌5秒，冷却15秒。
强化+10：
无敌期间移速+100%
强化+15：
无敌期间造成的伤害翻倍。"
         */
        actorType = ActorTypeUtil.getActorType("荒火引擎");
        actorType.onActorLevelChange = (actor, delta) => {
            actor.attribute.full_property = actor.level * 1000 + 2000
        }
        actorType.interval = 15
        actorType.onUnitInterval = (actor) => {
            if (GetUnitAbilityLevel(actor.unit, "Avul") > 0) {
                return false;
            }
            actor.attribute.move_speed = 100;
            //用这个设置 游戏底层也是添加移除 Avul技能
            SetUnitInvulnerable(actor.unit, true);
            //防止丢弃物品 后 取消不到无敌
            let unit = actor.unit;
            BaseUtil.runLater(5, () => {
                actor.attribute.move_speed = 0;
                SetUnitInvulnerable(unit, false);
            })
        }
        actorType.onUnitDamageEnemy = (actor, enemy, event) => {
            if (actor.level > 15 && UnitStateUtil.isInvulnerable(actor.unit)) {
                event.resultDamage *= 2
            }
        }
    }


    /**
     * 核心部件获取来源：到达10/15/20级给予1个木头。核心部件在海上奇珍商店用1个木头去随机获得。
     * （这个道具要难度大于4才开启而且要在商店告诉玩家N4在海上奇珍购买，海上奇珍显示，难度4可购买）
     *
     * 配套的道具是秒杀守护者新增物品掉落：改造设计图20% （对核心部件进行改造）
     * 天工图20%（对核心部件强化时100%成功），
     * 秒杀守护者新增效果，每次至多只会受到1%生命值的伤害，而且死亡后1分钟复活。
     *
     * 核心部件点击强化（反正最多也就3个）强化概率和情况在右边。    等级    概率    其他    消耗
     *    1    100        2000
     *    2    100        4000
     *    3    100        6000
     *    4    100        8000
     *    5    100        10000
     *    6    90        12000
     *    7    85        14000
     *    8    80        16000
     *    9    75        18000
     *    10    50        20000
     *    11    70    失败时50%概率掉1级    22000
     *    12    65    失败时50%概率掉1级    24000
     *    13    60    失败时50%概率掉1级，10%概率掉到+10    26000
     *    14    55    失败时50%概率掉1级，10%概率掉到+10    28000
     *    15    50    失败时50%概率掉1级，10%概率掉到+10    30000
     * @param actor
     */
    static 基础强化核心部件(actor: Actor): boolean {
        let oldLv = actor.level;
        if (oldLv && oldLv >= 15) {
            ActorFrameUtil.showFailText(actor, "已经是最高等级了!", 1, actor.unitOwner)
            return false;
        }
        let needGold = (oldLv) * 2000;
        if (PlayerUtil.costEnoughState(actor.unitOwner, needGold)) {
            if (oldLv > 5 && RandomUtil.isInChance((oldLv - 5) * 0.05)) {

                if (RandomUtil.isInChance(0.5)) {
                    if (oldLv >= 13) {
                        actor.level = 10
                        actor.numberOverlay = actor.level;
                        ActorFrameUtil.showTipText(actor, "|cffff0000强化失败！掉到10级", 1, actor.unitOwner)
                    } else if (oldLv >= 11) {
                        actor.level = 1
                        actor.numberOverlay = actor.level;
                        actor.extDescribe1 = null;
                        ActorFrameUtil.showTipText(actor, "|cffff0000强化失败！掉到1级", 1, actor.unitOwner)
                    } else {
                        ActorFrameUtil.showTipText(actor, "|cffff0000强化失败！未掉级!", 1, actor.unitOwner)
                    }
                } else {
                    ActorFrameUtil.showTipText(actor, "|cffff0000强化失败！", 1, actor.unitOwner)
                }
                return false;
            } else {
                actor.extDescribe1 = null;
            }
            actor.level = (oldLv || 0) + 1;
            actor.numberOverlay = actor.level;
            actor.extDescribeLast1 = "|cffccccccLv" + (actor.level) + "强化成功几率为" + TextUtil.toPercentage(1 - (actor.level - 5) * 0.05);
            ActorFrameUtil.showTipText(actor, "|cff00ff00强化成功!Lv" + actor.level, 1, actor.unitOwner)
            return true;
        } else {
            ActorFrameUtil.showTipText(actor, "|cffff0000金币不足！需要" + needGold, 1, actor.unitOwner)
            return false
        }


    }

}