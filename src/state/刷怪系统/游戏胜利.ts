import ActorUnitUtil from "@/ActorUnitUtil";
import PlayerUtil from "@/PlayerUtil";
import 达尔文进化基础刷怪 from "./达尔文进化基础刷怪";
import ArchiveUtil from "@/ArchiveUtil";
import SingletonUtil from "@/SingletonUtil";
import PlatUtil from "@/PlatUtil";
import MapModel from "../../MapModel";
import 深度海域 from "../深度海域/深度海域";
import SelectUtil from "@/SelectUtil";
import RectUtil from "@/RectUtil";

export default class 游戏胜利 {


    constructor() {

        //最后波数了 停怪
        se.onUnitDeath(e => {
            let actorUnit = ActorUnitUtil.getActorUnit(e.trigUnit);
            if (actorUnit == null) {
                return
            }
            if (settings.gameMode == MapModel.模式0_教学模式) {
                return;
            }
            if (actorUnit.actorTypeId == "拉莱耶之主-伟大的克苏鲁") {
                游戏胜利.victorys()
            } else if (actorUnit.actorTypeId == "克苏鲁之女-克希拉" && settings.gameDifficulty <= 3) {
                游戏胜利.victorys()
            }
        })


    }

    static victorys(msg = "|cffff0000游戏胜利!可以进入深度海域挑战更多存档！") {
        达尔文进化基础刷怪.stop();
        SelectUtil.forAllEnemyUnits(u => {
            if (RectUtil.isContainsCoords(gg_rct_map, GetUnitX(u), GetUnitY(u))) {
                RemoveUnit(u);
            }
        }, Player(0));
        SingletonUtil.executeOnce("游戏胜利存档积分", () => {
            se.emit("游戏胜利")
            PlayerUtil.forUsers(player => {
                let key = "n" + settings.gameDifficulty;
                //总计通关次数
                PlatUtil.addStoreInt(player, "znjifen", 1)
                ArchiveUtil.addNumber(player, key, +1);
                if (settings.gameMode == MapModel.模式3_献祭模式) {
                    ArchiveUtil.updateMaxNumber(player, "maxn", 20 + settings.gameDifficulty);
                } else if (settings.gameMode == MapModel.模式4_真实难度) {
                    ArchiveUtil.updateMaxNumber(player, "maxn", 30 + settings.gameDifficulty);
                } else if (settings.gameMode == MapModel.模式2_寄生模式) {
                    ArchiveUtil.updateMaxNumber(player, "maxn", 10 + settings.gameDifficulty);
                } else {
                    ArchiveUtil.updateMaxNumber(player, "maxn", settings.gameDifficulty);
                }
                ArchiveUtil.updateMaxNumber(player, "maxzl", sd(player).combatPower || 0);
                for (let i = 0; i < 5; i++) {
                    DisplayTimedTextToPlayer(player, 0, 0, 30, msg);
                }
                DisplayTimedTextToPlayer(player, 0, 0, 30, "【提示】开局输入-gj可以开启休闲模式");
            });

            深度海域.开启深度海域之门()
        })


    }

}