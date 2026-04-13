local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 7,["10"] = 7,["11"] = 7,["13"] = 7,["14"] = 18,["15"] = 18,["16"] = 18,["18"] = 19,["19"] = 20,["20"] = 21,["22"] = 23,["23"] = 24,["25"] = 26,["27"] = 28,["28"] = 29,["29"] = 18,["30"] = 38,["31"] = 38,["32"] = 38,["34"] = 39,["35"] = 38,["36"] = 47,["37"] = 48,["38"] = 48,["39"] = 48,["40"] = 49,["41"] = 48,["42"] = 48,["43"] = 47,["44"] = 59,["45"] = 60,["48"] = 63,["49"] = 64,["50"] = 59,["51"] = 8,["52"] = 9});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
____exports.default = __TS__Class()
local SingletonUtil = ____exports.default
SingletonUtil.name = "SingletonUtil"
function SingletonUtil.prototype.____constructor(self)
end
function SingletonUtil.isFirstTime(self, key, printTraceBack, tips)
    if printTraceBack == nil then
        printTraceBack = true
    end
    if ____exports.default._sl_cache[key] == true then
        if printTraceBack then
            log.errorWithTraceBack("唯一限制:" .. tostring(key))
        end
        if tips then
            print(tips)
        end
        return false
    end
    ____exports.default._sl_cache[key] = true
    return true
end
function SingletonUtil.notFirstTime(self, key, printTraceBack, tips)
    if printTraceBack == nil then
        printTraceBack = true
    end
    return not ____exports.default:isFirstTime(key, printTraceBack, tips)
end
function SingletonUtil.getInstance(self, clazz)
    return ____exports.default.cache:get(
        "getInstance:" .. tostring(clazz),
        function()
            return __TS__New(clazz)
        end
    )
end
function SingletonUtil.executeOnce(self, key, runable)
    if ____exports.default._sl_cache[key] == true then
        return
    end
    ____exports.default._sl_cache[key] = true
    runable(nil)
end
SingletonUtil.cache = __TS__New(Cache)
SingletonUtil._sl_cache = {}
return ____exports
