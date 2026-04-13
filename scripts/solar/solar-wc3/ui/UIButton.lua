local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 7,["13"] = 7,["14"] = 7,["15"] = 78,["16"] = 78,["17"] = 78,["19"] = 9,["20"] = 10,["21"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 79,["27"] = 79,["28"] = 79,["29"] = 79,["30"] = 80,["31"] = 81,["32"] = 82,["33"] = 81,["34"] = 84,["35"] = 85,["36"] = 84,["37"] = 78,["38"] = 17,["39"] = 18,["40"] = 17,["41"] = 21,["42"] = 22,["43"] = 21,["44"] = 25,["45"] = 26,["46"] = 25,["47"] = 29,["48"] = 30,["49"] = 29,["50"] = 33,["51"] = 34,["52"] = 33,["53"] = 37,["54"] = 38,["55"] = 39,["56"] = 37,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 45,["61"] = 42,["62"] = 48,["63"] = 49,["64"] = 48,["65"] = 52,["66"] = 53,["67"] = 53,["68"] = 53,["69"] = 53,["70"] = 54,["71"] = 54,["72"] = 54,["73"] = 54,["74"] = 55,["75"] = 52,["76"] = 58,["77"] = 59,["78"] = 58,["79"] = 62,["80"] = 63,["81"] = 63,["82"] = 63,["83"] = 62,["84"] = 66,["85"] = 67,["86"] = 66,["87"] = 70,["88"] = 71,["89"] = 70,["90"] = 74,["91"] = 75,["92"] = 74,["93"] = 89,["94"] = 90,["95"] = 91,["97"] = 89,["98"] = 95,["99"] = 96,["101"] = 97,["106"] = 102,["107"] = 103,["108"] = 104,["109"] = 105,["113"] = 109,["114"] = 110,["115"] = 111,["116"] = 112,["122"] = 117,["123"] = 118,["128"] = 95});
local ____exports = {}
local React = require("solar.solar-common.w3ts.tsx.index")
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
____exports.default = __TS__Class()
local UIButton = ____exports.default
UIButton.name = "UIButton"
function UIButton.prototype.____constructor(self, texture)
    if texture == nil then
        texture = ""
    end
    self._root = __TS__New(Frame)
    self._backdrop = __TS__New(Frame)
    self._text = __TS__New(Frame)
    self._button = __TS__New(Frame)
    self._callback = nil
    self._anchorPoint = FramePoint.center
    self._zoomScale = 0.1
    React.render(
        self:draw(),
        DzGetGameUI()
    )
    self:setTexture(texture)
    self._button:addOnMouseDown(function()
        self:setScale(1 + self._zoomScale)
    end)
    self._button:addOnMouseUp(function()
        self:setScale(1)
    end)
end
function UIButton.prototype.setVisible(self, flag)
    self._root:setVisible(flag)
end
function UIButton.prototype.setTexture(self, texture)
    self._backdrop:setTexture(texture)
end
function UIButton.prototype.getTexture(self)
    return self._backdrop.props.texture
end
function UIButton.prototype.setText(self, text)
    self._text:setText(text)
end
function UIButton.prototype.setAnchorPoint(self, anchorPoint)
    self._anchorPoint = anchorPoint
end
function UIButton.prototype.setPosition(self, x, y)
    self._backdrop:clearPoints()
    self._backdrop:setAbsPoint(self._anchorPoint, x, y)
end
function UIButton.prototype.getPosition(self)
    local x = self._backdrop.props.position.x
    local y = self._backdrop.props.position.y
    return {x = x, y = y}
end
function UIButton.prototype.setContentSize(self, width, height)
    self._backdrop:setSize(width, height)
end
function UIButton.prototype.getContentSize(self)
    local ____opt_4 = self._backdrop
    local ____opt_2 = ____opt_4 and ____opt_4.props
    local ____opt_0 = ____opt_2 and ____opt_2.size
    local width = ____opt_0 and ____opt_0.width or 0
    local ____opt_10 = self._backdrop
    local ____opt_8 = ____opt_10 and ____opt_10.props
    local ____opt_6 = ____opt_8 and ____opt_8.size
    local height = ____opt_6 and ____opt_6.height or 0
    return {width = width, height = height}
end
function UIButton.prototype.setScale(self, scale)
    self._backdrop:setScale(scale)
end
function UIButton.prototype.getScale(self)
    local ____opt_14 = self._backdrop
    local ____opt_12 = ____opt_14 and ____opt_14.props
    return ____opt_12 and ____opt_12.scale or 1
end
function UIButton.prototype.setZoomScale(self, scale)
    self._zoomScale = scale
end
function UIButton.prototype.getZoomScale(self)
    return self._zoomScale
end
function UIButton.prototype.setCallback(self, callback)
    self._callback = callback
end
function UIButton.prototype.onClick(self)
    if self._callback then
        self:_callback()
    end
end
function UIButton.prototype.draw(self)
    return React:createElement(
        "div",
        {size = {width = 0.001, height = 0.001}, ref = self._root, visible = true},
        React:createElement(
            "backdrop",
            {
                id = "backdrop",
                position = {x = 0.4, y = 0.3},
                size = {width = 0.03, height = 0.04},
                ref = self._backdrop,
                texture = ""
            },
            React:createElement("text", {
                id = "text",
                ref = self._text,
                text = "",
                textAlignment = TEXTALIGN_CENTER,
                font = {fileName = "ZITI.TTF", height = 0.012, flags = 0}
            }),
            React:createElement(
                "button",
                {
                    id = "button",
                    ref = self._button,
                    onClick = function() return self:onClick() end
                }
            )
        )
    )
end
return ____exports
