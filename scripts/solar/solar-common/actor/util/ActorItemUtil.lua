local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 8,["12"] = 8,["13"] = 8,["15"] = 8,["16"] = 17,["17"] = 18,["18"] = 19,["19"] = 20,["21"] = 22,["22"] = 17,["23"] = 31,["24"] = 32,["25"] = 33,["28"] = 36,["29"] = 36,["30"] = 36,["31"] = 36,["32"] = 36,["33"] = 36,["34"] = 37,["35"] = 38,["37"] = 40,["38"] = 41,["39"] = 31,["40"] = 51,["41"] = 52,["42"] = 52,["43"] = 53,["46"] = 56,["49"] = 59,["50"] = 51,["51"] = 67,["52"] = 68,["53"] = 69,["55"] = 71,["56"] = 71,["57"] = 72,["58"] = 73,["60"] = 75,["61"] = 76,["63"] = 78,["64"] = 67,["65"] = 85,["66"] = 86,["67"] = 86,["68"] = 87,["69"] = 88,["71"] = 90,["72"] = 85,["73"] = 98,["74"] = 99,["76"] = 100,["77"] = 100,["79"] = 101,["80"] = 102,["81"] = 103,["82"] = 103,["83"] = 104,["84"] = 105,["85"] = 106,["87"] = 108,["88"] = 109,["90"] = 111,["95"] = 100,["98"] = 115,["99"] = 98,["100"] = 123,["101"] = 124,["103"] = 125,["104"] = 125,["106"] = 126,["107"] = 127,["108"] = 128,["109"] = 128,["110"] = 129,["111"] = 130,["112"] = 131,["114"] = 133,["115"] = 134,["117"] = 136,["122"] = 125,["125"] = 140,["126"] = 123,["127"] = 149,["129"] = 150,["130"] = 150,["131"] = 151,["132"] = 152,["133"] = 153,["134"] = 153,["135"] = 154,["136"] = 155,["139"] = 150,["142"] = 159,["143"] = 149,["144"] = 170,["146"] = 171,["147"] = 171,["148"] = 172,["149"] = 173,["150"] = 174,["151"] = 174,["152"] = 175,["153"] = 176,["156"] = 171,["159"] = 170,["160"] = 188,["162"] = 189,["163"] = 189,["164"] = 190,["165"] = 191,["166"] = 192,["167"] = 192,["168"] = 193,["169"] = 194,["172"] = 189,["175"] = 198,["176"] = 188,["177"] = 205,["178"] = 206,["180"] = 207,["181"] = 207,["183"] = 208,["184"] = 209,["185"] = 210,["187"] = 212,["188"] = 213,["189"] = 214,["190"] = 215,["192"] = 218,["193"] = 219,["194"] = 219,["195"] = 220,["196"] = 221,["200"] = 207,["203"] = 225,["204"] = 205,["205"] = 234,["206"] = 235,["207"] = 236,["209"] = 237,["210"] = 237,["212"] = 238,["213"] = 239,["214"] = 240,["216"] = 242,["217"] = 244,["218"] = 246,["219"] = 246,["220"] = 247,["221"] = 248,["224"] = 251,["225"] = 252,["226"] = 253,["228"] = 256,["229"] = 257,["230"] = 258,["231"] = 259,["232"] = 260,["233"] = 261,["237"] = 237,["240"] = 264,["241"] = 234});
local ____exports = {}
local ____ActorItem = require("solar.solar-common.actor.ActorItem")
local ActorItem = ____ActorItem.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorItemUtil = ____exports.default
ActorItemUtil.name = "ActorItemUtil"
function ActorItemUtil.prototype.____constructor(self)
end
function ActorItemUtil.createActorItem(self, itemActorTypeId, x, y, player)
    local actorItem = __TS__New(ActorItem, itemActorTypeId, x, y)
    if IsHandle(player) then
        SetItemPlayer(actorItem.item, player, true)
    end
    return actorItem
end
function ActorItemUtil.addActorItemForUnit(self, itemActorTypeId, unit, uses)
    if itemActorTypeId == nil or not IsHandle(unit) then
        log.errorWithTraceBack((("错误的参数:" .. tostring(itemActorTypeId)) .. " unit=") .. tostring(unit))
        return
    end
    local actor = __TS__New(
        ActorItem,
        itemActorTypeId,
        GetUnitX(unit),
        GetUnitY(unit)
    )
    if uses then
        actor:setUses(uses)
    end
    UnitAddItem(unit, actor.item)
    return actor
end
function ActorItemUtil.ifHasActorItem(self, item, callBack, actorTypeId)
    local ____opt_0 = DataBase:getItemSolarData(item, false)
    local actor = ____opt_0 and ____opt_0._SL_solarActorItem
    if actor == nil then
        return
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return
    end
    callBack(nil, actor)
