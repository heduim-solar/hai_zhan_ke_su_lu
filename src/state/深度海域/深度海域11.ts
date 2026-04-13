import PlayerUtil from "@/PlayerUtil";
import BaseUtil from "@/BaseUtil";
import MapRectUtil from "../../util/MapRectUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import {d_深度海域怪} from "../../xlsx/单位/深度海域怪";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import 海域工具 from "./海域工具";
import MapUtil from "../../util/MapUtil";

export default class 深度海域11 {

    units: unit[] = []

    /*
11、船坞
这是一个和出生点几乎一模一样的地图，但是走不出去，上面是迷雾。玩家在这一关会变成小木船的初始形态。
触发玩家的ID：这里……我是在做梦吗？
触发玩家的ID：我们要怎样才能离开这里。
女人的声音：你相信光吗？
触发玩家的ID：迪迦？
女人出现
女人：……这并不好笑，我意思是，如果能够重来一次，你还会敲碎那个东西吗？现在，做选择吧。
女人传送走，原地留下了一个和第一关中间那个一样的蛋，只有10血，每次攻击受到1点伤害。（注意这个时候玩家是个小木船。）
出现倒计时——抉择：30秒。
如果击碎蛋，后续可以进入隐藏房间23。如果不击碎，进入隐藏房间24。
抉择倒计时结束后：
如果击碎
文字提示：你们做出了和之前一样的选择，未来在此刻变动。
如果不击碎
文字提示：祂留在了这里，正在孕育一些东西，未来在此刻变动。

     */
    constructor() {
        this.对话();
        BaseUtil.runLater(3, () => {
            this.刷怪();
        });


    }

    刷怪() {
        let actorUnitTypeId = d_深度海域怪[gv.深度海域层数 - 1].id;
        let actorType = ActorTypeUtil.getActorType(actorUnitTypeId);
        actorType.onUnitDeath = (actor, killingUnit) => {
            for (let unit of this.units) {
                if (UnitStateUtil.isAlive(unit)) {
                    return
                }
            }
            //全死了
            this.击杀完毕()
        }
        //
        let 平均攻击 = MapUtil.getPlayerAllHeroStateVal({
            attack: 1,
        });
        let line = MapRectUtil.getLine(gv.深度海域层数);
        for (let i = 3; i < line.length - 1; i++) {
            let v = line[i];
            let oneLoc = MapUtil.getOneWaterLocByXY(v.x, v.y);
            let actorUnit = ActorUnitUtil.createActorUnit(Player(11), actorUnitTypeId, oneLoc.x, oneLoc.y);
            MapUtil.根据难度数值加强怪物(actorUnit.unit);
            UnitStateUtil.addMaxLifeAndLife(actorUnit.unit, 平均攻击 * 10 * gv.深度海域层数)
            this.units.push(actorUnit.unit);
        }


    }


    对话() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());

// 如果击碎蛋，后续可以进入隐藏房间23。如果不击碎，进入隐藏房间24。
// 抉择倒计时结束后：
// 如果击碎
//         文字提示：你们做出了和之前一样的选择，未来在此刻变动。
// 如果不击碎
//         文字提示：祂留在了这里，正在孕育一些东西，未来在此刻变动。
        海域工具.提示聊天信息(
            name + "：这里……我是在做梦吗？",
            name + "：我们要怎样才能离开这里。",
            "女人的声音：你相信光吗？",
            name + "：迪迦？",
            "女人：……这并不好笑，我意思是，如果能够重来一次，你还会敲碎那个东西吗？现在，做选择吧。",
        )

    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(22)

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}