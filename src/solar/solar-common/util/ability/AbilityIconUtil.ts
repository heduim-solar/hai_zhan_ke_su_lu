import LangUtil from "@/LangUtil";
import ObjectDataUtil from "@/ObjectDataUtil";
import AsyncUtil from "@/AsyncUtil";
import AbilityUtil from "@/AbilityUtil";
import Cache from "@/Cache";
import SelectUtil from "@/SelectUtil";
import {Frame} from "@/frame";
import AbilityButtonUtil from "@/AbilityButtonUtil";
import IconUtil from "@/IconUtil";

export default class AbilityIconUtil {

    /** 金色的64*64的钩子图标 */
    static tickPath = "UI\\Widgets\\Glues\\GlueScreen-Checkbox-Check.blp"

    /** 浅色半透明 */
    static background = "UI\\Widgets\\ToolTips\\Human\\human-tooltip-background.blp"


    private static cache: Cache = new Cache();

    /**
     * 只能对64x64大小的blp图片进行操作
     * @param abilityId
     * @param player
     */
    static addTick2AbilityIconForPlayer(abilityId: string | number, player: player) {
        let playerUnits = SelectUtil.getPlayerUnits(GetPlayerId(player));
        for (let playerUnit of playerUnits) {
            if (GetUnitAbilityLevel(playerUnit, abilityId) > 0) {
                AbilityIconUtil.addTick2AbilityIcon(abilityId, playerUnit);
            }
        }
    }

    /**
     * 只能对64x64大小的blp图片进行操作
     * @param abilityId
     * @param unit
     */
    static addTick2AbilityIcon(abilityId: string | number, unit: unit) {
        if (GetOwningPlayer(unit) == GetLocalPlayer()) {
            //
            let abilityIdStr = LangUtil.getStringId(abilityId)
            let abilityArt = AbilityUtil.getUnitAbilityArt(unit, abilityIdStr);
            let tickPath_background = IconUtil.blendIcon(AbilityIconUtil.tickPath, AbilityIconUtil.background)
            let resultPath = IconUtil.blendIcon(tickPath_background, abilityArt)
            EXSetAbilityDataString(EXGetUnitAbility(unit, abilityId), 1, ABILITY_DATA_ART, resultPath)
        }
        IncUnitAbilityLevel(unit, abilityId)
        DecUnitAbilityLevel(unit, abilityId)
    }


}