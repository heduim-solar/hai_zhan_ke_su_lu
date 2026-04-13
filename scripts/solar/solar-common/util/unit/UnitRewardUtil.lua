local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 6,["9"] = 6,["10"] = 6,["12"] = 6,["13"] = 14,["14"] = 15,["15"] = 16,["16"] = 17,["18"] = 19,["19"] = 20,["20"] = 21,["21"] = 22,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 22,["27"] = 24,["28"] = 14});
local ____exports = {}
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local UnitRewardUtil = ____exports.default
UnitRewardUtil.name = "UnitRewardUtil"
function UnitRewardUtil.prototype.____constructor(self)
end
function UnitRewardUtil.addGoldWithEarnGoldP(self, unit, value)
    local unitAttribute = AttributeUtil:getUnitAttribute(unit, false)
    if unitAttribute and unitAttribute.earn_gold_p then
        value = value * (1 + unitAttribute.earn_gold_p)
    end
    local player = GetOwningPlayer(unit)
    value = math.floor(value)
    if value ~= 0 then
        SetPlayerState(
            player,
            PLAYER_STATE_RESOURCE_GOLD,
            GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) + value
        )
    end
    return value
end
return ____exports
