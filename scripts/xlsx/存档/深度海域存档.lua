local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 5,["6"] = 5,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 44,["12"] = 45,["13"] = 45,["14"] = 45,["15"] = 45,["16"] = 45,["17"] = 45,["18"] = 45,["19"] = 45,["20"] = 45,["21"] = 44,["22"] = 55,["23"] = 55,["24"] = 55,["25"] = 55,["26"] = 55,["27"] = 55,["28"] = 55,["29"] = 55,["30"] = 55,["31"] = 55,["32"] = 55,["33"] = 55,["34"] = 44,["35"] = 70,["36"] = 70,["37"] = 70,["38"] = 70,["39"] = 70,["40"] = 70,["41"] = 70,["42"] = 70,["43"] = 70,["44"] = 70,["45"] = 70,["46"] = 70,["47"] = 44,["48"] = 85,["49"] = 85,["50"] = 85,["51"] = 85,["52"] = 85,["53"] = 85,["54"] = 85,["55"] = 85,["56"] = 85,["57"] = 85,["58"] = 85,["59"] = 85,["60"] = 44,["61"] = 100,["62"] = 100,["63"] = 100,["64"] = 100,["65"] = 100,["66"] = 100,["67"] = 100,["68"] = 100,["69"] = 100,["70"] = 44,["71"] = 110,["72"] = 110,["73"] = 110,["74"] = 110,["75"] = 110,["76"] = 110,["77"] = 110,["78"] = 110,["79"] = 110,["80"] = 110,["81"] = 110,["82"] = 110,["83"] = 44,["84"] = 125,["85"] = 125,["86"] = 125,["87"] = 125,["88"] = 125,["89"] = 125,["90"] = 125,["91"] = 125,["92"] = 125,["93"] = 44,["94"] = 135,["95"] = 135,["96"] = 135,["97"] = 135,["98"] = 135,["99"] = 135,["100"] = 135,["101"] = 135,["102"] = 135,["103"] = 44,["104"] = 145,["105"] = 145,["106"] = 145,["107"] = 145,["108"] = 145,["109"] = 145,["110"] = 145,["111"] = 145,["112"] = 145,["113"] = 145,["114"] = 145,["115"] = 44,["116"] = 159,["117"] = 159,["118"] = 159,["119"] = 159,["120"] = 159,["121"] = 159,["122"] = 159,["123"] = 159,["124"] = 159,["125"] = 159,["126"] = 159,["127"] = 44,["128"] = 173,["129"] = 173,["130"] = 173,["131"] = 173,["132"] = 173,["133"] = 173,["134"] = 173,["135"] = 173,["136"] = 173,["137"] = 173,["138"] = 173,["139"] = 44,["140"] = 44,["141"] = 188,["142"] = 192,["143"] = 194,["144"] = 195,["145"] = 196,["148"] = 199,["149"] = 199,["150"] = 199,["151"] = 200,["152"] = 201,["153"] = 202,["156"] = 199,["157"] = 199});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1 = require("state.存档.平台存档等地图相关奖励")
local _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1 = _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.data = {
    {
        id = "红色触手的灵魂碎片",
        class = "深度海域",
        name = "红色触手的灵魂碎片",
        requireKey = "sc_hscs",
        requireValMin = 10,
        describe = "集齐10个可以解锁红色触手，全属性+20，主炮造成伤害时有30%的概率使用触手击晕目标1秒并且造成10000的额外伤害(内置15秒cd)",
        icon = "图标\\深海存档\\红色触手的灵魂碎片.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "忠诚之心",
        class = "深度海域",
        name = "忠诚之心",
        requireKey = "sc_zczx",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {add_max_life_on_pers = 1},
        ["数量叠加"] = "地图等级",
        describe = "每秒生命值+1，堆叠数量最大=地图等级",
        icon = "图标\\深海存档\\忠诚之心.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "血色之心",
        class = "深度海域",
        name = "血色之心",
        requireKey = "sc_xszx",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {["每秒金币"] = 1},
        ["数量叠加"] = "地图等级",
        describe = "每秒金币+1，堆叠数量最大=地图等级",
        icon = "图标\\深海存档\\血色之心.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "污染之心",
        class = "深度海域",
        name = "污染之心",
        requireKey = "sc_wrzx",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {attack = 5},
        ["数量叠加"] = "地图等级",
        describe = "初始攻击+5，堆叠数量最大=地图等级",
        icon = "图标\\深海存档\\污染之心.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "深海巨兽的灵魂碎片",
        class = "深度海域",
        name = "深海巨兽的灵魂碎片",
        requireKey = "sc_shjs",
        requireValMin = 15,
        describe = "（集齐15个可解锁光环，深海巨兽，每5秒，对周围400范围释放一次毁灭，造成攻击力x0.5的伤害，通用）\n每多搜集5个，毁灭的伤害+20%，最大10级",
        icon = "图标\\深海存档\\深海巨兽的灵魂碎片.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "绝望之心",
        class = "深度海域",
        name = "绝望之心",
        requireKey = "sc_jwzx",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {damage_increased = 0.03},
        ["数量叠加"] = "地图等级",
        describe = "伤害加成+3%。堆叠数量=地图等级",
        icon = "图标\\深海存档\\绝望之心.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "大副的灵魂碎片",
        class = "深度海域",
        name = "大副的灵魂碎片",
        requireKey = "sc_dfsp",
        requireValMin = 20,
        describe = "（集齐20个可解锁大副的灵魂，初始召唤一个继承自己攻击力100%的大副灵魂，攻速为每秒1次）\n每多搜集5个，大副的攻速+20%，最大10级。",
        icon = "图标\\深海存档\\大副的灵魂碎片.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "古老者的灵魂碎片",
        class = "深度海域",
        name = "古老者的灵魂碎片",
        requireKey = "sc_glz",
        requireValMin = 25,
        describe = "（集齐25个可解锁古老者的灵魂，杀敌有30%概率全属性+1，每多搜集5个，概率+10%，只有5级）",
        icon = "图标\\深海存档\\古老者的灵魂碎片.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "神话权柄",
        class = "深度海域",
        name = "神话权柄",
        requireKey = "shqb",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {damage_increased = 0.005},
        describe = "每拥有一个神话权柄，造成的伤害增加0.5%\n叠加上限=地图等级*地图等级 \n（深度海域16层掉落此存档）\n",
        icon = "图标\\深海存档\\神话权柄.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "神话尽头的呼唤",
        class = "深度海域",
        name = "神话尽头的呼唤",
        requireKey = "sc_shjt",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {["受到英雄伤害减免"] = 0.2},
        describe = "受到BOSS伤害-20%",
        icon = "图标\\深海存档\\神话尽头的呼唤.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "拒绝神话生物",
        class = "深度海域",
        name = "拒绝神话生物",
        requireKey = "sc_jjsh",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {["对英雄增加伤害"] = 0.2},
        describe = "BOSS伤害+20%",
        icon = "图标\\深海存档\\拒绝神话生物.blp",
        uiShowType = "通用图标面板"
    }
}
____exports["d_深度海域存档"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
    BaseUtil.runLater(
        0.1,
        function()
            for ____, datum in ipairs(____exports.data) do
                if datum.id then
                    _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1:distributeRewards(datum)
                end
            end
        end
    )
end
return ____exports
