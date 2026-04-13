local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 6,["9"] = 6,["10"] = 6,["12"] = 6,["13"] = 15,["14"] = 16,["15"] = 15,["16"] = 21,["17"] = 22,["18"] = 23,["19"] = 23,["20"] = 23,["21"] = 23,["22"] = 21,["23"] = 32,["24"] = 32,["25"] = 33,["27"] = 34,["28"] = 34,["29"] = 35,["30"] = 34,["33"] = 37,["34"] = 38,["36"] = 40,["37"] = 40,["38"] = 40,["39"] = 40,["41"] = 32});
local ____exports = {}
local ____VectorUtil = require("solar.solar-common.util.math.VectorUtil")
local VectorUtil = ____VectorUtil.default
____exports.default = __TS__Class()
local InterpolationUtil = ____exports.default
InterpolationUtil.name = "InterpolationUtil"
function InterpolationUtil.prototype.____constructor(self)
end
function InterpolationUtil.line(self, start, ____end, percent)
    return start + (____end - start) * percent
end
function InterpolationUtil.vecIn2Vectors(self, start, ____end, percent)
    local vec = VectorUtil:subtract(____end, start)
    return VectorUtil:add(
        start,
        VectorUtil:multScalar(vec, percent)
    )
end
function InterpolationUtil.bezier(self, percent, ...)
    local controlPoints = {...}
    local tempVS = {}
    do
        local i = 1
        while i < #controlPoints do
            tempVS[i] = ____exports.default:vecIn2Vectors(controlPoints[i], controlPoints[i + 1], percent)
            i = i + 1
        end
    end
    if #tempVS == 1 then
        return tempVS[1]
    else
        return ____exports.default:bezier(
            percent,
            table.unpack(tempVS)
        )
    end
end
return ____exports
