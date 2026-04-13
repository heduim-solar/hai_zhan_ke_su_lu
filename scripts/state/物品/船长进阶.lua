local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 7,["18"] = 7,["19"] = 7,["21"] = 10,["22"] = 12,["23"] = 13,["24"] = 14,["27"] = 17,["28"] = 19,["29"] = 20,["30"] = 21,["32"] = 13,["33"] = 25,["34"] = 26,["35"] = 27,["38"] = 30,["39"] = 32,["40"] = 33,["41"] = 34,["43"] = 26,["44"] = 38,["45"] = 39,["46"] = 40,["49"] = 43,["50"] = 44,["51"] = 39,["52"] = 46,["53"] = 47,["56"] = 50,["57"] = 51,["58"] = 53,["59"] = 54,["60"] = 55,["62"] = 46,["63"] = 59,["64"] = 60,["65"] = 61,["68"] = 64,["69"] = 65,["70"] = 60,["71"] = 67,["72"] = 68,["75"] = 71,["76"] = 72,["77"] = 74,["78"] = 75,["79"] = 76,["81"] = 67,["82"] = 80,["83"] = 81,["84"] = 82,["87"] = 85,["88"] = 86,["89"] = 81,["90"] = 88,["91"] = 89,["94"] = 92,["95"] = 93,["96"] = 95,["97"] = 96,["98"] = 97,["100"] = 88,["101"] = 101,["102"] = 102,["103"] = 103,["106"] = 106,["107"] = 108,["108"] = 109,["109"] = 110,["111"] = 102,["112"] = 114,["113"] = 115,["114"] = 116,["117"] = 119,["118"] = 120,["119"] = 115,["120"] = 122,["121"] = 123,["124"] = 126,["125"] = 127,["126"] = 129,["127"] = 130,["128"] = 131,["130"] = 122,["131"] = 9});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____ActorItem = require("solar.solar-common.actor.ActorItem")
local ActorItem = ____ActorItem.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
____exports.default = __TS__Class()
local _____8239_957F_8FDB_9636 = ____exports.default
_____8239_957F_8FDB_9636.name = "船长进阶"
function _____8239_957F_8FDB_9636.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("黑胡子")
    actorType.onUnitKillEnemy = function(____, actor, deathEnemy)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        if RandomUtil.isInChance(0.001) then
            local unit = actor.unit
            actor:destroy()
            ActorItemUtil:addActorItemForUnit("暗·黑胡子", unit)
        end
    end
    actorType = ActorTypeUtil:getActorType("白胡子")
    actorType.onUnitLevelChange = function(____, actor, delta)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        if actor.unitLevel >= 15 then
            local unit = actor.unit
            actor:destroy()
            ActorItemUtil:addActorItemForUnit("年轻·白胡子", unit)
        end
    end
    actorType = ActorTypeUtil:getActorType("雷霆支配者")
    actorType.onCreated = function(____, actor)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        local actorItem = actor
        actorItem:setUses(800)
    end
    actorType.onUnitKillEnemy = function(____, actor)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        local actorItem = actor
        if actorItem:addUses(-1) < 1 then
            local unit = actor.unit
            actor:destroy()
            ActorItemUtil:addActorItemForUnit("雷霆毁灭者", unit)
        end
    end
    actorType = ActorTypeUtil:getActorType("艾尼路")
    actorType.onCreated = function(____, actor)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        local actorItem = actor
        actorItem:setUses(600)
    end
    actorType.onUnitKillEnemy = function(____, actor)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        local actorItem = actor
        if actorItem:addUses(-1) < 1 then
            local unit = actor.unit
            actor:destroy()
            ActorItemUtil:addActorItemForUnit("神·艾尼路", unit)
        end
    end
    actorType = ActorTypeUtil:getActorType("小丑")
    actorType.onCreated = function(____, actor)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        local actorItem = actor
        actorItem:setUses(20)
    end
    actorType.onUnitKillEnemy = function(____, actor, deathEnemy)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        local actorItem = actor
        if ActorUnitUtil:isActorUnitType(deathEnemy, "进攻怪-触手") and actorItem:addUses(-1) < 1 then
            local unit = actor.unit
            actor:destroy()
            ActorItemUtil:addActorItemForUnit("小丑皇", unit)
        end
    end
    actorType = ActorTypeUtil:getActorType("两仪式")
    actorType.onUnitLevelChange = function(____, actor)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        if RandomUtil.isInChance(0.1) then
            local unit = actor.unit
            actor:destroy()
            ActorItemUtil:addActorItemForUnit("两仪织", unit)
        end
    end
    actorType = ActorTypeUtil:getActorType("激光炮lv5")
    actorType.onCreated = function(____, actor)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        local actorItem = actor
        actorItem:setUses(3000)
    end
    actorType.onUnitDamageEnemy = function(____, actor)
        if not __TS__InstanceOf(actor, ActorItem) then
            return
        end
        local actorItem = actor
        if actorItem:addUses(-1) < 1 then
            local unit = actor.unit
            actor:destroy()
            ActorItemUtil:addActorItemForUnit("炮姐", unit)
        end
    end
end
return ____exports
