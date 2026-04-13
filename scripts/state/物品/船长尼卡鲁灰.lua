local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 8,["22"] = 19,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 23,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 23,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 25,["38"] = 24,["39"] = 24,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 21,["47"] = 16});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
____exports.default = __TS__Class()
local _____8239_957F_5C3C_5361_9C81_7070 = ____exports.default
_____8239_957F_5C3C_5361_9C81_7070.name = "船长尼卡鲁灰"
function _____8239_957F_5C3C_5361_9C81_7070.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("尼卡·鲁灰")
    actorType.interval = actorType.interval or 3
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({base = 1000, fullPros = 1.5}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            1200,
            damage,
            DamageType["s_真实伤害"]
        )
        SelectUtil.forEnemyUnitsInRange(
            actor.unit,
            1200,
            function(____, u)
                UnitStateUtil:stunUnit(u, 1)
            end
        )
        EffectUtil:addSpecialEffectAndDestroy(
            "model\\基本技能\\阳光桑尼号基础技能.mdx",
            actor.unitX,
            actor.unitY,
            actor:get("modelScale", 2)
        )
    end
end
return ____exports
