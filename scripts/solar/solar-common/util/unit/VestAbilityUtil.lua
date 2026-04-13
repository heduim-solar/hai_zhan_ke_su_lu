local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 11,["13"] = 11,["14"] = 11,["16"] = 11,["17"] = 19,["18"] = 20,["19"] = 20,["20"] = 20,["21"] = 20,["22"] = 20,["23"] = 21,["24"] = 22,["25"] = 23,["26"] = 25,["27"] = 26,["28"] = 27,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 19,["34"] = 43,["35"] = 43,["36"] = 43,["38"] = 43,["39"] = 43,["41"] = 43,["42"] = 43,["44"] = 44,["45"] = 44,["46"] = 44,["47"] = 44,["48"] = 44,["49"] = 45,["50"] = 46,["51"] = 47,["52"] = 49,["53"] = 50,["54"] = 51,["55"] = 52,["56"] = 53,["57"] = 54,["58"] = 55,["59"] = 43});
local ____exports = {}
local ____VestUtil = require("solar.solar-common.util.unit.VestUtil")
local VestUtil = ____VestUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____TargetType = require("solar.solar-common.constant.TargetType")
local TargetType = ____TargetType.default
____exports.default = __TS__Class()
local VestAbilityUtil = ____exports.default
VestAbilityUtil.name = "VestAbilityUtil"
function VestAbilityUtil.prototype.____constructor(self)
end
function VestAbilityUtil.polymorph(self, target, dur)
    local vest = VestUtil.createVest(
        PlayerUtil:neutralPassivePlayer(),
        GetUnitX(target),
        GetUnitY(target)
    )
    local abilityId = "ACpy"
    UnitAddAbility(vest, abilityId)
    local ability = EXGetUnitAbility(vest, abilityId)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, 1000)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DUR, dur)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_HERODUR, dur)
    EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_TARGS, TargetType.notself)
    IncUnitAbilityLevel(vest, abilityId)
    DecUnitAbilityLevel(vest, abilityId)
    IssueTargetOrder(vest, "polymorph", target)
end
function VestAbilityUtil.lightningChain(self, source, target, damage, targetCountMax, area, damageAttenuation)
    if targetCountMax == nil then
        targetCountMax = 4
    end
    if area == nil then
        area = 1000
    end
    if damageAttenuation == nil then
        damageAttenuation = 0.1
    end
    local vest = VestUtil.createVest(
        GetOwningPlayer(source),
        GetUnitX(source),
        GetUnitY(source)
    )
    local abilityId = "ACcl"
    UnitAddAbility(vest, abilityId)
    local ability = EXGetUnitAbility(vest, abilityId)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_A, damage)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, targetCountMax)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, damageAttenuation)
    EXSetAbilityDataReal(ability, 1, ABILITY_DATA_AREA, area)
    IncUnitAbilityLevel(vest, abilityId)
    DecUnitAbilityLevel(vest, abilityId)
    IssueTargetOrder(vest, "chainlightning", target)
end
return ____exports
