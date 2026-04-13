local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 10,["21"] = 10,["22"] = 10,["24"] = 14,["25"] = 16,["26"] = 18,["27"] = 19,["28"] = 20,["29"] = 18,["30"] = 24,["31"] = 25,["32"] = 26,["33"] = 27,["34"] = 29,["35"] = 31,["36"] = 32,["37"] = 33,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 32,["49"] = 44,["50"] = 46,["51"] = 47,["52"] = 48,["53"] = 49,["54"] = 50,["55"] = 51,["56"] = 52,["57"] = 52,["58"] = 52,["59"] = 52,["60"] = 53,["61"] = 53,["63"] = 54,["64"] = 54,["65"] = 54,["66"] = 54,["67"] = 54,["68"] = 54,["69"] = 54,["70"] = 54,["71"] = 54,["72"] = 55,["73"] = 55,["74"] = 55,["75"] = 55,["77"] = 57,["78"] = 46,["79"] = 60,["80"] = 61,["81"] = 62,["82"] = 63,["83"] = 64,["84"] = 65,["85"] = 65,["86"] = 65,["87"] = 65,["90"] = 61,["91"] = 69,["92"] = 70,["93"] = 71,["94"] = 72,["95"] = 73,["98"] = 76,["99"] = 69,["100"] = 13,["101"] = 81,["102"] = 82,["103"] = 82,["104"] = 82,["105"] = 82,["106"] = 82,["107"] = 82,["108"] = 82,["109"] = 82,["110"] = 82,["111"] = 82,["112"] = 82,["113"] = 82,["114"] = 94,["115"] = 95,["116"] = 81});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____UnitRewardUtil = require("solar.solar-common.util.unit.UnitRewardUtil")
local UnitRewardUtil = ____UnitRewardUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____GuardUtil = require("solar.solar-common.util.system.GuardUtil")
local GuardUtil = ____GuardUtil.default
____exports.default = __TS__Class()
local _____4EBA_65CF_5175_8425_53F7_4E3B_70AE = ____exports.default
_____4EBA_65CF_5175_8425_53F7_4E3B_70AE.name = "人族兵营号主炮"
function _____4EBA_65CF_5175_8425_53F7_4E3B_70AE.prototype.____constructor(self)
    local appActorUnitType = nil
    appActorUnitType = ____exports.default:createActorType("骑士", "units\\human\\Knight\\Knight.mdx")
    appActorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        UnitStateUtil:stunUnit(enemy, 0.4)
        event.resultDamage = event.resultDamage + 2000
    end
    appActorUnitType = ____exports.default:createActorType("火枪手", "units\\human\\Rifleman\\Rifleman.mdx")
    appActorUnitType.range = 1200
    appActorUnitType.acquireRange = 1200
    appActorUnitType.damageCd = 0.25
    appActorUnitType = ____exports.default:createActorType("兵营号农民", "units\\human\\Peasant\\Peasant.mdx")
    appActorUnitType.interval = 1
    appActorUnitType.onUnitInterval = function(____, actor)
        TextTagUtil.textGold(
            "+" .. tostring(UnitRewardUtil:addGoldWithEarnGoldP(actor.unit, 100)),
            actor.unit
        )
    end
    --- 射程：200
    -- 伤害：攻击力x1
    -- 射速：0.5
    -- 特殊：召唤3个不可控的无敌单位，分别是
    -- 骑士：攻击100%眩晕0.4秒，且附带2000额外伤害
    -- 火枪手：攻击力/攻速+100%。（远1000射程）
    -- 农民：每秒+100金币。
    local actorType = ActorTypeUtil:getActorType("人族兵营号主炮")
    actorType.onCreated = function(____, actor)
        local zhws = {}
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "骑士", actor.unitX, actor.unitY)
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "火枪手", actor.unitX, actor.unitY)
        zhws[#zhws + 1] = ActorUnitUtil:createActorUnit(actor.unitOwner, "兵营号农民", actor.unitX, actor.unitY)
        for ____, zhw in ipairs(zhws) do
            zhw:set(
                "damage",
                UnitStateUtil:getDamageMax(actor.unit)
            )
            if SetUnitPressUIVisible ~= nil then
                SetUnitPressUIVisible(zhw.unit, false)
            end
            GuardUtil:setGuard(
                zhw.unit,
                actor.unit,
                3,
                600,
                800,
                1500,
                2
            )
            UnitStateUtil:setDamageBase(
                zhw.unit,
                UnitStateUtil:getDamageMax(actor.unit)
            )
        end
        actor.zhws = zhws
    end
    actorType.interval = 3
    actorType.onUnitInterval = function(____, actor)
        local zhws = actor.zhws
        if zhws then
            for ____, zhw in ipairs(zhws) do
                zhw:set(
                    "damage",
                    UnitStateUtil:getDamageMax(actor.unit)
                )
            end
        end
    end
    actorType.onDestroy = function(____, actor)
        local zhws = actor.zhws
        if zhws then
            for ____, zhw in ipairs(zhws) do
                zhw:destroy()
            end
        end
        _____4E3B_70AE_57FA_7840_4E8B_4EF6:onDestroy(actor)
    end
end
function _____4EBA_65CF_5175_8425_53F7_4E3B_70AE.createActorType(self, id, model)
    local actorUnitType = {
        id = id,
        templateType = "远程单位",
        name = id,
        range = 200,
        damageCd = 0.5,
        acquireRange = 1300,
        model = model,
        moveSpeed = 522,
        moveType = "两栖",
        abilities = {"Avul", "Aloc"}
    }
    ActorTypeUtil:registerActorType(actorUnitType)
    return actorUnitType
end
return ____exports
