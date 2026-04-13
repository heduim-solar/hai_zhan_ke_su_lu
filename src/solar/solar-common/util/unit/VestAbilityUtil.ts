import VestUtil from "@/VestUtil";
import PlayerUtil from "@/PlayerUtil";
import TargetType from "@/TargetType";

/**
 * 马甲技能工具
 *
 * 封装 创建马甲并添加技能 然后命令马甲释放
 *
 */
export default class VestAbilityUtil {


    /**
     * 变形术
     * 变羊
     * polymorph
     */
    static polymorph(target: unit, dur: number) {
        let vest = VestUtil.createVest(PlayerUtil.neutralPassivePlayer(), GetUnitX(target), GetUnitY(target));
        const abilityId = "ACpy";
        UnitAddAbility(vest, abilityId)
        let ability = EXGetUnitAbility(vest, abilityId);
        //最大等级限制
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, 1000)
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DUR, dur)
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_HERODUR, dur)
        EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_TARGS, TargetType.notself)
        IncUnitAbilityLevel(vest, abilityId)
        DecUnitAbilityLevel(vest, abilityId)
        IssueTargetOrder(vest, "polymorph", target)
    }

    /**
     *
     * @param source
     * @param target
     * @param damage
     * @param targetCountMax
     * @param area
     * @param damageAttenuation
     */
    static lightningChain(source: unit, target: unit, damage: number, targetCountMax: number = 4, area: number = 1000, damageAttenuation = 0.1) {
        let vest = VestUtil.createVest(GetOwningPlayer(source), GetUnitX(source), GetUnitY(source));
        const abilityId = "ACcl";
        UnitAddAbility(vest, abilityId)
        let ability = EXGetUnitAbility(vest, abilityId);
        //最大等级限制
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, damage)
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, targetCountMax)
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, damageAttenuation)
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_AREA, area)
        IncUnitAbilityLevel(vest, abilityId)
        DecUnitAbilityLevel(vest, abilityId)
        IssueTargetOrder(vest, "chainlightning", target)
    }


}