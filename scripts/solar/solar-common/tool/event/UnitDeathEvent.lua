local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 9,["22"] = 9,["23"] = 13,["24"] = 11,["29"] = 22,["37"] = 29,["38"] = 30,["39"] = 35,["41"] = 37,["49"] = 44,["57"] = 51,["65"] = 58,["73"] = 65,["81"] = 69,["89"] = 76,["97"] = 80,["105"] = 84,["113"] = 88,["121"] = 95,["129"] = 99});
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
local UnitDeathEvent = ____exports.default
UnitDeathEvent.name = "UnitDeathEvent"
__TS__ClassExtends(UnitDeathEvent, UnitEvent)
function UnitDeathEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
UnitDeathEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "hasKillingUnit",
    {get = function(self)
        return IsHandle(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "isHeroUnitkiller",
    {get = function(self)
        local unitHandle = GetKillingUnit()
        if IsUnitType(unitHandle, UNIT_TYPE_HERO) and not IsUnitType(unitHandle, UNIT_TYPE_PEON) and not IsUnitType(unitHandle, UNIT_TYPE_SUMMONED) and not IsUnitIllusion(unitHandle) and not IsUnitHidden(unitHandle) then
            return true
        end
        return false
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnit",
    {get = function(self)
        return GetKillingUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitName",
    {get = function(self)
        return GetUnitName(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitObj",
    {get = function(self)
        return Unit:fromHandle(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitSolarData",
    {get = function(self)
        return DataBase:getUnitSolarData(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitTypeSolarData",
    {get = function(self)
        return DataBase:getUnitTypeSolarData(id2string(GetUnitTypeId(GetKillingUnit())))
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitX",
    {get = function(self)
        return GetUnitX(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitY",
    {get = function(self)
        return GetUnitY(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitFacing",
    {get = function(self)
        return GetUnitFacing(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitOwner",
    {get = function(self)
        return GetOwningPlayer(GetKillingUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitDeathEvent.prototype,
    "killingUnitOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetKillingUnit()))
    end},
    true
)
return ____exports
