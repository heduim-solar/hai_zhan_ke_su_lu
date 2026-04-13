local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 5,["10"] = 11,["11"] = 11,["12"] = 11,["14"] = 11,["15"] = 11,["17"] = 12,["18"] = 11,["19"] = 15,["20"] = 16,["21"] = 17,["22"] = 18,["23"] = 15,["24"] = 22,["25"] = 23,["26"] = 24,["27"] = 25,["28"] = 26,["30"] = 28,["31"] = 22,["32"] = 35,["33"] = 36,["34"] = 35,["35"] = 44,["36"] = 45,["37"] = 46,["38"] = 47,["39"] = 44,["40"] = 55,["41"] = 56,["42"] = 55,["43"] = 65,["44"] = 66,["45"] = 67,["46"] = 68,["47"] = 65,["48"] = 71,["49"] = 72,["50"] = 71,["51"] = 75,["52"] = 76,["53"] = 77,["56"] = 78,["57"] = 79,["58"] = 80,["59"] = 81,["60"] = 75,["61"] = 84,["62"] = 85,["63"] = 86,["64"] = 87,["66"] = 84,["67"] = 96,["68"] = 97,["69"] = 96,["70"] = 104,["71"] = 105,["72"] = 104,["73"] = 112,["74"] = 113,["75"] = 112,["76"] = 121,["77"] = 122,["78"] = 121,["79"] = 125,["80"] = 126,["81"] = 126,["82"] = 126,["83"] = 126,["84"] = 126,["85"] = 125,["86"] = 135,["87"] = 136,["88"] = 136,["89"] = 136,["90"] = 136,["91"] = 136,["92"] = 135,["93"] = 139,["94"] = 140,["95"] = 141,["96"] = 139,["97"] = 144,["98"] = 145,["99"] = 146,["100"] = 144,["101"] = 9,["102"] = 149,["103"] = 150,["104"] = 151,["105"] = 152});
local ____exports = {}
____exports.default = __TS__Class()
local Vec2 = ____exports.default
Vec2.name = "Vec2"
function Vec2.prototype.____constructor(self, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    self:set(x, y)
end
function Vec2.fromLocation(self, location)
    local x = GetLocationX(location)
    local y = GetLocationY(location)
    return __TS__New(____exports.default, x, y)
end
function Vec2.clamp(self, value, from, to)
    if from > to then
        from = from + to
        to = from - to
        from = from - to
    end
    return value < from and from or (value < to and value or to)
end
function Vec2.prototype.toLocation(self)
    return Location(self.x, self.y)
end
function Vec2.prototype.distance(self, another)
    local dx = another.x - self.x
    local dy = another.x - self.x
    return math.sqrt(dx * dx + dy * dy)
end
function Vec2.prototype.angle(self, another)
    return math.deg(math.atan2(another.y - self.y, another.x - self.x))
end
function Vec2.prototype.polarProjection(self, distance, angle)
    local x = self.x + distance * math.cos(angle)
    local y = self.y + distance * math.sin(angle)
    return __TS__New(____exports.default, x, y)
end
function Vec2.prototype.equals(self, another)
    return math.abs(self.x - another.x) < ____exports.default.EPSILON and math.abs(self.y - another.y) < ____exports.default.EPSILON
end
function Vec2.prototype.normalize(self)
    local n = self.x * self.x + self.y * self.y
    if n == 1 then
        return
    end
    n = math.sqrt(n)
    n = 1 / n
    self.x = self.x * n
    self.y = self.y * n
end
function Vec2.prototype.smooth(self, target, elapsedTime, responseTime)
    if elapsedTime > 0 then
        self.x = self.x + (target.x - self.x) * (elapsedTime / (elapsedTime + responseTime))
        self.y = self.y + (target.y - self.y) * (elapsedTime / (elapsedTime + responseTime))
    end
end
function Vec2.prototype.cross(self, another)
    return self.x * another.y - self.y * another.x
end
function Vec2.prototype.perp(self)
    return __TS__New(____exports.default, -self.y, self.x)
end
function Vec2.prototype.rPerp(self)
    return __TS__New(____exports.default, self.y, -self.x)
end
function Vec2.prototype.midpoint(self, another)
    return __TS__New(____exports.default, (self.x + another.x) / 2, (self.y + another.y) / 2)
end
function Vec2.prototype.compOp(self, func)
    return __TS__New(
        ____exports.default,
        func(nil, self.x),
        func(nil, self.y)
    )
end
function Vec2.prototype.clampPoint(self, from, to)
    return __TS__New(
        ____exports.default,
        ____exports.default:clamp(self.x, from.x, to.x),
        ____exports.default:clamp(self.y, from.y, to.y)
    )
end
function Vec2.prototype.set(self, x, y)
    self.x = x
    self.y = y
end
function Vec2.prototype.setVec2(self, point)
    self.x = point.x
    self.y = point.y
end
Vec2.EPSILON = 0.000001
Vec2.ZERO = __TS__New(____exports.default, 0, 0)
Vec2.ONE = __TS__New(____exports.default, 1, 1)
Vec2.UNIT_X = __TS__New(____exports.default, 1, 0)
Vec2.UNIT_Y = __TS__New(____exports.default, 0, 1)
return ____exports
