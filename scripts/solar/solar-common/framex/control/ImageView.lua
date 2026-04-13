local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["12"] = 3,["14"] = 3,["15"] = 8,["16"] = 6,["17"] = 11,["18"] = 3,["19"] = 13,["20"] = 14,["21"] = 11,["22"] = 17,["23"] = 18,["24"] = 19,["25"] = 17,["26"] = 22,["27"] = 23,["28"] = 24,["29"] = 22,["30"] = 28,["31"] = 29,["32"] = 28});
local ____exports = {}
local ____FrameControl = require("solar.solar-common.framex.control.FrameControl")
local FrameControl = ____FrameControl.default
____exports.default = __TS__Class()
local ImageView = ____exports.default
ImageView.name = "ImageView"
__TS__ClassExtends(ImageView, FrameControl)
function ImageView.prototype.____constructor(self)
    FrameControl.prototype.____constructor(self)
    self:init()
end
function ImageView.prototype.init(self)
    FrameControl.prototype.init(self)
    self:getBackgroundImageFrame().visible = false
    self:getImageFrame().visible = false
end
function ImageView.prototype.setBackgroundImage(self, imagePath)
    self:getBackgroundImageFrame():setTexture(imagePath)
    self:getBackgroundImageFrame().visible = true
end
function ImageView.prototype.setImage(self, imagePath)
    self:getImageFrame():setTexture(imagePath)
    self:getImageFrame().visible = true
end
function ImageView.prototype.setDisable(self, disable)
    self:getDisableFrame().visible = disable
end
return ____exports
