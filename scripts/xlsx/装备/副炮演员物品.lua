local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 47,["10"] = 48,["11"] = 48,["12"] = 48,["13"] = 48,["14"] = 48,["15"] = 48,["16"] = 48,["17"] = 48,["18"] = 48,["19"] = 48,["20"] = 48,["21"] = 48,["22"] = 47,["23"] = 63,["24"] = 63,["25"] = 63,["26"] = 63,["27"] = 63,["28"] = 63,["29"] = 63,["30"] = 63,["31"] = 63,["32"] = 63,["33"] = 47,["34"] = 76,["35"] = 76,["36"] = 76,["37"] = 76,["38"] = 76,["39"] = 76,["40"] = 76,["41"] = 76,["42"] = 76,["43"] = 47,["44"] = 86,["45"] = 86,["46"] = 86,["47"] = 86,["48"] = 86,["49"] = 86,["50"] = 86,["51"] = 86,["52"] = 86,["53"] = 86,["54"] = 86,["55"] = 86,["56"] = 47,["57"] = 101,["58"] = 101,["59"] = 101,["60"] = 101,["61"] = 101,["62"] = 101,["63"] = 101,["64"] = 101,["65"] = 101,["66"] = 101,["67"] = 101,["68"] = 101,["69"] = 47,["70"] = 116,["71"] = 116,["72"] = 116,["73"] = 116,["74"] = 116,["75"] = 116,["76"] = 116,["77"] = 116,["78"] = 116,["79"] = 116,["80"] = 116,["81"] = 116,["82"] = 47,["83"] = 131,["84"] = 131,["85"] = 131,["86"] = 131,["87"] = 131,["88"] = 131,["89"] = 131,["90"] = 131,["91"] = 131,["92"] = 131,["93"] = 131,["94"] = 131,["95"] = 47,["96"] = 147,["97"] = 147,["98"] = 147,["99"] = 147,["100"] = 147,["101"] = 147,["102"] = 147,["103"] = 147,["104"] = 147,["105"] = 147,["106"] = 147,["107"] = 147,["108"] = 47,["109"] = 163,["110"] = 163,["111"] = 163,["112"] = 163,["113"] = 163,["114"] = 163,["115"] = 163,["116"] = 163,["117"] = 163,["118"] = 163,["119"] = 163,["120"] = 163,["121"] = 163,["122"] = 47,["123"] = 182,["124"] = 182,["125"] = 182,["126"] = 182,["127"] = 182,["128"] = 182,["129"] = 182,["130"] = 182,["131"] = 182,["132"] = 182,["133"] = 182,["134"] = 182,["135"] = 182,["136"] = 47,["137"] = 201,["138"] = 201,["139"] = 201,["140"] = 201,["141"] = 201,["142"] = 201,["143"] = 201,["144"] = 201,["145"] = 201,["146"] = 201,["147"] = 201,["148"] = 201,["149"] = 201,["150"] = 201,["151"] = 47,["152"] = 221,["153"] = 221,["154"] = 221,["155"] = 221,["156"] = 221,["157"] = 221,["158"] = 221,["159"] = 221,["160"] = 221,["161"] = 221,["162"] = 221,["163"] = 221,["164"] = 221,["165"] = 221,["166"] = 47,["167"] = 47,["168"] = 242,["169"] = 246,["170"] = 248,["171"] = 249,["172"] = 250,["175"] = 254,["176"] = 255,["177"] = 256});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____SolarNewItemsFormulaState = require("state.common.SolarNewItemsFormulaState")
local SolarNewItemsFormulaState = ____SolarNewItemsFormulaState.default
____exports.data = {
    {
        id = "天雷炮",
        describe = "射程：600\n伤害：攻击力x0.5\n射速：0.3\n特殊：造成伤害时有15%概率触发连锁闪电，造成全属性x1的弹射雷霆，可弹跳5次。|n|cffcccccc天雷炮+lv10桅杆x2+lv10炮弹x2+制作书=【雷霆支配者】|r",
        class = "副炮",
        passive = true,
        name = "天雷炮",
        icon = "物品图标\\副炮\\01天雷炮.blp",
        ["sc_射程"] = 600,
        ["ss_射速"] = 0.3,
        ["shgs_伤害公式"] = {attack = 0.5},
        goldCost = 1400,
        pawnable = 1
    },
    {
        id = "喋血炮",
        describe = "伤害吸血+2%|n|cffccccccLV10船头+LV10桅杆+LV10船帆+喋血炮x2+合成书=黑胡子|r",
        class = "副炮",
        passive = true,
        name = "喋血炮",
        icon = "物品图标\\副炮\\02喋血炮.blp",
        goldCost = 2000,
        attribute = {blood_sucking = 0.02},
        pawnable = 1
    },
    {
        id = "环雷装置",
        describe = "每秒对身边的敌人造成持续伤害，伤害为1000+10%生命值。",
        class = "副炮",
        passive = true,
        name = "环雷装置",
        icon = "物品图标\\副炮\\03环雷装置.blp",
        goldCost = 10000,
        pawnable = 1
    },
    {
        id = "刮痧装置",
        describe = "射程：600\n伤害：攻击力x0.1\n射速：0.1\n特殊：该副炮造成伤害时削弱目标1点护甲，持续5秒，刷新叠加，最多100层。\n|n|cffcccccc 刮痧装置+lv10船帆x2+制作书=【小丑】|r",
        class = "副炮",
        passive = true,
        name = "刮痧装置",
        icon = "物品图标\\副炮\\04刮痧装置.blp",
        ["sc_射程"] = 600,
        ["ss_射速"] = 0.1,
        ["shgs_伤害公式"] = {attack = 0.1},
        goldCost = 50000,
        pawnable = 1
    },
    {
        id = "破甲装置",
        describe = "射程：600\n伤害：攻击力x0.1\n射速：0.1\n特殊：范围600的敌人护甲-30%\n|n|cffcccccc 破甲装置+致命炮+lv10炮弹=【两仪式】|r",
        class = "副炮",
        passive = true,
        name = "破甲装置",
        icon = "物品图标\\副炮\\05破甲装置.blp",
        ["sc_射程"] = 600,
        ["ss_射速"] = 0.1,
        ["shgs_伤害公式"] = {attack = 0.1},
        goldCost = 50000,
        pawnable = 1
    },
    {
        id = "刺蛇炮",
        describe = "射程：600\n伤害：攻击力x0.1\n射速：1\n特殊：该副炮造成伤害时会让目标中毒，每秒受到10000点真实伤害，持续5秒。",
        class = "副炮",
        passive = true,
        name = "刺蛇炮",
        icon = "物品图标\\副炮\\06刺蛇炮.blp",
        ["sc_射程"] = 600,
        ["ss_射速"] = 1,
        ["shgs_伤害公式"] = {attack = 0.1},
        goldCost = 50000,
        pawnable = 1
    },
    {
        id = "致命炮",
        describe = "射程：800\n伤害：1000+攻击力x2\n射速：0.35\n特殊：该主炮造成伤害时有20%概率x5。\n|n|cffcccccc 破甲装置+致命炮+lv10炮弹=【两仪式】|r",
        class = "副炮",
        passive = true,
        name = "致命炮",
        icon = "物品图标\\副炮\\07致命炮.blp",
        ["sc_射程"] = 800,
        ["ss_射速"] = 0.35,
        ["shgs_伤害公式"] = {base = 1000, attack = 2},
        goldCost = 30000,
        pawnable = 1
    },
    {
        id = "激光炮",
        describe = "射程：800\n伤害：500+攻击力x0.2\n射速：0.1\n特殊：无\n激光炮 + 激光炮 = 激光炮lv2",
        class = "副炮",
        passive = true,
        name = "激光炮",
        icon = "物品图标\\副炮\\08激光炮.blp",
        ["sc_射程"] = 800,
        ["ss_射速"] = 0.1,
        ["shgs_伤害公式"] = {base = 500, attack = 0.2},
        goldCost = 10000,
        pawnable = 1
    },
    {
        id = "激光炮lv2",
        describe = "射程：800\n伤害：1000+攻击力x0.3\n射速：0.1\n特殊：无\n激光炮lv2 + 激光炮lv2 = 激光炮lv3",
        class = "副炮",
        passive = true,
        name = "激光炮lv2",
        icon = "物品图标\\副炮\\09激光炮lv2.blp",
        ["sc_射程"] = 800,
        ["ss_射速"] = 0.1,
        ["shgs_伤害公式"] = {base = 1000, attack = 0.3},
        goldCost = 20000,
        itemMaterialsFormula = {["激光炮"] = 2},
        pawnable = 1
    },
    {
        id = "激光炮lv3",
        describe = "射程：800\n伤害：2000+攻击力x0.4\n射速：0.1\n特殊：无\n激光炮lv3 + 激光炮lv3 = 激光炮lv4",
        class = "副炮",
        passive = true,
        name = "激光炮lv3",
        icon = "物品图标\\副炮\\10激光炮lv3.blp",
        ["sc_射程"] = 800,
        ["ss_射速"] = 0.1,
        ["shgs_伤害公式"] = {base = 2000, attack = 0.4},
        goldCost = 40000,
        itemMaterialsFormula = {["激光炮lv2"] = 2},
        pawnable = 1
    },
    {
        id = "激光炮lv4",
        describe = "射程：800\n伤害：2000+攻击力x0.5\n射速：0.1\n特殊：激光炮可同时攻击2个单位",
        class = "副炮",
        passive = true,
        name = "激光炮lv4",
        icon = "物品图标\\副炮\\11激光炮lv4.blp",
        ["最大目标数量"] = 2,
        ["sc_射程"] = 800,
        ["ss_射速"] = 0.1,
        ["shgs_伤害公式"] = {base = 2000, attack = 0.5},
        goldCost = 80000,
        itemMaterialsFormula = {["激光炮lv3"] = 2},
        pawnable = 1
    },
    {
        id = "激光炮lv5",
        describe = "射程：800\n伤害：2000+攻击力x0.6\n射速：0.1\n特殊：激光炮可同时攻击3个单位\n激光炮LV5攻击次数达到3000次升级到【炮姐】",
        class = "副炮",
        passive = true,
        name = "激光炮lv5",
        icon = "物品图标\\副炮\\12激光炮lv5.blp",
        ["最大目标数量"] = 3,
        ["sc_射程"] = 800,
        ["ss_射速"] = 0.1,
        ["shgs_伤害公式"] = {base = 2000, attack = 0.6},
        goldCost = 160000,
        itemMaterialsFormula = {["激光炮lv4"] = 2},
        pawnable = 1
    }
}
____exports["d_副炮演员物品"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
    for ____, datum in ipairs(____exports.data) do
        if datum.itemMaterialsFormula then
            SolarNewItemsFormulaState.config[datum.id] = {material = datum.itemMaterialsFormula}
        end
    end
end
return ____exports
