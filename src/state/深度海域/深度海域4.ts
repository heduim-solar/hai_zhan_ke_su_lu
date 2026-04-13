import PlayerUtil from "@/PlayerUtil";
import BaseUtil from "@/BaseUtil";
import MapRectUtil from "../../util/MapRectUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import {d_深度海域怪} from "../../xlsx/单位/深度海域怪";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import 海域工具 from "./海域工具";
import MapUtil from "../../util/MapUtil";

export default class 深度海域4 {

    units: unit[] = []

    /*
4、迷宫
其实就是弯弯绕绕，但是只有一条路可以走，走个1分钟左右到终点。
路上时不时出现一些第一层一样的怪，每10秒出现一只，什么都不会给。
在路上加几个坐标，第一次经过坐标的时候弹出。
文字提示：心悸的感觉
文字提示：混乱的感觉
文字提示：不安……
文字提示：总觉得有不好的事情会发生。

文字提示：抵达终点，真的还要继续前进吗？
下一关的入口就在终点
     */
    constructor() {
        this.对话();
        BaseUtil.runLater(3, () => {
            this.刷怪();
        });


    }

    刷怪() {
        let rect = MapRectUtil.getRect(gv.深度海域层数);
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
        PlayerUtil.message("心悸的感觉", 20)
        PlayerUtil.message("混乱的感觉", 20)
        PlayerUtil.message("不安……", 20)
        PlayerUtil.message("总觉得有不好的事情会发生。。", 20)
    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        PlayerUtil.message("抵达终点，真的还要继续前进吗？", 20)
        海域工具.增加玩家探索积分(8)

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}