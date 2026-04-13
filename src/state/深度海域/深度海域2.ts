import PlayerUtil from "@/PlayerUtil";
import BaseUtil from "@/BaseUtil";
import MapRectUtil from "../../util/MapRectUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import {d_深度海域怪} from "../../xlsx/单位/深度海域怪";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import 海域工具 from "./海域工具";
import MapUtil from "../../util/MapUtil";

export default class 深度海域2 {

    units: unit[] = []

    /*
2、
进去之后有6根触手，触发对话。整个环境是海底遗迹门外那种。（遗失的记忆第二章进第三章那个门口）就是遗迹外围的感觉。
触发玩家的ID：这里是什么地方？
之后触手连线一个魔法阵出来。
触发玩家的ID：看来得干掉他们了。
触手需要攻击100次击碎，他们不会攻击人。
全部击杀之后，中间出现一个魔法阵，提示所有玩家进入，进入后。
文字提示：获得了莫名的关注，感觉有些背脊发凉。
之后出现下一关的入口。
     */
    constructor() {
        this.对话();
        BaseUtil.runLater(3, () => {
            this.刷怪();
        });


    }

    刷怪() {
        let rect = MapRectUtil.getRect(gv.深度海域层数);
        let actorUnitTypeId = d_深度海域怪[1].id;
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
        for (let i = 0; i < 6; i++) {
            let oneLoc = MapUtil.getOneWaterLoc(rect);
            let actorUnit = ActorUnitUtil.createActorUnit(Player(11), actorUnitTypeId, oneLoc.x, oneLoc.y);
            MapUtil.根据难度数值加强怪物(actorUnit.unit);
            UnitStateUtil.addMaxLifeAndLife(actorUnit.unit, 平均攻击 * 10 * gv.深度海域层数)
            this.units.push(actorUnit.unit);
        }


    }


    对话() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        PlayerUtil.message(name + "：这里是什么地方？ ", 20)

        BaseUtil.runLater(3, () => {
            PlayerUtil.message(name + "：看来得干掉他们了。", 20)
        });
    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        PlayerUtil.message(name + "：获得了莫名的关注，感觉有些背脊发凉。", 20)

        海域工具.增加玩家探索积分(4)

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}