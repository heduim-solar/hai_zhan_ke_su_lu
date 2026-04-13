import ActorTypeUtil from "@/ActorTypeUtil";
import ActorItemUtil from "@/ActorItemUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import ActorItem from "@/ActorItem";
import ActorBuffUtil from "@/ActorBuffUtil";
import AttributeUtil from "@/AttributeUtil";
import MapModel from "../../MapModel";
import ActorTypeShopUtil from "@/ActorTypeShopUtil";
import TipFrameUtil from "@/TipFrameUtil";
import MapUtil from "../../util/MapUtil";

export default class 船长信件 {


    constructor() {

        let actorType = ActorTypeUtil.getActorType("船长信件");
        if (settings.gameDifficulty < 3 && settings.gameMode == MapModel.模式1_普通模式) {
            let actorAbilityType = ActorTypeShopUtil.warpActorItem2SellingAbility(actorType.id);
            actorAbilityType.disable = true;
            actorAbilityType.requiredTip = "难3"
            if (settings.gameDifficulty < 2) {
                actorAbilityType.hide = true;
            }
        }
        actorType.onAction = (actor, x, y, targetUnit) => {
            let actorItem: ActorItem = actor as ActorItem;
            let targetItem = GetSpellTargetItem();
            let targetActorItem = ActorItemUtil.getActorItem(targetItem);
            if (targetActorItem == null) {
                actorItem.addUses(1)
                MouseFrameUtil.showFailText("请选择一个船长物品!", 1, actor.unitOwner)
                return
            }
            if (targetActorItem.actorType.class != "基础船长" && targetActorItem.actorType.class != "船长（高级）" && targetActorItem.actorType.class != "船长（顶级）") {
                actorItem.addUses(1)
                MouseFrameUtil.showFailText("请选择一个船长物品!", 1, actor.unitOwner)
                return
            }
            if (ActorBuffUtil.isUnitHasActorBuff(actor.unit, targetActorItem.actorTypeId)) {
                actorItem.addUses(1)
                MouseFrameUtil.showFailText("你已经吞噬过此船长了!", 1, actor.unitOwner)
                return
            }

            let 最大吞噬数量 = 2 + (AttributeUtil.getPlayerAttribute(actor.unitOwner, false)?.吞噬船长上限 || 0)
            if ((sd(actor.unitOwner).船长信件吞噬数量 || 0) >= 最大吞噬数量) {
                actorItem.addUses(1)
                MouseFrameUtil.showFailText("你已经吞噬了" + 最大吞噬数量 + "个船长了!不能再吞噬了!", 1, actor.unitOwner)
                return
            }
            sd(actor.unitOwner).船长信件吞噬数量 = (sd(actor.unitOwner).船长信件吞噬数量 || 0) + 1;
            TipFrameUtil.showIconMoveIntoAnimation(actor.getIcon(), 0.55, 0.17, 0.08, 0.55, 0.5, actor.unitOwner);
            //销毁
            targetActorItem.destroy();

            //将演员物品 作为 演员buff 添加给单位
            let actorBuff = ActorBuffUtil.addActorBuff(MapUtil.getHeroByUnit(actor.unit), targetActorItem.actorTypeId);
            actorBuff.set("class", "吞噬");
            actorBuff.set("kind", "船长信件吞噬");
            actorBuff.set("tag", "进化继承");
            MouseFrameUtil.showTipText("|cff00ff00吞噬成功!", 1, actor.unitOwner);
            //

        }


    }


}