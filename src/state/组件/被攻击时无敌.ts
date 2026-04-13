import Actor from "@/Actor";
import UnitStateUtil from "@/UnitStateUtil";
import BaseUtil from "@/BaseUtil";
import TextTagUtil from "@/TextTagUtil";

export default class 被攻击时无敌 {


    onUnitDamaged(actor: Actor, damageSource: unit, event: AppDamageEvent): void {
        actor.ifReady(45, () => {
            let unit = actor.unit;
            UnitStateUtil.setInvulnerable(unit, true)
            TextTagUtil.text("无敌30秒!(冷却45秒)", actor.unit)
            BaseUtil.runLater(30, () => {
                UnitStateUtil.setInvulnerable(unit, false)
            });
        }, "被攻击时无敌")

    }


}