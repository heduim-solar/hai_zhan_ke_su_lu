/**
 * @brief 投掷一个物体(石头...)对目标单位造成伤害
 */
import BaseUtil from "@/util/BaseUtil";
import MathUtil from "@/util/math/MathUtil";
import VestUtil from "@/util/unit/VestUtil";


export default class ThrowUtil {

    /**投掷物体*/
    public static throw(whichUnit: unit, targetUnit: unit, damageValue: number, missileart?: string, callback?: (u1: unit, u2: unit) => void): void {
        let triggerX: number = GetUnitX(whichUnit);
        let triggerY: number = GetUnitY(whichUnit);
        let targetX: number = GetUnitX(targetUnit);
        let targetY: number = GetUnitY(targetUnit);
        let distance: number = MathUtil.distanceBetweenPoints(triggerX, triggerY, targetX, targetY);
        let angle: number = MathUtil.angleBetweenCoords(triggerX, triggerY, targetX, targetY);
        let model: string = missileart ?? 'Abilities\\Weapons\\Dryadmissile\\Dryadmissile.mdl';
        let vestHandle: unit = VestUtil.SunCreateVestByUnit(whichUnit, triggerX, triggerY, model, 1, 0);
        SetUnitFacing(vestHandle, angle);
        UnitAddAbility(vestHandle, 'Amrf');
        UnitRemoveAbility(vestHandle, 'Amrf');
        handle_ref(vestHandle);
        let throwDistance: number = 0;
        let delta: number = 20;
        handle_ref(whichUnit);
        handle_ref(targetUnit);
        BaseUtil.onTimer(0.02, () => {
            let x: number = GetUnitX(vestHandle) + delta * CosBJ(angle);
            let y: number = GetUnitY(vestHandle) + delta * SinBJ(angle);
            SetUnitPosition(vestHandle, x, y);
            throwDistance += delta;
            let height: number = (- 1600 / (distance * distance)) * (throwDistance - distance) * throwDistance;
            SetUnitFlyHeight(vestHandle, height, 999999.00);
            if (throwDistance >= distance) {
                handle_unref(vestHandle);
                RemoveUnit(vestHandle);
                if (IsUnitAliveBJ(targetUnit) && IsUnitEnemy(targetUnit, GetOwningPlayer(whichUnit))) {
                    UnitDamageTarget(whichUnit, targetUnit, damageValue, false, false, ATTACK_TYPE_MAGIC, DAMAGE_TYPE_SONIC, null);
                }
                if (callback) {
                    callback(whichUnit, targetUnit);
                }
                handle_unref(whichUnit);
                handle_unref(targetUnit);
                return false;
            }
            return true;
        });
    }
}