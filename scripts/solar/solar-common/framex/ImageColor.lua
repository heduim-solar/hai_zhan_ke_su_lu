local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["14"] = 4,["16"] = 4,["17"] = 19,["18"] = 20,["19"] = 20,["20"] = 21,["21"] = 22,["22"] = 23,["23"] = 24,["24"] = 24,["25"] = 25,["26"] = 26,["27"] = 27,["28"] = 28,["29"] = 28,["30"] = 29,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 32,["35"] = 33,["36"] = 34,["37"] = 16,["38"] = 45,["39"] = 45,["40"] = 45,["42"] = 46,["43"] = 48,["44"] = 49,["45"] = 50,["46"] = 51,["47"] = 52,["48"] = 45,["49"] = 5,["50"] = 6,["51"] = 7,["52"] = 8});
local ____exports = {}
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____FrameNode = require("solar.solar-common.framex.FrameNode")
local FrameNode = ____FrameNode.default
____exports.default = __TS__Class()
local ImageColor = ____exports.default
ImageColor.name = "ImageColor"
__TS__ClassExtends(ImageColor, FrameNode)
function ImageColor.prototype.____constructor(self)
    FrameNode.prototype.____constructor(self)
    self.bgFrame = Frame:createBackDrop(self.handle)
    local ____self__sl_Frames_0 = self._sl_Frames
    ____self__sl_Frames_0[#____self__sl_Frames_0 + 1] = self.bgFrame
    self.bgFrame:setAllPoints(self.handle)
    self.bgFrame:setTexture(____exports.default.bgPath)
    self.rFrame = Frame:createBackDrop(self.handle)
    local ____self__sl_Frames_1 = self._sl_Frames
    ____self__sl_Frames_1[#____self__sl_Frames_1 + 1] = self.rFrame
    self.rFrame:setAllPoints(self.handle)
    self.rFrame:setTexture(____exports.default.rPath)
    self.gFrame = Frame:createBackDrop(self.handle)
    local ____self__sl_Frames_2 = self._sl_Frames
    ____self__sl_Frames_2[#____self__sl_Frames_2 + 1] = self.gFrame
    self.gFrame:setAllPoints(self.handle)
    self.gFrame:setTexture(____exports.default.gPath)
    self.bFrame = Frame:createBackDrop(self.handle)
    local ____self__sl_Frames_3 = self._sl_Frames
    ____self__sl_Frames_3[#____self__sl_Frames_3 + 1] = self.bFrame
    self.bFrame:setAllPoints(self.handle)
    self.bFrame:setTexture(____exports.default.bPath)
end
function ImageColor.prototype.setColor(self, r, g, b, a)
    if a == nil then
        a = 255
    end
    local ta = 255
    local aba = a / 255
    self.bgFrame:setAlpha(a * 0.9)
    self.rFrame:setAlpha(r * 0.7 * aba)
    self.gFrame:setAlpha(g * 0.7 * aba)
    self.bFrame:setAlpha(b * 0.7 * aba)
end
ImageColor.bgPath = "UI\\Widgets\\EscMenu\\Human\\slider-background.blp"
ImageColor.rPath = "ReplaceableTextures\\TeamColor\\TeamColor00.blp"
ImageColor.gPath = "ReplaceableTextures\\TeamColor\\TeamColor06.blp"
ImageColor.bPath = "ReplaceableTextures\\TeamColor\\TeamColor01.blp"
return ____exports
