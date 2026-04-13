import ActorTypeUtil from "@/ActorTypeUtil";
import ActorItemUtil from "@/ActorItemUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import ActorItem from "@/ActorItem";
import ArrayUtil from "@/ArrayUtil";
import {d_核心部件} from "../../xlsx/装备/核心部件";

export default class 改造图 {


    constructor() {

        let actorType = ActorTypeUtil.getActorType("改造设计图");
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
            let randomElement = ArrayUtil.randomElement(d_核心部件);
            for (let i = 0; i < 1000; i++) {
                if (randomElement.id == targetActorItem.actorTypeId) {
                    randomElement = ArrayUtil.randomElement(d_核心部件);
                } else {
                    break
                }
            }
            //
            ActorItemUtil.addActorItemForUnit(randomElement.id, actor.unit)
            //
            targetActorItem.destroy();
            // (actor as ActorItem).addUses(-1);

        }
    }


}