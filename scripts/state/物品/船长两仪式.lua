local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 9,["21"] = 9,["22"] = 9,["24"] = 25,["25"] = 25,["26"] = 25,["27"] = 25,["28"] = 25,["29"] = 25,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 35,["34"] = 36,["35"] = 37,["36"] = 38,["37"] = 39,["40"] = 42,["41"] = 43,["43"] = 37,["44"] = 46,["45"] = 47,["46"] = 48,["47"] = 49,["49"] = 46,["50"] = 64,["51"] = 64,["52"] = 64,["53"] = 64,["54"] = 64,["55"] = 64,["56"] = 64,["57"] = 64,["58"] = 64,["59"] = 74,["60"] = 75,["61"] = 76,["62"] = 77,["63"] = 78,["66"] = 81,["67"] = 82,["69"] = 76,["70"] = 85,["71"] = 86,["72"] = 87,["75"] = 90,["76"] = 90,["77"] = 90,["78"] = 91,["79"] = 92,["80"] = 93,["81"] = 94,["82"] = 90,["83"] = 90,["84"] = 90,["85"] = 96,["86"] = 97,["87"] = 98,["89"] = 85,["90"] = 12});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local _____8239_957F_4E24_4EEA_5F0F = ____exports.default
_____8239_957F_4E24_4EEA_5F0F.name = "船长两仪式"
function _____8239_957F_4E24_4EEA_5F0F.prototype.____constructor(self)
    ActorTypeUtil:registerActorType({
        id = "两仪式Buff",
        name = "两仪式-30%护甲",
        describe = "护甲-30%",
        attribute = {def_p = -0.3},
        icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
        dur = 3,
        levelMax = 1
    })
    local actorType = ActorTypeUtil:getActorType("两仪式")
    actorType.interval = 2
    actorType.onUnitInterval = function(____, actor)
        local enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(actor.unit, 600)
        if enemyUnitsInRange == nil or #enemyUnitsInRange == 0 then
            return
        end
        for ____, unit in ipairs(enemyUnitsInRange) do
            ActorBuffUtil:addActorBuff(unit, "两仪式Buff")
        end
    end
    actorType.onUnitDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.2) then
            TextTagUtil.text("|cffff0000两仪式x3", enemy)
            event.resultDamage = event.resultDamage * 3
        end
    end
    ActorTypeUtil:registerActorType({
        id = "两仪织Buff",
        name = "两仪织-35%护甲",
        describe = "护甲-35%",
        attribute = {def_p = -0.35},
        icon = "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
        dur = 3,
        levelMax = 1
    })
    actorType = ActorTypeUtil:getActorType("两仪织")
    actorType.interval = 2
    actorType.onUnitInterval = function(____, actor)
        local enemyUnitsInRange = SelectUtil.getEnemyUnitsInRange(actor.unit, 600)
        if enemyUnitsInRange == nil or #enemyUnitsInRange == 0 then
            return
        end
        for ____, unit in ipairs(enemyUnitsInRange) do
            ActorBuffUtil:addActorBuff(unit, "两仪式Buff")
        end
    end
    actorType.onUnitDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.05) and not UnitUtil.isHero(enemy) then
            if gv["深度海域层数"] and gv["深度海域层数"] > 0 then
                return
            end
            actor:ifReady(
                30,
                function()
                    TextTagUtil.text("|cffff0000两仪织秒杀", enemy)
                    event.resultDamage = UnitStateUtil:getMaxLife(enemy)
                    EXSetEventDamage(event.resultDamage)
                    event.consumed = true
                end,
                "秒杀"
            )
        elseif RandomUtil.isInChance(0.2) then
            TextTagUtil.text("|cffff0000两仪式x3", enemy)
            event.resultDamage = event.resultDamage * 3
        end
    end
end
return ____exports
