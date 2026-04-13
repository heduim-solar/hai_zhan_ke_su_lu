local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 5,["6"] = 5,["7"] = 6,["8"] = 6,["9"] = 7,["10"] = 7,["11"] = 46,["12"] = 47,["13"] = 47,["14"] = 47,["15"] = 47,["16"] = 47,["17"] = 47,["18"] = 47,["19"] = 47,["20"] = 47,["21"] = 46,["22"] = 57,["23"] = 57,["24"] = 57,["25"] = 57,["26"] = 57,["27"] = 57,["28"] = 57,["29"] = 57,["30"] = 57,["31"] = 57,["32"] = 57,["33"] = 57,["34"] = 57,["35"] = 57,["36"] = 46,["37"] = 75,["38"] = 75,["39"] = 75,["40"] = 75,["41"] = 75,["42"] = 75,["43"] = 75,["44"] = 75,["45"] = 75,["46"] = 75,["47"] = 75,["48"] = 75,["49"] = 75,["50"] = 75,["51"] = 46,["52"] = 92,["53"] = 92,["54"] = 92,["55"] = 92,["56"] = 92,["57"] = 92,["58"] = 92,["59"] = 92,["60"] = 92,["61"] = 92,["62"] = 92,["63"] = 92,["64"] = 92,["65"] = 92,["66"] = 46,["67"] = 109,["68"] = 109,["69"] = 109,["70"] = 109,["71"] = 109,["72"] = 109,["73"] = 109,["74"] = 109,["75"] = 109,["76"] = 109,["77"] = 109,["78"] = 109,["79"] = 109,["80"] = 109,["81"] = 46,["82"] = 127,["83"] = 127,["84"] = 127,["85"] = 127,["86"] = 127,["87"] = 127,["88"] = 127,["89"] = 127,["90"] = 127,["91"] = 127,["92"] = 127,["93"] = 127,["94"] = 127,["95"] = 127,["96"] = 46,["97"] = 46,["98"] = 145,["99"] = 149,["100"] = 151,["101"] = 152,["102"] = 153,["105"] = 156,["106"] = 156,["107"] = 156,["108"] = 157,["109"] = 158,["110"] = 159,["113"] = 156,["114"] = 156});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1 = require("state.存档.平台存档等地图相关奖励")
local _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1 = _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.data = {
    {
        id = "历史中的战舰碎片",
        class = "战舰碎片",
        name = "历史中的战舰碎片",
        requireKey = "Izjsp",
        requireValMin = 1,
        describe = "在深度海域获得的战舰碎片可以在这里进行分配到需要的加强方位，然后左键点击探索积分是总确认。右键点击是撤销。其他方位图标左键是+1 右键是-1。",
        icon = "图标\\深海存档\\历史中的战舰碎片.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "防御加强",
        class = "战舰碎片",
        name = "防御加强",
        requireKey = "xdh_1",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {def = 1, life = 50},
        ["数量叠加"] = "无上限",
        ["显示数量"] = false,
        ["兑换需要点数"] = 5,
        describe = "护甲+1，生命值+50。",
        icon = "图标\\深海存档\\防御加强.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "攻击加强",
        class = "战舰碎片",
        name = "攻击加强",
        requireKey = "xdh_2",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {attack = 10},
        ["数量叠加"] = "无上限",
        ["显示数量"] = false,
        ["兑换需要点数"] = 10,
        describe = "攻击力+10",
        icon = "图标\\深海存档\\攻击加强.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "射程加强",
        class = "战舰碎片",
        name = "射程加强",
        requireKey = "xdh_3",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {autoMissileAttackRange = 50},
        ["数量叠加"] = "无上限",
        ["显示数量"] = false,
        ["兑换需要点数"] = 50,
        describe = "主炮射程+50",
        icon = "图标\\深海存档\\射程加强.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "属性加强",
        class = "战舰碎片",
        name = "属性加强",
        requireKey = "xdh_4",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {full_property = 10, add_gold_on_kill = 1},
        ["数量叠加"] = "无上限",
        ["显示数量"] = false,
        ["兑换需要点数"] = 100,
        describe = "基础全属性+10，杀敌金币+1",
        icon = "图标\\深海存档\\属性加强.blp",
        uiShowType = "通用图标面板"
    },
    {
        id = "成长加强",
        class = "战舰碎片",
        name = "成长加强",
        requireKey = "xdh_5",
        requireValMin = 1,
        rewardKey = "加属性",
        rewardVal = {["杀敌经验"] = 1},
        ["数量叠加"] = "无上限",
        ["显示数量"] = false,
        ["兑换需要点数"] = 200,
        describe = "杀敌经验值+1",
        icon = "图标\\深海存档\\成长加强.blp",
        uiShowType = "通用图标面板"
    }
}
____exports["d_历史中的战舰碎片"] = ____exports.data
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
