import ActorAbilityUtil from "@/ActorAbilityUtil";
import SingletonUtil from "@/SingletonUtil";

export default class SolarActorAbilityState {
    constructor() {
        if (SingletonUtil.notFirstTime(SolarActorAbilityState)) {
            print("不能重复new SolarActorAbilityState()")
            return;
        }
        se.onUnitSpellCast(e => {
            ActorAbilityUtil.ifHasActorAbility(e.spellAbilityIdStr, (actor) => {
                if (actor.isPassive() || actor.isDisable()) {
                    IssueImmediateOrder(e.trigUnit, "stop")
                    return
                }
            })
        });
        se.onUnitSpellEffect(e => {
            //物品也是继承的技能 所以这里点击物品 也会走这个逻辑
            ActorAbilityUtil.ifHasActorAbility(e.spellAbilityIdStr, (actor) => {
                if (actor.isPassive() || actor.isDisable()) {
                    return
                }
                let targetUnit = GetSpellTargetUnit();
                let x = 0;
                let y = 0;
                if (IsHandle(targetUnit)) {
                    x = GetUnitX(targetUnit)
                    y = GetUnitY(targetUnit)
                } else {
                    x = GetSpellTargetX()
                    y = GetSpellTargetY()
                }
                actor.action(x, y, targetUnit);
            })
        });
    }
}