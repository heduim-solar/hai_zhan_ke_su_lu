local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 24,["16"] = 24,["17"] = 24,["19"] = 24,["20"] = 38,["21"] = 41,["22"] = 42,["24"] = 43,["25"] = 43,["26"] = 44,["27"] = 45,["28"] = 46,["29"] = 47,["30"] = 48,["31"] = 51,["32"] = 52,["33"] = 53,["34"] = 53,["35"] = 53,["36"] = 53,["37"] = 53,["38"] = 53,["39"] = 53,["40"] = 54,["41"] = 56,["42"] = 57,["43"] = 58,["44"] = 59,["45"] = 61,["46"] = 62,["47"] = 63,["48"] = 64,["49"] = 64,["50"] = 65,["51"] = 66,["52"] = 67,["53"] = 64,["54"] = 64,["55"] = 64,["56"] = 70,["57"] = 71,["58"] = 71,["59"] = 72,["60"] = 71,["61"] = 71,["62"] = 71,["63"] = 43,["66"] = 76,["67"] = 77,["68"] = 77,["69"] = 78,["70"] = 79,["71"] = 80,["72"] = 81,["73"] = 82,["74"] = 83,["75"] = 77,["76"] = 77,["77"] = 77,["79"] = 38,["80"] = 25,["81"] = 26,["82"] = 27,["83"] = 28});
local ____exports = {}
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____TextAlign = require("solar.solar-common.constant.TextAlign")
local TextAlign = ____TextAlign.default
local ____AsyncUtil = require("solar.solar-common.util.net.AsyncUtil")
local AsyncUtil = ____AsyncUtil.default
____exports.default = __TS__Class()
local IconChooserUtil = ____exports.default
IconChooserUtil.name = "IconChooserUtil"
function IconChooserUtil.prototype.____constructor(self)
end
function IconChooserUtil.show(self, playerId, iconOptions, onClickCallBack, title)
    local startX = (0.8 - (____exports.default.iconWidth * #iconOptions + ____exports.default.iconGap * (#iconOptions - 1))) / 2
    local rootFrame = __TS__New(Frame, "FRAME")
    do
        local i = 0
        while i < #iconOptions do
            local iconOption = iconOptions[i + 1]
            local backDropFrame = Frame:createBackDrop(rootFrame.current)
            backDropFrame:setTexture(iconOption.icon)
            backDropFrame:setSize(____exports.default.iconWidth, ____exports.default.iconHeight)
            backDropFrame:setAbsPoint(FramePoint.left, startX + (____exports.default.iconWidth + 0.04) * i, ____exports.default.centerY)
            local nameFrame = Frame:createTEXT(backDropFrame.current)
            nameFrame:setText(iconOption.name)
            nameFrame:setPoint(
                FramePoint.top,
                backDropFrame.current,
                FramePoint.top,
                0,
                -0.01
            )
            nameFrame:setTextAlignment(TextAlign.top)
            local infoFrame = Frame:createTEXT(backDropFrame.current)
            infoFrame:setText(iconOption.info)
            infoFrame:setAllPoints(backDropFrame.current)
            infoFrame:setTextAlignment(TextAlign.center)
            local btn = Frame:createGLUEBUTTON(backDropFrame.current)
            btn:setAllPoints(backDropFrame.current)
            local index = i
            btn:setOnClick(
                function()
                    rootFrame:setVisible(false)
                    DzDestroyFrame(rootFrame.current)
                    onClickCallBack(nil, index, iconOption)
                end,
                true
            )
            backDropFrame:setVisible(false)
            AsyncUtil:run(
                function()
                    backDropFrame:setVisible(true)
                end,
                Player(playerId)
            )
            i = i + 1
        end
    end
    if title then
        AsyncUtil:run(
            function()
                local titleFrame = Frame:createTEXT(rootFrame.current)
                titleFrame:setWidth(0.3)
                titleFrame:setText(title)
                titleFrame:setFont(0.026)
                titleFrame:setAbsPoint(FramePoint.top, 0.4, ____exports.default.centerY + ____exports.default.iconHeight / 2 + ____exports.default.iconGap)
                titleFrame:setTextAlignment(TextAlign.top)
            end,
            Player(playerId)
        )
    end
end
IconChooserUtil.iconWidth = 0.12
IconChooserUtil.iconHeight = 0.24
IconChooserUtil.iconGap = 0.04
IconChooserUtil.centerY = 0.35
return ____exports
