import AutoMissileAttackController from "@/AutoMissileAttackController";
import AttributeUtil from "@/AttributeUtil";
import TextUtil from "@/TextUtil";
import Actor from "@/Actor";
import BaseUtil from "@/BaseUtil";
import PlayerUtil from "@/PlayerUtil";
import ActorUtil from "@/ActorUtil";

export default class 主炮演员属性实时刷新提示 {


    constructor() {
        BaseUtil.onTimer(10, () => {
            PlayerUtil.forUsers(player => {

                let hero = PlayerUtil.getHero(player);
                if (IsHandle(hero)) {
                    // let actorList = ActorAbilityUtil.getUnitActorAbilityList(hero);
                    let actorList = ActorUtil.getUnitAllActorList(hero);
                    if (actorList == null || actorList.length == 0) {
                        return
                    }
                    for (let actor of actorList) {
                        主炮演员属性实时刷新提示.刷新提示(actor);
                    }

                }


            })


            return true;
        })

    }

    static 刷新提示(actor: Actor) {
        if (!IsHandle(actor.unit) || actor.isDestroyed()) {
            return;
        }

        let ctrl: AutoMissileAttackController = actor.autoMissileAttackController
        // print("刷新主炮：" + actor.getName() + "-" + tostring(ctrl))
        if (ctrl == null) {
            return
        }
        if (ctrl.damageStateFormula == null) {
            print("伤害公式不存在:" + actor.actorTypeId)
        }
        // if (actor.主炮范围提示) {
        //     return;
        // }
        let attribute = AttributeUtil.getUnitAttribute(actor.unit, false);
        let r = (ctrl.range + ctrl.extRange + (attribute?.autoMissileAttackRange || 0)) * (1 + (attribute?.autoMissileAttackRange_p || 0))
        // let cd = ctrl.coolDown * (1 - (attribute?.autoMissileAttackSpeed || 0))
        let cd: number = ctrl.coolDown / (1 + (attribute?.autoMissileAttackSpeed || 0));
        // let newDescribe = actor.actorType.describe + "|n--------|n当前范围:|cff00ff00" + Math.floor(r) + "|r|n当前射速:|cff00ff00" + cd + "|r"
        // if (ctrl.damageStateFormula && ctrl.damageStateFormula.increased && ctrl.damageStateFormula.increased > 0) {
        //     newDescribe = newDescribe + "|n当前增伤:|cff00ff00" + TextUtil.toPercentage(ctrl.damageStateFormula.increased) + "|r|n"
        // }
        // actor.setDescribe(newDescribe);
        // actor.主炮范围提示 = true;
        //new
        actor.setExtDescribe("当前范围:|cff00ff00", tostring(Math.floor(r)));
        actor.setExtDescribe("当前射速:|cff00ff00", tostring(cd.toFixed(2)));
        if (ctrl.damageStateFormula?.increased) {
            actor.setExtDescribe("当前增伤:|cff00ff00", TextUtil.toPercentage(ctrl.damageStateFormula.increased));
        }

    }

}