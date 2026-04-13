import PlayerUtil from "@/PlayerUtil";
import AttributeUtil from "@/AttributeUtil";

export default class 经验获取 {


    constructor() {

        PlayerUtil.forUsers(player => {
            SetPlayerHandicapXP(player, 0)
        })


        se.onUnitDeath(e => {
            let killingUnit = e.killingUnit;
            let owningPlayer = GetOwningPlayer(killingUnit);
            if (IsHandle(killingUnit) && GetPlayerId(owningPlayer) < 5) {
                let hero = PlayerUtil.getHero(owningPlayer);
                let 杀敌经验: number = AttributeUtil.getUnitAttribute(hero, false)?.杀敌经验 || 0
                let 经验倍率: number = AttributeUtil.getUnitAttribute(hero, false)?.经验倍率 || 0
                AddHeroXP(hero, (1 + 杀敌经验) * (1 + 经验倍率), true)
            }
        })


    }

}