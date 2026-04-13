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

export default class 深度海域6 {

    units: unit[] = []

    /*
6、血色桃源
整个地形和5一模一样，但是很阴森恐怖，充满了污染和一些中立的怪物，之前的怪的模型找10个来就行。
触发玩家ID：原来这里的一切都是假的吗？
女人的声音：不，不全是，比如……
女人的声音：我就是真的。
然后女人出现，女人属性都是9999999999，反正看上去就是无敌的就行。
触发玩家ID：你想干什么！
女人：我们已经见过面了，我指的是，在你来到这片海域之前。
触发玩家ID：这里到底是哪里。
女人：哪里都不是，去找一些悲怆的记忆吧，带着它们，离开这里。
文字提示：从这里的怪物身上搜集悲怆记忆吧，站远些就没关系。
中立变敌对，但是怪物攻击是近战，正常来讲打不到玩家。
攻击力：999999999
护甲：3300
生命值：（玩家平均攻击力x5+100000）这里的怪物造成任意伤害都会掉1%的血。所以不用担心打不死。
击杀10个怪物之后，出现下一关的入口。
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
            if (RandomUtil.isInChance(0.02)) {
                let data: t_深度海域存档 = XlsxDataUtil.getDataById("污染之心");
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
        PlayerUtil.message(name + ":原来这里的一切都是假的吗\r\n" +
            "女人的声音：不，不全是，比如……\r\n" +
            "女人的声音：我就是真的。", 20)
        BaseUtil.runLater(3, () => {
            PlayerUtil.message(name + "：你想干什么！", 20)
        })
        BaseUtil.runLater(6, () => {


            PlayerUtil.message("女人：我们已经见过面了，我指的是，在你来到这片海域之前。", 20)
            PlayerUtil.message(name + "：这里到底是哪里。", 20)
            PlayerUtil.message("女人：哪里都不是，去找一些悲怆的记忆吧，带着它们，离开这里。", 20)
            PlayerUtil.message("(从这里的怪物身上搜集悲怆记忆吧，站远些就没关系)", 20)
        })

    }


    击杀完毕() {
        let name = GetPlayerName(PlayerUtil.firstOfUsers());
        海域工具.增加玩家探索积分(12)

        let vectors = MapRectUtil.getLine(gv.深度海域层数);
        let vector = vectors[vectors.length - 1];
        let actorUnit = ActorUnitUtil.createActorUnit(Player(4), "深海奇珍", vector.x, vector.y);


    }


}