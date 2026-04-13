import ActorTypeUtil from "@/ActorTypeUtil";
import ActorItemUtil from "@/ActorItemUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import ActorItem from "@/ActorItem";

export default class 天工图 {


    constructor() {

        let actorType = ActorTypeUtil.getActorType("天工图");
        actorType.onAction = (actor, x, y, targetUnit) => {
            let targetItem = GetSpellTargetItem();
            let targetActorItem = ActorItemUtil.getActorItem(targetItem);
            if (targetActorItem == null) {
                (actor as ActorItem).addUses(1);
                MouseFrameUtil.showFailText("请选择一个核心部件!", 1, actor.unitOwner)
                return
            }
            if (targetActorItem.get("class") != "核心部件") {
                (actor as ActorItem).addUses(1);
                MouseFrameUtil.showFailText("请选择一个核心部件!", 1, actor.unitOwner)
                return
            }
            //
            // (actor as ActorItem).addUses(-1);
            targetActorItem.level++;
            targetActorItem.numberOverlay = targetActorItem.level;

        }
    }


}