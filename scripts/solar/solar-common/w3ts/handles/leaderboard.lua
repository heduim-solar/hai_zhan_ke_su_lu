local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 6,["13"] = 6,["15"] = 9,["16"] = 6,["18"] = 6,["19"] = 12,["20"] = 12,["21"] = 12,["23"] = 8,["24"] = 22,["25"] = 23,["26"] = 22,["27"] = 29,["28"] = 30,["29"] = 29,["30"] = 36,["31"] = 37,["32"] = 36,["33"] = 43,["34"] = 43,["35"] = 43,["37"] = 44,["38"] = 43,["39"] = 73,["40"] = 74,["41"] = 73,["42"] = 81,["43"] = 82,["44"] = 81,["45"] = 89,["46"] = 90,["47"] = 89,["48"] = 97,["49"] = 98,["50"] = 97,["51"] = 106,["52"] = 107,["53"] = 106,["54"] = 118,["55"] = 119,["56"] = 119,["57"] = 119,["58"] = 119,["59"] = 119,["60"] = 119,["61"] = 119,["62"] = 119,["63"] = 118,["64"] = 129,["65"] = 129,["66"] = 129,["68"] = 129,["69"] = 129,["71"] = 129,["72"] = 129,["74"] = 130,["75"] = 130,["76"] = 130,["77"] = 130,["78"] = 130,["79"] = 130,["80"] = 130,["81"] = 129,["82"] = 138,["83"] = 139,["84"] = 138,["85"] = 150,["86"] = 151,["87"] = 151,["88"] = 151,["89"] = 151,["90"] = 151,["91"] = 151,["92"] = 151,["93"] = 151,["94"] = 150,["95"] = 157,["96"] = 158,["97"] = 158,["98"] = 158,["99"] = 158,["100"] = 158,["101"] = 158,["102"] = 158,["103"] = 157,["104"] = 164,["105"] = 165,["106"] = 164,["107"] = 175,["108"] = 175,["109"] = 175,["111"] = 175,["112"] = 175,["114"] = 175,["115"] = 175,["117"] = 175,["118"] = 175,["120"] = 176,["121"] = 176,["122"] = 176,["123"] = 176,["124"] = 176,["125"] = 176,["126"] = 176,["127"] = 175,["128"] = 182,["129"] = 183,["130"] = 183,["131"] = 183,["132"] = 183,["133"] = 183,["134"] = 183,["135"] = 183,["136"] = 182,["137"] = 190,["138"] = 190,["139"] = 190,["141"] = 191,["142"] = 190,["143"] = 198,["144"] = 198,["145"] = 198,["147"] = 199,["148"] = 198,["149"] = 206,["150"] = 206,["151"] = 206,["153"] = 207,["154"] = 206,["155"] = 226,["156"] = 227,["157"] = 226,["158"] = 230,["159"] = 231,["160"] = 230,["165"] = 51,["174"] = 58,["176"] = 65,["177"] = 66,["187"] = 223,["189"] = 214,["190"] = 215});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Leaderboard = __TS__Class()
local Leaderboard = ____exports.Leaderboard
Leaderboard.name = "Leaderboard"
__TS__ClassExtends(Leaderboard, Handle)
function Leaderboard.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateLeaderboard()
        )
    end
end
function Leaderboard.prototype.addItem(self, label, value, p)
    LeaderboardAddItem(self.handle, label, value, p.handle)
end
function Leaderboard.prototype.clear(self)
    LeaderboardClear(self.handle)
end
function Leaderboard.prototype.destroy(self)
    DestroyLeaderboard(self.handle)
end
function Leaderboard.prototype.display(self, flag)
    if flag == nil then
        flag = true
    end
    LeaderboardDisplay(self.handle, flag)
end
function Leaderboard.prototype.getPlayerIndex(self, p)
    return LeaderboardGetPlayerIndex(self.handle, p.handle)
end
function Leaderboard.prototype.hasPlayerItem(self, p)
    LeaderboardHasPlayerItem(self.handle, p.handle)
end
function Leaderboard.prototype.removeItem(self, index)
    LeaderboardRemoveItem(self.handle, index)
end
function Leaderboard.prototype.removePlayerItem(self, p)
    LeaderboardRemovePlayerItem(self.handle, p.handle)
end
function Leaderboard.prototype.setItemLabel(self, item, label)
    LeaderboardSetItemLabel(self.handle, item, label)
end
function Leaderboard.prototype.setItemLabelColor(self, item, red, green, blue, alpha)
    LeaderboardSetItemLabelColor(
        self.handle,
        item,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setItemStyle(self, item, showLabel, showValues, showIcons)
    if showLabel == nil then
        showLabel = true
    end
    if showValues == nil then
        showValues = true
    end
    if showIcons == nil then
        showIcons = true
    end
    LeaderboardSetItemStyle(
        self.handle,
        item,
        showLabel,
        showValues,
        showIcons
    )
end
function Leaderboard.prototype.setItemValue(self, item, value)
    LeaderboardSetItemValue(self.handle, item, value)
end
function Leaderboard.prototype.setItemValueColor(self, item, red, green, blue, alpha)
    LeaderboardSetItemValueColor(
        self.handle,
        item,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setLabelColor(self, red, green, blue, alpha)
    LeaderboardSetLabelColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.setPlayerBoard(self, p)
    PlayerSetLeaderboard(p.handle, self.handle)
end
function Leaderboard.prototype.setStyle(self, showLabel, showNames, showValues, showIcons)
    if showLabel == nil then
        showLabel = true
    end
    if showNames == nil then
        showNames = true
    end
    if showValues == nil then
        showValues = true
    end
    if showIcons == nil then
        showIcons = true
    end
    LeaderboardSetStyle(
        self.handle,
        showLabel,
        showNames,
        showValues,
        showIcons
    )
end
function Leaderboard.prototype.setValueColor(self, red, green, blue, alpha)
    LeaderboardSetValueColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Leaderboard.prototype.sortByLabel(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByLabel(self.handle, asc)
end
function Leaderboard.prototype.sortByPlayer(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByPlayer(self.handle, asc)
end
function Leaderboard.prototype.sortByValue(self, asc)
    if asc == nil then
        asc = true
    end
    LeaderboardSortItemsByValue(self.handle, asc)
end
function Leaderboard.fromHandle(self, handle)
    return self:getObject(handle)
end
function Leaderboard.fromPlayer(self, p)
    return self:fromHandle(PlayerGetLeaderboard(p.handle))
end
__TS__SetDescriptor(
    Leaderboard.prototype,
    "displayed",
    {get = function(self)
        return IsLeaderboardDisplayed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Leaderboard.prototype,
    "itemCount",
    {
        get = function(self)
            return LeaderboardGetItemCount(self.handle)
        end,
        set = function(self, count)
            LeaderboardSetSizeByItemCount(self.handle, count)
        end
    },
    true
)
__TS__SetDescriptor(
    Leaderboard.prototype,
    "label",
    {
        get = function(self)
            return LeaderboardGetLabelText(self.handle)
        end,
        set = function(self, value)
            LeaderboardSetLabel(self.handle, value)
        end
    },
    true
)
return ____exports
