local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 9,["22"] = 9,["23"] = 13,["24"] = 11,["29"] = 21,["37"] = 28,["45"] = 35,["53"] = 42,["61"] = 49,["69"] = 56,["77"] = 63,["85"] = 70,["93"] = 77,["101"] = 84,["109"] = 91,["117"] = 98,["125"] = 102,["133"] = 106,["141"] = 110,["149"] = 117,["157"] = 121});
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
local UnitDamagedEvent = ____exports.default
UnitDamagedEvent.name = "UnitDamagedEvent"
__TS__ClassExtends(UnitDamagedEvent, UnitEvent)
function UnitDamagedEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
UnitDamagedEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damage",
    {get = function(self)
        return GetEventDamage()
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "hasDamageSource",
    {get = function(self)
        return IsHandle(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSource",
    {get = function(self)
        return GetEventDamageSource()
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceTypeIdStr",
    {get = function(self)
        return id2string(GetUnitTypeId(GetEventDamageSource()))
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceName",
    {get = function(self)
        return GetUnitName(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageTypeId",
    {get = function(self)
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE)
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "attackTypeId",
    {get = function(self)
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_ATTACK_TYPE)
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "weaponTypeId",
    {get = function(self)
        return EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE)
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceObj",
    {get = function(self)
        return Unit:fromHandle(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceSolarData",
    {get = function(self)
        return DataBase:getUnitSolarData(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceTypeSolarData",
    {get = function(self)
        return DataBase:getUnitTypeSolarData(id2string(GetUnitTypeId(GetEventDamageSource())))
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceX",
    {get = function(self)
        return GetUnitX(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceY",
    {get = function(self)
        return GetUnitY(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceFacing",
    {get = function(self)
        return GetUnitFacing(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceOwner",
    {get = function(self)
        return GetOwningPlayer(GetEventDamageSource())
    end},
    true
)
__TS__SetDescriptor(
    UnitDamagedEvent.prototype,
    "damageSourceOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetEventDamageSource()))
    end},
    true
)
return ____exports
