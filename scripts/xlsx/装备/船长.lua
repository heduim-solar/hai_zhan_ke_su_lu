local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 107,["10"] = 108,["11"] = 108,["12"] = 108,["13"] = 108,["14"] = 108,["15"] = 108,["16"] = 108,["17"] = 108,["18"] = 108,["19"] = 108,["20"] = 108,["21"] = 108,["22"] = 108,["23"] = 107,["24"] = 123,["25"] = 123,["26"] = 123,["27"] = 123,["28"] = 123,["29"] = 123,["30"] = 123,["31"] = 123,["32"] = 123,["33"] = 123,["34"] = 123,["35"] = 123,["36"] = 123,["37"] = 107,["38"] = 138,["39"] = 138,["40"] = 138,["41"] = 138,["42"] = 138,["43"] = 138,["44"] = 138,["45"] = 138,["46"] = 138,["47"] = 138,["48"] = 138,["49"] = 138,["50"] = 138,["51"] = 107,["52"] = 153,["53"] = 153,["54"] = 153,["55"] = 153,["56"] = 153,["57"] = 153,["58"] = 153,["59"] = 153,["60"] = 153,["61"] = 153,["62"] = 153,["63"] = 153,["64"] = 153,["65"] = 107,["66"] = 169,["67"] = 173,["68"] = 175,["69"] = 176,["70"] = 177,["73"] = 181,["74"] = 182,["75"] = 183});
local ____exports = {}
local ____GradeUtil = require("solar.solar-common.util.other.GradeUtil")
local GradeUtil = ____GradeUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.data = {{
    id = "a41s",
    _parent = "azhr",
    Name = "赏金王",
    ["来源"] = "购买",
    type = "船长",
    Art = "物品图标\\船长\\高级\\船长赏金王.blp",
    Ubertip = "每次造成伤害，可获得5金币。\n|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】|r",
    goldcost = 500,
    Description = "每次造成伤害，可获得5金币。\n|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】|r",
    Tip = "赏金王",
    pawnable = 1,
    stockMax = 1,
    stockRegen = 0
}, {
    id = "a41t",
    _parent = "azhr",
    Name = "强盗王",
    ["来源"] = "购买",
    type = "船长",
    Art = "物品图标\\船长\\高级\\船长强盗王.blp",
    Ubertip = "每次造成伤害，可获得8金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】|r",
    goldcost = 4000,
    Description = "每次造成伤害，可获得8金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】|r",
    Tip = "强盗王",
    pawnable = 1,
    stockMax = 1,
    stockRegen = 0
}, {
    id = "a41u",
    _parent = "azhr",
    Name = "山贼王",
    ["来源"] = "购买",
    type = "船长",
    Art = "物品图标\\船长\\高级\\船长山贼王.blp",
    Ubertip = "每次造成伤害，可获得目标10%原本赏金的金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】|r",
    goldcost = 12000,
    Description = "每次造成伤害，可获得目标10%原本赏金的金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】|r",
    Tip = "山贼王",
    pawnable = 1,
    stockMax = 1,
    stockRegen = 0
}, {
    id = "a41v",
    _parent = "azhr",
    Name = "海贼王",
    ["来源"] = "购买",
    type = "船长",
    Art = "物品图标\\船长\\高级\\船长海贼王.blp",
    Ubertip = "每次造成伤害，可获得目标20%原本赏金的金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】|r",
    goldcost = 100000,
    Description = "每次造成伤害，可获得目标20%原本赏金的金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】|r",
    Tip = "海贼王",
    pawnable = 1,
    stockMax = 1,
    stockRegen = 0
}}
____exports["d_船长"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id and datum.grade then
            GradeUtil:setItemTypeGrade(datum.id, datum.grade)
        end
    end
    for ____, datum in ipairs(____exports.data) do
        if datum and datum.id then
            AttributeUtil:setItemTypeAttribute(datum.id, datum)
        end
    end
end
return ____exports
