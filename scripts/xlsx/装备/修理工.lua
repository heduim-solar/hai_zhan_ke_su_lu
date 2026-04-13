local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 40,["8"] = 41,["9"] = 41,["10"] = 41,["11"] = 41,["12"] = 41,["13"] = 41,["14"] = 41,["15"] = 41,["16"] = 41,["17"] = 41,["18"] = 41,["19"] = 41,["20"] = 40,["21"] = 56,["22"] = 56,["23"] = 56,["24"] = 56,["25"] = 56,["26"] = 56,["27"] = 56,["28"] = 56,["29"] = 56,["30"] = 56,["31"] = 56,["32"] = 56,["33"] = 40,["34"] = 71,["35"] = 71,["36"] = 71,["37"] = 71,["38"] = 71,["39"] = 71,["40"] = 71,["41"] = 71,["42"] = 71,["43"] = 71,["44"] = 71,["45"] = 71,["46"] = 40,["47"] = 86,["48"] = 86,["49"] = 86,["50"] = 86,["51"] = 86,["52"] = 86,["53"] = 86,["54"] = 86,["55"] = 86,["56"] = 86,["57"] = 86,["58"] = 86,["59"] = 40,["60"] = 101,["61"] = 101,["62"] = 101,["63"] = 101,["64"] = 101,["65"] = 101,["66"] = 101,["67"] = 101,["68"] = 101,["69"] = 101,["70"] = 101,["71"] = 101,["72"] = 40,["73"] = 116,["74"] = 116,["75"] = 116,["76"] = 116,["77"] = 116,["78"] = 116,["79"] = 116,["80"] = 116,["81"] = 116,["82"] = 116,["83"] = 116,["84"] = 116,["85"] = 40,["86"] = 131,["87"] = 131,["88"] = 131,["89"] = 131,["90"] = 131,["91"] = 131,["92"] = 131,["93"] = 131,["94"] = 131,["95"] = 131,["96"] = 131,["97"] = 131,["98"] = 40,["99"] = 146,["100"] = 146,["101"] = 146,["102"] = 146,["103"] = 146,["104"] = 146,["105"] = 146,["106"] = 146,["107"] = 146,["108"] = 146,["109"] = 146,["110"] = 146,["111"] = 40,["112"] = 161,["113"] = 161,["114"] = 161,["115"] = 161,["116"] = 161,["117"] = 161,["118"] = 161,["119"] = 161,["120"] = 161,["121"] = 161,["122"] = 161,["123"] = 161,["124"] = 40,["125"] = 176,["126"] = 176,["127"] = 176,["128"] = 176,["129"] = 176,["130"] = 176,["131"] = 176,["132"] = 176,["133"] = 176,["134"] = 176,["135"] = 176,["136"] = 176,["137"] = 40,["138"] = 40,["139"] = 192,["140"] = 196,["141"] = 198,["142"] = 199,["143"] = 200});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {
    {
        id = "修理工Lv1",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv1",
        describe = "每秒恢复5点生命值\n点击回血20%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工1.blp",
        maxCd = 15,
        goldCost = 100,
        pawnable = 1,
        reply_life_p = 0.2,
        attribute = {reply_life_on_pers = 5}
    },
    {
        id = "修理工Lv2",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv2",
        describe = "每秒恢复10点生命值\n点击回血25%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工2.blp",
        maxCd = 15,
        goldCost = 200,
        pawnable = 1,
        reply_life_p = 0.25,
        attribute = {reply_life_on_pers = 10}
    },
    {
        id = "修理工Lv3",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv3",
        describe = "每秒恢复20点生命值\n点击回血30%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工3.blp",
        maxCd = 15,
        goldCost = 400,
        pawnable = 1,
        reply_life_p = 0.3,
        attribute = {reply_life_on_pers = 20}
    },
    {
        id = "修理工Lv4",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv4",
        describe = "每秒恢复40点生命值\n点击回血35%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工4.blp",
        maxCd = 15,
        goldCost = 800,
        pawnable = 1,
        reply_life_p = 0.35,
        attribute = {reply_life_on_pers = 40}
    },
    {
        id = "修理工Lv5",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv5",
        describe = "每秒恢复80点生命值\n点击回血40%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工5.blp",
        maxCd = 15,
        goldCost = 1600,
        pawnable = 1,
        reply_life_p = 0.39999999999999997,
        attribute = {reply_life_on_pers = 80}
    },
    {
        id = "修理工Lv6",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv6",
        describe = "每秒恢复160点生命值\n点击回血45%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工6.blp",
        maxCd = 15,
        goldCost = 3200,
        pawnable = 1,
        reply_life_p = 0.44999999999999996,
        attribute = {reply_life_on_pers = 160}
    },
    {
        id = "修理工Lv7",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv7",
        describe = "每秒恢复320点生命值\n点击回血50%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工7.blp",
        maxCd = 15,
        goldCost = 6400,
        pawnable = 1,
        reply_life_p = 0.49999999999999994,
        attribute = {reply_life_on_pers = 320}
    },
    {
        id = "修理工Lv8",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv8",
        describe = "每秒恢复640点生命值\n点击回血55%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工8.blp",
        maxCd = 15,
        goldCost = 12800,
        pawnable = 1,
        reply_life_p = 0.5499999999999999,
        attribute = {reply_life_on_pers = 640}
    },
    {
        id = "修理工Lv9",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv9",
        describe = "每秒恢复1280点生命值\n点击回血60%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工9.blp",
        maxCd = 15,
        goldCost = 25600,
        pawnable = 1,
        reply_life_p = 0.6,
        attribute = {reply_life_on_pers = 1280}
    },
    {
        id = "修理工Lv10",
        class = "基础属性装备",
        passive = false,
        name = "修理工Lv10",
        describe = "每秒恢复2560点生命值\n点击回血80%最大值+50倍基础每秒恢复值",
        icon = "物品图标\\修理工\\修理工10.blp",
        maxCd = 15,
        goldCost = 51200,
        pawnable = 1,
        reply_life_p = 0.8,
        attribute = {reply_life_on_pers = 2560}
    }
}
____exports["d_修理工"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
