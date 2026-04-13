local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 16,["19"] = 17,["20"] = 18,["21"] = 19,["22"] = 20,["23"] = 21,["26"] = 24,["29"] = 27,["30"] = 16,["31"] = 14,["32"] = 11});
local ____exports = {}
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
____exports.default = __TS__Class()
local _____9020_6210_4F24_5BB3_65F6_9644_5E26_76EE_6807_6700_5927_751F_547D_503C_6BD4_4F8B_7684_4F24_5BB3 = ____exports.default
_____9020_6210_4F24_5BB3_65F6_9644_5E26_76EE_6807_6700_5927_751F_547D_503C_6BD4_4F8B_7684_4F24_5BB3.name = "造成伤害时附带目标最大生命值比例的伤害"
function _____9020_6210_4F24_5BB3_65F6_9644_5E26_76EE_6807_6700_5927_751F_547D_503C_6BD4_4F8B_7684_4F24_5BB3.prototype.____constructor(self)
    SolarDamageState:addEventHandler(function(____, e)
        local configElement = ____exports.default.config[id2string(GetUnitTypeId(e.unit1))]
        if configElement == nil then
            local actorUnitTypeId = ActorUnitUtil:getActorUnitTypeId(e.unit1)
            if actorUnitTypeId ~= nil then
                configElement = ____exports.default.config[actorUnitTypeId]
            end
        end
        if configElement == nil or configElement == 0 then
            return
        end
        DamageUtil:damage(e.unit1, e.unit0, {target_maxHp = configElement}, DamageType["s_真实伤害"])
    end)
end
_____9020_6210_4F24_5BB3_65F6_9644_5E26_76EE_6807_6700_5927_751F_547D_503C_6BD4_4F8B_7684_4F24_5BB3.config = {}
return ____exports
