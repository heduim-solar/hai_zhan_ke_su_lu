/** @noSelfInFile */
import BaseUtil from "@/BaseUtil";

/**判断单位是否拥有随机技能*/

export default class YDWE {


    static _sl_init() {
        /**两个单位之间的角度 */
        _G.YDWEAngleBetweenUnits = function (fromUnit: unit, toUnit: unit): number {
            return bj_RADTODEG * Atan2(GetUnitY(toUnit) - GetUnitY(fromUnit), GetUnitX(toUnit) - GetUnitX(fromUnit));
        }


        /**两个单位之间的距离*/
        _G.YDWEDistanceBetweenUnits = function (a: unit, b: unit): number {
            return SquareRoot((GetUnitX(a) - GetUnitX(b)) * (GetUnitX(a) - GetUnitX(b)) + (GetUnitY(a) - GetUnitY(b)) * (GetUnitY(a) - GetUnitY(b)));
        }


        /** 设置伤害*/
        _G.YDWESetEventDamage = function (amount: number): boolean {
            return EXSetEventDamage(amount)
        }

        /**设置技能属性 ( state_type:1冷却时间)*/
        _G.YDWESetUnitAbilityState = function (u: unit, abilcode: number, state_type: number, value: number): any {
            return EXSetAbilityState(EXGetUnitAbility(u, abilcode), state_type, value);
        }
        /**获取技能属性 ( state_type:1冷却时间)*/
        _G.YDWEGetUnitAbilityState = function (u: unit, abilcode: number, state_type: number): number {
            return EXGetAbilityState(EXGetUnitAbility(u, abilcode), state_type);
        }


        /** 设置单位技能实数属性*/
        _G.YDWESetUnitAbilityDataReal = function (u: unit, abilcode: number, level: number, data_type: number, value: number): boolean {

            return EXSetAbilityDataReal(EXGetUnitAbility(u, abilcode), level, data_type, value);
        }

        /** 设置单位可飞行*/
        _G.YDWEFlyEnable = function (u: unit): void {
            UnitAddAbility(u, FourCC('Amrf'));
            UnitRemoveAbility(u, FourCC('Amrf'));
        }
        /** 计时删除单位*/
        _G.YDWETimerRemoveUnit = function (time: number, u: unit) {
            BaseUtil.runLater(time, () => {
                if (IsHandle(u)) {
                    RemoveUnit(u);
                }
            })
        }

        /** 计时删除特效*/
        _G.YDWETimerDestroyEffect = function (time: number, e: effect) {
            BaseUtil.runLater(time, () => {
                if (IsHandle(e)) {
                    DestroyEffect(e);
                }
            })
        }

        /**佣兵系统 */
        /** 设置佣兵（宠物，英雄，刷新时间，巡逻范围，返回范围，传送范围，巡逻概率）*/
        _G.YDWESetGuard = function (pet: unit, captain: unit, timeout: number, guardRanger: number, returnRanger: number, outRanger: number, percent: number): void {

            BaseUtil.onTimer(timeout, () => {


                let p: number = percent
                let x: number = GetUnitX(captain) - GetUnitX(pet);
                let y: number = GetUnitY(captain) - GetUnitY(pet);
                let d: number = x * x + y * y;
                let v: number = guardRanger;

                if (UnitAlive(pet) && UnitAlive(captain)) {
                    if (d < v * v) {
                        if ((OrderId2String(GetUnitCurrentOrder(pet)) == null) && GetRandomInt(0, 100) < p) {

                            let x = GetUnitX(captain);
                            let y = GetUnitY(captain);
                            d = GetRandomReal(0, v);
                            let a = GetRandomReal(0, 360);
                            IssuePointOrder(pet, "patrol", x + d * CosBJ(a), y + d * SinBJ(a));

                        }
                    } else {
                        v = returnRanger;
                        if (d < v * v) {
                            if (OrderId2String(GetUnitCurrentOrder(pet)) == null) {
                                IssuePointOrder(pet, "patrol", GetUnitX(captain), GetUnitY(captain));
                            }
                        } else {
                            v = outRanger;
                            if ((d != 0) && (d > v * v)) {
                                SetUnitPosition(pet, GetUnitX(captain), GetUnitY(captain));
                                let e: effect = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", captain, "chest");
                                DestroyEffect(e);
                            } else {
                                IssuePointOrder(pet, "move", GetUnitX(captain), GetUnitY(captain));
                            }

                        }
                    }
                } else {
                    IssuePointOrder(pet, "attack", GetUnitX(captain), GetUnitY(captain));
                    return false;
                }


                return true;
            })
        }


        /**获取物品数据 (字符串) [JAPI]*/
        _G.YDWEGetItemDataString = function (ItemTypeId: number, Type: number): string {

            return EXGetItemDataString(ItemTypeId, Type);
        }

        /**技能数据 (字符串) [JAPI]*/
        _G.YDWEGetUnitAbilityDataString = function (u: unit, abilcode: number, level: number, data_type: number): string {

            return EXGetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type);
        }


        /**设置技能数据 (字符串) */
        _G.YDWESetUnitAbilityDataString = function (u: unit, abilcode: number, level: number, data_type: number, value: string): void {

            EXSetAbilityDataString(EXGetUnitAbility(u, abilcode), level, data_type, value);
        }
    }
}
