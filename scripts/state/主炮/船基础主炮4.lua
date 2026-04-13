local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 9,["23"] = 10,["24"] = 10,["25"] = 11,["26"] = 11,["27"] = 13,["28"] = 13,["29"] = 13,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 29,["42"] = 30,["43"] = 30,["44"] = 30,["45"] = 31,["46"] = 32,["47"] = 33,["48"] = 34,["49"] = 35,["51"] = 30,["52"] = 30,["54"] = 39,["55"] = 39,["56"] = 39,["57"] = 40,["58"] = 41,["59"] = 42,["60"] = 43,["61"] = 44,["63"] = 39,["64"] = 39,["66"] = 28,["67"] = 28,["68"] = 26,["69"] = 50,["70"] = 51,["71"] = 52,["72"] = 53,["73"] = 54,["74"] = 55,["76"] = 50,["77"] = 65,["78"] = 66,["79"] = 67,["80"] = 68,["81"] = 69,["82"] = 69,["83"] = 69,["84"] = 70,["85"] = 71,["86"] = 72,["87"] = 73,["88"] = 74,["89"] = 75,["92"] = 69,["93"] = 69,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 81,["99"] = 82,["100"] = 83,["101"] = 84,["102"] = 85,["103"] = 86,["106"] = 80,["107"] = 80,["109"] = 66,["110"] = 93,["111"] = 94,["112"] = 95,["113"] = 96,["114"] = 97,["115"] = 98,["116"] = 99,["119"] = 93,["120"] = 110,["121"] = 111,["122"] = 112,["123"] = 113,["124"] = 114,["125"] = 115,["126"] = 115,["127"] = 115,["128"] = 116,["129"] = 117,["130"] = 118,["132"] = 115,["133"] = 115,["135"] = 122,["136"] = 122,["137"] = 122,["138"] = 123,["139"] = 124,["140"] = 125,["141"] = 126,["143"] = 122,["144"] = 122,["146"] = 111,["147"] = 131,["148"] = 132,["149"] = 133,["150"] = 134,["151"] = 135,["152"] = 136,["154"] = 131,["155"] = 148,["156"] = 149,["157"] = 150,["158"] = 151,["161"] = 154,["162"] = 155,["163"] = 156,["167"] = 159,["168"] = 159,["169"] = 160,["170"] = 161,["171"] = 162,["172"] = 163,["173"] = 164,["174"] = 165,["175"] = 159,["178"] = 154,["179"] = 149,["180"] = 178,["181"] = 179,["182"] = 180,["183"] = 181,["184"] = 181,["185"] = 181,["186"] = 182,["187"] = 183,["188"] = 184,["189"] = 185,["190"] = 186,["191"] = 187,["193"] = 181,["194"] = 181,["195"] = 180,["196"] = 191,["197"] = 192,["198"] = 193,["199"] = 194,["200"] = 195,["201"] = 196,["202"] = 197,["203"] = 198,["205"] = 191,["206"] = 207,["207"] = 208,["208"] = 209,["209"] = 208,["210"] = 211,["211"] = 212,["212"] = 213,["213"] = 214,["214"] = 216,["215"] = 217,["217"] = 212,["218"] = 221,["219"] = 222,["220"] = 223,["223"] = 226,["224"] = 227,["225"] = 228,["226"] = 229,["227"] = 230,["228"] = 231,["229"] = 232,["230"] = 232,["231"] = 233,["232"] = 226,["233"] = 221,["234"] = 17});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____Projectile = require("solar.solar-common.tool.Projectile")
local Projectile = ____Projectile.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____BounceMissileController = require("solar.solar-common.controller.BounceMissileController")
local BounceMissileController = ____BounceMissileController.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
____exports.default = __TS__Class()
local _____8239_57FA_7840_4E3B_70AE4 = ____exports.default
_____8239_57FA_7840_4E3B_70AE4.name = "船基础主炮4"
function _____8239_57FA_7840_4E3B_70AE4.prototype.____constructor(self)
    --- "射程：200
    -- 伤害：攻击力x1
    -- 射速：1
    -- 特殊：所有基础射程400以下的主炮，射程+500，射速+50%"
    local actorType = ActorTypeUtil:getActorType("团结号主炮")
    actorType.onUnitChange = function(____, actor, unit)
        _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        BaseUtil.runLater(
            0.01,
            function()
                if IsHandle(unit) then
                    ActorUtil:forUnitAllActorList(
                        unit,
                        function(____, actor)
                            local aController = actor.autoMissileAttackController
                            if aController and aController.range <= 400 and aController["团结号主炮加强"] ~= true then
                                aController["团结号主炮加强"] = true
                                aController.range = aController.range + 500
                                aController.coolDown = aController.coolDown * 0.75
                            end
                        end
                    )
                else
                    ActorUtil:forUnitAllActorList(
                        actor.lastUnit,
                        function(____, actor)
                            local aController = actor.autoMissileAttackController
                            if aController and aController["团结号主炮加强"] == true then
                                aController["团结号主炮加强"] = false
                                aController.range = aController.range - 500
                                aController.coolDown = aController.coolDown * (1 / 0.75)
                            end
                        end
                    )
                end
            end
        )
    end
    actorType.onUnitAddActor = function(____, actor, newActor)
        local aController = newActor.autoMissileAttackController
        if aController and aController.range <= 400 and aController["团结号主炮加强"] ~= true then
            aController["团结号主炮加强"] = true
            aController.range = aController.range + 500
            aController.coolDown = aController.coolDown * 0.75
        end
    end
    actorType = ActorTypeUtil:getActorType("遥遥领先号主炮")
    actorType.onUnitChange = function(____, actor, unit)
        _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if IsHandle(unit) then
            ActorUtil:forUnitAllActorList(
                unit,
                function(____, actor)
                    local aController = actor.autoMissileAttackController
                    if aController and aController.range > 410 and aController["遥遥领先号主炮加强"] ~= true then
                        aController["遥遥领先号主炮加强"] = true
                        aController.range = aController.range + 300
                        if aController.damageStateFormula then
                            aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) + 0.5
                        end
                    end
                end
            )
        else
            ActorUtil:forUnitAllActorList(
                actor.lastUnit,
                function(____, actor)
                    local aController = actor.autoMissileAttackController
                    if aController and aController["遥遥领先号主炮加强"] == true then
                        aController["遥遥领先号主炮加强"] = false
                        aController.range = aController.range - 300
                        if aController.damageStateFormula then
                            aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) - 0.5
                        end
                    end
                end
            )
        end
    end
    actorType.onUnitAddActor = function(____, actor, newActor)
        local aController = newActor.autoMissileAttackController
        if aController and aController.range > 410 and aController["遥遥领先号主炮加强"] ~= true then
            aController["遥遥领先号主炮加强"] = true
            aController.range = aController.range + 300
            if aController.damageStateFormula then
                aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) + 0.5
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("满天繁星号主炮")
    actorType.onUnitChange = function(____, actor, unit)
        _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if IsHandle(unit) then
            local add = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 2 or 1
            ActorUtil:forUnitAllActorList(
                unit,
                function(____, actor)
                    local aController = actor.autoMissileAttackController
                    if aController then
                        aController.targetCount = aController.targetCount + add
                    end
                end
            )
        else
            ActorUtil:forUnitAllActorList(
                actor.lastUnit,
                function(____, actor)
                    local aController = actor.autoMissileAttackController
                    if aController and aController["满天繁星号主炮加强目标数量"] and aController["满天繁星号主炮加强目标数量"] > 0 then
                        aController.targetCount = aController.targetCount - aController["满天繁星号主炮加强目标数量"]
                        aController["满天繁星号主炮加强目标数量"] = 0
                    end
                end
            )
        end
    end
    actorType.onUnitAddActor = function(____, actor, newActor)
        local aController = newActor.autoMissileAttackController
        if aController then
            local add = _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) and 2 or 1
            aController["满天繁星号主炮加强目标数量"] = add
            aController.targetCount = aController.targetCount + aController["满天繁星号主炮加强目标数量"]
        end
    end
    actorType = ActorTypeUtil:getActorType("旋转飞轮号主炮")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(projectile.source, 600, projectile.x, projectile.y)
            if enemyUnitsInRange == nil then
                return
            end
            do
                local i = 0
                while i < #enemyUnitsInRange and i < 5 do
                    local newP = __TS__New(Projectile, projectile.source, enemyUnitsInRange[i + 1])
                    newP.projectileModelPath = projectile.projectileModelPath
                    newP.damage = projectile.damage
                    newP.x = projectile.x
                    newP.y = projectile.y
                    newP:start()
                    i = i + 1
                end
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("萧炎号主炮")
    actorType.interval = 60
    actorType.onCreated = function(____, actor)
        BaseUtil.runLater(
            0.01,
            function()
                local aController = actor.autoMissileAttackController
                if aController and actor.extData["萧炎号主炮已持有分钟数"] and actor.extData["萧炎号主炮已持有分钟数"] > 0 then
                    aController.range = aController.range + actor.extData["萧炎号主炮已持有分钟数"] * 50
                    aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) + actor.extData["萧炎号主炮已持有分钟数"] * 0.2
                    aController.coolDown = aController.coolDown * 0.9 ^ actor.extData["萧炎号主炮已持有分钟数"]
                    aController.coolDown = math.max(aController.coolDown, 0.05)
                end
            end
        )
    end
    actorType.onUnitInterval = function(____, actor)
        actor.extData["萧炎号主炮已持有分钟数"] = (actor.extData["萧炎号主炮已持有分钟数"] or 0) + 1
        local aController = actor.autoMissileAttackController
        if aController then
            aController.range = aController.range + 50
            aController.damageStateFormula.increased = (aController.damageStateFormula.increased or 0) + 0.2
            aController.coolDown = aController.coolDown * 0.9
            aController.coolDown = math.max(aController.coolDown, 0.05)
        end
    end
    actorType = ActorTypeUtil:getActorType("练习生主炮")
    actorType.onCreated = function(____, actor)
        actor.extData["弹射次数"] = 2
    end
    actorType.interval = 150
    actorType.onUnitInterval = function(____, actor)
        actor.extData["弹射次数"] = (actor.extData["弹射次数"] or 2) + 1
        if _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) then
            HeroUtil:addHeroPropertyP(actor.unit, false, 0.05)
            TextTagUtil.text("获得5%基础全属性", actor.unit)
        end
    end
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            local bounceMissileController = __TS__New(BounceMissileController, attackController.unit)
            bounceMissileController.loopCount = actor.extData["弹射次数"] or 2
            bounceMissileController.projectileModelPath = attackController.projectileModelPath
            bounceMissileController.range = 600
            bounceMissileController.damageStateFormula = attackController.damageStateFormula
            local ____bounceMissileController_hitUnitList_0 = bounceMissileController.hitUnitList
            ____bounceMissileController_hitUnitList_0[#____bounceMissileController_hitUnitList_0 + 1] = projectile.target
            bounceMissileController:launch()
        end
    end
end
return ____exports
