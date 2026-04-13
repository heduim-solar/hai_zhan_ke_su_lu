local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 40,["8"] = 41,["9"] = 41,["10"] = 41,["11"] = 41,["12"] = 41,["13"] = 41,["14"] = 41,["15"] = 41,["16"] = 40,["17"] = 51,["18"] = 51,["19"] = 51,["20"] = 51,["21"] = 51,["22"] = 51,["23"] = 51,["24"] = 51,["25"] = 51,["26"] = 40,["27"] = 63,["28"] = 67,["29"] = 69,["30"] = 70,["31"] = 71});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {{
    id = "超级挑战",
    class = "污染的航海器",
    passive = false,
    name = "超级挑战",
    describe = "掉落污染的航海器。 挑战怪有90秒持续时间。每次挑战当前波数对应的超级怪！",
    icon = "ReplaceableTextures\\CommandButtons\\BTNRevenant.blp",
    unique = true,
    maxCd = 90
}, {
    id = "污染的航海器",
    class = "污染的航海器",
    passive = true,
    name = "污染的航海器",
    model = "model\\基础物品模型.mdx",
    icon = "ReplaceableTextures\\CommandButtons\\BTNDarkSummoning.blp",
    unique = true,
    goldCost = 2000,
    pawnable = 1
}}
____exports["d_污染的航海器"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
