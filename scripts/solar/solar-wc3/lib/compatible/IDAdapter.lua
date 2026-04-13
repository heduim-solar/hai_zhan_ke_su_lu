local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 78,["12"] = 79,["13"] = 80,["14"] = 81,["15"] = 81,["16"] = 82,["17"] = 83,["18"] = 84,["19"] = 85,["20"] = 86,["21"] = 87,["22"] = 88,["24"] = 90,["29"] = 97,["30"] = 98,["31"] = 99,["32"] = 100,["35"] = 95,["41"] = 93,["44"] = 81,["46"] = 78,["47"] = 4,["48"] = 4,["49"] = 4,["50"] = 4,["51"] = 4,["52"] = 4,["53"] = 4,["54"] = 4,["55"] = 4,["56"] = 4,["57"] = 4,["58"] = 4,["59"] = 4,["60"] = 4,["61"] = 4,["62"] = 4,["63"] = 4,["64"] = 4,["65"] = 4,["66"] = 4,["67"] = 4,["68"] = 4,["69"] = 4,["70"] = 4,["71"] = 4,["72"] = 4,["73"] = 4,["74"] = 4,["75"] = 4,["76"] = 4,["77"] = 4,["78"] = 4,["79"] = 4,["80"] = 4,["81"] = 4,["82"] = 4,["83"] = 4,["84"] = 4,["85"] = 4,["86"] = 4,["87"] = 4,["88"] = 4,["89"] = 4,["90"] = 4,["91"] = 4,["92"] = 4,["93"] = 4,["94"] = 4,["95"] = 4,["96"] = 4,["97"] = 4,["98"] = 4,["99"] = 4,["100"] = 4,["101"] = 4,["102"] = 4,["103"] = 4,["104"] = 4,["105"] = 4,["106"] = 4,["107"] = 4,["108"] = 4,["109"] = 4,["110"] = 4,["111"] = 4,["112"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local IDAdapter = ____exports.default
IDAdapter.name = "IDAdapter"
function IDAdapter.prototype.____constructor(self)
end
function IDAdapter.init()
    for funName in pairs(____exports.default.config) do
        local oldFun = _G[funName]
        _G[funName] = function(...)
            local args = {...}
            local idIndex = ____exports.default.config[funName]
            if args and #args >= idIndex then
                local id = args[idIndex + 1]
                if id and type(id) == "string" then
                    if #id ~= 4 then
                        log.errorWithTraceBack(((funName .. " : 你传的ID不是4个字符！id=[") .. id) .. "]")
                        return nil
                    end
                    args[idIndex + 1] = FourCC(id)
                end
            end
            do
                local function ____catch(e)
                    print(e)
                    log.errorWithTraceBack(funName)
                    print_r(args)
                    error(e, 0)
                end
                local ____try, ____hasReturned, ____returnValue = pcall(function()
                    return true, oldFun(table.unpack(args))
                end)
                if not ____try then
                    ____hasReturned, ____returnValue = ____catch(____hasReturned)
                end
                if ____hasReturned then
                    return ____returnValue
                end
            end
        end
    end
end
IDAdapter.config = {
    CreateUnit = 1,
    CreateUnitAtLoc = 1,
    CreateCorpse = 1,
    UnitAddItemById = 1,
    UnitAddItemToSlotById = 1,
    GetFoodMade = 1,
    GetFoodUsed = 1,
    IsHeroUnitId = 1,
    IsUnitIdType = 1,
    UnitAddAbility = 1,
    UnitRemoveAbility = 1,
    UnitMakeAbilityPermanent = 2,
    UnitApplyTimedLife = 1,
    IssueBuildOrderById = 1,
    IssueNeutralImmediateOrderById = 2,
    IssueNeutralPointOrderById = 2,
    IssueNeutralTargetOrderById = 2,
    AddItemToAllStock = 0,
    AddItemToStock = 1,
    AddUnitToAllStock = 0,
    AddUnitToStock = 1,
    RemoveItemFromAllStock = 0,
    RemoveItemFromStock = 1,
    RemoveUnitFromAllStock = 0,
    RemoveUnitFromStock = 1,
    SetPlayerTechMaxAllowed = 1,
    GetPlayerTechMaxAllowed = 1,
    AddPlayerTechResearched = 1,
    SetPlayerTechResearched = 1,
    GetPlayerTechResearched = 1,
    GetPlayerTechCount = 1,
    SetPlayerAbilityAvailable = 1,
    UnitPoolAddUnitType = 1,
    UnitPoolRemoveUnitType = 1,
    ItemPoolAddItemType = 1,
    ItemPoolRemoveItemType = 1,
    SetCinematicScene = 0,
    AddWeatherEffect = 0,
    AddSpellEffectById = 0,
    AddSpellEffectByIdLoc = 0,
    AddSpellEffectTargetById = 0,
    GetAbilityEffectById = 0,
    GetAbilitySoundById = 0,
    SetDoodadAnimation = 3,
    SetDoodadAnimationRect = 1,
    GetObjectName = 0,
    CreateDestructable = 0,
    CreateDestructableZ = 0,
    CreateDeadDestructable = 0,
    CreateDeadDestructableZ = 0,
    CreateItem = 0,
    IsItemIdPowerup = 0,
    IsItemIdSellable = 0,
    IsItemIdPawnable = 0,
    SetItemDropID = 1,
    SelectHeroSkill = 1,
    GetUnitAbilityLevel = 1,
    DecUnitAbilityLevel = 1,
    IncUnitAbilityLevel = 1,
    SetUnitAbilityLevel = 1,
    EXGetUnitAbility = 1,
    EXSetAbilityString = 0,
    EXGetItemDataString = 0,
    EXSetItemDataString = 0
}
return ____exports
