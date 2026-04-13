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

export default class 深度海域3 {

    units: unit[] = []

    /*
3、
进去之后有一根超大触手，整个环境衔接上一个格子。
无需多言，直接战斗。

红色触手
攻击力：100000（每次攻击附带80%的纯粹伤害）但攻速3秒一次，只打最近的单位。
射程：1200
护甲：3300
生命值：（玩家平均攻击力x30+500000）跟难度系数无关，反正肯定难得很。

文字提示：祂的宠物哀嚎了，祂有些烦躁。
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
        for (let i = 0; i < 1; i++) {
            let oneLoc = MapUtil.getOneWaterLoc(rect);
            let actorUnit = ActorUnitUtil.createActorUnit(Player(11), actorUnitTypeId, oneLoc.x, oneLoc.y);
            MapUtil.根据难度数值加强怪物(actorUnit.unit);
            UnitStateUtil.addMaxLifeAndLife(actorUnit.unit, 平均攻击 * 10 * gv.深度海域层数)
            this.units.push(actorUnit.unit);
        }


    }


    对话() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        PlayerUtil.message("祂的宠物哀嚎了，祂有些烦躁。", 20)


    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());

        海域工具.增加玩家探索积分(6)
        let data: t_深度海域存档 = XlsxDataUtil.getDataById("红色触手的灵魂碎片");
        MapUtil.addUsersArchive(1, data.requireKey, data.name)
        if (RandomUtil.isInChance(0.1)) {
            let data: t_深度海域存档 = XlsxDataUtil.getDataById("忠诚之心");
            MapUtil.addUsersArchive(1, data.requireKey, data.name)
        }
        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}