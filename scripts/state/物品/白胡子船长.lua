local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 8,["22"] = 13,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 23,["27"] = 24,["28"] = 24,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 25,["40"] = 25,["41"] = 25,["42"] = 26,["43"] = 22,["44"] = 35,["45"] = 36,["46"] = 37,["47"] = 38,["48"] = 39,["49"] = 40,["50"] = 40,["51"] = 40,["52"] = 40,["53"] = 40,["54"] = 40,["55"] = 41,["56"] = 41,["57"] = 41,["58"] = 41,["59"] = 41,["60"] = 41,["61"] = 41,["62"] = 41,["63"] = 41,["64"] = 42,["65"] = 44,["66"] = 45,["67"] = 46,["68"] = 47,["69"] = 47,["70"] = 47,["71"] = 47,["72"] = 47,["73"] = 47,["74"] = 47,["75"] = 47,["76"] = 47,["77"] = 48,["79"] = 37,["80"] = 11});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
____exports.default = __TS__Class()
local _____767D_80E1_5B50_8239_957F = ____exports.default
_____767D_80E1_5B50_8239_957F.name = "白胡子船长"
function _____767D_80E1_5B50_8239_957F.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("白胡子")
    actorType.interval = 1
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({fullPros = 1}, actor.unit)
        local projection = MathUtil.polarProjection(
            GetUnitX(actor.unit),
            GetUnitY(actor.unit),
            300,
            GetUnitFacing(actor.unit)
        )
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            600,
            damage,
            DamageType["s_物理"],
            projection.x,
            projection.y
        )
        EffectUtil:addSpecialEffectAndDestroy("model\\基本技能\\地震.mdx", projection.x, projection.y, 0.9)
    end
    actorType = ActorTypeUtil:getActorType("年轻·白胡子")
    actorType.interval = 1
    actorType.onUnitInterval = function(____, actor)
        actor.time = (actor.time or 0) + 1
        local damage = UnitStateUtil:calculateStateFormula({fullPros = 1}, actor.unit)
        local projection = MathUtil.polarProjection(
            GetUnitX(actor.unit),
            GetUnitY(actor.unit),
            300,
            GetUnitFacing(actor.unit)
        )
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            600,
            damage,
            DamageType["s_物理"],
            projection.x,
            projection.y
        )
        EffectUtil:addSpecialEffectAndDestroy("model\\基本技能\\地震.mdx", projection.x, projection.y, 0.9)
        if actor.time == 3 then
            actor.time = 0
            local damage = UnitStateUtil:calculateStateFormula({fullPros = 4}, actor.unit)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                600,
                damage,
                DamageType["s_物理"],
                actor.unitX,
                actor.unitY
            )
            EffectUtil:addSpecialEffectAndDestroy("model\\基本技能\\地震.mdx", actor.unitX, actor.unitY, 0.9)
        end
    end
end
return ____exports
