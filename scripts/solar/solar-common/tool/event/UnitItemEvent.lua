local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["20"] = 9,["22"] = 9,["23"] = 13,["24"] = 11,["29"] = 23,["37"] = 30,["45"] = 37,["53"] = 44,["61"] = 52,["69"] = 59,["77"] = 66,["85"] = 74,["93"] = 81,["101"] = 88,["109"] = 92,["117"] = 96});
local ____exports = {}
local ____UnitEvent = require("solar.solar-common.tool.event.UnitEvent")
local UnitEvent = ____UnitEvent.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____item = require("solar.solar-common.w3ts.handles.item")
local Item = ____item.Item
____exports.default = __TS__Class()
local UnitItemEvent = ____exports.default
UnitItemEvent.name = "UnitItemEvent"
__TS__ClassExtends(UnitItemEvent, UnitEvent)
function UnitItemEvent.prototype.____constructor(self)
    UnitEvent.prototype.____constructor(self)
end
UnitItemEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItem",
    {get = function(self)
        return GetManipulatedItem()
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemName",
    {get = function(self)
        return GetItemName(GetManipulatedItem())
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemTypeIdStr",
    {get = function(self)
        return id2string(GetItemTypeId(GetManipulatedItem()))
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemObj",
    {get = function(self)
        return Item:fromHandle(GetManipulatedItem())
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "soldItemName",
    {get = function(self)
        return GetItemName(GetSoldItem())
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "buyingUnit",
    {get = function(self)
        return GetBuyingUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "sellingUnit",
    {get = function(self)
        return GetSellingUnit()
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "soldItem",
    {get = function(self)
        return GetSoldItem()
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "soldItemTypeIdStr",
    {get = function(self)
        return id2string(GetItemTypeId(GetSoldItem()))
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemSolarData",
    {get = function(self)
        return DataBase:getItemSolarData(GetManipulatedItem())
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemTypeSolarData",
    {get = function(self)
        return DataBase:getItemTypeSolarData(id2string(GetItemTypeId(GetManipulatedItem())))
    end},
    true
)
__TS__SetDescriptor(
    UnitItemEvent.prototype,
    "manipulatedItemAttribute",
    {get = function(self)
        return AttributeUtil:getItemAttribute(GetManipulatedItem())
    end},
    true
)
return ____exports
