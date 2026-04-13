local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 8,["15"] = 9,["16"] = 10,["17"] = 11,["18"] = 12,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 19,["24"] = 6,["26"] = 6,["27"] = 22,["28"] = 22,["29"] = 22,["31"] = 8,["32"] = 71,["33"] = 72,["34"] = 71,["35"] = 80,["36"] = 81,["37"] = 80,["38"] = 89,["39"] = 90,["40"] = 89,["41"] = 96,["42"] = 97,["43"] = 96,["44"] = 103,["45"] = 104,["46"] = 103,["47"] = 110,["48"] = 111,["49"] = 111,["50"] = 111,["51"] = 111,["52"] = 111,["53"] = 111,["54"] = 111,["55"] = 110,["56"] = 117,["57"] = 118,["58"] = 117,["63"] = 30,["71"] = 37,["79"] = 44,["87"] = 51,["95"] = 58,["103"] = 65});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Rectangle = __TS__Class()
local Rectangle = ____exports.Rectangle
Rectangle.name = "Rectangle"
__TS__ClassExtends(Rectangle, Handle)
function Rectangle.prototype.____constructor(self, minX, minY, maxX, maxY)
    local mapMinX = GetRectMinX(bj_mapInitialPlayableArea)
    local mapMinY = GetRectMinY(bj_mapInitialPlayableArea)
    local mapMaxX = GetRectMaxX(bj_mapInitialPlayableArea)
    local mapMaxY = GetRectMaxY(bj_mapInitialPlayableArea)
    minX = math.max(minX, mapMinX)
    minY = math.max(minY, mapMinY)
    maxX = math.min(maxX, mapMaxX)
    maxY = math.min(maxY, mapMaxY)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            Rect(minX, minY, maxX, maxY)
        )
    end
end
function Rectangle.prototype.destroy(self)
    RemoveRect(self.handle)
end
function Rectangle.prototype.enumDestructables(self, filter, actionFunc)
    EnumDestructablesInRect(self.handle, filter, actionFunc)
end
function Rectangle.prototype.enumItems(self, filter, actionFunc)
    EnumItemsInRect(self.handle, filter, actionFunc)
end
function Rectangle.prototype.move(self, newCenterX, newCenterY)
    MoveRectTo(self.handle, newCenterX, newCenterY)
end
function Rectangle.prototype.movePoint(self, newCenterPoint)
    MoveRectToLoc(self.handle, newCenterPoint.handle)
end
function Rectangle.prototype.setRect(self, minX, minY, maxX, maxY)
    SetRect(
        self.handle,
        minX,
        minY,
        maxX,
        maxY
    )
end
function Rectangle.prototype.setRectFromPoint(self, min, max)
    SetRectFromLoc(self.handle, min.handle, max.handle)
end
__TS__SetDescriptor(
    Rectangle.prototype,
    "centerX",
    {get = function(self)
        return GetRectCenterX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "centerY",
    {get = function(self)
        return GetRectCenterY(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "maxX",
    {get = function(self)
        return GetRectMaxX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "maxY",
    {get = function(self)
        return GetRectMaxY(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "minX",
    {get = function(self)
        return GetRectMinX(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Rectangle.prototype,
    "minY",
    {get = function(self)
        return GetRectMinY(self.handle)
    end},
    true
)
return ____exports
