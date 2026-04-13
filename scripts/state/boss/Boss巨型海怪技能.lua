local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 14,["31"] = 14,["32"] = 14,["34"] = 35,["35"] = 35,["36"] = 35,["37"] = 35,["38"] = 35,["39"] = 42,["40"] = 43,["41"] = 35,["42"] = 45,["43"] = 46,["44"] = 35,["45"] = 35,["46"] = 51,["47"] = 53,["48"] = 54,["49"] = 55,["50"] = 56,["53"] = 53,["54"] = 61,["55"] = 62,["56"] = 63,["57"] = 64,["59"] = 62,["60"] = 68,["61"] = 70,["62"] = 71,["64"] = 74,["65"] = 75,["66"] = 75,["67"] = 75,["68"] = 76,["69"] = 76,["70"] = 76,["71"] = 77,["72"] = 78,["73"] = 79,["74"] = 80,["75"] = 81,["76"] = 81,["77"] = 81,["78"] = 81,["79"] = 81,["80"] = 81,["81"] = 81,["82"] = 81,["83"] = 81,["84"] = 82,["85"] = 84,["86"] = 84,["87"] = 84,["88"] = 84,["89"] = 85,["90"] = 86,["91"] = 87,["92"] = 87,["93"] = 87,["94"] = 87,["95"] = 87,["96"] = 87,["97"] = 88,["98"] = 84,["99"] = 84,["100"] = 90,["102"] = 92,["103"] = 92,["104"] = 92,["105"] = 92,["106"] = 93,["107"] = 76,["108"] = 76,["109"] = 75,["110"] = 75,["111"] = 75,["112"] = 97,["113"] = 97,["114"] = 97,["115"] = 98,["116"] = 99,["117"] = 100,["118"] = 101,["119"] = 102,["120"] = 102,["121"] = 102,["122"] = 103,["123"] = 104,["124"] = 105,["126"] = 107,["127"] = 108,["128"] = 109,["129"] = 110,["130"] = 111,["131"] = 112,["132"] = 113,["133"] = 114,["135"] = 116,["136"] = 116,["137"] = 116,["138"] = 116,["139"] = 116,["140"] = 117,["141"] = 102,["142"] = 102,["143"] = 97,["144"] = 97,["145"] = 97,["147"] = 124,["148"] = 126,["149"] = 126,["150"] = 126,["151"] = 127,["152"] = 128,["153"] = 130,["154"] = 130,["155"] = 130,["156"] = 130,["157"] = 130,["158"] = 130,["159"] = 130,["160"] = 132,["161"] = 132,["162"] = 132,["163"] = 132,["164"] = 133,["165"] = 132,["166"] = 132,["167"] = 135,["168"] = 135,["169"] = 135,["170"] = 136,["171"] = 136,["172"] = 136,["173"] = 136,["174"] = 137,["175"] = 138,["176"] = 139,["177"] = 140,["178"] = 141,["179"] = 136,["180"] = 136,["181"] = 135,["182"] = 135,["183"] = 135,["184"] = 146,["185"] = 126,["186"] = 126,["187"] = 126,["189"] = 68,["190"] = 17});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____JumpUtil = require("solar.solar-common.util.action.JumpUtil")
local JumpUtil = ____JumpUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
____exports.default = __TS__Class()
local ____Boss_5DE8_578B_6D77_602A_6280_80FD = ____exports.default
____Boss_5DE8_578B_6D77_602A_6280_80FD.name = "Boss巨型海怪技能"
function ____Boss_5DE8_578B_6D77_602A_6280_80FD.prototype.____constructor(self)
    ActorTypeUtil:registerActorType({
        id = "巨型海怪潜水减甲",
        name = "减甲",
        attribute = {def = -500},
        dur = 5,
        onCreated = function(____, actor)
            UnitStateUtil:setInvulnerable(actor.unit, true)
        end,
        onDestroy = function(____, actor)
            UnitStateUtil:setInvulnerable(actor.unit, false)
        end
    })
    local actorType = ActorTypeUtil:getActorType("巨型海怪")
    actorType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        if gv.bossAbilityLimit >= 1 then
            if RandomUtil.isInChance(0.25) then
                UnitStateUtil:stunUnit(enemy, 1)
            end
        end
    end
    actorType.interval = 2
    actorType.onUnitInterval = function(____, actor)
        if gv.bossAbilityLimit >= 2 then
            ActorBuffUtil:clearUnitActorBuffs(actor.unit, true)
        end
    end
    actorType.onUnitDamaged = function(____, actor, enemy, event)
        if gv.bossAbilityLimit >= 2 then
            event.resultDamage = event.resultDamage * 0.5
        end
        if gv.bossAbilityLimit >= 3 and UnitStateUtil:getUnitLifeP(actor.unit) < 0.5 then
            actor:ifReady(
                15,
                function()
                    BaseUtil.onTimer(
                        1,
                        function(____, count)
                            if count >= 3 then
                                local damage = UnitStateUtil:calculateStateFormula({attack = 3}, actor.unit)
                                local x = actor.unitX
                                local y = actor.unitY
                                DamageRecordUtil:damageEnemyUnitsInRange(
                                    actor:getName(),
                                    actor.unit,
                                    1200,
                                    damage,
                                    DamageType["s_物理"],
                                    x,
                                    y
                                )
                                EffectUtil:addSpecialEffectAndDestroy("圆形范围伤害特效\\devilslam.mdx", x, y, 2.5)
                                SelectUtil.forEnemyUnitsInRange(
                                    actor.unit,
                                    1200,
                                    function(____, unit)
                                        local enemyX = GetUnitX(enemy)
                                        local enemyY = GetUnitY(enemy)
                                        local pv = MathUtil.polarProjection(
                                            enemyX,
                                            enemyY,
                                            200,
                                            MathUtil.angleBetweenCoords(x, y, enemyX, enemyY)
                                        )
                                        JumpUtil:jump(enemy, pv.x, pv.y, 300)
                                    end
                                )
                                return false
                            end
                            TextTagUtil.textWarn(
                                "潮汐" .. tostring(3 - count),
                                actor.unit
                            )
                            return true
                        end
                    )
                end,
                "潮汐大"
            )
            actor:ifReady(
                30,
                function()
                    TextTagUtil.textWarn("潜水", actor.unit)
                    local oldFlyHeight = actor:get("flyHeight", 0)
                    actor:set("flyHeight", oldFlyHeight - 200)
                    local target = enemy
                    BaseUtil.onTimer(
                        1,
                        function(____, count)
                            if count > 5 then
                                actor:set("flyHeight", oldFlyHeight)
                                return false
                            end
                            local x = GetUnitX(target)
                            local y = GetUnitY(target)
                            if MathUtil.distanceBetweenPoints(x, y, actor.unitX, actor.unitY) < 128 then
                                TextTagUtil.textWarn("追踪到你了", actor.unit)
                                UnitStateUtil:stunUnit(target, 1)
                                ActorBuffUtil:addActorBuff(target, "巨型海怪潜水减甲")
                                actor:set("flyHeight", oldFlyHeight)
                                return false
                            end
                            UnitStateUtil:orderMove(
                                actor.unit,
                                GetUnitX(target),
                                GetUnitY(target)
                            )
                            return true
                        end
                    )
                end,
                "潜水"
            )
        end
        if gv.bossAbilityLimit >= 5 and UnitStateUtil:getUnitLifeP(actor.unit) < 0.1 then
            actor:ifReady(
                100,
                function()
                    local x = GetUnitX(actor.unit)
                    local y = GetUnitY(actor.unit)
                    EffectUtil:addSpecialEffectAndDestroy(
                        "model\\特效\\水漩涡.mdx",
                        x,
                        y,
                        1.2,
                        3
                    )
                    SelectUtil.forEnemyUnitsInRange(
                        actor.unit,
                        1200,
                        function(____, u)
                            UnitStateUtil:stunUnit(u, 3)
                        end
                    )
                    BaseUtil.runLater(
                        0.05,
                        function()
                            SelectUtil.forEnemyUnitsInRange(
                                actor.unit,
                                1200,
                                function(____, u)
                                    local tempX = GetUnitX(u)
                                    local tempY = GetUnitY(u)
                                    local jd = MathUtil.angleBetweenCoords(tempX, tempY, x, y)
                                    local nv = MathUtil.polarProjection(tempX, tempY, 20, jd)
                                    SetUnitPosition(u, nv.x, nv.y)
                                end
                            )
                        end,
                        60
                    )
                    TextTagUtil.textWarn("大漩涡", actor.unit)
                end,
                "大漩涡"
            )
        end
    end
end
return ____exports
