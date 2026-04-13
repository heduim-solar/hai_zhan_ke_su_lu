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
import PlatUtil from "@/PlatUtil";
import MapModel from "../../MapModel";

export default class 深度海域1 {

    units: unit[] = []

    /*
    1，
    起点，进去之后有一艘沉船在中间，触发对话。整个环境是洞窟那种。
破碎的木船：你……怎么也到这里来了？
破碎的木船：！！！
破碎的木船：快走啊！

震动，周围出现12搜船。
数值：就是玩家的模型里面找一些船，但是是黑色。
攻击力：100000（每次攻击附带5%的纯粹伤害），但是主炮随机，有可能随机到很恶心的一些船（好做的话，不好做那就每秒1次算了）
护甲：3300
生命值：（玩家平均攻击力x10+200000）跟难度系数无关，反正肯定难得很。

击杀后
触发玩家的ID：他们莫非是……此前到过这里的船长们？如果不小心，我们也会成为他们的一员吧。
之后出现下一关的入口
     */
    constructor() {
        this.对话();
        BaseUtil.runLater(3, () => {
            this.刷怪();
        });


    }

    刷怪() {
        let rect = MapRectUtil.getRect(gv.深度海域层数);
        let actorUnitTypeId = d_深度海域怪[0].id;
        let actorType = ActorTypeUtil.getActorType(actorUnitTypeId);
        let 已掉数量 = 0;
        actorType.onUnitDeath = (actor, killingUnit) => {
            //
            if (RandomUtil.isInChance(0.15)
                || (settings.gameMode == MapModel.模式2_寄生模式 && 已掉数量 < 1)
                || (settings.gameMode == MapModel.模式3_献祭模式 && 已掉数量 < 2)
                || (settings.gameMode == MapModel.模式4_真实难度 && 已掉数量 < 3)
            ) {
                let data: t_历史中的战舰碎片 = XlsxDataUtil.getDataById("历史中的战舰碎片");
                已掉数量++;
                PlayerUtil.forUsers(player => {
                    let flag = PlatUtil.addStoreInt(player, data.requireKey, 1);
                    if (flag == false) {
                        PlayerUtil.message("|cffffff00【存档规则提示】每局战舰碎片最多5！每天战舰碎片最多50。超过会保存失败！", 10, player)
                    }
                });
                PlayerUtil.message("|cff00ff00【存档】获得" + data.name + "+" + 1)
            }

            //
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

        for (let i = 0; i < 12; i++) {
            let oneLoc = MapUtil.getOneWaterLoc(rect);
            let actorUnit = ActorUnitUtil.createActorUnit(Player(11), actorUnitTypeId, oneLoc.x, oneLoc.y);
            MapUtil.根据难度数值加强怪物(actorUnit.unit);
            this.units.push(actorUnit.unit);
            UnitStateUtil.addMaxLifeAndLife(actorUnit.unit, 平均攻击 * 10 * gv.深度海域层数)
        }


    }


    对话() {
        PlayerUtil.message("破碎的木船：你……怎么也到这里来了？", 20)
        PlayerUtil.message("破碎的木船：！！！", 20)
        PlayerUtil.message("破碎的木船：快走啊！", 20)
    }


    击杀完毕() {
        海域工具.增加玩家探索积分(2)
        PlayerUtil.message(GetPlayerName(PlayerUtil.firstOfUsers()) + "：他们莫非是……此前到过这里的船长们？如果不小心，我们也会成为他们的一员吧。", 20)

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vectors[2].x, vectors[2].y);

    }


}