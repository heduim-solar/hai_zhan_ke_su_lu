local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 61,["8"] = 62,["9"] = 62,["10"] = 62,["11"] = 62,["12"] = 62,["13"] = 62,["14"] = 62,["15"] = 62,["16"] = 62,["17"] = 62,["18"] = 62,["19"] = 62,["20"] = 62,["21"] = 62,["22"] = 62,["23"] = 62,["24"] = 62,["25"] = 61,["26"] = 84,["27"] = 88,["28"] = 90,["29"] = 91,["30"] = 92});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {{
    id = "狂风之力主炮",
    name = "狂风之力主炮",
    describe = "射程：300\n伤害：攻击力x1\n射速：1\n特殊：无",
    ["sc_射程"] = 300,
    ["ss_射速"] = 0.1,
    ["shgs_伤害公式"] = {attack = 0.5},
    ["sh_伤害"] = "攻击力x0.5",
    missileModel = "Abilities\\Weapons\\Arrow\\ArrowMissile.mdl",
    ["ts_特殊"] = "无",
    icon = "船图标\\木船-主炮.blp",
    class = "主炮",
    targetType = "无目标",
    passive = true,
    range = 1000,
    area = 200,
    x = 2,
    y = 2
}}
____exports["d_扩展主炮"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
