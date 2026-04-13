import ActorTypeUtil from "@/ActorTypeUtil";
import DamageRecordUtil from "@/DamageRecordUtil";
import DamageType from "@/DamageType";
import MapModel from "../../MapModel";
import RandomUtil from "@/RandomUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import TextTagUtil from "@/TextTagUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";
import ObjectTemplateUtil from "@/ObjectTemplateUtil";

export default class 敌人buff效果 {

    /**
     * "17、模式和关卡，模式1，普通模式，每3个难度换个BOSS，最多N9。一共3个。
     * 模式1：小怪普通。
     * 模式2：N1-N3给予BUFF1（小怪10%.BOSS100%）：小怪死亡时有可能被踏尘者寄生，攻击力/移速/生命值+100%复活一次。（也就是翻倍复活，不影响护甲）
     * N4-N6给予BUFF1和BUFF2（小怪10%.BOSS100%）：小怪出生时有可能被狂风之力眷顾，攻速/移速+100%或额外附带一门主炮：
     * 射程：300
     * 伤害：攻击力x0.5
     * 射速：0.1
     * N7-N9给予BUFF1-2-3（小怪10%.BOSS100%）：小怪出生时有可能被给予犹格索托斯之力，范围300献祭，1000+最大生命值10%的真实伤害（多个来源可叠加）。
     * 模式3：
     * 后面再说"
     */

    constructor() {
        /**
         * 犹格索托斯之力，范围300献祭，1000+最大生命值10%的真实伤害（多个来源可叠加）
         */
        let actorType = ActorTypeUtil.getActorType("犹格索托斯之力");
        actorType.interval = 1;
        actorType.onUnitInterval = (actor) => {
            DamageRecordUtil.damageEnemyUnitsInRange(actor.getName(), actor.unit, 300, {
                base: 1000, maxHp: 0.1
            }, DamageType.s_真实伤害)
        }

        //
        if (settings.gameMode != MapModel.模式1_普通模式) {
            se.onUnitDeath(e => {
                if (e.trigUnitOwnerId < 5) {
                    return
                }
                if (e.trigUnitOwnerId > 11) {
                    return
                }
                let trigUnit = e.trigUnit;
                if (ActorBuffUtil.isUnitHasActorBuff(trigUnit, "踏尘者寄生")) {
                    //复活一次
                    return
                }
                if (e.isHeroUnitTrig) {
                    //boss 复活一次
                    ReviveHero(trigUnit, GetUnitX(trigUnit), GetUnitY(trigUnit), true);
                    ActorBuffUtil.addActorBuff(trigUnit, "踏尘者寄生")
                    TextTagUtil.textWarn("踏尘者寄生", trigUnit)
                } else if (RandomUtil.isInChance(0.1)) {
                    //小怪复活一次
                    let newUnit = CreateUnit(e.trigUnitOwner, e.trigUnitTypeIdStr, e.trigUnitX, e.trigUnitY, e.trigUnitFacing);
                    ActorBuffUtil.addActorBuff(newUnit, "踏尘者寄生")
                    TextTagUtil.textWarn("踏尘者寄生", newUnit)
                }
            });

            if (settings.gameDifficulty > 3) {
                se.onUnitEnterMapRect(e => {
                    if (e.trigUnitOwnerId < 5) {
                        return
                    }
                    if (e.trigUnitOwnerId > 11) {
                        return
                    }
                    let trigUnit = e.trigUnit;
                    if (e.isHeroUnitTrig) {
                        if (RandomUtil.randomBool()) {
                            ActorBuffUtil.addActorBuff(trigUnit, "狂风之力")
                            TextTagUtil.textWarn("狂风之力", trigUnit)
                        } else if (ObjectTemplateUtil.getTemplateIdleCount("主动11") > 20) {
                            ActorAbilityUtil.createActorAbility("狂风之力主炮", trigUnit)
                            TextTagUtil.textWarn("狂风之力主炮", trigUnit)
                        }


                    } else if (RandomUtil.isInChance(0.1)) {
                        //小怪复活一次
                        if (RandomUtil.randomBool()) {
                            ActorBuffUtil.addActorBuff(trigUnit, "狂风之力")
                            TextTagUtil.textWarn("狂风之力", trigUnit)
                        } else if (ObjectTemplateUtil.getTemplateIdleCount("主动11") > 20) {
                            ActorAbilityUtil.createActorAbility("狂风之力主炮", trigUnit)
                            TextTagUtil.textWarn("狂风之力主炮", trigUnit)
                        }
                    }

                    if (settings.gameDifficulty > 6) {
                        if (e.isHeroUnitTrig) {
                            ActorBuffUtil.addActorBuff(trigUnit, "犹格索托斯之力")
                            TextTagUtil.textWarn("犹格索托斯之力", trigUnit)
                        } else if (RandomUtil.isInChance(0.1)) {
                            //小怪复活一次
                            ActorBuffUtil.addActorBuff(trigUnit, "犹格索托斯之力")
                            TextTagUtil.textWarn("犹格索托斯之力", trigUnit)
                        }
                    }


                });
            }


        }


    }


}