local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 10,["22"] = 10,["23"] = 10,["30"] = 22,["31"] = 23,["32"] = 24,["33"] = 24,["34"] = 24,["35"] = 25,["36"] = 24,["37"] = 24,["38"] = 23,["39"] = 28,["40"] = 29,["41"] = 30,["42"] = 30,["43"] = 30,["44"] = 31,["45"] = 30,["46"] = 30,["48"] = 28,["49"] = 13,["50"] = 40,["51"] = 41,["54"] = 44,["55"] = 53,["56"] = 55,["57"] = 56,["58"] = 57,["59"] = 58,["60"] = 59,["61"] = 60,["62"] = 61,["66"] = 67,["67"] = 69,["68"] = 70,["69"] = 72,["70"] = 73,["71"] = 74,["74"] = 79,["75"] = 80,["76"] = 81,["77"] = 82,["78"] = 83,["79"] = 84,["82"] = 88,["83"] = 89,["84"] = 90,["85"] = 91,["86"] = 92,["87"] = 93,["88"] = 94,["89"] = 95,["91"] = 93,["95"] = 102,["96"] = 103,["97"] = 104,["98"] = 105,["99"] = 106,["100"] = 107,["101"] = 107,["102"] = 108,["106"] = 114,["107"] = 115,["108"] = 116,["109"] = 117,["110"] = 118,["111"] = 119,["114"] = 123,["115"] = 124,["116"] = 125,["117"] = 126,["118"] = 127,["119"] = 128,["122"] = 132,["123"] = 133,["124"] = 134,["125"] = 135,["126"] = 136,["127"] = 137,["131"] = 40});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local _____6EE1_5929_7E41_661F_53F7_57FA_7840_6280_80FD = ____exports.default
_____6EE1_5929_7E41_661F_53F7_57FA_7840_6280_80FD.name = "满天繁星号基础技能"
function _____6EE1_5929_7E41_661F_53F7_57FA_7840_6280_80FD.prototype.____constructor(self)
    --- 满天繁星号
    -- 你的Q主炮伤害+50%
    -- 你的W主炮射程+50%
    -- 你的E主炮频率+50%
    -- 你的R主炮拥有杀敌+3全属性
    local actorType = ActorTypeUtil:getActorType("满天繁星号基础技能")
    actorType.onUnitChange = function(____, actor, unit)
        BaseUtil.runLater(
            1.5,
            function()
                ____exports.default:update(unit)
            end
        )
    end
    actorType.onUnitAddActor = function(____, actor, newActor)
        if __TS__InstanceOf(newActor, ActorAbility) then
            BaseUtil.runLater(
                1.5,
                function()
                    ____exports.default:update(actor.unit)
                end
            )
        end
    end
end
function _____6EE1_5929_7E41_661F_53F7_57FA_7840_6280_80FD.update(self, unit)
    if not IsHandle(unit) then
        return
    end
    local hasActor = ActorUtil:isUnitHasActor(unit, "满天繁星号基础技能")
    if hasActor then
        local actorAbilityQ = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 9)
        if actorAbilityQ then
            local aControllerQ = actorAbilityQ.autoMissileAttackController
            if aControllerQ and aControllerQ["满天繁星号基础技能加强伤害"] ~= true then
                aControllerQ["满天繁星号基础技能加强伤害"] = true
                if aControllerQ.damageStateFormula then
                    aControllerQ.damageStateFormula.increased = (aControllerQ.damageStateFormula.increased or 0) + 0.5
                end
            end
        end
        local actorAbilityW = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 10)
        if actorAbilityW then
            local aControllerW = actorAbilityW.autoMissileAttackController
            if aControllerW and (aControllerW["满天繁星号基础技能加强射程"] == nil or aControllerW["满天繁星号基础技能加强射程"] == 0) then
                aControllerW["满天繁星号基础技能加强射程"] = aControllerW.range * 0.5
                aControllerW.range = aControllerW.range + aControllerW["满天繁星号基础技能加强射程"]
            end
        end
        local actorAbilityE = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 11)
        if actorAbilityE then
            local aControllerE = actorAbilityE.autoMissileAttackController
            if aControllerE and (aControllerE["满天繁星号基础技能加强射速"] == nil or aControllerE["满天繁星号基础技能加强射速"] == 0) then
                aControllerE["满天繁星号基础技能加强射速"] = aControllerE.coolDown * 0.25
                aControllerE.coolDown = aControllerE.coolDown - aControllerE["满天繁星号基础技能加强射速"]
            end
        end
        local actorAbilityR = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 12)
        if actorAbilityR then
            local aControllerR = actorAbilityR.autoMissileAttackController
            if aControllerR and aControllerR["满天繁星号基础技能加强R"] ~= true then
                aControllerR["满天繁星号基础技能加强R"] = true
                aControllerR.onHitTarget = function(____, projectile)
                    if projectile.damage >= UnitStateUtil:getLife(projectile.target) then
                        HeroUtil:addHeroProperty(projectile.source, 3)
                    end
                end
            end
        end
    else
        local actorAbilityQ = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 9)
        if actorAbilityQ then
            local aControllerQ = actorAbilityQ.autoMissileAttackController
            if aControllerQ and aControllerQ["满天繁星号基础技能加强伤害"] == true then
                aControllerQ["满天繁星号基础技能加强伤害"] = false
                local ____opt_0 = aControllerQ.damageStateFormula
                if ____opt_0 and ____opt_0.increased then
                    aControllerQ.damageStateFormula.increased = (aControllerQ.damageStateFormula.increased or 0) - 0.5
                end
            end
        end
        local actorAbilityW = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 10)
        if actorAbilityW then
            local aControllerW = actorAbilityW.autoMissileAttackController
            if aControllerW and aControllerW["满天繁星号基础技能加强射程"] and aControllerW["满天繁星号基础技能加强射程"] > 0 then
                aControllerW.range = aControllerW.range - aControllerW["满天繁星号基础技能加强射程"]
                aControllerW["满天繁星号基础技能加强射程"] = 0
            end
        end
        local actorAbilityE = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 11)
        if actorAbilityE then
            local aControllerE = actorAbilityE.autoMissileAttackController
            if aControllerE and aControllerE["满天繁星号基础技能加强射速"] and aControllerE["满天繁星号基础技能加强射速"] > 0 then
                aControllerE.coolDown = aControllerE.coolDown + aControllerE["满天繁星号基础技能加强射速"]
                aControllerE["满天繁星号基础技能加强射速"] = 0
            end
        end
        local actorAbilityR = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 12)
        if actorAbilityR then
            local aControllerR = actorAbilityR.autoMissileAttackController
            if aControllerR and aControllerR["满天繁星号基础技能加强R"] == true then
                aControllerR["满天繁星号基础技能加强R"] = false
                aControllerR.onHitTarget = nil
            end
        end
    end
end
return ____exports
