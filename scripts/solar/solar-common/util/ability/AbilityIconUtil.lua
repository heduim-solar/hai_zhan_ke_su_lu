local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 9,["16"] = 9,["17"] = 11,["18"] = 11,["19"] = 11,["21"] = 11,["22"] = 27,["23"] = 28,["24"] = 29,["25"] = 30,["26"] = 31,["29"] = 27,["30"] = 41,["31"] = 42,["32"] = 44,["33"] = 45,["34"] = 46,["35"] = 47,["36"] = 48,["37"] = 48,["38"] = 48,["39"] = 48,["40"] = 48,["41"] = 48,["43"] = 50,["44"] = 51,["45"] = 41,["46"] = 14,["47"] = 17,["48"] = 20});
local ____exports = {}
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____IconUtil = require("solar.solar-common.util.frame.IconUtil")
local IconUtil = ____IconUtil.default
____exports.default = __TS__Class()
local AbilityIconUtil = ____exports.default
AbilityIconUtil.name = "AbilityIconUtil"
function AbilityIconUtil.prototype.____constructor(self)
end
function AbilityIconUtil.addTick2AbilityIconForPlayer(self, abilityId, player)
    local playerUnits = SelectUtil.getPlayerUnits(GetPlayerId(player))
    for ____, playerUnit in ipairs(playerUnits) do
        if GetUnitAbilityLevel(playerUnit, abilityId) > 0 then
            ____exports.default:addTick2AbilityIcon(abilityId, playerUnit)
        end
    end
end
function AbilityIconUtil.addTick2AbilityIcon(self, abilityId, unit)
    if GetOwningPlayer(unit) == GetLocalPlayer() then
        local abilityIdStr = LangUtil:getStringId(abilityId)
        local abilityArt = AbilityUtil:getUnitAbilityArt(unit, abilityIdStr)
        local tickPath_background = IconUtil:blendIcon(____exports.default.tickPath, ____exports.default.background)
        local resultPath = IconUtil:blendIcon(tickPath_background, abilityArt)
        EXSetAbilityDataString(
            EXGetUnitAbility(unit, abilityId),
            1,
            ABILITY_DATA_ART,
            resultPath
        )
    end
    IncUnitAbilityLevel(unit, abilityId)
    DecUnitAbilityLevel(unit, abilityId)
end
AbilityIconUtil.tickPath = "UI\\Widgets\\Glues\\GlueScreen-Checkbox-Check.blp"
AbilityIconUtil.background = "UI\\Widgets\\ToolTips\\Human\\human-tooltip-background.blp"
AbilityIconUtil.cache = __TS__New(Cache)
return ____exports
