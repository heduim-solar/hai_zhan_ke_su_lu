local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 8,["22"] = 12,["23"] = 19,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 23,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 21,["43"] = 34,["44"] = 35,["45"] = 36,["46"] = 37,["47"] = 38,["48"] = 39,["49"] = 40,["50"] = 41,["51"] = 42,["53"] = 44,["54"] = 45,["55"] = 46,["56"] = 47,["57"] = 48,["60"] = 36,["61"] = 52,["62"] = 53,["63"] = 54,["64"] = 55,["66"] = 57,["67"] = 59,["68"] = 61,["69"] = 63,["70"] = 64,["71"] = 65,["72"] = 65,["73"] = 65,["74"] = 65,["75"] = 65,["76"] = 65,["77"] = 65,["78"] = 65,["79"] = 65,["80"] = 67,["81"] = 68,["82"] = 69,["83"] = 69,["84"] = 69,["85"] = 69,["86"] = 69,["87"] = 69,["88"] = 69,["89"] = 69,["90"] = 69,["91"] = 71,["92"] = 72,["93"] = 73,["94"] = 73,["95"] = 73,["96"] = 73,["97"] = 73,["98"] = 73,["99"] = 73,["100"] = 73,["101"] = 73,["103"] = 52,["104"] = 11});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
____exports.default = __TS__Class()
local _____8239_957F_827E_5C3C_8DEF = ____exports.default
_____8239_957F_827E_5C3C_8DEF.name = "船长艾尼路"
function _____8239_957F_827E_5C3C_8DEF.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("艾尼路")
    actorType.interval = 1
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({base = 3000, hp = 0.15}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            600,
            damage,
            DamageType["s_物理"],
            actor.unitX,
            actor.unitY
        )
        EffectUtil:addSpecialEffectAndDestroy(
            actor:get("model\\基本技能\\地震.mdx"),
            actor.unitX,
            actor.unitY,
            actor:get("modelScale", 0.9)
        )
    end
    actorType = ActorTypeUtil:getActorType("神·艾尼路")
    actorType.interval = 0.05
    actorType.onUnitChange = function(____, actor, unit)
        if IsHandle(unit) then
            local modelPath = "model\\特效\\白雷球.mdx"
            local modelScale = actor:get("modelScale", 1)
            actor.effect = EffectUtil:addSpecialEffect(modelPath, actor.unitX, actor.unitY, modelScale)
            actor.effect2 = EffectUtil:addSpecialEffect(modelPath, actor.unitX, actor.unitY, modelScale)
            actor.effect3 = EffectUtil:addSpecialEffect(modelPath, actor.unitX, actor.unitY, modelScale)
        else
            if actor.effect ~= nil then
                EffectUtil:destroyEffectNoDeathAnim(actor.effect)
                EffectUtil:destroyEffectNoDeathAnim(actor.effect2)
                EffectUtil:destroyEffectNoDeathAnim(actor.effect3)
                actor.effect = nil
            end
        end
    end
    actorType.onUnitInterval = function(____, actor)
        actor.aface = (actor.aface or 0) - 6
        if actor.aface <= -360 then
            actor.aface = 0
        end
        if actor.effect then
            local damage = UnitStateUtil:calculateStateFormula({attack = 2}, actor.unit)
            local loc = nil
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface)
            EXSetEffectXY(actor.effect, loc.x, loc.y)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                200,
                damage,
                DamageType["s_物理"],
                loc.x,
                loc.y
            )
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + 120)
            EXSetEffectXY(actor.effect2, loc.x, loc.y)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                200,
                damage,
                DamageType["s_物理"],
                loc.x,
                loc.y
            )
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + 240)
            EXSetEffectXY(actor.effect3, loc.x, loc.y)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                200,
                damage,
                DamageType["s_物理"],
                loc.x,
                loc.y
            )
        end
    end
end
return ____exports
