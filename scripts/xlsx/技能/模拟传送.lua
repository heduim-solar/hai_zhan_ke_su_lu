local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 45,["8"] = 46,["9"] = 46,["10"] = 46,["11"] = 46,["12"] = 46,["13"] = 46,["14"] = 46,["15"] = 46,["16"] = 46,["17"] = 46,["18"] = 46,["19"] = 46,["20"] = 46,["21"] = 46,["22"] = 46,["23"] = 45,["24"] = 64,["25"] = 68,["26"] = 70,["27"] = 71,["28"] = 72});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {{
    id = "传送",
    class = "技能",
    targetType = "单位",
    passive = false,
    name = "传送(T)",
    describe = "传送到一个友军单位或者建筑物旁边。",
    icon = "ReplaceableTextures\\CommandButtons\\BTNStaffOfTeleportation.blp",
    range = 999999,
    area = 0,
    cost = 0,
    hotKey = "T",
    maxCd = 15,
    x = 2,
    y = 1,
    targetAllow = "notself,alive,ground,nonhero,mechanical,structure,vulnerable,air,allies,player,invulnerable,hero"
}}
____exports["d_模拟传送"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
