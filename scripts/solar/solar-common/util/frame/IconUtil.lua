local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 5,["17"] = 5,["18"] = 22,["19"] = 23,["20"] = 23,["21"] = 23,["22"] = 24,["23"] = 25,["24"] = 26,["25"] = 23,["26"] = 23,["27"] = 22,["28"] = 34,["29"] = 35,["30"] = 34,["31"] = 42,["32"] = 43,["33"] = 42,["34"] = 50,["35"] = 51,["36"] = 52,["38"] = 54,["39"] = 54,["40"] = 54,["41"] = 55,["42"] = 56,["44"] = 57,["45"] = 57,["46"] = 58,["47"] = 58,["48"] = 58,["49"] = 58,["50"] = 58,["51"] = 58,["52"] = 59,["53"] = 60,["57"] = 57,["60"] = 65,["61"] = 66,["63"] = 68,["64"] = 69,["65"] = 70,["67"] = 72,["68"] = 54,["69"] = 54,["70"] = 50,["71"] = 7,["72"] = 10,["73"] = 12,["74"] = 13,["75"] = 15});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____AsyncUtil = require("solar.solar-common.util.net.AsyncUtil")
local AsyncUtil = ____AsyncUtil.default
local storm = require("jass.storm")
____exports.default = __TS__Class()
local IconUtil = ____exports.default
IconUtil.name = "IconUtil"
function IconUtil.prototype.____constructor(self)
end
function IconUtil.blendIcon(self, topPath, bgPath)
    return ____exports.default.cache:get(
        (topPath .. ":") .. bgPath,
        function()
            local resultPath = ("_sl_blendIcon_" .. tostring(AsyncUtil:getUUIDAsync())) .. ".blp"
            EXBlendButtonIcon(topPath, bgPath, resultPath)
            return resultPath
        end
    )
end
function IconUtil.getTickIcon(self, bgIcon)
    return ____exports.default:blendIcon(____exports.default.tickIconPath, bgIcon)
end
function IconUtil.getPassiveIcon(self, bgIcon)
    return ____exports.default:blendIcon(____exports.default.passiveIconPath, bgIcon)
end
function IconUtil.getDisableIcon(self, bgIcon)
    if bgIcon == nil then
        return nil
    end
    return ____exports.default.cache:get(
        "getDisableIcon:" .. bgIcon,
        function()
            local fileName = bgIcon
            local lastIndexOf = (string.find(bgIcon, "\\", nil, true) or 0) - 1
            do
                local i = 0
                while i < 100 do
                    local tempIndex = (string.find(
                        bgIcon,
                        "\\",
                        math.max(lastIndexOf + 1 + 1, 1),
                        true
                    ) or 0) - 1
                    if tempIndex > 0 and tempIndex > lastIndexOf then
                        lastIndexOf = tempIndex
                    else
                        break
                    end
                    i = i + 1
                end
            end
            if lastIndexOf > 0 then
                fileName = __TS__StringSubstring(bgIcon, lastIndexOf + 1, #bgIcon)
            end
            local baseDisableIconPath = "ReplaceableTextures\\CommandButtonsDisabled\\DIS" .. fileName
            if storm.load(baseDisableIconPath) ~= nil then
                return baseDisableIconPath
            end
            return ____exports.default:blendIcon(____exports.default.disableIconPath, bgIcon)
        end
    )
end
IconUtil.tickIconPath = "UI\\Widgets\\Glues\\GlueScreen-Checkbox-Check.blp"
IconUtil.backgroundIconPath = "UI\\Widgets\\ToolTips\\Human\\human-tooltip-background.blp"
IconUtil.passiveIconPath = "solar_asset\\icon\\passive.blp"
IconUtil.disableIconPath = "solar_asset\\icon\\disable.blp"
IconUtil.cache = __TS__New(Cache)
return ____exports
