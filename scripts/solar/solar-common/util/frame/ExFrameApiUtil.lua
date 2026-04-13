local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 8,["15"] = 8,["16"] = 8,["18"] = 8,["19"] = 18,["20"] = 18,["21"] = 18,["23"] = 19,["24"] = 19,["25"] = 19,["26"] = 19,["27"] = 19,["28"] = 19,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 23,["33"] = 24,["34"] = 25,["35"] = 26,["37"] = 28,["38"] = 29,["40"] = 31,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 33,["45"] = 33,["46"] = 34,["47"] = 35,["49"] = 38,["50"] = 39,["51"] = 40,["52"] = 41,["53"] = 42,["54"] = 43,["55"] = 44,["56"] = 45,["57"] = 46,["58"] = 47,["59"] = 47,["60"] = 47,["61"] = 47,["62"] = 47,["63"] = 47,["64"] = 47,["65"] = 47,["66"] = 48,["67"] = 32,["68"] = 32,["69"] = 18,["70"] = 57,["71"] = 58,["72"] = 59,["73"] = 60,["74"] = 57});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AsyncUtil = require("solar.solar-common.util.net.AsyncUtil")
local AsyncUtil = ____AsyncUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
____exports.default = __TS__Class()
local ExFrameApiUtil = ____exports.default
ExFrameApiUtil.name = "ExFrameApiUtil"
function ExFrameApiUtil.prototype.____constructor(self)
end
function ExFrameApiUtil.setUnitMapHeadPortrait(self, unit, head_pic_path, picSize)
    if picSize == nil then
        picSize = 0.01
    end
    local head_ui = DzCreateFrameByTagName(
        "BACKDROP",
        "ExFrameApiUtil_" .. tostring(AsyncUtil:getUUIDAsync()),
        DzGetGameUI(),
        "template",
        0
    )
    DzFrameSetSize(head_ui, picSize, picSize)
    DzFrameSetTexture(head_ui, head_pic_path, 0)
    local minimapWidth = 0.1420116
    local minimapHeight = 0.1420116
    if FrameGetWidth and FrameGetWidth(DzFrameGetMinimap()) > 0.01 then
        minimapWidth = FrameGetWidth(DzFrameGetMinimap())
    end
    if FrameGetHeight and FrameGetHeight(DzFrameGetMinimap()) > 0.01 then
        minimapHeight = FrameGetHeight(DzFrameGetMinimap())
    end
    DataBase:getUnitSolarData(unit)._sl_head_ui = head_ui
    return BaseUtil.onTimer(
        0.1,
        function()
            local ____opt_0 = DataBase:getUnitSolarData(unit, false)
            if (____opt_0 and ____opt_0._sl_head_ui) == nil then
                DzDestroyFrame(head_ui)
                return false
            end
            local width = GetCameraBoundMaxX() - GetCameraBoundMinX()
            local height = GetCameraBoundMaxY() - GetCameraBoundMinY()
            local centerX = width / 2 + GetCameraBoundMinX()
            local centerY = height / 2 + GetCameraBoundMinY()
            local maxSize = math.max(width, height)
            local w = minimapWidth / maxSize
            local h = minimapHeight / maxSize
            local x = (GetUnitX(unit) - centerX) * w
            local y = (GetUnitY(unit) - centerY) * h
            DzFrameSetPoint(
                head_ui,
                FramePoint.center,
                DzFrameGetMinimap(),
                FramePoint.center,
                x,
                y
            )
            return true
        end
    )
end
function ExFrameApiUtil.createBaseFrameInSimpleFrame(self, parentSimpleFrame)
    local uuid = AsyncUtil:getUUIDAsync()
    DzCreateSimpleFrame("_sl_simpleframe_and_frame", parentSimpleFrame, uuid)
    return DzFrameFindByName("_sl_simpleframe_and_frame_frame", uuid)
end
return ____exports
