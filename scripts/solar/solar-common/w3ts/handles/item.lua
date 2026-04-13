local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 7,["13"] = 7,["14"] = 9,["15"] = 9,["16"] = 9,["17"] = 9,["18"] = 14,["19"] = 15,["20"] = 9,["22"] = 9,["23"] = 18,["24"] = 18,["25"] = 18,["27"] = 14,["28"] = 183,["29"] = 184,["30"] = 185,["31"] = 183,["32"] = 207,["33"] = 208,["34"] = 207,["35"] = 214,["36"] = 215,["37"] = 214,["38"] = 221,["39"] = 222,["40"] = 221,["41"] = 228,["42"] = 229,["43"] = 228,["44"] = 235,["45"] = 236,["46"] = 235,["47"] = 242,["48"] = 243,["49"] = 242,["50"] = 249,["51"] = 250,["52"] = 249,["53"] = 271,["54"] = 272,["55"] = 271,["56"] = 278,["57"] = 279,["58"] = 278,["59"] = 285,["60"] = 286,["61"] = 285,["62"] = 292,["63"] = 293,["64"] = 292,["65"] = 299,["66"] = 300,["67"] = 299,["68"] = 306,["69"] = 307,["70"] = 306,["71"] = 313,["72"] = 314,["73"] = 313,["79"] = 23,["81"] = 26,["82"] = 27,["92"] = 34,["94"] = 40,["95"] = 41,["105"] = 55,["107"] = 47,["108"] = 48,["117"] = 62,["125"] = 69,["134"] = 79,["136"] = 85,["137"] = 86,["146"] = 93,["154"] = 100,["162"] = 107,["170"] = 114,["179"] = 121,["181"] = 127,["182"] = 128,["192"] = 135,["194"] = 141,["195"] = 142,["205"] = 156,["207"] = 162,["208"] = 163,["218"] = 170,["220"] = 176,["221"] = 177});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____widget = require("solar.solar-common.w3ts.handles.widget")
local Widget = ____widget.Widget
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.Item = __TS__Class()
local Item = ____exports.Item
Item.name = "Item"
__TS__ClassExtends(Item, Widget)
function Item.prototype.____constructor(self, itemId, x, y)
    if Handle:initFromHandle() then
        Widget.prototype.____constructor(self)
    else
        Widget.prototype.____constructor(
            self,
            CreateItem(itemId, x, y)
        )
    end
end
function Item.prototype.destroy(self)
    DataBase:clearItemSolarData(self.handle)
    RemoveItem(self.handle)
end
function Item.prototype.isOwned(self)
    return IsItemOwned(self.handle)
end
function Item.prototype.isPawnable(self)
    return IsItemPawnable(self.handle)
end
function Item.prototype.isPowerup(self)
    return IsItemPowerup(self.handle)
end
function Item.prototype.isSellable(self)
    return IsItemSellable(self.handle)
end
function Item.prototype.setDropId(self, unitId)
    SetItemDropID(self.handle, unitId)
end
function Item.prototype.setDropOnDeath(self, flag)
    SetItemDropOnDeath(self.handle, flag)
end
function Item.prototype.setDroppable(self, flag)
    SetItemDroppable(self.handle, flag)
end
function Item.prototype.setOwner(self, whichPlayer, changeColor)
    SetItemPlayer(self.handle, whichPlayer.handle, changeColor)
end
function Item.prototype.setPoint(self, whichPoint)
    SetItemPosition(self.handle, whichPoint.x, whichPoint.y)
end
function Item.prototype.setPosition(self, x, y)
    SetItemPosition(self.handle, x, y)
end
function Item.fromHandle(self, handle)
    return self:getObject(handle)
end
function Item.isIdPawnable(self, itemId)
    return IsItemIdPawnable(itemId)
end
function Item.isIdPowerup(self, itemId)
    return IsItemIdPowerup(itemId)
end
function Item.isIdSellable(self, itemId)
    return IsItemIdSellable(itemId)
end
__TS__SetDescriptor(
    Item.prototype,
    "solarData",
    {
        get = function(self)
            return DataBase:getItemSolarData(self.handle)
        end,
        set = function(self, obj)
            DataBase:setDataByHandle("item", self.handle, obj)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "charges",
    {
        get = function(self)
            return GetItemCharges(self.handle)
        end,
        set = function(self, value)
            SetItemCharges(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "invulnerable",
    {
        get = function(self)
            return IsItemInvulnerable(self.handle)
        end,
        set = function(self, flag)
            SetItemInvulnerable(self.handle, true)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "level",
    {get = function(self)
        return GetItemLevel(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "name",
    {get = function(self)
        return GetItemName(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "pawnable",
    {
        get = function(self)
            return IsItemPawnable(self.handle)
        end,
        set = function(self, flag)
            SetItemPawnable(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "player",
    {get = function(self)
        return GetItemPlayer(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "type",
    {get = function(self)
        return GetItemType(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "typeId",
    {get = function(self)
        return GetItemTypeId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "typeIdString",
    {get = function(self)
        return id2string(GetItemTypeId(self.handle))
    end},
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "userData",
    {
        get = function(self)
            return GetItemUserData(self.handle)
        end,
        set = function(self, value)
            SetItemUserData(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "visible",
    {
        get = function(self)
            return IsItemVisible(self.handle)
        end,
        set = function(self, flag)
            SetItemVisible(self.handle, flag)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "x",
    {
        get = function(self)
            return GetItemX(self.handle)
        end,
        set = function(self, value)
            SetItemPosition(self.handle, value, self.y)
        end
    },
    true
)
__TS__SetDescriptor(
    Item.prototype,
    "y",
    {
        get = function(self)
            return GetItemY(self.handle)
        end,
        set = function(self, value)
            SetItemPosition(self.handle, self.x, value)
        end
    },
    true
)
return ____exports
