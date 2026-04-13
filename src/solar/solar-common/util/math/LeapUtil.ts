import BaseUtil from "../BaseUtil";
import GroupUtil from "../unit/GroupUtil";
import SelectUtil from "../unit/SelectUtil";
import EffectUtil from "@/EffectUtil";
import DamageType from "@/DamageType";
import DamageUtil from "@/DamageUtil";
import RectUtil from "@/RectUtil";

/**
 * 冲锋
 */
/** @noSelf **/
export default class LeapUtil {

    /**
     *
     * @param damage_src_handle
     * @param angle 传入角度
     * @param range
     * @param time
     * @param damage
     * @param dmgType
     * @param effectPath  // 有特效则 只移动特效 比如发射投射物冲锋
     * @param startX
     * @param startY
     * @param onHitUnit //当冲击到敌方单位时 （可以在这里做击飞等操作）
     */
    static leap(damage_src_handle: unit, angle: number, range: number, time: number, damage: number = 0, dmgType: DamageType = DamageType.s_物理,
                effectPath?: string, startX: number = GetUnitX(damage_src_handle), startY: number = GetUnitY(damage_src_handle), onHitUnit?: (enemy) => void) {
        let execCount = time * 25
        let dis = range / execCount;
        let effectHandle: effect = null
        if (effectPath && effectPath.length > 0) {
            effectHandle = AddSpecialEffect(effectPath, startX, startY)
            EffectUtil.setEffectFacing(effectHandle, angle)
        }
        let damagedUnitGroup: group = null;
        if (damage > 0) {
            damagedUnitGroup = GroupUtil.groupObjectPool.borrowObject();
        }
        BaseUtil.onTimer(0.04, (c) => {
            let x = 0;
            let y = 0;
            if (effectHandle) {
                x = dis * Math.cos(angle) + EXGetEffectX(effectHandle);
                y = dis * Math.sin(angle) + EXGetEffectY(effectHandle)
                if (RectUtil.isInPlayableArea(x, y)) {
                    EXSetEffectXY(effectHandle, x, y);
                }
            } else {
                x = dis * Math.cos(angle) + GetUnitX(damage_src_handle);
                y = dis * Math.sin(angle) + GetUnitY(damage_src_handle)
                if (RectUtil.isInPlayableArea(x, y) && IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)) {
                    SetUnitPosition(damage_src_handle, x,y);
                }
            }
            if (damage > 0) {
                SelectUtil.forEnemyUnitsInRange(damage_src_handle, 128, unit => {
                    //说明已经伤害过了
                    if (IsUnitInGroup(unit, damagedUnitGroup)) {
                        return
                    }
                    GroupAddUnit(damagedUnitGroup, unit);
                    DamageUtil.damage(damage_src_handle, unit, damage, dmgType)
                    onHitUnit?.(unit)
                }, x, y);
            }
            //DestroyTimer
            execCount = execCount - 1;
            if (execCount < 1) {
                if (damagedUnitGroup) {
                    GroupUtil.groupObjectPool.returnObject(damagedUnitGroup);
                }
                if (effectHandle) {
                    DestroyEffect(effectHandle)
                }
                return false;
            }
            return true;
        })
    }


    /**
     * 无限冲锋 (通常为boss的技能使用 把一个玩家打飞到地图边界才停止了 以感受boss的强悍)
     * @param unit
     * @param angle
     * @param speed 每秒距离
     * @param panCamera 平移镜头
     * @param onDone 完成时的回调
     */
    static infiniteLeap(unit: unit, angle: number, speed: number = 1000, panCamera: boolean = false, onDone?: () => void) {
        UnitAddAbility(unit, 'Amrf');
        SetUnitFlyHeight(unit, 256, 1000);
        EXPauseUnit(unit, true)
        //每帧距离 speed为每秒距离
        let dis = speed * 0.25;
        if (panCamera && GetOwningPlayer(unit) != GetLocalPlayer()) {
            panCamera = false;
        }
        BaseUtil.onTimer(0.04, (c) => {
            let x = dis * Math.cos(angle) + GetUnitX(unit);
            let y = dis * Math.sin(angle) + GetUnitY(unit)
            if (RectUtil.isInPlayableArea(x, y)) {
                SetUnitPosition(unit, x, y);
                if (panCamera) {
                    PanCameraToTimed(x, y, 0)
                }
            } else {
                EXPauseUnit(unit, false)
                SetUnitFlyHeight(unit, 0, 1000);
                UnitRemoveAbility(unit, 'Amrf');
                onDone?.()
                return false;
            }
            return true;
        })
    }


}
