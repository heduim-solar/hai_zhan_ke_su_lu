local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 14,["13"] = 17,["16"] = 20,["17"] = 21,["18"] = 22,["21"] = 25,["22"] = 26,["23"] = 27,["24"] = 28,["26"] = 14,["27"] = 6});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local _____5347_7EA7_65F6_5956_52B1_6728_5934 = ____exports.default
_____5347_7EA7_65F6_5956_52B1_6728_5934.name = "升级时奖励木头"
function _____5347_7EA7_65F6_5956_52B1_6728_5934.prototype.____constructor(self)
    se:onHeroLevelUp(function(e)
        if e.trigUnitOwnerId > 3 then
            return
        end
        local heroLevel = GetHeroLevel(e.trigUnit)
        local player = e.trigUnitOwner
        if sd(nil, player)["onHeroLevelUp" .. tostring(heroLevel)] then
            return
        end
        if heroLevel == 10 or heroLevel == 15 or heroLevel == 20 then
            sd(nil, player)["onHeroLevelUp" .. tostring(heroLevel)] = true
            PlayerUtil:addLumberState(player, 1)
            PlayerUtil:message("获得木头+1", 10, player)
        end
    end)
end
return ____exports
