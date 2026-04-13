local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 61,["8"] = 62,["9"] = 62,["10"] = 62,["11"] = 62,["12"] = 62,["13"] = 62,["14"] = 62,["15"] = 62,["16"] = 62,["17"] = 62,["18"] = 62,["19"] = 62,["20"] = 62,["21"] = 62,["22"] = 62,["23"] = 62,["24"] = 62,["25"] = 62,["26"] = 61,["27"] = 83,["28"] = 83,["29"] = 83,["30"] = 83,["31"] = 83,["32"] = 83,["33"] = 83,["34"] = 83,["35"] = 83,["36"] = 83,["37"] = 83,["38"] = 83,["39"] = 83,["40"] = 83,["41"] = 83,["42"] = 83,["43"] = 83,["44"] = 83,["45"] = 61,["46"] = 104,["47"] = 104,["48"] = 104,["49"] = 104,["50"] = 104,["51"] = 104,["52"] = 104,["53"] = 104,["54"] = 104,["55"] = 104,["56"] = 104,["57"] = 104,["58"] = 104,["59"] = 104,["60"] = 104,["61"] = 104,["62"] = 104,["63"] = 104,["64"] = 61,["65"] = 125,["66"] = 125,["67"] = 125,["68"] = 125,["69"] = 125,["70"] = 125,["71"] = 125,["72"] = 125,["73"] = 125,["74"] = 125,["75"] = 125,["76"] = 125,["77"] = 125,["78"] = 125,["79"] = 125,["80"] = 125,["81"] = 125,["82"] = 125,["83"] = 61,["84"] = 146,["85"] = 146,["86"] = 146,["87"] = 146,["88"] = 146,["89"] = 146,["90"] = 146,["91"] = 146,["92"] = 146,["93"] = 146,["94"] = 146,["95"] = 146,["96"] = 146,["97"] = 146,["98"] = 146,["99"] = 146,["100"] = 146,["101"] = 146,["102"] = 61,["103"] = 61,["104"] = 168,["105"] = 172,["106"] = 174,["107"] = 175,["108"] = 176});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {
    {
        id = "大和号主炮",
        name = "大和号主炮",
        describe = "射程：600\n伤害：攻击力x1\n射速：0.8",
        ["sc_射程"] = 600,
        ["ss_射速"] = 0.8,
        ["shgs_伤害公式"] = {attack = 0.5},
        ["sh_伤害"] = "攻击力x1",
        missileModel = "Abilities\\Weapons\\SorceressMissile\\SorceressMissile.mdx",
        ["ts_特殊"] = "无",
        icon = "船图标\\木船-主炮.blp",
        class = "主炮",
        targetType = "无目标",
        passive = true,
        range = 1000,
        area = 200,
        x = 0,
        y = 2
    },
    {
        id = "无敌战舰号主炮",
        name = "无敌战舰号主炮",
        describe = "射程：2000\n伤害：攻击力x10\n射速：3（弹道很慢）",
        ["sc_射程"] = 2000,
        ["ss_射速"] = 3,
        ["shgs_伤害公式"] = {attack = 0.5},
        ["sh_伤害"] = "攻击力x10",
        missileModel = "Abilities\\Weapons\\BloodElfSpellThiefMISSILE\\BloodElfSpellThiefMISSILE.mdx",
        ["ts_特殊"] = "无",
        icon = "船图标\\木船-主炮.blp",
        class = "主炮",
        targetType = "无目标",
        passive = true,
        range = 1000,
        area = 200,
        x = 0,
        y = 2
    },
    {
        id = "巨型海怪主炮",
        name = "巨型海怪主炮",
        describe = "主炮：\n射程：2000\n伤害：攻击力x1\n射速：5",
        ["sc_射程"] = 2000,
        ["ss_射速"] = 5,
        ["shgs_伤害公式"] = {attack = 0.5},
        ["sh_伤害"] = "攻击力x1",
        missileModel = "Abilities\\Weapons\\RedDragonBreath\\RedDragonMissile.mdx",
        ["ts_特殊"] = "无",
        icon = "船图标\\木船-主炮.blp",
        class = "主炮",
        targetType = "无目标",
        passive = true,
        range = 1000,
        area = 200,
        x = 0,
        y = 2
    },
    {
        id = "克希拉主炮",
        name = "克希拉主炮",
        describe = "射程：2000\n伤害：攻击力x1\n射速：3",
        ["sc_射程"] = 2000,
        ["ss_射速"] = 3,
        ["shgs_伤害公式"] = {attack = 0.5},
        ["sh_伤害"] = "攻击力x1",
        missileModel = "abilities\\weapons\\catapult\\catapultmissile.mdx",
        ["ts_特殊"] = "无",
        icon = "船图标\\木船-主炮.blp",
        class = "主炮",
        targetType = "无目标",
        passive = true,
        range = 1000,
        area = 200,
        x = 0,
        y = 2
    },
    {
        id = "克苏鲁主炮",
        name = "克苏鲁主炮",
        describe = "射程：600\n伤害：攻击力x0.5\n射速：1",
        ["sc_射程"] = 600,
        ["ss_射速"] = 1,
        ["shgs_伤害公式"] = {attack = 0.5},
        ["sh_伤害"] = "攻击力x0.5",
        missileModel = "Abilities\\Weapons\\FireballMissile\\FireballMissile.mdx",
        ["ts_特殊"] = "无",
        icon = "船图标\\木船-主炮.blp",
        class = "主炮",
        targetType = "无目标",
        passive = true,
        range = 1000,
        area = 200,
        x = 0,
        y = 2
    }
}
____exports["d_进攻怪boss主炮"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
