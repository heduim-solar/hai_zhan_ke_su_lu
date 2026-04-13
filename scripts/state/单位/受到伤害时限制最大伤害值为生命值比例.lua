local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 16,["17"] = 19,["18"] = 20,["19"] = 21,["20"] = 22,["21"] = 23,["24"] = 26,["27"] = 30,["28"] = 30,["29"] = 30,["30"] = 30,["31"] = 16,["32"] = 13,["33"] = 10});
local ____exports = {}
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B = ____exports.default
_____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B.name = "受到伤害时限制最大伤害值为生命值比例"
function _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B.prototype.____constructor(self)
    SolarDamageState:addEventHandlerLast(function(____, e)
        local configElement = ____exports.default.config[id2string(GetUnitTypeId(e.unit0))]
        if configElement == nil then
            local actorUnitTypeId = ActorUnitUtil:getActorUnitTypeId(e.unit0)
            if actorUnitTypeId ~= nil then
                configElement = ____exports.default.config[actorUnitTypeId]
            end
        end
        if configElement == nil or configElement == 0 then
            return
        end
        e.resultDamage = math.min(
            e.resultDamage,
            UnitStateUtil:calculateStateFormula({maxHp = configElement}, e.unit0)
        )
    end)
end
_____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B.config = {}
return ____exports
