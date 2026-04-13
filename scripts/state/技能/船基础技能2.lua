local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 14,["30"] = 14,["31"] = 14,["33"] = 18,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 29,["38"] = 30,["39"] = 31,["40"] = 32,["41"] = 33,["42"] = 34,["44"] = 31,["45"] = 30,["46"] = 39,["47"] = 40,["48"] = 41,["49"] = 42,["50"] = 43,["51"] = 44,["52"] = 44,["53"] = 44,["54"] = 45,["55"] = 46,["56"] = 46,["57"] = 46,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 46,["62"] = 46,["63"] = 46,["64"] = 44,["65"] = 44,["66"] = 44,["67"] = 44,["68"] = 39,["69"] = 56,["70"] = 57,["71"] = 58,["72"] = 59,["73"] = 59,["74"] = 59,["75"] = 59,["76"] = 59,["77"] = 59,["78"] = 59,["79"] = 60,["80"] = 60,["81"] = 60,["82"] = 60,["83"] = 60,["84"] = 60,["85"] = 57,["86"] = 68,["87"] = 69,["88"] = 70,["89"] = 71,["90"] = 72,["91"] = 72,["92"] = 72,["93"] = 72,["94"] = 72,["95"] = 72,["96"] = 72,["97"] = 72,["98"] = 72,["99"] = 73,["100"] = 73,["101"] = 73,["102"] = 73,["103"] = 73,["104"] = 73,["105"] = 70,["106"] = 81,["107"] = 82,["108"] = 83,["109"] = 83,["110"] = 83,["111"] = 83,["112"] = 84,["113"] = 85,["114"] = 85,["115"] = 85,["116"] = 85,["117"] = 85,["118"] = 85,["119"] = 86,["120"] = 86,["121"] = 86,["122"] = 86,["123"] = 86,["124"] = 86,["126"] = 82,["127"] = 95,["128"] = 96,["130"] = 97,["131"] = 97,["132"] = 98,["133"] = 97,["136"] = 96,["137"] = 106,["138"] = 107,["139"] = 108,["140"] = 109,["141"] = 110,["142"] = 111,["144"] = 113,["145"] = 114,["146"] = 114,["147"] = 114,["148"] = 114,["149"] = 118,["150"] = 118,["151"] = 118,["152"] = 118,["153"] = 118,["154"] = 118,["155"] = 119,["156"] = 119,["157"] = 119,["158"] = 119,["159"] = 119,["160"] = 119,["161"] = 113,["162"] = 107,["163"] = 130,["164"] = 131,["165"] = 132,["166"] = 132,["167"] = 132,["168"] = 132,["169"] = 132,["170"] = 137,["171"] = 140,["172"] = 140,["173"] = 140,["174"] = 140,["175"] = 141,["176"] = 142,["177"] = 140,["178"] = 140,["179"] = 144,["180"] = 145,["181"] = 145,["182"] = 145,["183"] = 145,["184"] = 148,["185"] = 149,["186"] = 149,["187"] = 149,["188"] = 149,["189"] = 149,["190"] = 149,["191"] = 149,["192"] = 149,["193"] = 149,["194"] = 150,["195"] = 144,["196"] = 153,["197"] = 155,["198"] = 156,["199"] = 161,["200"] = 161,["201"] = 161,["202"] = 164,["203"] = 164,["204"] = 164,["205"] = 161,["206"] = 161,["207"] = 166,["208"] = 171,["209"] = 172,["210"] = 172,["211"] = 172,["212"] = 172,["213"] = 174,["214"] = 131,["215"] = 17});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____TargetAttach = require("solar.solar-common.constant.TargetAttach")
local TargetAttach = ____TargetAttach.default
local ____CoolDown = require("solar.solar-common.tool.CoolDown")
local CoolDown = ____CoolDown.default
local ____VestUtil = require("solar.solar-common.util.unit.VestUtil")
local VestUtil = ____VestUtil.default
local ____Motion = require("solar.solar-common.tool.Motion")
local Motion = ____Motion.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_6280_80FD2 = ____exports.default
_____8239_57FA_7840_6280_80FD2.name = "船基础技能2"
function _____8239_57FA_7840_6280_80FD2.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("毁灭号基础技能")
    actorType.targetType = "点"
    actorType.area = actorType.area or 800
    actorType.range = actorType.range or 1600
    actorType.onCreated = function(____, actor)
        se:onUnitDeath(function(e)
            if e.killingUnit == actor.unit then
                actor.killCount = (actor.killCount or 0) + 1
                actor:setDescribe((("对目标800范围造成5次打击。每次伤害为1000+智力x5。|n 每击杀一个单位该技能伤害+0.1%|n" .. "(当前加成:") .. tostring(0.1 * actor.killCount)) .. "%)")
            end
        end)
    end
    actorType.onAction = function(____, actor)
        local targetX = GetSpellTargetX()
        local targetY = GetSpellTargetY()
        local damage = UnitStateUtil:calculateStateFormula({base = 1000, int = 1}, actor.unit)
        damage = damage * (1 + (actor.killCount or 0) * 0.001)
        BaseUtil.runLater(
            1,
            function()
                EffectUtil:addSpecialEffectAndDestroy("圆形范围伤害特效\\eff_002.mdx", targetX, targetY, 1)
                DamageRecordUtil:damageEnemyUnitsInRange(
                    actor:getName(),
                    actor.unit,
                    500,
                    damage,
                    DamageType["s_法术"],
                    targetX,
                    targetY
                )
            end,
            5,
            true
        )
    end
    actorType = ActorTypeUtil:getActorType("嗜血号基础技能")
    actorType.onUnitDamaged = function(____, actor, damageSource)
        local damage = UnitStateUtil:calculateStateFormula({str = 2}, actor.unit)
        DamageRecordUtil:damage(
            actor:getName(),
            actor.unit,
            damageSource,
            damage,
            DamageType["s_物理"]
        )
        EffectUtil:addSpecialEffectTargetAndDestroy(
            "圆形范围伤害特效\\devilslam.mdx",
            damageSource,
            TargetAttach.origin,
            actor:get("modelScale", 0.1)
        )
    end
    actorType = ActorTypeUtil:getActorType("瘟疫号基础技能")
    actorType.interval = 1
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({base = 300, hp = 0.1}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            350,
            damage,
            DamageType["s_物理"],
            GetUnitX(actor.unit),
            GetUnitY(actor.unit)
        )
        EffectUtil:addSpecialEffectAndDestroy(
            actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
            GetUnitX(actor.unit),
            GetUnitY(actor.unit),
            actor:get("modelScale", 0.3)
        )
    end
    actorType = ActorTypeUtil:getActorType("蛮族号基础技能")
    actorType.onUnitDamaged = function(____, actor, damageSource)
        local damage = UnitStateUtil:calculateStateFormula(
            actor:get("stateFormula"),
            actor.unit
        )
        if damage > 0 then
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                300,
                damage
            )
            EffectUtil:addSpecialEffectAndDestroy(
                actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
                GetUnitX(actor.unit),
                GetUnitY(actor.unit),
                actor:get("modelScale", 0.3)
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("蓝色幻影基础技能")
    actorType.onAction = function(____, actor)
        do
            local i = 0
            while i < 3 do
                VestUtil.createPhantomUnit(actor.unit, 15, 1, 2)
                i = i + 1
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("顽石号基础技能")
    actorType.onUnitDamaged = function(____, actor, damageSource)
        local coolDown = actor.coolDown
        if coolDown == nil then
            coolDown = __TS__New(CoolDown, 3)
            actor.coolDown = coolDown
        end
        coolDown:ifReady(function()
            local damage = UnitStateUtil:calculateStateFormula(
                actor:get("stateFormula", {base = 500, str = 5}),
                actor.unit
            )
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                350,
                damage
            )
            EffectUtil:addSpecialEffectAndDestroy(
                actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
                actor.unitX,
                actor.unitY,
                actor:get("modelScale", 0.7)
            )
        end)
    end
    actorType = ActorTypeUtil:getActorType("巡洋舰基础技能")
    actorType.onAction = function(____, actor, damageSource)
        local start = {
            x = actor.unitX,
            y = actor.unitY,
            z = GameUtil:getTerrainHeight(actor.unitX, actor.unitY) + 100
        }
        local effect = EffectUtil:addSpecialEffect("Abilities\\Weapons\\Mortar\\MortarMissile.mdl", start.x, start.y, 4)
        local motion = __TS__New(
            Motion,
            3,
            function(____, m)
                EXSetEffectXY(effect, m.x, m.y)
                EXSetEffectZ(effect, m.z)
            end
        )
        motion.onDone = function(____, m)
            local damage = UnitStateUtil:calculateStateFormula(
                actor:get("stateFormula", {str = 10}),
                actor.unit
            )
            DestroyEffect(effect)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                actor:get("area", 500),
                damage,
                DamageType["s_物理"],
                motion.x,
                motion.y
            )
            EffectUtil:addSpecialEffectAndDestroy("model\\基本技能\\巡洋舰巨石掉落.mdx", motion.x, motion.y, 0.8)
        end
        motion:setPathSplineType("Bezier")
        motion:addPathPoint(start)
        motion:addPathPoint({x = start.x, y = start.y, z = start.z + 1000})
        local ____end = {
            x = actor:getSpellTargetX(),
            y = actor:getSpellTargetY(),
            z = GameUtil:getTerrainHeight(
                actor:getSpellTargetX(),
                actor:getSpellTargetY()
            )
        }
        motion:addPathPoint({x = ____end.x, y = ____end.y, z = ____end.z + 800})
        motion:addPathPoint(____end)
        EXEffectMatRotateZ(
            effect,
            motion:getFaceAngle()
        )
        motion:run()
    end
end
return ____exports
