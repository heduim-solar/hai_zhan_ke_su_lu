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

export default class 深度海域13 {

    units: unit[] = []

    /*
13、不敢去的地方。
进入副本后，之前丢掉的属性先加回来，变回英雄。这个地形是一个封闭的石洞的感觉，中间有一个不断刷怪的遗忘者，周围带4个无敌的触手可以不理。刷的都是外星堡垒，每损失10%的生命值，刷新一批48个出来，爽刷一波。
文字提示：失去的力量似乎回归了，去给大副报仇吧！
遗忘者不会攻击，只有护甲和血量。BOSS名字是古老者
护甲：3300
生命值：（玩家平均攻击力x100+1000000）
古老者：……！！！
击杀后，出现下一关的入口。
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
            let data: t_深度海域存档 = XlsxDataUtil.getDataById("古老者的灵魂碎片");
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
            "（失去的力量似乎回归了，去给大副报仇吧！）",
        )


    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(26)
        海域工具.提示聊天信息(
            "古老者：……！！！",
        )
        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}