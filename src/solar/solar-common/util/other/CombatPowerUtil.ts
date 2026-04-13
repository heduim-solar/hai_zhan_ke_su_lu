import UnitStateUtil from "../unit/UnitStateUtil";
import GroupUtil from "../unit/GroupUtil";

/**
 * 战力工具
 */
export default class CombatPowerUtil {


    /**
     * 获取玩家战力
     * 支持异步调用
     */
    static getPlayerCombatPower(playerIndex: number): number {
        let cp = 0;
        GroupClear(_tempGroup)
        GroupEnumUnitsOfPlayer(_tempGroup, Player(playerIndex), null)
        let assistant = db.getPlayerSolarData(Player(playerIndex)).assistant
        GroupUtil.for(_tempGroup, (u) => {
            if (assistant == u) {
                return
            }
            if (UnitStateUtil.getDamageMax(u) <= 1) {//不统计无攻击力的 可能是宝宝助手
                return
            }
            cp += CombatPowerUtil.getUnitCombatPower(u);
        });
        return cp;
    }

    /**
     * 获取单位(/或者英雄)战力
     */
    static getUnitCombatPower(u: unit): number {
        let cp = 0;
        //以生命值为参照数值标准
        cp += UnitStateUtil.getMaxLife(u) / 10;
        // cp += UnitStateUtil.getMaxMana(u) / 10;
        //dps
        let aspd = UnitStateUtil.getAttackSpeed(u);
        let dc = UnitStateUtil.getDamageCool(u);
        let dmgMax = UnitStateUtil.getDamageMax(u);
        if (aspd > 0 && dc > 0 && dmgMax > 0) {// 建筑等无攻击的单位 不要计算攻击战力加成
            cp += dmgMax * (aspd / dc);
        }
        cp += UnitStateUtil.getArmor(u) * 10;
        cp += UnitStateUtil.getMoveSpeed(u);
        if (IsUnitType(u, UNIT_TYPE_HERO)) {
            cp += GetHeroStr(u, true);
            cp += GetHeroAgi(u, true);
            cp += GetHeroInt(u, true);
        }
        return Math.floor(cp);
    }


}