local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 10,["14"] = 10,["15"] = 10,["17"] = 14,["18"] = 15,["19"] = 16,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 21,["25"] = 22,["26"] = 22,["27"] = 22,["28"] = 23,["29"] = 24,["30"] = 22,["31"] = 22,["33"] = 17,["34"] = 13});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
____exports.default = __TS__Class()
local _____5FEB_901F_5EFA_9020 = ____exports.default
_____5FEB_901F_5EFA_9020.name = "快速建造"
function _____5FEB_901F_5EFA_9020.prototype.____constructor(self)
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_START)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_START)
    trigger:addAction(function()
        local triggerUnit = GetTriggerUnit()
        local player = GetOwningPlayer(triggerUnit)
        local playerAttr = AttributeUtil:getPlayerAttribute(player)
        if playerAttr and playerAttr["快速建造"] then
            BaseUtil.runLater(
                0.01,
                function()
                    UnitSetConstructionProgress(triggerUnit, 99)
                    UnitSetUpgradeProgress(triggerUnit, 99)
                end
            )
        end
    end)
end
return ____exports
