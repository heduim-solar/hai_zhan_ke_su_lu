local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 6,["8"] = 6,["10"] = 6,["11"] = 14,["12"] = 15,["13"] = 14,["14"] = 24,["15"] = 25,["16"] = 24,["17"] = 33,["18"] = 34,["19"] = 33,["20"] = 43,["21"] = 44,["22"] = 43,["23"] = 52,["24"] = 53,["25"] = 54,["26"] = 52,["27"] = 62,["28"] = 63,["29"] = 64,["30"] = 65,["31"] = 66,["32"] = 67,["33"] = 68,["35"] = 70,["37"] = 72,["38"] = 62,["39"] = 76,["40"] = 77,["41"] = 76,["42"] = 81,["43"] = 82,["44"] = 81});
local ____exports = {}
____exports.default = __TS__Class()
local BitUtil = ____exports.default
BitUtil.name = "BitUtil"
function BitUtil.prototype.____constructor(self)
end
function BitUtil.add(self, flag, ____bit)
    return flag | ____bit
end
function BitUtil.sub(self, flag, ____bit)
    return flag & ~____bit
end
function BitUtil.enum(self, x)
    return (1 << x) - 1
end
function BitUtil.contains(self, flag, ____bit)
    return flag & ____bit == ____bit
end
function BitUtil.toBit(self, index)
    assert(0 <= index and index < 32, "out of range")
    return 1 << index
end
function BitUtil.size(self, flag)
    local ret = 0
    local temp = 0
    while 0 ~= flag do
        temp = flag & 1
        if 1 == temp then
            ret = ret + 1
        end
        flag = flag >> 1
    end
    return ret
end
function BitUtil.isEven(self, x)
    return 0 == x & 1
end
function BitUtil.isOdd(self, x)
    return 1 == x & 1
end
return ____exports
