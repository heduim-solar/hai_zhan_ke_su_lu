local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 7,["16"] = 4,["17"] = 9,["18"] = 11,["19"] = 12,["21"] = 14,["22"] = 15,["24"] = 7,["25"] = 19,["26"] = 4,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 24,["31"] = 25,["32"] = 19,["33"] = 28,["34"] = 29,["35"] = 30,["36"] = 28,["37"] = 33,["38"] = 34,["39"] = 35,["40"] = 33,["41"] = 38,["42"] = 39,["43"] = 40,["44"] = 38,["45"] = 44,["46"] = 45,["47"] = 45,["48"] = 46,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 44,["53"] = 51,["54"] = 52,["55"] = 51});
local ____exports = {}
local ____FrameControl = require("solar.solar-common.framex.control.FrameControl")
local FrameControl = ____FrameControl.default
local ____TextAlign = require("solar.solar-common.constant.TextAlign")
local TextAlign = ____TextAlign.default
____exports.default = __TS__Class()
local Button = ____exports.default
Button.name = "Button"
__TS__ClassExtends(Button, FrameControl)
function Button.prototype.____constructor(self, text, onClick)
    FrameControl.prototype.____constructor(self)
    self:init()
    if text then
        self:setText(text)
    end
    if onClick then
        self:setOnClick(onClick)
    end
end
function Button.prototype.init(self)
    FrameControl.prototype.init(self)
    self:getBackgroundImageFrame().visible = false
    self:getImageFrame().visible = false
    self:getTextFrame():setTextAlignment(TextAlign.center)
    self:getTextFrame().visible = false
    self:getButtonFrame(true, true)
end
function Button.prototype.setBackgroundImage(self, imagePath)
    self:getBackgroundImageFrame():setTexture(imagePath)
    self:getBackgroundImageFrame().visible = true
end
function Button.prototype.setImage(self, imagePath)
    self:getImageFrame():setTexture(imagePath)
    self:getImageFrame().visible = true
end
function Button.prototype.setText(self, text)
    self:getTextFrame():setText(text)
    self:getTextFrame().visible = true
end
function Button.prototype.setOnClick(self, callback)
    self:getButtonFrame():setOnClick(
        function()
            callback(nil)
        end,
        false
    )
end
function Button.prototype.setDisable(self, disable)
    self:getDisableFrame().visible = disable
end
return ____exports
