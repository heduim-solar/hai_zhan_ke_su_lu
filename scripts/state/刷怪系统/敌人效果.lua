local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 11,["25"] = 11,["26"] = 13,["27"] = 13,["28"] = 14,["29"] = 14,["30"] = 15,["31"] = 15,["32"] = 16,["33"] = 16,["34"] = 18,["35"] = 18,["36"] = 18,["38"] = 22,["39"] = 22,["40"] = 22,["41"] = 23,["42"] = 24,["43"] = 25,["44"] = 26,["46"] = 22,["47"] = 22,["48"] = 29,["49"] = 29,["50"] = 29,["51"] = 30,["52"] = 31,["53"] = 32,["54"] = 33,["56"] = 29,["57"] = 29,["58"] = 38,["59"] = 39,["60"] = 40,["61"] = 41,["62"] = 42,["63"] = 43,["64"] = 44,["66"] = 46,["67"] = 47,["68"] = 48,["69"] = 48,["70"] = 48,["71"] = 49,["72"] = 50,["73"] = 50,["74"] = 50,["75"] = 50,["76"] = 50,["77"] = 50,["78"] = 50,["80"] = 52,["81"] = 52,["82"] = 52,["83"] = 52,["84"] = 48,["85"] = 48,["86"] = 48,["89"] = 38,["90"] = 60,["91"] = 62,["92"] = 63,["93"] = 64,["94"] = 65,["95"] = 63,["96"] = 69,["97"] = 70,["98"] = 71,["99"] = 72,["100"] = 73,["102"] = 70,["103"] = 79,["104"] = 80,["105"] = 81,["106"] = 82,["107"] = 83,["109"] = 80,["110"] = 89,["111"] = 89,["112"] = 89,["113"] = 89,["114"] = 89,["115"] = 89,["116"] = 89,["117"] = 98,["118"] = 99,["119"] = 100,["120"] = 99,["121"] = 103,["122"] = 104,["123"] = 105,["124"] = 106,["126"] = 104,["127"] = 112,["128"] = 112,["129"] = 112,["130"] = 112,["131"] = 112,["132"] = 112,["133"] = 112,["134"] = 112,["135"] = 112,["136"] = 121,["137"] = 122,["138"] = 123,["139"] = 124,["142"] = 127,["145"] = 130,["146"] = 131,["147"] = 132,["148"] = 112,["149"] = 112,["150"] = 135,["151"] = 136,["152"] = 137,["153"] = 136,["154"] = 142,["155"] = 142,["156"] = 142,["157"] = 142,["158"] = 142,["159"] = 142,["160"] = 142,["161"] = 152,["162"] = 153,["163"] = 154,["164"] = 154,["165"] = 154,["166"] = 155,["167"] = 155,["168"] = 155,["169"] = 155,["170"] = 155,["171"] = 156,["172"] = 156,["173"] = 156,["174"] = 156,["175"] = 156,["176"] = 156,["177"] = 156,["178"] = 156,["179"] = 156,["180"] = 157,["181"] = 154,["182"] = 154,["183"] = 153,["184"] = 161,["185"] = 162,["186"] = 163,["187"] = 164,["188"] = 165,["189"] = 166,["190"] = 166,["191"] = 166,["192"] = 167,["193"] = 167,["194"] = 167,["195"] = 167,["196"] = 167,["197"] = 167,["198"] = 167,["199"] = 168,["200"] = 166,["201"] = 166,["202"] = 162,["203"] = 21});
local ____exports = {}
local _____5927_89E6_987B = require("xlsx.单位.大触须")
local ____d__5927_89E6_987B = _____5927_89E6_987B["d_大触须"]
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
____exports.default = __TS__Class()
local _____654C_4EBA_6548_679C = ____exports.default
_____654C_4EBA_6548_679C.name = "敌人效果"
function _____654C_4EBA_6548_679C.prototype.____constructor(self)
    se:onEnterRect(
        gg_rct_left_top,
        function(e)
            local trigUnitOwnerId = e.trigUnitOwnerId
            if trigUnitOwnerId > 6 and trigUnitOwnerId < 12 then
                local loc = RectUtil.getRandomDeepWaterXYInRect(gg_rct_right_down)
                IssuePointOrder(e.trigUnit, "patrol", loc.x, loc.y)
            end
        end
    )
    se:onEnterRect(
        gg_rct_right_down,
        function(e)
            local trigUnitOwnerId = e.trigUnitOwnerId
            if trigUnitOwnerId > 6 and trigUnitOwnerId < 12 then
                local loc = RectUtil.getRandomDeepWaterXYInRect(gg_rct_map)
                IssuePointOrder(e.trigUnit, "patrol", loc.x, loc.y)
            end
        end
    )
    se:onUnitDeath(function(e)
        local trigUnitOwnerId = e.trigUnitOwnerId
        if trigUnitOwnerId > 6 and trigUnitOwnerId < 12 then
            local trigUnit = e.trigUnit
            if UnitUtil.isHero(trigUnit) then
                if RandomUtil.isInChance(0.1) then
                    ActorItemUtil:createActorItem("解放之鼓", e.trigUnitX, e.trigUnitY)
                end
                local x = e.trigUnitX
                local y = e.trigUnitY
                BaseUtil.runLater(
                    1,
                    function(count)
                        if count == 3 then
                            CreateUnit(
                                Player(11),
                                ____d__5927_89E6_987B[1].id,
                                x,
                                y,
                                0
                            )
                        end
                        TextTagUtil.textWarn(
                            "大触须" .. tostring(3 - count),
                            trigUnit
                        )
                    end,
                    3
                )
            end
        end
    end)
    local actorUnitType = nil
    actorUnitType = ActorTypeUtil:getActorType("进攻怪-外星堡垒伞兵")
    actorUnitType.onCreated = function(____, actor)
        local au = actor
        au:applyTimedLife(5)
    end
    actorUnitType = ActorTypeUtil:getActorType("进攻怪-海龟")
    actorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.15) then
            event.resultDamage = event.resultDamage + 1000
            UnitStateUtil:stunUnit(enemy, 0.5)
        end
    end
    actorUnitType = ActorTypeUtil:getActorType("进攻怪-触手")
    actorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.2) then
            event.resultDamage = event.resultDamage * 3
            UnitStateUtil:stunUnit(enemy, 1)
        end
    end
    ActorTypeUtil:registerActorType({
        id = "飞蛇怪减速",
        name = "飞蛇怪减速30%",
        icon = "ReplaceableTextures\\CommandButtons\\BTNAntiMagicShell.blp",
        attribute = {move_speed_p = -0.3},
        dur = 2
    })
    actorUnitType = ActorTypeUtil:getActorType("进攻怪-飞蛇")
    actorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        ActorBuffUtil:addActorBuff(enemy, "飞蛇怪减速")
    end
    actorUnitType = ActorTypeUtil:getActorType("进攻怪-深海眷族")
    actorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.2) then
            UnitStateUtil:stunUnit(enemy, 1)
        end
    end
    ActorTypeUtil:registerActorType({
        id = "刺蛇毒素",
        name = "刺蛇毒素",
        describe = "每秒受到刺蛇攻击力x1的真实伤害，可叠加，持续5秒，这个毒素不致死。",
        icon = "ReplaceableTextures\\CommandButtons\\BTNEnvenomedSpear.blp",
        interval = 1,
        model = "Abilities\\Weapons\\PoisonSting\\PoisonStingTarget.mdx",
        dur = 5,
        levelMax = -1,
        onUnitInterval = function(____, actor)
            local actorBuff = actor
            local life = UnitStateUtil:getLife(actorBuff.unit) - 1
            if life <= 0 then
                return
            end
            if not IsHandle(actorBuff.caster) or not UnitStateUtil:isAlive(actorBuff.caster) then
                return
            end
            local damage = UnitStateUtil:getDamageMax(actorBuff.caster) * actorBuff.level
            damage = math.min(damage, life)
            UnitStateUtil:addLife(actorBuff.unit, -damage)
        end
    })
    actorUnitType = ActorTypeUtil:getActorType("进攻怪-刺蛇")
    actorUnitType.onUnitAttackDamageEnemy = function(____, actor, enemy, event)
        ActorBuffUtil:addActorBuff(enemy, "刺蛇毒素", actor.unit)
    end
    ActorTypeUtil:registerActorType({
        id = "黑影瞬移",
        name = "黑影瞬移",
        icon = "ReplaceableTextures\\CommandButtons\\BTNBanish.blp",
        attribute = {attack_p = 1, move_speed_p = 1},
        dur = 3
    })
    actorUnitType = ActorTypeUtil:getActorType("进攻怪-黑影")
    actorUnitType.onUnitDamaged = function(____, actor, enemy, event)
        actor:ifReady(
            5,
            function()
                SetUnitPosition(
                    actor.unit,
                    GetUnitX(enemy),
                    GetUnitY(enemy)
                )
                SetUnitFacing(
                    actor.unit,
                    MathUtil.angleBetweenCoords(
                        actor.unitX,
                        actor.unitY,
                        GetUnitX(enemy),
                        GetUnitY(enemy)
                    )
                )
                ActorBuffUtil:addActorBuff(actor.unit, "黑影瞬移")
            end
        )
    end
    actorUnitType = ActorTypeUtil:getActorType("进攻怪-扭曲体")
    actorUnitType.onUnitDeath = function(____, actor, killingUnit)
        local damage = UnitStateUtil:calculateStateFormula({attack = 10}, actor.unit)
        local x = actor.unitX
        local y = actor.unitY
        BaseUtil.runLater(
            2,
            function(c)
                DamageRecordUtil:damageEnemyUnitsInRange(
                    actor:getName(),
                    actor.unit,
                    600,
                    damage,
                    DamageType["s_真实伤害"]
                )
                EffectUtil:addSpecialEffectAndDestroy("model\\基本技能\\瘟疫号基础技能.mdx", x, y, 1)
            end
        )
    end
end
return ____exports
