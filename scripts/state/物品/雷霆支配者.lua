local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 12,["21"] = 19,["22"] = 20,["23"] = 21,["24"] = 22,["25"] = 23,["26"] = 24,["27"] = 25,["28"] = 26,["29"] = 27,["31"] = 21,["32"] = 30,["33"] = 31,["34"] = 32,["35"] = 33,["37"] = 35,["38"] = 36,["39"] = 37,["40"] = 38,["42"] = 40,["43"] = 41,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 41,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 42,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 42,["57"] = 41,["58"] = 41,["59"] = 30,["60"] = 51,["61"] = 52,["62"] = 53,["63"] = 54,["64"] = 55,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 56,["70"] = 57,["72"] = 59,["73"] = 60,["74"] = 61,["75"] = 62,["76"] = 63,["79"] = 53,["80"] = 67,["81"] = 68,["82"] = 69,["83"] = 70,["85"] = 72,["86"] = 73,["87"] = 74,["88"] = 75,["90"] = 77,["91"] = 78,["92"] = 78,["93"] = 78,["94"] = 78,["95"] = 78,["96"] = 78,["97"] = 78,["98"] = 78,["99"] = 79,["100"] = 79,["101"] = 79,["102"] = 79,["103"] = 79,["104"] = 79,["105"] = 78,["106"] = 78,["107"] = 67,["108"] = 10});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
____exports.default = __TS__Class()
local _____96F7_9706_652F_914D_8005 = ____exports.default
_____96F7_9706_652F_914D_8005.name = "雷霆支配者"
function _____96F7_9706_652F_914D_8005.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("雷霆支配者")
    actorType.interval = 0.05
    actorType.onUnitChange = function(____, actor, unit)
        if IsHandle(unit) then
            actor.effect = EffectUtil:addSpecialEffect("model\\雷霆支配者.mdx", actor.unitX, actor.unitY, 0.66)
        elseif actor.effect ~= nil then
            EXSetEffectZ(actor.effect, -5000)
            DestroyEffect(actor.effect)
            actor.effect = nil
        end
    end
    actorType.onUnitInterval = function(____, actor)
        actor.aface = (actor.aface or 0) - 3
        if actor.aface <= -360 then
            actor.aface = 0
        end
        if actor.effect then
            EXSetEffectXY(actor.effect, actor.unitX, actor.unitY)
            EXEffectMatReset(actor.effect)
            EXEffectMatRotateZ(actor.effect, actor.aface)
        end
        local damage = UnitStateUtil:calculateStateFormula({int = 0.15}, actor.unit)
        SelectUtil.forEnemyUnitsInLine(
            actor.unit,
            actor.unitX,
            actor.unitY,
            1200,
            actor.aface,
            100,
            function(____, u)
                DamageRecordUtil:damage(
                    actor:getName(),
                    actor.unit,
                    u,
                    damage
                )
            end
        )
    end
    actorType = ActorTypeUtil:getActorType("雷霆毁灭者")
    actorType.interval = 0.05
    actorType.onUnitChange = function(____, actor, unit)
        if IsHandle(unit) then
            UnitAddAbility(unit, "AImx")
            SetPlayerAbilityAvailable(
                GetOwningPlayer(unit),
                "AImx",
                false
            )
            actor.effect = EffectUtil:addSpecialEffect("model\\雷霆支配者.mdx", actor.unitX, actor.unitY, 0.66)
        else
            UnitRemoveAbility(actor.lastUnit, "AImx")
            if actor.effect ~= nil then
                EXSetEffectZ(actor.effect, -5000)
                DestroyEffect(actor.effect)
                actor.effect = nil
            end
        end
    end
    actorType.onUnitInterval = function(____, actor)
        actor.aface = (actor.aface or 0) - 5
        if actor.aface <= -360 then
            actor.aface = 0
        end
        if actor.effect then
            EXSetEffectXY(actor.effect, actor.unitX, actor.unitY)
            EXEffectMatReset(actor.effect)
            EXEffectMatRotateZ(actor.effect, actor.aface)
        end
        local damage = UnitStateUtil:calculateStateFormula({int = 0.25}, actor.unit)
        SelectUtil.forEnemyUnitsInLine(
            actor.unit,
            actor.unitX,
            actor.unitY,
            1200,
            actor.aface,
            100,
            function(____, u)
                DamageRecordUtil:damage(
                    actor:getName(),
                    actor.unit,
                    u,
                    damage
                )
            end
        )
    end
end
return ____exports
