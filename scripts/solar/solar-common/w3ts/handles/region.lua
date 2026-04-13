local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 8,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 11,["15"] = 8,["17"] = 8,["18"] = 14,["19"] = 14,["20"] = 14,["22"] = 10,["23"] = 21,["24"] = 22,["25"] = 21,["26"] = 28,["27"] = 29,["28"] = 28,["29"] = 35,["30"] = 36,["31"] = 35,["32"] = 42,["33"] = 43,["34"] = 42,["35"] = 49,["36"] = 50,["37"] = 49,["38"] = 56,["39"] = 57,["40"] = 56,["41"] = 63,["42"] = 64,["43"] = 63,["44"] = 70,["45"] = 71,["46"] = 70,["47"] = 77,["48"] = 78,["49"] = 77,["50"] = 84,["51"] = 85,["52"] = 84,["53"] = 88,["54"] = 89,["55"] = 88});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Region = __TS__Class()
local Region = ____exports.Region
Region.name = "Region"
__TS__ClassExtends(Region, Handle)
function Region.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateRegion()
        )
    end
end
function Region.prototype.addCell(self, x, y)
    RegionAddCell(self.handle, x, y)
end
function Region.prototype.addCellPoint(self, whichPoint)
    RegionAddCellAtLoc(self.handle, whichPoint.handle)
end
function Region.prototype.addRect(self, r)
    RegionAddRect(self.handle, r.handle)
end
function Region.prototype.clearCell(self, x, y)
    RegionClearCell(self.handle, x, y)
end
function Region.prototype.clearCellPoint(self, whichPoint)
    RegionClearCellAtLoc(self.handle, whichPoint.handle)
end
function Region.prototype.clearRect(self, r)
    RegionClearRect(self.handle, r.handle)
end
function Region.prototype.containsCoords(self, x, y)
    return IsPointInRegion(self.handle, x, y)
end
function Region.prototype.containsPoint(self, whichPoint)
    IsLocationInRegion(self.handle, whichPoint.handle)
end
function Region.prototype.containsUnit(self, whichUnit)
    return IsUnitInRegion(self.handle, whichUnit.handle)
end
function Region.prototype.destroy(self)
    RemoveRegion(self.handle)
end
function Region.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
