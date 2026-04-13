local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 7,["7"] = 7,["8"] = 7,["10"] = 7,["11"] = 13,["12"] = 20,["13"] = 22,["14"] = 25,["15"] = 28,["16"] = 30,["17"] = 32,["18"] = 34,["19"] = 39,["20"] = 40,["21"] = 43,["22"] = 44,["23"] = 45});
local ____exports = {}
____exports.default = __TS__Class()
local SolarConfig = ____exports.default
SolarConfig.name = "SolarConfig"
function SolarConfig.prototype.____constructor(self)
end
SolarConfig.useErrorFrame = true
SolarConfig.defaultTickPath = "UI\\Widgets\\Glues\\GlueScreen-Checkbox-Check.blp"
SolarConfig.defaultDisablePath = "solar_asset\\icon\\disable.blp"
SolarConfig.defaultResourceGoldPath = "UI\\Widgets\\ToolTips\\Human\\ToolTipGoldIcon.blp"
SolarConfig.defaultResourceLumberPath = "UI\\Widgets\\ToolTips\\Human\\ToolTipLumberIcon.blp"
SolarConfig.defaultTipBackgroundPath = "UI\\Glues\\BattleNet\\BattleNetTeamLevelBar\\Loading-BarBackground.blp"
SolarConfig.defaultAutoCastModelPath = "UI\\Feedback\\Autocast\\UI-ModalButtonOn.mdx"
SolarConfig.defaultLampEffectModelPath = "UI\\Feedback\\Autocast\\UI-ModalButtonOn.mdx"
SolarConfig.defaultTooltipFrameAbsX = 0.79
SolarConfig.defaultTooltipFrameAbsY = 0.17
SolarConfig.defaultWarnTextColor = "|cff951629"
SolarConfig.defaultSuccessTextColor = "|cff00ff00"
SolarConfig.defaultFailTextColor = "|cffff0000"
return ____exports
