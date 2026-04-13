local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 9,["7"] = 9,["8"] = 11,["9"] = 11,["10"] = 11,["12"] = 11,["13"] = 17,["14"] = 18,["15"] = 19,["16"] = 19,["17"] = 19,["18"] = 20,["19"] = 19,["20"] = 19,["21"] = 22,["23"] = 24,["24"] = 25,["25"] = 26,["27"] = 28,["28"] = 29,["29"] = 30,["31"] = 32,["32"] = 33,["33"] = 34,["35"] = 36,["36"] = 37,["38"] = 39,["39"] = 17,["40"] = 47,["41"] = 48,["42"] = 49,["43"] = 49,["44"] = 49,["45"] = 50,["46"] = 49,["47"] = 49,["48"] = 52,["50"] = 54,["51"] = 55,["52"] = 56,["53"] = 57,["55"] = 59,["56"] = 60,["57"] = 61,["59"] = 63,["60"] = 64,["61"] = 65,["63"] = 67,["64"] = 47,["65"] = 76,["66"] = 77,["67"] = 78,["68"] = 79,["70"] = 81,["71"] = 76,["72"] = 89,["73"] = 90,["74"] = 91,["75"] = 92,["77"] = 94,["78"] = 89});
local ____exports = {}
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local HandleUtil = ____exports.default
HandleUtil.name = "HandleUtil"
function HandleUtil.prototype.____constructor(self)
end
function HandleUtil.isUnitHandle(self, h)
    if not isDebug then
        SingletonUtil:executeOnce(
            "HandleUtil:isUnitHandle",
            function()
                BJDebugMsg("正式环境无法使用HandleUtil.isUnitHandle")
            end
        )
        return true
    end
    local info = handledef(h)
    if info == nil then
        return false
    end
    if info.reference <= 0 then
        log.errorWithTraceBack("警告：你的Handle引用为0，可能会发生使用过时的handle情况，请排查使用handle的逻辑.")
        return false
    end
    if info.type == nil or info.type == "" then
        log.errorWithTraceBack("警告：你的Handle数据已被底层回收!请实时获取handle,不要使用过时的handle")
        return false
    end
    if info.type == "+w3u" then
        return true
    end
    return false
end
function HandleUtil.isEmptyType(self, h)
    if not isDebug then
        SingletonUtil:executeOnce(
            "HandleUtil:isEmptyType",
            function()
                BJDebugMsg("正式环境无法使用HandleUtil.isEmptyType")
            end
        )
        return true
    end
    local info = handledef(h)
    if info == nil then
        log.errorWithTraceBack("警告：你的Handle定义为空。请检查handle是否正确")
        return true
    end
    if info.reference <= 0 then
        log.errorWithTraceBack("警告：你的Handle引用为0，可能会发生使用过时的handle情况，请排查使用handle的逻辑.")
        return false
    end
    if info.type == nil or info.type == "" then
        log.errorWithTraceBack("警告：你的Handle数据已被底层回收!请实时获取handle,不要使用过时的handle")
        return true
    end
    return false
end
function HandleUtil.getHandleRef(self, h)
    local info = handledef(h)
    if info == nil then
        return 0
    end
    return info.reference
end
function HandleUtil.getHandleType(self, h)
    local info = handledef(h)
    if info == nil then
        return nil
    end
    return info.type
end
return ____exports
