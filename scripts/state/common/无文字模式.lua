local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 13,["15"] = 13,["16"] = 13,["18"] = 18,["19"] = 17,["20"] = 22,["21"] = 23,["22"] = 23,["23"] = 26,["24"] = 26,["25"] = 29,["26"] = 29,["27"] = 32,["28"] = 32,["29"] = 35,["30"] = 35,["31"] = 38,["32"] = 38,["33"] = 41,["34"] = 41,["35"] = 44,["36"] = 44,["37"] = 47,["38"] = 47,["39"] = 50,["40"] = 50,["41"] = 53,["42"] = 54,["43"] = 55,["44"] = 53,["45"] = 59,["46"] = 60,["47"] = 61,["48"] = 62,["49"] = 62,["50"] = 64,["51"] = 64,["52"] = 66,["53"] = 67,["54"] = 66,["55"] = 72,["56"] = 73,["57"] = 74,["58"] = 75,["59"] = 76,["60"] = 77,["61"] = 78,["62"] = 79,["63"] = 80,["64"] = 81,["65"] = 82,["66"] = 22,["67"] = 85,["68"] = 86,["69"] = 87,["70"] = 88,["71"] = 85,["72"] = 15});
local ____exports = {}
local ____ActorFrameUtil = require("solar.solar-common.actor.util.ActorFrameUtil")
local ActorFrameUtil = ____ActorFrameUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____NativeFrameUtil = require("solar.solar-common.util.frame.NativeFrameUtil")
local NativeFrameUtil = ____NativeFrameUtil.default
____exports.default = __TS__Class()
local _____65E0_6587_5B57_6A21_5F0F = ____exports.default
_____65E0_6587_5B57_6A21_5F0F.name = "无文字模式"
function _____65E0_6587_5B57_6A21_5F0F.prototype.____constructor(self)
    ____exports.default:init()
end
function _____65E0_6587_5B57_6A21_5F0F.init(self)
    _G.DisplayTextToPlayer = function()
    end
    _G.DisplayTimedTextToPlayer = function()
    end
    _G.DisplayTimedTextFromPlayer = function()
    end
    _G.SetTextTagText = function()
    end
    _G.MultiboardSetItemValue = function()
    end
    _G.MultiboardDisplay = function()
    end
    _G.DialogSetMessage = function()
    end
    _G.TimerDialogSetTitle = function()
    end
    _G.TimerDialogDisplay = function()
    end
    _G.DzFrameSetText = function()
    end
    _G.DialogAddButton = function(whichDialog, buttonText, hotkey)
        local cj = require("jass.common")
        return cj.DialogAddButton(whichDialog, "", hotkey)
    end
    local tooltip = DzFrameGetTooltip()
    DzFrameClearAllPoints(tooltip)
    DzFrameSetAbsolutePoint(tooltip, FramePoint.bottomLeft, 0.81, 0)
    ActorFrameUtil.showTooltip = function()
    end
    ActorFrameUtil.hideTooltip = function()
    end
    TipFrameUtil.showTipText = function()
        return nil
    end
    ____exports.default:hideFrames(NativeFrameUtil:getUnitDetail())
    ____exports.default:hideFrames(NativeFrameUtil:getHeroStatePanel())
    ____exports.default:hideFrames(NativeFrameUtil:getUnitAttackValue(0))
    ____exports.default:hideFrames(NativeFrameUtil:getUnitAttackValue(1))
    ____exports.default:hideFrames(NativeFrameUtil:getUnitArmorValue())
    ____exports.default:hideFrames(NativeFrameUtil:getHeroStrValue())
    ____exports.default:hideFrames(NativeFrameUtil:getHeroAgiValue())
    ____exports.default:hideFrames(NativeFrameUtil:getHeroIntValue())
    ____exports.default:hideFrames(NativeFrameUtil:getUnitName())
    ____exports.default:hideFrames(NativeFrameUtil:getUnitClass())
    return true
end
function _____65E0_6587_5B57_6A21_5F0F.hideFrames(self, frame)
    DzFrameClearAllPoints(frame)
    DzFrameShow(frame, false)
    DzFrameSetAbsolutePoint(frame, FramePoint.bottomLeft, 0.81, 0)
end
_____65E0_6587_5B57_6A21_5F0F.justInit = ____exports.default:init()
return ____exports
