local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 6,["16"] = 6,["17"] = 6,["19"] = 6,["20"] = 9,["21"] = 9,["22"] = 9,["24"] = 11,["25"] = 12,["26"] = 13,["27"] = 14,["28"] = 16,["29"] = 17,["30"] = 18,["31"] = 19,["32"] = 21,["33"] = 22,["34"] = 23,["35"] = 23,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 25,["42"] = 26,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 28,["47"] = 29,["48"] = 30,["49"] = 31,["50"] = 32,["52"] = 34,["53"] = 35,["54"] = 36,["55"] = 37,["56"] = 38,["57"] = 27,["58"] = 27,["59"] = 9});
local ____exports = {}
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____ImageColor = require("solar.solar-common.framex.ImageColor")
local ImageColor = ____ImageColor.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local FrameLoadingUtil = ____exports.default
FrameLoadingUtil.name = "FrameLoadingUtil"
function FrameLoadingUtil.prototype.____constructor(self)
end
function FrameLoadingUtil.showLoadingScreen(self, dur, bg)
    if bg == nil then
        bg = "UI\\Glues\\MainMenu\\MainMenu3d_Beta\\Arthas_Concept03.blp"
    end
    local backDrop = Frame:createBackDrop()
    backDrop:setSize(0.8, 0.6)
    backDrop:setAllPoints(DzGetGameUI())
    backDrop:setTexture(bg)
    local imageColor = __TS__New(ImageColor)
    imageColor:setColor(2, 2, 2)
    imageColor:setSize(0.01, 0.016)
    imageColor:setAbsPoint(FramePoint.left, 0, 0.04)
    local text = Frame:createTEXT()
    text:setSize(-1, 0.02)
    text:setPoint(
        FramePoint.topRight,
        imageColor.rootFrame.handle,
        FramePoint.bottomRight,
        -0.01,
        -0.005
    )
    local ig = 0.1
    local maxCount = math.floor(dur / ig)
    BaseUtil.onTimer(
        ig,
        function(____, count)
            if count >= maxCount then
                text:destroy()
                imageColor:destroy()
                backDrop:destroy()
                return false
            end
            local p = count / maxCount
            text:setText(tostring(math.floor(p * 100)) .. "%")
            imageColor:setColor(100 * (1 - p), 100 + 155 * p, 0, 100 + 155 * p)
            imageColor:setSize(0.8 * p, 0.016)
            return true
        end
    )
end
return ____exports
