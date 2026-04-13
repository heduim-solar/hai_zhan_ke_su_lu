import ActorTypeUtil from "@/ActorTypeUtil";
import PlayerUtil from "@/PlayerUtil";
import SolarDamageState from "@/SolarDamageState";
import ActorUtil from "@/ActorUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";

export default class 皇家宝藏号基础技能 {


    constructor() {

        /**
         * 皇家宝藏号
         * 每1W金币提高1%造成的伤害
         */
            //one case
        let actorType = ActorTypeUtil.getActorType("皇家宝藏号基础技能");
        actorType.interval = 5
        actorType.onUnitInterval = (actor) => {
            let gold = PlayerUtil.getGold(GetOwningPlayer(actor.unit))
            actor.setDescribe("每1W金币提高1%造成的伤害|n当前提高" + (gold / 10000) + "%")
        }
        //
        SolarDamageState.addEventHandlerLast(event => {
            ActorAbilityUtil.ifUnitHasActorAbility(event.unit1, actor => {
                let gold = PlayerUtil.getGold(GetOwningPlayer(actor.unit))
                event.resultDamage = event.resultDamage * (1 + (gold / 10000))
            }, "皇家宝藏号基础技能")
        })

    }


}

