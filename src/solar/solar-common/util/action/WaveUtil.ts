/**
 * @brief 向前方发出一道波(剑气...)对经过的单位造成伤害
 */
import BaseUtil from "@/util/BaseUtil";
import GroupUtil from "@/util/unit/GroupUtil";


export default class WaveUtil {

    /**冲击波*/
    public static wave(whichUnit: unit, damageValue: number, art: string, maxDistance: number = 600.0, angle: number = GetUnitFacing(whichUnit), callback?: (u: unit, x: number, y: number) => void) {
        let triggerX: number = GetUnitX(whichUnit);
        let triggerY: number = GetUnitY(whichUnit);
        let effectHandle: effect = AddSpecialEffect(art, triggerX, triggerY);
        EXEffectMatRotateZ(effectHandle, angle);
        handle_ref(effectHandle);
        let groupHandle: group = CreateGroup();
        let damagedUnitGroup: group = CreateGroup();
        let delta: number = 20;
        let sumDistance: number = 0;
        handle_ref(whichUnit);
        BaseUtil.onTimer(0.02, () => {
            let x = EXGetEffectX(effectHandle) + delta * CosBJ(angle);
            let y = EXGetEffectY(effectHandle) + delta * SinBJ(angle);
            EXSetEffectXY(effectHandle, x, y);
            GroupClear(groupHandle);
            GroupEnumUnitsInRange(groupHandle, x, y, 128, null);
            GroupUtil.for(groupHandle, unitHandle => {
                if (IsUnitAliveBJ(unitHandle) && IsUnitEnemy(unitHandle, GetOwningPlayer(whichUnit)) && !IsUnitInGroup(unitHandle, damagedUnitGroup)) {
                    GroupAddUnit(damagedUnitGroup, unitHandle);
                    UnitDamageTarget(whichUnit, unitHandle, damageValue, false, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, null)
                }
            })
            sumDistance += delta;
            if (sumDistance >= maxDistance) {
                handle_unref(effectHandle);
                DestroyEffect(effectHandle);
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