local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 8,["16"] = 8,["17"] = 8,["18"] = 8,["20"] = 8,["21"] = 12,["22"] = 10,["27"] = 20,["35"] = 27,["43"] = 34,["51"] = 41,["59"] = 49,["67"] = 56,["75"] = 63,["83"] = 70,["91"] = 74,["99"] = 78,["107"] = 82,["115"] = 86,["123"] = 93,["131"] = 97});
local ____exports = {}
local ____UnitEvent = require("solar.solar-common.tool.event.UnitEvent")
local UnitEvent = ____UnitEvent.default
local ____unit = require("solar.solar-common.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local UnitSpellEvent = ____exports.default
UnitSpellEvent.name = "UnitSpellEvent"
__TS__ClassExtends(UnitSpellEvent, UnitEvent)
function UnitSpellEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
UnitSpellEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellAbilityId",
    {get = function(self)
        return GetSpellAbilityId()
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellAbilityIdStr",
    {get = function(self)
        return id2string(GetSpellAbilityId())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnit",
    {get = function(self)
        return GetSpellTargetUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitName",
    {get = function(self)
        return GetUnitName(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetLoc",
    {get = function(self)
        return GetSpellTargetLoc()
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetX",
    {get = function(self)
        return GetSpellTargetX()
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetY",
    {get = function(self)
        return GetSpellTargetY()
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitObj",
    {get = function(self)
        return Unit:fromHandle(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitX",
    {get = function(self)
        return GetUnitX(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitY",
    {get = function(self)
        return GetUnitY(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitFacing",
    {get = function(self)
        return GetUnitFacing(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitOwner",
    {get = function(self)
        return GetOwningPlayer(GetSpellTargetUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitSpellEvent.prototype,
    "spellTargetUnitOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetSpellTargetUnit()))
    end},
    true
)
return ____exports
