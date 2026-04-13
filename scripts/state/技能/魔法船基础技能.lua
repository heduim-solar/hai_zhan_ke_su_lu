local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 9,["21"] = 9,["22"] = 11,["23"] = 11,["24"] = 12,["25"] = 12,["26"] = 22,["27"] = 22,["28"] = 22,["30"] = 26,["31"] = 27,["32"] = 28,["33"] = 29,["34"] = 30,["35"] = 31,["36"] = 32,["38"] = 34,["40"] = 27,["41"] = 38,["42"] = 38,["43"] = 38,["44"] = 38,["45"] = 38,["46"] = 38,["47"] = 38,["48"] = 38,["49"] = 25,["50"] = 50,["51"] = 51,["52"] = 52,["53"] = 53,["54"] = 54,["55"] = 55,["56"] = 55,["57"] = 55,["58"] = 56,["59"] = 57,["60"] = 61,["61"] = 61,["62"] = 61,["63"] = 61,["64"] = 61,["65"] = 61,["66"] = 61,["67"] = 61,["68"] = 61,["69"] = 62,["70"] = 63,["71"] = 63,["72"] = 63,["73"] = 63,["74"] = 63,["75"] = 63,["77"] = 55,["78"] = 55,["79"] = 55,["80"] = 55,["81"] = 50,["82"] = 71,["83"] = 72,["84"] = 73,["85"] = 74,["86"] = 75,["87"] = 75,["88"] = 75,["89"] = 76,["90"] = 80,["91"] = 80,["92"] = 80,["93"] = 80,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 80,["99"] = 81,["100"] = 81,["101"] = 81,["102"] = 81,["103"] = 81,["104"] = 81,["105"] = 83,["106"] = 83,["107"] = 83,["108"] = 83,["109"] = 84,["110"] = 83,["111"] = 83,["112"] = 83,["113"] = 83,["114"] = 75,["115"] = 75,["116"] = 75,["117"] = 75,["118"] = 71,["119"] = 90,["120"] = 91,["121"] = 92,["122"] = 93,["123"] = 94,["124"] = 97,["125"] = 97,["126"] = 97,["127"] = 97,["128"] = 97,["129"] = 97,["130"] = 97,["131"] = 97,["132"] = 97,["133"] = 98,["134"] = 98,["135"] = 98,["136"] = 98,["137"] = 98,["138"] = 98,["139"] = 90});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
____exports.default = __TS__Class()
local _____9B54_6CD5_8239_57FA_7840_6280_80FD = ____exports.default
_____9B54_6CD5_8239_57FA_7840_6280_80FD.name = "魔法船基础技能"
function _____9B54_6CD5_8239_57FA_7840_6280_80FD.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("魔法船基础技能")
    actorType.onAction = function(____, actor, data)
        local randomPercent = RandomUtil.randomPercent()
        if randomPercent < 0.34 then
            ____exports.default["龙卷风"](____exports.default, actor)
        elseif randomPercent < 0.68 then
            ____exports.default["地震"](____exports.default, actor)
        else
            ____exports.default["星落"](____exports.default, actor)
        end
    end
    ActorTypeUtil:registerActorType({
        id = "魔法船基础技能_地震_buff",
        name = "地震",
        describe = "减速",
        icon = "ReplaceableTextures\\CommandButtons\\BTNVolcano.blp",
        dur = 2,
        attribute = {move_speed = -150}
    })
end
_____9B54_6CD5_8239_57FA_7840_6280_80FD["龙卷风"] = function(self, actor)
    TextTagUtil.text("龙卷风", actor.unit)
    local x = actor:getSpellTargetX()
    local y = actor:getSpellTargetY()
    local i = 0
    BaseUtil.runLater(
        0.1,
        function()
            i = i + 1
            local damage = UnitStateUtil:calculateStateFormula({base = 20, int = 0.15}, actor.unit)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                actor:get("area", 400),
                damage,
                DamageType["s_法术"],
                x,
                y
            )
            if i % 10 == 0 then
                EffectUtil:addSpecialEffectAndDestroy(
                    actor:get("model", "model\\基本技能\\龙卷风.mdx"),
                    x,
                    y,
                    actor:get("modelScale", 0.8)
                )
            end
        end,
        50,
        true
    )
end
_____9B54_6CD5_8239_57FA_7840_6280_80FD["地震"] = function(self, actor)
    TextTagUtil.text("地震", actor.unit)
    local x = actor:getSpellTargetX()
    local y = actor:getSpellTargetY()
    BaseUtil.runLater(
        1,
        function()
            local damage = UnitStateUtil:calculateStateFormula({base = 200, str = 2}, actor.unit)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                actor:get("area", 400),
                damage,
                DamageType["s_法术"],
                x,
                y
            )
            EffectUtil:addSpecialEffectAndDestroy(
                actor:get("model", "model\\基本技能\\地震.mdx"),
                x,
                y,
                actor:get("modelScale", 1)
            )
            SelectUtil.forEnemyUnitsInRange(
                actor.unit,
                400,
                function(____, u)
                    ActorBuffUtil:addActorBuff(u, "魔法船基础技能_地震_buff")
                end,
                x,
                y
            )
        end,
        3,
        true
    )
end
_____9B54_6CD5_8239_57FA_7840_6280_80FD["星落"] = function(self, actor)
    TextTagUtil.text("星落", actor.unit)
    local x = actor:getSpellTargetX()
    local y = actor:getSpellTargetY()
    local damage = UnitStateUtil:calculateStateFormula({agi = 8}, actor.unit)
    DamageRecordUtil:damageEnemyUnitsInRange(
        actor:getName(),
        actor.unit,
        actor:get("area", 400),
        damage,
        DamageType["s_法术"],
        x,
        y
    )
    EffectUtil:addSpecialEffectAndDestroy(
        actor:get("model", "model\\基本技能\\星落.mdx"),
        x,
        y,
        actor:get("modelScale", 1)
    )
end
return ____exports
