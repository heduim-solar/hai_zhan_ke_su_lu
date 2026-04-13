local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 5,["15"] = 10,["16"] = 5,["17"] = 6,["18"] = 7,["19"] = 12,["20"] = 13,["21"] = 14,["23"] = 16,["24"] = 17,["26"] = 10,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 24,["32"] = 25,["33"] = 25,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 29,["39"] = 31,["40"] = 32,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 33,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 35,["49"] = 25,["52"] = 5,["53"] = 21});
local ____exports = {}
local ____Pane = require("solar.solar-common.framex.layout.Pane")
local Pane = ____Pane.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
____exports.default = __TS__Class()
local FlowPane = ____exports.default
FlowPane.name = "FlowPane"
__TS__ClassExtends(FlowPane, Pane)
function FlowPane.prototype.____constructor(self, hgap, vgap)
    Pane.prototype.____constructor(self)
    self.hgap = 0
    self.vgap = 0
    self:setSize(0.5, 0.3)
    if hgap then
        self.hgap = hgap
    end
    if vgap then
        self.vgap = vgap
    end
end
function FlowPane.prototype.layout(self)
    local maxWidth = self.rootFrame.width
    local startX = 0
    local startY = 0
    do
        local i = 0
        while i < #self.children do
            local child = self.children[i + 1]
            if startX + child.rootFrame.width > maxWidth then
                startY = startY + child.rootFrame.height + self.vgap
                startX = 0
            end
            child.rootFrame:setParent(self.rootFrame.handle)
            child.rootFrame:clearPoints()
            child.rootFrame:setPoint(
                FramePoint.topLeft,
                self.rootFrame.handle,
                FramePoint.topLeft,
                startX,
                -startY
            )
            startX = startX + child.rootFrame.width + self.hgap
            i = i + 1
        end
    end
    Pane.prototype.layout(self)
end
return ____exports
