import ActorTypeUtil from "@/ActorTypeUtil";
import Actor from "@/Actor";
import ActorUtil from "@/ActorUtil";
import DialogUtil from "@/DialogUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import ActorBuff from "@/ActorBuff";
import ActorItem from "@/ActorItem";
import AttributeUtil from "@/AttributeUtil";
import TipFrameUtil from "@/TipFrameUtil";
import ActorUnit from "@/ActorUnit";
import MapUtil from "../../util/MapUtil";
import BaseUtil from "@/BaseUtil";
import PlayerUtil from "@/PlayerUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";

export default class 吞天石 {
    static banTunShi = ["重生十字章", "吞天石", "船长信件", "污染的航海器"]


    constructor() {

        let actorType = ActorTypeUtil.getActorType("吞天石");
        actorType.onAction = (actor, x, y, targetUnit) => {
            let actorItem: ActorItem = actor as ActorItem;
            let unitOwner = actor.unitOwner;
            if (!IsHandle(unitOwner)) {
                return;
            }
            let 最大吞噬数量 = 2 + (AttributeUtil.getPlayerAttribute(unitOwner, false)?.吞天石吞噬上限 || 0)
            if ((sd(unitOwner, true)?.吞天石吞噬数量 || 0) >= 最大吞噬数量) {
                actorItem.addUses(1);
                MouseFrameUtil.showFailText("吞噬数量到达上限!" + 最大吞噬数量, 1, unitOwner)
                return
            }
            let actorId: string[] = [];
            let actors: Actor[] = [];
            let unit = actor.unit;
            let allActorList: Actor[] = ActorUtil.getUnitAllActorList(unit);
            if (sd(unitOwner)?.assistant == actor.unit) {//宝宝吞吞
                PlayerUtil.forUsers(player => {
                    if (player == unitOwner) {
                        return
                    }
                    let hero = PlayerUtil.getHero(player);
                    let allActorAbilityList: Actor[] = ActorAbilityUtil.getUnitActorAbilityList(hero);
                    if (allActorAbilityList == null) {
                        return;
                    }
                    for (let tempActor of allActorAbilityList) {
                        if (actorId.includes(tempActor.actorTypeId)) {
                            continue
                        }
                        if (actorId.length > 9) {
                            return;
                        }
                        actorId.push(tempActor.actorTypeId);
                        allActorList.push(tempActor);
                    }
                });

            }
            actorId = [];

            for (let tempActor of allActorList) {

                //不要吞无敌
                if (吞天石.banTunShi.includes(tempActor.actorTypeId)) {
                    continue;
                }
                //宝宝使用
                if (tempActor instanceof ActorUnit) {
                    continue
                }
                if (tempActor instanceof ActorBuff) {
                    //已经吞噬过了的buff
                    if (tempActor.get("tag") == "进化继承") {
                        continue;
                    }
                    //不要吞噬 已经是永久的了 比如宝物啥的
                    if (tempActor.get("uiShowType") && tempActor.get("uiShowType") != "单位状态栏") {
                        continue;
                    }
                    if (tempActor.get("class") != "基础") {
                        continue;
                    }
                }
                if (ActorBuffUtil.isUnitHasActorBuff(MapUtil.getHeroByUnit(unit), tempActor.actorTypeId)) {
                    continue;
                }
                if (tempActor != actor && tempActor.get("dur", 0) == 0) {
                    actors.push(tempActor);
                    actorId.push(tempActor.getName());
                }
            }
            actorId.push("|cffff0000取消");
            //

            DialogUtil.show(actor.unitOwnerId, "吞天石吞噬选择:", (index, text) => {
                if (index >= actors.length) {
                    return
                }
                let heroByUnit = MapUtil.getHeroByUnit(unit);
                if (!IsHandle(heroByUnit)) {
                    BJDebugMsg("玩家英雄不存在！" + tostring(GetUnitName(unit)));
                    return
                }

                let targetActor = actors[index];
                //将演员物品 作为 演员buff 添加给单位
                if (ActorBuffUtil.isUnitHasActorBuff(heroByUnit, targetActor.actorTypeId)) {
                    MouseFrameUtil.showTipText("|cff00ff00不能重复吞噬!", 1, actor.unitOwner);
                    return
                }
                if (targetActor.unitOwner == unitOwner) {
                    targetActor.destroy();
                }

                let actorBuff = ActorBuffUtil.addActorBuff(heroByUnit, targetActor.actorTypeId);
                actorBuff.set("class", "吞噬");
                actorBuff.set("kind", "吞天石吞噬");
                actorBuff.set("tag", "进化继承");
                BaseUtil.runLater(0.2, () => {
                    actorBuff.level = targetActor.level;
                });
                if (actor.extData) {
                    for (let extDataKey in actor.extData) {
                        actorBuff.extData[extDataKey] = actor.extData[extDataKey];
                    }
                }
                MouseFrameUtil.showTipText("|cff00ff00吞噬成功!", 1, actor.unitOwner);
                //
                TipFrameUtil.showIconMoveIntoAnimation(targetActor.getIcon(), 0.55, 0.17, 0.08, 0.55, 0.5, unitOwner);
                //
                sd(unitOwner).吞天石吞噬数量 = (sd(unitOwner).吞天石吞噬数量 || 0) + 1;
                actorItem.addUses(-1);
                // //免得卡主
                // if (actorItem.getUses() <= 1) {
                //     actorItem.destroy();
                // }

            }, ...actorId);
            actorItem.addUses(1);

        }


    }


}