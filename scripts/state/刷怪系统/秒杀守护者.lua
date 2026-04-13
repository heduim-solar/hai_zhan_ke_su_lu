local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 9,["13"] = 9,["14"] = 11,["15"] = 13,["16"] = 15,["17"] = 17,["18"] = 18,["20"] = 9,["21"] = 9,["22"] = 9,["23"] = 6});
local ____exports = {}
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
____exports.default = __TS__Class()
local _____79D2_6740_5B88_62A4_8005 = ____exports.default
_____79D2_6740_5B88_62A4_8005.name = "秒杀守护者"
function _____79D2_6740_5B88_62A4_8005.prototype.____constructor(self)
    se:onUnitTypeDeath(
        function(e)
            local number = GetRandomInt(0, 100)
            if number < 20 then
                ActorItemUtil:createActorItem("改造设计图", e.trigUnitX, e.trigUnitY)
            elseif number < 40 then
                ActorItemUtil:createActorItem("天工图", e.trigUnitX, e.trigUnitY)
            end
        end,
        "a44n"
    )
end
return ____exports
