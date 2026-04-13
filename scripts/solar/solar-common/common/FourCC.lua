local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 7,["7"] = 7,["8"] = 7,["10"] = 7,["11"] = 11,["12"] = 13,["13"] = 14,["14"] = 15,["15"] = 16,["16"] = 11,["17"] = 19,["18"] = 20,["19"] = 21,["20"] = 22,["22"] = 24,["23"] = 19,["24"] = 27,["25"] = 29,["26"] = 30,["27"] = 31,["28"] = 32,["29"] = 27,["30"] = 35,["31"] = 37,["32"] = 38,["33"] = 39,["35"] = 41,["36"] = 42,["37"] = 43,["39"] = 45,["40"] = 35,["41"] = 8,["42"] = 9});
local ____exports = {}
____exports.default = __TS__Class()
local FourCC = ____exports.default
FourCC.name = "FourCC"
function FourCC.prototype.____constructor(self)
end
function FourCC._id(self, a)
    local r = (">I4"):pack(a)
    self.ids1[a] = r
    self.ids2[r] = a
    return r
end
function FourCC.id2string(a)
    local str = ____exports.default.ids1[a]
    if str then
        return str
    end
    return ____exports.default:_id(a)
end
function FourCC.__id2(self, a)
    local r = (">I4"):unpack(a)
    self.ids2[a] = r
    self.ids1[r] = a
    return r
end
function FourCC.string2id(a)
    local str = ____exports.default.ids2[a]
    if str then
        return str
    end
    if #a ~= 4 then
        log.errorWithTraceBack("错误的id字符串。id字符串长度必须为4位。" .. tostring(a))
        return 0
    end
    return ____exports.default:__id2(a)
end
FourCC.ids1 = {}
FourCC.ids2 = {}
return ____exports
