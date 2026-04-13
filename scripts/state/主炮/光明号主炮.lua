local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 19,["17"] = 20,["20"] = 23,["21"] = 23,["22"] = 23,["23"] = 24,["24"] = 23,["25"] = 23,["26"] = 23,["27"] = 19,["28"] = 9});
local ____exports = {}
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
____exports.default = __TS__Class()
local _____5149_660E_53F7_4E3B_70AE = ____exports.default
_____5149_660E_53F7_4E3B_70AE.name = "光明号主炮"
function _____5149_660E_53F7_4E3B_70AE.prototype.____constructor(self)
    SolarDamageState:addEventHandlerLast(function(____, event)
        if not UnitUtil.isHero(event.unit0) then
            return
        end
        ActorAbilityUtil:ifUnitHasActorAbility(
            event.unit1,
            function(____, actor)
                event.resultDamage = event.resultDamage * 5
            end,
            "光明号"
        )
    end)
end
return ____exports
