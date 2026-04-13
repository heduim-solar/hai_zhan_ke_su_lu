local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 55,["10"] = 56,["11"] = 56,["12"] = 56,["13"] = 56,["14"] = 56,["15"] = 56,["16"] = 56,["17"] = 56,["18"] = 56,["19"] = 56,["20"] = 56,["21"] = 56,["22"] = 56,["23"] = 56,["24"] = 56,["25"] = 55,["26"] = 75,["27"] = 75,["28"] = 75,["29"] = 75,["30"] = 75,["31"] = 75,["32"] = 75,["33"] = 75,["34"] = 75,["35"] = 75,["36"] = 75,["37"] = 75,["38"] = 75,["39"] = 75,["40"] = 75,["41"] = 75,["42"] = 55,["43"] = 97,["44"] = 97,["45"] = 97,["46"] = 97,["47"] = 97,["48"] = 97,["49"] = 97,["50"] = 97,["51"] = 97,["52"] = 97,["53"] = 97,["54"] = 97,["55"] = 97,["56"] = 97,["57"] = 97,["58"] = 55,["59"] = 116,["60"] = 116,["61"] = 116,["62"] = 116,["63"] = 116,["64"] = 116,["65"] = 116,["66"] = 116,["67"] = 116,["68"] = 116,["69"] = 116,["70"] = 116,["71"] = 116,["72"] = 116,["73"] = 116,["74"] = 55,["75"] = 136,["76"] = 140,["77"] = 142,["78"] = 143,["79"] = 144,["82"] = 148,["83"] = 149,["84"] = 150});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____SolarNewItemsFormulaState = require("state.common.SolarNewItemsFormulaState")
local SolarNewItemsFormulaState = ____SolarNewItemsFormulaState.default
____exports.data = {{
    id = "赏金王",
    describe = "射程：600\n伤害：攻击力x0.1\n射速：0.5\n该船长每次造成伤害，可获得3金币。\n|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】（用宝宝才能合成）|r",
    class = "基础船长",
    kind = "打钱船长",
    index = 0,
    passive = true,
    name = "赏金王",
    icon = "物品图标\\船长\\高级\\船长赏金王.blp",
    unique = true,
    ["sc_射程"] = 600,
    ["ss_射速"] = 0.5,
    ["shgs_伤害公式"] = {attack = 0.1},
    missileModel = "Objects\\InventoryItems\\PotofGold\\PotofGold.mdl",
    goldCost = 500,
    pawnable = 1
}, {
    id = "强盗王",
    describe = "射程：800\n伤害：攻击力x0.1\n射速：0.5\n该船长每次造成伤害，可获得5金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】（用宝宝才能合成）|r",
    class = "基础船长",
    kind = "打钱船长",
    index = 1,
    passive = true,
    name = "强盗王",
    icon = "物品图标\\船长\\高级\\船长强盗王.blp",
    unique = true,
    ["sc_射程"] = 800,
    ["ss_射速"] = 0.5,
    ["shgs_伤害公式"] = {attack = 0.1},
    missileModel = "Objects\\InventoryItems\\PotofGold\\PotofGold.mdl",
    goldCost = 5000,
    attribute = {blood_sucking = 0.02},
    pawnable = 1
}, {
    id = "山贼王",
    describe = "射程：900\n伤害：攻击力x0.1\n射速：0.5\n该船长每次造成伤害，可获得8+目标10%原本赏金的金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】（用宝宝才能合成）|r",
    class = "基础船长",
    kind = "打钱船长",
    index = 2,
    passive = true,
    name = "山贼王",
    icon = "物品图标\\船长\\高级\\船长山贼王.blp",
    unique = true,
    ["sc_射程"] = 900,
    ["ss_射速"] = 0.5,
    ["shgs_伤害公式"] = {attack = 0.1},
    missileModel = "Objects\\InventoryItems\\PotofGold\\PotofGold.mdl",
    goldCost = 15000,
    pawnable = 1
}, {
    id = "海贼王",
    describe = "射程：900\n伤害：攻击力x0.1\n射速：0.5\n该船长每次造成伤害，可获得10+目标20%原本赏金的金币。|n|cffcccccc 赏金王+强盗王+山贼王+海贼王=【娜米】（用宝宝才能合成）|r",
    class = "基础船长",
    kind = "打钱船长",
    index = 3,
    passive = true,
    name = "海贼王",
    icon = "物品图标\\船长\\高级\\船长海贼王.blp",
    unique = true,
    ["sc_射程"] = 900,
    ["ss_射速"] = 0.5,
    ["shgs_伤害公式"] = {attack = 0.1},
    missileModel = "Objects\\InventoryItems\\PotofGold\\PotofGold.mdl",
    goldCost = 30000,
    pawnable = 1
}}
____exports["d_基础船长演员物品"] = ____exports.data
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
