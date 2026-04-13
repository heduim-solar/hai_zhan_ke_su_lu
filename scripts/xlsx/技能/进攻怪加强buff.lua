local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 44,["8"] = 45,["9"] = 45,["10"] = 45,["11"] = 45,["12"] = 45,["13"] = 45,["14"] = 45,["15"] = 45,["16"] = 45,["17"] = 45,["18"] = 44,["19"] = 61,["20"] = 61,["21"] = 61,["22"] = 61,["23"] = 61,["24"] = 61,["25"] = 61,["26"] = 61,["27"] = 61,["28"] = 61,["29"] = 44,["30"] = 76,["31"] = 76,["32"] = 76,["33"] = 76,["34"] = 76,["35"] = 76,["36"] = 76,["37"] = 76,["38"] = 76,["39"] = 76,["40"] = 44,["41"] = 89,["42"] = 93,["43"] = 95,["44"] = 96,["45"] = 97});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {{
    id = "踏尘者寄生",
    class = "基础",
    name = "踏尘者寄生",
    describe = "被踏尘者寄生，攻击力/移速/生命值+100%",
    attribute = {attack_p = 1, life_p = 1, move_speed_p = 1},
    isDebuff = false,
    levelDurMode = true,
    icon = "ReplaceableTextures\\CommandButtons\\BTNParasiteOn.blp",
    modelAttachTarget = "origin",
    model = "Abilities\\Spells\\Other\\Parasite\\ParasiteTarget.mdl"
}, {
    id = "狂风之力",
    class = "基础",
    name = "狂风之力",
    describe = "被狂风之力眷顾，攻速/移速+100%",
    attribute = {attack_p = 1, move_speed_p = 1},
    isDebuff = false,
    levelDurMode = true,
    icon = "ReplaceableTextures\\CommandButtons\\BTNCyclone.blp",
    modelAttachTarget = "origin",
    model = "Abilities\\Spells\\Other\\Tornado\\Tornado_Target.mdl"
}, {
    id = "犹格索托斯之力",
    class = "基础",
    name = "犹格索托斯之力",
    describe = "犹格索托斯之力，范围300献祭，1000+最大生命值10%的真实伤害（多个来源可叠加）",
    interval = 1,
    isDebuff = false,
    levelDurMode = true,
    icon = "ReplaceableTextures\\CommandButtons\\BTNCloakOfFlames.blp",
    modelAttachTarget = "origin",
    model = "Abilities\\Spells\\NightElf\\Immolation\\ImmolationDamage.mdl"
}}
____exports["d_进攻怪加强buff"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
