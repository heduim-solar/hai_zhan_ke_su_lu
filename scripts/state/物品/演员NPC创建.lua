local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 13,["27"] = 13,["28"] = 13,["30"] = 18,["32"] = 19,["33"] = 19,["34"] = 20,["35"] = 21,["36"] = 22,["37"] = 23,["39"] = 25,["40"] = 26,["42"] = 19,["45"] = 31,["47"] = 32,["48"] = 33,["49"] = 34,["51"] = 36,["52"] = 37,["54"] = 39,["55"] = 40,["56"] = 41,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["65"] = 49,["66"] = 50,["67"] = 51,["68"] = 52,["69"] = 53,["70"] = 54,["71"] = 55,["72"] = 56,["74"] = 59,["75"] = 59,["76"] = 60,["77"] = 61,["78"] = 62,["79"] = 61,["80"] = 59,["81"] = 59,["82"] = 59,["83"] = 67,["84"] = 68,["85"] = 69,["86"] = 70,["87"] = 69,["88"] = 72,["89"] = 73,["90"] = 74,["91"] = 75,["93"] = 73,["94"] = 81,["95"] = 82,["96"] = 82,["97"] = 82,["98"] = 83,["99"] = 84,["100"] = 84,["101"] = 84,["102"] = 84,["103"] = 84,["104"] = 84,["105"] = 86,["106"] = 87,["107"] = 87,["108"] = 87,["109"] = 87,["110"] = 87,["111"] = 87,["112"] = 82,["113"] = 82,["114"] = 91,["115"] = 91,["116"] = 91,["117"] = 92,["118"] = 93,["119"] = 93,["120"] = 93,["121"] = 93,["122"] = 93,["123"] = 93,["124"] = 94,["125"] = 95,["126"] = 95,["127"] = 95,["128"] = 95,["129"] = 95,["130"] = 95,["131"] = 96,["132"] = 97,["133"] = 98,["134"] = 98,["135"] = 98,["136"] = 98,["137"] = 98,["138"] = 98,["140"] = 100,["141"] = 91,["142"] = 91,["143"] = 104,["144"] = 105,["145"] = 106,["146"] = 106,["147"] = 106,["148"] = 106,["149"] = 106,["150"] = 106,["151"] = 107,["152"] = 108,["153"] = 108,["154"] = 108,["155"] = 108,["156"] = 108,["157"] = 108,["159"] = 114,["160"] = 114,["161"] = 114,["162"] = 115,["163"] = 116,["164"] = 116,["165"] = 116,["166"] = 116,["167"] = 116,["168"] = 116,["169"] = 117,["170"] = 118,["171"] = 118,["172"] = 118,["173"] = 118,["174"] = 118,["175"] = 118,["176"] = 119,["177"] = 120,["178"] = 120,["179"] = 120,["180"] = 120,["181"] = 120,["182"] = 120,["183"] = 114,["184"] = 114,["185"] = 123,["186"] = 124,["187"] = 124,["188"] = 124,["189"] = 124,["190"] = 124,["191"] = 124,["192"] = 127,["193"] = 127,["194"] = 127,["195"] = 128,["196"] = 129,["197"] = 129,["198"] = 129,["199"] = 129,["200"] = 129,["201"] = 129,["202"] = 130,["203"] = 131,["204"] = 131,["205"] = 131,["206"] = 131,["207"] = 131,["208"] = 131,["209"] = 132,["210"] = 133,["211"] = 133,["212"] = 133,["213"] = 133,["214"] = 133,["215"] = 133,["216"] = 134,["217"] = 135,["218"] = 135,["219"] = 135,["220"] = 135,["221"] = 135,["222"] = 135,["223"] = 127,["224"] = 127,["225"] = 140,["226"] = 141,["227"] = 141,["228"] = 140,["229"] = 143,["230"] = 143,["231"] = 143,["232"] = 144,["233"] = 145,["234"] = 145,["235"] = 145,["236"] = 145,["237"] = 145,["238"] = 145,["239"] = 146,["240"] = 147,["241"] = 147,["242"] = 147,["243"] = 147,["244"] = 147,["245"] = 147,["246"] = 148,["247"] = 149,["248"] = 149,["249"] = 149,["250"] = 149,["251"] = 149,["252"] = 149,["253"] = 150,["254"] = 151,["255"] = 151,["256"] = 151,["257"] = 151,["258"] = 151,["259"] = 151,["260"] = 143,["261"] = 143,["262"] = 16,["263"] = 14});
local ____exports = {}
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____l__6F14_5458NPC = require("_sl_editor.l_演员NPC")
local ____l__6F14_5458NPC = ____l__6F14_5458NPC["l_演员NPC"]
local _____8239_957F_6F14_5458_7269_54C1 = require("xlsx.装备.船长演员物品")
local ____d__8239_957F_6F14_5458_7269_54C1 = _____8239_957F_6F14_5458_7269_54C1["d_船长演员物品"]
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
local ____l__6D77_4E0A_5947_73CD = require("_sl_editor.l_海上奇珍")
local ____l__6D77_4E0A_5947_73CD = ____l__6D77_4E0A_5947_73CD["l_海上奇珍"]
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local _____6838_5FC3_90E8_4EF6 = require("xlsx.装备.核心部件")
local ____d__6838_5FC3_90E8_4EF6 = _____6838_5FC3_90E8_4EF6["d_核心部件"]
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
____exports.default = __TS__Class()
local _____6F14_5458NPC_521B_5EFA = ____exports.default
_____6F14_5458NPC_521B_5EFA.name = "演员NPC创建"
function _____6F14_5458NPC_521B_5EFA.prototype.____constructor(self)
    local gjcz = ActorTypeUtil:getActorType("高级船长")
    do
        local i = 4
        while i < #gjcz.sellItems do
            local sellingAbility = ActorTypeShopUtil:warpActorItem2SellingAbility(gjcz.sellItems[i + 1])
            if MapUtil:getRealNanduLevel() <= i + 1 then
                sellingAbility.disable = true
                sellingAbility.requiredTip = "难" .. tostring(i + 2)
            end
            if MapUtil:getRealNanduLevel() <= i then
                sellingAbility.hide = true
            end
            i = i + 1
        end
    end
    for ____, data in ipairs(____d__8239_957F_6F14_5458_7269_54C1) do
        do
            local itemActorType = ActorTypeUtil:getActorType(data.id)
            if itemActorType.class == "制作书" then
                goto __continue7
            end
            if data["来源"] == "购买" then
                goto __continue7
            end
            local sellingAbility = ActorTypeShopUtil:warpActorItem2SellingAbility(data.id).id
            local actorType = ActorTypeUtil:getActorType(sellingAbility)
            actorType.disable = true
            if data["来源"] and data["来源提示"] then
                actorType.goldCost = nil
                actorType.requiredTip = (data["来源"] .. "-") .. data["来源提示"]
                actorType.describe = (((("来源:" .. data["来源"]) .. "|n") .. data["来源提示"]) .. " |n|n效果预览:|n") .. itemActorType.describe
            end
        end
        ::__continue7::
    end
    for ____, data in ipairs(____d__6838_5FC3_90E8_4EF6) do
        local itemActorType = ActorTypeUtil:getActorType(data.id)
        local sellingAbility = ActorTypeShopUtil:warpActorItem2SellingAbility(data.id).id
        local actorType = ActorTypeUtil:getActorType(sellingAbility)
        actorType.disable = true
        actorType.goldCost = nil
        actorType.requiredTip = "海上奇珍抽奖获得!"
        actorType.describe = "来源: 海上奇珍抽奖获得!|n|n效果预览:|n" .. itemActorType.describe
    end
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            local sellingAbility = ActorTypeShopUtil:warpActorItem2SellingAbility(actorType.id)
            sellingAbility.onCreated = function(____, actor)
                actor:getRootFrameControl():setNumberOverlayText(tostring(sellingAbility.goldCost) .. "")
            end
        end,
        "基础属性装备"
    )
    local sellingAbilityTypeId = ActorTypeShopUtil:warpActorItem2SellingAbility("胶胶果实").id
    local jjgsSAType = ActorTypeUtil:getActorType(sellingAbilityTypeId)
    jjgsSAType.onCreated = function(____, actor)
        actor.numberOverlay = 4
    end
    jjgsSAType.interval = 120
    jjgsSAType.onUnitInterval = function(____, actor)
        if actor.numberOverlay < 5 then
            actor.numberOverlay = actor.numberOverlay + 1
        end
    end
    local vector = nil
    BaseUtil.runLater(
        gv["上手入门模式"] and 2 or 1,
        function()
            vector = ____l__6F14_5458NPC[3]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "基础船长",
                vector.x,
                vector.y
            )
            vector = ____l__6F14_5458NPC[2]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "副炮",
                vector.x,
                vector.y
            )
        end
    )
    BaseUtil.runLater(
        gv["上手入门模式"] and 120 or 1,
        function()
            vector = ____l__6F14_5458NPC[1]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "高级船长",
                vector.x,
                vector.y
            )
            vector = ____l__6F14_5458NPC[8]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "船长合成提示",
                vector.x,
                vector.y
            )
            if MapUtil:getRealNanduLevel() > 12 then
                vector = ____l__6F14_5458NPC[9]
                ActorUnitUtil:createActorUnit(
                    Player(4),
                    "船长合成提示2",
                    vector.x,
                    vector.y
                )
            end
            PingMinimap(vector.x, vector.y, 3)
        end
    )
    if settings.gameDifficulty >= 4 then
        vector = ____l__6F14_5458NPC[7]
        ActorUnitUtil:createActorUnit(
            Player(4),
            "核心部件预览",
            vector.x,
            vector.y
        )
        vector = ____l__6F14_5458NPC[10]
        ActorUnitUtil:createActorUnit(
            Player(4),
            "核心部件预览2",
            vector.x,
            vector.y
        )
    end
    BaseUtil.runLater(
        gv["上手入门模式"] and 2 or 1,
        function()
            vector = ____l__6F14_5458NPC[11]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "船头(力量)",
                vector.x,
                vector.y
            )
            vector = ____l__6F14_5458NPC[12]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "船帆(敏捷)",
                vector.x,
                vector.y
            )
            vector = ____l__6F14_5458NPC[13]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "桅杆(智力)",
                vector.x,
                vector.y
            )
        end
    )
    vector = ____l__6F14_5458NPC[14]
    ActorUnitUtil:createActorUnit(
        Player(4),
        "炮弹(攻击)",
        vector.x,
        vector.y
    )
    BaseUtil.runLater(
        gv["上手入门模式"] and 2 or 1,
        function()
            vector = ____l__6F14_5458NPC[15]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "船身(生命)",
                vector.x,
                vector.y
            )
            vector = ____l__6F14_5458NPC[16]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "甲板(护甲)",
                vector.x,
                vector.y
            )
            vector = ____l__6F14_5458NPC[17]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "马达(移速)",
                vector.x,
                vector.y
            )
            vector = ____l__6F14_5458NPC[18]
            ActorUnitUtil:createActorUnit(
                Player(4),
                "修理工(恢复)",
                vector.x,
                vector.y
            )
        end
    )
    ActorTypeUtil:getActorType("海上奇珍").onCreated = function(____, actor)
        local ____exports_default__6DF1_6D77_5947_73CD_6F14_5458_5355_4F4D_5217_8868_0 = ____exports.default["深海奇珍演员单位列表"]
        ____exports_default__6DF1_6D77_5947_73CD_6F14_5458_5355_4F4D_5217_8868_0[#____exports_default__6DF1_6D77_5947_73CD_6F14_5458_5355_4F4D_5217_8868_0 + 1] = actor
    end
    BaseUtil.runLater(
        gv["上手入门模式"] and 2 or 1,
        function()
            vector = ____l__6D77_4E0A_5947_73CD[1]
            ActorUnitUtil:createActorUnit(
                PlayerUtil:neutralPassivePlayer(),
                "海上奇珍",
                vector.x,
                vector.y
            )
            vector = ____l__6D77_4E0A_5947_73CD[2]
            ActorUnitUtil:createActorUnit(
                PlayerUtil:neutralPassivePlayer(),
                "海上奇珍",
                vector.x,
                vector.y
            )
            vector = ____l__6D77_4E0A_5947_73CD[3]
            ActorUnitUtil:createActorUnit(
                PlayerUtil:neutralPassivePlayer(),
                "海上奇珍",
                vector.x,
                vector.y
            )
            vector = ____l__6D77_4E0A_5947_73CD[4]
            ActorUnitUtil:createActorUnit(
                PlayerUtil:neutralPassivePlayer(),
                "海上奇珍",
                vector.x,
                vector.y
            )
        end
    )
end
_____6F14_5458NPC_521B_5EFA["深海奇珍演员单位列表"] = {}
return ____exports
