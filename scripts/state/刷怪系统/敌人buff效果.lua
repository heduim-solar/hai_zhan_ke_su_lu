local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["29"] = 30,["30"] = 31,["31"] = 32,["32"] = 33,["33"] = 33,["34"] = 33,["35"] = 33,["36"] = 33,["37"] = 33,["38"] = 33,["39"] = 32,["40"] = 39,["41"] = 40,["42"] = 41,["45"] = 44,["48"] = 47,["49"] = 48,["52"] = 52,["53"] = 54,["54"] = 54,["55"] = 54,["56"] = 54,["57"] = 54,["58"] = 54,["59"] = 55,["60"] = 56,["61"] = 57,["62"] = 59,["63"] = 59,["64"] = 59,["65"] = 59,["66"] = 59,["67"] = 59,["68"] = 59,["69"] = 60,["70"] = 61,["72"] = 40,["73"] = 65,["74"] = 66,["75"] = 67,["78"] = 70,["81"] = 73,["82"] = 74,["83"] = 75,["84"] = 76,["85"] = 77,["86"] = 78,["87"] = 79,["88"] = 80,["90"] = 84,["91"] = 86,["92"] = 87,["93"] = 88,["94"] = 89,["95"] = 90,["96"] = 91,["99"] = 95,["100"] = 96,["101"] = 97,["102"] = 98,["103"] = 99,["104"] = 101,["105"] = 102,["108"] = 66,["111"] = 26});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
____exports.default = __TS__Class()
local _____654C_4EBAbuff_6548_679C = ____exports.default
_____654C_4EBAbuff_6548_679C.name = "敌人buff效果"
function _____654C_4EBAbuff_6548_679C.prototype.____constructor(self)
    --- 犹格索托斯之力，范围300献祭，1000+最大生命值10%的真实伤害（多个来源可叠加）
    local actorType = ActorTypeUtil:getActorType("犹格索托斯之力")
    actorType.interval = 1
    actorType.onUnitInterval = function(____, actor)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            300,
            {base = 1000, maxHp = 0.1},
            DamageType["s_真实伤害"]
        )
    end
    if settings.gameMode ~= MapModel["模式1_普通模式"] then
        se:onUnitDeath(function(e)
            if e.trigUnitOwnerId < 5 then
                return
            end
            if e.trigUnitOwnerId > 11 then
                return
            end
            local trigUnit = e.trigUnit
            if ActorBuffUtil:isUnitHasActorBuff(trigUnit, "踏尘者寄生") then
                return
            end
            if e.isHeroUnitTrig then
                ReviveHero(
                    trigUnit,
                    GetUnitX(trigUnit),
                    GetUnitY(trigUnit),
                    true
                )
                ActorBuffUtil:addActorBuff(trigUnit, "踏尘者寄生")
                TextTagUtil.textWarn("踏尘者寄生", trigUnit)
            elseif RandomUtil.isInChance(0.1) then
                local newUnit = CreateUnit(
                    e.trigUnitOwner,
                    e.trigUnitTypeIdStr,
                    e.trigUnitX,
                    e.trigUnitY,
                    e.trigUnitFacing
                )
                ActorBuffUtil:addActorBuff(newUnit, "踏尘者寄生")
                TextTagUtil.textWarn("踏尘者寄生", newUnit)
            end
        end)
        if settings.gameDifficulty > 3 then
            se:onUnitEnterMapRect(function(e)
                if e.trigUnitOwnerId < 5 then
                    return
                end
                if e.trigUnitOwnerId > 11 then
                    return
                end
                local trigUnit = e.trigUnit
                if e.isHeroUnitTrig then
                    if RandomUtil.randomBool() then
                        ActorBuffUtil:addActorBuff(trigUnit, "狂风之力")
                        TextTagUtil.textWarn("狂风之力", trigUnit)
                    elseif ObjectTemplateUtil:getTemplateIdleCount("主动11") > 20 then
                        ActorAbilityUtil:createActorAbility("狂风之力主炮", trigUnit)
                        TextTagUtil.textWarn("狂风之力主炮", trigUnit)
                    end
                elseif RandomUtil.isInChance(0.1) then
                    if RandomUtil.randomBool() then
                        ActorBuffUtil:addActorBuff(trigUnit, "狂风之力")
                        TextTagUtil.textWarn("狂风之力", trigUnit)
                    elseif ObjectTemplateUtil:getTemplateIdleCount("主动11") > 20 then
                        ActorAbilityUtil:createActorAbility("狂风之力主炮", trigUnit)
                        TextTagUtil.textWarn("狂风之力主炮", trigUnit)
                    end
                end
                if settings.gameDifficulty > 6 then
                    if e.isHeroUnitTrig then
                        ActorBuffUtil:addActorBuff(trigUnit, "犹格索托斯之力")
                        TextTagUtil.textWarn("犹格索托斯之力", trigUnit)
                    elseif RandomUtil.isInChance(0.1) then
                        ActorBuffUtil:addActorBuff(trigUnit, "犹格索托斯之力")
                        TextTagUtil.textWarn("犹格索托斯之力", trigUnit)
                    end
                end
            end)
        end
    end
end
return ____exports
