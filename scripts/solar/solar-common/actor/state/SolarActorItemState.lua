local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 10,["21"] = 10,["22"] = 10,["24"] = 14,["25"] = 15,["28"] = 18,["29"] = 20,["32"] = 23,["33"] = 23,["34"] = 23,["35"] = 24,["36"] = 25,["37"] = 27,["38"] = 29,["39"] = 30,["40"] = 31,["41"] = 32,["42"] = 33,["47"] = 38,["48"] = 39,["49"] = 40,["50"] = 42,["52"] = 44,["53"] = 45,["54"] = 46,["59"] = 53,["60"] = 54,["61"] = 54,["62"] = 54,["63"] = 55,["64"] = 54,["65"] = 54,["67"] = 59,["68"] = 61,["69"] = 23,["70"] = 23,["71"] = 18,["72"] = 64,["73"] = 66,["76"] = 69,["77"] = 69,["78"] = 69,["79"] = 70,["80"] = 69,["81"] = 69,["82"] = 64,["83"] = 75,["84"] = 76,["85"] = 76,["86"] = 76,["87"] = 77,["88"] = 78,["89"] = 79,["90"] = 80,["91"] = 81,["92"] = 82,["94"] = 84,["95"] = 85,["96"] = 85,["97"] = 85,["98"] = 85,["101"] = 88,["102"] = 89,["103"] = 90,["104"] = 91,["105"] = 92,["107"] = 94,["108"] = 94,["109"] = 94,["110"] = 94,["111"] = 95,["115"] = 99,["116"] = 100,["117"] = 76,["118"] = 76,["119"] = 75,["120"] = 13,["121"] = 108,["122"] = 109,["123"] = 110,["124"] = 112,["125"] = 112,["128"] = 115,["129"] = 116,["130"] = 117,["131"] = 117,["132"] = 117,["133"] = 117,["134"] = 119,["137"] = 122,["138"] = 123,["139"] = 124,["140"] = 125,["141"] = 126,["142"] = 128,["147"] = 108});
local ____exports = {}
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local SolarActorItemState = ____exports.default
SolarActorItemState.name = "SolarActorItemState"
function SolarActorItemState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorItemState()")
        return
    end
    se:onUnitPickupItem(function(e)
        if UnitUtil.isSummoned(e.trigUnit) then
            return
        end
        ActorItemUtil:ifHasActorItem(
            e.manipulatedItem,
            function(____, actor)
                local stackMax = actor:get("stackMax")
                if stackMax and stackMax > 1 then
                    local actorItems = ActorItemUtil:getUnitActorItemList(e.trigUnit, actor.actorTypeId)
                    local actorItem = nil
                    if actorItems ~= nil and #actorItems > 0 then
                        for ____, tempItem in ipairs(actorItems) do
                            if tempItem ~= actor and tempItem:getUses() < stackMax then
                                actorItem = tempItem
                                break
                            end
                        end
                    end
                    if actorItem ~= nil then
                        if actorItem:getUses() <= stackMax - actor:getUses() then
                            actorItem:addUses(actor:getUses())
                            actor:destroy()
                        else
                            local moveUse = stackMax - actorItem:getUses()
                            actorItem:addUses(moveUse)
                            actor:addUses(-moveUse)
                        end
                        return
                    end
                end
                if actor:get("unique") == true then
                    BaseUtil.runLater(
                        0.1,
                        function()
                            ____exports.default:checkItemUnique(actor)
                        end
                    )
                end
                actor.unit = e.trigUnit
                actor:update()
            end
        )
    end)
    se:onUnitDropItem(function(e)
        if UnitUtil.isSummoned(e.trigUnit) then
            return
        end
        ActorItemUtil:ifHasActorItem(
            e.manipulatedItem,
            function(____, actor)
                actor.unit = nil
            end
        )
    end)
    se:onUnitPawnItem(function(e)
        ActorItemUtil:ifHasActorItem(
            e.soldItem,
            function(____, actor)
                if actor:get("pawnable") ~= false then
                    if actor:get("goldCost") ~= nil and actor:get("goldCost") > 0 then
                        local add = math.floor(actor:get("goldCost") * PawnItemRate)
                        if add > 0 then
                            if actor:get("stackMax", 0) > 0 then
                                add = add * actor:getUses()
                            end
                            PlayerUtil:addGoldState(actor.unitOwner, add)
                            TextTagUtil.textGold(
                                "" .. tostring(add),
                                actor.unit
                            )
                        end
                    end
                    if actor:get("lumberCost") ~= nil and actor:get("lumberCost") > 0 then
                        local add = math.floor(actor:get("lumberCost") * PawnItemRate)
                        if add > 0 then
                            if actor:get("stackMax", 0) > 0 then
                                add = add * actor:getUses()
                            end
                            local texttag = TextTagUtil.textLumber(
                                "" .. tostring(add),
                                actor.unit
                            )
                            SetTextTagVelocity(texttag, 0.04, 0)
                        end
                    end
                end
                actor.unit = nil
                actor:destroy()
            end
        )
    end)
end
function SolarActorItemState.checkItemUnique(self, actor)
    if actor:get("unique") == true and IsHandle(actor.unit) then
        local unit = actor.unit
        local ____opt_0 = DataBase:getPlayerSolarData(actor.unitOwner, false)
        if (____opt_0 and ____opt_0.assistant) == unit then
            return
        end
        local itemList = ActorItemUtil:getUnitActorItemList(unit, actor.actorTypeId)
        if itemList and #itemList > 1 then
            TextTagUtil.textWarn(
                "只能携带一个" .. actor:getName(),
                unit
            )
            UnitRemoveItem(actor.unit, actor.item)
            return
        end
        local kind = actor:get("kind")
        if kind ~= nil then
            local itemList = ActorItemUtil:getUnitActorItemListByKind(unit, kind)
            if itemList and #itemList > 1 then
                TextTagUtil.textWarn("只能携带一种" .. kind, unit)
                UnitRemoveItem(actor.unit, actor.item)
                return
            end
        end
    end
end
return ____exports
