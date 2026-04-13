import ActorTypeUtil from "@/ActorTypeUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import 魔改道具 from "../商城/魔改道具";
import ActorUtil from "@/ActorUtil";
import Actor from "@/Actor";
import BaseUtil from "@/BaseUtil";

export default class 遥遥领先号基础技能 {


    constructor() {
        /**
         * 强者恒强号
         * 你的Q位置主炮伤害/射程翻倍。
         *
         * 遥遥领先号，W位置主炮伤害/射程翻倍。
         *
         */
        let actorType = ActorTypeUtil.getActorType("遥遥领先号基础技能");
        actorType.onUnitChange = (actor, unit) => {
            BaseUtil.runLater(1, () => {
                遥遥领先号基础技能.update(actor, unit);
            })
        }
        actorType.onUnitActorsChange = (actor) => {
            BaseUtil.runLater(1, () => {
                遥遥领先号基础技能.update(actor, actor.unit);
            })
        }
    }

    static update(actor: Actor, unit: unit) {
        if (!IsHandle(unit)) {
            return;
        }
        let hasActor = ActorUtil.isUnitHasActor(unit, "遥遥领先号基础技能");
        if (hasActor) {
            let actorAbility = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 9);
            if (actorAbility == null) {
                return
            }
            let aController: AutoMissileAttackController = actorAbility.autoMissileAttackController
            if (aController && (aController.遥遥领先号基础技能range == null || aController.遥遥领先号基础技能range == 0)) {
                aController.遥遥领先号基础技能range = aController.range
                aController.range += aController.遥遥领先号基础技能range;
                if (aController.damageStateFormula) {
                    aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) + 1;
                }
            }
            if (魔改道具.主炮是否拥有魔改道具(actor)) {
                actorAbility = ActorAbilityUtil.getUnitActorAbilityByPos(unit, 10);
                if (actorAbility == null) {
                    return
                }
                aController = actorAbility.autoMissileAttackController
                if (aController && (aController.遥遥领先号基础技能range == null || aController.遥遥领先号基础技能range == 0)) {
                    aController.遥遥领先号基础技能range = aController.range
                    aController.range += aController.遥遥领先号基础技能range;
                    if (aController.damageStateFormula) {
                        aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) + 1;
                    }
                }
            }

        } else {
            let actorAbility = ActorAbilityUtil.getUnitActorAbilityByPos(actor.lastUnit, 9);
            if (actorAbility == null) {
                return
            }
            let aController: AutoMissileAttackController = actorAbility.autoMissileAttackController
            if (aController && aController.遥遥领先号基础技能range && aController.遥遥领先号基础技能range > 0) {
                aController.range -= aController.遥遥领先号基础技能range;
                if (aController.damageStateFormula) {
                    aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) - 1;
                }
                aController.遥遥领先号基础技能range = 0;
            }
            //
            actorAbility = ActorAbilityUtil.getUnitActorAbilityByPos(actor.lastUnit, 10);
            if (actorAbility == null) {
                return
            }
            aController = actorAbility.autoMissileAttackController
            if (aController && aController.遥遥领先号基础技能range && aController.遥遥领先号基础技能range > 0) {
                aController.range -= aController.遥遥领先号基础技能range;
                if (aController.damageStateFormula) {
                    aController.damageStateFormula.increased = (aController.damageStateFormula.increased || 0) - 1;
                }
                aController.遥遥领先号基础技能range = 0;
            }
        }

    }
}