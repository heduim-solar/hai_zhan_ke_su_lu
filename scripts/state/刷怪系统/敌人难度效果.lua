local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 13,["21"] = 16,["22"] = 17,["23"] = 18,["24"] = 19,["25"] = 20,["26"] = 21,["27"] = 22,["29"] = 24,["30"] = 26,["31"] = 28,["32"] = 29,["33"] = 32,["34"] = 32,["35"] = 32,["36"] = 34,["37"] = 35,["38"] = 36,["40"] = 38,["41"] = 41,["42"] = 32,["43"] = 32,["44"] = 45,["45"] = 46,["46"] = 47,["48"] = 45,["49"] = 12,["50"] = 54,["51"] = 55,["52"] = 56,["53"] = 59,["54"] = 54,["55"] = 8,["56"] = 9});
local ____exports = {}
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
____exports.default = __TS__Class()
local _____654C_4EBA_96BE_5EA6_6548_679C = ____exports.default
_____654C_4EBA_96BE_5EA6_6548_679C.name = "敌人难度效果"
function _____654C_4EBA_96BE_5EA6_6548_679C.prototype.____constructor(self)
    if settings.gameMode == MapModel["模式1_普通模式"] then
        return
    end
    local nanduLevel = MapUtil:getRealNanduLevel()
    if settings.gameMode == MapModel["模式2_寄生模式"] then
        nanduLevel = 1.2 ^ nanduLevel
    elseif settings.gameMode == MapModel["模式3_献祭模式"] then
        nanduLevel = 1.3 ^ nanduLevel
    elseif settings.gameMode == MapModel["模式4_真实难度"] then
        nanduLevel = 1.4 ^ nanduLevel
    end
    ____exports.default.baseJianShang = 1 - nanduLevel / (nanduLevel + 20)
    print((tostring(nanduLevel) .. "基础减伤=") .. tostring(____exports.default.baseJianShang))
    ____exports.default:updateJS(32)
    ____exports.default:updateJS(1)
    BaseUtil.onTimer(
        10,
        function(____, count)
            local realLevel = gv.enemyLevel
            if gv["深度海域层数"] and gv["深度海域层数"] > 0 then
                realLevel = gv["深度海域层数"] + 16
            end
            ____exports.default:updateJS(realLevel)
            return true
        end
    )
    SolarDamageState:addEventHandlerLast(function(____, event)
        if GetPlayerId(GetOwningPlayer(event.unit0)) > 5 then
            event.resultDamage = event.resultDamage * ____exports.default["减伤"]
        end
    end)
end
function _____654C_4EBA_96BE_5EA6_6548_679C.updateJS(self, realLevel)
    local realLevelXS = realLevel / (realLevel + 10)
    ____exports.default["减伤"] = ____exports.default.baseJianShang * (1 - realLevelXS)
    print((("Lv." .. tostring(realLevel)) .. "当前敌人减伤:") .. tostring(____exports.default["减伤"]))
end
_____654C_4EBA_96BE_5EA6_6548_679C["减伤"] = 1
_____654C_4EBA_96BE_5EA6_6548_679C.baseJianShang = 1
return ____exports
