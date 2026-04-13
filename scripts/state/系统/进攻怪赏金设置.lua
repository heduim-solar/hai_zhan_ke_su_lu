local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 9,["17"] = 10,["20"] = 13,["21"] = 14,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["27"] = 9,["28"] = 7});
local ____exports = {}
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____UnitRewardUtil = require("solar.solar-common.util.unit.UnitRewardUtil")
local UnitRewardUtil = ____UnitRewardUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
____exports.default = __TS__Class()
local _____8FDB_653B_602A_8D4F_91D1_8BBE_7F6E = ____exports.default
_____8FDB_653B_602A_8D4F_91D1_8BBE_7F6E.name = "进攻怪赏金设置"
function _____8FDB_653B_602A_8D4F_91D1_8BBE_7F6E.prototype.____constructor(self)
    se:onUnitDeath(function(e)
        if not e.hasKillingUnit then
            return
        end
        local give_money = MapUtil:getUnitBounty(e.trigUnit)
        if give_money and give_money > 0 then
            TextTagUtil.textGold(
                "+" .. tostring(UnitRewardUtil:addGoldWithEarnGoldP(e.killingUnit, give_money)),
                e.trigUnit
            )
        end
    end)
end
return ____exports
