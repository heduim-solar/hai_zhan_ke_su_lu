import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import TextTagUtil from "@/TextTagUtil";
import BaseUtil from "@/BaseUtil";
import EffectUtil from "@/EffectUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import UnitRegenLifeUtil from "@/UnitRegenLifeUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import SelectUtil from "@/SelectUtil";
import Projectile from "@/Projectile";

export default class Boss无敌战舰号技能 {


    constructor() {

        /**
         * 第二波BOSS，
         * 主炮：
         * 射程：2000
         * 伤害：攻击力x10
         * 射速：3（弹道很慢）
         * 特殊：会对目标点400范围造成伤害，离中间越近伤害越高。
         * 技能1：召唤护卫舰，立刻召唤24艘护卫舰在身边，（冷却20）
         * 技能2：自爆，被摧毁时，倒计时5秒，对1000范围造成攻击力x50的伤害。
         * 技能3：自我修复，当血量低于20%时，无敌并且恢复30%的生命值，获得10秒的100%攻击力，移速加成。
         * 技能4：无敌，受到伤害时无敌5秒，冷却20秒。
         * 技能5：分散导弹，对800范围内的所有单位造成2000+攻击力x1的伤害。（冷却30）
         */
        let actorType = ActorTypeUtil.getActorType("无敌战舰号");
        //

        ActorTypeUtil.registerActorType({
            id: "无敌战舰号自我修复Buff",
            name: "自我修复",
            attribute: {
                attack_p: 1,
                move_speed: 200
            },
            dur: 10,
            onCreated: (actor) => {
                UnitStateUtil.setInvulnerable(actor.unit, true);
            },
            onDestroy: (actor) => {
                UnitStateUtil.setInvulnerable(actor.unit, false);
            }
        })
        actorType.onUnitDeath = (actor) => {
            if (gv.bossAbilityLimit >= 2) {
                //技能2：自爆，被摧毁时，倒计时5秒，对1000范围造成攻击力x50的伤害。
                let targetX = actor.unitX;
                let targetY = actor.unitY;
                let damage = UnitStateUtil.calculateStateFormula({
                    attack: 50
                }, actor.unit);
                BaseUtil.onTimer(1, (count) => {
                    if (count >= 5) {
                        EffectUtil.addSpecialEffectAndDestroy("圆形范围伤害特效\\eff_002.mdx", targetX, targetY, 2)
                        DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 1000, damage, DamageType.s_法术, targetX, targetY)
                        return false;
                    }
                    TextTagUtil.textWarn("自爆" + (5 - count), actor.unit)
                    return true;
                })


            }
        }
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (gv.bossAbilityLimit >= 1) {
                //技能1：召唤护卫舰，立刻召唤24艘护卫舰在身边，（冷却20）
                actor.ifReady(20, () => {
                    ActorUnitUtil.createActorUnit(actor.unitOwner, "无敌战舰号护卫舰", actor.unitX, actor.unitY,
                        0, 24, actorUnit => {
                            actorUnit.applyTimedLife(20);
                        });
                }, "召唤护卫舰")
            }
            //技能3：自我修复，当血量低于20%时，无敌并且恢复30%的生命值，获得10秒的100%攻击力，移速加成。"
            if (gv.bossAbilityLimit >= 3) {
                if (UnitStateUtil.getUnitLifeP(actor.unit) < 0.3) {
                    actor.ifReady(100, () => {
                        UnitRegenLifeUtil.regenUnitLife(actor.unit, UnitStateUtil.getMaxLife(actor.unit) * 0.3)
                        ActorBuffUtil.addActorBuff(actor.unit, "无敌战舰号自我修复Buff")
                        TextTagUtil.textWarn("自我修复", actor.unit)
                    }, "自我修复")
                }
            }
            //技能4：无敌，受到伤害时无敌5秒，冷却20秒。
            if (gv.bossAbilityLimit >= 4) {
                actor.ifReady(20, () => {
                    UnitRegenLifeUtil.regenUnitLife(actor.unit, UnitStateUtil.getMaxLife(actor.unit) * 0.3)
                    ActorBuffUtil.addActorBuff(actor.unit, "无敌战舰号自我修复Buff")
                    TextTagUtil.textWarn("自我修复", actor.unit)
                }, "无敌")
            }
            //技能5：分散导弹，对800范围内的所有单位造成2000+攻击力x1的伤害。（冷却30）
            if (gv.bossAbilityLimit >= 5) {
                actor.ifReady(30, () => {
                    SelectUtil.forEnemyUnitsInRange(actor.unit, 800, unit => {
                        let projectile = new Projectile(actor.unit, damageSource);
                        projectile.speed = 300
                        projectile.damage = UnitStateUtil.calculateStateFormula({
                            base: 2000,
                            attack: 1,
                        }, actor.unit);
                        projectile.start();

                    })
                    TextTagUtil.textWarn("分散导弹", actor.unit)
                }, "分散导弹")
            }
        }

    }


}