local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 6,["13"] = 6,["14"] = 7,["15"] = 7,["16"] = 8,["17"] = 8,["18"] = 10,["19"] = 10,["20"] = 11,["21"] = 11,["22"] = 12,["23"] = 12,["24"] = 13,["25"] = 13,["26"] = 14,["27"] = 14,["28"] = 15,["29"] = 15,["30"] = 16,["31"] = 16,["32"] = 18,["33"] = 18,["34"] = 18,["36"] = 22,["37"] = 28,["38"] = 29,["39"] = 30,["40"] = 31,["41"] = 32,["42"] = 33,["43"] = 34,["44"] = 35,["46"] = 30,["47"] = 29,["48"] = 40,["49"] = 41,["50"] = 42,["51"] = 43,["52"] = 44,["53"] = 45,["55"] = 42,["56"] = 49,["57"] = 50,["58"] = 51,["59"] = 52,["60"] = 53,["61"] = 54,["62"] = 55,["64"] = 50,["66"] = 40,["67"] = 66,["68"] = 67,["69"] = 68,["71"] = 68,["72"] = 68,["74"] = 68,["75"] = 69,["76"] = 70,["77"] = 71,["79"] = 67,["80"] = 77,["81"] = 78,["82"] = 79,["83"] = 80,["84"] = 81,["85"] = 82,["86"] = 83,["87"] = 84,["89"] = 86,["90"] = 87,["91"] = 88,["92"] = 89,["93"] = 90,["96"] = 79,["97"] = 94,["98"] = 95,["99"] = 96,["100"] = 97,["102"] = 99,["103"] = 101,["104"] = 103,["105"] = 106,["106"] = 107,["107"] = 108,["108"] = 109,["109"] = 110,["110"] = 110,["111"] = 110,["112"] = 110,["113"] = 110,["114"] = 110,["115"] = 110,["116"] = 110,["117"] = 110,["118"] = 112,["119"] = 113,["120"] = 114,["121"] = 115,["122"] = 115,["123"] = 115,["124"] = 115,["125"] = 115,["126"] = 115,["127"] = 115,["128"] = 115,["129"] = 115,["130"] = 117,["131"] = 118,["132"] = 119,["133"] = 120,["134"] = 120,["135"] = 120,["136"] = 120,["137"] = 120,["138"] = 120,["139"] = 120,["140"] = 120,["141"] = 120,["143"] = 94,["144"] = 21});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_6280_80FD5 = ____exports.default
_____8239_57FA_7840_6280_80FD5.name = "船基础技能5"
function _____8239_57FA_7840_6280_80FD5.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("团结号基础技能")
    actorType.onCreated = function(____, actor)
        PlayerUtil:forUsers(function(____, player)
            if sd(nil, player)["团结号基础技能加成"] ~= true then
                local playerAttribute = AttributeUtil:getPlayerAttribute(player, true)
                playerAttribute.damage_increased = (playerAttribute.damage_increased or 0) + 0.5
                playerAttribute.damage_reduction = (playerAttribute.damage_increased or 0) + 0.1
                sd(nil, player)["团结号基础技能加成"] = true
            end
        end)
    end
    actorType.onDestroy = function(____, actor)
        local hasAbili = false
        PlayerUtil:forUsers(function(____, player)
            local hero = PlayerUtil:getHero(player)
            if ActorUtil:isUnitHasActor(hero, "团结号基础技能") then
                hasAbili = true
            end
        end)
        if hasAbili == false then
            PlayerUtil:forUsers(function(____, player)
                if sd(nil, player)["团结号基础技能加成"] == true then
                    local playerAttribute = AttributeUtil:getPlayerAttribute(player, true)
                    playerAttribute.damage_increased = (playerAttribute.damage_increased or 0) - 0.5
                    playerAttribute.damage_reduction = (playerAttribute.damage_increased or 0) - 0.1
                    sd(nil, player)["团结号基础技能加成"] = false
                end
            end)
        end
    end
    actorType = ActorTypeUtil:getActorType("萧炎号基础技能")
    actorType.onCreated = function(____, actor)
        local ____temp_2 = actor.unitLevel >= 10
        if ____temp_2 then
            local ____opt_0 = DataBase:getPlayerSolarData(actor.unitOwner, false)
            ____temp_2 = (____opt_0 and ____opt_0["萧炎号基础技能属性翻倍"]) == nil
        end
        if ____temp_2 then
            DataBase:getPlayerSolarData(actor.unitOwner, true)["萧炎号基础技能属性翻倍"] = true
            HeroUtil:addHeroPropertyP(actor.unit, false, 1)
            TextTagUtil.textWarn("属性翻倍!", actor.unit)
        end
    end
    actorType = ActorTypeUtil:getActorType("练习生基础技能")
    actorType.interval = 0.05
    actorType.onUnitChange = function(____, actor, unit)
        if IsHandle(unit) then
            local modelPath = "单位\\练习生\\篮球.mdx"
            actor.effect = EffectUtil:addSpecialEffect(modelPath, actor.unitX, actor.unitY)
            actor.effect2 = EffectUtil:addSpecialEffect(modelPath, actor.unitX, actor.unitY)
            actor.effect3 = EffectUtil:addSpecialEffect(modelPath, actor.unitX, actor.unitY)
        else
            if actor.effect ~= nil then
                EffectUtil:destroyEffectNoDeathAnim(actor.effect)
                EffectUtil:destroyEffectNoDeathAnim(actor.effect2)
                EffectUtil:destroyEffectNoDeathAnim(actor.effect3)
                actor.effect = nil
            end
        end
    end
    actorType.onUnitInterval = function(____, actor)
        actor.aface = (actor.aface or 0) + 8
        if actor.aface <= -360 then
            actor.aface = 0
        end
        if actor.effect then
            local damage = UnitStateUtil:calculateStateFormula({agi = 1}, actor.unit)
            local loc = nil
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface)
            EXSetEffectXY(actor.effect, loc.x, loc.y)
            local gd = GameUtil:getTerrainHeight(loc.x, loc.y) + 50
            EXSetEffectZ(actor.effect, gd)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                200,
                damage,
                DamageType["s_物理"],
                loc.x,
                loc.y
            )
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + 120)
            EXSetEffectXY(actor.effect2, loc.x, loc.y)
            EXSetEffectZ(actor.effect2, gd)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                200,
                damage,
                DamageType["s_物理"],
                loc.x,
                loc.y
            )
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + 240)
            EXSetEffectXY(actor.effect3, loc.x, loc.y)
            EXSetEffectZ(actor.effect3, gd)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                200,
                damage,
                DamageType["s_物理"],
                loc.x,
                loc.y
            )
        end
    end
end
return ____exports
