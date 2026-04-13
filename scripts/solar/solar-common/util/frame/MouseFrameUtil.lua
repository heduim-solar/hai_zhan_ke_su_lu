local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 10,["17"] = 10,["18"] = 10,["20"] = 10,["21"] = 13,["22"] = 13,["23"] = 13,["25"] = 14,["26"] = 13,["27"] = 17,["28"] = 17,["29"] = 17,["31"] = 18,["32"] = 17,["33"] = 21,["34"] = 21,["35"] = 21,["37"] = 22,["38"] = 21,["39"] = 31,["40"] = 31,["41"] = 31,["43"] = 32,["46"] = 35,["47"] = 36,["48"] = 37,["49"] = 38,["50"] = 39,["51"] = 40,["52"] = 42,["53"] = 42,["54"] = 42,["55"] = 43,["56"] = 44,["57"] = 45,["59"] = 47,["61"] = 42,["62"] = 42,["63"] = 42,["64"] = 42,["65"] = 50,["66"] = 50,["67"] = 50,["68"] = 51,["69"] = 52,["70"] = 53,["71"] = 50,["72"] = 50,["73"] = 31});
local ____exports = {}
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
local ____SolarConfig = require("solar.solar-common.common.SolarConfig")
local SolarConfig = ____SolarConfig.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
____exports.default = __TS__Class()
local MouseFrameUtil = ____exports.default
MouseFrameUtil.name = "MouseFrameUtil"
function MouseFrameUtil.prototype.____constructor(self)
end
function MouseFrameUtil.showWarnText(self, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(SolarConfig.defaultWarnTextColor .. tipText, dur, showPlayer)
end
function MouseFrameUtil.showFailText(self, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(SolarConfig.defaultFailTextColor .. tipText, dur, showPlayer)
end
function MouseFrameUtil.showSuccessText(self, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    ____exports.default:showTipText(SolarConfig.defaultSuccessTextColor .. tipText, dur, showPlayer)
end
function MouseFrameUtil.showTipText(self, tipText, dur, showPlayer)
    if dur == nil then
        dur = 1
    end
    if showPlayer ~= nil and GetLocalPlayer() ~= showPlayer then
        return
    end
    local frame = TipFrameUtil._sl_tipTextFrameObjectPool:borrowObject()
    frame:setText(tipText)
    frame.visible = true
    DzFrameShow(frame.backdropFrame.handle, true)
    local mx = InputUtil:getMouseSceneX()
    local my = InputUtil:getMouseSceneY()
    BaseUtil.runLater(
        0.03,
        function(count, maxCount)
            local y = 0.01 + 0.002 * count
            if mx > 0.76 then
                frame:setAbsPoint(FramePoint.bottomRight, mx, my + y)
            else
                frame:setAbsPoint(FramePoint.bottom, mx, my + y)
            end
        end,
        30,
        true
    )
    BaseUtil.runLater(
        dur,
        function()
            frame.visible = false
            DzFrameShow(frame.backdropFrame.handle, false)
            TipFrameUtil._sl_tipTextFrameObjectPool:returnObject(frame)
        end
    )
end
return ____exports
