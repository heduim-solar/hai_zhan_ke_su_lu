local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 13,["30"] = 13,["31"] = 13,["33"] = 18,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 29,["40"] = 32,["41"] = 33,["42"] = 34,["43"] = 35,["44"] = 35,["45"] = 35,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["52"] = 32,["53"] = 27,["54"] = 46,["55"] = 47,["56"] = 48,["57"] = 49,["60"] = 52,["61"] = 53,["62"] = 54,["63"] = 55,["64"] = 55,["65"] = 55,["66"] = 55,["67"] = 55,["68"] = 55,["69"] = 55,["70"] = 55,["71"] = 55,["72"] = 52,["73"] = 47,["74"] = 67,["75"] = 68,["76"] = 69,["77"] = 70,["80"] = 73,["81"] = 74,["82"] = 75,["83"] = 76,["84"] = 77,["85"] = 78,["86"] = 78,["87"] = 79,["88"] = 73,["89"] = 68,["90"] = 89,["91"] = 90,["92"] = 91,["93"] = 92,["96"] = 95,["97"] = 96,["98"] = 97,["99"] = 98,["100"] = 99,["101"] = 100,["102"] = 100,["103"] = 101,["104"] = 95,["105"] = 90,["106"] = 111,["107"] = 112,["108"] = 113,["109"] = 114,["112"] = 117,["113"] = 118,["114"] = 118,["115"] = 118,["116"] = 118,["117"] = 119,["120"] = 122,["121"] = 123,["122"] = 123,["123"] = 123,["124"] = 123,["125"] = 123,["126"] = 123,["127"] = 118,["128"] = 118,["129"] = 118,["130"] = 118,["131"] = 117,["132"] = 112,["133"] = 135,["134"] = 136,["135"] = 137,["136"] = 139,["138"] = 141,["139"] = 142,["142"] = 145,["143"] = 146,["144"] = 147,["145"] = 148,["146"] = 148,["147"] = 148,["148"] = 149,["149"] = 150,["150"] = 150,["151"] = 150,["152"] = 150,["153"] = 150,["154"] = 150,["155"] = 150,["156"] = 150,["157"] = 150,["158"] = 151,["159"] = 151,["160"] = 151,["161"] = 151,["162"] = 151,["163"] = 151,["164"] = 148,["165"] = 148,["166"] = 148,["167"] = 148,["168"] = 145,["169"] = 136,["170"] = 163,["171"] = 163,["172"] = 163,["173"] = 163,["174"] = 163,["175"] = 163,["176"] = 163,["177"] = 163,["178"] = 172,["179"] = 173,["180"] = 174,["181"] = 175,["184"] = 178,["185"] = 179,["186"] = 180,["187"] = 181,["188"] = 182,["189"] = 182,["190"] = 182,["191"] = 182,["192"] = 182,["193"] = 182,["194"] = 182,["195"] = 182,["196"] = 182,["197"] = 183,["198"] = 183,["199"] = 183,["200"] = 183,["201"] = 183,["202"] = 183,["203"] = 185,["204"] = 185,["205"] = 185,["206"] = 185,["207"] = 186,["208"] = 185,["209"] = 185,["210"] = 185,["211"] = 185,["212"] = 178,["213"] = 173,["214"] = 16});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____BounceMissileController = require("solar.solar-common.controller.BounceMissileController")
local BounceMissileController = ____BounceMissileController.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_4E3B_70AE = ____exports.default
_____8239_57FA_7840_4E3B_70AE.name = "船基础主炮"
function _____8239_57FA_7840_4E3B_70AE.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("铁达尼号")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local flsh = projectile.damage * 0.8
            local range = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 650 or 450
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                projectile.source,
                range,
                flsh,
                DamageType["s_物理"],
                projectile.x,
                projectile.y
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("泰坦尼克号")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local flsh = projectile.damage
            local range = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 800 or 600
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                projectile.source,
                range,
                flsh,
                DamageType["s_物理"],
                projectile.x,
                projectile.y
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("桑尼号")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local bounceMissileController = __TS__New(BounceMissileController, attackController.unit)
            bounceMissileController.loopCount = 9
            bounceMissileController.range = 600
            bounceMissileController.damageStateFormula = attackController.damageStateFormula
            local ____bounceMissileController_hitUnitList_0 = bounceMissileController.hitUnitList
            ____bounceMissileController_hitUnitList_0[#____bounceMissileController_hitUnitList_0 + 1] = projectile.target
            bounceMissileController:launch()
        end
    end
    actorType = ActorTypeUtil:getActorType("阳光桑尼号")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local bounceMissileController = __TS__New(BounceMissileController, attackController.unit)
            bounceMissileController.loopCount = 9
            bounceMissileController.range = 600
            bounceMissileController.damageStateFormula = attackController.damageStateFormula
            local ____bounceMissileController_hitUnitList_1 = bounceMissileController.hitUnitList
            ____bounceMissileController_hitUnitList_1[#____bounceMissileController_hitUnitList_1 + 1] = projectile.target
            bounceMissileController:launch()
        end
    end
    actorType = ActorTypeUtil:getActorType("歼星号")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            SelectUtil.forEnemyUnitsInRange(
                actor.unit,
                600,
                function(____, enemyUnit)
                    if enemyUnit == projectile.target then
                        return
                    end
                    local flsh = projectile.damage
                    DamageRecordUtil:damage(
                        actor:getName(),
                        projectile.source,
                        enemyUnit,
                        flsh
                    )
                end,
                GetUnitX(projectile.target),
                GetUnitY(projectile.target)
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("瘟疫号")
    actorType.onUnitChange = function(____, actor, unit)
        if _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) then
            actor.attribute = {reply_life_by_p_on_pers = 0.1}
        end
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local x = GetUnitX(projectile.target)
            local y = GetUnitY(projectile.target)
            BaseUtil.runLater(
                1,
                function()
                    local damage = UnitStateUtil:calculateStateFormula({str = 2}, actor.unit)
                    DamageRecordUtil:damageEnemyUnitsInRange(
                        actor:getName(),
                        actor.unit,
                        actor:get("area", 400),
                        damage,
                        DamageType["s_物理"],
                        x,
                        y
                    )
                    EffectUtil:addSpecialEffectAndDestroy(
                        actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
                        x,
                        y,
                        actor:get("modelScale", 0.8)
                    )
                end,
                5,
                true
            )
        end
    end
    ActorTypeUtil:registerActorType({
        id = "海皇波塞冬_主炮_buff",
        name = "海皇波塞冬主炮",
        icon = "ReplaceableTextures\\CommandButtons\\BTNCorpseExplode.blp",
        describe = "眩晕",
        dur = 0.5,
        attribute = {move_speed = -600}
    })
    actorType = ActorTypeUtil:getActorType("海皇波塞冬")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local x = GetUnitX(projectile.target)
            local y = GetUnitY(projectile.target)
            local damage = UnitStateUtil:calculateStateFormula({str = 2}, actor.unit)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                actor:get("area", 350),
                damage,
                DamageType["s_物理"],
                x,
                y
            )
            EffectUtil:addSpecialEffectAndDestroy(
                actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
                x,
                y,
                actor:get("modelScale", 0.8)
            )
            SelectUtil.forEnemyUnitsInRange(
                actor.unit,
                350,
                function(____, u)
                    ActorBuffUtil:addActorBuff(u, "海皇波塞冬_主炮_buff")
                end,
                x,
                y
            )
        end
    end
end
return ____exports
