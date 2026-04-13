local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 15,["33"] = 15,["34"] = 15,["51"] = 38,["52"] = 39,["53"] = 40,["54"] = 39,["55"] = 44,["56"] = 46,["57"] = 48,["59"] = 49,["60"] = 49,["61"] = 51,["62"] = 52,["63"] = 52,["64"] = 52,["65"] = 52,["66"] = 52,["67"] = 52,["68"] = 52,["69"] = 49,["72"] = 48,["74"] = 59,["75"] = 61,["76"] = 62,["77"] = 62,["78"] = 62,["79"] = 63,["80"] = 63,["81"] = 63,["82"] = 63,["83"] = 63,["84"] = 63,["85"] = 63,["86"] = 63,["87"] = 64,["88"] = 63,["89"] = 63,["90"] = 66,["91"] = 62,["92"] = 62,["94"] = 59,["95"] = 71,["96"] = 72,["97"] = 73,["98"] = 74,["99"] = 74,["100"] = 74,["101"] = 74,["102"] = 74,["103"] = 74,["104"] = 75,["105"] = 76,["107"] = 72,["109"] = 81,["110"] = 83,["111"] = 84,["112"] = 84,["113"] = 84,["114"] = 85,["115"] = 85,["116"] = 85,["117"] = 86,["118"] = 87,["119"] = 88,["120"] = 89,["121"] = 89,["122"] = 89,["123"] = 89,["124"] = 89,["125"] = 89,["126"] = 89,["127"] = 91,["128"] = 91,["129"] = 91,["130"] = 91,["131"] = 91,["132"] = 91,["133"] = 91,["134"] = 94,["135"] = 94,["136"] = 94,["137"] = 94,["138"] = 95,["139"] = 94,["140"] = 94,["142"] = 98,["143"] = 98,["144"] = 98,["145"] = 98,["146"] = 85,["147"] = 85,["148"] = 85,["149"] = 84,["150"] = 84,["151"] = 84,["152"] = 102,["153"] = 104,["154"] = 104,["155"] = 104,["156"] = 105,["157"] = 106,["158"] = 108,["159"] = 108,["160"] = 108,["161"] = 108,["162"] = 108,["163"] = 108,["164"] = 108,["165"] = 110,["166"] = 110,["167"] = 110,["168"] = 110,["169"] = 111,["170"] = 110,["171"] = 110,["172"] = 113,["173"] = 113,["174"] = 113,["175"] = 114,["176"] = 114,["177"] = 114,["178"] = 114,["179"] = 115,["180"] = 116,["181"] = 117,["182"] = 118,["183"] = 119,["184"] = 114,["185"] = 114,["186"] = 113,["187"] = 113,["188"] = 113,["189"] = 124,["190"] = 104,["191"] = 104,["192"] = 104,["194"] = 83,["196"] = 18});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____LeapUtil = require("solar.solar-common.util.math.LeapUtil")
local LeapUtil = ____LeapUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____JumpUtil = require("solar.solar-common.util.action.JumpUtil")
local JumpUtil = ____JumpUtil.default
____exports.default = __TS__Class()
local ____Boss_514B_82CF_9C81_6280_80FD = ____exports.default
____Boss_514B_82CF_9C81_6280_80FD.name = "Boss克苏鲁技能"
function ____Boss_514B_82CF_9C81_6280_80FD.prototype.____constructor(self)
    --- 最终BOSS-4~6，
    -- 主炮：
    -- 射程：600
    -- 伤害：攻击力x0.5
    -- 射速：1
    -- 特殊：减少目标10点护甲，可持续叠加。
    -- 技能1：初始在身边围了一圈超级红色触手。
    -- 生命值：500000
    -- 护甲：50
    -- 攻击力：20000（0.5秒一次，400射程）
    -- 移速：0
    -- 技能2：跟踪小触手，在目标身上附着12个小触手，小触手攻击1次就死亡，小触手每次攻击会对目标造成最大生命值3%的真实伤害。
    -- 技能3：击飞，克苏鲁的普通攻击有10%概率把目标击飞到地图边角并眩晕5秒。
    -- 技能4：潮汐大触手版，当血量低于50%开始释放，预警2秒，对1200范围放个触手深处，击飞+眩晕2秒，攻击力x3的伤害。（冷却15秒）
    -- 技能5：大漩涡，生命值低于10%时候召唤一个大漩涡，在大漩涡附近无法使用T，且会不断被500移速的速度牵引至BOSS身边。
    local actorUnitType = ActorTypeUtil:getActorType("跟踪小触手单位")
    actorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        UnitStateUtil:addUnitLifeByMaxLifeP(enemy, -0.03)
    end
    local actorType = ActorTypeUtil:getActorType("拉莱耶之主-伟大的克苏鲁")
    if gv.bossAbilityLimit >= 1 then
        actorType.onCreated = function(____, actor)
            do
                local i = 0
                while i < 9 do
                    local nv = MathUtil.polarProjection(actor.unitX, actor.unitY, 600, 40 * i)
                    ActorUnitUtil:createActorUnit(
                        actor.unitOwner,
                        "超级触手",
                        nv.x,
                        nv.y,
                        40 * i
                    )
                    i = i + 1
                end
            end
        end
    end
    actorType.onUnitDamaged = function(____, actor, damageSource, event)
        if gv.bossAbilityLimit >= 2 then
            actor:ifReady(
                30,
                function()
                    ActorUnitUtil:createActorUnit(
                        actor.unitOwner,
                        "超级触手",
                        GetUnitX(damageSource),
                        GetUnitY(damageSource),
                        0,
                        12,
                        function(____, au)
                            UnitStateUtil:orderAttackTarget(au.unit, actor.unit)
                        end
                    )
                    TextTagUtil.textWarn("跟踪触手", actor.unit)
                end
            )
        end
    end
    if gv.bossAbilityLimit >= 3 then
        actorType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
            if RandomUtil.isInChance(0.1) then
                local angle = MathUtil.angleBetweenCoords(
                    actor.unitX,
                    actor.unitY,
                    GetUnitX(enemy),
                    GetUnitY(enemy)
                )
                LeapUtil.infiniteLeap(enemy, angle, 1000, true)
                TextTagUtil.textWarn("击飞", actor.unit)
            end
        end
    end
    if gv.bossAbilityLimit >= 4 then
        actorType.onUnitDamaged = function(____, actor, enemy, event)
            actor:ifReady(
                15,
                function()
                    BaseUtil.runLater(
                        1,
                        function(c)
                            if c == 3 then
                                local x = GetUnitX(actor.unit)
                                local y = GetUnitY(actor.unit)
                                EffectUtil:addSpecialEffectAndDestroy(
                                    "model\\进攻怪\\大触手.mdx",
                                    x,
                                    y,
                                    5,
                                    1
                                )
                                DamageRecordUtil:damageEnemyUnitsInRange(
                                    actor:getName(),
                                    actor.unit,
                                    1200,
                                    {attack = 3},
                                    DamageType["s_法术"]
                                )
                                SelectUtil.forEnemyUnitsInRange(
                                    actor.unit,
                                    1200,
                                    function(____, u)
                                        JumpUtil:strikeFly(u, 2)
                                    end
                                )
                            end
                            TextTagUtil.textWarn(
                                "大触手" .. tostring(3 - c),
                                actor.unit
                            )
                        end,
                        3
                    )
                end,
                "大触手"
            )
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
end
return ____exports
