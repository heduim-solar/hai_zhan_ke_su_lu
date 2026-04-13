local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 6,["17"] = 9,["18"] = 10,["19"] = 10,["20"] = 10,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 15,["28"] = 14,["29"] = 14,["30"] = 10,["31"] = 10,["32"] = 10,["33"] = 9});
local ____exports = {}
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
____exports.default = __TS__Class()
local _____88AB_653B_51FB_65F6_65E0_654C = ____exports.default
_____88AB_653B_51FB_65F6_65E0_654C.name = "被攻击时无敌"
function _____88AB_653B_51FB_65F6_65E0_654C.prototype.____constructor(self)
end
function _____88AB_653B_51FB_65F6_65E0_654C.prototype.onUnitDamaged(self, actor, damageSource, event)
    actor:ifReady(
        45,
        function()
            local unit = actor.unit
            UnitStateUtil:setInvulnerable(unit, true)
            TextTagUtil.text("无敌30秒!(冷却45秒)", actor.unit)
            BaseUtil.runLater(
                30,
                function()
                    UnitStateUtil:setInvulnerable(unit, false)
                end
            )
        end,
        "被攻击时无敌"
    )
end
return ____exports
