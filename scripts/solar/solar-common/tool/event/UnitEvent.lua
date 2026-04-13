local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 8,["15"] = 8,["16"] = 8,["18"] = 12,["19"] = 10,["24"] = 21,["32"] = 29,["40"] = 36,["48"] = 43,["49"] = 44,["50"] = 49,["52"] = 51,["60"] = 59,["68"] = 66,["76"] = 73,["84"] = 80,["92"] = 84,["100"] = 91,["108"] = 95,["116"] = 99,["124"] = 103,["132"] = 110,["140"] = 114});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____unit = require("solar.solar-common.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local UnitEvent = ____exports.default
UnitEvent.name = "UnitEvent"
function UnitEvent.prototype.____constructor(self)
end
UnitEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "soldUnit",
    {get = function(self)
        return GetSoldUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "soldUnitTypeIdStr",
    {get = function(self)
        return id2string(GetUnitTypeId(GetSoldUnit()))
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnit",
    {get = function(self)
        return GetTriggerUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "isHeroUnitTrig",
    {get = function(self)
        local unitHandle = GetTriggerUnit()
        if IsUnitType(unitHandle, UNIT_TYPE_HERO) and not IsUnitType(unitHandle, UNIT_TYPE_PEON) and not IsUnitType(unitHandle, UNIT_TYPE_SUMMONED) and not IsUnitIllusion(unitHandle) and not IsUnitHidden(unitHandle) then
            return true
        end
        return false
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitName",
    {get = function(self)
        return GetUnitName(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitObj",
    {get = function(self)
        return Unit:fromHandle(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitTypeIdStr",
    {get = function(self)
        return id2string(GetUnitTypeId(GetTriggerUnit()))
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitSolarData",
    {get = function(self)
        return DataBase:getUnitSolarData(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitAttribute",
    {get = function(self)
        return AttributeUtil:getUnitAttribute(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitTypeSolarData",
    {get = function(self)
        return DataBase:getUnitTypeSolarData(id2string(GetUnitTypeId(GetTriggerUnit())))
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitX",
    {get = function(self)
        return GetUnitX(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitY",
    {get = function(self)
        return GetUnitY(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitFacing",
    {get = function(self)
        return GetUnitFacing(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitOwner",
    {get = function(self)
        return GetOwningPlayer(GetTriggerUnit())
    end},
    true
)
__TS__SetDescriptor(
    UnitEvent.prototype,
    "trigUnitOwnerId",
    {get = function(self)
        return GetPlayerId(GetOwningPlayer(GetTriggerUnit()))
    end},
    true
)
return ____exports
