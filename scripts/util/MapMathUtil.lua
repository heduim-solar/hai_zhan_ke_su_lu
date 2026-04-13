local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 6,["20"] = 9,["21"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local MapMathUtil = ____exports.default
MapMathUtil.name = "MapMathUtil"
function MapMathUtil.prototype.____constructor(self)
end
MapMathUtil["获得当前等级需要的总资源"] = function(self, _____7B2C_4E00_7EA7_57FA_7840_8D44_6E90_9700_6C42, _____5F53_524D_7B49_7EA7)
    local count = 0
    do
        local i = 1
        while i <= _____5F53_524D_7B49_7EA7 do
            count = count + _____7B2C_4E00_7EA7_57FA_7840_8D44_6E90_9700_6C42 * i
            i = i + 1
        end
    end
    return count
end
return ____exports
