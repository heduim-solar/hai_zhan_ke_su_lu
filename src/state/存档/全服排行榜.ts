import PlatUtil from "@/PlatUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import PlayerUtil from "@/PlayerUtil";

export default class 全服排行榜 {

    static config = {
        rankKey: 2,
        archiveKey: "Itsjf",
        rankName: "探索排行榜",
        myIcon: "ReplaceableTextures\\CommandButtons\\BTNMilitia.blp",
        baseIcon: "ReplaceableTextures\\CommandButtons\\BTNPeasant.blp",
    }


    constructor() {
        全服排行榜.同步给所有玩家计算排行榜奖励();
        全服排行榜.异步显示();
    }

    static 同步给所有玩家计算排行榜奖励() {
        PlayerUtil.forUsers(player => {
            let rankIndex = PlatUtil.getCustomRank(player, 全服排行榜.config.rankKey);
            if (rankIndex <= 0 || rankIndex > 99) {
                return
            }
            let jlVal = (100 - rankIndex) * 5;
            let info = "你的" + 全服排行榜.config.rankName + "排名为" + rankIndex + ";";
            info = info + "获得金币奖励:" + jlVal;
            PlayerUtil.addGoldState(player, jlVal);
            PlayerUtil.message(info, 3, player);
        });
    }


    static 异步显示() {
        let myVal = PlatUtil.getStoreInt(GetLocalPlayer(), 全服排行榜.config.archiveKey);
        if (myVal == null || myVal == 0) {
            return;
        }
        let rankCount = PlatUtil.getCustomRankCount(全服排行榜.config.rankKey);
        if (rankCount <= 0) {
            print("没有榜单数据!");
            // if (myVal > 300) {
            //     rankCount = 50;
            // }
            return;
        }


        let myData = 全服排行榜.register(-2);
        myData.icon = 全服排行榜.config.myIcon;
        myData.name = GetPlayerName(GetLocalPlayer());
        let customRank = PlatUtil.getCustomRank(GetLocalPlayer(), 全服排行榜.config.rankKey);
        if (customRank <= 0) {
            myData.describe = "我的排名:|cff00ff00未上榜(前100名之外)榜单每天早上统计昨日的数据" +
                "|r|n我的数值:|cff00ff00" + myVal;
        } else {
            myData.describe = "我的排名:|cff00ff00" + customRank +
                "|r|n我的数值:|cff00ff00" + myVal;
        }


        for (let i = 1; i < 100 && i < rankCount; i++) {
            let actorType = 全服排行榜.register(i);
            actorType.name = tostring(PlatUtil.getCustomRankPlayerName(全服排行榜.config.rankKey, i));
            actorType.describe = actorType.name + ":|cff00ff00" + PlatUtil.getCustomRankValue(全服排行榜.config.rankKey, i) + "|r|n排名:" + i;
        }


    }

    static register(id: number) {
        let actorType = ActorTypeUtil.registerActorType({
            id: "_sl_:全服排行榜:" + id,
            class: 全服排行榜.config.rankName,
            icon: 全服排行榜.config.baseIcon,
            uiShowType: "通用图标面板",
            uiEnable: true,
        });
        return actorType;
    }

}