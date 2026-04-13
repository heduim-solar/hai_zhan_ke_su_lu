local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 38,["8"] = 38,["9"] = 38,["10"] = 38,["11"] = 38,["12"] = 38,["13"] = 38,["14"] = 38,["15"] = 38,["16"] = 38,["17"] = 38,["18"] = 89,["19"] = 89,["20"] = 89,["21"] = 89,["22"] = 89,["23"] = 89,["24"] = 89,["25"] = 38,["26"] = 97,["27"] = 97,["28"] = 97,["29"] = 97,["30"] = 97,["31"] = 97,["32"] = 97,["33"] = 38,["34"] = 105,["35"] = 105,["36"] = 105,["37"] = 105,["38"] = 105,["39"] = 105,["40"] = 105,["41"] = 38,["42"] = 38,["43"] = 114,["44"] = 118,["45"] = 119,["46"] = 120,["47"] = 121,["48"] = 122,["49"] = 123,["50"] = 124,["51"] = 125,["52"] = 126,["53"] = 127,["54"] = 128,["55"] = 129,["56"] = 130,["57"] = 131});
local ____exports = {}
local ____MapBaseInitState = require("state.module.MapBaseInitState")
local MapBaseInitState = ____MapBaseInitState.default
____exports.data = {
    {key_name = "全图视野", value = false, ["#<%1%>#"] = "import MapBaseInitState from \"state/module/MapBaseInitState\";\nMapBaseInitState.config.player_see = false"},
    {key_name = "初始镜头高度", value = 3000, ["#<%1%>#"] = "MapBaseInitState.config.initial_lens_height = 3000"},
    {key_name = "开局初始金币", value = 100, ["#<%1%>#"] = "MapBaseInitState.config.gold = 100"},
    {key_name = "开局初始木材", value = 0, ["#<%1%>#"] = "MapBaseInitState.config.wood = 0"},
    {key_name = "开局初始人口", value = 0, ["#<%1%>#"] = "MapBaseInitState.config.population = 0"},
    {key_name = "开局提示文本", value = " ", ["#<%1%>#"] = "MapBaseInitState.config.start_text = ' '"},
    {key_name = "开启玩家赏金奖励", value = "11,12", ["#<%1%>#"] = "MapBaseInitState.config.open_gives_bounty = [11,12]"},
    {key_name = "开局起始点创建单位", value = "A3zz", ["#<%1%>#"] = "MapBaseInitState.config.start_CreateUnitType = 'A3zz'"},
    {key_name = "地图等级平方奖励金币", value = 50, ["#<%1%>#"] = "MapBaseInitState.config.goldForMapLvl = 50"},
    {key_name = "收藏地图开局奖励金币", value = 0, ["#<%1%>#"] = "MapBaseInitState.config.addGoldByCollect = 0"},
    {
        key_name = "输入礼包码获得金币",
        value = "n:金币兑换码,v:100",
        ["#<%1%>#"] = "MapBaseInitState.config.addGoldsOnChat.yyds = {\"n\":\"金币兑换码\",\"v\":100}",
        v1 = "yyds",
        v2 = "金币兑换码",
        v3 = 100
    },
    {
        key_name = "输入礼包码获得金币",
        value = "n:金币兑换码,v:10",
        ["#<%1%>#"] = "MapBaseInitState.config.addGoldsOnChat.我是菜鸟 = {\"n\":\"金币兑换码\",\"v\":10}",
        v1 = "我是菜鸟",
        v2 = "金币兑换码",
        v3 = 10
    },
    {
        key_name = "输入礼包码获得木材",
        value = "n:木材兑换码,v:1",
        ["#<%1%>#"] = "MapBaseInitState.config.addLumbersOnChat.我要木材 = {\"n\":\"木材兑换码\",\"v\":1}",
        v1 = "我要木材",
        v2 = "木材兑换码",
        v3 = 1
    }
}
____exports["d_基础"] = ____exports.data
function ____exports.default(self)
    MapBaseInitState.config.player_see = false
    MapBaseInitState.config.initial_lens_height = 3000
    MapBaseInitState.config.gold = 0
    MapBaseInitState.config.wood = 0
    MapBaseInitState.config.population = 0
    MapBaseInitState.config.start_text = " "
    MapBaseInitState.config.open_gives_bounty = {11, 12}
    MapBaseInitState.config.start_CreateUnitType = "A3zz"
    MapBaseInitState.config.goldForMapLvl = 0
    MapBaseInitState.config.addGoldByCollect = 0
    MapBaseInitState.config.addGoldsOnChat.yyds = {n = "金币兑换码", v = 100}
    MapBaseInitState.config.addGoldsOnChat["我是菜鸟"] = {n = "金币兑换码", v = 10}
    MapBaseInitState.config.addLumbersOnChat["我要木材"] = {n = "木材兑换码", v = 1}
end
return ____exports
