local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 5,["14"] = 5,["15"] = 26,["16"] = 26,["17"] = 26,["19"] = 26,["20"] = 26,["22"] = 27,["23"] = 28,["25"] = 29,["26"] = 29,["27"] = 30,["28"] = 31,["29"] = 29,["32"] = 33,["33"] = 26,["34"] = 42,["35"] = 42,["36"] = 42,["38"] = 43,["39"] = 44,["42"] = 47,["43"] = 48,["44"] = 50,["45"] = 51,["46"] = 42,["47"] = 59,["48"] = 60,["49"] = 61,["50"] = 63,["52"] = 59,["53"] = 73,["54"] = 74,["55"] = 75,["56"] = 77,["58"] = 73,["59"] = 86,["60"] = 87,["61"] = 86,["62"] = 93,["63"] = 94,["64"] = 95,["67"] = 97,["68"] = 97,["69"] = 98,["70"] = 99,["71"] = 100,["73"] = 97,["76"] = 103,["77"] = 93,["78"] = 110,["79"] = 111,["80"] = 112,["82"] = 114,["83"] = 116,["85"] = 117,["86"] = 117,["87"] = 118,["88"] = 119,["89"] = 120,["90"] = 120,["91"] = 120,["92"] = 120,["94"] = 117,["97"] = 123,["99"] = 125,["100"] = 126,["102"] = 127,["103"] = 127,["104"] = 128,["105"] = 129,["106"] = 130,["107"] = 130,["108"] = 130,["109"] = 130,["111"] = 127,["114"] = 133,["116"] = 110,["117"] = 142,["118"] = 143,["119"] = 144,["122"] = 146,["123"] = 146,["124"] = 147,["125"] = 148,["126"] = 149,["128"] = 146,["131"] = 152,["132"] = 142,["133"] = 158,["134"] = 159,["135"] = 160,["136"] = 161,["139"] = 164,["140"] = 158,["141"] = 171,["143"] = 172,["144"] = 172,["145"] = 173,["146"] = 174,["147"] = 175,["149"] = 172,["152"] = 178,["153"] = 171,["154"] = 185,["155"] = 186,["157"] = 187,["158"] = 187,["159"] = 188,["160"] = 189,["161"] = 190,["163"] = 187,["166"] = 193,["167"] = 185,["168"] = 200,["169"] = 201,["171"] = 202,["172"] = 202,["174"] = 203,["175"] = 204,["176"] = 205,["178"] = 207,["179"] = 208,["180"] = 209,["181"] = 210,["183"] = 213,["184"] = 214,["185"] = 215,["187"] = 217,["190"] = 202,["193"] = 219,["194"] = 200,["195"] = 228,["196"] = 229,["197"] = 230,["199"] = 231,["200"] = 231,["202"] = 232,["203"] = 233,["204"] = 234,["206"] = 236,["207"] = 237,["208"] = 238,["210"] = 241,["211"] = 242,["212"] = 243,["214"] = 246,["215"] = 247,["216"] = 248,["217"] = 249,["218"] = 250,["219"] = 251,["223"] = 231,["226"] = 254,["227"] = 228,["228"] = 263,["229"] = 264,["230"] = 265,["231"] = 266,["233"] = 268,["234"] = 269,["235"] = 270,["237"] = 272,["238"] = 263,["239"] = 280,["240"] = 281,["242"] = 282,["243"] = 282,["244"] = 283,["245"] = 284,["246"] = 285,["248"] = 282,["251"] = 288,["252"] = 280,["253"] = 296,["255"] = 297,["256"] = 297,["257"] = 298,["258"] = 299,["259"] = 300,["261"] = 297,["264"] = 296,["265"] = 310,["267"] = 311,["268"] = 311,["269"] = 312,["270"] = 313,["271"] = 314,["272"] = 315,["274"] = 311,["277"] = 310,["278"] = 6,["279"] = 7,["280"] = 8,["281"] = 9,["282"] = 10,["283"] = 13,["284"] = 14,["287"] = 17,["289"] = 8});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
____exports.default = __TS__Class()
local ItemUtil = ____exports.default
ItemUtil.name = "ItemUtil"
function ItemUtil.prototype.____constructor(self)
end
function ItemUtil.createItems(self, itemid, x, y, count, owningPlayerId)
    if count == nil then
        count = 1
    end
    if owningPlayerId == nil then
        owningPlayerId = PLAYER_NEUTRAL_PASSIVE
    end
    local p = Player(owningPlayerId)
    local item = nil
    do
        local i = 0
        while i < count do
            item = CreateItem(itemid, x, y)
            SetItemPlayer(item, p, true)
            i = i + 1
        end
    end
    return item
end
function ItemUtil.forItemsInRect(self, r, callBack, onlyAlive)
    if onlyAlive == nil then
        onlyAlive = true
    end
    if ____exports.default._temp_callBack ~= nil then
        log.errorWithTraceBack("不能在此函数回调参数里 再使用此函数!")
        return
    end
    ____exports.default._temp_onlyAlive = onlyAlive
    ____exports.default._temp_callBack = callBack
    EnumItemsInRect(r, nil, ____exports.default._SL_EnumItemsInRectFunc)
    ____exports.default._temp_callBack = nil
