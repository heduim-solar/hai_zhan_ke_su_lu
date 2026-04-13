local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 122,["8"] = 123,["9"] = 123,["10"] = 123,["11"] = 123,["12"] = 123,["13"] = 123,["14"] = 123,["15"] = 123,["16"] = 123,["17"] = 123,["18"] = 123,["19"] = 123,["20"] = 123,["21"] = 123,["22"] = 123,["23"] = 123,["24"] = 123,["25"] = 123,["26"] = 123,["27"] = 123,["28"] = 123,["29"] = 123,["30"] = 123,["31"] = 123,["32"] = 123,["33"] = 123,["34"] = 123,["35"] = 123,["36"] = 123,["37"] = 123,["38"] = 123,["39"] = 123,["40"] = 123,["41"] = 123,["42"] = 123,["43"] = 123,["44"] = 123,["45"] = 123,["46"] = 123,["47"] = 123,["48"] = 123,["49"] = 122,["50"] = 166,["51"] = 166,["52"] = 166,["53"] = 166,["54"] = 166,["55"] = 166,["56"] = 166,["57"] = 166,["58"] = 166,["59"] = 166,["60"] = 166,["61"] = 166,["62"] = 166,["63"] = 166,["64"] = 166,["65"] = 166,["66"] = 166,["67"] = 166,["68"] = 166,["69"] = 166,["70"] = 166,["71"] = 166,["72"] = 166,["73"] = 166,["74"] = 166,["75"] = 166,["76"] = 166,["77"] = 166,["78"] = 166,["79"] = 166,["80"] = 166,["81"] = 166,["82"] = 166,["83"] = 166,["84"] = 166,["85"] = 166,["86"] = 166,["87"] = 166,["88"] = 166,["89"] = 166,["90"] = 166,["91"] = 166,["92"] = 122,["93"] = 211,["94"] = 215,["95"] = 217,["96"] = 218,["97"] = 219});
local ____exports = {}
local _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B = require("state.单位.受到伤害时限制最大伤害值为生命值比例")
local _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B = _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B.default
____exports.data = {{
    id = "A44n",
    _parent = "ugho",
    Name = "秒杀守护者",
    dmgplus1 = 999999999,
    HP = 5000000,
    def = 100,
    defUp = 3.2,
    ["最大受到伤害"] = 0.01,
    cool1 = 0.1,
    Art = "ReplaceableTextures\\CommandButtons\\BTNWindSerpent.blp",
    file = "units\\naga\\WindSerpent\\WindSerpent.mdl",
    level = 36,
    spd = 522,
    hideHeroMinimap = 0,
    fused = 0,
    moveHeight = 300,
    movetp = "fly",
    scale = 1,
    modelScale = 2,
    red = 255,
    green = 0,
    blue = 0,
    dmgUp1 = 230,
    sight = 1000,
    regenType = "always",
    dice1 = 1,
    points = 600,
    bountydice = 0,
    rangeN1 = 800,
    dropItems = 0,
    bountysides = 0,
    regenHP = 0,
    type = "",
    canFlee = 0,
    sides1 = 1,
    collision = 60,
    bountyplus = 0,
    RngBuff1 = 2000,
    nsight = 1000,
    Propernames = "秒杀守护者",
    acquire = 800
}, {
    id = "A45g",
    _parent = "ugho",
    Name = "污染源",
    nameCount = 1,
    dmgplus1 = 0,
    HP = 5000000,
    def = 200,
    defUp = 3.2,
    cool1 = 1,
    Art = "ReplaceableTextures\\CommandButtons\\BTNWindSerpent.blp",
    file = "model\\进攻怪\\污染核心.mdx",
    level = 36,
    weapsOn = 0,
    spd = 0,
    hideHeroMinimap = 1,
    fused = 0,
    moveHeight = 300,
    movetp = "fly",
    scale = 1,
    modelScale = 2,
    red = 0,
    green = 255,
    blue = 0,
    dmgUp1 = 230,
    sight = 1000,
    regenType = "always",
    dice1 = 1,
    points = 600,
    bountydice = 0,
    rangeN1 = 800,
    dropItems = 0,
    bountysides = 0,
    regenHP = 40000,
    type = "",
    canFlee = 0,
    sides1 = 1,
    collision = 60,
    bountyplus = 0,
    RngBuff1 = 0,
    nsight = 1000,
    Propernames = "污染源",
    acquire = 800
}}
____exports["d_野怪"] = ____exports.data
function ____exports.default(self)
    for ____, d in ipairs(____exports.data) do
        if d.id and d["最大受到伤害"] then
            _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B.config[d.id] = d["最大受到伤害"]
        end
    end
end
return ____exports
