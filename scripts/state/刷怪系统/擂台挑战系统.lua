local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 14,["33"] = 14,["34"] = 15,["35"] = 15,["36"] = 16,["37"] = 16,["38"] = 17,["39"] = 17,["40"] = 19,["41"] = 19,["42"] = 19,["44"] = 23,["45"] = 23,["46"] = 23,["47"] = 24,["48"] = 23,["49"] = 23,["50"] = 22,["51"] = 28,["52"] = 29,["53"] = 31,["54"] = 31,["55"] = 31,["56"] = 31,["57"] = 31,["58"] = 31,["59"] = 37,["60"] = 37,["61"] = 38,["62"] = 39,["63"] = 40,["64"] = 41,["65"] = 41,["66"] = 41,["67"] = 41,["68"] = 41,["69"] = 41,["70"] = 43,["71"] = 45,["72"] = 47,["73"] = 48,["74"] = 48,["75"] = 50,["76"] = 51,["77"] = 52,["78"] = 53,["79"] = 54,["80"] = 55,["81"] = 56,["82"] = 56,["83"] = 56,["84"] = 56,["86"] = 58,["87"] = 59,["90"] = 48,["91"] = 48,["92"] = 48,["93"] = 39,["94"] = 37,["95"] = 37,["96"] = 37,["97"] = 67,["98"] = 71,["99"] = 28,["100"] = 75,["101"] = 76,["102"] = 81,["103"] = 82,["104"] = 83,["107"] = 86,["108"] = 87,["109"] = 88,["110"] = 89,["111"] = 87,["112"] = 91,["113"] = 82,["114"] = 96,["115"] = 97,["116"] = 98,["119"] = 101,["120"] = 102,["121"] = 103,["122"] = 104,["123"] = 105,["124"] = 106,["125"] = 106,["126"] = 106,["127"] = 107,["128"] = 106,["129"] = 106,["131"] = 102,["132"] = 111,["133"] = 97,["134"] = 116,["135"] = 117,["136"] = 118,["139"] = 121,["140"] = 122,["141"] = 123,["142"] = 124,["143"] = 125,["144"] = 122,["145"] = 127,["146"] = 128,["147"] = 117,["148"] = 133,["149"] = 134,["150"] = 135,["153"] = 138,["154"] = 139,["155"] = 140,["156"] = 141,["157"] = 139,["158"] = 143,["159"] = 134,["160"] = 149,["161"] = 150,["162"] = 151,["165"] = 154,["166"] = 155,["167"] = 156,["168"] = 157,["169"] = 158,["170"] = 155,["171"] = 160,["172"] = 161,["173"] = 150,["174"] = 166,["175"] = 166,["176"] = 166,["177"] = 166,["178"] = 166,["179"] = 166,["180"] = 166,["181"] = 175,["182"] = 176,["183"] = 177,["186"] = 180,["187"] = 181,["188"] = 182,["189"] = 183,["190"] = 181,["191"] = 185,["192"] = 176,["193"] = 190,["194"] = 191,["195"] = 192,["198"] = 195,["199"] = 195,["200"] = 195,["201"] = 195,["202"] = 195,["203"] = 195,["204"] = 191,["205"] = 200,["206"] = 201,["207"] = 202,["210"] = 205,["211"] = 206,["212"] = 207,["213"] = 208,["214"] = 209,["215"] = 210,["216"] = 210,["217"] = 210,["218"] = 211,["219"] = 210,["220"] = 210,["222"] = 206,["223"] = 215,["224"] = 201,["225"] = 221,["226"] = 221,["227"] = 221,["228"] = 221,["229"] = 221,["230"] = 221,["231"] = 221,["232"] = 230,["233"] = 231,["234"] = 232,["237"] = 235,["238"] = 236,["239"] = 237,["240"] = 238,["241"] = 236,["242"] = 240,["243"] = 231,["244"] = 75,["245"] = 245,["247"] = 246,["248"] = 246,["249"] = 247,["250"] = 248,["251"] = 249,["254"] = 246,["257"] = 253,["258"] = 245});
local ____exports = {}
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local _____64C2_53F0_5355_4F4D_6311_6218NPC = require("xlsx.单位.擂台单位挑战NPC")
local ____d__64C2_53F0_5355_4F4D_6311_6218NPC = _____64C2_53F0_5355_4F4D_6311_6218NPC["d_擂台单位挑战NPC"]
local ____l__6311_6218_602A = require("_sl_editor.l_挑战怪")
local ____l__6311_6218_602A = ____l__6311_6218_602A["l_挑战怪"]
local _____64C2_53F0_6311_6218_602A = require("xlsx.单位.擂台挑战怪")
local ____d__64C2_53F0_6311_6218_602A = _____64C2_53F0_6311_6218_602A["d_擂台挑战怪"]
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitRewardUtil = require("solar.solar-common.util.unit.UnitRewardUtil")
local UnitRewardUtil = ____UnitRewardUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____MapHeroUtil = require("util.MapHeroUtil")
local MapHeroUtil = ____MapHeroUtil.default
local _____73A9_5BB6_82F1_96C4_8239 = require("xlsx.单位.玩家英雄船")
local ____d__73A9_5BB6_82F1_96C4_8239 = _____73A9_5BB6_82F1_96C4_8239["d_玩家英雄船"]
local ____PlayerAttributeState = require("solar.solar-common.attribute.PlayerAttributeState")
local PlayerAttributeState = ____PlayerAttributeState.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
____exports.default = __TS__Class()
local _____64C2_53F0_6311_6218_7CFB_7EDF = ____exports.default
_____64C2_53F0_6311_6218_7CFB_7EDF.name = "擂台挑战系统"
function _____64C2_53F0_6311_6218_7CFB_7EDF.prototype.____constructor(self)
    BaseUtil.runLater(
        gv["上手入门模式"] and 60 or 1,
        function()
            self:init()
        end
    )
