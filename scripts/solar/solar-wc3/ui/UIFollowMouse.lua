local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 8,["17"] = 35,["18"] = 35,["19"] = 35,["20"] = 35,["21"] = 36,["22"] = 36,["23"] = 37,["24"] = 38,["25"] = 39,["26"] = 40,["27"] = 36,["28"] = 36,["29"] = 36,["30"] = 34,["31"] = 11,["32"] = 12,["33"] = 13,["35"] = 15,["36"] = 11,["37"] = 18,["38"] = 19,["39"] = 18,["40"] = 22,["41"] = 23,["42"] = 22,["43"] = 26,["44"] = 27,["45"] = 26,["46"] = 30,["47"] = 31,["48"] = 30,["49"] = 44,["50"] = 45,["52"] = 46,["54"] = 49,["55"] = 50,["56"] = 51,["57"] = 52,["58"] = 53,["61"] = 44,["62"] = 9});
local ____exports = {}
local React = require("solar.solar-common.w3ts.tsx.index")
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
____exports.default = __TS__Class()
local UIFollowMouse = ____exports.default
UIFollowMouse.name = "UIFollowMouse"
function UIFollowMouse.prototype.____constructor(self)
    self._backdrop = __TS__New(Frame)
    React.render(
        self:draw(),
        DzGetGameUI()
    )
    InputUtil:onMouseMoveEvent(
        function()
            local x = RAbsBJ(0.8 * (I2R(DzGetMouseXRelative()) / I2R(DzGetClientWidth())))
            local y = RAbsBJ(0.6 - 0.6 * (I2R(DzGetMouseYRelative()) / I2R(DzGetClientHeight())))
            self._backdrop:clearPoints()
            self._backdrop:setAbsPoint(4, x, y)
        end,
        "UIFollowMouse"
    )
end
function UIFollowMouse.getInstance(self)
    if not ____exports.default._instance then
        ____exports.default._instance = __TS__New(____exports.default)
    end
    return ____exports.default._instance
end
function UIFollowMouse.prototype.getBackdrop(self)
    return self._backdrop
end
function UIFollowMouse.prototype.setTexture(self, texture)
    self._backdrop:setTexture(texture)
end
function UIFollowMouse.prototype.setVisible(self, flag)
    self._backdrop:setVisible(flag)
end
function UIFollowMouse.prototype.removeMouseMoveEvent(self)
    InputUtil:removeMouseMoveEvent("UIFollowMouse")
end
function UIFollowMouse.prototype.draw(self)
    return React:createElement(
        "div",
        {size = {width = 0.001, height = 0.001}, visible = true},
        React:createElement("backdrop", {
            position = {x = 0, y = 0},
            size = {width = 0.03, height = 0.04},
            visible = false,
            texture = "ReplaceableTextures\\CommandButtons\\BTNDispelMagic.blp",
            ref = self._backdrop
        })
    )
end
UIFollowMouse._instance = nil
return ____exports
