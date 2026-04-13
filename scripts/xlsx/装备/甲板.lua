local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 37,["8"] = 38,["9"] = 38,["10"] = 38,["11"] = 38,["12"] = 38,["13"] = 38,["14"] = 38,["15"] = 38,["16"] = 38,["17"] = 38,["18"] = 37,["19"] = 51,["20"] = 51,["21"] = 51,["22"] = 51,["23"] = 51,["24"] = 51,["25"] = 51,["26"] = 51,["27"] = 51,["28"] = 51,["29"] = 37,["30"] = 64,["31"] = 64,["32"] = 64,["33"] = 64,["34"] = 64,["35"] = 64,["36"] = 64,["37"] = 64,["38"] = 64,["39"] = 64,["40"] = 37,["41"] = 77,["42"] = 77,["43"] = 77,["44"] = 77,["45"] = 77,["46"] = 77,["47"] = 77,["48"] = 77,["49"] = 77,["50"] = 77,["51"] = 37,["52"] = 90,["53"] = 90,["54"] = 90,["55"] = 90,["56"] = 90,["57"] = 90,["58"] = 90,["59"] = 90,["60"] = 90,["61"] = 90,["62"] = 37,["63"] = 103,["64"] = 103,["65"] = 103,["66"] = 103,["67"] = 103,["68"] = 103,["69"] = 103,["70"] = 103,["71"] = 103,["72"] = 103,["73"] = 37,["74"] = 116,["75"] = 116,["76"] = 116,["77"] = 116,["78"] = 116,["79"] = 116,["80"] = 116,["81"] = 116,["82"] = 116,["83"] = 116,["84"] = 37,["85"] = 129,["86"] = 129,["87"] = 129,["88"] = 129,["89"] = 129,["90"] = 129,["91"] = 129,["92"] = 129,["93"] = 129,["94"] = 129,["95"] = 37,["96"] = 142,["97"] = 142,["98"] = 142,["99"] = 142,["100"] = 142,["101"] = 142,["102"] = 142,["103"] = 142,["104"] = 142,["105"] = 142,["106"] = 37,["107"] = 156,["108"] = 156,["109"] = 156,["110"] = 156,["111"] = 156,["112"] = 156,["113"] = 156,["114"] = 156,["115"] = 156,["116"] = 156,["117"] = 37,["118"] = 37,["119"] = 171,["120"] = 175,["121"] = 177,["122"] = 178,["123"] = 179});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {
    {
        id = "甲板Lv1",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv1",
        describe = "护甲+5",
        icon = "物品图标\\甲板\\甲板1.blp",
        goldCost = 100,
        pawnable = 1,
        attribute = {def = 5}
    },
    {
        id = "甲板Lv2",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv2",
        describe = "护甲+10",
        icon = "物品图标\\甲板\\甲板2.blp",
        goldCost = 500,
        pawnable = 1,
        attribute = {def = 10}
    },
    {
        id = "甲板Lv3",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv3",
        describe = "护甲+20",
        icon = "物品图标\\甲板\\甲板3.blp",
        goldCost = 1000,
        pawnable = 1,
        attribute = {def = 20}
    },
    {
        id = "甲板Lv4",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv4",
        describe = "护甲+30",
        icon = "物品图标\\甲板\\甲板4.blp",
        goldCost = 1500,
        pawnable = 1,
        attribute = {def = 30}
    },
    {
        id = "甲板Lv5",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv5",
        describe = "护甲+50",
        icon = "物品图标\\甲板\\甲板5.blp",
        goldCost = 2500,
        pawnable = 1,
        attribute = {def = 50}
    },
    {
        id = "甲板Lv6",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv6",
        describe = "护甲+60",
        icon = "物品图标\\甲板\\甲板6.blp",
        goldCost = 3000,
        pawnable = 1,
        attribute = {def = 60}
    },
    {
        id = "甲板Lv7",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv7",
        describe = "护甲+80",
        icon = "物品图标\\甲板\\甲板7.blp",
        goldCost = 4000,
        pawnable = 1,
        attribute = {def = 80}
    },
    {
        id = "甲板Lv8",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv8",
        describe = "护甲+100",
        icon = "物品图标\\甲板\\甲板8.blp",
        goldCost = 5000,
        pawnable = 1,
        attribute = {def = 100}
    },
    {
        id = "甲板Lv9",
        class = "基础属性装备",
        passive = true,
        name = "甲板Lv9",
        describe = "护甲+150\n|n护甲+10% ",
        icon = "物品图标\\甲板\\甲板9.blp",
        goldCost = 7500,
        pawnable = 1,
        attribute = {def = 150, def_p = 0.1}
    },
    {
        id = "甲板Lv10",
        class = "基础属性装备",
        passive = false,
        name = "甲板Lv10",
        describe = "护甲+300\n|n护甲+20%|n\n|cffcccccclv10炮弹x2++LV10甲板+制作书 = 白胡子|r",
        icon = "物品图标\\甲板\\甲板10.blp",
        goldCost = 15000,
        pawnable = 1,
        attribute = {def = 300, def_p = 0.2}
    }
}
____exports["d_甲板"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
