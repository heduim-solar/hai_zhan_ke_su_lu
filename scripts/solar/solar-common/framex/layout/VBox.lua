local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["15"] = 5,["16"] = 8,["17"] = 8,["18"] = 5,["19"] = 10,["20"] = 11,["21"] = 8,["22"] = 24,["24"] = 25,["25"] = 25,["26"] = 26,["27"] = 27,["28"] = 28,["29"] = 29,["30"] = 30,["31"] = 30,["32"] = 30,["33"] = 30,["34"] = 30,["35"] = 30,["36"] = 30,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["46"] = 25,["49"] = 5,["50"] = 24,["56"] = 16,["58"] = 19,["59"] = 20});
local ____exports = {}
local ____Pane = require("solar.solar-common.framex.layout.Pane")
local Pane = ____Pane.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
____exports.default = __TS__Class()
local VBox = ____exports.default
VBox.name = "VBox"
__TS__ClassExtends(VBox, Pane)
function VBox.prototype.____constructor(self, spacing, ...)
    local children = {...}
    Pane.prototype.____constructor(self)
    self.spacing = spacing
    self:attachChilds(children)
end
function VBox.prototype.layout(self)
    do
        local i = 0
        while i < #self.children do
            local child = self.children[i + 1]
            child.rootFrame:setParent(self.rootFrame.handle)
            child.rootFrame:clearPoints()
            if i == 0 then
                child.rootFrame:setPoint(
                    FramePoint.top,
                    self.rootFrame.handle,
                    FramePoint.top,
                    0,
                    0
                )
            else
                child.rootFrame:setPoint(
                    FramePoint.top,
                    self.children[i].rootFrame.handle,
                    FramePoint.bottomRight,
                    0,
                    self._spacing
                )
            end
            i = i + 1
        end
    end
    Pane.prototype.layout(self)
end
__TS__SetDescriptor(
    VBox.prototype,
    "spacing",
    {
        get = function(self)
            return self._spacing
        end,
        set = function(self, value)
            self._spacing = value
        end
    },
    true
)
return ____exports
