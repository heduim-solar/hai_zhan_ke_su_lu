local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 37,["8"] = 38,["9"] = 38,["10"] = 38,["11"] = 38,["12"] = 38,["13"] = 38,["14"] = 38,["15"] = 38,["16"] = 38,["17"] = 38,["18"] = 37,["19"] = 51,["20"] = 51,["21"] = 51,["22"] = 51,["23"] = 51,["24"] = 51,["25"] = 51,["26"] = 51,["27"] = 51,["28"] = 51,["29"] = 37,["30"] = 64,["31"] = 64,["32"] = 64,["33"] = 64,["34"] = 64,["35"] = 64,["36"] = 64,["37"] = 64,["38"] = 64,["39"] = 64,["40"] = 37,["41"] = 77,["42"] = 77,["43"] = 77,["44"] = 77,["45"] = 77,["46"] = 77,["47"] = 77,["48"] = 77,["49"] = 77,["50"] = 77,["51"] = 37,["52"] = 90,["53"] = 90,["54"] = 90,["55"] = 90,["56"] = 90,["57"] = 90,["58"] = 90,["59"] = 90,["60"] = 90,["61"] = 90,["62"] = 37,["63"] = 103,["64"] = 103,["65"] = 103,["66"] = 103,["67"] = 103,["68"] = 103,["69"] = 103,["70"] = 103,["71"] = 103,["72"] = 103,["73"] = 37,["74"] = 116,["75"] = 116,["76"] = 116,["77"] = 116,["78"] = 116,["79"] = 116,["80"] = 116,["81"] = 116,["82"] = 116,["83"] = 116,["84"] = 37,["85"] = 129,["86"] = 129,["87"] = 129,["88"] = 129,["89"] = 129,["90"] = 129,["91"] = 129,["92"] = 129,["93"] = 129,["94"] = 129,["95"] = 37,["96"] = 142,["97"] = 142,["98"] = 142,["99"] = 142,["100"] = 142,["101"] = 142,["102"] = 142,["103"] = 142,["104"] = 142,["105"] = 142,["106"] = 37,["107"] = 156,["108"] = 156,["109"] = 156,["110"] = 156,["111"] = 156,["112"] = 156,["113"] = 156,["114"] = 156,["115"] = 156,["116"] = 156,["117"] = 37,["118"] = 37,["119"] = 171,["120"] = 175,["121"] = 177,["122"] = 178,["123"] = 179});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {
    {
        id = "船帆Lv1",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv1",
        describe = "敏捷+10",
        icon = "物品图标\\船帆\\船帆1.blp",
        goldCost = 50,
        pawnable = 1,
        attribute = {agility = 10}
    },
    {
        id = "船帆Lv2",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv2",
        describe = "敏捷+20",
        icon = "物品图标\\船帆\\船帆2.blp",
        goldCost = 100,
        pawnable = 1,
        attribute = {agility = 20}
    },
    {
        id = "船帆Lv3",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv3",
        describe = "敏捷+40",
        icon = "物品图标\\船帆\\船帆3.blp",
        goldCost = 200,
        pawnable = 1,
        attribute = {agility = 40}
    },
    {
        id = "船帆Lv4",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv4",
        describe = "敏捷+80",
        icon = "物品图标\\船帆\\船帆4.blp",
        goldCost = 400,
        pawnable = 1,
        attribute = {agility = 80}
    },
    {
        id = "船帆Lv5",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv5",
        describe = "敏捷+160",
        icon = "物品图标\\船帆\\船帆5.blp",
        goldCost = 800,
        pawnable = 1,
        attribute = {agility = 160}
    },
    {
        id = "船帆Lv6",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv6",
        describe = "敏捷+320",
        icon = "物品图标\\船帆\\船帆6.blp",
        goldCost = 1600,
        pawnable = 1,
        attribute = {agility = 320}
    },
    {
        id = "船帆Lv7",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv7",
        describe = "敏捷+640",
        icon = "物品图标\\船帆\\船帆7.blp",
        goldCost = 3200,
        pawnable = 1,
        attribute = {agility = 640}
    },
    {
        id = "船帆Lv8",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv8",
        describe = "敏捷+1280",
        icon = "物品图标\\船帆\\船帆8.blp",
        goldCost = 6400,
        pawnable = 1,
        attribute = {agility = 1280}
    },
    {
        id = "船帆Lv9",
        class = "基础属性装备",
        passive = true,
        name = "船帆Lv9",
        describe = "敏捷+2560\n|n敏捷+10%|n\n |n|cffcccccc船帆Lv9 + 船帆Lv9 = 船帆Lv10",
        icon = "物品图标\\船帆\\船帆9.blp",
        goldCost = 12800,
        pawnable = 1,
        attribute = {agility_p = 0.1, agility = 2560}
    },
    {
        id = "船帆Lv10",
        class = "基础属性装备",
        passive = false,
        name = "船帆Lv10",
        describe = "敏捷+5120\n|n敏捷+20%|n\n|n|cffccccccLV10船头+LV10桅杆+LV10船帆+喋血炮x2+合成书=黑胡子|r\n|n|cffcccccc LV10船头+LV10桅杆+LV10船帆+lv10船身=【麦哲伦】|r\n|n|cffcccccc 刮痧装置+lv10船帆x2+制作书=【小丑】|r",
        icon = "物品图标\\船帆\\船帆10.blp",
        goldCost = 25600,
        pawnable = 1,
        attribute = {agility_p = 0.2, agility = 5120}
    }
}
____exports["d_船帆"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
