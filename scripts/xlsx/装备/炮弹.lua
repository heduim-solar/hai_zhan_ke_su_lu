local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 37,["8"] = 38,["9"] = 38,["10"] = 38,["11"] = 38,["12"] = 38,["13"] = 38,["14"] = 38,["15"] = 38,["16"] = 38,["17"] = 38,["18"] = 37,["19"] = 51,["20"] = 51,["21"] = 51,["22"] = 51,["23"] = 51,["24"] = 51,["25"] = 51,["26"] = 51,["27"] = 51,["28"] = 51,["29"] = 37,["30"] = 64,["31"] = 64,["32"] = 64,["33"] = 64,["34"] = 64,["35"] = 64,["36"] = 64,["37"] = 64,["38"] = 64,["39"] = 64,["40"] = 37,["41"] = 77,["42"] = 77,["43"] = 77,["44"] = 77,["45"] = 77,["46"] = 77,["47"] = 77,["48"] = 77,["49"] = 77,["50"] = 77,["51"] = 37,["52"] = 90,["53"] = 90,["54"] = 90,["55"] = 90,["56"] = 90,["57"] = 90,["58"] = 90,["59"] = 90,["60"] = 90,["61"] = 90,["62"] = 37,["63"] = 103,["64"] = 103,["65"] = 103,["66"] = 103,["67"] = 103,["68"] = 103,["69"] = 103,["70"] = 103,["71"] = 103,["72"] = 103,["73"] = 37,["74"] = 116,["75"] = 116,["76"] = 116,["77"] = 116,["78"] = 116,["79"] = 116,["80"] = 116,["81"] = 116,["82"] = 116,["83"] = 116,["84"] = 37,["85"] = 129,["86"] = 129,["87"] = 129,["88"] = 129,["89"] = 129,["90"] = 129,["91"] = 129,["92"] = 129,["93"] = 129,["94"] = 129,["95"] = 37,["96"] = 142,["97"] = 142,["98"] = 142,["99"] = 142,["100"] = 142,["101"] = 142,["102"] = 142,["103"] = 142,["104"] = 142,["105"] = 142,["106"] = 37,["107"] = 156,["108"] = 156,["109"] = 156,["110"] = 156,["111"] = 156,["112"] = 156,["113"] = 156,["114"] = 156,["115"] = 156,["116"] = 156,["117"] = 37,["118"] = 37,["119"] = 171,["120"] = 175,["121"] = 177,["122"] = 178,["123"] = 179});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {
    {
        id = "炮弹Lv1",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv1",
        describe = "攻击力+15",
        icon = "物品图标\\炮弹\\炮弹1.blp",
        goldCost = 50,
        pawnable = 1,
        attribute = {attack = 15}
    },
    {
        id = "炮弹Lv2",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv2",
        describe = "攻击力+30",
        icon = "物品图标\\炮弹\\炮弹2.blp",
        goldCost = 100,
        pawnable = 1,
        attribute = {attack = 30}
    },
    {
        id = "炮弹Lv3",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv3",
        describe = "攻击力+60",
        icon = "物品图标\\炮弹\\炮弹3.blp",
        goldCost = 200,
        pawnable = 1,
        attribute = {attack = 60}
    },
    {
        id = "炮弹Lv4",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv4",
        describe = "攻击力+120",
        icon = "物品图标\\炮弹\\炮弹4.blp",
        goldCost = 300,
        pawnable = 1,
        attribute = {attack = 120}
    },
    {
        id = "炮弹Lv5",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv5",
        describe = "攻击力+240",
        icon = "物品图标\\炮弹\\炮弹5.blp",
        goldCost = 500,
        pawnable = 1,
        attribute = {attack = 240}
    },
    {
        id = "炮弹Lv6",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv6",
        describe = "攻击力+480",
        icon = "物品图标\\炮弹\\炮弹6.blp",
        goldCost = 1000,
        pawnable = 1,
        attribute = {attack = 480}
    },
    {
        id = "炮弹Lv7",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv7",
        describe = "攻击力+960",
        icon = "物品图标\\炮弹\\炮弹7.blp",
        goldCost = 2000,
        pawnable = 1,
        attribute = {attack = 960}
    },
    {
        id = "炮弹Lv8",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv8",
        describe = "攻击力+1920",
        icon = "物品图标\\炮弹\\炮弹8.blp",
        goldCost = 4000,
        pawnable = 1,
        attribute = {attack = 1920}
    },
    {
        id = "炮弹Lv9",
        class = "基础属性装备",
        passive = true,
        name = "炮弹Lv9",
        describe = "攻击力+3840\n|n攻击力+10%|n\n |n|cffcccccc炮弹Lv9 + 炮弹Lv9 = 炮弹Lv10",
        icon = "物品图标\\炮弹\\炮弹9.blp",
        goldCost = 8000,
        pawnable = 1,
        attribute = {attack_p = 0.1, attack = 3840}
    },
    {
        id = "炮弹Lv10",
        class = "基础属性装备",
        passive = false,
        name = "炮弹Lv10",
        describe = "攻击力+7680\n|n攻击力+20%|n\n|cffcccccclv10炮弹x2++LV10甲板+制作书 = 白胡子|r\n|n|cffcccccc天雷炮+lv10桅杆x2+lv10炮弹x2+制作书=【雷霆支配者】|r\n|n|cffcccccc 破甲装置+致命炮+lv10炮弹=【两仪式】|r",
        icon = "物品图标\\炮弹\\炮弹10.blp",
        goldCost = 15360,
        pawnable = 1,
        attribute = {attack_p = 0.2, attack = 7680}
    }
}
____exports["d_炮弹"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
