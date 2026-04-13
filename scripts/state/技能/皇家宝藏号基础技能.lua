local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 7,["15"] = 7,["16"] = 7,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 21,["25"] = 19,["26"] = 24,["27"] = 25,["28"] = 25,["29"] = 25,["30"] = 26,["31"] = 27,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 24,["36"] = 10});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
____exports.default = __TS__Class()
local _____7687_5BB6_5B9D_85CF_53F7_57FA_7840_6280_80FD = ____exports.default
_____7687_5BB6_5B9D_85CF_53F7_57FA_7840_6280_80FD.name = "皇家宝藏号基础技能"
function _____7687_5BB6_5B9D_85CF_53F7_57FA_7840_6280_80FD.prototype.____constructor(self)
    --- 皇家宝藏号
    -- 每1W金币提高1%造成的伤害
    local actorType = ActorTypeUtil:getActorType("皇家宝藏号基础技能")
    actorType.interval = 5
    actorType.onUnitInterval = function(____, actor)
        local gold = PlayerUtil:getGold(GetOwningPlayer(actor.unit))
        actor:setDescribe(("每1W金币提高1%造成的伤害|n当前提高" .. tostring(gold / 10000)) .. "%")
    end
    SolarDamageState:addEventHandlerLast(function(____, event)
        ActorAbilityUtil:ifUnitHasActorAbility(
            event.unit1,
            function(____, actor)
                local gold = PlayerUtil:getGold(GetOwningPlayer(actor.unit))
                event.resultDamage = event.resultDamage * (1 + gold / 10000)
            end,
            "皇家宝藏号基础技能"
        )
    end)
end
return ____exports
