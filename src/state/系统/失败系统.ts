import PlayerUtil from "@/PlayerUtil";
import ActorItemUtil from "@/ActorItemUtil";
import GameUtil from "@/GameUtil";
import BaseUtil from "@/BaseUtil";
import ActorUtil from "@/ActorUtil";
import MapModel from "../../MapModel";

export default class 失败系统 {


    constructor() {
        se.onUnitDeath((e, solarTrigger) => {
            if (e.trigUnitOwnerId > 3) {
                return;
            }
            if (settings.gameMode == MapModel.模式0_教学模式) {
                solarTrigger.destroy();
                return;
            }
            if (gv.深度海域层数 && gv.深度海域层数 > 0) {
                solarTrigger.destroy();
                return;
            }
            失败系统.checkDefeats()

        });


    }


    static checkDefeats() {
        let isAllDead = true;
        PlayerUtil.forPlayingPlayers(player => {
            let hero = PlayerUtil.getHero(player);
            if (!IsHandle(hero)) {
                return
            }
            if (UnitAlive(hero)) {
                isAllDead = false;
            } else if (ActorUtil.isUnitHasActor(hero, "鲁灰") ||
                ActorUtil.isUnitHasActor(hero, "尼卡·鲁灰")
            ) {
                isAllDead = false;
            } else if (ActorItemUtil.isUnitHasActorItem(hero, "胶胶果实")) {
                isAllDead = false;
            } else if (ActorItemUtil.isUnitHasActorItem(hero, "重生十字章")) {
                isAllDead = false;
            }
        });

        if (isAllDead) {

            BaseUtil.runLater(1, () => {
                let isAllDead = true;
                PlayerUtil.forPlayingPlayers(player => {
                    let hero = PlayerUtil.getHero(player);
                    if (!IsHandle(hero)) {
                        return
                    }
                    if (UnitAlive(hero)) {
                        isAllDead = false;
                    } else if (ActorUtil.isUnitHasActor(hero, "鲁灰") ||
                        ActorUtil.isUnitHasActor(hero, "尼卡·鲁灰")
                    ) {
                        isAllDead = false;
                    } else if (ActorItemUtil.isUnitHasActorItem(hero, "胶胶果实")) {
                        isAllDead = false;
                    } else if (ActorItemUtil.isUnitHasActorItem(hero, "重生十字章")) {
                        isAllDead = false;
                    }
                });
                if (isAllDead) {
                    GameUtil.defeats("船全部沉了!你们GG了!")
                }
            });
        }
    }
}