end
function ActorItemUtil.getActorItem(self, item, actorTypeId)
    if not IsHandle(item) then
        return nil
    end
    local ____opt_2 = DataBase:getItemSolarData(item, false)
    local actor = ____opt_2 and ____opt_2._SL_solarActorItem
    if actor == nil then
        return nil
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return nil
    end
    return actor
end
function ActorItemUtil.getActorItemTypeId(self, item)
    local ____opt_4 = DataBase:getItemSolarData(item, false)
    local actor = ____opt_4 and ____opt_4._SL_solarActorItem
    if actor == nil then
        return nil
    end
    return actor.actorTypeId
end
function ActorItemUtil.getUnitActorItemList(self, unit, actorTypeId)
    local actorList = nil
    do
        local i = 0
        while i < 6 do
            do
                local item = UnitItemInSlot(unit, i)
                if IsHandle(item) then
                    local ____opt_6 = DataBase:getItemSolarData(item, false)
                    local actor = ____opt_6 and ____opt_6._SL_solarActorItem
                    if actor ~= nil then
                        if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
                            goto __continue19
                        end
                        if actorList == nil then
                            actorList = {}
                        end
                        actorList[#actorList + 1] = actor
                    end
                end
            end
            ::__continue19::
            i = i + 1
        end
    end
    return actorList
end
function ActorItemUtil.getUnitActorItemListByKind(self, unit, kind)
    local actorList = nil
    do
        local i = 0
        while i < 6 do
            do
                local item = UnitItemInSlot(unit, i)
                if IsHandle(item) then
                    local ____opt_8 = DataBase:getItemSolarData(item, false)
                    local actor = ____opt_8 and ____opt_8._SL_solarActorItem
                    if actor ~= nil then
                        if kind ~= actor:get("kind") then
                            goto __continue26
                        end
                        if actorList == nil then
                            actorList = {}
                        end
                        actorList[#actorList + 1] = actor
                    end
                end
            end
            ::__continue26::
            i = i + 1
        end
    end
    return actorList
end
function ActorItemUtil.getUnitActorItem(self, unit, actorTypeId)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_10 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_10 and ____opt_10._SL_solarActorItem
                if actor ~= nil and actorTypeId == actor.actorTypeId then
                    return actor
                end
            end
            i = i + 1
        end
    end
    return nil
end
function ActorItemUtil.ifUnitHasActorItem(self, unit, callBack, actorTypeId)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_12 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_12 and ____opt_12._SL_solarActorItem
                if actor ~= nil and actor.actorTypeId == actorTypeId then
                    callBack(nil, actor)
                end
            end
            i = i + 1
        end
    end
end
function ActorItemUtil.isUnitHasActorItem(self, unit, actorTypeId)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_14 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_14 and ____opt_14._SL_solarActorItem
                if actor ~= nil and actor.actorTypeId == actorTypeId then
                    return true
                end
            end
            i = i + 1
        end
    end
    return false
end
function ActorItemUtil.getItemAndActorItemAndChargesFromUnit(self, unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            do
                local item = UnitItemInSlot(unit, i)
                if not IsHandle(item) then
                    goto __continue48
                end
                local itemTypeStr = id2string(GetItemTypeId(item))
                local itemCharges = GetItemCharges(item)
                if not itemCharges or itemCharges < 1 then
                    itemCharges = 1
                end
                items[itemTypeStr] = (items[itemTypeStr] or 0) + itemCharges
                local ____opt_16 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_16 and ____opt_16._SL_solarActorItem
                if actor ~= nil then
                    items[actor.actorType.id] = (items[actor.actorType.id] or 0) + itemCharges
                end
            end
            ::__continue48::
            i = i + 1
        end
    end
    return items
end
function ActorItemUtil.costItemAndActorItemChargesFromUnit(self, unit, itemIdOrActorTypeId, charges)
    local costCharges = 0
    local needCostCharges = 0
    do
        local i = 0
        while i < 6 do
            do
                needCostCharges = charges - costCharges
                if costCharges >= charges then
                    return costCharges
                end
                local item = UnitItemInSlot(unit, i)
                if id2string(GetItemTypeId(item)) ~= itemIdOrActorTypeId then
                    local ____opt_18 = DataBase:getItemSolarData(item, false)
                    local actor = ____opt_18 and ____opt_18._SL_solarActorItem
                    if actor == nil or itemIdOrActorTypeId ~= actor.actorType.id then
                        goto __continue54
                    end
                end
                local itemCharges = GetItemCharges(item)
                if not itemCharges or itemCharges < 1 then
                    itemCharges = 1
                end
                if itemCharges <= needCostCharges then
                    costCharges = costCharges + itemCharges
                    RemoveItem(item)
                elseif itemCharges > needCostCharges then
                    costCharges = costCharges + needCostCharges
                    SetItemCharges(item, itemCharges - needCostCharges)
                end
            end
            ::__continue54::
            i = i + 1
        end
    end
    return costCharges
end
return ____exports
