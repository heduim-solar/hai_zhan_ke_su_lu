local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 11,["24"] = 11,["25"] = 12,["26"] = 12,["27"] = 13,["28"] = 13,["29"] = 14,["30"] = 14,["31"] = 15,["32"] = 15,["33"] = 17,["34"] = 17,["35"] = 17,["37"] = 23,["38"] = 24,["39"] = 26,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 28,["44"] = 29,["45"] = 30,["46"] = 31,["47"] = 31,["48"] = 31,["49"] = 31,["50"] = 32,["53"] = 36,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 38,["60"] = 40,["61"] = 27,["62"] = 27,["63"] = 23,["64"] = 20,["65"] = 47,["66"] = 48,["67"] = 49,["68"] = 49,["69"] = 49,["70"] = 49,["73"] = 52,["74"] = 54,["75"] = 55,["76"] = 57,["77"] = 57,["78"] = 57,["79"] = 57,["80"] = 58,["81"] = 59,["82"] = 61,["83"] = 61,["84"] = 61,["85"] = 61,["86"] = 61,["87"] = 61,["88"] = 61,["89"] = 62,["90"] = 63,["91"] = 65,["92"] = 65,["93"] = 65,["94"] = 65,["95"] = 65,["96"] = 65,["97"] = 65,["98"] = 66,["99"] = 67,["100"] = 69,["101"] = 69,["102"] = 69,["103"] = 69,["104"] = 70,["105"] = 71,["106"] = 73,["107"] = 73,["108"] = 73,["109"] = 73,["110"] = 73,["111"] = 73,["112"] = 73,["113"] = 74,["114"] = 75,["115"] = 77,["116"] = 77,["117"] = 77,["118"] = 77,["119"] = 78,["120"] = 79,["121"] = 81,["122"] = 81,["123"] = 81,["124"] = 81,["125"] = 82,["126"] = 83,["127"] = 85,["128"] = 86,["129"] = 87,["130"] = 87,["131"] = 87,["132"] = 87,["133"] = 87,["134"] = 87,["135"] = 89,["136"] = 91,["137"] = 92,["138"] = 93,["139"] = 95,["140"] = 96,["142"] = 47,["143"] = 102,["144"] = 105,["145"] = 106,["148"] = 110,["149"] = 111,["152"] = 114,["153"] = 115,["154"] = 116,["155"] = 117,["157"] = 119,["158"] = 120,["159"] = 121,["160"] = 122,["161"] = 124,["162"] = 125,["163"] = 127,["164"] = 128,["165"] = 131,["166"] = 132,["167"] = 134,["168"] = 135,["169"] = 138,["170"] = 139,["172"] = 141,["173"] = 142,["174"] = 144,["175"] = 145,["177"] = 147,["178"] = 148,["179"] = 150,["180"] = 151,["182"] = 153,["183"] = 154,["184"] = 157,["185"] = 158,["187"] = 160,["188"] = 161,["189"] = 163,["190"] = 164,["192"] = 166,["193"] = 167,["194"] = 169,["195"] = 170,["197"] = 172,["198"] = 173,["199"] = 175,["200"] = 176,["201"] = 178,["202"] = 179,["204"] = 181,["205"] = 182,["206"] = 184,["207"] = 185,["208"] = 187,["209"] = 188,["211"] = 190,["212"] = 191,["213"] = 192,["214"] = 193,["215"] = 195,["216"] = 196,["218"] = 198,["219"] = 199,["220"] = 201,["221"] = 202,["222"] = 204,["223"] = 205,["224"] = 207,["226"] = 102,["227"] = 214,["228"] = 215,["229"] = 216,["232"] = 220,["233"] = 220,["234"] = 220,["235"] = 221,["236"] = 222,["237"] = 223,["238"] = 220,["239"] = 220,["240"] = 214,["241"] = 212});
local ____exports = {}
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____ArrayUtil = require("solar.solar-common.util.lang.ArrayUtil")
local ArrayUtil = ____ArrayUtil.default
local _____6838_5FC3_90E8_4EF6 = require("xlsx.装备.核心部件")
local ____d__6838_5FC3_90E8_4EF6 = _____6838_5FC3_90E8_4EF6["d_核心部件"]
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
____exports.default = __TS__Class()
local _____9B54_6539_9053_5177 = ____exports.default
_____9B54_6539_9053_5177.name = "魔改道具"
function _____9B54_6539_9053_5177.prototype.____constructor(self)
    se:onHeroLevelUp(function(e, solarTrigger)
        local trigUnitOwner = e.trigUnitOwner
        solarTrigger.enable = false
        BaseUtil.runLater(
            0.01,
            function()
                local unit = PlayerUtil:getHero(trigUnitOwner)
                if PlatUtil:hasMallItem(trigUnitOwner, "CZMG46") then
                    if ActorUtil:isUnitHasActor(unit, "团结号主炮") then
                        local neededXP = DzGetUnitNeededXP(
                            unit,
                            GetUnitLevel(unit)
                        ) - GetHeroXP(unit)
                        AddHeroXP(unit, neededXP * 0.6, true)
                    end
                end
                if PlatUtil:hasMallItem(trigUnitOwner, "CZDZC") then
                    local neededXP = DzGetUnitNeededXP(
                        unit,
                        GetUnitLevel(unit)
                    ) - GetHeroXP(unit)
                    AddHeroXP(unit, neededXP * 0.2, true)
                end
                solarTrigger.enable = true
            end
        )
    end)
