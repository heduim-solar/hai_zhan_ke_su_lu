import ActorTypeUtil from "@/ActorTypeUtil";
import {d_核心部件} from "../../xlsx/装备/核心部件";
import ArrayUtil from "@/ArrayUtil";
import ActorItemUtil from "@/ActorItemUtil";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";
import MapModel from "../../MapModel";
import PlayerUtil from "@/PlayerUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import Actor from "@/Actor";

export default class 购买核心部件 {

    static gmhxbjs:Actor[] = []

    constructor() {


        let actorType = ActorTypeUtil.getActorType("核心部件");
        let actorAbilityType = ActorTypeShopUtil.warpActorItem2SellingAbility(actorType.id);
        actorAbilityType.disable = true;
        actorAbilityType.onCreated = (actor)=>{
            购买核心部件.gmhxbjs.push(actor)
        }
        if (settings.gameDifficulty < 4 && settings.gameMode == MapModel.模式1_普通模式) {
            actorAbilityType.requiredTip = "难4";
            if (settings.gameDifficulty < 3) {
                actorAbilityType.hide = true;
            }
        }else {
            actorAbilityType.requiredTip = "击杀第一个boss后";
        }
        actorType.onBuy = (actor, buyingUnit) => {
            actor.destroy();
            //
            if (GetUnitLevel(buyingUnit) < 5) {
                MouseFrameUtil.showFailText("需要至少5级才能购买此物品!", 1, GetOwningPlayer(buyingUnit))
                PlayerUtil.addLumberState(GetOwningPlayer(buyingUnit), 1);
                return
            }


            //
            let randomElement = ArrayUtil.randomElement(d_核心部件);
            ActorItemUtil.addActorItemForUnit(randomElement.id, buyingUnit)
        }


    }


}