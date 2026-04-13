local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 5,["14"] = 5,["15"] = 21,["16"] = 22,["17"] = 23,["19"] = 25,["20"] = 26,["22"] = 21,["23"] = 30,["24"] = 31,["25"] = 32,["27"] = 34,["28"] = 35,["30"] = 30,["31"] = 39,["32"] = 40,["33"] = 41,["35"] = 43,["36"] = 44,["38"] = 39,["39"] = 48,["40"] = 49,["41"] = 50,["43"] = 52,["44"] = 53,["46"] = 48,["47"] = 57,["48"] = 58,["49"] = 59,["51"] = 61,["52"] = 62,["54"] = 57,["55"] = 66,["56"] = 66,["58"] = 67,["59"] = 68,["60"] = 69,["61"] = 70,["62"] = 71,["63"] = 72,["64"] = 73,["65"] = 74,["66"] = 75,["68"] = 77,["71"] = 80,["72"] = 81,["73"] = 82,["74"] = 83,["75"] = 84,["77"] = 66,["78"] = 89,["79"] = 90,["80"] = 91,["82"] = 93,["83"] = 94,["85"] = 89,["86"] = 7,["87"] = 8,["88"] = 9,["94"] = 13,["96"] = 16,["97"] = 18});
local ____exports = {}
local ____ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
local log = require("jass.log")
____exports.default = __TS__Class()
local Log = ____exports.default
Log.name = "Log"
function Log.prototype.____constructor(self)
end
function Log.prototype.trace(...)
    if ____exports.default.enablePrint then
        print("Log.trace:", ...)
    end
    if ____exports.default.enable then
        log:trace(...)
    end
end
function Log.prototype.debug(...)
    if ____exports.default.enablePrint then
        print("Log.debug:", ...)
    end
    if ____exports.default.enable then
        log:debug(...)
    end
end
function Log.prototype.info(...)
    if ____exports.default.enablePrint then
        print("Log.info:", ...)
    end
    if ____exports.default.enable then
        log:info(...)
    end
end
function Log.prototype.warn(...)
    if ____exports.default.enablePrint then
        print("Log.warn:", ...)
    end
    if ____exports.default.enable then
        log:warn(...)
    end
end
function Log.prototype.error(...)
    if ____exports.default.enablePrint then
        print("Log.error:", ...)
    end
    if ____exports.default.enable then
        log:error(...)
    end
end
function Log.prototype.errorWithTraceBack(...)
    local args = {...}
    local ____exports_default_0, ____index_1 = ____exports.default, "index"
    ____exports_default_0[____index_1] = ____exports_default_0[____index_1] + 1
    local tb = debug.traceback()
    if ____exports.default.enablePrint then
        print("Log.errorWithTraceBack:", ...)
        print(("===========Error TraceBack Start[No." .. tostring(____exports.default.index)) .. "]===========")
        print(tb)
        print(("===========Error TraceBack End[No." .. tostring(____exports.default.index)) .. "]===========")
        if args and #args > 0 then
            ErrorMsgHelper.error_handle(args[1])
        else
            ErrorMsgHelper.error_handle("")
        end
    end
    if ____exports.default.enable then
        log:error(table.unpack(args))
        log:error(("===========Error TraceBack Start[No." .. tostring(____exports.default.index)) .. "]===========")
        log:error(tb)
        log:error(("===========Error TraceBack End[No." .. tostring(____exports.default.index)) .. "]===========")
    end
end
function Log.prototype.fatal(...)
    if ____exports.default.enablePrint then
        print("Log.fatal:", ...)
    end
    if ____exports.default.enable then
        log:fatal(...)
    end
end
Log.enable = true
Log.enablePrint = true
Log.index = 1
__TS__SetDescriptor(
    Log.prototype,
    "path",
    {
        get = function(self)
            return log.path
        end,
        set = function(self, path)
            log.path = path
        end
    },
    true
)
return ____exports
