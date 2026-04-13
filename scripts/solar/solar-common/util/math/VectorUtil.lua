local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["10"] = 4,["11"] = 11,["12"] = 12,["13"] = 13,["14"] = 14,["15"] = 15,["16"] = 16,["18"] = 18,["19"] = 11,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 29,["24"] = 30,["25"] = 31,["27"] = 33,["28"] = 26,["29"] = 41,["30"] = 42,["31"] = 43,["32"] = 44,["33"] = 45,["34"] = 46,["36"] = 48,["37"] = 41,["38"] = 56,["39"] = 57,["40"] = 58,["41"] = 59,["42"] = 60,["43"] = 61,["45"] = 63,["46"] = 56,["47"] = 71,["48"] = 72,["49"] = 73,["50"] = 74,["51"] = 71});
local ____exports = {}
____exports.default = __TS__Class()
local VectorUtil = ____exports.default
VectorUtil.name = "VectorUtil"
function VectorUtil.prototype.____constructor(self)
end
function VectorUtil.add(self, v1, v2)
    local x = v1.x + v2.x
    local y = v1.y + v2.y
    if v1.z then
        local z = v1.z + (v2.z and v2.z or 0)
        return {x = x, y = y, z = z}
    end
    return {x = x, y = y}
end
function VectorUtil.subtract(self, v1, v2)
    local x = v1.x - v2.x
    local y = v1.y - v2.y
    if v1.z then
        local z = v1.z - (v2.z and v2.z or 0)
        return {x = x, y = y, z = z}
    end
    return {x = x, y = y}
end
function VectorUtil.mult(self, v1, v2)
    local x = v1.x * v2.x
    local y = v1.y * v2.y
    if v1.z then
        local z = v1.z * (v2.z and v2.z or 0)
        return {x = x, y = y, z = z}
    end
    return {x = x, y = y}
end
function VectorUtil.multScalar(self, v1, scalar)
    local x = v1.x * scalar
    local y = v1.y * scalar
    if v1.z then
        local z = v1.z * scalar
        return {x = x, y = y, z = z}
    end
    return {x = x, y = y}
end
function VectorUtil.getRandomXY(self, v1, bound)
    local x = v1.x + GetRandomInt(-bound, bound)
    local y = v1.y + GetRandomInt(-bound, bound)
    return {x = x, y = y}
end
return ____exports
