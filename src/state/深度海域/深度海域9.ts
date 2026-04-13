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
import RandomUtil from "@/RandomUtil";

export default class 深度海域9 {

    units: unit[] = []

    /*
9、绝望的深海巨兽
BOSS关，但BOSS不会掉血。BOSS就是潮汐一模一样。地形有4个柱子在中间可以秦王绕柱，地宫的感觉。
触发的玩家ID：这里……充斥着让人不爽的气息。
未知的声音：啊……好难受……
触发的玩家ID：！！！
BOSS出现
绝望的深海巨兽：你们……变得和我一样吧！
触发BOSS战
BOSS数值
攻击力：100000（每次攻击附带20%的纯粹伤害）
射程：近战
护甲：99999
生命值：（100000000）
这个BOSS不会掉血的，但BOSS每次受到伤害会有1%概率在当前随机区域掉落一个希望的记忆，用希望的记忆打BOSS，每次11%生命最大值的真实伤害。希望的记忆描述：拥有希望的力量，和这里格格不入，似乎可以伤害到绝望的生物。
击杀后
深海巨兽：谢谢……
开启下一关的通道。
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
            let data: t_深度海域存档 = XlsxDataUtil.getDataById("深海巨兽的灵魂碎片");
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
        let v = line[4];
        let oneLoc = MapUtil.getOneWaterLocByXY(v.x, v.y);
        let actorUnit = ActorUnitUtil.createActorUnit(Player(11), actorUnitTypeId, oneLoc.x, oneLoc.y);
        MapUtil.根据难度数值加强怪物(actorUnit.unit);
        UnitStateUtil.addMaxLifeAndLife(actorUnit.unit, 平均攻击 * 10 * gv.深度海域层数)
        this.units.push(actorUnit.unit);


    }


    对话() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());

        海域工具.提示聊天信息(name + "：这里……充斥着让人不爽的气息。",
            "未知的声音：啊……好难受……",
            name + "：！！！",
            "绝望的深海巨兽：你们……变得和我一样吧！",
        )

    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(18)
        PlayerUtil.message("深海巨兽：谢谢……", 20)
        //

        //
        if (RandomUtil.isInChance(0.1)) {
            let data: t_深度海域存档 = XlsxDataUtil.getDataById("绝望之心");
            MapUtil.addUsersArchive(1, data.requireKey, data.name);
        }

        //
        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}