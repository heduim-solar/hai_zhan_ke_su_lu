import BaseUtil from "@/BaseUtil";
import AttributeUtil from "@/AttributeUtil";
import {Trigger} from "@/trigger";

declare global {
    interface AppPlayerAttribute {
        快速建造?: number
    }
}
export default class 快速建造 {


    constructor() {
        let trigger = new Trigger();
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_START)
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_START)
        trigger.addAction(() => {
            let triggerUnit = GetTriggerUnit();
            let player = GetOwningPlayer(triggerUnit);
            let playerAttr = AttributeUtil.getPlayerAttribute(player);
            if (playerAttr?.快速建造) {
                BaseUtil.runLater(0.01, () => {
                    UnitSetConstructionProgress(triggerUnit, 99);
                    UnitSetUpgradeProgress(triggerUnit, 99);
                })
            }
        })
    }


}