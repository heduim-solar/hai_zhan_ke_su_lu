local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 10,["19"] = 10,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 10,["24"] = 9,["25"] = 15,["26"] = 17,["27"] = 17,["28"] = 17,["29"] = 17,["30"] = 17,["31"] = 17,["32"] = 17,["33"] = 17,["34"] = 17,["35"] = 26,["36"] = 27,["37"] = 28,["39"] = 30,["40"] = 31,["41"] = 32,["42"] = 33,["44"] = 35,["45"] = 36,["47"] = 38,["48"] = 39,["49"] = 26,["50"] = 43,["51"] = 43,["52"] = 43,["53"] = 43,["54"] = 43,["55"] = 43,["56"] = 43,["57"] = 43,["58"] = 43,["59"] = 52,["60"] = 53,["61"] = 54,["63"] = 56,["64"] = 57,["65"] = 58,["66"] = 59,["67"] = 60,["69"] = 62,["70"] = 63,["71"] = 64,["73"] = 66,["74"] = 67,["75"] = 52,["76"] = 15});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____AutoMissileAttackController = require("solar.solar-common.controller.AutoMissileAttackController")
local AutoMissileAttackController = ____AutoMissileAttackController.default
____exports.default = __TS__Class()
local _____73A9_5BB6_8BBE_7F6E_7279_6548_7B49_5F00_5173 = ____exports.default
_____73A9_5BB6_8BBE_7F6E_7279_6548_7B49_5F00_5173.name = "玩家设置特效等开关"
function _____73A9_5BB6_8BBE_7F6E_7279_6548_7B49_5F00_5173.prototype.____constructor(self)
    BaseUtil.runLater(
        3,
        function()
            self:init()
        end
    )
end
function _____73A9_5BB6_8BBE_7F6E_7279_6548_7B49_5F00_5173.prototype.init(self)
    local actorType = ActorTypeUtil:registerActorType({
        id = "_sl_:config:开关特效显示",
        class = "游戏设置",
        icon = "ReplaceableTextures\\CommandButtons\\BTNStarfall.blp",
        uiShowType = "通用图标面板",
        requiredTip = "点击打开特效显示!",
        name = "开关特效显示",
        uiEnable = true
    })
    actorType.onLocalClick = function(____, actor, btn, x, y, actorType)
        if settings.isEffectDisplay == nil then
            settings.isEffectDisplay = true
        end
        settings.isEffectDisplay = not settings.isEffectDisplay
        if settings.isEffectDisplay then
            PlayerUtil:message("|cffff0000显示特效")
            actorType.describe = "点击关闭特效显示!"
        else
            PlayerUtil:message("|cffff0000关闭特效")
            actorType.describe = "点击打开特效显示!"
        end
        actorType.uiEnable = settings.isEffectDisplay
        se:emit("刷新图标面板")
    end
    actorType = ActorTypeUtil:registerActorType({
        id = "_sl_:config:开关射程最大限制",
        class = "游戏设置",
        icon = "ReplaceableTextures\\CommandButtons\\BTNCorpseExplode.blp",
        uiShowType = "通用图标面板",
        requiredTip = "点击启用射程最大限制!",
        name = "开关射程最大限制",
        uiEnable = true
    })
    actorType.onClick = function(____, actor, btn)
        if settings["射程最大限制"] == nil then
            settings["射程最大限制"] = true
        end
        settings["射程最大限制"] = not settings["射程最大限制"]
        if settings["射程最大限制"] then
            PlayerUtil:message("|cffff0000启用射程最大限制(3000)")
            actorType.describe = "点击关闭射程最大限制!"
            AutoMissileAttackController.defaultRangeMaxLimit = 3000
        else
            PlayerUtil:message("|cffff0000关闭射程最大限制")
            actorType.describe = "点击启用射程最大限制!"
            AutoMissileAttackController.defaultRangeMaxLimit = 500000
        end
        actorType.uiEnable = settings["射程最大限制"]
        se:emit("刷新图标面板")
    end
end
return ____exports
