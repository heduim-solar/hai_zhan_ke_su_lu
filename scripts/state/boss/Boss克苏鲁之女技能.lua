local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 15,["33"] = 15,["34"] = 15,["36"] = 38,["37"] = 38,["38"] = 38,["39"] = 38,["40"] = 38,["41"] = 38,["42"] = 38,["43"] = 48,["44"] = 50,["45"] = 52,["46"] = 53,["47"] = 53,["48"] = 53,["49"] = 54,["50"] = 54,["51"] = 54,["52"] = 54,["53"] = 54,["54"] = 54,["55"] = 54,["56"] = 55,["57"] = 56,["58"] = 54,["59"] = 54,["60"] = 53,["61"] = 53,["62"] = 53,["64"] = 61,["65"] = 63,["66"] = 63,["67"] = 63,["68"] = 64,["69"] = 64,["70"] = 64,["71"] = 65,["72"] = 66,["74"] = 67,["75"] = 67,["76"] = 68,["77"] = 68,["78"] = 68,["79"] = 68,["80"] = 68,["81"] = 68,["82"] = 68,["83"] = 68,["84"] = 68,["85"] = 68,["86"] = 69,["87"] = 70,["88"] = 68,["89"] = 68,["90"] = 67,["94"] = 74,["95"] = 74,["96"] = 74,["97"] = 74,["98"] = 64,["99"] = 64,["100"] = 64,["101"] = 63,["102"] = 63,["103"] = 63,["105"] = 79,["106"] = 81,["107"] = 81,["108"] = 81,["109"] = 82,["110"] = 82,["111"] = 82,["112"] = 83,["113"] = 84,["114"] = 85,["115"] = 86,["116"] = 86,["117"] = 86,["118"] = 86,["119"] = 86,["120"] = 86,["121"] = 86,["122"] = 88,["123"] = 88,["124"] = 88,["125"] = 88,["126"] = 88,["127"] = 88,["128"] = 88,["129"] = 91,["130"] = 91,["131"] = 91,["132"] = 91,["133"] = 92,["134"] = 91,["135"] = 91,["137"] = 95,["138"] = 95,["139"] = 95,["140"] = 95,["141"] = 82,["142"] = 82,["143"] = 82,["144"] = 81,["145"] = 81,["146"] = 81,["148"] = 50,["149"] = 101,["150"] = 102,["151"] = 103,["152"] = 104,["153"] = 104,["154"] = 104,["155"] = 104,["156"] = 105,["157"] = 104,["158"] = 104,["159"] = 103,["161"] = 112,["162"] = 114,["164"] = 115,["165"] = 115,["166"] = 117,["167"] = 118,["168"] = 118,["169"] = 118,["170"] = 118,["171"] = 118,["172"] = 118,["173"] = 118,["174"] = 115,["177"] = 114,["179"] = 18});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____LeapUtil = require("solar.solar-common.util.math.LeapUtil")
local LeapUtil = ____LeapUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____JumpUtil = require("solar.solar-common.util.action.JumpUtil")
local JumpUtil = ____JumpUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
____exports.default = __TS__Class()
local ____Boss_514B_82CF_9C81_4E4B_5973_6280_80FD = ____exports.default
____Boss_514B_82CF_9C81_4E4B_5973_6280_80FD.name = "Boss克苏鲁之女技能"
function ____Boss_514B_82CF_9C81_4E4B_5973_6280_80FD.prototype.____constructor(self)
    ActorTypeUtil:registerActorType({
        id = "克希拉减速光环",
        name = "克希拉减速光环",
        icon = "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
        attribute = {move_speed_p = -0.8},
        dur = 3
    })
    local actorType = ActorTypeUtil:getActorType("克苏鲁之女-克希拉")
    actorType.onUnitDamaged = function(____, actor, damageSource, event)
        if gv.bossAbilityLimit >= 1 then
            actor:ifReady(
                30,
                function()
                    ActorUnitUtil:createActorUnit(
                        actor.unitOwner,
                        "克希拉护卫舰",
                        actor.unitX,
                        actor.unitY,
                        0,
                        12,
                        function(____, actorUnit)
                            actorUnit:applyTimedLife(20)
                        end
                    )
                end,
                "召唤护卫舰"
            )
        end
        if gv.bossAbilityLimit >= 2 then
            actor:ifReady(
                10,
                function()
                    BaseUtil.runLater(
                        1,
                        function(c)
                            if c == 3 then
                                local damage = UnitStateUtil:calculateStateFormula({attack = 3}, actor.unit)
                                do
                                    local i = 0
                                    while i < 8 do
                                        LeapUtil.leap(
                                            actor.unit,
                                            60 * i,
                                            1000,
                                            2,
                                            damage,
                                            DamageType["s_法术"],
                                            "model\\特效\\龙卷风.mdx",
                                            actor.unitX,
                                            actor.unitY,
                                            function(____, enemy)
                                                JumpUtil:strikeFly(enemy, 2)
                                            end
                                        )
                                        i = i + 1
                                    end
                                end
                            end
                            TextTagUtil.textWarn(
                                "龙卷风" .. tostring(3 - c),
                                actor.unit
                            )
                        end,
                        3
                    )
                end,
                "龙卷风"
            )
        end
        if gv.bossAbilityLimit >= 3 and UnitStateUtil:getUnitLifeP(actor.unit) < 0.5 then
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
                                    "model\\特效\\水漩涡.mdx",
                                    x,
                                    y,
                                    1.2,
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
                                "潮汐" .. tostring(3 - c),
                                actor.unit
                            )
                        end,
                        3
                    )
                end,
                "大潮汐"
            )
        end
    end
    if gv.bossAbilityLimit >= 4 then
        actorType.interval = 2
        actorType.onUnitInterval = function(____, actor)
            SelectUtil.forEnemyUnitsInRange(
                actor.unit,
                600,
                function(____, u)
                    ActorBuffUtil:addActorBuff(u, "克希拉减速光环")
                end
            )
        end
    end
    if gv.bossAbilityLimit >= 5 then
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
end
return ____exports
