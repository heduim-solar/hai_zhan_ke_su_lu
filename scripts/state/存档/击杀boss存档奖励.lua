local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 12,["26"] = 12,["27"] = 12,["28"] = 12,["29"] = 22,["30"] = 22,["31"] = 22,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 22,["38"] = 22,["39"] = 32,["40"] = 33,["41"] = 34,["42"] = 22,["43"] = 22,["44"] = 39,["45"] = 39,["46"] = 39,["47"] = 39,["48"] = 43,["49"] = 44,["50"] = 45,["51"] = 39,["52"] = 39,["53"] = 49,["54"] = 49,["55"] = 50,["58"] = 53,["59"] = 54,["60"] = 55,["63"] = 58,["64"] = 58,["65"] = 58,["66"] = 58,["67"] = 59,["70"] = 62,["71"] = 63,["72"] = 64,["73"] = 65,["74"] = 66,["75"] = 49,["76"] = 49,["77"] = 49,["78"] = 10});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
____exports.default = __TS__Class()
local _____51FB_6740boss_5B58_6863_5956_52B1 = ____exports.default
_____51FB_6740boss_5B58_6863_5956_52B1.name = "击杀boss存档奖励"
function _____51FB_6740boss_5B58_6863_5956_52B1.prototype.____constructor(self)
    ActorTypeUtil:registerActorType({
        id = "重生十字章",
        describe = "死亡后可以复活",
        icon = "ReplaceableTextures\\CommandButtons\\BTNAnkh.blp",
        uses = 1,
        goldCost = 100,
        destroyOnNoUses = true,
        passive = true
    })
    ActorTypeUtil:registerActorType({
        id = "无敌药水",
        describe = "持续7秒",
        icon = "ReplaceableTextures\\CommandButtons\\BTNGreaterInvulneralbility.blp",
        passive = false,
        droppable = true,
        pawnable = true,
        uses = 1,
        goldCost = 100,
        destroyOnNoUses = true,
        onAction = function(____, actor)
            UnitStateUtil:addInvulnerableIfNot(actor.unit, 7)
            actor:destroy()
        end
    })
    ActorTypeUtil:registerActorType({
        id = "免死金牌buff",
        dur = 5,
        modelAttach = "Abilities\\Spells\\NightElf\\Immolation\\ImmolationDamage.mdl",
        onUnitDamaged = function(____, actor, damageSource, event)
            EXSetEventDamage(0)
            event.consumed = true
        end
    })
    se:onUnitDamaged(
        function(e)
            if e.trigUnitOwnerId > 3 then
                return
            end
            local unit = e.trigUnit
            local damage = GetEventDamage()
            if damage < UnitStateUtil:getLife(unit) then
                return
            end
            local attribute = AttributeUtil:getPlayerAttribute(
                GetOwningPlayer(unit),
                false
            )
            if attribute == nil or attribute["免死金牌"] == nil or attribute["免死金牌"] < 1 then
                return
            end
            attribute["免死金牌"] = attribute["免死金牌"] - 1
            EXSetEventDamage(0)
            UnitStateUtil:setLife(unit, 1)
            ActorBuffUtil:addActorBuff(unit, "免死金牌buff")
            TextTagUtil.textWarn("免死5秒", unit)
        end,
        false
    )
end
return ____exports
