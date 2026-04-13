import PlayerUtil from "@/PlayerUtil";
import SelectUtil from "@/SelectUtil";
import ActorUtil from "@/ActorUtil";
import HeroUtil from "@/HeroUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";

/**
 天使号
 队友每次阵亡可以给天使号+100的三维
 */
export default class 天使号基础技能 {


    constructor() {
        se.onUnitDeath(e => {
            if (e.isHeroUnitTrig && e.trigUnitOwnerId < 5) {
                PlayerUtil.forUsers(player => {
                    if (player == e.trigUnitOwner) {
                        return
                    }
                    let anHero = SelectUtil.getAnHero(GetPlayerId(player));
                    ActorAbilityUtil.ifUnitHasActorAbility(anHero, () => {
                        HeroUtil.addHeroProperty(anHero, 100)
                    }, "天使号基础技能")
                })
            }
        });


    }


}

