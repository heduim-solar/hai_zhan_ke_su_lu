local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 5,["9"] = 5,["10"] = 5,["12"] = 5,["13"] = 15,["14"] = 16,["15"] = 17,["16"] = 18,["17"] = 20,["18"] = 21,["19"] = 22,["20"] = 15,["21"] = 25,["22"] = 26,["23"] = 27,["25"] = 25});
local ____exports = {}
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
____exports.default = __TS__Class()
local DestructableUtil = ____exports.default
DestructableUtil.name = "DestructableUtil"
function DestructableUtil.prototype.____constructor(self)
end
function DestructableUtil.hasDestructableInRect(centerX, centerY, radius, destructableId)
    local r = RectUtil.GetRectFromCircle(centerX, centerY, radius)
    tempBoolean = false
    tempNumber = FourCC(destructableId)
    r:enumDestructables(nil, ____exports.default._HasDestructableInRectActionFunc)
    r:destroy()
    return tempBoolean
end
function DestructableUtil._HasDestructableInRectActionFunc()
    if GetDestructableTypeId(GetEnumDestructable()) == tempNumber then
        tempBoolean = true
    end
end
return ____exports
