local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 5,["14"] = 6,["15"] = 7,["16"] = 8,["17"] = 6,["18"] = 11,["19"] = 12,["20"] = 13,["21"] = 11,["22"] = 5});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local Es = ____exports.default
Es.name = "Es"
function Es.prototype.____constructor(self)
end
function Es.init(self)
    _G.setTimeout = function(handler, timeout, loopCount)
        BaseUtil.runLater(timeout, handler, loopCount)
        return 0
    end
    _G.setInterval = function(handler, timeout)
        BaseUtil.onTimer(timeout, handler)
        return 0
    end
end
return ____exports
