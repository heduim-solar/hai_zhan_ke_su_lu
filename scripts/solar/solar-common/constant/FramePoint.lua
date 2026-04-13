local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 1,["6"] = 1,["7"] = 1,["8"] = 1,["9"] = 1,["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 1,["14"] = 1,["15"] = 1,["16"] = 1,["17"] = 1,["18"] = 1,["19"] = 1,["20"] = 1,["21"] = 1,["22"] = 1,["23"] = 1,["24"] = 24});
local ____exports = {}
local FramePoint = FramePoint or ({})
FramePoint.topLeft = 0
FramePoint[FramePoint.topLeft] = "topLeft"
FramePoint.top = 1
FramePoint[FramePoint.top] = "top"
FramePoint.topRight = 2
FramePoint[FramePoint.topRight] = "topRight"
FramePoint.left = 3
FramePoint[FramePoint.left] = "left"
FramePoint.center = 4
FramePoint[FramePoint.center] = "center"
FramePoint.right = 5
FramePoint[FramePoint.right] = "right"
FramePoint.bottomLeft = 6
FramePoint[FramePoint.bottomLeft] = "bottomLeft"
FramePoint.bottom = 7
FramePoint[FramePoint.bottom] = "bottom"
FramePoint.bottomRight = 8
FramePoint[FramePoint.bottomRight] = "bottomRight"
____exports.default = FramePoint
return ____exports
