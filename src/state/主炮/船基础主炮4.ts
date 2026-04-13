import ActorTypeUtil from "@/ActorTypeUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import ActorUtil from "@/ActorUtil";
import 主炮基础事件 from "./主炮基础事件";
import SelectUtil from "@/SelectUtil";
import Projectile from "@/Projectile";
import 魔改道具 from "../商城/魔改道具";
import BaseUtil from "@/BaseUtil";
import BounceMissileController from "@/BounceMissileController";
import HeroUtil from "@/HeroUtil";
import TextTagUtil from "@/TextTagUtil";

export default class 船基础主炮4 {


    //ch 9 new add
    constructor() {

        /**
         * "射程：200
         * 伤害：攻击力x1
         * 射速：1
         * 特殊：所有基础射程400以下的主炮，射程+500，射速+50%"
         */
        let actorType = ActorTypeUtil.getActorType("团结号主炮");
        actorType.onUnitChange = (actor, unit) => {
            主炮基础事件.onUnitChange(actor, unit);
            BaseUtil.runLater(0.01, () => {
                if (IsHandle(unit)) {
                    ActorUtil.forUnitAllActorList(unit, actor => {
                        let aController: AutoMissileAttackController = actor.autoMissileAttackController
                        if (aController && aController.range <= 400 && aController.团结号主炮加强 != true) {
                            aController.团结号主炮加强 = true
                            aController.range += 500;
                            aController.coolDown *= 0.75;
                        }
                    });
                } else {
                    ActorUtil.forUnitAllActorList(actor.lastUnit, actor => {
                        let aController: AutoMissileAttackController = actor.autoMissileAttackController
                        if (aController && aController.团结号主炮加强 == true) {
                            aController.团结号主炮加强 = false
                            aController.range -= 500;
                            aController.coolDown *= (1 / 0.75);
                        }
                    });
                }
            });
        }
        actorType.onUnitAddActor = (actor, newActor) => {
            let aController: AutoMissileAttackController = newActor.autoMissileAttackController
            if (aController && aController.range <= 400 && aController.团结号主炮加强 != true) {
                aController.团结号主炮加强 = true
                aController.range += 500;
                aController.coolDown *= 0.75;
            }
        }
        //
        /*
        "射程：600
伤害：攻击力x1
射速：1
特殊：所有基础射程410以上的主炮，射程+300，伤害+50%"
         */
        actorType = ActorTypeUtil.getActorType("遥遥领先号主炮");
        actorType.onUnitChange = (actor, unit) => {
            主炮基础事件.onUnitChange(actor, unit);
            if (IsHandle(unit)) {
                ActorUtil.forUnitAllActorList(unit, actor => {
                    let aController: AutoMissileAttackController = actor.autoMissileAttackController
                    if (aController && aController.range > 410 && aController.遥遥领先号主炮加强 != true) {
                        aController.遥遥领先号主炮加强 = true
                        aController.range += 300;
                        if (aController.damageStateFormula) {
                            aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) + 0.5;
                        }
                    }
                });
            } else {
                ActorUtil.forUnitAllActorList(actor.lastUnit, actor => {
                    let aController: AutoMissileAttackController = actor.autoMissileAttackController
                    if (aController && aController.遥遥领先号主炮加强 == true) {
                        aController.遥遥领先号主炮加强 = false
                        aController.range -= 300;
                        if (aController.damageStateFormula) {
                            aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) - 0.5;
                        }

                    }
                });
            }
        }
        actorType.onUnitAddActor = (actor, newActor) => {
            let aController: AutoMissileAttackController = newActor.autoMissileAttackController
            if (aController && aController.range > 410 && aController.遥遥领先号主炮加强 != true) {
                aController.遥遥领先号主炮加强 = true
                aController.range += 300;
                if (aController.damageStateFormula) {
                    aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) + 0.5;
                }
            }
        }
        //
        /*
射程：500
伤害：攻击力x1
射速：1
特殊：所有拥有弹道的主炮，攻击目标+1。
         */
        actorType = ActorTypeUtil.getActorType("满天繁星号主炮");
        actorType.onUnitChange = (actor, unit) => {
            主炮基础事件.onUnitChange(actor, unit);
            if (IsHandle(unit)) {
                let add = 魔改道具.主炮是否拥有魔改道具(actor) ? 2 : 1
                ActorUtil.forUnitAllActorList(unit, actor => {
                    let aController: AutoMissileAttackController = actor.autoMissileAttackController
                    if (aController) {
                        aController.targetCount += add;
                    }
                });
            } else {
                ActorUtil.forUnitAllActorList(actor.lastUnit, actor => {
                    let aController: AutoMissileAttackController = actor.autoMissileAttackController
                    if (aController && aController.满天繁星号主炮加强目标数量 && aController.满天繁星号主炮加强目标数量 > 0) {
                        aController.targetCount -= aController.满天繁星号主炮加强目标数量;
                        aController.满天繁星号主炮加强目标数量 = 0
                    }
                });
            }
        }
        actorType.onUnitAddActor = (actor, newActor) => {
            let aController: AutoMissileAttackController = newActor.autoMissileAttackController
            if (aController) {
                let add = 魔改道具.主炮是否拥有魔改道具(actor) ? 2 : 1
                aController.满天繁星号主炮加强目标数量 = add
                aController.targetCount += aController.满天繁星号主炮加强目标数量;
            }
        }


        //
        /*
射程：700
伤害：攻击力x3
射速：1.5
特殊：对目标造成伤害后，会散射给周围随机5个单位。
         */
        actorType = ActorTypeUtil.getActorType("旋转飞轮号主炮");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(projectile.source, 600, projectile.x, projectile.y);
                if (enemyUnitsInRange == null) {
                    return
                }
                for (let i = 0; i < enemyUnitsInRange.length && i < 5; i++) {
                    let newP = new Projectile(projectile.source, enemyUnitsInRange[i]);
                    newP.projectileModelPath = projectile.projectileModelPath;
                    newP.damage = projectile.damage;
                    newP.x = projectile.x;
                    newP.y = projectile.y;
                    newP.start();
                }
            }

        }

        /**
         * "射程：300
         * 伤害：攻击力x1
         * 射速：1
         * 特殊：每分钟提高50射程/20%伤害和10%射速。"
         */
        //
        actorType = ActorTypeUtil.getActorType("萧炎号主炮");
        actorType.interval = 60
        actorType.onCreated = (actor) => {
            BaseUtil.runLater(0.01, () => {
                let aController: AutoMissileAttackController = actor.autoMissileAttackController
                if (aController && actor.extData.萧炎号主炮已持有分钟数 && actor.extData.萧炎号主炮已持有分钟数 > 0) {
                    aController.range += (actor.extData.萧炎号主炮已持有分钟数 * 50);
                    aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) + (actor.extData.萧炎号主炮已持有分钟数 * 0.2);
                    aController.coolDown *= (0.9 ** actor.extData.萧炎号主炮已持有分钟数);
                    aController.coolDown = Math.max(aController.coolDown, 0.05)
                }
            })
        }
        actorType.onUnitInterval = (actor) => {
            actor.extData.萧炎号主炮已持有分钟数 = (actor.extData.萧炎号主炮已持有分钟数 || 0) + 1;
            let aController: AutoMissileAttackController = actor.autoMissileAttackController
            if (aController) {
                aController.range += 50;
                aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) + 0.2;
                aController.coolDown *= 0.9;
                aController.coolDown = Math.max(aController.coolDown, 0.05)
            }


        }

        /**
         */
        //one case
        actorType = ActorTypeUtil.getActorType("练习生主炮");
        actorType.onCreated = actor => {
            actor.extData.弹射次数 = 2;
        };
        actorType.interval = 150;
        actorType.onUnitInterval = (actor) => {
            actor.extData.弹射次数 = (actor.extData.弹射次数 || 2) + 1;
            if (魔改道具.主炮是否拥有魔改道具(actor)) {
                //练习生主炮每2分半获得5%基础全属性
                HeroUtil.addHeroPropertyP(actor.unit, false, 0.05);
                TextTagUtil.text("获得5%基础全属性", actor.unit);
            }

        }
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                let bounceMissileController = new BounceMissileController(attackController.unit);
                bounceMissileController.loopCount = actor.extData.弹射次数 || 2;
                bounceMissileController.projectileModelPath = attackController.projectileModelPath;
                bounceMissileController.range = 600;
                bounceMissileController.damageStateFormula = attackController.damageStateFormula;
                bounceMissileController.hitUnitList.push(projectile.target);
                bounceMissileController.launch();
            }
        }

    }


}