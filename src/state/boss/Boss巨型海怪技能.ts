import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import RandomUtil from "@/RandomUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import TextTagUtil from "@/TextTagUtil";
import BaseUtil from "@/BaseUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import EffectUtil from "@/EffectUtil";
import SelectUtil from "@/SelectUtil";
import JumpUtil from "@/JumpUtil";
import MathUtil from "@/MathUtil";

export default class Boss巨型海怪技能 {


    constructor() {


        /**
         * 第三波BOSS，
         * 主炮：
         * 射程：2000
         * 伤害：攻击力x1
         * 射速：5
         * 特殊：投石，对目标造成3秒眩晕。
         * 技能1：攻击25%概率击晕目标1秒。
         * 技能2：技能外壳，受到的技能伤害-50%，并且每2秒清除一次DEBUFF。
         * 技能3：潮汐大，当血量低于50%开始释放，预警2秒，对1200范围放个潮汐大，击飞+眩晕2秒，攻击力x3的伤害。（冷却15秒）
         * 技能4：潜水，每秒回血1%，会锁定一个玩家进行追踪，没追到就持续时间到了就结束，追到了的话立刻结束并且减少目标500护甲，眩晕1秒。
         * 技能5：大漩涡，生命值低于10%时候召唤一个大漩涡，在大漩涡附近无法使用T，且会不断被500移速的速度牵引至BOSS身边。
         */
        //

        ActorTypeUtil.registerActorType({
            id: "巨型海怪潜水减甲",
            name: "减甲",
            attribute: {
                def: -500,
            },
            dur: 5,
            onCreated: (actor) => {
                UnitStateUtil.setInvulnerable(actor.unit, true);
            },
            onDestroy: (actor) => {
                UnitStateUtil.setInvulnerable(actor.unit, false);
            }
        })


        let actorType = ActorTypeUtil.getActorType("巨型海怪");
        //技能1：攻击25%概率击晕目标1秒。
        actorType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            if (gv.bossAbilityLimit >= 1) {
                if (RandomUtil.isInChance(0.25)) {
                    UnitStateUtil.stunUnit(enemy, 1)
                }
            }
        }
        //技能2：技能外壳，受到的技能伤害-50%，并且每2秒清除一次DEBUFF。
        actorType.interval = 2;
        actorType.onUnitInterval = (actor) => {
            if (gv.bossAbilityLimit >= 2) {
                ActorBuffUtil.clearUnitActorBuffs(actor.unit, true)
            }

        }
        actorType.onUnitDamaged = (actor, enemy, event) => {
            //技能2
            if (gv.bossAbilityLimit >= 2) {
                event.resultDamage *= 0.5;
            }
            //技能3：潮汐大，当血量低于50%开始释放，预警2秒，对1200范围放个潮汐大，击飞+眩晕2秒，攻击力x3的伤害。（冷却15秒）
            if (gv.bossAbilityLimit >= 3 && UnitStateUtil.getUnitLifeP(actor.unit) < 0.5) {
                actor.ifReady(15, () => {
                    BaseUtil.onTimer(1, (count) => {
                        if (count >= 3) {
                            let damage = UnitStateUtil.calculateStateFormula({attack: 3}, actor.unit);
                            let x = actor.unitX
                            let y = actor.unitY
                            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 1200, damage, DamageType.s_物理, x, y)
                            EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\devilslam.mdx",
                                x, y, 2.5)
                            SelectUtil.forEnemyUnitsInRange(actor.unit, 1200, unit => {
                                let enemyX = GetUnitX(enemy);
                                let enemyY = GetUnitY(enemy);
                                let pv = MathUtil.polarProjection(enemyX, enemyY, 200, MathUtil.angleBetweenCoords(x, y, enemyX, enemyY));
                                JumpUtil.jump(enemy, pv.x, pv.y, 300)
                            });
                            return false
                        }
                        TextTagUtil.textWarn("潮汐" + (3 - count), actor.unit)
                        return true;
                    })
                }, "潮汐大");
                //技能4：潜水，每秒回血1%，会锁定一个玩家进行追踪，没追到就持续时间到了就结束，追到了的话立刻结束并且减少目标500护甲，眩晕1秒。
                actor.ifReady(30, () => {
                    TextTagUtil.textWarn("潜水", actor.unit)
                    let oldFlyHeight = actor.get("flyHeight", 0)
                    actor.set("flyHeight", oldFlyHeight - 200)
                    let target = enemy
                    BaseUtil.onTimer(1, (count) => {
                        if (count > 5) {
                            actor.set("flyHeight", oldFlyHeight)
                            return false;
                        }
                        let x = GetUnitX(target);
                        let y = GetUnitY(target)
                        if (MathUtil.distanceBetweenPoints(x, y, actor.unitX, actor.unitY) < 128) {
                            TextTagUtil.textWarn("追踪到你了", actor.unit)
                            UnitStateUtil.stunUnit(target, 1)
                            ActorBuffUtil.addActorBuff(target, "巨型海怪潜水减甲")
                            actor.set("flyHeight", oldFlyHeight)
                            return false;
                        }
                        UnitStateUtil.orderMove(actor.unit, GetUnitX(target), GetUnitY(target))
                        return true;
                    });
                }, "潜水");
            }


            //技能5：大漩涡，生命值低于10%时候召唤一个大漩涡，在大漩涡附近无法使用T，且会不断被500移速的速度牵引至BOSS身边。
            if (gv.bossAbilityLimit >= 5 && UnitStateUtil.getUnitLifeP(actor.unit) < 0.1) {
                // if (true) {
                actor.ifReady(100, () => {
                    let x = GetUnitX(actor.unit);
                    let y = GetUnitY(actor.unit)

                    EffectUtil.addSpecialEffectAndDestroy("model\\特效\\水漩涡.mdx",
                        x, y, 1.2, 3);
                    SelectUtil.forEnemyUnitsInRange(actor.unit, 1200, u => {
                        UnitStateUtil.stunUnit(u, 3)
                    })
                    BaseUtil.runLater(0.05, () => {
                        SelectUtil.forEnemyUnitsInRange(actor.unit, 1200, u => {
                            let tempX = GetUnitX(u);
                            let tempY = GetUnitY(u);
                            let jd = MathUtil.angleBetweenCoords(tempX, tempY, x, y);
                            let nv = MathUtil.polarProjection(tempX, tempY, 20, jd);
                            SetUnitPosition(u, nv.x, nv.y)
                        })
                    }, 60);


                    TextTagUtil.textWarn("大漩涡", actor.unit)
                }, "大漩涡");
            }
        }


    }


}