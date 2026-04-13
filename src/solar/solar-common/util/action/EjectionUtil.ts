/**
 * @brief (还有问题)
 */
import BaseUtil from "@/util/BaseUtil";
import MathUtil from "@/util/math/MathUtil";
import VestUtil from "@/util/unit/VestUtil";


export default class EjectionUtil {

    /**弹射*/
    public static ejection(whichUnit: unit, targetUnit: unit, model: string) {
        let triggerX: number = GetUnitX(whichUnit);
        let triggerY: number = GetUnitY(whichUnit);
        let vestHandle: unit = VestUtil.SunCreateVestByUnit(whichUnit, triggerX, triggerY, model, 1, 0);
        handle_ref(vestHandle);
        handle_ref(whichUnit);
        handle_ref(targetUnit);
        let v: number = 10.0;
        let i: number = 10;
        let max: number = 500;
        BaseUtil.onTimer(0.02, count => {
            max--;
            let vestX: number = GetUnitX(vestHandle);
            let vestY: number = GetUnitY(vestHandle);
            let targetX: number = GetUnitX(targetUnit);
            let targetY: number = GetUnitY(targetUnit);
            let angle: number = MathUtil.angleBetweenCoords(vestX, vestY, targetX, targetY);
            let x: number = vestX + 30.0 * CosBJ(angle);
            let y: number = vestY + 30.0 * SinBJ(angle);
            SetUnitFacing(vestHandle, angle);
            SetUnitPosition(vestHandle, x, y);
            let distance: number = MathUtil.distanceBetweenPoints(x, y, targetX, targetY);
            if (distance <= 50.0) {
                i--;
                if (i > 0) {
                    UnitDamageTargetBJ(whichUnit, targetUnit, v, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL);
                    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", targetUnit, "chest"));
                    SetUnitLifeBJ(whichUnit, (GetUnitState(whichUnit, UNIT_STATE_LIFE) + (0.03 * (GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) - GetUnitState(whichUnit, UNIT_STATE_LIFE)))));
                }

            }
            return true;
        })
    }
}