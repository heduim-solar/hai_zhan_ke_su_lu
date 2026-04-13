/**
 * @brief 恢复单位生命值
 */
import BaseUtil from "@/util/BaseUtil";
import GroupUtil from "@/util/unit/GroupUtil";


export default class UnitRegenLifeUtil {

    /**恢复指定单位的生命值*/
    public static regenUnitLife(whichUnit: unit, value: number, effectArt: string = "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdx") {
        if (effectArt != null) {
            let effectHandle: effect = AddSpecialEffect(effectArt, GetUnitX(whichUnit), GetUnitY(whichUnit));
            DestroyEffect(effectHandle);
        }
        let life: number = GetUnitState(whichUnit, UNIT_STATE_LIFE);
        let maxLife: number = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE);
        SetUnitState(whichUnit, UNIT_STATE_LIFE, math.min(life + value, maxLife));
    }

    /**恢复指定单位周围友军的生命值*/
    public static regenAllyUnitsLife(whichUnit: unit, value: number, isPercentage?: boolean, range?: number, casterArt?: string, effectArt?: string, duration?: number, interval?: number) {
        let effectHandle: effect = AddSpecialEffect(casterArt ?? '', GetUnitX(whichUnit), GetUnitY(whichUnit));
        DestroyEffect(effectHandle);
        let groupHandle: group = CreateGroup();
        let regenFunc: () => void = function () {
            GroupClear(groupHandle);
            if (range) {
                GroupEnumUnitsInRange(groupHandle, GetUnitX(whichUnit), GetUnitY(whichUnit), range, null);
            } else {
                GroupEnumUnitsInRect(groupHandle, bj_mapInitialPlayableArea, null);
            }
            GroupUtil.for(groupHandle, unitHandle => {
                if (IsUnitAlly(unitHandle, GetOwningPlayer(whichUnit)) && IsUnitAliveBJ(unitHandle)) {
                    let effectHandle: effect = AddSpecialEffect(effectArt ?? '', GetUnitX(unitHandle), GetUnitY(unitHandle));
                    DestroyEffect(effectHandle);
                    let maxLife: number = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE);
                    let life: number = GetUnitState(unitHandle, UNIT_STATE_LIFE);
                    let addLife: number = isPercentage ? (maxLife * value) : value;
                    SetUnitState(unitHandle, UNIT_STATE_LIFE, math.min(life + addLife, maxLife));
                }
            })
        }
        regenFunc();
        if (!duration || duration <= 0) {
            DestroyGroup(groupHandle);
            return;
        }
        let timeout: number = interval ?? 1.0;
        BaseUtil.onTimer(timeout, count => {
            regenFunc();
            if (timeout * count >= duration) {
                DestroyGroup(groupHandle);
                return false;
            }
            return true;
        })
    }
}