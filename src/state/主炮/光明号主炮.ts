import SolarDamageState from "@/SolarDamageState";
import ActorUtil from "@/ActorUtil";
import UnitUtil from "@/UnitUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";

export default class 光明号主炮 {


    constructor() {

        /**
         * 射程：600
         * 伤害：攻击力x1
         * 射速：0.2
         * 特殊：该主炮会对BOSS造成500%的额外伤害
         */
        //one case
        //
        SolarDamageState.addEventHandlerLast(event => {
            if (!UnitUtil.isHero(event.unit0)) {
                return
            }
            ActorAbilityUtil.ifUnitHasActorAbility(event.unit1, actor => {
                event.resultDamage = event.resultDamage * 5
            }, "光明号")
        })

    }


}

