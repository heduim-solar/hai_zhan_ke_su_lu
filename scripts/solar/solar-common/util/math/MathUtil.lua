local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 2,["8"] = 3,["9"] = 4,["10"] = 5,["11"] = 6,["12"] = 7,["13"] = 9,["14"] = 9,["15"] = 9,["17"] = 9,["18"] = 19,["19"] = 20,["20"] = 20,["21"] = 20,["22"] = 20,["23"] = 20,["24"] = 20,["25"] = 19,["26"] = 30,["27"] = 31,["28"] = 32,["29"] = 33,["30"] = 30,["31"] = 43,["32"] = 44,["33"] = 45,["34"] = 46,["35"] = 43,["36"] = 56,["37"] = 57,["38"] = 56,["39"] = 67,["40"] = 68,["41"] = 67,["42"] = 75,["43"] = 76,["44"] = 75,["45"] = 83,["46"] = 84,["47"] = 83,["48"] = 92,["49"] = 93,["50"] = 92,["51"] = 100,["52"] = 101,["53"] = 102,["55"] = 104,["56"] = 105,["57"] = 106,["59"] = 108,["60"] = 100,["61"] = 115,["62"] = 116,["63"] = 115,["64"] = 123,["65"] = 124,["66"] = 123,["67"] = 136,["68"] = 137,["69"] = 138,["70"] = 139,["71"] = 140,["73"] = 142,["74"] = 136,["75"] = 152,["76"] = 152,["77"] = 152,["79"] = 153,["80"] = 154,["81"] = 155,["82"] = 156,["83"] = 157,["85"] = 159,["86"] = 152});
local ____exports = {}
local PI = 3.14159
local E = 2.71828
local CELLWIDTH = 128
local CLIFFHEIGHT = 128
local UNIT_FACING = 270
local RADTODEG = 180 / PI
local DEGTORAD = PI / 180
____exports.default = __TS__Class()
local MathUtil = ____exports.default
MathUtil.name = "MathUtil"
function MathUtil.prototype.____constructor(self)
end
function MathUtil.distanceBetweenUnits(u1, u2)
    return ____exports.default.distanceBetweenPoints(
        GetUnitX(u1),
        GetUnitY(u1),
        GetUnitX(u2),
        GetUnitY(u2)
    )
end
function MathUtil.distanceBetweenPoints(x1, y1, x2, y2)
    local dx = x2 - x1
    local dy = y2 - y1
    return SquareRoot(dx * dx + dy * dy)
end
function MathUtil.polarProjection(x1, y1, dist, angle)
    local x = x1 + dist * Cos(angle * DEGTORAD)
    local y = y1 + dist * Sin(angle * DEGTORAD)
    return {x = x, y = y}
end
function MathUtil.angleBetweenCoords(x1, y1, x2, y2)
    return RADTODEG * Atan2(y2 - y1, x2 - x1)
end
function MathUtil.radianBetweenCoords(x1, y1, x2, y2)
    return Atan2(y2 - y1, x2 - x1)
end
function MathUtil.radian2angle(radian)
    return RADTODEG * radian
end
function MathUtil.angle2radian(angle)
    return DEGTORAD * angle
end
function MathUtil.isBackAngle(jd0, jd1)
    return CosBJ(jd1 - jd0) >= 0
end
function MathUtil.sum(data)
    if not data then
        return 0
    end
    local count = 0
    for k in pairs(data) do
        count = count + data[k]
    end
    return count
end
function MathUtil.min(...)
    return math.min(...)
end
function MathUtil.max(...)
    return math.max(...)
end
function MathUtil.clamp(value, min, max)
    if value > max then
        return max
    elseif value < min then
        return min
    end
    return value
end
function MathUtil.armorReduction(armor, ardf)
    if ardf == nil then
        ardf = ArmorReducesDamageFactor
    end
    if armor == 0 then
        return 0
    elseif armor < 0 then
        armor = -armor
        return -(armor / (armor + 1 / ardf))
    end
    return armor / (armor + 1 / ardf)
end
return ____exports
