local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 9,["21"] = 9,["22"] = 9,["24"] = 14,["25"] = 21,["26"] = 22,["27"] = 24,["30"] = 27,["31"] = 28,["32"] = 29,["33"] = 30,["34"] = 30,["35"] = 30,["36"] = 31,["37"] = 31,["38"] = 31,["39"] = 31,["40"] = 31,["41"] = 31,["42"] = 31,["43"] = 31,["44"] = 31,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 30,["52"] = 30,["53"] = 22,["54"] = 44,["55"] = 45,["56"] = 46,["57"] = 47,["58"] = 48,["59"] = 48,["60"] = 48,["61"] = 48,["62"] = 48,["63"] = 48,["64"] = 48,["65"] = 49,["66"] = 49,["67"] = 49,["68"] = 49,["69"] = 49,["70"] = 49,["71"] = 46,["72"] = 70,["73"] = 71,["74"] = 72,["75"] = 73,["76"] = 74,["77"] = 75,["78"] = 75,["79"] = 75,["80"] = 75,["81"] = 75,["82"] = 75,["83"] = 75,["84"] = 76,["85"] = 76,["86"] = 76,["87"] = 76,["88"] = 76,["89"] = 76,["90"] = 72,["91"] = 11});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_6280_80FD3 = ____exports.default
_____8239_57FA_7840_6280_80FD3.name = "船基础技能3"
function _____8239_57FA_7840_6280_80FD3.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("猩红之女基础技能")
    actorType.onUnitKillEnemy = function(____, actor, deathEnemy)
        if MathUtil.distanceBetweenUnits(actor.unit, deathEnemy) > 2000 then
            return
        end
        local damage = UnitStateUtil:calculateStateFormula({attack = 0.5}, actor.unit)
        local x = GetUnitX(deathEnemy)
        local y = GetUnitY(deathEnemy)
        BaseUtil.runLater(
            0.01,
            function()
                DamageRecordUtil:damageEnemyUnitsInRange(
                    actor:getName(),
                    actor.unit,
                    actor:get("area", 300),
                    damage,
                    DamageType["s_物理"],
                    x,
                    y
                )
                EffectUtil:addSpecialEffectAndDestroy(
                    actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
                    x,
                    y,
                    actor:get("modelScale", 0.3)
                )
            end
        )
    end
    actorType = ActorTypeUtil:getActorType("光明号基础技能")
    actorType.interval = actorType.interval or 1
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({base = 35, attack = 0.1}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            actor:get("area", 600),
            damage,
            DamageType["s_真实伤害"]
        )
        EffectUtil:addSpecialEffectAndDestroy(
            actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
            actor.unitX,
            actor.unitY,
            actor:get("modelScale", 2)
        )
    end
    actorType = ActorTypeUtil:getActorType("船长号基础技能")
    actorType.interval = actorType.interval or 3
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({attack = 1}, actor.unit)
        local area = actor:get("area", 1200)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            area,
            damage,
            DamageType["s_真实伤害"]
        )
        EffectUtil:addSpecialEffectAndDestroy(
            actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
            actor.unitX,
            actor.unitY,
            actor:get("modelScale", 1.5)
        )
    end
end
return ____exports
