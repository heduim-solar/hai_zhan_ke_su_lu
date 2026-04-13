local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 37,["8"] = 38,["9"] = 38,["10"] = 38,["11"] = 38,["12"] = 38,["13"] = 38,["14"] = 38,["15"] = 38,["16"] = 38,["17"] = 38,["18"] = 37,["19"] = 51,["20"] = 51,["21"] = 51,["22"] = 51,["23"] = 51,["24"] = 51,["25"] = 51,["26"] = 51,["27"] = 51,["28"] = 51,["29"] = 37,["30"] = 64,["31"] = 64,["32"] = 64,["33"] = 64,["34"] = 64,["35"] = 64,["36"] = 64,["37"] = 64,["38"] = 64,["39"] = 64,["40"] = 37,["41"] = 77,["42"] = 77,["43"] = 77,["44"] = 77,["45"] = 77,["46"] = 77,["47"] = 77,["48"] = 77,["49"] = 77,["50"] = 77,["51"] = 37,["52"] = 90,["53"] = 90,["54"] = 90,["55"] = 90,["56"] = 90,["57"] = 90,["58"] = 90,["59"] = 90,["60"] = 90,["61"] = 90,["62"] = 37,["63"] = 103,["64"] = 103,["65"] = 103,["66"] = 103,["67"] = 103,["68"] = 103,["69"] = 103,["70"] = 103,["71"] = 103,["72"] = 103,["73"] = 37,["74"] = 116,["75"] = 116,["76"] = 116,["77"] = 116,["78"] = 116,["79"] = 116,["80"] = 116,["81"] = 116,["82"] = 116,["83"] = 116,["84"] = 37,["85"] = 129,["86"] = 129,["87"] = 129,["88"] = 129,["89"] = 129,["90"] = 129,["91"] = 129,["92"] = 129,["93"] = 129,["94"] = 129,["95"] = 37,["96"] = 142,["97"] = 142,["98"] = 142,["99"] = 142,["100"] = 142,["101"] = 142,["102"] = 142,["103"] = 142,["104"] = 142,["105"] = 142,["106"] = 37,["107"] = 156,["108"] = 156,["109"] = 156,["110"] = 156,["111"] = 156,["112"] = 156,["113"] = 156,["114"] = 156,["115"] = 156,["116"] = 156,["117"] = 37,["118"] = 37,["119"] = 171,["120"] = 175,["121"] = 177,["122"] = 178,["123"] = 179});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {
    {
        id = "船头Lv1",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv1",
        describe = "力量+10",
        icon = "物品图标\\船头\\船头1.blp",
        goldCost = 50,
        pawnable = 1,
        attribute = {strength = 10}
    },
    {
        id = "船头Lv2",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv2",
        describe = "力量+20",
        icon = "物品图标\\船头\\船头2.blp",
        goldCost = 100,
        pawnable = 1,
        attribute = {strength = 20}
    },
    {
        id = "船头Lv3",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv3",
        describe = "力量+40",
        icon = "物品图标\\船头\\船头3.blp",
        goldCost = 200,
        pawnable = 1,
        attribute = {strength = 40}
    },
    {
        id = "船头Lv4",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv4",
        describe = "力量+80",
        icon = "物品图标\\船头\\船头4.blp",
        goldCost = 400,
        pawnable = 1,
        attribute = {strength = 80}
    },
    {
        id = "船头Lv5",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv5",
        describe = "力量+160",
        icon = "物品图标\\船头\\船头5.blp",
        goldCost = 800,
        pawnable = 1,
        attribute = {strength = 160}
    },
    {
        id = "船头Lv6",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv6",
        describe = "力量+320",
        icon = "物品图标\\船头\\船头6.blp",
        goldCost = 1600,
        pawnable = 1,
        attribute = {strength = 320}
    },
    {
        id = "船头Lv7",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv7",
        describe = "力量+640",
        icon = "物品图标\\船头\\船头7.blp",
        goldCost = 3200,
        pawnable = 1,
        attribute = {strength = 640}
    },
    {
        id = "船头Lv8",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv8",
        describe = "力量+1280",
        icon = "物品图标\\船头\\船头8.blp",
        goldCost = 6400,
        pawnable = 1,
        attribute = {strength = 1280}
    },
    {
        id = "船头Lv9",
        class = "基础属性装备",
        passive = true,
        name = "船头Lv9",
        describe = "力量+2560 \n|n力量+10%|n\n|n|cffcccccc船头Lv9 + 船头Lv9 = 船头Lv10",
        icon = "物品图标\\船头\\船头9.blp",
        goldCost = 12800,
        pawnable = 1,
        attribute = {strength_p = 0.1, strength = 2560}
    },
    {
        id = "船头Lv10",
        class = "基础属性装备",
        passive = false,
        name = "船头Lv10",
        describe = "力量+5120|n力量+20%|n|cffccccccLV10船头+LV10桅杆+LV10船帆+喋血炮x2+合成书=黑胡子|r\n|n|cffcccccc LV10船头+LV10桅杆+LV10船帆+lv10船身=【麦哲伦】|r",
        icon = "物品图标\\船头\\船头10.blp",
        goldCost = 25600,
        pawnable = 1,
        attribute = {strength_p = 0.2, strength = 5120}
    }
}
____exports["d_船头"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