end
function _____64C2_53F0_6311_6218_7CFB_7EDF.prototype.init(self)
    local loc = ____l__6311_6218_602A[1]
    local tzNpcActorUnit = ActorUnitUtil:createActorUnit(
        Player(4),
        ____d__64C2_53F0_5355_4F4D_6311_6218NPC[1].id,
        loc.x,
        loc.y
    )
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.maxCd = 30
            actorType.onAction = function(____, actor)
                local loc = ____l__6311_6218_602A[GetRandomInt(1, #____l__6311_6218_602A - 1) + 1]
                local actorUnit = ActorUnitUtil:createActorUnit(
                    PlayerUtil:neutralAggressivePlayer(),
                    actor.actorTypeId,
                    tzNpcActorUnit.unitX,
                    tzNpcActorUnit.unitY
                )
                actorUnit:setXY(loc.x, loc.y)
                MapUtil["根据难度数值加强怪物"](MapUtil, actorUnit.unit)
                actorUnit:applyTimedLife(30)
                se:onUnitDeath(
                    function(e)
                        if IsHandle(e.killingUnit) then
                            ActorAbilityUtil:destroyUnitAllActorAbility(actor.unit)
                            local nextActorId = ____exports.default:findNextActorId(actor.actorTypeId)
                            if nextActorId then
                                local actorAbility = ActorAbilityUtil:createActorAbility(nextActorId, actor.lastUnit)
                                actorAbility:setName("点击挑战:" .. actorAbility.actorType.name)
                                tzNpcActorUnit:set(
                                    "model",
                                    actorAbility:get("model")
                                )
                            end
                            if MapUtil:getRealNanduLevel() > 5 then
                                tzNpcActorUnit:addActorAbility("超级挑战")
                            end
                        end
                    end,
                    actorUnit.unit
                )
            end
        end,
        "擂台挑战怪"
    )
    tzNpcActorUnit:addActorAbility(____d__64C2_53F0_6311_6218_602A[1].id)
    ____exports.default["擂台挑战奖励"](____exports.default)
end
_____64C2_53F0_6311_6218_7CFB_7EDF["擂台挑战奖励"] = function(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("擂台小木船")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        PlayerUtil:message("|cffff0000【系统提示】击杀了擂台小木船！奖励全队2000金币！")
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            UnitRewardUtil:addGoldWithEarnGoldP(hero, 2000)
        end)
        TextTagUtil.textGold("奖励全队2000金币!", actor.unit)
    end
    actorType = ActorTypeUtil:getActorType("擂台驱逐舰")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        PlayerUtil:message("|cffff0000【系统提示】击杀了擂台驱逐舰！奖励全队30秒内无敌！")
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            if not UnitStateUtil:isInvulnerable(hero) then
                UnitStateUtil:setInvulnerable(hero, true)
                BaseUtil.runLater(
                    30,
                    function()
                        UnitStateUtil:setInvulnerable(hero, false)
                    end
                )
            end
        end)
        TextTagUtil.textGold("奖励全队30秒内无敌!", actor.unit)
    end
    actorType = ActorTypeUtil:getActorType("擂台护卫舰")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        PlayerUtil:message("|cffff0000【系统提示】击杀了擂台护卫舰！奖励全队金币收益+25%！")
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            local unitAttribute = AttributeUtil:getPlayerAttribute(player, true)
            unitAttribute.earn_gold_p = (unitAttribute.earn_gold_p or 0) + 0.25
        end)
        PlayerAttributeState:refresh()
        TextTagUtil.textGold("奖励全队金币收益+25%!", actor.unit)
    end
    actorType = ActorTypeUtil:getActorType("擂台巡洋舰")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        PlayerUtil:message("|cffff0000【系统提示】击杀了擂台巡洋舰！奖励全队5000金币！")
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            UnitRewardUtil:addGoldWithEarnGoldP(hero, 5000)
        end)
        TextTagUtil.textGold("奖励全队5000金币!", actor.unit)
    end
    actorType = ActorTypeUtil:getActorType("擂台重舰")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        PlayerUtil:message("|cffff0000【系统提示】击杀了擂台重舰！奖励全队20%攻击力加成！")
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            local unitAttribute = AttributeUtil:getPlayerAttribute(player, true)
            unitAttribute.attack_p = (unitAttribute.attack_p or 0) + 0.2
        end)
        PlayerAttributeState:refresh()
        TextTagUtil.textGold("奖励全队20%攻击力加成!", actor.unit)
    end
    ActorTypeUtil:registerActorType({
        id = "擂台海龟奖励Buff",
        name = "擂台海龟Buff",
        icon = "ReplaceableTextures\\CommandButtons\\BTNSeaTurtleRed.blp",
        attribute = {def = 999},
        dur = 15
    })
    actorType = ActorTypeUtil:getActorType("擂台海龟")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        PlayerUtil:message("|cffff0000【系统提示】击杀了擂台海龟！奖励全队15秒内护甲+999！")
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            ActorBuffUtil:addActorBuff(hero, "擂台海龟奖励Buff")
        end)
        TextTagUtil.textGold("奖励全队15秒内护甲+999!", actor.unit)
    end
    actorType = ActorTypeUtil:getActorType("擂台石像鬼")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        MapHeroUtil["do进化ByType"](
            MapHeroUtil,
            GetOwningPlayer(killingUnit),
            2,
            ____d__73A9_5BB6_82F1_96C4_8239[46].id
        )
    end
    actorType = ActorTypeUtil:getActorType("擂台九头蛇")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        PlayerUtil:message("|cffff0000【系统提示】击杀了擂台九头蛇！奖励当前全队15秒内无敌！")
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            if not UnitStateUtil:isInvulnerable(hero) then
                UnitStateUtil:setInvulnerable(hero, true)
                BaseUtil.runLater(
                    15,
                    function()
                        UnitStateUtil:setInvulnerable(hero, false)
                    end
                )
            end
        end)
        TextTagUtil.textGold("奖励当前全队15秒内无敌!", actor.unit)
    end
    ActorTypeUtil:registerActorType({
        id = "擂台触手奖励Buff",
        name = "擂台触手Buff",
        icon = "ReplaceableTextures\\CommandButtons\\BTNDaggerOfEscape.blp",
        attribute = {attack_p = 3},
        dur = 15
    })
    actorType = ActorTypeUtil:getActorType("擂台触手")
    actorType.onUnitDeath = function(____, actor, killingUnit)
        if not IsHandle(killingUnit) then
            return
        end
        PlayerUtil:message("|cffff0000【系统提示】击杀了擂台触手！奖励当前全队15秒内攻击力+300%!")
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            ActorBuffUtil:addActorBuff(hero, "擂台触手奖励Buff")
        end)
        TextTagUtil.textGold("奖励当前全队15秒内攻击力+300%!", actor.unit)
    end
end
function _____64C2_53F0_6311_6218_7CFB_7EDF.findNextActorId(self, actorTypeId, defaultVal)
    do
        local i = 0
        while i < #____d__64C2_53F0_6311_6218_602A do
            if ____d__64C2_53F0_6311_6218_602A[i + 1].id == actorTypeId then
                if i + 1 < #____d__64C2_53F0_6311_6218_602A then
                    return ____d__64C2_53F0_6311_6218_602A[i + 1 + 1].id
                end
            end
            i = i + 1
        end
    end
    return defaultVal
end
return ____exports
