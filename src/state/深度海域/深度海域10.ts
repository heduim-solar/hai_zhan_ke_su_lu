import PlayerUtil from "@/PlayerUtil";
import BaseUtil from "@/BaseUtil";
import MapRectUtil from "../../util/MapRectUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import {d_深度海域怪} from "../../xlsx/单位/深度海域怪";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import 海域工具 from "./海域工具";
import MapUtil from "../../util/MapUtil";

export default class 深度海域10 {

    units: unit[] = []

    /*
10、逆流。
一条路，抵达终点，周围弄一些触手这种吓唬人，不会攻击。会有330移速的反向推力。顶着推力到达终点即可。
文字提示：逆水行舟，不进则退。
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


    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(20);

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}