end
function ItemUtil.setItemTip(self, itemcode, value)
    EXSetItemDataString(itemcode, 4, value)
    if isEmbedJapi then
        EXSetItemDataString(itemcode, 2, value)
    end
end
function ItemUtil.setItemUbertip(self, itemcode, value)
    EXSetItemDataString(itemcode, 3, value)
    if isEmbedJapi then
        EXSetItemDataString(itemcode, 5, value)
    end
end
function ItemUtil.setItemArt(self, itemcode, value)
    EXSetItemDataString(itemcode, 1, value)
end
function ItemUtil.getItemOfTypeFromUnit(self, udw, otid)
    if type(otid) == "string" then
        otid = FourCC(otid)
    end
    do
        local index = 0
        while index < 6 do
            local item = UnitItemInSlot(udw, index)
            if GetItemTypeId(item) == otid then
                return item
            end
            index = index + 1
        end
    end
    return nil
end
function ItemUtil.getItemCountOfTypeFromUnit(self, udw, itemIdStr)
    if itemIdStr == nil then
        return 0
    end
    if ActorTypeUtil:hasActorType(itemIdStr) then
        local count = 0
        do
            local index = 0
            while index < 6 do
                local item = UnitItemInSlot(udw, index)
                if ActorItemUtil:getActorItemTypeId(item) == itemIdStr then
                    count = count + math.max(
                        GetItemCharges(item),
                        1
                    )
                end
                index = index + 1
            end
        end
        return count
    else
        local otid = FourCC(itemIdStr)
        local count = 0
        do
            local index = 0
            while index < 6 do
                local item = UnitItemInSlot(udw, index)
                if GetItemTypeId(item) == otid then
                    count = count + math.max(
                        GetItemCharges(item),
                        1
                    )
                end
                index = index + 1
            end
        end
        return count
    end
end
function ItemUtil.isUnitHasItem(self, udw, otid)
    if type(otid) == "string" then
        otid = FourCC(otid)
    end
    do
        local index = 0
        while index < 6 do
            local wpid = GetItemTypeId(UnitItemInSlot(udw, index))
            if wpid == otid then
                return true
            end
            index = index + 1
        end
    end
    return false
end
function ItemUtil.isUnitHasItems(self, udw, itAy)
    for ____, iterator in ipairs(itAy) do
        if not ____exports.default:isUnitHasItem(udw, iterator) then
            return false
        end
    end
    return true
end
function ItemUtil.getFirstItemFromUnit(self, unit)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                return item
            end
            i = i + 1
        end
    end
    return nil
end
function ItemUtil.getAllItemFromUnit(self, unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                items[#items + 1] = item
            end
            i = i + 1
        end
    end
    return items
end
function ItemUtil.getItemAndChargesFromUnit(self, unit)
    local items = {}
    do
        local i = 0
        while i < 6 do
            do
                local item = UnitItemInSlot(unit, i)
                if not IsHandle(item) then
                    goto __continue47
                end
                local itemTypeStr = id2string(GetItemTypeId(item))
                local itemCharges = GetItemCharges(item)
                if not itemCharges or itemCharges < 1 then
                    itemCharges = 1
                end
                local oldCharges = items[itemTypeStr]
                if not oldCharges then
                    oldCharges = 0
                end
                items[itemTypeStr] = oldCharges + itemCharges
            end
            ::__continue47::
            i = i + 1
        end
    end
    return items
end
function ItemUtil.costItemChargesFromUnit(self, unit, itemId, charges)
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
                if GetItemTypeId(item) ~= itemId then
                    goto __continue53
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
            ::__continue53::
            i = i + 1
        end
    end
    return costCharges
end
function ItemUtil.getItemSlotBySceneXY(self, sceneX, sceneY)
    local rX = math.floor((sceneX - 0.515) / 0.036)
    if rX < 0 or rX > 1 then
        return nil
    end
    local rY = 2 - math.floor((sceneY - 0.001) / 0.037)
    if rY < 0 or rY > 2 then
        return nil
    end
    return rY * 2 + rX
end
function ItemUtil.hasIdleItemGrid(self, unit)
    local inventorySize = UnitInventorySize(unit)
    do
        local i = 0
        while i < inventorySize do
            local item = UnitItemInSlot(unit, i)
            if not IsHandle(item) then
                return true
            end
            i = i + 1
        end
    end
    return false
end
function ItemUtil.removeUnitItems(self, unit)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                RemoveItem(item)
            end
            i = i + 1
        end
    end
end
function ItemUtil.transferItems(self, srcUnit, toUnit)
    do
        local i = 0
        while i < 6 do
            local item = UnitItemInSlot(srcUnit, i)
            if IsHandle(item) then
                UnitAddItem(toUnit, item)
                UnitDropItemSlot(toUnit, item, i)
            end
            i = i + 1
        end
    end
end
ItemUtil._temp_onlyAlive = true
ItemUtil._temp_callBack = nil
ItemUtil._SL_EnumItemsInRectFunc = function()
    local item = GetEnumItem()
    if ____exports.default._temp_onlyAlive then
        if GetWidgetLife(item) >= 1 and IsItemVisible(item) then
            ____exports.default._temp_callBack(item)
        end
    else
        ____exports.default._temp_callBack(item)
    end
end
return ____exports
