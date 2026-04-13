local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 5,["9"] = 11,["10"] = 11,["11"] = 11,["13"] = 11,["14"] = 18,["15"] = 19,["16"] = 18,["17"] = 27,["18"] = 29,["19"] = 27,["20"] = 35,["21"] = 36,["22"] = 35});
local ____exports = {}
local ____mitt = require("solar.solar-common.lib.mitt")
local mitt = ____mitt.default
local emitter = mitt()
____exports.default = __TS__Class()
local EventUtil = ____exports.default
EventUtil.name = "EventUtil"
function EventUtil.prototype.____constructor(self)
end
function EventUtil.on(self, ____type, handler)
    emitter:on(____type, handler)
end
function EventUtil.emit(self, ____type, data)
    emitter:emit(____type, data)
end
function EventUtil.clear(self)
    emitter.all:clear()
end
return ____exports
