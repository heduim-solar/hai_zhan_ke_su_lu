/**
 * @brief 向前方冲撞对经过的单位造成伤害
 */
import BaseUtil from "@/util/BaseUtil";
import GroupUtil from "@/util/unit/GroupUtil";


export default class ImpactUtil {

    /**冲撞*/
    public static impact(whichUnit: unit, damageValue: number, maxDistance: number = 600.0, angle: number = GetUnitFacing(whichUnit), callback?: (u: unit, x: number, y: number) => void) {
        let groupHandle: group = CreateGroup();
        let damagedUnitGroup: group = CreateGroup();
        let delta: number = 20;
        let sumDistance: number = 0;
        handle_ref(whichUnit);
        SetUnitPathing(whichUnit, false);
        BaseUtil.onTimer(0.02, () => {
            let x: number = GetUnitX(whichUnit) + delta * CosBJ(angle);
            let y: number = GetUnitY(whichUnit) + delta * SinBJ(angle);
            if (!IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                SetUnitPosition(whichUnit, x, y);
            }
            GroupClear(groupHandle);
            GroupEnumUnitsInRange(groupHandle, x, y, 128, null);
            GroupUtil.for(groupHandle, unitHandle => {
                if (IsUnitAliveBJ(unitHandle) && IsUnitEnemy(unitHandle, GetOwningPlayer(whichUnit)) && !IsUnitInGroup(unitHandle, damagedUnitGroup)) {
                    GroupAddUnit(damagedUnitGroup, unitHandle);
                    UnitDamageTarget(whichUnit, unitHandle, damageValue, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, null);
                }
            });
            sumDistance += delta;
            if (sumDistance >= maxDistance) {
                SetUnitPathing(whichUnit, true);
                if (callback) {
                    callback(whichUnit, x, y);
                }
                handle_unref(whichUnit);
                DestroyGroup(groupHandle);
                DestroyGroup(damagedUnitGroup);
                return false;
            }
            return true;
        });
    }
}