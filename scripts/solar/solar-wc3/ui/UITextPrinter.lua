local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 9,["17"] = 9,["18"] = 9,["19"] = 18,["20"] = 18,["21"] = 18,["23"] = 11,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 15,["28"] = 16,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 20,["34"] = 21,["35"] = 22,["36"] = 18,["37"] = 26,["38"] = 27,["39"] = 28,["40"] = 29,["41"] = 30,["42"] = 31,["43"] = 32,["44"] = 33,["45"] = 33,["46"] = 33,["47"] = 34,["48"] = 35,["50"] = 37,["51"] = 38,["52"] = 39,["53"] = 40,["54"] = 41,["56"] = 43,["57"] = 33,["58"] = 33,["59"] = 26,["60"] = 48,["61"] = 49,["62"] = 50,["63"] = 51,["64"] = 48,["65"] = 55,["66"] = 56,["67"] = 57,["68"] = 55,["69"] = 61,["70"] = 62,["71"] = 62,["72"] = 62,["73"] = 62,["74"] = 63,["75"] = 61,["76"] = 67,["77"] = 68,["78"] = 67,["79"] = 72,["80"] = 73,["81"] = 72,["82"] = 77,["83"] = 78,["84"] = 79,["85"] = 77,["86"] = 82,["87"] = 83,["89"] = 84,["90"] = 89,["93"] = 95,["94"] = 96,["95"] = 97,["96"] = 98,["97"] = 99,["98"] = 100,["101"] = 82});
local ____exports = {}
local React = require("solar.solar-common.w3ts.tsx.index")
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____StringUtil = require("solar.solar-common.util.lang.StringUtil")
local StringUtil = ____StringUtil.default
____exports.default = __TS__Class()
local UITextPrinter = ____exports.default
UITextPrinter.name = "UITextPrinter"
function UITextPrinter.prototype.____constructor(self, text)
    if text == nil then
        text = ""
    end
    self._root = __TS__New(Frame)
    self._backdrop = __TS__New(Frame)
    self._text = __TS__New(Frame)
    self._textString = ""
    self._isPrint = false
    self._anchorPoint = FramePoint.center
    React.render(
        self:draw(),
        DzGetGameUI()
    )
    self:setText(text)
    self._root:setVisible(false)
    self._backdrop:setPoints(self._text.current, 0.005, 0.005)
end
function UITextPrinter.prototype.startPrint(self)
    local index = 0
    local displayString = ""
    self._text:setText(displayString)
    self._root:setVisible(true)
    self._isPrint = true
    local length = StringUtil:getLength(self._textString)
    BaseUtil.onTimer(
        0.03,
        function()
            if not self._isPrint then
                return false
            end
            index = index + 1
            if index <= length then
                displayString = displayString .. StringUtil:getCharAtIndex(self._textString, index)
                self._text:setText(displayString)
                return true
            end
            return false
        end
    )
end
function UITextPrinter.prototype.showText(self)
    self._root:setVisible(true)
    self._isPrint = false
    self._text:setText(self._textString)
end
function UITextPrinter.prototype.setText(self, text)
    self._textString = text
    self._text:setText(text)
end
function UITextPrinter.prototype.setTextWidth(self, width)
    local ____opt_4 = self._text
    local ____opt_2 = ____opt_4 and ____opt_4.props
    local ____opt_0 = ____opt_2 and ____opt_2.size
    local height = ____opt_0 and ____opt_0.height or 0
    self._text:setSize(width, height)
end
function UITextPrinter.prototype.setBackgroundVisible(self, flag)
    self._backdrop:setVisible(flag)
end
function UITextPrinter.prototype.setAnchorPoint(self, anchorPoint)
    self._anchorPoint = anchorPoint
end
function UITextPrinter.prototype.setPosition(self, x, y)
    self._text:clearPoints()
    self._text:setAbsPoint(self._anchorPoint, x, y)
end
function UITextPrinter.prototype.draw(self)
    return React:createElement(
        "div",
        {size = {width = 0.001, height = 0.001}, ref = self._root, visible = true},
        React:createElement("backdrop", {id = "backdrop", ref = self._backdrop, texture = "UI\\Widgets\\ToolTips\\Human\\human-tooltip-background.blp"}),
        React:createElement("text", {
            id = "text",
            position = {x = 0.4, y = 0.3},
            size = {width = 0.2, height = 0},
            ref = self._text,
            text = "",
            textAlignment = TEXTALIGN_LEFT,
            font = {fileName = "ZITI.TTF", height = 0.012, flags = 0}
        })
    )
end
return ____exports
