local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 7,["11"] = 7,["12"] = 9,["13"] = 9,["14"] = 11,["15"] = 11,["16"] = 11,["17"] = 11,["19"] = 14,["20"] = 11,["22"] = 11,["23"] = 17,["24"] = 17,["25"] = 17,["27"] = 13,["28"] = 27,["29"] = 28,["30"] = 27,["31"] = 34,["32"] = 35,["33"] = 34,["34"] = 41,["35"] = 42,["36"] = 41,["37"] = 48,["38"] = 49,["39"] = 49,["40"] = 49,["41"] = 49,["42"] = 49,["43"] = 49,["44"] = 49,["45"] = 48,["46"] = 55,["47"] = 56,["48"] = 56,["49"] = 56,["50"] = 56,["51"] = 56,["52"] = 56,["53"] = 56,["54"] = 56,["55"] = 55,["56"] = 62,["57"] = 63,["58"] = 62,["59"] = 69,["60"] = 70,["61"] = 70,["62"] = 70,["63"] = 70,["64"] = 70,["65"] = 70,["66"] = 70,["67"] = 69,["68"] = 76,["69"] = 77,["70"] = 76,["71"] = 83,["72"] = 84,["73"] = 83,["74"] = 90,["75"] = 91,["76"] = 90,["77"] = 97,["78"] = 98,["79"] = 97,["80"] = 104,["81"] = 105,["82"] = 104,["83"] = 111,["84"] = 112,["85"] = 111,["86"] = 120,["87"] = 121,["88"] = 120,["89"] = 129,["90"] = 130,["91"] = 129,["92"] = 150,["93"] = 151,["94"] = 150,["95"] = 157,["96"] = 158,["97"] = 159,["99"] = 161,["101"] = 157,["102"] = 168,["103"] = 169,["104"] = 170,["106"] = 172,["108"] = 168,["109"] = 179,["110"] = 180,["111"] = 181,["113"] = 183,["115"] = 179,["116"] = 190,["117"] = 191,["118"] = 192,["120"] = 194,["122"] = 190,["123"] = 208,["124"] = 209,["125"] = 208,["126"] = 215,["127"] = 216,["128"] = 215,["129"] = 222,["130"] = 223,["131"] = 222,["136"] = 137});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____unit = require("solar.solar-common.w3ts.handles.unit")
local Unit = ____unit.Unit
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
____exports.Group = __TS__Class()
local Group = ____exports.Group
Group.name = "Group"
__TS__ClassExtends(Group, Handle)
function Group.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateGroup()
        )
    end
end
function Group.prototype.addUnit(self, whichUnit)
    GroupAddUnit(self.handle, whichUnit.handle)
end
function Group.prototype.clear(self)
    GroupClear(self.handle)
end
function Group.prototype.destroy(self)
    DestroyGroup(self.handle)
end
function Group.prototype.enumUnitsInRange(self, x, y, radius, filter)
    GroupEnumUnitsInRange(
        self.handle,
        x,
        y,
        radius,
        filter
    )
end
function Group.prototype.enumUnitsInRangeCounted(self, x, y, radius, filter, countLimit)
    GroupEnumUnitsInRangeCounted(
        self.handle,
        x,
        y,
        radius,
        filter,
        countLimit
    )
end
function Group.prototype.enumUnitsInRangeOfPoint(self, whichPoint, radius, filter)
    GroupEnumUnitsInRangeOfLoc(self.handle, whichPoint.handle, radius, filter)
end
function Group.prototype.enumUnitsInRangeOfPointCounted(self, whichPoint, radius, filter, countLimit)
    GroupEnumUnitsInRangeOfLocCounted(
        self.handle,
        whichPoint.handle,
        radius,
        filter,
        countLimit
    )
end
function Group.prototype.enumUnitsInRect(self, r, filter)
    GroupEnumUnitsInRect(self.handle, r, filter)
end
function Group.prototype.enumUnitsInRectCounted(self, r, filter, countLimit)
    GroupEnumUnitsInRectCounted(self.handle, r.handle, filter, countLimit)
end
function Group.prototype.enumUnitsOfPlayer(self, whichPlayer, filter)
    GroupEnumUnitsOfPlayer(self.handle, whichPlayer.handle, filter)
end
function Group.prototype.enumUnitsOfType(self, unitName, filter)
    GroupEnumUnitsOfType(self.handle, unitName, filter)
end
function Group.prototype.enumUnitsOfTypeCounted(self, unitName, filter, countLimit)
    GroupEnumUnitsOfTypeCounted(self.handle, unitName, filter, countLimit)
end
function Group.prototype.enumUnitsSelected(self, whichPlayer, radius, filter)
    GroupEnumUnitsSelected(self.handle, whichPlayer.handle, filter)
end
Group.prototype["for"] = function(self, callback)
    ForGroup(self.handle, callback)
end
function Group.prototype.forSL(self, callback)
    GroupUtil:forSL(self.handle, callback)
end
function Group.prototype.hasUnit(self, whichUnit)
    return IsUnitInGroup(whichUnit.handle, self.handle)
end
function Group.prototype.orderCoords(self, order, x, y)
    if type(order) == "string" then
        GroupPointOrder(self.handle, order, x, y)
    else
        GroupPointOrderById(self.handle, order, x, y)
    end
end
function Group.prototype.orderImmediate(self, order)
    if type(order) == "string" then
        GroupImmediateOrder(self.handle, order)
    else
        GroupImmediateOrderById(self.handle, order)
    end
end
function Group.prototype.orderPoint(self, order, whichPoint)
    if type(order) == "string" then
        GroupPointOrderLoc(self.handle, order, whichPoint.handle)
    else
        GroupPointOrderByIdLoc(self.handle, order, whichPoint.handle)
    end
end
function Group.prototype.orderTarget(self, order, targetWidget)
    if type(order) == "string" then
        GroupTargetOrder(self.handle, order, targetWidget.handle)
    else
        GroupTargetOrderById(self.handle, order, targetWidget.handle)
    end
end
function Group.fromHandle(self, handle)
    return self:getObject(handle)
end
function Group.getEnumUnit(self)
    return Unit:fromHandle(GetEnumUnit())
end
function Group.getFilterUnit(self)
    return Unit:fromHandle(GetFilterUnit())
end
__TS__SetDescriptor(
    Group.prototype,
    "first",
    {get = function(self)
        return Unit:fromHandle(FirstOfGroup(self.handle))
    end},
    true
)
return ____exports
