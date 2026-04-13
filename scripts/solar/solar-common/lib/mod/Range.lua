local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 6,["8"] = 6,["9"] = 9,["10"] = 9,["11"] = 9,["12"] = 17,["13"] = 17,["14"] = 17,["16"] = 17,["17"] = 17,["19"] = 17,["20"] = 17,["22"] = 17,["23"] = 17,["25"] = 18,["26"] = 17,["27"] = 26,["28"] = 27,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 33,["35"] = 34,["36"] = 35,["37"] = 35,["38"] = 35,["39"] = 35,["40"] = 35,["41"] = 35,["42"] = 35,["43"] = 26,["44"] = 38,["45"] = 39,["46"] = 38,["47"] = 42,["48"] = 43,["49"] = 42,["50"] = 46,["51"] = 47,["52"] = 46,["53"] = 50,["54"] = 51,["55"] = 50,["56"] = 54,["57"] = 55,["58"] = 54,["59"] = 58,["60"] = 59,["61"] = 58,["62"] = 62,["63"] = 63,["64"] = 62,["65"] = 66,["66"] = 67,["67"] = 66,["68"] = 70,["69"] = 71,["70"] = 70,["71"] = 74,["72"] = 75,["73"] = 75,["74"] = 75,["75"] = 75,["76"] = 75,["77"] = 76,["78"] = 77,["79"] = 78,["80"] = 79,["81"] = 80,["82"] = 80,["84"] = 81,["85"] = 81,["86"] = 81,["87"] = 81,["88"] = 81,["89"] = 82,["90"] = 82,["92"] = 83,["93"] = 83,["95"] = 84,["96"] = 85,["97"] = 74,["98"] = 88,["99"] = 89,["100"] = 89,["101"] = 89,["102"] = 89,["103"] = 90,["104"] = 90,["105"] = 90,["106"] = 90,["107"] = 91,["108"] = 91,["109"] = 91,["110"] = 91,["111"] = 92,["112"] = 92,["113"] = 92,["114"] = 92,["115"] = 93,["116"] = 88,["117"] = 96,["118"] = 97,["119"] = 98,["120"] = 99,["121"] = 100,["122"] = 96,["123"] = 103,["124"] = 104,["125"] = 105,["126"] = 106,["127"] = 107,["128"] = 103,["129"] = 110,["130"] = 110,["131"] = 110,["132"] = 110,["133"] = 110,["134"] = 110,["135"] = 110});
local ____exports = {}
local ____Vec2 = require("solar.solar-common.lib.mod.Vec2")
local Vec2 = ____Vec2.default
____exports.default = __TS__Class()
local Range = ____exports.default
Range.name = "Range"
function Range.prototype.____constructor(self, x, y, w, h)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if w == nil then
        w = 0
    end
    if h == nil then
        h = 0
    end
    self:set(x, y, w, h)
end
function Range.fromRect(self, whichRect)
    local minX = GetRectMinX(whichRect)
    local minY = GetRectMinY(whichRect)
    local maxX = GetRectMaxX(whichRect)
    local maxY = GetRectMaxY(whichRect)
    local x = minX
    local y = minY
    local width = maxX - minX
    local height = maxY - minY
    return __TS__New(
        ____exports.default,
        x,
        y,
        width,
        height
    )
end
function Range.prototype.equals(self, another)
    return self.origin:equals(another.origin) and self.size:equals(another.size)
end
function Range.prototype.maxX(self)
    return self.origin.x + self.size.width
end
function Range.prototype.midX(self)
    return self.origin.x + self.size.width / 2
end
function Range.prototype.minX(self)
    return self.origin.x
end
function Range.prototype.maxY(self)
    return self.origin.y + self.size.height
end
function Range.prototype.midY(self)
    return self.origin.y + self.size.height / 2
end
function Range.prototype.minY(self)
    return self.origin.y
end
function Range.prototype.containsPoint(self, point)
    return point.x >= self:minX() and point.x <= self:maxX() and point.y >= self:minY() and point.y <= self:maxY()
end
function Range.prototype.intersectsRange(self, another)
    return not (self:maxX() < another:minX() or another:maxX() < self:minX() or self:maxY() < another:minY() or another:maxY() < self:minY())
end
function Range.prototype.intersectsCircle(self, center, radius)
    local rectangleCenter = __TS__New(
        Vec2,
        self:midX(),
        self:midY()
    )
    local w = self.size.width / 2
    local h = self.size.height / 2
    local dx = math.abs(center.x - rectangleCenter.x)
    local dy = math.abs(center.y - rectangleCenter.y)
    if dx > radius + w or dy > radius + h then
        return false
    end
    local circleDistance = __TS__New(
        Vec2,
        math.abs(center.x - self.origin.x - w),
        math.abs(center.y - self.origin.y - h)
    )
    if circleDistance.x <= w then
        return true
    end
    if circleDistance.y <= h then
        return true
    end
    local cornerDistanceSq = math.pow(circleDistance.x - w, 2) + math.pow(circleDistance.y - h, 2)
    return cornerDistanceSq <= math.pow(radius, 2)
end
function Range.prototype.merge(self, another)
    local minX = math.min(
        self:minX(),
        another:minX()
    )
    local minY = math.min(
        self:minY(),
        another:minY()
    )
    local maxX = math.max(
        self:maxX(),
        another:maxX()
    )
    local maxY = math.max(
        self:maxY(),
        another:maxY()
    )
    self:set(minX, minY, maxX - minX, maxY - minY)
end
function Range.prototype.set(self, x, y, w, h)
    self.origin.x = x
    self.origin.y = y
    self.size.width = w
    self.size.height = h
end
function Range.prototype.setRange(self, range)
    self.origin.x = range.origin.x
    self.origin.y = range.origin.y
    self.size.width = range.size.width
    self.size.height = range.size.height
end
Range.ZERO = __TS__New(
    ____exports.default,
    0,
    0,
    0,
    0
)
return ____exports
