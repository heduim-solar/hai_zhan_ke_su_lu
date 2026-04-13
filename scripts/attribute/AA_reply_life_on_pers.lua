local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 19,["14"] = 19,["15"] = 19,["17"] = 21,["18"] = 22,["19"] = 23,["20"] = 24,["21"] = 25,["22"] = 27,["24"] = 29,["25"] = 30,["26"] = 31,["28"] = 24,["29"] = 23,["30"] = 20});
local ____exports = {}
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
____exports.default = __TS__Class()
local AA_reply_life_on_pers = ____exports.default
AA_reply_life_on_pers.name = "AA_reply_life_on_pers"
function AA_reply_life_on_pers.prototype.____constructor(self)
    local t = __TS__New(Trigger)
    t:registerTimerEvent(1, true)
    t:addAction(function()
        AttributeUtil:forAllUnitsAttribute(function(____, unitHandle, attribute)
            if attribute.reply_life_on_pers then
                UnitStateUtil:addLife(unitHandle, attribute.reply_life_on_pers)
            end
            if attribute.reply_life_by_p_on_pers then
                local life = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) * attribute.reply_life_by_p_on_pers
                UnitStateUtil:addLife(unitHandle, life)
            end
        end)
    end)
end
return ____exports
