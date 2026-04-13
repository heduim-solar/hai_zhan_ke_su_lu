local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 11,["12"] = 11,["13"] = 11,["15"] = 11,["16"] = 11,["18"] = 12,["19"] = 11,["20"] = 19,["21"] = 20,["22"] = 21,["23"] = 22,["26"] = 25,["27"] = 19});
local ____exports = {}
____exports.default = __TS__Class()
local BoolUtil = ____exports.default
BoolUtil.name = "BoolUtil"
function BoolUtil.prototype.____constructor(self)
end
function BoolUtil.isUnitEnemy(unit, player)
    if unit == nil then
        unit = GetTriggerUnit()
    end
    if player == nil then
        player = Player(0)
    end
    return IsUnitEnemy(unit, player)
end
function BoolUtil.isValInArray(sz, bl)
    for ____, iterator in ipairs(sz) do
        if iterator == bl then
            return true
        end
    end
    return false
end
return ____exports
