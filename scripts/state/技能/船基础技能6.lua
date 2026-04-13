local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 14,["33"] = 14,["34"] = 15,["35"] = 15,["36"] = 18,["37"] = 18,["38"] = 18,["40"] = 22,["41"] = 27,["42"] = 28,["43"] = 29,["44"] = 30,["45"] = 30,["46"] = 30,["47"] = 30,["48"] = 31,["49"] = 32,["50"] = 33,["52"] = 30,["53"] = 30,["54"] = 30,["55"] = 30,["56"] = 36,["57"] = 37,["58"] = 38,["59"] = 39,["60"] = 39,["61"] = 39,["62"] = 39,["63"] = 28,["64"] = 45,["65"] = 46,["66"] = 47,["67"] = 48,["68"] = 49,["69"] = 50,["70"] = 51,["71"] = 52,["73"] = 54,["74"] = 55,["75"] = 56,["76"] = 57,["77"] = 58,["80"] = 47,["81"] = 62,["82"] = 63,["83"] = 64,["84"] = 65,["86"] = 67,["87"] = 69,["88"] = 71,["89"] = 74,["90"] = 75,["91"] = 76,["92"] = 77,["93"] = 78,["94"] = 78,["95"] = 78,["96"] = 78,["97"] = 78,["98"] = 78,["99"] = 78,["100"] = 78,["101"] = 78,["102"] = 79,["103"] = 79,["104"] = 79,["105"] = 79,["106"] = 80,["107"] = 79,["108"] = 79,["109"] = 79,["110"] = 79,["111"] = 83,["112"] = 84,["113"] = 85,["114"] = 86,["115"] = 86,["116"] = 86,["117"] = 86,["118"] = 86,["119"] = 86,["120"] = 86,["121"] = 86,["122"] = 86,["123"] = 87,["124"] = 87,["125"] = 87,["126"] = 87,["127"] = 88,["128"] = 87,["129"] = 87,["130"] = 87,["131"] = 87,["132"] = 91,["133"] = 92,["134"] = 93,["135"] = 94,["136"] = 94,["137"] = 94,["138"] = 94,["139"] = 94,["140"] = 94,["141"] = 94,["142"] = 94,["143"] = 94,["144"] = 95,["145"] = 95,["146"] = 95,["147"] = 95,["148"] = 96,["149"] = 95,["150"] = 95,["151"] = 95,["152"] = 95,["154"] = 62,["155"] = 115,["156"] = 116,["157"] = 117,["158"] = 118,["159"] = 119,["160"] = 120,["161"] = 121,["162"] = 122,["163"] = 123,["164"] = 124,["165"] = 125,["166"] = 125,["167"] = 125,["168"] = 125,["169"] = 125,["170"] = 125,["171"] = 125,["172"] = 126,["173"] = 127,["174"] = 128,["175"] = 128,["176"] = 128,["177"] = 128,["178"] = 128,["179"] = 128,["180"] = 128,["181"] = 129,["182"] = 130,["183"] = 131,["184"] = 131,["185"] = 131,["186"] = 131,["187"] = 131,["188"] = 131,["189"] = 131,["190"] = 132,["191"] = 133,["192"] = 134,["193"] = 134,["194"] = 134,["195"] = 134,["196"] = 135,["197"] = 136,["198"] = 137,["199"] = 138,["201"] = 140,["202"] = 141,["204"] = 144,["205"] = 145,["207"] = 116,["208"] = 149,["209"] = 149,["210"] = 149,["211"] = 149,["212"] = 149,["213"] = 149,["214"] = 149,["215"] = 158,["216"] = 159,["217"] = 160,["218"] = 161,["219"] = 161,["220"] = 161,["221"] = 161,["222"] = 162,["223"] = 161,["224"] = 161,["225"] = 160,["226"] = 167,["227"] = 167,["228"] = 167,["229"] = 167,["230"] = 167,["231"] = 167,["232"] = 167,["233"] = 177,["234"] = 178,["235"] = 179,["236"] = 180,["237"] = 180,["238"] = 180,["239"] = 180,["240"] = 181,["241"] = 182,["243"] = 180,["244"] = 180,["245"] = 179,["246"] = 188,["247"] = 189,["248"] = 190,["249"] = 191,["250"] = 192,["251"] = 193,["252"] = 194,["253"] = 195,["255"] = 190,["256"] = 21});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_6280_80FD6 = ____exports.default
_____8239_57FA_7840_6280_80FD6.name = "船基础技能6"
function _____8239_57FA_7840_6280_80FD6.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("吞吞号基础技能")
    actorType.onAction = function(____, actor, x, y, targetUnit)
        local killCount = 0
        SelectUtil.forEnemyUnitsInRange(
            actor.unit,
            1200,
            function(____, u)
                DamageUtil:damage(actor.unit, u, actor.actorType.stateFormula)
                if not UnitStateUtil:isAlive(u) then
                    killCount = killCount + 1
                end
            end,
            x,
            y
        )
        EffectUtil:addSpecialEffectAndDestroy("单位\\新加英雄2\\模型\\吞吞号\\b4af6d0980ce3ecf.mdx", x, y)
        local addVal = 5 * killCount
        HeroUtil:addHeroProperty(actor.unit, addVal)
        TextTagUtil.textSuccess(
            ("吞噬+" .. tostring(addVal)) .. "全属性",
            actor.unit
        )
    end
    actorType = ActorTypeUtil:getActorType("步惊云号基础技能")
    actorType.interval = 0.05
    actorType.onUnitChange = function(____, actor, unit)
        if IsHandle(unit) then
            local modelPath = "单位\\新加英雄2\\模型\\步惊云号\\特效\\b08ce72dbe36f791.mdx"
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
            local damage = UnitStateUtil:calculateStateFormula({attack = 3}, actor.unit)
            local loc = nil
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 400, actor.aface)
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
            SelectUtil.forEnemyUnitsInRange(
                actor.unit,
                200,
                function(____, u)
                    UnitStateUtil:stunUnit(u, 1)
                end,
                loc.x,
                loc.y
            )
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 400, actor.aface + 120)
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
            SelectUtil.forEnemyUnitsInRange(
                actor.unit,
                200,
                function(____, u)
                    UnitStateUtil:stunUnit(u, 1)
                end,
                loc.x,
                loc.y
            )
            loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 400, actor.aface + 240)
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
            SelectUtil.forEnemyUnitsInRange(
                actor.unit,
                200,
                function(____, u)
                    UnitStateUtil:stunUnit(u, 1)
                end,
                loc.x,
                loc.y
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("以杀证道号基础技能")
    actorType.onUnitKillEnemy = function(____, actor, deathEnemy)
        actor.numberOverlay = (actor.numberOverlay or 1000) - 1
        if actor.numberOverlay <= 0 then
            local ri = RandomUtil.nextInt(0, 10)
            local attribute = AttributeUtil:getPlayerAttribute(actor.unitOwner, true)
            if ri == 1 then
                attribute.autoMissileAttackSpeed = (attribute.autoMissileAttackSpeed or 0) + 0.1
                TextTagUtil.textSuccess("获得10%全主炮攻速", actor.unit)
            elseif ri == 2 then
                HeroUtil:addHeroPropertyP(
                    actor.unit,
                    false,
                    0.15,
                    0,
                    0
                )
                TextTagUtil.textSuccess("|cff00ff00获得当前15%力量", actor.unit)
            elseif ri == 3 then
                HeroUtil:addHeroPropertyP(
                    actor.unit,
                    false,
                    0,
                    0.15,
                    0
                )
                TextTagUtil.textSuccess("|cff00ff00获得当前15%敏捷", actor.unit)
            elseif ri == 4 then
                HeroUtil:addHeroPropertyP(
                    actor.unit,
                    false,
                    0,
                    0,
                    0.15
                )
                TextTagUtil.textSuccess("|cff00ff00获得当前15%智力", actor.unit)
            elseif ri == 5 then
                UnitStateUtil:addDamageBase(
                    actor.unit,
                    UnitStateUtil:getDamageBase(actor.unit) * 0.15
                )
                TextTagUtil.textSuccess("|cff00ff00获得当前15%攻击力", actor.unit)
            elseif ri == 6 then
                attribute.autoMissileAttackRange = (attribute.autoMissileAttackRange or 0) + 50
                TextTagUtil.textSuccess("获得50全主炮射程", actor.unit)
            else
                attribute.damage_increased = (attribute.damage_increased or 0) + 0.1
                TextTagUtil.textSuccess("获得10%伤害增幅", actor.unit)
            end
            se:emit("属性刷新")
            actor.numberOverlay = 1000
        end
    end
    ActorTypeUtil:registerActorType({
        id = "烧起来了号减攻击力",
        icon = "ReplaceableTextures\\CommandButtons\\BTNAnimateDead.blp",
        describe = "减少300范围内单位80%攻击力",
        attribute = {attack_p = -0.8},
        dur = 3
    })
    actorType = ActorTypeUtil:getActorType("烧起来了号基础技能")
    actorType.interval = 2
    actorType.onUnitInterval = function(____, actor)
        SelectUtil.forEnemyUnitsInRange(
            actor.unit,
            300,
            function(____, u)
                ActorBuffUtil:addActorBuff(u, "烧起来了号减攻击力")
            end
        )
    end
    ActorTypeUtil:registerActorType({
        id = "克苏鲁号加强触手",
        icon = "ReplaceableTextures\\CommandButtons\\BTNAnimateDead.blp",
        describe = "增加触手100%攻击力和攻速",
        attribute = {attack_p = 1, attackSpd_p = 1},
        dur = 3
    })
    actorType = ActorTypeUtil:getActorType("克苏鲁号基础技能")
    actorType.interval = 2
    actorType.onUnitInterval = function(____, actor)
        SelectUtil.forAllyUnitsInRange(
            actor.unit,
            800,
            function(____, u)
                if ActorUnitUtil:isActorUnitType(u, "跟踪小触手单位") then
                    ActorBuffUtil:addActorBuff(u, "克苏鲁号加强触手")
                end
            end
        )
    end
    actorType = ActorTypeUtil:getActorType("无始大帝号基础技能")
    actorType.interval = 2
    actorType.onUnitDamaged = function(____, actor, damageSource, event)
        local jd = MathUtil.distanceBetweenUnits(damageSource, actor.unit)
        if MathUtil.isBackAngle(jd, actor.unitFacing) then
            event.resultDamage = 0
            EXSetEventDamage(0)
            event.consumed = true
        end
    end
end
return ____exports
