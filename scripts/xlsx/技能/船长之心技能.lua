local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 55,["8"] = 56,["9"] = 56,["10"] = 56,["11"] = 56,["12"] = 56,["13"] = 56,["14"] = 56,["15"] = 56,["16"] = 56,["17"] = 56,["18"] = 56,["19"] = 56,["20"] = 56,["21"] = 56,["22"] = 55,["23"] = 72,["24"] = 72,["25"] = 72,["26"] = 72,["27"] = 72,["28"] = 72,["29"] = 72,["30"] = 72,["31"] = 72,["32"] = 72,["33"] = 72,["34"] = 72,["35"] = 72,["36"] = 72,["37"] = 72,["38"] = 72,["39"] = 72,["40"] = 55,["41"] = 94,["42"] = 94,["43"] = 94,["44"] = 94,["45"] = 94,["46"] = 94,["47"] = 94,["48"] = 94,["49"] = 94,["50"] = 94,["51"] = 94,["52"] = 94,["53"] = 94,["54"] = 94,["55"] = 55,["56"] = 110,["57"] = 110,["58"] = 110,["59"] = 110,["60"] = 110,["61"] = 110,["62"] = 110,["63"] = 110,["64"] = 110,["65"] = 110,["66"] = 110,["67"] = 110,["68"] = 110,["69"] = 110,["70"] = 55,["71"] = 127,["72"] = 131,["73"] = 133,["74"] = 134,["75"] = 135});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {{
    id = "船长之心-无敌",
    class = "船长之心",
    describe = "无敌2秒，冷却5秒。",
    targetType = "无目标",
    passive = false,
    name = "船长之心-无敌",
    icon = "ReplaceableTextures\\CommandButtons\\BTNGreaterInvulneralbility.blp",
    range = 1000,
    area = 200,
    cost = 0,
    hotKey = "W",
    maxCd = 5,
    x = 0,
    y = 2
}, {
    id = "船长之心-岛主",
    class = "船长之心",
    describe = "船长之心-岛主：\n射程：200\n伤害：50000+攻击力x1\n射速：0.5\n特殊：该主炮造成真实伤害。",
    targetType = "无目标",
    passive = true,
    name = "船长之心-岛主",
    icon = "ReplaceableTextures\\CommandButtons\\BTNManaShield.blp",
    range = 1000,
    area = 200,
    cost = 0,
    maxCd = 0,
    x = 0,
    y = 2,
    ["sc_射程"] = 200,
    ["ss_射速"] = 0.5,
    ["shgs_伤害公式"] = {base = 50000, attack = 1},
    missileModel = "Abilities\\Weapons\\Rifle\\RifleImpact.mdx"
}, {
    id = "船长之心-变羊",
    class = "船长之心",
    describe = "船长之心-变羊：将身边400范围的敌人变羊5秒，冷却15秒。",
    targetType = "无目标",
    passive = false,
    name = "船长之心-变羊",
    icon = "ReplaceableTextures\\CommandButtons\\BTNPolymorph.blp",
    range = 1000,
    area = 200,
    cost = 0,
    hotKey = "W",
    maxCd = 15,
    x = 0,
    y = 2
}, {
    id = "船长之心-酋长",
    class = "船长之心",
    describe = "船长之心-酋长：全图友军攻击力+500%，持续10秒，冷却60秒。",
    targetType = "无目标",
    passive = false,
    name = "船长之心-酋长",
    icon = "ReplaceableTextures\\CommandButtons\\BTNBloodLustOn.blp",
    range = 1000,
    area = 200,
    cost = 0,
    hotKey = "W",
    maxCd = 60,
    x = 0,
    y = 2
}}
____exports["d_船长之心技能"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
