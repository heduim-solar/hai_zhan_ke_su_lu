import ActorTypeUtil from "@/ActorTypeUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import UnitStateUtil from "@/UnitStateUtil";
import HeroUtil from "@/HeroUtil";
import ActorAbility from "@/ActorAbility";
import ActorUtil from "@/ActorUtil";
import BaseUtil from "@/BaseUtil";

export default class 满天繁星号基础技能 {


    constructor() {

        /**
         * 满天繁星号
         * 你的Q主炮伤害+50%
         * 你的W主炮射程+50%
         * 你的E主炮频率+50%
         * 你的R主炮拥有杀敌+3全属性
         */
        let actorType = ActorTypeUtil.getActorType("满天繁星号基础技能");
        actorType.onUnitChange = (actor, unit) => {
            BaseUtil.runLater(1.5, () => {
                满天繁星号基础技能.update(unit);
            });
        }
        actorType.onUnitAddActor = (actor, newActor) => {
            if (newActor instanceof ActorAbility) {
                BaseUtil.runLater(1.5, () => {
                    满天繁星号基础技能.update(actor.unit);
                });
            }
        }


    }


    static update(unit: unit) {
        if (!IsHandle(unit)) {
            return;
        }
        let hasActor = ActorUtil.isUnitHasActor(unit, "满天繁星号基础技能");
        /**
         * 满天繁星号
         * 你的Q主炮伤害+50%
         * 你的W主炮射程+50%
         * 你的E主炮频率+50%
         * 你的R主炮拥有杀敌+3全属性
         */
        // print("hasActor="+hasActor)
        if (hasActor) {
            //q
            let actorAbilityQ = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 9);
            if (actorAbilityQ) {
                let aControllerQ: AutoMissileAttackController = actorAbilityQ.autoMissileAttackController
                if (aControllerQ && aControllerQ.满天繁星号基础技能加强伤害 != true) {
                    aControllerQ.满天繁星号基础技能加强伤害 = true;
                    if (aControllerQ.damageStateFormula) {
                        aControllerQ.damageStateFormula.increased = (aControllerQ.damageStateFormula.increased || 0) + 0.5;
                    }

                }
            }
            //w
            let actorAbilityW = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 10);
            // print("actorAbilityW="+tostring(actorAbilityW))
            if (actorAbilityW) {
                let aControllerW: AutoMissileAttackController = actorAbilityW.autoMissileAttackController
                // print("aControllerW="+tostring(aControllerW))
                if (aControllerW && (aControllerW.满天繁星号基础技能加强射程 == null || aControllerW.满天繁星号基础技能加强射程 == 0)) {
                    aControllerW.满天繁星号基础技能加强射程 = aControllerW.range * 0.5;
                    aControllerW.range += aControllerW.满天繁星号基础技能加强射程;
                    // print(" aControllerW.满天繁星号基础技能加强射程="+tostring( aControllerW.满天繁星号基础技能加强射程))
                }
            }
            //e
            let actorAbilityE = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 11);
            if (actorAbilityE) {
                let aControllerE: AutoMissileAttackController = actorAbilityE.autoMissileAttackController
                if (aControllerE && (aControllerE.满天繁星号基础技能加强射速 == null || aControllerE.满天繁星号基础技能加强射速 == 0)) {
                    aControllerE.满天繁星号基础技能加强射速 = aControllerE.coolDown * 0.25;
                    aControllerE.coolDown -= aControllerE.满天繁星号基础技能加强射速;
                }
            }
            //r
            let actorAbilityR = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 12);
            if (actorAbilityR) {
                let aControllerR: AutoMissileAttackController = actorAbilityR.autoMissileAttackController
                if (aControllerR && aControllerR.满天繁星号基础技能加强R != true) {
                    aControllerR.满天繁星号基础技能加强R = true;
                    aControllerR.onHitTarget = projectile => {
                        if (projectile.damage >= UnitStateUtil.getLife(projectile.target)) {
                            HeroUtil.addHeroProperty(projectile.source, 3);
                        }
                    }
                }
            }
        } else {
            //q
            let actorAbilityQ = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 9);
            if (actorAbilityQ) {
                let aControllerQ: AutoMissileAttackController = actorAbilityQ.autoMissileAttackController
                if (aControllerQ && aControllerQ.满天繁星号基础技能加强伤害 == true) {
                    aControllerQ.满天繁星号基础技能加强伤害 = false;
                    if (aControllerQ.damageStateFormula?.increased) {
                        aControllerQ.damageStateFormula.increased = (aControllerQ.damageStateFormula.increased || 0) - 0.5;
                    }

                }
            }
            //w
            let actorAbilityW = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 10);
            if (actorAbilityW) {
                let aControllerW: AutoMissileAttackController = actorAbilityW.autoMissileAttackController
                if (aControllerW && aControllerW.满天繁星号基础技能加强射程 && aControllerW.满天繁星号基础技能加强射程 > 0) {
                    aControllerW.range -= aControllerW.满天繁星号基础技能加强射程;
                    aControllerW.满天繁星号基础技能加强射程 = 0;
                }
            }
            //e
            let actorAbilityE = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 11);
            if (actorAbilityE) {
                let aControllerE: AutoMissileAttackController = actorAbilityE.autoMissileAttackController
                if (aControllerE && aControllerE.满天繁星号基础技能加强射速 && aControllerE.满天繁星号基础技能加强射速 > 0) {
                    aControllerE.coolDown += aControllerE.满天繁星号基础技能加强射速;
                    aControllerE.满天繁星号基础技能加强射速 = 0;
                }
            }
            //r
            let actorAbilityR = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 12);
            if (actorAbilityR) {
                let aControllerR: AutoMissileAttackController = actorAbilityR.autoMissileAttackController
                if (aControllerR && aControllerR.满天繁星号基础技能加强R == true) {
                    aControllerR.满天繁星号基础技能加强R = false;
                    aControllerR.onHitTarget = null;
                }
            }
        }
    }


}