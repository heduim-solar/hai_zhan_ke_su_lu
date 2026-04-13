local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 4,["11"] = 6,["12"] = 6,["13"] = 6,["15"] = 6,["16"] = 13,["17"] = 14,["18"] = 15,["19"] = 16,["22"] = 18,["23"] = 19,["24"] = 13,["25"] = 27,["27"] = 28,["28"] = 28,["29"] = 29,["30"] = 30,["33"] = 33,["34"] = 34,["35"] = 28,["38"] = 27,["39"] = 47,["40"] = 48,["41"] = 49,["42"] = 50,["43"] = 51,["44"] = 52,["45"] = 53,["46"] = 54,["48"] = 50,["49"] = 57,["50"] = 58,["51"] = 47,["52"] = 68,["53"] = 68,["54"] = 68,["56"] = 68,["57"] = 68,["59"] = 69,["60"] = 70,["61"] = 71,["63"] = 73,["64"] = 74,["65"] = 75,["66"] = 76,["67"] = 77,["69"] = 79,["71"] = 82,["72"] = 82,["73"] = 82,["74"] = 83,["75"] = 84,["76"] = 82,["77"] = 82,["78"] = 86,["79"] = 68,["80"] = 100,["81"] = 101,["82"] = 102,["83"] = 103,["84"] = 104,["85"] = 100,["86"] = 108,["87"] = 109,["88"] = 108,["89"] = 112,["90"] = 114,["91"] = 115,["92"] = 112,["93"] = 8,["94"] = 92,["95"] = 97});
local ____exports = {}
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
time = 0
_g_time = 0
____exports.default = __TS__Class()
local BaseUtil = ____exports.default
BaseUtil.name = "BaseUtil"
function BaseUtil.prototype.____constructor(self)
end
function BaseUtil.getUUID()
    if isAsync then
        log.errorWithTraceBack("不能异步获取uuid。异步请使用AsyncUtil。getUUIDAsync()!")
        return nil
    end
    local ____exports_default_0, ____uuid_1 = ____exports.default, "uuid"
    ____exports_default_0[____uuid_1] = ____exports_default_0[____uuid_1] + 1
    return ____exports.default.uuid
end
function BaseUtil.SForGroup(whichGroup, callback)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(whichGroup)
            if not IsHandle(unitHandle) then
                break
            end
            callback(nil, unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
            i = i + 1
        end
    end
end
function BaseUtil.onTimer(timeOut, onTimerCall)
    local sTimer = __TS__New(STimer)
    local count = 0
    local function callBack()
        count = count + 1
        local ____repeat = onTimerCall(nil, count)
        if not ____repeat then
            sTimer:destroy()
        end
    end
    sTimer:start(timeOut, callBack, true)
    return sTimer
end
function BaseUtil.runLater(timeOut, callBack, loopCount, immediately)
    if loopCount == nil then
        loopCount = 1
    end
    if immediately == nil then
        immediately = false
    end
    local count = 0
    if loopCount < 1 then
        return nil
    end
    local sTimer = __TS__New(STimer)
    if immediately then
        count = count + 1
        callBack(count, loopCount)
        sTimer:setLoopCount(loopCount - 1)
    else
        sTimer:setLoopCount(loopCount)
    end
    sTimer:start(
        timeOut,
        function()
            count = count + 1
            callBack(count, loopCount)
        end
    )
    return sTimer
end
function BaseUtil._sl_OnTime()
    _g_time = _g_time + 10
    time = _g_time
    ____exports.default.time = _g_time
    STimer._sl_OnTime()
end
function BaseUtil.getGameTime()
    return _g_time / 1000
end
function BaseUtil.init()
    ____exports.default.centerTimer = CreateTimer()
    TimerStart(____exports.default.centerTimer, 0.01, true, ____exports.default._sl_OnTime)
end
BaseUtil.uuid = 1
BaseUtil.centerTimer = nil
BaseUtil.time = 0
return ____exports
