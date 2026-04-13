import PlayerUtil from "@/PlayerUtil";
import BaseUtil from "@/BaseUtil";
import MapRectUtil from "../../util/MapRectUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import {d_深度海域怪} from "../../xlsx/单位/深度海域怪";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import 海域工具 from "./海域工具";
import MapUtil from "../../util/MapUtil";
import RandomUtil from "@/RandomUtil";
import XlsxDataUtil from "@/XlsxDataUtil";

export default class 深度海域5 {

    units: unit[] = []

    /*
5、世外桃源
整个地形就是一个有很多支流的岛屿，不再阴暗，看上去很美好那种，可能需要一点其他图的二次元建模素材，反正就是一个好看的海岛。
有老人x1，男人x3，小孩x2，女人，狗x1，鸡x8，羊x5等在岸边站着，靠近触发对话，对话很重要。





之后在地图里面藏一个物品，真实之眼，描述：真实之眼似乎是有人故意抠下来的，呕，找到它的主人吧。
冷却10秒，可以对这些NPC使用，注意这些NPC和这个物品都不能A哈。
对其他人用，都是回答一个“？”
对女人用。

之后女人一个传送消失，其他单位变成红色紫色绿色的敌对，弹道是死亡缠绕，每秒攻击10次，每次攻击会降低目标10点三围。
全部击杀之后，玩家属性被清空为100点全属性，装备自带的不变。
怪物属性一致
攻击力：100000
护甲：3300
生命值：（玩家平均攻击力x5+100000）
不应该太难，主要是要把玩家属性打掉引起情绪共鸣。后面几关关其实是不需要属性的，但后续需要所以进入这里的属性需要记录哦。
杀死判定探索点，如果足够，直接一个黑屏+强制传送。
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
            if (RandomUtil.isInChance(0.01)) {
                let data: t_深度海域存档 = XlsxDataUtil.getDataById("血色之心");
                MapUtil.addUsersArchive(1, data.requireKey, data.name);
            }
            for (let unit of this.units) {
                if (UnitStateUtil.isAlive(unit)) {
                    return
                }
            }
            //全死了
            this.击杀完毕()
        }
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            UnitStateUtil.addUnitLifeByMaxLifeP(actor.unit, -0.01)
            event.consumed = true;
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
        PlayerUtil.message("鸡：嘎嘎！嘎\n" +
            "羊：哞哞！\n" +
            "狗：喵！喵喵", 20)
        BaseUtil.runLater(3, () => {
            PlayerUtil.message("小孩：爸爸妈妈真令人操心，以后的日子可怎么办。\n" +
                "男人：呜呜呜，日子没法过啦。\n" +
                "女人：无聊。\n" +
                "老人：桃源村真是太美好了，外地人，你觉得呢？", 20)
        })
        BaseUtil.runLater(6, () => {
            PlayerUtil.message("女人：……\n" +
                "女人：被发现了？你不应该发现的，你不知道你即将面对什么。\n" +
                "女人：你会害怕的，不是吗？", 20)
        })

    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(10)

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}