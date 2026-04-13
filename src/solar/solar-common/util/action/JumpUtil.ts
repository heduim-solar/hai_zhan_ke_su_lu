/**
 * @brief 单位跳跃到另一个位置
 */
import BaseUtil from "@/util/BaseUtil";
import MathUtil from "@/util/math/MathUtil";


export default class JumpUtil {

    /**
     * 击飞 （飞起来的眩晕效果）
     */
    static strikeFly(whichUnit: unit, time: number) {
        UnitAddAbility(whichUnit, 'Amrf');
        UnitRemoveAbility(whichUnit, 'Amrf');
        //默认为0 不然在击飞过程中又被击飞的话 会掉不下来
        // let oldFlyHeight = GetUnitFlyHeight(whichUnit);
        let oldFlyHeight = 0;
        //
        EXPauseUnit(whichUnit, true);
        SetUnitFlyHeight(whichUnit, oldFlyHeight + 500, time * 1000);
        BaseUtil.runLater(time / 2, () => {
            SetUnitFlyHeight(whichUnit, oldFlyHeight, time * 1000);
        })
        BaseUtil.runLater(time, () => {
            EXPauseUnit(whichUnit, false);
        })
    }


    /**跳跃*/
    public static jump(whichUnit: unit, targetX: number, targetY: number, maxDistance: number = 800, targetArt?: string, effectArt?: string, callback?: (unit: unit, x: number, y: number) => void) {
        let angle: number = MathUtil.angleBetweenCoords(GetUnitX(whichUnit), GetUnitY(whichUnit), targetX, targetY);
        UnitAddAbility(whichUnit, 'Amrf');
        UnitRemoveAbility(whichUnit, 'Amrf');
        SetUnitPathing(whichUnit, false);
        let effectHandle: effect = AddSpecialEffectTarget(targetArt ?? 'Abilities\\Spells\\Items\\ClarityPotion\\ClarityTarget.mdl', whichUnit, 'chest');
        let distance: number = MathUtil.distanceBetweenPoints(GetUnitX(whichUnit), GetUnitY(whichUnit), targetX, targetY);
        distance = math.min(distance, maxDistance);
        let maxHeight: number = distance / 2.15;
        handle_ref(whichUnit);
        let jumpDistance: number = 0.0;
        let delta: number = 40.0;
        BaseUtil.onTimer(0.02, () => {
            jumpDistance += delta;
            let x: number = GetUnitX(whichUnit) + delta * CosBJ(angle);
            let y: number = GetUnitY(whichUnit) + delta * SinBJ(angle);
            if (jumpDistance >= distance || IsUnitType(whichUnit, UNIT_TYPE_DEAD) || IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                SetUnitPathing(whichUnit, true);
                SetUnitFlyHeight(whichUnit, 0.00, 0.00);
                DestroyEffect(effectHandle);
                DestroyEffect(AddSpecialEffect(effectArt ?? 'Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl', x, y));
                if (callback) {
                    callback(whichUnit, x, y);
                }
                handle_unref(whichUnit);
                return false;
            }
            SetUnitPosition(whichUnit, x, y);
            let A: number = -4.0 * maxHeight / Pow(distance, 2.0);
            let height: number = A * (jumpDistance - 0.0) * (jumpDistance - distance);
            SetUnitFlyHeight(whichUnit, height, 0.00);
            return true;
        })
    }
}