local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 13,["11"] = 13,["12"] = 13,["14"] = 18,["15"] = 20,["16"] = 20,["17"] = 21,["18"] = 22,["20"] = 25,["21"] = 25,["22"] = 26,["23"] = 27,["25"] = 18,["26"] = 16});
local ____exports = {}
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
____exports.default = __TS__Class()
local _____82F1_96C4_589E_4F24 = ____exports.default
_____82F1_96C4_589E_4F24.name = "英雄增伤"
function _____82F1_96C4_589E_4F24.prototype.____constructor(self)
    SolarDamageState:addEventHandlerLast(function(____, event)
        local ____opt_0 = event.u1sa
        local _____5BF9_82F1_96C4_589E_52A0_4F24_5BB3 = ____opt_0 and ____opt_0["对英雄增加伤害"]
        if _____5BF9_82F1_96C4_589E_52A0_4F24_5BB3 and UnitUtil.isHero(event.unit0) then
            event.resultDamage = event.resultDamage * (1 + _____5BF9_82F1_96C4_589E_52A0_4F24_5BB3)
        end
        local ____opt_2 = event.u0sa
        local _____53D7_5230_82F1_96C4_4F24_5BB3_51CF_514D = ____opt_2 and ____opt_2["受到英雄伤害减免"]
        if _____53D7_5230_82F1_96C4_4F24_5BB3_51CF_514D and UnitUtil.isHero(event.unit1) then
            event.resultDamage = event.resultDamage * (1 - _____53D7_5230_82F1_96C4_4F24_5BB3_51CF_514D)
        end
    end)
end
return ____exports
