local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 7,["11"] = 7,["12"] = 7,["14"] = 7,["15"] = 14,["16"] = 15,["17"] = 16,["19"] = 18,["20"] = 19,["21"] = 20,["22"] = 21,["23"] = 22,["25"] = 24,["27"] = 26,["28"] = 14});
local ____exports = {}
local ____order = require("solar.solar-common.w3ts.globals.order")
local OrderId = ____order.OrderId
local ____AbilityObjectIdOrder = require("solar.solar-wc3.lib.core.base_object.AbilityObjectIdOrder")
local AbilityOrder = ____AbilityObjectIdOrder.AbilityOrder
____exports.default = __TS__Class()
local AbilityOrderUtil = ____exports.default
AbilityOrderUtil.name = "AbilityOrderUtil"
function AbilityOrderUtil.prototype.____constructor(self)
end
function AbilityOrderUtil.getOrder(self, abilityIdStr)
    if not _g_objs.ability[abilityIdStr] then
        return 0
    end
    local code = _g_objs.ability[abilityIdStr].code
    if code == "ANcl" then
        local order = _g_objs.ability[abilityIdStr].DataF1
        if not order then
            return 0
        end
        return OrderId[order] or 0
    end
    return AbilityOrder[code] or 0
end
return ____exports
