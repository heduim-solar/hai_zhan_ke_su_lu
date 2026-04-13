import TextTagUtil from "@/TextTagUtil";
import UnitRewardUtil from "@/UnitRewardUtil";
import MapUtil from "../../util/MapUtil";

export default class 进攻怪赏金设置 {

    constructor() {

        se.onUnitDeath(e => {
            if (!e.hasKillingUnit) {
                return
            }
            let give_money: number = MapUtil.getUnitBounty(e.trigUnit)
            if (give_money && give_money > 0) {
                TextTagUtil.textGold("+" + UnitRewardUtil.addGoldWithEarnGoldP(e.killingUnit, give_money), e.trigUnit)
            }
        });
    }
}