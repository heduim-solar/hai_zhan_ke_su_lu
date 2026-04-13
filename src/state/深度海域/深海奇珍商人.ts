import ActorTypeUtil from "@/ActorTypeUtil";
import 深度海域 from "./深度海域";
import PlayerUtil from "@/PlayerUtil";
import MapUtil from "../../util/MapUtil";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";

export default class 深海奇珍商人 {


    constructor() {

        let actorType = ActorTypeUtil.getActorType("深海下一关");
        let actorTypeAbility = ActorTypeShopUtil.warpActorItem2SellingAbility("深海下一关");
        actorTypeAbility.maxCd = 3;
        actorType.onBuy = (actor, buyingUnit) => {
            actor.destroy();
            //

            let realNanduLevel = MapUtil.getRealNanduLevel();

            if (gv.深度海域层数 >= realNanduLevel) {
                PlayerUtil.message("当前难度下只能探索到此层数:" + realNanduLevel + " 如需探索更深层数下一局请开更高游戏难度。")
                return
            }
            深度海域.进入深度海域(gv.深度海域层数 + 1)
        }


    }

}