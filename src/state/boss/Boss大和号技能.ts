import ActorTypeUtil from "@/ActorTypeUtil";
import Projectile from "@/Projectile";
import UnitStateUtil from "@/UnitStateUtil";
import SelectUtil from "@/SelectUtil";
import TextTagUtil from "@/TextTagUtil";
import UnitRegenLifeUtil from "@/UnitRegenLifeUtil";
import ActorBuffUtil from "@/ActorBuffUtil";

declare global {
    interface AppGlobalVariable extends SolarGlobalVariable {
        //1=解锁1技能  5=解锁1-5技能
        bossAbilityLimit?: number
    }
}
export default class Boss大和号技能 {


    constructor() {

        //one case
        /**
         *  "第一波BOSS，
         *      主炮：
         *      射程：600
         *      伤害：攻击力x1
         *      射速：0.8
         *      特殊：无
         *      技能1：跟踪导弹，发射一枚速度为500的跟踪导弹，造成1000+攻击力x2的伤害并眩晕5秒。导弹最多飞行6秒。（冷却20）
         *      技能2：分散导弹，对800范围内的所有单位造成2000+攻击力x5的伤害。（冷却10）
         *      技能3：自我修复，当血量低于20%时，无敌并且恢复30%的生命值，获得10秒的100%攻击力，移速加成。"
         */
        let actorType = ActorTypeUtil.getActorType("大和号");
        //

        ActorTypeUtil.registerActorType({
            id: "大和号自我修复Buff",
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


        //当单位被攻击时
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (gv.bossAbilityLimit >= 1) {
                actor.ifReady(20, () => {
                    let projectile = new Projectile(actor.unit, damageSource);
                    projectile.speed = 200
                    projectile.projectileModelScale = 2;
                    projectile.damage = UnitStateUtil.calculateStateFormula({
                        base: 1000,
                        attack: 2,
                    }, actor.unit);
                    projectile.lifeTimeMax = 6;
                    projectile.start();
                    TextTagUtil.textWarn("跟踪导弹", actor.unit,15,6)
                }, "跟踪导弹")

            }
            if (gv.bossAbilityLimit >= 2) {
                actor.ifReady(10, () => {
                    SelectUtil.forEnemyUnitsInRange(actor.unit, 800, unit => {
                        let projectile = new Projectile(actor.unit, damageSource);
                        projectile.speed = 1000
                        projectile.damage = UnitStateUtil.calculateStateFormula({
                            base: 2000,
                            attack: 5,
                        }, actor.unit);
                        projectile.start();

                    })
                    TextTagUtil.textWarn("分散导弹", actor.unit)
                }, "分散导弹")
            }
            //技能3：自我修复，当血量低于20%时，无敌并且恢复30%的生命值，获得10秒的100%攻击力，移速加成。"
            if (gv.bossAbilityLimit >= 3) {
                if (UnitStateUtil.getUnitLifeP(actor.unit) < 0.3) {
                    actor.ifReady(100, () => {
                        UnitRegenLifeUtil.regenUnitLife(actor.unit, UnitStateUtil.getMaxLife(actor.unit) * 0.3)
                        ActorBuffUtil.addActorBuff(actor.unit, "大和号自我修复Buff")
                        TextTagUtil.textWarn("自我修复", actor.unit)
                    }, "自我修复")
                }
            }
        };


    }


}