import ActorTypeUtil from "@/ActorTypeUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import ActorItem from "@/ActorItem";
import PlayerUtil from "@/PlayerUtil";
import ActorFrameUtil from "@/ActorFrameUtil";
import TipFrameUtil from "@/TipFrameUtil";
import MapUtil from "../../util/MapUtil";
import TextUtil from "@/TextUtil";
import Actor from "@/Actor";

export default class 吞噬基础装备 {


    constructor() {


        ActorTypeUtil.forAllActorTypes(actorType => {
            if (actorType.name.indexOf("修理工") >= 0) {
                return
            }
            let tsJB = 0;
            if (actorType.name.indexOf("Lv10") >= 0) {
                tsJB = 100000;
            } else if (actorType.name.indexOf("Lv9") >= 0) {
                tsJB = 30000;
            }
            if (tsJB < 1) {
                return;
            }

            let tsJBCnUnit = TextUtil.toCnUnit(tsJB);
            actorType.describe = actorType.describe + "|n|n|cffcccccc(点击消耗" + tsJBCnUnit + "金币吞噬此装备)|r|n";
            actorType.passive = false;
            actorType.onAction = (actor, x, y, targetUnit) => {
                if (ActorBuffUtil.isUnitHasActorBuff(actor.unit, actor.tsJB)) {
                    MouseFrameUtil.showFailText("你已经吞噬过此物品了!", 1, actor.unitOwner)
                    return
                }
                if (!PlayerUtil.hasEnoughState(actor.unitOwner, tsJB)) {
                    ActorFrameUtil.showFailText(actor, "金币不足！需要" + tsJBCnUnit, 1, actor.unitOwner)
                    return;
                }
                PlayerUtil.costEnoughState(actor.unitOwner, tsJB);

                let actorItem: Actor = actor as ActorItem;
                //
                TipFrameUtil.showIconMoveIntoAnimation(actorItem.getIcon(), 0.55, 0.17, 0.08, 0.55, 0.5, actor.unitOwner);
                //将演员物品 作为 演员buff 添加给单位
                let actorBuff = ActorBuffUtil.addActorBuff(MapUtil.getHeroByUnit(actor.unit), actorItem.actorTypeId);
                actorBuff.set("class", "吞噬")
                actorBuff.set("tag", "进化继承")
                MouseFrameUtil.showTipText("|cff00ff00吞噬成功!", 1, actor.unitOwner)
                //销毁
                actorItem.destroy();
            }
        }, "基础属性装备");


    }


}