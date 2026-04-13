local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 6,["17"] = 6,["19"] = 6,["20"] = 28,["21"] = 29,["22"] = 30,["23"] = 31,["24"] = 31,["25"] = 31,["26"] = 31,["27"] = 31,["28"] = 31,["29"] = 31,["30"] = 32,["31"] = 33,["32"] = 34,["33"] = 36,["34"] = 37,["36"] = 39,["37"] = 39,["38"] = 39,["39"] = 40,["40"] = 41,["41"] = 42,["42"] = 43,["43"] = 44,["45"] = 46,["46"] = 39,["47"] = 39,["48"] = 48,["49"] = 28,["50"] = 56,["51"] = 56,["52"] = 56,["54"] = 56,["55"] = 56,["57"] = 58,["58"] = 59,["59"] = 58,["60"] = 62,["61"] = 63,["62"] = 62,["63"] = 66,["64"] = 67,["65"] = 66,["66"] = 56,["67"] = 10,["68"] = 10,["69"] = 10,["70"] = 11,["71"] = 12,["72"] = 13,["73"] = 14,["74"] = 15,["75"] = 10,["76"] = 16,["77"] = 17,["78"] = 18,["79"] = 19,["80"] = 10,["81"] = 10,["82"] = 21});
local ____exports = {}
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ObjectPool = require("solar.solar-common.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
____exports.default = __TS__Class()
local FrameAnimUtil = ____exports.default
FrameAnimUtil.name = "FrameAnimUtil"
function FrameAnimUtil.prototype.____constructor(self)
end
function FrameAnimUtil.addCooldown(self, parent, cd)
    local cdFrame = ____exports.default.cdFramePool:borrowObject()
    cdFrame.visible = true
    cdFrame:setPoint(
        FramePoint.center,
        parent.current,
        FramePoint.center,
        0,
        0
    )
    cdFrame:setAllPoints(parent.current)
    cdFrame:setAnimateOffset(0)
    if isEmbedJapi then
        local modelSize = DzFrameGetHeight(parent.current) / 0.0378
        cdFrame:setModelSize(modelSize)
    end
    BaseUtil.onTimer(
        ____exports.default.cdRefreshInterval,
        function(____, count)
            local offset = ____exports.default.cdRefreshInterval * count / cd
            cdFrame:setAnimateOffset(offset)
            if offset >= 1 then
                ____exports.default.cdFramePool:returnObject(cdFrame)
                return false
            end
            return true
        end
    )
    return cdFrame
end
function FrameAnimUtil.addEnlargeMouseEnter(self, frame, widthFactor, heightFactor)
    if widthFactor == nil then
        widthFactor = 1.05
    end
    if heightFactor == nil then
        heightFactor = widthFactor
    end
    frame:addOnClick(function()
        DzFrameSetSize(frame.current, frame.props.size.width * widthFactor, frame.props.size.height * heightFactor)
    end)
    frame:addOnMouseEnter(function()
        DzFrameSetSize(frame.current, frame.props.size.width * widthFactor, frame.props.size.height * heightFactor)
    end)
    frame:addOnMouseLeave(function()
        DzFrameSetSize(frame.current, frame.props.size.width, frame.props.size.height)
    end)
end
FrameAnimUtil.cdFramePool = __TS__New(
    ObjectPool,
    function()
        local cdFrame = Frame:createSPRITE()
        cdFrame:clearPoints()
        cdFrame:setModel("UI\\Feedback\\Cooldown\\UI-Cooldown-Indicator.mdx", 0)
        cdFrame:setSpriteAnimate(0, false)
        return cdFrame
    end,
    function(____, frame)
        frame:clearPoints()
        frame:setAbsPoint(FramePoint.left, -1, -1)
        frame.visible = false
    end
)
FrameAnimUtil.cdRefreshInterval = 0.2
return ____exports
