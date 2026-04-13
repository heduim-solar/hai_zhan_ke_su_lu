local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 7,["15"] = 7,["16"] = 9,["17"] = 9,["18"] = 9,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 22,["28"] = 22,["29"] = 23,["30"] = 22,["31"] = 22,["32"] = 21,["33"] = 26,["34"] = 27,["35"] = 27,["36"] = 27,["37"] = 28,["38"] = 27,["39"] = 27,["40"] = 26,["41"] = 12,["42"] = 33,["43"] = 34,["46"] = 37,["47"] = 38,["48"] = 39,["49"] = 40,["52"] = 43,["53"] = 44,["54"] = 45,["55"] = 46,["56"] = 47,["57"] = 48,["60"] = 51,["61"] = 52,["62"] = 53,["65"] = 56,["66"] = 57,["67"] = 58,["68"] = 59,["69"] = 60,["70"] = 61,["75"] = 67,["76"] = 68,["79"] = 71,["80"] = 72,["81"] = 73,["82"] = 74,["83"] = 75,["85"] = 77,["87"] = 80,["88"] = 81,["91"] = 84,["92"] = 85,["93"] = 86,["94"] = 87,["95"] = 88,["97"] = 90,["100"] = 33});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local _____9065_9065_9886_5148_53F7_57FA_7840_6280_80FD = ____exports.default
_____9065_9065_9886_5148_53F7_57FA_7840_6280_80FD.name = "遥遥领先号基础技能"
function _____9065_9065_9886_5148_53F7_57FA_7840_6280_80FD.prototype.____constructor(self)
    --- 强者恒强号
    -- 你的Q位置主炮伤害/射程翻倍。
    -- 
    -- 遥遥领先号，W位置主炮伤害/射程翻倍。
    local actorType = ActorTypeUtil:getActorType("遥遥领先号基础技能")
    actorType.onUnitChange = function(____, actor, unit)
        BaseUtil.runLater(
            1,
            function()
                ____exports.default:update(actor, unit)
            end
        )
    end
    actorType.onUnitActorsChange = function(____, actor)
        BaseUtil.runLater(
            1,
            function()
                ____exports.default:update(actor, actor.unit)
            end
        )
    end
end
function _____9065_9065_9886_5148_53F7_57FA_7840_6280_80FD.update(self, actor, unit)
    if not IsHandle(unit) then
        return
    end
    local hasActor = ActorUtil:isUnitHasActor(unit, "遥遥领先号基础技能")
    if hasActor then
        local actorAbility = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 9)
        if actorAbility == nil then
            return
        end
        local aController = actorAbility.autoMissileAttackController
        if aController and (aController["遥遥领先号基础技能range"] == nil or aController["遥遥领先号基础技能range"] == 0) then
            aController["遥遥领先号基础技能range"] = aController.range
            aController.range = aController.range + aController["遥遥领先号基础技能range"]
            if aController.damageStateFormula then
                aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) + 1
            end
        end
        if _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) then
            actorAbility = ActorAbilityUtil:getUnitActorAbilityByPos(unit, 10)
            if actorAbility == nil then
                return
            end
            aController = actorAbility.autoMissileAttackController
            if aController and (aController["遥遥领先号基础技能range"] == nil or aController["遥遥领先号基础技能range"] == 0) then
                aController["遥遥领先号基础技能range"] = aController.range
                aController.range = aController.range + aController["遥遥领先号基础技能range"]
                if aController.damageStateFormula then
                    aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) + 1
                end
            end
        end
    else
        local actorAbility = ActorAbilityUtil:getUnitActorAbilityByPos(actor.lastUnit, 9)
        if actorAbility == nil then
            return
        end
        local aController = actorAbility.autoMissileAttackController
        if aController and aController["遥遥领先号基础技能range"] and aController["遥遥领先号基础技能range"] > 0 then
            aController.range = aController.range - aController["遥遥领先号基础技能range"]
            if aController.damageStateFormula then
                aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) - 1
            end
            aController["遥遥领先号基础技能range"] = 0
        end
        actorAbility = ActorAbilityUtil:getUnitActorAbilityByPos(actor.lastUnit, 10)
        if actorAbility == nil then
            return
        end
        aController = actorAbility.autoMissileAttackController
        if aController and aController["遥遥领先号基础技能range"] and aController["遥遥领先号基础技能range"] > 0 then
            aController.range = aController.range - aController["遥遥领先号基础技能range"]
            if aController.damageStateFormula then
                aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) - 1
            end
            aController["遥遥领先号基础技能range"] = 0
        end
    end
end
return ____exports
