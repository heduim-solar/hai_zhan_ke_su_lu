import PlayerUtil from "@/PlayerUtil";
import BaseUtil from "@/BaseUtil";
import MapRectUtil from "../../util/MapRectUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import {d_深度海域怪} from "../../xlsx/单位/深度海域怪";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import 海域工具 from "./海域工具";
import MapUtil from "../../util/MapUtil";
import XlsxDataUtil from "@/XlsxDataUtil";

export default class 深度海域12 {

    units: unit[] = []

    /*
12、砍不断的树
去BOOM抄一下基地的地形，主要是要有个农民可以砍树去卖。这个地图玩家要变成一个农民，只有砍树和6个空的物品栏。
触发玩家的ID：这里……
触发玩家的ID：这里是我以前呆过的码头！
大副：嗨嗨嗨，那边那个新来的，还不赶紧去砍树，敌人都要打过来了！
触发玩家的ID：是……大副！天哪，到底怎么回事。
文字提示：
大副早在二十年前就因为战乱去世了，在这里重逢，本应去问个清楚，但是身体似乎被什么东西给控制住，只得先去砍树了。
文字提示：右键点击树就可以砍树啦，注意找到不合理的地方。
砍10次可以得到一捆木头，这一关有一棵树是砍不坏的，然后这棵树后面都是假场景，实际上是一条路，其他树10下就倒了。对着砍不坏的那棵树砍20次。
文字提示：这棵树似乎砍不倒……
大副：哪有树是砍不倒的啊……
触发玩家的ID：大副？
大副：你现在都已经是船长了，很高兴再次见到你。这颗树，我来帮你砍。
大副走过去一刀把树砍了，然后被穿刺插死
触发玩家的ID：！！！不！
大副：呃……没关系，我是个懦夫，我不敢再往前了……
大副：再会……启航吧！
文字提示：顺着大副引领的路前进吧。
穿过树后面的路，找到下一关的入口。

大副的灵魂碎片+1
（集齐20个可解锁大副的灵魂，初始召唤一个继承自己攻击力100%的大副灵魂，攻速为每秒1次）
每多搜集5个，大副的攻速+20%，做个10级。
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
            let data: t_深度海域存档 = XlsxDataUtil.getDataById("大副的灵魂碎片");
            MapUtil.addUsersArchive(1, data.requireKey, data.name);
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
        海域工具.提示聊天信息(
            name + "：这里……",
            name + "：这里是我以前呆过的码头！",
            "大副：嗨嗨嗨，那边那个新来的，还不赶紧去砍树，敌人都要打过来了！",
            name + "：是……大副！天哪，到底怎么回事。",
            "(大副早在二十年前就因为战乱去世了，在这里重逢，本应去问个清楚，但是身体似乎被什么东西给控制住，只得先去砍树了。)",
            "(右键点击树就可以砍树啦，注意找到不合理的地方。\n" +
            "砍10次可以得到一捆木头，这一关有一棵树是砍不坏的，然后这棵树后面都是假场景，实际上是一条路，其他树10下就倒了。对着砍不坏的那棵树砍20次。)",
            "这棵树似乎砍不倒……",
            "大副：哪有树是砍不倒的啊……",
            name + "：大副？",
            "大副：你现在都已经是船长了，很高兴再次见到你。这颗树，我来帮你砍。",
            name + "：！！！不！",
            "大副：呃……没关系，我是个懦夫，我不敢再往前了……",
            "大副：再会……启航吧！",
            "（顺着大副引领的路前进吧。）",
        )

    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(24)

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}