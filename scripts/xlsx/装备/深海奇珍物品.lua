local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 40,["8"] = 41,["9"] = 41,["10"] = 41,["11"] = 41,["12"] = 41,["13"] = 41,["14"] = 41,["15"] = 40,["16"] = 51,["17"] = 55,["18"] = 57,["19"] = 58,["20"] = 59});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {{
    id = "深海下一关",
    class = "深海奇珍物品",
    passive = true,
    name = "深海下一关",
    describe = "深海下一关",
    icon = "ReplaceableTextures\\CommandButtons\\BTNCrystalBall.blp",
    goldCost = 0
}}
____exports["d_深海奇珍物品"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
