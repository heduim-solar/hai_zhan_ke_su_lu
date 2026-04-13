local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 6,["8"] = 6,["10"] = 6,["11"] = 15,["12"] = 15,["13"] = 15,["15"] = 16,["16"] = 15,["17"] = 27,["18"] = 28,["19"] = 29,["20"] = 30,["22"] = 27,["23"] = 38,["24"] = 39,["25"] = 41,["27"] = 43,["28"] = 44,["29"] = 45,["31"] = 47,["32"] = 38,["33"] = 54,["34"] = 55,["35"] = 54,["36"] = 65,["37"] = 65,["38"] = 65,["40"] = 66,["41"] = 68,["43"] = 70,["44"] = 71,["45"] = 72,["46"] = 73,["48"] = 75,["49"] = 76,["51"] = 78,["52"] = 65,["53"] = 7});
local ____exports = {}
____exports.default = __TS__Class()
local UnitDeathTimeUtil = ____exports.default
UnitDeathTimeUtil.name = "UnitDeathTimeUtil"
function UnitDeathTimeUtil.prototype.____constructor(self)
end
function UnitDeathTimeUtil.setDeathTime(self, deathUnit, deathTime)
    if deathTime == nil then
        deathTime = time
    end
    ____exports.default._sl_deathTimeData[GetHandleId(deathUnit)] = deathTime
end
function UnitDeathTimeUtil.clearDeathTime(self, deathUnit)
    local hid = GetHandleId(deathUnit)
    if ____exports.default._sl_deathTimeData[hid] or ____exports.default._sl_deathTimeData[hid] == 0 then
        ____exports.default._sl_deathTimeData[hid] = nil
    end
end
function UnitDeathTimeUtil.hasDeathTime(self, deathUnit)
    if UnitAlive(deathUnit) then
        return false
    end
    local d = ____exports.default._sl_deathTimeData[GetHandleId(deathUnit)]
    if d == nil then
        return false
    end
    return true
end
function UnitDeathTimeUtil.getDeathTime(self, deathUnit)
    return ____exports.default._sl_deathTimeData[GetHandleId(deathUnit)]
end
function UnitDeathTimeUtil.isTimeOfDeathExceeded(self, deathUnit, timeSlot)
    if timeSlot == nil then
        timeSlot = handleReuseMinTime
    end
    if UnitAlive(deathUnit) then
        return false
    end
    local deathTime = ____exports.default:getDeathTime(deathUnit)
    if deathTime == nil or deathTime == 0 then
        log.errorWithTraceBack("正在对一个已死亡但没有设置DeathTime的单位进行死亡时间判断！请先设置死亡单位的死亡时间")
        return false
    end
    if time - deathTime >= timeSlot * 1000 then
        return true
    end
    return false
end
UnitDeathTimeUtil._sl_deathTimeData = {}
return ____exports
