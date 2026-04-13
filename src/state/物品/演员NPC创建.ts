import ActorUnitUtil from "@/ActorUnitUtil";
import {l_演员NPC} from "../../_sl_editor/l_演员NPC";
import {d_船长演员物品} from "../../xlsx/装备/船长演员物品";
import ActorTypeUtil from "@/ActorTypeUtil";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";
import {l_海上奇珍} from "../../_sl_editor/l_海上奇珍";
import PlayerUtil from "@/PlayerUtil";
import {d_核心部件} from "../../xlsx/装备/核心部件";
import BaseUtil from "@/BaseUtil";
import MapUtil from "../../util/MapUtil";
import ActorUnit from "@/ActorUnit";

export default class 演员NPC创建 {
    static 深海奇珍演员单位列表?: ActorUnit[] = []

    constructor() {

        let gjcz: AppActorUnitType = ActorTypeUtil.getActorType("高级船长");
        for (let i = 4; i < gjcz.sellItems.length; i++) {
            let sellingAbility = ActorTypeShopUtil.warpActorItem2SellingAbility(gjcz.sellItems[i]);
            if (MapUtil.getRealNanduLevel() <= (i + 1)) {
                sellingAbility.disable = true;
                sellingAbility.requiredTip = "难" + (i + 2);
            }
            if (MapUtil.getRealNanduLevel() <= i) {
                sellingAbility.hide = true;
            }
        }

        //禁用一下船长购买
        for (let data of d_船长演员物品) {
            let itemActorType = ActorTypeUtil.getActorType(data.id);
            if (itemActorType.class == "制作书") {
                continue
            }
            if (data.来源 == "购买") {
                continue
            }
            let sellingAbility = ActorTypeShopUtil.warpActorItem2SellingAbility(data.id).id;
            let actorType = ActorTypeUtil.getActorType(sellingAbility);
            actorType.disable = true;
            if (data.来源 && data.来源提示) {
                actorType.goldCost = null;
                actorType.requiredTip = data.来源 + "-" + data.来源提示
                actorType.describe = "来源:" + data.来源 + "|n" + data.来源提示 + " |n|n效果预览:|n" + itemActorType.describe;
            }
        }
        //禁用一下核心部件购买
        for (let data of d_核心部件) {
            let itemActorType = ActorTypeUtil.getActorType(data.id);
            let sellingAbility = ActorTypeShopUtil.warpActorItem2SellingAbility(data.id).id;
            let actorType = ActorTypeUtil.getActorType(sellingAbility);
            actorType.disable = true;
            actorType.goldCost = null;
            actorType.requiredTip = "海上奇珍抽奖获得!"
            actorType.describe = "来源: 海上奇珍抽奖获得!|n|n效果预览:|n" + itemActorType.describe;
        }
        //
        ActorTypeUtil.forAllActorTypes(actorType => {
            let sellingAbility = ActorTypeShopUtil.warpActorItem2SellingAbility(actorType.id);
            sellingAbility.onCreated = (actor) => {
                actor.getRootFrameControl().setNumberOverlayText(sellingAbility.goldCost + "")
            }
        }, "基础属性装备")

        // //
        let sellingAbilityTypeId = ActorTypeShopUtil.warpActorItem2SellingAbility("胶胶果实").id;
        let jjgsSAType = ActorTypeUtil.getActorType(sellingAbilityTypeId);
        jjgsSAType.onCreated = (actor) => {
            actor.numberOverlay = 4;
        }
        jjgsSAType.interval = 120;
        jjgsSAType.onUnitInterval = (actor) => {
            if (actor.numberOverlay < 5) {
                actor.numberOverlay++;
            }
        }


        //演员npc
        let vector: Vector = null;
        BaseUtil.runLater(gv.上手入门模式 ? 2 : 1, () => {
            vector = l_演员NPC[2];
            ActorUnitUtil.createActorUnit(Player(4), "基础船长", vector.x, vector.y)

            vector = l_演员NPC[1];
            ActorUnitUtil.createActorUnit(Player(4), "副炮", vector.x, vector.y)
        });


        BaseUtil.runLater(gv.上手入门模式 ? 120 : 1, () => {
            vector = l_演员NPC[0];
            ActorUnitUtil.createActorUnit(Player(4), "高级船长", vector.x, vector.y)
            vector = l_演员NPC[7];
            ActorUnitUtil.createActorUnit(Player(4), "船长合成提示", vector.x, vector.y)
            if (MapUtil.getRealNanduLevel() > 12) {
                vector = l_演员NPC[8];
                ActorUnitUtil.createActorUnit(Player(4), "船长合成提示2", vector.x, vector.y)
            }
            PingMinimap(vector.x, vector.y, 3)
        });


        if (settings.gameDifficulty >= 4) {
            vector = l_演员NPC[6];
            ActorUnitUtil.createActorUnit(Player(4), "核心部件预览", vector.x, vector.y)
            vector = l_演员NPC[9];
            ActorUnitUtil.createActorUnit(Player(4), "核心部件预览2", vector.x, vector.y)
        }

        //基础属性 演员npc


        BaseUtil.runLater(gv.上手入门模式 ? 2 : 1, () => {
            vector = l_演员NPC[10];
            ActorUnitUtil.createActorUnit(Player(4), "船头(力量)", vector.x, vector.y)
            vector = l_演员NPC[11];
            ActorUnitUtil.createActorUnit(Player(4), "船帆(敏捷)", vector.x, vector.y)
            vector = l_演员NPC[12];
            ActorUnitUtil.createActorUnit(Player(4), "桅杆(智力)", vector.x, vector.y)
        });

        vector = l_演员NPC[13];
        ActorUnitUtil.createActorUnit(Player(4), "炮弹(攻击)", vector.x, vector.y)


        BaseUtil.runLater(gv.上手入门模式 ? 2 : 1, () => {
            vector = l_演员NPC[14];
            ActorUnitUtil.createActorUnit(Player(4), "船身(生命)", vector.x, vector.y)
            vector = l_演员NPC[15];
            ActorUnitUtil.createActorUnit(Player(4), "甲板(护甲)", vector.x, vector.y)
            vector = l_演员NPC[16];
            ActorUnitUtil.createActorUnit(Player(4), "马达(移速)", vector.x, vector.y)
            vector = l_演员NPC[17];
            ActorUnitUtil.createActorUnit(Player(4), "修理工(恢复)", vector.x, vector.y)
        });


        //l_海上奇珍
        ActorTypeUtil.getActorType("海上奇珍").onCreated = (actor) => {
            演员NPC创建.深海奇珍演员单位列表.push(actor as any)
        }
        BaseUtil.runLater(gv.上手入门模式 ? 2 : 1, () => {
            vector = l_海上奇珍[0];
            ActorUnitUtil.createActorUnit(PlayerUtil.neutralPassivePlayer(), "海上奇珍", vector.x, vector.y)
            vector = l_海上奇珍[1];
            ActorUnitUtil.createActorUnit(PlayerUtil.neutralPassivePlayer(), "海上奇珍", vector.x, vector.y)
            vector = l_海上奇珍[2];
            ActorUnitUtil.createActorUnit(PlayerUtil.neutralPassivePlayer(), "海上奇珍", vector.x, vector.y)
            vector = l_海上奇珍[3];
            ActorUnitUtil.createActorUnit(PlayerUtil.neutralPassivePlayer(), "海上奇珍", vector.x, vector.y)
        });

    }


}