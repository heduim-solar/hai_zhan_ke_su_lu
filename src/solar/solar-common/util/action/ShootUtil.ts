/**
 * @brief 射击一个物体(箭矢...)对目标单位造成伤害
 */
import BaseUtil from "@/util/BaseUtil";
import MathUtil from "@/util/math/MathUtil";


export default class ShootUtil {

    /**射击物体*/
    public static shoot(whichUnit: unit, targetUnit: unit, damageValue: number, damageType?: damagetype, maxDistance?: number, missileart?: string, callback?: (u1: unit, u2: unit) => void): void {
        if (!IsHandle(whichUnit) || !IsHandle(targetUnit)) return;
        let triggerX: number = GetUnitX(whichUnit);
        let triggerY: number = GetUnitY(whichUnit);
        let targetX: number = GetUnitX(targetUnit);
        let targetY: number = GetUnitY(targetUnit);
        let model: string = missileart ?? 'Abilities\\Weapons\\Arrow\\ArrowMissile.mdl';
        let angle: number = MathUtil.angleBetweenCoords(triggerX, triggerY, targetX, targetY);
        let distance: number = maxDistance ?? MathUtil.distanceBetweenPoints(triggerX, triggerY, targetX, targetY);
        let effectHandle: effect = AddSpecialEffect(model, triggerX, triggerY);
        EXEffectMatRotateZ(effectHandle, angle);
        handle_ref(effectHandle);
        let delta: number = 20;
        let shootDistance: number = 0;
        handle_ref(whichUnit);
        BaseUtil.onTimer(0.02, () => {
            let x = EXGetEffectX(effectHandle) + delta * CosBJ(angle);
            let y = EXGetEffectY(effectHandle) + delta * SinBJ(angle);
            EXSetEffectXY(effectHandle, x, y);
            shootDistance += delta;
            if (shootDistance >= distance) {
                handle_unref(effectHandle);
                DestroyEffect(effectHandle);
                if (IsUnitAliveBJ(targetUnit) && IsUnitEnemy(targetUnit, GetOwningPlayer(whichUnit))) {
                    UnitDamageTarget(whichUnit, targetUnit, damageValue, false, false, ATTACK_TYPE_PIERCE, damageType ?? DAMAGE_TYPE_UNIVERSAL, null);
                }
                if (callback) {
                    callback(whichUnit, targetUnit);
                }
                handle_unref(whichUnit);
                return false;
            }
            return true;
        })
    }
}