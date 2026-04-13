local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 19,["21"] = 19,["22"] = 19,["24"] = 24,["25"] = 25,["26"] = 28,["27"] = 29,["28"] = 30,["29"] = 30,["30"] = 30,["31"] = 30,["32"] = 30,["33"] = 30,["34"] = 30,["35"] = 31,["36"] = 32,["37"] = 33,["38"] = 35,["39"] = 36,["40"] = 36,["41"] = 36,["42"] = 36,["43"] = 36,["44"] = 36,["45"] = 36,["46"] = 37,["47"] = 38,["48"] = 39,["49"] = 40,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 45,["55"] = 46,["56"] = 47,["57"] = 48,["58"] = 49,["60"] = 51,["61"] = 52,["62"] = 53,["63"] = 54,["66"] = 57,["67"] = 58,["68"] = 59,["69"] = 60,["70"] = 61,["71"] = 62,["74"] = 65,["75"] = 66,["77"] = 45,["78"] = 69,["79"] = 44,["80"] = 44,["81"] = 27,["82"] = 21});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____NativeFrameUtil = require("solar.solar-common.util.frame.NativeFrameUtil")
local NativeFrameUtil = ____NativeFrameUtil.default
local ____TextAlign = require("solar.solar-common.constant.TextAlign")
local TextAlign = ____TextAlign.default
____exports.default = __TS__Class()
local _____6BCF_79D2_8D44_6E90 = ____exports.default
_____6BCF_79D2_8D44_6E90.name = "每秒资源"
function _____6BCF_79D2_8D44_6E90.prototype.____constructor(self)
    self.goldAddText = nil
    self.lumberAddText = nil
    if ____exports.default.cfg.showUI then
        local goldAddText = Frame:createTEXT()
        goldAddText:setPoint(
            FramePoint.right,
            NativeFrameUtil:getGoldText(),
            FramePoint.left,
            -0.001,
            0
        )
        goldAddText:setText("|cFFFFC66D+0/s")
        goldAddText:setTextAlignment(TextAlign.right)
        self.goldAddText = goldAddText
        local lumberAddText = Frame:createTEXT()
        lumberAddText:setPoint(
            FramePoint.right,
            NativeFrameUtil:getLumberText(),
            FramePoint.left,
            -0.001,
            0
        )
        lumberAddText:setText("|cFF499C54+0/s")
        lumberAddText:setTextAlignment(TextAlign.right)
        lumberAddText.visible = false
        self.lumberAddText = lumberAddText
    end
    BaseUtil.onTimer(
        1,
        function()
            AttributeUtil:forAllPlayerAttribute(function(____, p, playerAttribute)
                if playerAttribute["每秒金币"] then
                    local add = playerAttribute["每秒金币"] * (1 + (playerAttribute["金币收益加成"] or 0))
                    if playerAttribute.earn_gold_p then
                        add = add * (1 + playerAttribute.earn_gold_p)
                    end
                    add = math.floor(add)
                    PlayerUtil:addGoldState(p, add)
                    if self.goldAddText and GetLocalPlayer() == p then
                        self.goldAddText:setText(("|cFFFFC66D+" .. tostring(add)) .. "/s")
                    end
                end
                if playerAttribute["每秒木材"] then
                    local add = playerAttribute["每秒木材"] * (1 + (playerAttribute["木材收益加成"] or 0))
                    add = math.floor(add)
                    PlayerUtil:addLumberState(p, add)
                    if self.lumberAddText and GetLocalPlayer() == p then
                        self.lumberAddText:setText(("|cFF499C54+" .. tostring(add)) .. "/s")
                    end
                end
                if playerAttribute["每秒人口"] then
                    PlayerUtil:addFoodCapState(p, playerAttribute["每秒人口"])
                end
            end)
            return true
        end
    )
end
_____6BCF_79D2_8D44_6E90.cfg = {showUI = true}
return ____exports
