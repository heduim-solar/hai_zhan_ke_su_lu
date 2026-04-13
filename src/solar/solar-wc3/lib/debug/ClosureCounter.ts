/** @noSelfInFile */
/**
 * 闭包统计器
 */
import SingletonUtil from "@/SingletonUtil";
import HookUtil from "@/HookUtil";

export default class ClosureCounter {


    static newClosureCount = 0;
    static callCount = 0;
    static funNameCallCounts: { [funName: string]: number } = {};
    private static is_init = false;
    private static newClosureFlag = {}
    static config = {
        /**报警阀值*/
        alarmThreshold: 3000,
        uniqueAlarm: true,
        isTipDeprecatedFun: true,
        tipDeprecatedFunThreshold: 20,


    }
    static closureFunNames: { [funName: string]: number } = {
        DzFrameSetUpdateCallbackByCode: 0,
        DzTriggerRegisterWindowResizeEventByCode: 2,
        DzTriggerRegisterMouseMoveEventByCode: 2,
        DzTriggerRegisterMouseWheelEventByCode: 2,
        DzTriggerRegisterKeyEventByCode: 4,
        DzTriggerRegisterMouseEventByCode: 2,
        DzFrameSetScriptByCode: 2,
        EnumItemsInRect: 2,
        EnumDestructablesInRect: 1,
        TriggerAddAction: 1,
        Filter: 0,
        Condition: 0,
        ForForce: 1,
        TimerStart: 3,
        ForGroup: 1
    }

    constructor() {


    }

    static init() {
        if (ClosureCounter.is_init) {
            return
        }
        ClosureCounter.is_init = true;
        if (ClosureCounter.config.isTipDeprecatedFun) {
            ClosureCounter.tipDeprecatedFun()
        }
        //
        let old_TimerStart = TimerStart;
        _G["TimerStart"] = function (whichTimer: timer, timeout: number, periodic: boolean, handlerFunc: () => void) {
            ClosureCounter._sl_countAndcheckAlarmThreshold(handlerFunc, "TimerStart")
            old_TimerStart(whichTimer, timeout, periodic, handlerFunc)
        }
        let old_DzTriggerRegisterKeyEventByCode = DzTriggerRegisterKeyEventByCode;
        _G["DzTriggerRegisterKeyEventByCode"] = function (trig: trigger, key: number, status: number, sync: boolean, funcHandle: () => void) {
            ClosureCounter._sl_countAndcheckAlarmThreshold(funcHandle, "DzTriggerRegisterKeyEventByCode")
            old_DzTriggerRegisterKeyEventByCode(trig, key, status, sync, funcHandle)
        }


        for (let funName in ClosureCounter.closureFunNames) {
            let oldFun: (this: void, ...args) => any = _G[funName];
            _G[funName] = function (this: void, ...args) {
                let closureIndex: number = ClosureCounter.closureFunNames[funName];
                ClosureCounter._sl_countAndcheckAlarmThreshold(args[closureIndex], funName)
                try {
                    //... 会丢失null参数
                    return oldFun(...args)
                } catch (e) {
                    print(e)
                    log.errorWithTraceBack(funName)
                    print_r(args)
                    throw e
                }
            }
        }
    }


    static tipDeprecatedFun() {
        let count = 0;
        let oldCondition = Condition;
        _G.Condition = function (func: () => boolean): conditionfunc {
            count++;
            if (count > ClosureCounter.config.tipDeprecatedFunThreshold) {
                SingletonUtil.executeOnce("_sl_:ClosureCounter:alarmThreshold:tipDeprecatedFun:Condition", () => {
                    log.errorWithTraceBack("你正在使用不推荐的函数!请在需要此函数的地方传null,然后在遍历结果的地方做条件过滤判断!")
                })
            }
            return oldCondition(func);
        };
        let oldFilter = Filter;
        _G.Filter = function (func: () => boolean): filterfunc {
            count++;
            if (count > ClosureCounter.config.tipDeprecatedFunThreshold) {
                SingletonUtil.executeOnce("_sl_:ClosureCounter:alarmThreshold:tipDeprecatedFun:Filter", () => {
                    log.errorWithTraceBack("你正在使用不推荐的函数!请在需要此函数的地方传null,然后在遍历结果的地方做条件过滤判断!")
                })
            }
            return oldFilter(func);
        };

    }


    private static _sl_countAndcheckAlarmThreshold(handlerFunc: any, funName: string) {
        if (handlerFunc == null) {
            return;
        }
        ClosureCounter.callCount++;
        // @ts-ignore
        if (ClosureCounter.newClosureFlag[handlerFunc] == null) {
            ClosureCounter.newClosureCount++;
            ClosureCounter.newClosureFlag[handlerFunc] = true;
        }
        ClosureCounter.funNameCallCounts[funName] = (ClosureCounter.funNameCallCounts[funName] || 0) + 1;
        if (ClosureCounter.callCount > ClosureCounter.config.alarmThreshold) {
            SingletonUtil.executeOnce("_sl_:ClosureCounter:alarmThreshold:funNameCallCounts", () => {
                print_r("------闭包调用信息------")
                print_r(ClosureCounter.funNameCallCounts)
            })
            if (ClosureCounter.config.uniqueAlarm) {
                SingletonUtil.executeOnce("_sl_:ClosureCounter:alarmThreshold", () => {
                    log.errorWithTraceBack("注册闭包函数到jass过多！这可能会导致异步。已注册数量:" + ClosureCounter.callCount)
                })
            } else {
                log.errorWithTraceBack("注册闭包函数到jass过多！这可能会导致异步。已注册数量:" + ClosureCounter.callCount)
            }
        }

    }
}