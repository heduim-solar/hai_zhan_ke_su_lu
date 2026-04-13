local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 9,["9"] = 9,["10"] = 9,["12"] = 9,["13"] = 24,["14"] = 26,["15"] = 28,["16"] = 29,["17"] = 30,["18"] = 31,["19"] = 32,["21"] = 34,["22"] = 24,["23"] = 43,["24"] = 44,["25"] = 45,["26"] = 46,["27"] = 47,["29"] = 43,["30"] = 56,["31"] = 57,["32"] = 58,["33"] = 59,["34"] = 60,["36"] = 56,["37"] = 68,["38"] = 68,["39"] = 76,["40"] = 77,["43"] = 81,["44"] = 82,["45"] = 83,["46"] = 85,["47"] = 86,["48"] = 86,["49"] = 87,["50"] = 89,["52"] = 92,["53"] = 82,["54"] = 95,["55"] = 96,["56"] = 99,["57"] = 100,["58"] = 101,["60"] = 104,["61"] = 105,["62"] = 106,["63"] = 108,["66"] = 112,["67"] = 113,["68"] = 96,["69"] = 117,["70"] = 76,["71"] = 15,["72"] = 74});
local ____exports = {}
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
____exports.default = __TS__Class()
local AbilityMappingUtil = ____exports.default
AbilityMappingUtil.name = "AbilityMappingUtil"
function AbilityMappingUtil.prototype.____constructor(self)
end
function AbilityMappingUtil.mapping(self, unit, templateId, targetId)
    ____exports.default:_sl_init_mapping_system()
    local unitHandleId = GetHandleId(unit)
    local mappingDatum = ____exports.default.abilityMappingData[unitHandleId]
    if not mappingDatum then
        mappingDatum = {}
        ____exports.default.abilityMappingData[unitHandleId] = mappingDatum
    end
    mappingDatum[FourCC(templateId)] = FourCC(targetId)
end
function AbilityMappingUtil.removeMappings(self, unit)
    local unitHandleId = GetHandleId(unit)
    local mappingDatum = ____exports.default.abilityMappingData[unitHandleId]
    if mappingDatum then
        ____exports.default.abilityMappingData[unitHandleId] = nil
    end
end
function AbilityMappingUtil.removeMapping(self, unit, templateId)
    local unitHandleId = GetHandleId(unit)
    local mappingDatum = ____exports.default.abilityMappingData[unitHandleId]
    if mappingDatum then
        mappingDatum[FourCC(templateId)] = nil
    end
end
function AbilityMappingUtil.getRealSpellAbilityId(self)
end
function AbilityMappingUtil._sl_init_mapping_system(self)
    if ____exports.default._sl_isInitialized then
        return
    end
    local oldGetSpellAbilityId = GetSpellAbilityId
    _G.GetSpellAbilityId = function()
        local cjRealId = oldGetSpellAbilityId()
        local unitHandleId = GetHandleId(GetTriggerUnit())
        local ____opt_0 = ____exports.default.abilityMappingData[unitHandleId]
        local targetId = ____opt_0 and ____opt_0[cjRealId]
        if targetId then
            return targetId
        end
        return cjRealId
    end
    local oldGetUnitAbilityLevel = GetUnitAbilityLevel
    _G.GetUnitAbilityLevel = function(whichUnit, abilcode)
        local unitHandleId = GetHandleId(whichUnit)
        if LangUtil:isString(abilcode) then
            abilcode = FourCC(abilcode)
        end
        local mappingDatum = ____exports.default.abilityMappingData[unitHandleId]
        for templateIdNum in pairs(mappingDatum) do
            if mappingDatum[templateIdNum] == abilcode then
                return oldGetUnitAbilityLevel(whichUnit, templateIdNum)
            end
        end
        local cjRealLv = oldGetUnitAbilityLevel(whichUnit, abilcode)
        return cjRealLv
    end
    ____exports.default._sl_isInitialized = true
end
AbilityMappingUtil.abilityMappingData = {}
AbilityMappingUtil._sl_isInitialized = false
return ____exports
