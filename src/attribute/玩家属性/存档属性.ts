import BaseUtil from "@/BaseUtil";
import PlayerUtil from "@/PlayerUtil";
import AttributeUtil from "@/AttributeUtil";
import ActorItemUtil from "@/ActorItemUtil";
import PlatUtil from "@/PlatUtil";

export default class 存档属性 {


    constructor() {
        BaseUtil.runLater(1.2, () => {
            PlayerUtil.forUsers(player => {
                let playerAttr = AttributeUtil.getPlayerAttribute(player, false);
                if (playerAttr == null) {
                    return
                }
                if (playerAttr.初始金币 && playerAttr.初始金币 > 0) {
                    PlayerUtil.addGoldState(player, playerAttr.初始金币);

                }
                if (playerAttr.初始船长信件 && playerAttr.初始船长信件 > 0) {
                    let ffsl = playerAttr.初始船长信件;
                    if (ffsl > 2 && ffsl > PlatUtil.getMapLevel(player) / 2) {
                        ffsl = Math.floor(PlatUtil.getMapLevel(player) / 2);
                        PlayerUtil.message("你有" + playerAttr.初始吞天石 + "初始船长信件,但发放数量受到地图等级/2的数量限制:实际发放" + ffsl, 10, player)
                    }
                    let hero = PlayerUtil.getHero(player);
                    let actorItem = ActorItemUtil.addActorItemForUnit("船长信件", hero, ffsl);
                    actorItem.set("pawnable", true);
                    actorItem.set("goldCost", 100);
                }

                if (playerAttr.初始吞天石 && playerAttr.初始吞天石 > 0) {
                    let ffsl = playerAttr.初始吞天石;
                    if (ffsl > 2 && ffsl > PlatUtil.getMapLevel(player) / 2) {
                        ffsl = Math.floor(PlatUtil.getMapLevel(player) / 2);
                        PlayerUtil.message("你有" + playerAttr.初始吞天石 + "初始吞天石,但发放数量受到地图等级/2的数量限制:实际发放" + ffsl, 10, player)
                    }

                    let hero = PlayerUtil.getHero(player);
                    let actorItem = ActorItemUtil.addActorItemForUnit("吞天石", hero, ffsl);
                    actorItem.set("pawnable", true);
                    actorItem.set("goldCost", 100);
                }


            });


        })
    }


}