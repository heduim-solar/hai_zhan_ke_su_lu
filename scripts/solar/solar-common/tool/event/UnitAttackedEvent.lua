local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 9,["22"] = 9,["23"] = 13,["24"] = 11,["29"] = 21,["37"] = 28,["45"] = 35,["53"] = 42,["61"] = 49,["69"] = 56,["77"] = 60,["85"] = 64,["93"] = 68,["101"] = 75,["109"] = 79});
local ____exports = {}
local ____UnitEvent = require("solar.solar-common.tool.event.UnitEvent")
local UnitEvent = ____UnitEvent.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____unit = require("solar.solar-common.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local UnitAttackedEvent = ____exports.default
UnitAttackedEvent.name = "UnitAttackedEvent"
__TS__ClassExtends(UnitAttackedEvent, UnitEvent)
function UnitAttackedEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
UnitAttackedEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attacker",
    {get = function(self)
        return GetAttacker()
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerName",
    {get = function(self)
        return GetUnitName(GetAttacker())
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerObj",
    {get = function(self)
        return Unit:fromHandle(GetAttacker())
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerSolarData",
    {get = function(self)
        return DataBase:getUnitSolarData(GetAttacker())
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetAttacker())
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerTypeSolarData",
    {get = function(self)
        return DataBase:getUnitTypeSolarData(id2string(GetUnitTypeId(GetAttacker())))
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerX",
    {get = function(self)
        return GetUnitX(GetAttacker())
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerY",
    {get = function(self)
        return GetUnitY(GetAttacker())
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerFacing",
    {get = function(self)
        return GetUnitFacing(GetAttacker())
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerOwner",
    {get = function(self)
        return GetOwningPlayer(GetAttacker())
    end},
    true
)
__TS__SetDescriptor(
    UnitAttackedEvent.prototype,
    "attackerOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetAttacker()))
    end},
    true
)
return ____exports
