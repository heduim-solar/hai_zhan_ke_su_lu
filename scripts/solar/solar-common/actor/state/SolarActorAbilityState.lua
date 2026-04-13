local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 6,["15"] = 7,["18"] = 10,["19"] = 11,["20"] = 11,["21"] = 11,["22"] = 12,["23"] = 13,["26"] = 11,["27"] = 11,["28"] = 10,["29"] = 18,["30"] = 20,["31"] = 20,["32"] = 20,["33"] = 21,["36"] = 24,["37"] = 25,["38"] = 26,["39"] = 27,["40"] = 28,["41"] = 29,["43"] = 31,["44"] = 32,["46"] = 34,["47"] = 20,["48"] = 20,["49"] = 18,["50"] = 5});
local ____exports = {}
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local SolarActorAbilityState = ____exports.default
SolarActorAbilityState.name = "SolarActorAbilityState"
function SolarActorAbilityState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorAbilityState()")
        return
    end
    se:onUnitSpellCast(function(e)
        ActorAbilityUtil:ifHasActorAbility(
            e.spellAbilityIdStr,
            function(____, actor)
                if actor:isPassive() or actor:isDisable() then
                    IssueImmediateOrder(e.trigUnit, "stop")
                    return
                end
            end
        )
    end)
    se:onUnitSpellEffect(function(e)
        ActorAbilityUtil:ifHasActorAbility(
            e.spellAbilityIdStr,
            function(____, actor)
                if actor:isPassive() or actor:isDisable() then
                    return
                end
                local targetUnit = GetSpellTargetUnit()
                local x = 0
                local y = 0
                if IsHandle(targetUnit) then
                    x = GetUnitX(targetUnit)
                    y = GetUnitY(targetUnit)
                else
                    x = GetSpellTargetX()
                    y = GetSpellTargetY()
                end
                actor:action(x, y, targetUnit)
            end
        )
    end)
end
return ____exports
