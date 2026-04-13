local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 7,["15"] = 8,["16"] = 5,["18"] = 5,["19"] = 11,["20"] = 11,["21"] = 11,["23"] = 7,["24"] = 39,["25"] = 40,["26"] = 39,["27"] = 43,["28"] = 44,["29"] = 43,["30"] = 47,["31"] = 48,["32"] = 47,["38"] = 16,["40"] = 19,["41"] = 20,["51"] = 24,["53"] = 27,["54"] = 28,["63"] = 36});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Point = __TS__Class()
local Point = ____exports.Point
Point.name = "Point"
__TS__ClassExtends(Point, Handle)
function Point.prototype.____constructor(self, x, y)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            Location(x, y)
        )
    end
end
function Point.prototype.destroy(self)
    RemoveLocation(self.handle)
end
function Point.prototype.setPosition(self, x, y)
    MoveLocation(self.handle, x, y)
end
function Point.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    Point.prototype,
    "x",
    {
        get = function(self)
            return GetLocationX(self.handle)
        end,
        set = function(self, value)
            MoveLocation(self.handle, value, self.y)
        end
    },
    true
)
__TS__SetDescriptor(
    Point.prototype,
    "y",
    {
        get = function(self)
            return GetLocationY(self.handle)
        end,
        set = function(self, value)
            MoveLocation(self.handle, self.x, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Point.prototype,
    "z",
    {get = function(self)
        return GetLocationZ(self.handle)
    end},
    true
)
return ____exports
