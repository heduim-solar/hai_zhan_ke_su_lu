local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["15"] = 5,["16"] = 12,["17"] = 5,["18"] = 14,["19"] = 15,["21"] = 12,["22"] = 19,["23"] = 21,["24"] = 22,["25"] = 23,["26"] = 23,["27"] = 23,["28"] = 23,["29"] = 23,["30"] = 23,["31"] = 23,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["43"] = 31,["44"] = 32,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 33,["49"] = 33,["50"] = 33,["51"] = 33,["53"] = 36,["54"] = 37,["55"] = 38,["56"] = 38,["57"] = 38,["58"] = 38,["59"] = 38,["60"] = 38,["61"] = 38,["63"] = 42,["64"] = 43,["65"] = 44,["66"] = 45,["67"] = 45,["68"] = 45,["69"] = 45,["70"] = 45,["71"] = 45,["72"] = 45,["74"] = 47,["75"] = 47,["76"] = 47,["77"] = 47,["78"] = 47,["79"] = 47,["80"] = 47,["82"] = 49,["83"] = 50,["84"] = 50,["85"] = 50,["86"] = 50,["87"] = 50,["88"] = 50,["89"] = 50,["91"] = 52,["92"] = 52,["93"] = 52,["94"] = 52,["95"] = 52,["96"] = 52,["97"] = 52,["100"] = 5,["101"] = 19,["107"] = 60,["109"] = 63,["110"] = 64,["111"] = 65,["112"] = 66,["122"] = 70,["124"] = 73,["125"] = 74,["126"] = 75,["127"] = 76,["137"] = 80,["139"] = 83,["140"] = 84,["141"] = 85,["142"] = 86,["152"] = 90,["154"] = 93,["155"] = 94,["156"] = 95,["157"] = 96,["167"] = 100,["169"] = 103,["170"] = 104,["171"] = 105,["172"] = 106});
local ____exports = {}
local ____Pane = require("solar.solar-common.framex.layout.Pane")
local Pane = ____Pane.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
____exports.default = __TS__Class()
local BorderPane = ____exports.default
BorderPane.name = "BorderPane"
__TS__ClassExtends(BorderPane, Pane)
function BorderPane.prototype.____constructor(self, center)
    Pane.prototype.____constructor(self)
    if center then
        self.center = center
    end
end
function BorderPane.prototype.layout(self)
    if self._top ~= nil then
        self._top.rootFrame:clearPoints()
        self._top.rootFrame:setPoint(
            FramePoint.top,
            self.rootFrame.handle,
            FramePoint.top,
            0,
            0
        )
    end
    if self._bottom ~= nil then
        self._bottom.rootFrame:clearPoints()
        self._bottom.rootFrame:setPoint(
            FramePoint.bottom,
            self.rootFrame.handle,
            FramePoint.bottom,
            0,
            0
        )
    end
    if self._left ~= nil then
        self._left.rootFrame:clearPoints()
        self._left.rootFrame:setPoint(
            FramePoint.left,
            self.rootFrame.handle,
            FramePoint.left,
            0,
            0
        )
    end
    if self._right ~= nil then
        self._right.rootFrame:clearPoints()
        self._right.rootFrame:setPoint(
            FramePoint.right,
            self.rootFrame.handle,
            FramePoint.right,
            0,
            0
        )
    end
    if self._center ~= nil then
        self._center.rootFrame:clearPoints()
        if self._left == nil then
            self._center.rootFrame:setPoint(
                FramePoint.topLeft,
                self.rootFrame.handle,
                FramePoint.topLeft,
                0,
                0
            )
        else
            self._center.rootFrame:setPoint(
                FramePoint.topLeft,
                self._left.rootFrame.handle,
                FramePoint.topRight,
                0,
                0
            )
        end
        if self._right == nil then
            self._center.rootFrame:setPoint(
                FramePoint.bottomRight,
                self.rootFrame.handle,
                FramePoint.bottomRight,
                0,
                0
            )
        else
            self._center.rootFrame:setPoint(
                FramePoint.bottomRight,
                self._right.rootFrame.handle,
                FramePoint.bottomLeft,
                0,
                0
            )
        end
    end
    Pane.prototype.layout(self)
end
__TS__SetDescriptor(
    BorderPane.prototype,
    "center",
    {
        get = function(self)
            return self._center
        end,
        set = function(self, value)
            self:detachChild(self._center)
            self._center = value
            self:attachChild(value)
        end
    },
    true
)
__TS__SetDescriptor(
    BorderPane.prototype,
    "top",
    {
        get = function(self)
            return self._top
        end,
        set = function(self, value)
            self:detachChild(self._top)
            self._top = value
            self:attachChild(value)
        end
    },
    true
)
__TS__SetDescriptor(
    BorderPane.prototype,
    "right",
    {
        get = function(self)
            return self._right
        end,
        set = function(self, value)
            self:detachChild(self._right)
            self._right = value
            self:attachChild(value)
        end
    },
    true
)
__TS__SetDescriptor(
    BorderPane.prototype,
    "bottom",
    {
        get = function(self)
            return self._bottom
        end,
        set = function(self, value)
            self:detachChild(self._bottom)
            self._bottom = value
            self:attachChild(value)
        end
    },
    true
)
__TS__SetDescriptor(
    BorderPane.prototype,
    "left",
    {
        get = function(self)
            return self._left
        end,
        set = function(self, value)
            self:detachChild(self._left)
            self._left = value
            self:attachChild(value)
        end
    },
    true
)
return ____exports