end
_____9B54_6539_9053_5177["船只魔改道具奖励"] = function(self, index, unit)
    local mgShopKey = "CZMG" .. tostring(index)
    if not PlatUtil:hasMallItem(
        GetOwningPlayer(unit),
        mgShopKey
    ) then
        return
    end
    if index == 28 then
        ActorItemUtil:addActorItemForUnit("胶胶果实", unit, 5)
    elseif index == 32 then
        PlayerUtil:addGoldState(
            GetOwningPlayer(unit),
            50000
        )
        TextTagUtil.textSuccess("获得5万金币", unit)
    elseif index == 33 then
        HeroUtil:addHeroPropertyP(
            unit,
            false,
            0,
            0,
            0.2
        )
        TextTagUtil.textSuccess("获得20%智力", unit)
    elseif index == 34 then
        HeroUtil:addHeroPropertyP(
            unit,
            false,
            0,
            0.2,
            0
        )
        TextTagUtil.textSuccess("获得20%敏捷", unit)
    elseif index == 36 then
        UnitStateUtil:setDamageBase(
            unit,
            UnitStateUtil:getDamageBase(unit) * 1.2
        )
        TextTagUtil.textSuccess("获得20%攻击", unit)
    elseif index == 37 then
        HeroUtil:addHeroPropertyP(
            unit,
            false,
            0.2,
            0,
            0
        )
        TextTagUtil.textSuccess("获得20%力量", unit)
    elseif index == 38 then
        UnitStateUtil:setArmor(
            unit,
            UnitStateUtil:getArmor(unit) * 1.2
        )
        TextTagUtil.textSuccess("获得20%护甲", unit)
    elseif index == 39 then
        UnitStateUtil:addMaxLifeAndLife(
            unit,
            UnitStateUtil:getMaxLife(unit) * 0.2
        )
        TextTagUtil.textSuccess("获得20%生命值", unit)
    elseif index == 43 then
        local damage = UnitStateUtil:calculateStateFormula({attack = 10}, unit)
        DamageUtil:damageEnemyUnitsInRange(unit, 1200, damage)
        EffectUtil:addSpecialEffectAndDestroy(
            "model\\基本技能\\瘟疫号基础技能.mdx",
            GetUnitX(unit),
            GetUnitY(unit),
            1
        )
    elseif index == 44 then
        UnitStateUtil:addInvulnerableIfNot(unit, 30)
        TextTagUtil.textSuccess("无敌30秒", unit)
    elseif index == 50 then
        local randomElement = ArrayUtil:randomElement(____d__6838_5FC3_90E8_4EF6)
        ActorItemUtil:addActorItemForUnit(randomElement.id, unit)
    end
end
_____9B54_6539_9053_5177["主炮商城道具加强"] = function(self, actor)
    local _____62E5_6709_9B54_6539_9053_5177 = ____exports.default["主炮是否拥有魔改道具"](____exports.default, actor)
    if _____62E5_6709_9B54_6539_9053_5177 == false then
        return
    end
    local ctrl = actor.autoMissileAttackController
    if ctrl == nil then
        return
    end
    local index = actor.actorType.index
    if index == 0 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.add_strength_on_kill = (actor.attribute.add_strength_on_kill or 0) + 1
        actor.attribute.add_agility_on_kill = (actor.attribute.add_agility_on_kill or 0) + 1
        actor.attribute.add_intelligence_on_kill = (actor.attribute.add_intelligence_on_kill or 0) + 1
    elseif index == 5 then
        ctrl.range = ctrl.range + 200
    elseif index == 6 then
        ctrl.damageStateFormula.increased = (ctrl.damageStateFormula.increased or 0) + 0.05
    elseif index == 7 or index == 8 then
        ctrl.damageStateFormula.increased = (ctrl.damageStateFormula.increased or 0) + 0.05
    elseif index == 15 then
        ctrl.range = ctrl.range + 300
    elseif index == 16 or index == 17 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.move_speed = 522
    elseif index == 19 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.add_gold_on_kill = (actor.attribute.add_gold_on_kill or 0) + 20
    elseif index == 20 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute["杀敌经验"] = (actor.attribute["杀敌经验"] or 0) + 1
    elseif index == 22 or index == 23 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.magic_damage_increased = (actor.attribute.magic_damage_increased or 0) + 0.35
    elseif index == 24 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.def = (actor.attribute.def or 0) + 1000
    elseif index == 25 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.agility = (actor.attribute.agility or 0) + 3000
    elseif index == 26 then
        ctrl.targetCount = ctrl.targetCount + 1
    elseif index == 27 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.attack_p = (actor.attribute.attack_p or 0) + 0.2
    elseif index == 29 then
        ctrl.range = ctrl.range + 500
    elseif index == 30 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.add_strength_on_kill = (actor.attribute.add_strength_on_kill or 0) + 2
        actor.attribute.add_agility_on_kill = (actor.attribute.add_agility_on_kill or 0) + 2
        actor.attribute.add_intelligence_on_kill = (actor.attribute.add_intelligence_on_kill or 0) + 2
    elseif index == 31 then
        if actor.attribute == nil then
            actor.attribute = {}
        end
        actor.attribute.def = (actor.attribute.def or 0) + 500
    elseif index == 35 then
        ctrl.coolDown = ctrl.coolDown * 0.75
    elseif index == 40 then
        ctrl.range = ctrl.range + 500
    elseif index == 45 then
        ctrl.range = ctrl.range + 250
    end
end
_____9B54_6539_9053_5177["主炮是否拥有魔改道具"] = function(self, actor)
    if actor.actorType.class ~= "主炮" and actor.actorType.class ~= "技能A" then
        return false
    else
    end
    return ____exports.default.cache:get(
        actor.actorTypeId .. tostring(actor.unitOwnerId),
        function()
            local index = actor.actorType.index
            local mgShopKey = "CZMG" .. tostring(index)
            return PlatUtil:hasMallItem(actor.unitOwner, mgShopKey)
        end
    )
end
_____9B54_6539_9053_5177.cache = __TS__New(Cache)
return ____exports
