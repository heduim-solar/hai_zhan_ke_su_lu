local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 12,["27"] = 12,["28"] = 15,["29"] = 15,["30"] = 15,["32"] = 19,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 30,["37"] = 31,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 33,["45"] = 33,["46"] = 33,["47"] = 33,["48"] = 33,["49"] = 33,["50"] = 30,["51"] = 42,["52"] = 43,["53"] = 44,["54"] = 45,["55"] = 46,["56"] = 46,["57"] = 46,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 47,["62"] = 47,["63"] = 47,["64"] = 47,["65"] = 47,["66"] = 47,["67"] = 44,["68"] = 57,["69"] = 58,["70"] = 59,["71"] = 59,["72"] = 59,["73"] = 60,["74"] = 61,["75"] = 62,["77"] = 60,["78"] = 59,["79"] = 59,["80"] = 58,["81"] = 67,["82"] = 68,["83"] = 69,["84"] = 70,["85"] = 70,["86"] = 70,["87"] = 71,["88"] = 70,["89"] = 70,["90"] = 67,["91"] = 80,["92"] = 81,["93"] = 82,["94"] = 83,["95"] = 84,["96"] = 84,["97"] = 84,["98"] = 84,["99"] = 84,["100"] = 84,["101"] = 82,["102"] = 93,["103"] = 94,["104"] = 95,["105"] = 96,["106"] = 97,["107"] = 97,["108"] = 97,["109"] = 97,["110"] = 97,["111"] = 97,["112"] = 98,["113"] = 98,["114"] = 98,["115"] = 98,["116"] = 98,["117"] = 98,["118"] = 98,["119"] = 98,["120"] = 98,["121"] = 99,["122"] = 95,["123"] = 108,["124"] = 109,["125"] = 110,["126"] = 111,["127"] = 112,["128"] = 112,["129"] = 112,["130"] = 112,["131"] = 112,["132"] = 112,["133"] = 113,["134"] = 113,["135"] = 113,["136"] = 113,["137"] = 113,["138"] = 113,["139"] = 113,["140"] = 113,["141"] = 113,["142"] = 114,["143"] = 114,["144"] = 114,["145"] = 114,["146"] = 114,["147"] = 114,["148"] = 110,["149"] = 123,["150"] = 123,["151"] = 123,["152"] = 123,["153"] = 123,["154"] = 123,["155"] = 123,["156"] = 123,["157"] = 132,["158"] = 133,["159"] = 134,["160"] = 135,["161"] = 136,["164"] = 139,["165"] = 140,["167"] = 134,["168"] = 150,["169"] = 151,["170"] = 152,["171"] = 153,["172"] = 154,["175"] = 157,["176"] = 158,["177"] = 158,["178"] = 158,["179"] = 158,["180"] = 158,["181"] = 158,["182"] = 158,["183"] = 159,["184"] = 152,["185"] = 18});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____TargetAttach = require("solar.solar-common.constant.TargetAttach")
local TargetAttach = ____TargetAttach.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_6280_80FD = ____exports.default
_____8239_57FA_7840_6280_80FD.name = "船基础技能"
function _____8239_57FA_7840_6280_80FD.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("铁达尼号基础技能")
    actorType.attribute = {life_p = 0.5}
    actorType.interval = 4
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({hp = 0.4}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            500,
            damage
        )
        EffectUtil:addSpecialEffectAndDestroy(
            actor:get("model", "model\\基本技能\\铁达尼号基础技能.mdx"),
            actor.unitX,
            actor.unitY,
            actor:get("modelScale", 1)
        )
    end
    actorType = ActorTypeUtil:getActorType("泰坦尼克号基础技能")
    actorType.interval = 4
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({hp = 0.5}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            500,
            damage
        )
        EffectUtil:addSpecialEffectAndDestroy(
            "model\\基本技能\\铁达尼号基础技能.mdx",
            actor.unitX,
            actor.unitY,
            actor:get("modelScale", 1)
        )
    end
    actorType = ActorTypeUtil:getActorType("黑珍珠号基础技能")
    actorType.onCreated = function()
        SingletonUtil:executeOnce(
            actorType,
            function()
                se:onUnitAttacked(function(e)
                    if GetUnitAbilityLevel(e.attacker, "Apiv") then
                        UnitRemoveAbility(e.attacker, "Apiv")
                    end
                end)
            end
        )
    end
    actorType.onAction = function(____, actor)
        local unit = actor.unit
        UnitAddAbility(unit, "Apiv")
        BaseUtil.runLater(
            15,
            function()
                UnitRemoveAbility(unit, "Apiv")
            end
        )
    end
    actorType = ActorTypeUtil:getActorType("黑色幽灵号基础技能")
    actorType.interval = 1
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({base = 1000, agi = 1}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            900,
            damage
        )
    end
    actorType = ActorTypeUtil:getActorType("桑尼号基础技能")
    actorType.interval = 5
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({base = 1000, int = 10}, actor.unit)
        local projection = MathUtil.polarProjection(
            GetUnitX(actor.unit),
            GetUnitY(actor.unit),
            300,
            GetUnitFacing(actor.unit) + 180
        )
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            350,
            damage,
            DamageType["s_物理"],
            projection.x,
            projection.y
        )
        EffectUtil:addSpecialEffectAndDestroy("圆形范围伤害特效\\eff_002.mdx", projection.x, projection.y, 0.4)
    end
    actorType = ActorTypeUtil:getActorType("阳光桑尼号基础技能")
    actorType.interval = 3
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({base = 1000, int = 10}, actor.unit)
        local projection = MathUtil.polarProjection(
            GetUnitX(actor.unit),
            GetUnitY(actor.unit),
            300,
            GetUnitFacing(actor.unit) + 180
        )
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            350,
            damage,
            DamageType["s_物理"],
            projection.x,
            projection.y
        )
        EffectUtil:addSpecialEffectAndDestroy(
            actor:get("model", "圆形范围伤害特效\\eff_002.mdx"),
            projection.x,
            projection.y,
            actor:get("modelScale", 0.4)
        )
    end
    ActorTypeUtil:registerActorType({
        id = "死神号技能护甲Buff",
        name = "死神号-50护甲",
        attribute = {def = -50},
        icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
        dur = 3,
        levelMax = 1
    })
    actorType = ActorTypeUtil:getActorType("死神号基础技能")
    actorType.interval = 2
    actorType.onUnitInterval = function(____, actor)
        local enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(actor.unit, 600)
        if enemyUnitsInRange == nil or #enemyUnitsInRange == 0 then
            return
        end
        for ____, unit in ipairs(enemyUnitsInRange) do
            ActorBuffUtil:addActorBuff(unit, "死神号技能护甲Buff")
        end
    end
    actorType = ActorTypeUtil:getActorType("歼星号基础技能")
    actorType.interval = actorType.interval or 0.3
    actorType.onUnitInterval = function(____, actor)
        local enemyInRange = SelectUtil.getRandomEnemyInRange(actor.unit, 300)
        if not IsHandle(enemyInRange) then
            return
        end
        local damage = UnitStateUtil:calculateStateFormula({base = 500, str = 3}, actor.unit)
        DamageRecordUtil:damage(
            actor:getName(),
            actor.unit,
            enemyInRange,
            damage,
            DamageType["s_物理"]
        )
        EffectUtil:addSpecialEffectTargetAndDestroy("圆形范围伤害特效\\devilslam.mdx", enemyInRange, TargetAttach.origin, 0.1)
    end
end
return ____exports
