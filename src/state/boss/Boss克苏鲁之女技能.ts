import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import BaseUtil from "@/BaseUtil";
import TextTagUtil from "@/TextTagUtil";
import LeapUtil from "@/LeapUtil";
import DamageType from "@/DamageType";
import JumpUtil from "@/JumpUtil";
import EffectUtil from "@/EffectUtil";
import SelectUtil from "@/SelectUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import MathUtil from "@/MathUtil";

export default class Boss克苏鲁之女技能 {


    constructor() {


        /**
         * 最终BOSS-1~3，
         * 主炮：
         * 射程：2000
         * 伤害：攻击力x1
         * 射速：3
         * 特殊：攻击范围内所有敌人
         * 技能1：召唤深海眷族，立刻召唤12艘护卫舰在身边，（冷却30）
         * 技能2：龙卷风，预警2秒后，朝着身边8个方向释放龙卷风，造成攻击力x3的伤害并吹飞2秒。（冷却10）
         * 技能3：潮汐大，当血量低于50%开始释放，预警2秒，对1200范围放个潮汐大，击飞+眩晕2秒，攻击力x3的伤害。（冷却15秒）
         * 技能4：减速光环，600范围减速80%
         * 技能5：父爱，初始在身边围了一圈超级红色触手。
         * 生命值：500000
         * 护甲：50
         * 攻击力：20000（0.5秒一次，400射程）
         * 移速：0
         */
        ActorTypeUtil.registerActorType({
            id: "克希拉减速光环",
            name: "克希拉减速光环",
            icon: "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
            attribute: {
                move_speed_p: -0.8
            },
            dur: 3,
        })

        let actorType = ActorTypeUtil.getActorType("克苏鲁之女-克希拉");
        //
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            //技能1：召唤深海眷族，立刻召唤12艘护卫舰在身边，（冷却30）
            if (gv.bossAbilityLimit >= 1) {
                actor.ifReady(30, () => {
                    ActorUnitUtil.createActorUnit(actor.unitOwner, "克希拉护卫舰", actor.unitX, actor.unitY,
                        0, 12, actorUnit => {
                            actorUnit.applyTimedLife(20);
                        });
                }, "召唤护卫舰")
            }
            //技能2：龙卷风，预警2秒后，朝着身边8个方向释放龙卷风，造成攻击力x3的伤害并吹飞2秒。（冷却10）
            if (gv.bossAbilityLimit >= 2) {
                // if (true) {
                actor.ifReady(10, () => {
                    BaseUtil.runLater(1, c => {
                        if (c == 3) {
                            let damage = UnitStateUtil.calculateStateFormula({attack: 3}, actor.unit)
                            for (let i = 0; i < 8; i++) {
                                LeapUtil.leap(actor.unit, 60 * i, 1000, 2, damage, DamageType.s_法术, "model\\特效\\龙卷风.mdx",
                                    actor.unitX, actor.unitY, enemy => {
                                        JumpUtil.strikeFly(enemy, 2)
                                    })
                            }
                        }
                        TextTagUtil.textWarn("龙卷风" + (3 - c), actor.unit)
                    }, 3)
                }, "龙卷风")
            }
            //技能3：潮汐大，当血量低于50%开始释放，预警2秒，对1200范围放个潮汐大，击飞+眩晕2秒，攻击力x3的伤害。（冷却15秒）
            if (gv.bossAbilityLimit >= 3 && UnitStateUtil.getUnitLifeP(actor.unit) < 0.5) {
                // if (true) {
                actor.ifReady(15, () => {
                    BaseUtil.runLater(1, c => {
                        if (c == 3) {
                            let x = GetUnitX(actor.unit);
                            let y = GetUnitY(actor.unit)
                            EffectUtil.addSpecialEffectAndDestroy("model\\特效\\水漩涡.mdx",
                                x, y, 1.2, 1);
                            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 1200, {
                                attack: 3
                            }, DamageType.s_法术)
                            SelectUtil.forEnemyUnitsInRange(actor.unit, 1200, u => {
                                JumpUtil.strikeFly(u, 2)
                            })
                        }
                        TextTagUtil.textWarn("潮汐" + (3 - c), actor.unit)
                    }, 3);
                }, "大潮汐");
            }
        }
        //技能4：减速光环，600范围减速80%
        if (gv.bossAbilityLimit >= 4) {
            actorType.interval = 2;
            actorType.onUnitInterval = (actor) => {
                SelectUtil.forEnemyUnitsInRange(actor.unit, 600, u => {
                    ActorBuffUtil.addActorBuff(u, "克希拉减速光环");
                });
            }
        }


        //技能5：父爱，初始在身边围了一圈超级红色触手。
        if (gv.bossAbilityLimit >= 5) {
        // if (true) {
            actorType.onCreated = (actor) => {
                for (let i = 0; i < 9; i++) {
                    //超级触手
                    let nv = MathUtil.polarProjection(actor.unitX, actor.unitY, 600, 40 * i)
                    ActorUnitUtil.createActorUnit(actor.unitOwner, "超级触手", nv.x, nv.y, 40 * i)
                }
            }
        }

    }


}