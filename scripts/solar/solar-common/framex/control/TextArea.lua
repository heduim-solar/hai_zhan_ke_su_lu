local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 4,["17"] = 8,["18"] = 10,["19"] = 11,["21"] = 13,["22"] = 14,["24"] = 6,["25"] = 18,["26"] = 4,["27"] = 20,["28"] = 21,["29"] = 22,["30"] = 18,["31"] = 25,["32"] = 26,["33"] = 27,["34"] = 25,["35"] = 30,["36"] = 31,["37"] = 32,["38"] = 30,["39"] = 36,["40"] = 37,["41"] = 37,["42"] = 38,["43"] = 37,["44"] = 37,["45"] = 37,["46"] = 36,["47"] = 43,["48"] = 44,["49"] = 43});
local ____exports = {}
local ____FrameControl = require("solar.solar-common.framex.control.FrameControl")
local FrameControl = ____FrameControl.default
local ____TextAlign = require("solar.solar-common.constant.TextAlign")
local TextAlign = ____TextAlign.default
____exports.default = __TS__Class()
local TextArea = ____exports.default
TextArea.name = "TextArea"
__TS__ClassExtends(TextArea, FrameControl)
function TextArea.prototype.____constructor(self, text, onClick)
    FrameControl.prototype.____constructor(self)
    self:init()
    if text then
        self:setText(text)
    end
    if onClick then
        self:setOnClick(onClick)
    end
end
function TextArea.prototype.init(self)
    FrameControl.prototype.init(self)
    self:getBackgroundImageFrame().visible = false
    self:getTextAreaFrame():setTextAlignment(TextAlign.topLeft)
    self:getTextAreaFrame().visible = false
end
function TextArea.prototype.setBackgroundImage(self, imagePath)
    self:getBackgroundImageFrame():setTexture(imagePath)
    self:getBackgroundImageFrame().visible = true
end
function TextArea.prototype.setText(self, text)
    self:getTextAreaFrame():setText(text)
    self:getTextAreaFrame().visible = true
end
function TextArea.prototype.setOnClick(self, callback)
    self:getButtonFrame():setOnClick(
        function()
            callback(nil)
        end,
        false
    )
end
function TextArea.prototype.setDisable(self, disable)
    self:getDisableFrame().visible = disable
end
return ____exports
