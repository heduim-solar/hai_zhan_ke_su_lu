import PlayerUtil from "@/PlayerUtil";
import BaseUtil from "@/BaseUtil";
import MapRectUtil from "../../util/MapRectUtil";
import ActorUnitUtil from "@/ActorUnitUtil";
import {d_深度海域怪} from "../../xlsx/单位/深度海域怪";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import 海域工具 from "./海域工具";
import MapUtil from "../../util/MapUtil";

export default class 深度海域15 {

    units: unit[] = []

    /*
15、拉莱耶遗迹。
洞穴+遗迹+废墟的风格。一条主路，6条分路，主路尽头是下一关的入口，但是门锁住的，必须杀死分路的6个BOSS才能往前走。
BOSS属性递增10%。
攻击力：200000（每次攻击附带目标20%生命最大值的伤害）
护甲：3300
生命值：（玩家平均攻击力x100+1000000）（每次至多受到3%生命最大值的伤害）
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
        let v = line[3];
        let oneLoc = MapUtil.getOneWaterLocByXY(v.x, v.y);
        let actorUnit = ActorUnitUtil.createActorUnit(Player(11), actorUnitTypeId, oneLoc.x, oneLoc.y);
        MapUtil.根据难度数值加强怪物(actorUnit.unit);
        UnitStateUtil.addMaxLifeAndLife(actorUnit.unit, 平均攻击 * 10 * gv.深度海域层数)
        this.units.push(actorUnit.unit);


    }


    对话() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());


    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(30)

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}