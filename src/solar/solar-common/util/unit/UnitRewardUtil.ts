import AttributeUtil from "@/AttributeUtil";

/**
 * 单位奖励工具
 */
export default class UnitRewardUtil {


    /**
     * 给单位所属玩家增加金币 并计算单位拥有的金币获取效率属性 返回计算后的实际增加金币值
     * @param unit
     * @param value 基础金币
     */
    static addGoldWithEarnGoldP(unit: unit, value: number): number {
        let unitAttribute = AttributeUtil.getUnitAttribute(unit, false);
        if (unitAttribute?.earn_gold_p) {
            value = value * (1 + unitAttribute.earn_gold_p);
        }
        let player = GetOwningPlayer(unit);
        value = Math.floor(value);
        if (value != 0) {
            SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) + value);
        }
        return value;
    }
}