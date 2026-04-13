local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 9,["15"] = 10,["16"] = 9,["17"] = 14,["18"] = 15,["19"] = 16,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 19,["24"] = 20,["25"] = 20,["26"] = 21,["28"] = 14,["29"] = 7});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local _____7ECF_9A8C_83B7_53D6 = ____exports.default
_____7ECF_9A8C_83B7_53D6.name = "经验获取"
function _____7ECF_9A8C_83B7_53D6.prototype.____constructor(self)
    PlayerUtil:forUsers(function(____, player)
        SetPlayerHandicapXP(player, 0)
    end)
    se:onUnitDeath(function(e)
        local killingUnit = e.killingUnit
        local owningPlayer = GetOwningPlayer(killingUnit)
        if IsHandle(killingUnit) and GetPlayerId(owningPlayer) < 5 then
            local hero = PlayerUtil:getHero(owningPlayer)
            local ____opt_0 = AttributeUtil:getUnitAttribute(hero, false)
            local _____6740_654C_7ECF_9A8C = ____opt_0 and ____opt_0["杀敌经验"] or 0
            local ____opt_2 = AttributeUtil:getUnitAttribute(hero, false)
            local _____7ECF_9A8C_500D_7387 = ____opt_2 and ____opt_2["经验倍率"] or 0
            AddHeroXP(hero, (1 + _____6740_654C_7ECF_9A8C) * (1 + _____7ECF_9A8C_500D_7387), true)
        end
    end)
end
return ____exports
