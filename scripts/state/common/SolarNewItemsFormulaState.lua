local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 9,["16"] = 9,["17"] = 9,["19"] = 24,["20"] = 25,["21"] = 26,["22"] = 27,["23"] = 28,["24"] = 29,["25"] = 30,["29"] = 35,["30"] = 36,["31"] = 37,["32"] = 22,["33"] = 40,["34"] = 41,["35"] = 43,["36"] = 44,["37"] = 45,["38"] = 46,["39"] = 47,["43"] = 40,["44"] = 54,["45"] = 56,["46"] = 57,["47"] = 58,["48"] = 59,["49"] = 60,["51"] = 62,["52"] = 63,["53"] = 64,["56"] = 68,["57"] = 69,["59"] = 72,["60"] = 74,["62"] = 76,["64"] = 78,["65"] = 79,["66"] = 54,["67"] = 11,["68"] = 20});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____unit = require("solar.solar-common.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.default = __TS__Class()
local SolarNewItemsFormulaState = ____exports.default
SolarNewItemsFormulaState.name = "SolarNewItemsFormulaState"
function SolarNewItemsFormulaState.prototype.____constructor(self)
    local config = ____exports.default.config
    for id in pairs(config) do
        local configData = config[id]
        if configData and configData.materials then
            configData.material = {}
            for ____, materialID in ipairs(configData.materials) do
                configData.material[materialID] = 1
            end
        end
    end
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM)
    trigger:addAction(self.action)
end
function SolarNewItemsFormulaState.prototype.action()
    local triggerUnit = Unit:fromEvent()
    local config = ____exports.default.config
    for id in pairs(config) do
        local configData = config[id]
        local flag = ____exports.default:NewItemsFormulaByMaterial(triggerUnit, id, configData.material)
        if flag then
            return
        end
    end
end
function SolarNewItemsFormulaState.NewItemsFormulaByMaterial(self, unit, id, material)
    local itemAndCharges = ActorItemUtil:getItemAndActorItemAndChargesFromUnit(unit.handle)
    for materialId in pairs(material) do
        local Charges = itemAndCharges[materialId]
        if not Charges then
            return false
        end
        local materialCount = material[materialId]
        if Charges < materialCount then
            return false
        end
    end
    for materialId in pairs(material) do
        ActorItemUtil:costItemAndActorItemChargesFromUnit(unit.handle, materialId, material[materialId])
    end
    if ActorTypeUtil:hasActorType(id) then
        ActorItemUtil:addActorItemForUnit(id, unit.handle)
    else
        UnitAddItemById(unit.handle, id)
    end
    DestroyEffect(AddSpecialEffectTarget(____exports.default.modelPath, unit.handle, "origin"))
    return true
end
SolarNewItemsFormulaState.modelPath = "Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl"
SolarNewItemsFormulaState.config = {}
return ____exports
