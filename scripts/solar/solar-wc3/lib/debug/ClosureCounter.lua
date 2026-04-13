local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 5,["7"] = 5,["8"] = 8,["9"] = 8,["10"] = 8,["12"] = 43,["13"] = 48,["14"] = 49,["17"] = 52,["18"] = 53,["19"] = 54,["21"] = 57,["22"] = 58,["23"] = 59,["24"] = 60,["25"] = 58,["26"] = 62,["27"] = 63,["28"] = 64,["29"] = 65,["30"] = 65,["31"] = 65,["32"] = 65,["33"] = 65,["34"] = 65,["35"] = 65,["36"] = 63,["37"] = 69,["38"] = 70,["39"] = 71,["40"] = 71,["41"] = 72,["42"] = 73,["45"] = 78,["46"] = 79,["47"] = 80,["48"] = 81,["51"] = 76,["57"] = 74,["60"] = 71,["62"] = 48,["63"] = 88,["64"] = 89,["65"] = 90,["66"] = 91,["67"] = 92,["68"] = 93,["69"] = 94,["70"] = 94,["71"] = 94,["72"] = 95,["73"] = 94,["74"] = 94,["76"] = 98,["77"] = 91,["78"] = 100,["79"] = 101,["80"] = 102,["81"] = 103,["82"] = 104,["83"] = 104,["84"] = 104,["85"] = 105,["86"] = 104,["87"] = 104,["89"] = 108,["90"] = 101,["91"] = 88,["92"] = 114,["93"] = 115,["97"] = 118,["98"] = 120,["100"] = 121,["101"] = 122,["103"] = 124,["104"] = 125,["105"] = 126,["106"] = 126,["107"] = 126,["108"] = 127,["109"] = 128,["110"] = 126,["111"] = 126,["112"] = 130,["113"] = 131,["114"] = 131,["115"] = 131,["116"] = 132,["117"] = 131,["118"] = 131,["120"] = 135,["123"] = 114,["124"] = 11,["125"] = 12,["126"] = 13,["127"] = 14,["128"] = 15,["129"] = 16,["130"] = 25,["131"] = 25,["132"] = 25,["133"] = 25,["134"] = 25,["135"] = 25,["136"] = 25,["137"] = 25,["138"] = 25,["139"] = 25,["140"] = 25,["141"] = 25,["142"] = 25,["143"] = 25,["144"] = 25,["145"] = 25,["146"] = 25});
local ____exports = {}
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local ClosureCounter = ____exports.default
ClosureCounter.name = "ClosureCounter"
function ClosureCounter.prototype.____constructor(self)
end
function ClosureCounter.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    if ____exports.default.config.isTipDeprecatedFun then
        ____exports.default:tipDeprecatedFun()
    end
    local old_TimerStart = TimerStart
    _G.TimerStart = function(whichTimer, timeout, periodic, handlerFunc)
        ____exports.default:_sl_countAndcheckAlarmThreshold(handlerFunc, "TimerStart")
        old_TimerStart(whichTimer, timeout, periodic, handlerFunc)
    end
    local old_DzTriggerRegisterKeyEventByCode = DzTriggerRegisterKeyEventByCode
    _G.DzTriggerRegisterKeyEventByCode = function(trig, key, status, sync, funcHandle)
        ____exports.default:_sl_countAndcheckAlarmThreshold(funcHandle, "DzTriggerRegisterKeyEventByCode")
        old_DzTriggerRegisterKeyEventByCode(
            trig,
            key,
            status,
            sync,
            funcHandle
        )
    end
    for funName in pairs(____exports.default.closureFunNames) do
        local oldFun = _G[funName]
        _G[funName] = function(...)
            local args = {...}
            local closureIndex = ____exports.default.closureFunNames[funName]
            ____exports.default:_sl_countAndcheckAlarmThreshold(args[closureIndex + 1], funName)
            do
                local function ____catch(e)
                    print(e)
                    log.errorWithTraceBack(funName)
                    print_r(args)
                    error(e, 0)
                end
                local ____try, ____hasReturned, ____returnValue = pcall(function()
                    return true, oldFun(table.unpack(args))
                end)
                if not ____try then
                    ____hasReturned, ____returnValue = ____catch(____hasReturned)
                end
                if ____hasReturned then
                    return ____returnValue
                end
            end
        end
    end
