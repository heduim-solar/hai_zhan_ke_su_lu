local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 5,["15"] = 7,["16"] = 8,["17"] = 5,["19"] = 5,["20"] = 11,["21"] = 11,["22"] = 11,["24"] = 7,["25"] = 18,["26"] = 19,["27"] = 18,["28"] = 25,["29"] = 26,["30"] = 25,["31"] = 32,["32"] = 33,["33"] = 32,["34"] = 39,["35"] = 40,["36"] = 39,["37"] = 46,["38"] = 47,["39"] = 47,["40"] = 47,["41"] = 47,["42"] = 47,["43"] = 47,["44"] = 47,["45"] = 46,["46"] = 53,["47"] = 54,["48"] = 53,["49"] = 57,["50"] = 58,["51"] = 57,["52"] = 62,["53"] = 62,["54"] = 62,["55"] = 62,["57"] = 65,["58"] = 62,["60"] = 62,["61"] = 68,["62"] = 68,["63"] = 68,["65"] = 64,["66"] = 124,["67"] = 125,["68"] = 124,["69"] = 131,["70"] = 132,["71"] = 131,["72"] = 138,["73"] = 139,["74"] = 138,["75"] = 145,["76"] = 146,["77"] = 145,["78"] = 152,["79"] = 153,["80"] = 152,["81"] = 159,["82"] = 160,["83"] = 159,["84"] = 166,["85"] = 167,["86"] = 166,["87"] = 173,["88"] = 174,["89"] = 173,["90"] = 180,["91"] = 181,["92"] = 180,["93"] = 187,["94"] = 188,["95"] = 188,["96"] = 188,["97"] = 188,["98"] = 188,["99"] = 188,["100"] = 188,["101"] = 187,["102"] = 194,["103"] = 195,["104"] = 194,["105"] = 201,["106"] = 202,["107"] = 202,["108"] = 202,["109"] = 202,["110"] = 202,["111"] = 202,["112"] = 202,["113"] = 201,["114"] = 205,["115"] = 206,["116"] = 205,["117"] = 212,["118"] = 213,["119"] = 212,["125"] = 76,["127"] = 82,["128"] = 83,["137"] = 90,["146"] = 97,["148"] = 103,["149"] = 104,["159"] = 118,["161"] = 110,["162"] = 111});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.MultiboardItem = __TS__Class()
local MultiboardItem = ____exports.MultiboardItem
MultiboardItem.name = "MultiboardItem"
__TS__ClassExtends(MultiboardItem, Handle)
function MultiboardItem.prototype.____constructor(self, board, x, y)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            MultiboardGetItem(board.handle, x - 1, y - 1)
        )
    end
end
function MultiboardItem.prototype.destroy(self)
    MultiboardReleaseItem(self.handle)
end
function MultiboardItem.prototype.setIcon(self, icon)
    MultiboardSetItemIcon(self.handle, icon)
end
function MultiboardItem.prototype.setStyle(self, showValue, showIcon)
    MultiboardSetItemStyle(self.handle, showValue, showIcon)
end
function MultiboardItem.prototype.setValue(self, val)
    MultiboardSetItemValue(self.handle, val)
end
function MultiboardItem.prototype.setValueColor(self, red, green, blue, alpha)
    MultiboardSetItemValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function MultiboardItem.prototype.setWidth(self, width)
    MultiboardSetItemWidth(self.handle, width)
end
function MultiboardItem.fromHandle(self, handle)
    return self:getObject(handle)
end
____exports.Multiboard = __TS__Class()
local Multiboard = ____exports.Multiboard
Multiboard.name = "Multiboard"
__TS__ClassExtends(Multiboard, Handle)
function Multiboard.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateMultiboard()
        )
    end
end
function Multiboard.prototype.clear(self)
    MultiboardClear(self.handle)
end
function Multiboard.prototype.createItem(self, x, y)
    return __TS__New(____exports.MultiboardItem, self, x, y)
end
function Multiboard.prototype.destroy(self)
    DestroyMultiboard(self.handle)
end
function Multiboard.prototype.display(self, show)
    MultiboardDisplay(self.handle, show)
end
function Multiboard.prototype.minimize(self, flag)
    MultiboardMinimize(self.handle, flag)
end
function Multiboard.prototype.minimized(self)
    return IsMultiboardMinimized(self.handle)
end
function Multiboard.prototype.setItemsIcons(self, icon)
    MultiboardSetItemsIcon(self.handle, icon)
end
function Multiboard.prototype.setItemsStyle(self, showValues, showIcons)
    MultiboardSetItemsStyle(self.handle, showValues, showIcons)
end
function Multiboard.prototype.setItemsValue(self, value)
    MultiboardSetItemsValue(self.handle, value)
end
function Multiboard.prototype.setItemsValueColor(self, red, green, blue, alpha)
    MultiboardSetItemsValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Multiboard.prototype.setItemsWidth(self, width)
    MultiboardSetItemsWidth(self.handle, width)
end
function Multiboard.prototype.setTitleTextColor(self, red, green, blue, alpha)
    MultiboardSetTitleTextColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Multiboard.fromHandle(self, handle)
    return self:getObject(handle)
end
function Multiboard.suppressDisplay(self, flag)
    MultiboardSuppressDisplay(flag)
end
__TS__SetDescriptor(
    Multiboard.prototype,
    "columns",
    {
        get = function(self)
            return MultiboardGetColumnCount(self.handle)
        end,
        set = function(self, count)
            MultiboardSetColumnCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "displayed",
    {get = function(self)
        return IsMultiboardDisplayed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "rows",
    {
        get = function(self)
            return MultiboardGetRowCount(self.handle)
        end,
        set = function(self, count)
            MultiboardSetRowCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Multiboard.prototype,
    "title",
    {
        get = function(self)
            return MultiboardGetTitleText(self.handle)
        end,
        set = function(self, label)
            MultiboardSetTitleText(self.handle, label)
        end
    },
    true
)
return ____exports
