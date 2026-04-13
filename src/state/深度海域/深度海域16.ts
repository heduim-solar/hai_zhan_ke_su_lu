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
import PlatUtil from "@/PlatUtil";

export default class 深度海域16 {

    units: unit[] = []

    /*
16、空王座
一条向上的路，玩家传送进去的时候是在最下面要往上走，路的两边是各种中立怪物。尽头是王座，空的。
到尽头后，触发对话。
未知的声音：她在引领你们，而你们却毫不知情。
触发玩家的ID：谁在讲话？
未知的声音：无知的人无法见到我，你们也永远无法离开这里，除非……
触发玩家的ID：除非？
未知的声音：帮我个忙。
未知的声音：前往深空星海……这对你们有些困难。你们无法呼吸。
触发玩家的ID：你可能在说骚话。
未知的声音：我可以帮你们解决这个问题，并且给予一些奖励，但你们也要帮我解决一个家伙。
触发玩家的ID：解决谁？
未知的声音：一个邪恶的家伙，比我邪恶无数倍……
文字提示：获得了神话权柄+1。获得了在深空星海呼吸的能力。
王座背后出现下一关的入口。（假的）
进去的时候，女人传送出现。
女人：再往前走，既是坟墓……
未知的声音：你还要干预？
女人：选择权在你们。
出现弹窗。
1、去（消耗探索点1，开启新篇章）
2、不去（不去会结算，但结算神话权柄数量+1）
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

        // 王座背后出现下一关的入口。（假的）
        // 进去的时候，女人传送出现。
        // 女人：再往前走，既是坟墓……
        // 未知的声音：你还要干预？
        // 女人：选择权在你们。
        海域工具.提示聊天信息(
            "未知的声音：她在引领你们，而你们却毫不知情。",
            name + "：谁在讲话？",
            "未知的声音：无知的人无法见到我，你们也永远无法离开这里，除非……",
            name + "：除非？",
            "未知的声音：帮我个忙。",
            "未知的声音：前往深空星海……这对你们有些困难。你们无法呼吸。",
            name + "你可能在说骚话。",
            "未知的声音：我可以帮你们解决这个问题，并且给予一些奖励，但你们也要帮我解决一个家伙。",
            name + "：解决谁？",
            "未知的声音：一个邪恶的家伙，比我邪恶无数倍……",
            "(获得了神话权柄+1。获得了在深空星海呼吸的能力。)",
        )

    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(32);
        let data: t_历史中的战舰碎片 = XlsxDataUtil.getDataById("神话权柄");
        PlayerUtil.forUsers(player => {
            PlatUtil.addStoreInt(player, data.requireKey, 1);
        });

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);

        PlayerUtil.message("|cffff0000【深海已探索完毕(现版本)】深空星海。。。待续。。。。");


    }


}