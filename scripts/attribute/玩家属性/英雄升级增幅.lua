local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 12,["9"] = 12,["10"] = 12,["12"] = 15,["13"] = 16,["14"] = 17,["17"] = 20,["18"] = 21,["19"] = 22,["22"] = 26,["23"] = 27,["24"] = 28,["25"] = 29,["26"] = 32,["27"] = 33,["28"] = 33,["29"] = 33,["30"] = 33,["31"] = 33,["32"] = 34,["33"] = 35,["34"] = 16,["35"] = 14});
local ____exports = {}
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local _____82F1_96C4_5347_7EA7_589E_5E45 = ____exports.default
_____82F1_96C4_5347_7EA7_589E_5E45.name = "英雄升级增幅"
function _____82F1_96C4_5347_7EA7_589E_5E45.prototype.____constructor(self)
    local flag = false
    se:onHeroLevelUp(function(e)
        if flag then
            return
        end
        local hero = e.trigUnit
        local playerAttribute = AttributeUtil:getPlayerAttribute(e.trigUnitOwner)
        if (playerAttribute and playerAttribute["英雄升级增幅"]) == nil then
            return
        end
        local solarData = db:getUnitSolarData(hero)
        local lastLv = solarData["_sl_英雄升级增幅_last_lv"] or 1
        local addLv = GetHeroLevel(hero) - lastLv
        local shopExtAddLv = addLv * playerAttribute["英雄升级增幅"]
        flag = true
        SetHeroLevel(
            hero,
            GetHeroLevel(hero) + shopExtAddLv,
            true
        )
        flag = false
        solarData["_sl_英雄升级增幅_last_lv"] = GetHeroLevel(hero)
    end)
end
return ____exports
