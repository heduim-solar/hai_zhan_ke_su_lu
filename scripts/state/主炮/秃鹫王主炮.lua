local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 9,["19"] = 9,["20"] = 10,["21"] = 10,["22"] = 12,["23"] = 12,["24"] = 12,["30"] = 23,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 28,["37"] = 30,["40"] = 24,["41"] = 40,["42"] = 41,["43"] = 42,["45"] = 43,["46"] = 43,["47"] = 44,["48"] = 43,["51"] = 47,["52"] = 47,["53"] = 47,["54"] = 48,["55"] = 49,["56"] = 50,["57"] = 50,["58"] = 50,["59"] = 50,["61"] = 52,["62"] = 47,["63"] = 47,["64"] = 41,["65"] = 55,["66"] = 56,["67"] = 57,["68"] = 58,["70"] = 58,["74"] = 61,["75"] = 62,["76"] = 63,["77"] = 56,["78"] = 65,["79"] = 66,["81"] = 66,["83"] = 67,["84"] = 68,["85"] = 69,["87"] = 71,["88"] = 65,["89"] = 15,["90"] = 76,["91"] = 77,["92"] = 77,["93"] = 77,["94"] = 77,["95"] = 77,["96"] = 77,["97"] = 77,["98"] = 79,["99"] = 80,["100"] = 81,["101"] = 82,["102"] = 82,["104"] = 84,["105"] = 84,["106"] = 84,["107"] = 84,["108"] = 84,["109"] = 84,["110"] = 84,["111"] = 84,["112"] = 84,["113"] = 85,["114"] = 85,["115"] = 85,["116"] = 85,["117"] = 86,["118"] = 87,["120"] = 89,["121"] = 90,["122"] = 91,["123"] = 76});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____79C3_9E6B = require("xlsx.单位.秃鹫")
local ____d__79C3_9E6B = _____79C3_9E6B["d_秃鹫"]
local ____GuardUtil = require("solar.solar-common.util.system.GuardUtil")
local GuardUtil = ____GuardUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
____exports.default = __TS__Class()
local _____79C3_9E6B_738B_4E3B_70AE = ____exports.default
_____79C3_9E6B_738B_4E3B_70AE.name = "秃鹫王主炮"
function _____79C3_9E6B_738B_4E3B_70AE.prototype.____constructor(self)
    --- 射程：200
    -- 伤害：攻击力x1（2）
    -- 射速：0.5
    -- 特殊：秃鹫会自动索敌，但离开秃鹫1000范围会被召回。
    local actorType = ActorTypeUtil:getActorType("秃鹫王")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local aController = actor.autoMissileAttackController
        if aController then
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                aController.damageStateFormula = {attack = 2}
            else
                aController.damageStateFormula = {attack = 1}
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("秃鹫王基础技能")
    actorType.onCreated = function(____, actor)
        actor["秃鹫数量"] = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 6 or 4
        do
            local i = 0
            while i < actor["秃鹫数量"] do
                ____exports.default["创建秃鹫"](____exports.default, actor.unit, actor)
                i = i + 1
            end
        end
        actor["秃鹫攻击刷新计时器"] = BaseUtil.onTimer(
            5,
            function(____, count)
                local us = actor["秃鹫数组"]
                for ____, u in ipairs(us) do
                    UnitStateUtil:setDamageBase(
                        u,
                        UnitStateUtil:getDamageMax(actor.unit)
                    )
                end
                return true
            end
        )
    end
    actorType.interval = 180
    actorType.onUnitInterval = function(____, actor)
        if actor["秃鹫数量"] >= 12 then
            local ____opt_0 = actor.sTimer
            if ____opt_0 ~= nil then
                ____opt_0:destroy()
            end
            return
        end
        TextTagUtil.text("秃鹫来了", actor.unit)
        ____exports.default["创建秃鹫"](____exports.default, actor.unit, actor)
        actor["秃鹫数量"] = actor["秃鹫数量"] + 1
    end
    actorType.onDestroy = function(____, actor)
        local ____opt_2 = actor["秃鹫攻击刷新计时器"]
        if ____opt_2 ~= nil then
            ____opt_2:destroy()
        end
        local us = actor["秃鹫数组"]
        for ____, u in ipairs(us) do
            RemoveUnit(u)
        end
        actor["秃鹫数组"] = nil
    end
end
_____79C3_9E6B_738B_4E3B_70AE["创建秃鹫"] = function(self, u, actor)
    local pet = CreateUnit(
        GetOwningPlayer(u),
        ____d__79C3_9E6B[1].id,
        GetUnitX(u),
        GetUnitY(u),
        0
    )
    UnitAddAbility(pet, "Avul")
    UnitAddAbility(pet, "Aloc")
    UnitStateUtil:setDamageRange(pet, 200)
    if SetUnitPressUIVisible ~= nil then
        SetUnitPressUIVisible(pet, false)
    end
    GuardUtil:setGuard(
        pet,
        u,
        3,
        600,
        800,
        1500,
        5
    )
    UnitStateUtil:setDamageBase(
        pet,
        UnitStateUtil:getDamageMax(actor.unit)
    )
    if actor["秃鹫数组"] == nil then
        actor["秃鹫数组"] = {}
    end
    local us = actor["秃鹫数组"]
    us[#us + 1] = pet
    return pet
end
return ____exports
