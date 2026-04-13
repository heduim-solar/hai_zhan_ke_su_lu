local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 9,["17"] = 9,["18"] = 9,["19"] = 18,["20"] = 18,["21"] = 18,["23"] = 11,["24"] = 12,["25"] = 13,["26"] = 14,["27"] = 15,["28"] = 19,["29"] = 19,["30"] = 19,["31"] = 19,["32"] = 20,["33"] = 21,["34"] = 22,["35"] = 18,["36"] = 26,["37"] = 27,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 31,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 33,["46"] = 34,["47"] = 35,["48"] = 36,["49"] = 37,["51"] = 39,["52"] = 40,["54"] = 42,["56"] = 44,["57"] = 32,["58"] = 32,["59"] = 26,["60"] = 49,["61"] = 50,["62"] = 51,["63"] = 49,["64"] = 55,["65"] = 56,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 57,["70"] = 55,["71"] = 61,["72"] = 62,["73"] = 62,["74"] = 62,["75"] = 62,["76"] = 61,["77"] = 66,["78"] = 67,["79"] = 66,["80"] = 71,["81"] = 72,["82"] = 71,["83"] = 76,["84"] = 77,["85"] = 76,["86"] = 81,["87"] = 82,["88"] = 83,["89"] = 81,["90"] = 86,["91"] = 87,["93"] = 88,["94"] = 93,["97"] = 99,["98"] = 100,["99"] = 101,["100"] = 102,["101"] = 103,["102"] = 104,["105"] = 86});
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
local UIMarquee = ____exports.default
UIMarquee.name = "UIMarquee"
function UIMarquee.prototype.____constructor(self, text)
    if text == nil then
        text = ""
    end
    self._root = __TS__New(Frame)
    self._backdrop = __TS__New(Frame)
    self._text = __TS__New(Frame)
    self._textString = ""
    self._anchorPoint = FramePoint.center
    React.render(
        self:draw(),
        DzGetGameUI()
    )
    self:setText(text)
    self._root:setVisible(false)
    self._backdrop:setPoints(self._text.current, 0.005, 0.005)
end
function UIMarquee.prototype.startPrint(self)
    local index = 0
    local displayString = ""
    self._text:setText(displayString)
    self._root:setVisible(true)
    local length = StringUtil:getLength(self._textString)
    BaseUtil.onTimer(
        0.2,
        function()
            index = index + 1
            if index <= length then
                if index <= 24 then
                    displayString = displayString .. StringUtil:getCharAtIndex(self._textString, index)
                    self._text:setText(displayString)
                else
                    displayString = StringUtil:subString(self._textString, index - 23, index)
                    self._text:setText(displayString)
                end
                return true
            end
            return false
        end
    )
end
function UIMarquee.prototype.setText(self, text)
    self._textString = text
    self._text:setText(text)
end
function UIMarquee.prototype.setTextWidth(self, width)
    local ____opt_4 = self._text
    local ____opt_2 = ____opt_4 and ____opt_4.props
    local ____opt_0 = ____opt_2 and ____opt_2.size
    local height = ____opt_0 and ____opt_0.height or 0
    self._text:setSize(width, height)
end
function UIMarquee.prototype.getTextWidth(self)
    local ____opt_10 = self._text
    local ____opt_8 = ____opt_10 and ____opt_10.props
    local ____opt_6 = ____opt_8 and ____opt_8.size
    return ____opt_6 and ____opt_6.width or 0.2
end
function UIMarquee.prototype.getMaxChars(self)
    return R2I(120 * self:getTextWidth())
end
function UIMarquee.prototype.setBackgroundVisible(self, flag)
    self._backdrop:setVisible(flag)
end
function UIMarquee.prototype.setAnchorPoint(self, anchorPoint)
    self._anchorPoint = anchorPoint
end
function UIMarquee.prototype.setPosition(self, x, y)
    self._text:clearPoints()
    self._text:setAbsPoint(self._anchorPoint, x, y)
end
function UIMarquee.prototype.draw(self)
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
            textAlignment = TEXTALIGN_RIGHT,
            font = {fileName = "ZITI.TTF", height = 0.012, flags = 0}
        })
    )
end
return ____exports
