local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 5,["10"] = 10,["11"] = 10,["12"] = 10,["14"] = 10,["15"] = 10,["17"] = 11,["18"] = 12,["19"] = 10,["20"] = 15,["21"] = 16,["22"] = 15,["23"] = 19});
local ____exports = {}
____exports.default = __TS__Class()
local Size = ____exports.default
Size.name = "Size"
function Size.prototype.____constructor(self, w, h)
    if w == nil then
        w = 0
    end
    if h == nil then
        h = 0
    end
    self.width = w
    self.height = h
end
function Size.prototype.equals(self, another)
    return math.abs(self.width - another.width) < 0.000001 and math.abs(self.height - another.height) < 0.000001
end
Size.ZERO = __TS__New(____exports.default, 0, 0)
return ____exports
