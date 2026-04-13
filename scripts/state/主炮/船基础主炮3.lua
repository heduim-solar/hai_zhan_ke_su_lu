local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 14,["31"] = 14,["32"] = 15,["33"] = 15,["34"] = 17,["35"] = 17,["36"] = 17,["38"] = 22,["39"] = 31,["40"] = 32,["41"] = 33,["42"] = 34,["43"] = 35,["44"] = 36,["46"] = 38,["49"] = 32,["50"] = 42,["51"] = 43,["52"] = 44,["55"] = 47,["56"] = 48,["57"] = 49,["59"] = 47,["60"] = 42,["61"] = 59,["62"] = 66,["63"] = 67,["64"] = 68,["65"] = 69,["68"] = 72,["69"] = 73,["70"] = 73,["71"] = 73,["72"] = 73,["73"] = 73,["74"] = 73,["75"] = 73,["76"] = 73,["77"] = 73,["78"] = 74,["79"] = 75,["80"] = 75,["81"] = 75,["82"] = 75,["83"] = 76,["84"] = 75,["85"] = 75,["86"] = 75,["87"] = 75,["88"] = 72,["89"] = 67,["90"] = 88,["91"] = 89,["92"] = 90,["93"] = 91,["96"] = 94,["97"] = 95,["98"] = 96,["99"] = 97,["100"] = 97,["101"] = 97,["102"] = 97,["103"] = 98,["104"] = 98,["105"] = 98,["106"] = 98,["107"] = 98,["108"] = 98,["109"] = 99,["110"] = 100,["111"] = 100,["112"] = 100,["113"] = 100,["114"] = 100,["115"] = 100,["116"] = 97,["117"] = 97,["118"] = 97,["119"] = 97,["120"] = 95,["121"] = 89,["122"] = 110,["123"] = 111,["124"] = 112,["125"] = 113,["127"] = 115,["129"] = 111,["130"] = 125,["131"] = 126,["132"] = 127,["133"] = 128,["136"] = 131,["137"] = 132,["138"] = 133,["139"] = 134,["140"] = 134,["141"] = 134,["142"] = 134,["143"] = 134,["144"] = 134,["145"] = 134,["146"] = 136,["147"] = 136,["148"] = 136,["149"] = 137,["150"] = 137,["151"] = 137,["152"] = 137,["153"] = 137,["154"] = 137,["155"] = 137,["156"] = 137,["157"] = 137,["158"] = 136,["159"] = 136,["160"] = 131,["161"] = 126,["162"] = 149,["163"] = 149,["164"] = 149,["165"] = 149,["166"] = 149,["167"] = 149,["168"] = 149,["169"] = 158,["170"] = 159,["171"] = 160,["172"] = 161,["175"] = 164,["176"] = 165,["177"] = 166,["179"] = 164,["180"] = 169,["181"] = 170,["182"] = 170,["183"] = 170,["184"] = 170,["185"] = 170,["186"] = 170,["187"] = 171,["188"] = 171,["189"] = 171,["190"] = 171,["191"] = 171,["192"] = 171,["193"] = 169,["194"] = 159,["195"] = 175,["196"] = 176,["197"] = 177,["198"] = 178,["199"] = 178,["200"] = 178,["201"] = 178,["202"] = 179,["203"] = 178,["204"] = 178,["206"] = 176,["207"] = 190,["208"] = 191,["209"] = 192,["210"] = 193,["213"] = 196,["214"] = 197,["215"] = 198,["216"] = 198,["217"] = 198,["218"] = 198,["219"] = 198,["220"] = 198,["221"] = 199,["222"] = 199,["223"] = 199,["224"] = 199,["225"] = 199,["226"] = 199,["227"] = 196,["228"] = 191,["229"] = 210,["230"] = 211,["231"] = 212,["232"] = 213,["233"] = 214,["234"] = 214,["235"] = 214,["236"] = 215,["237"] = 216,["238"] = 214,["239"] = 214,["241"] = 211,["242"] = 227,["243"] = 228,["244"] = 230,["245"] = 231,["246"] = 232,["247"] = 233,["248"] = 233,["249"] = 233,["250"] = 233,["251"] = 233,["252"] = 233,["253"] = 234,["254"] = 231,["255"] = 21});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_4E3B_70AE3 = ____exports.default
_____8239_57FA_7840_4E3B_70AE3.name = "船基础主炮3"
function _____8239_57FA_7840_4E3B_70AE3.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("雷雨号主炮")
    actorType.onUnitActorsChange = function(____, actor, isRemove, changeActor)
        local aController = actor.autoMissileAttackController
        if aController then
            if ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") then
                aController.range = 800
            else
                aController.range = 500
            end
        end
    end
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            if ActorBuffUtil:isUnitHasActorBuff(projectile.source, "雷雨天气") then
                projectile.damage = projectile.damage * 3
            end
        end
    end
    ActorTypeUtil:registerActorType({id = "狂风呼啸号主炮减速", attribute = {move_speed_p = -1}, dur = 3})
    actorType = ActorTypeUtil:getActorType("狂风呼啸号主炮")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                projectile.source,
                300,
                projectile.damage,
                DamageType["s_物理"],
                projectile.x,
                projectile.y
            )
            projectile.damage = 0
            SelectUtil.forEnemyUnitsInRange(
                projectile.source,
                300,
                function(____, u)
                    ActorBuffUtil:addActorBuff(u, "狂风呼啸号主炮减速")
                end,
                projectile.x,
                projectile.y
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("刀扇号主炮")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.damageStateFormula = nil
        attackController.onHitTarget = function(____, projectile)
            local baseDamage = UnitStateUtil:calculateStateFormula({attack = 5}, projectile.source)
            SelectUtil.forEnemyUnitsInRange(
                projectile.source,
                600,
                function(____, u)
                    local distance = MathUtil.distanceBetweenPoints(
                        projectile.x,
                        projectile.y,
                        GetUnitX(u),
                        GetUnitY(u)
                    )
                    local damage = baseDamage + (600 - distance) / 100 * 0.5 * baseDamage
                    DamageRecordUtil:damage(
                        actor:getName(),
                        projectile.source,
                        u,
                        damage
                    )
                end,
                projectile.x,
                projectile.y
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("最强攻击号主炮")
    actorType.onUnitKillEnemy = function(____, actor, deathEnemy)
        if ActorItemUtil:isUnitHasActorItem(actor.unit, "麦哲伦") then
            UnitStateUtil:addDamageBase(actor.unit, 10)
        else
            UnitStateUtil:addDamageBase(actor.unit, 5)
        end
    end
    actorType = ActorTypeUtil:getActorType("科多号主炮")
    actorType.onUnitChange = function(____, actor, unit)
        local autoMissileAttackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if autoMissileAttackController == nil then
            return
        end
        autoMissileAttackController.onHitTarget = function(____, projectile)
            local x = projectile.x
            local y = projectile.y
            EffectUtil:addSpecialEffectAndDestroy(
                "model\\基本技能\\巡洋舰巨石掉落.mdx",
                x,
                y,
                0.6,
                1
            )
            BaseUtil.runLater(
                1,
                function()
                    DamageRecordUtil:damageEnemyUnitsInRange(
                        actor:getName(),
                        actor.unit,
                        300,
                        projectile.damage,
                        DamageType["s_物理"],
                        x,
                        y
                    )
                end
            )
        end
    end
    ActorTypeUtil:registerActorType({
        id = "冰霜巨龙魔改道具",
        icon = "ReplaceableTextures\\CommandButtons\\BTNBreathOfFrost.blp",
        describe = "冰霜巨龙减少周围移速30%",
        attribute = {move_speed_p = -0.3},
        dur = 3
    })
    actorType = ActorTypeUtil:getActorType("冰霜巨龙主炮")
    actorType.onUnitChange = function(____, actor, unit)
        local autoMissileAttackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if autoMissileAttackController == nil then
            return
        end
        autoMissileAttackController.onLaunchMissile = function(____, controller, projectile)
            if ActorItemUtil:isUnitHasActorItem(actor.unit, "麦哲伦") then
                projectile.damage = projectile.damage * 2
            end
        end
        autoMissileAttackController.onHitTarget = function(____, projectile)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                projectile.source,
                800,
                projectile.damage * 0.5
            )
            EffectUtil:addSpecialEffectAndDestroy(
                "圆形范围伤害特效\\devilslam.mdx",
                GetUnitX(projectile.target),
                GetUnitY(projectile.target),
                1.2
            )
        end
    end
    actorType.interval = 2
    actorType.onUnitInterval = function(____, actor)
        if _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) then
            SelectUtil.forEnemyUnitsInRange(
                actor.unit,
                600,
                function(____, u)
                    ActorBuffUtil:addActorBuff(u, "冰霜巨龙魔改道具")
                end
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("黑龙主炮")
    actorType.onUnitChange = function(____, actor, unit)
        local autoMissileAttackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if autoMissileAttackController == nil then
            return
        end
        autoMissileAttackController.onHitTarget = function(____, projectile)
            UnitStateUtil:stunUnit(projectile.target, 1)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                projectile.source,
                800,
                projectile.damage * 0.5
            )
            EffectUtil:addSpecialEffectAndDestroy(
                "圆形范围伤害特效\\devilslam.mdx",
                GetUnitX(projectile.target),
                GetUnitY(projectile.target),
                1.2
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("神之号主炮")
    actorType.onUnitPickupItem = function(____, actor, item)
        local actorItemTypeId = ActorItemUtil:getActorItemTypeId(item)
        if actorItemTypeId == "鲁灰" or actorItemTypeId == "尼卡·鲁灰" or actorItemTypeId == "胶胶果实" or GetItemName(item) == "胶胶果实" then
            BaseUtil.runLater(
                0.05,
                function()
                    UnitDropItemPoint(actor.unit, item, actor.unitX, actor.unitY)
                    TextTagUtil.textWarn("神之号主炮 无法携带胶胶果实、鲁灰、尼卡·鲁灰，死亡无法复活!", actor.unit)
                end
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("剑圣主炮")
    actorType.interval = 1
    actorType.onDestroy = nil
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({attack = 1}, actor.unit)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            550,
            damage
        )
        EffectUtil:addSpecialEffectAndDestroy("model\\主炮投射物\\刀扇光.mdx", actor.unitX, actor.unitY, 1.8)
    end
end
return ____exports
