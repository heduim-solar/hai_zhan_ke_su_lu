local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 11,["15"] = 11,["16"] = 11,["18"] = 15,["19"] = 16,["20"] = 17,["21"] = 18,["24"] = 21,["25"] = 22,["26"] = 22,["27"] = 22,["28"] = 23,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 17,["34"] = 15,["35"] = 14});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
____exports.default = __TS__Class()
local _____5929_4F7F_53F7_57FA_7840_6280_80FD = ____exports.default
_____5929_4F7F_53F7_57FA_7840_6280_80FD.name = "天使号基础技能"
function _____5929_4F7F_53F7_57FA_7840_6280_80FD.prototype.____constructor(self)
    se:onUnitDeath(function(e)
        if e.isHeroUnitTrig and e.trigUnitOwnerId < 5 then
            PlayerUtil:forUsers(function(____, player)
                if player == e.trigUnitOwner then
                    return
                end
                local anHero = SelectUtil.getAnHero(GetPlayerId(player))
                ActorAbilityUtil:ifUnitHasActorAbility(
                    anHero,
                    function()
                        HeroUtil:addHeroProperty(anHero, 100)
                    end,
                    "天使号基础技能"
                )
            end)
        end
    end)
end
return ____exports
