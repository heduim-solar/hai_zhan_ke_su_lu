import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import MathUtil from "@/MathUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import TextTagUtil from "@/TextTagUtil";
import RandomUtil from "@/RandomUtil";
import LeapUtil from "@/LeapUtil";
import BaseUtil from "@/BaseUtil";
import EffectUtil from "@/EffectUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import SelectUtil from "@/SelectUtil";
import JumpUtil from "@/JumpUtil";

export default class Boss克苏鲁技能 {


    constructor() {


        /**
         * 最终BOSS-4~6，
         * 主炮：
         * 射程：600
         * 伤害：攻击力x0.5
         * 射速：1
         * 特殊：减少目标10点护甲，可持续叠加。
         * 技能1：初始在身边围了一圈超级红色触手。
         * 生命值：500000
         * 护甲：50
         * 攻击力：20000（0.5秒一次，400射程）
         * 移速：0
         * 技能2：跟踪小触手，在目标身上附着12个小触手，小触手攻击1次就死亡，小触手每次攻击会对目标造成最大生命值3%的真实伤害。
         * 技能3：击飞，克苏鲁的普通攻击有10%概率把目标击飞到地图边角并眩晕5秒。
         * 技能4：潮汐大触手版，当血量低于50%开始释放，预警2秒，对1200范围放个触手深处，击飞+眩晕2秒，攻击力x3的伤害。（冷却15秒）
         * 技能5：大漩涡，生命值低于10%时候召唤一个大漩涡，在大漩涡附近无法使用T，且会不断被500移速的速度牵引至BOSS身边。
         */
        let actorUnitType = ActorTypeUtil.getActorType("跟踪小触手单位");
        actorUnitType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
            UnitStateUtil.addUnitLifeByMaxLifeP(enemy, -0.03)
        }


        let actorType = ActorTypeUtil.getActorType("拉莱耶之主-伟大的克苏鲁");
        //
        if (gv.bossAbilityLimit >= 1) {
            // if (true) {
            actorType.onCreated = (actor) => {
                for (let i = 0; i < 9; i++) {
                    //超级触手
                    let nv = MathUtil.polarProjection(actor.unitX, actor.unitY, 600, 40 * i)
                    ActorUnitUtil.createActorUnit(actor.unitOwner, "超级触手", nv.x, nv.y, 40 * i)
                }
            }
        }
        //

        // if (true) {
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            //技能2：跟踪小触手，在目标身上附着12个小触手，小触手攻击1次就死亡，小触手每次攻击会对目标造成最大生命值3%的真实伤害。
            if (gv.bossAbilityLimit >= 2) {
                actor.ifReady(30, () => {
                    ActorUnitUtil.createActorUnit(actor.unitOwner, "超级触手", GetUnitX(damageSource), GetUnitY(damageSource), 0, 12, (au) => {
                        UnitStateUtil.orderAttackTarget(au.unit, actor.unit)
                    });
                    TextTagUtil.textWarn("跟踪触手", actor.unit)
                });
            }
        }
        //技能3：击飞，克苏鲁的普通攻击有10%概率把目标击飞到地图边角并眩晕5秒。
        if (gv.bossAbilityLimit >= 3) {
            actorType.onUnitAttackDamageEnemy = (actor, enemy, event) => {
                if (RandomUtil.isInChance(0.1)) {
                    let angle = MathUtil.angleBetweenCoords(actor.unitX, actor.unitY, GetUnitX(enemy), GetUnitY(enemy))
                    LeapUtil.infiniteLeap(enemy, angle, 1000, true)
                    TextTagUtil.textWarn("击飞", actor.unit)
                }
            }
        }
        //技能4：潮汐大触手版，当血量低于50%开始释放，预警2秒，对1200范围放个触手深处，击飞+眩晕2秒，攻击力x3的伤害。（冷却15秒）
        if (gv.bossAbilityLimit >= 4) {
            // if (true) {
            actorType.onUnitDamaged = (actor, enemy, event) => {
                actor.ifReady(15, () => {
                    BaseUtil.runLater(1, c => {
                        if (c == 3) {
                            let x = GetUnitX(actor.unit);
                            let y = GetUnitY(actor.unit)
                            EffectUtil.addSpecialEffectAndDestroy("model\\进攻怪\\大触手.mdx",
                                x, y, 5, 1);
                            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 1200, {
                                attack: 3
                            }, DamageType.s_法术)
                            SelectUtil.forEnemyUnitsInRange(actor.unit, 1200, u => {
                                JumpUtil.strikeFly(u, 2)
                            })
                        }
                        TextTagUtil.textWarn("大触手" + (3 - c), actor.unit)
                    }, 3);
                }, "大触手");
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


}