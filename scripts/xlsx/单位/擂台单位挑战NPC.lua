local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 58,["8"] = 59,["9"] = 59,["10"] = 59,["11"] = 59,["12"] = 59,["13"] = 59,["14"] = 58,["15"] = 68,["16"] = 72,["17"] = 74,["18"] = 75,["19"] = 76});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {{
    id = "擂台挑战",
    class = "擂台挑战",
    templateType = "NPC单位",
    name = "|cffff0000擂台挑战",
    icon = "ReplaceableTextures\\CommandButtons\\BTNFrost.blp",
    model = "units\\human\\Jaina\\Jaina.mdx"
}}
____exports["d_擂台单位挑战NPC"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
