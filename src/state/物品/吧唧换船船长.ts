import ActorTypeUtil from "@/ActorTypeUtil";
import 进化系统 from "../系统/进化系统";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";
import DataBase from "@/DataBase";
import PlayerUtil from "@/PlayerUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import AsyncUtil from "@/AsyncUtil";
import TextUtil from "@/TextUtil";
import MapModel from "../../MapModel";

declare global {

    interface AppPlayerData {
        购买吧唧次数?: number
    }

}
export default class 吧唧换船船长 {


    constructor() {
        /**
         * 点击使用，消耗该道具，可以强行更换一次船只（默认不保留当前船只的主炮）。每次购买价格翻倍
         */
        let sellingAbility = ActorTypeShopUtil.warpActorItem2SellingAbility("吧唧");
        sellingAbility.goldCost = 0;
        sellingAbility.tooltipLabel1 = "2000";
        if (settings.gameDifficulty < 5 && settings.gameMode == MapModel.模式1_普通模式) {
            sellingAbility.requiredTip = "难5";
            sellingAbility.disable = true;
            if (settings.gameDifficulty < 4) {
                sellingAbility.hide = true;
            }
        }
        let actorType = ActorTypeUtil.getActorType("吧唧");
        actorType.onBuy = (actor, buyingUnit) => {
            let player = GetOwningPlayer(buyingUnit);
            if (!IsHandle(player)) {
                return
            }
            if (GetUnitLevel(buyingUnit) < 2) {
                MouseFrameUtil.showTipText("|cffff0000初始小木船不能购买此船长换船!", 1, player);
                actor.destroy();
                return;
            }
            let pData = DataBase.getPlayerSolarData(player, true);
            let needGold = 2000 * (2 ** (pData.购买吧唧次数 || 0))

            needGold = Math.min(needGold, 1000000)
            if (!PlayerUtil.costEnoughState(player, needGold)) {
                MouseFrameUtil.showTipText("|cffff0000金币不足!需要:" + math.floor(needGold), 1, player);
                actor.destroy();
                return;
            }
            pData.购买吧唧次数 = (pData.购买吧唧次数 || 0) + 1;
            AsyncUtil.run(() => {
                let nextText = Math.min(needGold * 2, 1000000);
                ActorTypeShopUtil.warpActorItem2SellingAbility("吧唧").tooltipLabel1 = TextUtil.toCnUnit(nextText)
            }, player);

        }
        actorType.onAction = (actor, x, y, targetUnit) => {
            进化系统.do进化(actor.unitOwner, 1);
            actor.destroy();
        }


    }


}