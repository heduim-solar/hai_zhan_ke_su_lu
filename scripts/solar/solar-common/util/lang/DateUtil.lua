local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["12"] = 1,["13"] = 9,["14"] = 10,["15"] = 11,["16"] = 12,["17"] = 13,["18"] = 16,["19"] = 16,["20"] = 16,["21"] = 16,["22"] = 16,["23"] = 16,["24"] = 16,["25"] = 16,["26"] = 24,["27"] = 25,["28"] = 9,["29"] = 28,["30"] = 29,["31"] = 28,["32"] = 36,["33"] = 37,["34"] = 36});
local ____exports = {}
____exports.default = __TS__Class()
local DateUtil = ____exports.default
DateUtil.name = "DateUtil"
function DateUtil.prototype.____constructor(self)
end
function DateUtil.parseDate(self, yyyy_mm_dd_H_M_S_DateStr)
    local yyyy_mm_dd_H_M_S = __TS__StringReplaceAll(yyyy_mm_dd_H_M_S_DateStr, "-", "_")
    yyyy_mm_dd_H_M_S = __TS__StringReplaceAll(yyyy_mm_dd_H_M_S, " ", "_")
    yyyy_mm_dd_H_M_S = __TS__StringReplaceAll(yyyy_mm_dd_H_M_S, ":", "_")
    local yyyy_mm_dd_H_M_SArray = __TS__StringSplit(yyyy_mm_dd_H_M_S, "_")
    local dataInfo = {
        year = tonumber(yyyy_mm_dd_H_M_SArray[1]),
        month = tonumber(yyyy_mm_dd_H_M_SArray[2]),
        day = tonumber(yyyy_mm_dd_H_M_SArray[3]),
        hour = tonumber(yyyy_mm_dd_H_M_SArray[4]),
        min = tonumber(yyyy_mm_dd_H_M_SArray[5]),
        sec = tonumber(yyyy_mm_dd_H_M_SArray[6])
    }
    local timeNum = os.time(dataInfo)
    return timeNum
end
function DateUtil.__tostring(self, dateTime)
    return os.date("%Y-%m-%d %H:%M:%S", dateTime)
end
function DateUtil.getGameMinutes(self)
    return math.floor(_g_time / 60000)
end
return ____exports
