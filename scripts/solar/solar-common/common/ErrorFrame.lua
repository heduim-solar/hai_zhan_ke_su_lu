local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 9,["22"] = 9,["23"] = 9,["25"] = 35,["26"] = 23,["27"] = 24,["30"] = 27,["31"] = 30,["32"] = 31,["33"] = 30,["34"] = 23,["35"] = 40,["36"] = 41,["39"] = 44,["42"] = 47,["43"] = 48,["44"] = 49,["45"] = 50,["46"] = 51,["47"] = 52,["48"] = 53,["49"] = 40,["50"] = 56,["51"] = 58,["52"] = 59,["53"] = 60,["54"] = 62,["55"] = 63,["56"] = 64,["57"] = 65,["58"] = 66,["59"] = 67,["60"] = 67,["61"] = 67,["62"] = 67,["63"] = 67,["64"] = 68,["65"] = 68,["66"] = 68,["67"] = 68,["68"] = 68,["69"] = 70,["70"] = 71,["71"] = 74,["72"] = 75,["73"] = 76,["74"] = 77,["75"] = 78,["76"] = 79,["77"] = 79,["78"] = 79,["79"] = 79,["80"] = 79,["81"] = 79,["82"] = 79,["83"] = 80,["84"] = 81,["85"] = 82,["86"] = 83,["87"] = 84,["88"] = 80,["89"] = 56,["90"] = 10,["91"] = 15,["92"] = 17});
local ____exports = {}
local ____ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper")
local ErrorMsgHelper = ____ErrorMsgHelper.default
local ____SolarConfig = require("solar.solar-common.common.SolarConfig")
local SolarConfig = ____SolarConfig.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____Label = require("solar.solar-common.framex.control.Label")
local Label = ____Label.default
local ____TextAlign = require("solar.solar-common.constant.TextAlign")
local TextAlign = ____TextAlign.default
local ____Button = require("solar.solar-common.framex.control.Button")
local Button = ____Button.default
local ____ImageColor = require("solar.solar-common.framex.ImageColor")
local ImageColor = ____ImageColor.default
____exports.default = __TS__Class()
local ErrorFrame = ____exports.default
ErrorFrame.name = "ErrorFrame"
function ErrorFrame.prototype.____constructor(self)
end
function ErrorFrame.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    ErrorMsgHelper.onError = function(____, errorMsgHelper)
        ____exports.default:showErrorMsgHelper(errorMsgHelper)
    end
end
function ErrorFrame.showErrorMsgHelper(self, errorMsgHelper)
    if SolarConfig.useErrorFrame == false then
        return
    end
    if ____exports.default._sl_isShowing == true then
        return
    end
    ____exports.default._sl_isShowing = true
    ____exports.default:_sl_initFrame()
    local text = "|cffff0000【地图程序出现错误，您可截图此信息提交于作者，帮助作者修复该问题】"
    ____exports.default.text:setText((((text .. "|r|n\r\n") .. errorMsgHelper.cnMsg) .. "|r|n\r\n") .. errorMsgHelper.cnTraceback)
    ____exports.default.imageColor.visible = true
    ____exports.default.text.visible = true
    ____exports.default.closeBtn.visible = true
end
function ErrorFrame._sl_initFrame(self)
    local imageColor = __TS__New(ImageColor)
    imageColor:setColor(80, 80, 80, 255)
    ____exports.default.imageColor = imageColor
    local text = __TS__New(Label)
    text:setBackgroundImage(____exports.default.config.backgroundImage)
    text:getTextFrame():setTextAlignment(TextAlign.topLeft)
    text:getTextFrame():clearPoints()
    text:getTextFrame():setSize(____exports.default.config.width, -1)
    imageColor.rootFrame:setPoints(
        text:getTextFrame().handle,
        0.01,
        0.01
    )
    text:getRootFrame():setPoints(
        text:getTextFrame().handle,
        0.01,
        0.01
    )
    ____exports.default.text = text
    ____exports.default.text:getTextFrame():setAbsPoint(FramePoint.topRight, 0.55, 0.5)
    local closeBtn = __TS__New(Button)
    ____exports.default.closeBtn = closeBtn
    closeBtn:setSize(0.04, 0.04)
    closeBtn:setBackgroundImage("UI\\Widgets\\BattleNet\\chaticons\\bnet-squelch.blp")
    closeBtn:getLampEffectFrame()
    closeBtn.rootFrame:setPoint(
        FramePoint.center,
        text.rootFrame.handle,
        FramePoint.topRight,
        0,
        0
    )
    closeBtn:setOnClick(function()
        text.visible = false
        ____exports.default.closeBtn.visible = false
        ____exports.default.imageColor.visible = false
        ____exports.default._sl_isShowing = false
    end)
end
ErrorFrame.config = {width = 0.4, height = 0.35, backgroundImage = "UI\\Widgets\\EscMenu\\Undead\\undead-options-menu-background.blp"}
ErrorFrame.is_init = false
ErrorFrame._sl_isShowing = false
return ____exports
