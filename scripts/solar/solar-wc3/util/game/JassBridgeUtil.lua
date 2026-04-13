local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 9,["7"] = 9,["8"] = 9,["10"] = 9,["11"] = 12,["12"] = 13,["13"] = 12,["14"] = 16,["15"] = 17,["16"] = 16,["17"] = 20,["18"] = 21,["19"] = 20,["20"] = 24,["21"] = 25,["22"] = 24,["23"] = 10});
local ____exports = {}
____exports.default = __TS__Class()
local JassBridgeUtil = ____exports.default
JassBridgeUtil.name = "JassBridgeUtil"
function JassBridgeUtil.prototype.____constructor(self)
end
function JassBridgeUtil.getResultAsBoolean()
    return LoadBoolean(____exports.default.sl_bridge, 2, 2)
end
function JassBridgeUtil.getResultAsInt()
    return LoadInteger(____exports.default.sl_bridge, 2, 2)
end
function JassBridgeUtil.getResultAsReal()
    return LoadReal(____exports.default.sl_bridge, 2, 2)
end
function JassBridgeUtil.getResultAsStr()
    return LoadStr(____exports.default.sl_bridge, 2, 2)
end
JassBridgeUtil.sl_bridge = require("jass.globals").sl_bridge
return ____exports