end
function ClosureCounter.tipDeprecatedFun(self)
    local count = 0
    local oldCondition = Condition
    _G.Condition = function(func)
        count = count + 1
        if count > ____exports.default.config.tipDeprecatedFunThreshold then
            SingletonUtil:executeOnce(
                "_sl_:ClosureCounter:alarmThreshold:tipDeprecatedFun:Condition",
                function()
                    log.errorWithTraceBack("你正在使用不推荐的函数!请在需要此函数的地方传null,然后在遍历结果的地方做条件过滤判断!")
                end
            )
        end
        return oldCondition(func)
    end
    local oldFilter = Filter
    _G.Filter = function(func)
        count = count + 1
        if count > ____exports.default.config.tipDeprecatedFunThreshold then
            SingletonUtil:executeOnce(
                "_sl_:ClosureCounter:alarmThreshold:tipDeprecatedFun:Filter",
                function()
                    log.errorWithTraceBack("你正在使用不推荐的函数!请在需要此函数的地方传null,然后在遍历结果的地方做条件过滤判断!")
                end
            )
        end
        return oldFilter(func)
    end
end
function ClosureCounter._sl_countAndcheckAlarmThreshold(self, handlerFunc, funName)
    if handlerFunc == nil then
        return
    end
    local ____exports_default_0, ____callCount_1 = ____exports.default, "callCount"
    ____exports_default_0[____callCount_1] = ____exports_default_0[____callCount_1] + 1
    if ____exports.default.newClosureFlag[handlerFunc] == nil then
        local ____exports_default_2, ____newClosureCount_3 = ____exports.default, "newClosureCount"
        ____exports_default_2[____newClosureCount_3] = ____exports_default_2[____newClosureCount_3] + 1
        ____exports.default.newClosureFlag[handlerFunc] = true
    end
    ____exports.default.funNameCallCounts[funName] = (____exports.default.funNameCallCounts[funName] or 0) + 1
    if ____exports.default.callCount > ____exports.default.config.alarmThreshold then
        SingletonUtil:executeOnce(
            "_sl_:ClosureCounter:alarmThreshold:funNameCallCounts",
            function()
                print_r("------闭包调用信息------")
                print_r(____exports.default.funNameCallCounts)
            end
        )
        if ____exports.default.config.uniqueAlarm then
            SingletonUtil:executeOnce(
                "_sl_:ClosureCounter:alarmThreshold",
                function()
                    log.errorWithTraceBack("注册闭包函数到jass过多！这可能会导致异步。已注册数量:" .. tostring(____exports.default.callCount))
                end
            )
        else
            log.errorWithTraceBack("注册闭包函数到jass过多！这可能会导致异步。已注册数量:" .. tostring(____exports.default.callCount))
        end
    end
end
ClosureCounter.newClosureCount = 0
ClosureCounter.callCount = 0
ClosureCounter.funNameCallCounts = {}
ClosureCounter.is_init = false
ClosureCounter.newClosureFlag = {}
ClosureCounter.config = {alarmThreshold = 3000, uniqueAlarm = true, isTipDeprecatedFun = true, tipDeprecatedFunThreshold = 20}
ClosureCounter.closureFunNames = {
    DzFrameSetUpdateCallbackByCode = 0,
    DzTriggerRegisterWindowResizeEventByCode = 2,
    DzTriggerRegisterMouseMoveEventByCode = 2,
    DzTriggerRegisterMouseWheelEventByCode = 2,
    DzTriggerRegisterKeyEventByCode = 4,
    DzTriggerRegisterMouseEventByCode = 2,
    DzFrameSetScriptByCode = 2,
    EnumItemsInRect = 2,
    EnumDestructablesInRect = 1,
    TriggerAddAction = 1,
    Filter = 0,
    Condition = 0,
    ForForce = 1,
    TimerStart = 3,
    ForGroup = 1
}
return ____exports
