/** @noSelfInFile **/

// declare global {
//
//     interface AppUnitData {
//         Timer?: timer
//     }
//
// }

import DataBase from "@/DataBase";
import UnitStateUtil from "@/UnitStateUtil";

/**
 * 佣兵系统
 * (跟随系统)
 */
export default class GuardUtil {


    private static _sl_IsUnitIdle(u: unit) {
        return OrderId2String(GetUnitCurrentOrder(u)) == null
    }

    /**
     * YDWERemoveGuard
     * 让一个佣兵不再跟随主人。备注：如果佣兵是召唤生物那么不必取消，因为当佣兵或主人死亡后，系统会自动取消跟随。
     * 取消 ${单位} 的跟随
     * @param pet
     */
    static removeGuard(pet: unit): void {

        let tm: timer = DataBase.getUnitSolarData(pet).Timer;
        db.clearDataByHandle("Timer", tm);
        DestroyTimer(tm);
    }

    private static _sl_SetGuardTimer(this: void): void {
        let tm: timer = GetExpiredTimer();
        let appData = db.getDataByHandle("Timer", tm);
        let pet: unit = appData.Pet
        let captain: unit = appData.Captain
        let x: number = GetUnitX(captain) - GetUnitX(pet);
        let y: number = GetUnitY(captain) - GetUnitY(pet);
        let d: number = x * x + y * y;
        let v: number;
        let a: number;
        let e: effect = null;
        // let life: number = appData.Life
        let p: number = appData.Percent
        v = appData.GuardRanger
        if (UnitStateUtil.isAlive(pet) && UnitStateUtil.isAlive(captain)) {
            if (d < v * v) {
                if (GuardUtil._sl_IsUnitIdle(pet) && GetRandomInt(0, 100) < p) {
                    x = GetUnitX(captain);
                    y = GetUnitY(captain);
                    d = GetRandomReal(0, v);
                    a = GetRandomReal(0, 360);
                    IssuePointOrder(pet, "patrol", x + d * CosBJ(a), y + d * SinBJ(a));
                }
            } else {
                v = appData.ReturnRanger
                if (d < v * v) {
                    if (GuardUtil._sl_IsUnitIdle(pet)) {
                        IssuePointOrder(pet, "patrol", GetUnitX(captain), GetUnitY(captain));
                    }
                } else {
                    v = appData.OutRanger
                    if (d != 0 && d > v * v) {
                        SetUnitPosition(pet, GetUnitX(captain), GetUnitY(captain));
                        e = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", captain, "chest");
                        DestroyEffect(e);
                    } else {
                        IssuePointOrder(pet, "move", GetUnitX(captain), GetUnitY(captain));
                    }
                }
            }
        } else {
            IssuePointOrder(pet, "attack", GetUnitX(captain), GetUnitY(captain));
        }
    }

    /**
     * 让一个佣兵跟随主人，可以在主人身边巡逻，当远离主人后自动返回或传送到主人身边。
     * 命令 ${pet 单位} 跟随 ${ captain 单位}，刷新周期 ${timeout}，巡逻半径 ${guardRanger}，返回半径 ${returnRanger}，
     * 传送半径 ${outRanger}，巡逻概率 ${percent}%
     * @param pet
     * @param captain
     * @param timeout
     * @param guardRanger 巡逻半径
     * @param returnRanger 返回半径
     * @param outRanger 传送半径
     * @param percent
     */
    static setGuard(pet: unit, captain: unit, timeout: number = 2, guardRanger: number = 800, returnRanger: number = 1200,
                    outRanger: number = 1500, percent: number = 75): void {
        let tm: timer = CreateTimer();
        DataBase.getUnitSolarData(pet).Timer = tm
        let appData = db.getDataByHandle("Timer", tm);
        appData.Pet = pet
        appData.Captain = captain
        appData.Percent = percent
        appData.GuardRanger = guardRanger
        appData.ReturnRanger = returnRanger
        appData.OutRanger = outRanger
        TimerStart(tm, timeout, true, GuardUtil._sl_SetGuardTimer);
    }

    /**
     * 重新设置佣兵参数 以复用之前创建的计时器等资源
     * @param pet
     * @param captain
     * @param timeout
     * @param guardRanger
     * @param returnRanger
     * @param outRanger
     * @param percent
     */
    static resetGuard(pet: unit, captain: unit, timeout: number = 2, guardRanger: number = 800, returnRanger: number = 1200,
                    outRanger: number = 1500, percent: number = 75): void {
        let tm: timer =   DataBase.getUnitSolarData(pet).Timer;
        if (!IsHandle(tm)){
            log.errorWithTraceBack("该佣兵没有已经存在的佣兵跟随系统！请先使用setGuard创建跟随系统")
            return
        }
        let appData = db.getDataByHandle("Timer", tm);
        appData.Pet = pet
        appData.Captain = captain
        appData.Percent = percent
        appData.GuardRanger = guardRanger
        appData.ReturnRanger = returnRanger
        appData.OutRanger = outRanger
    }
}