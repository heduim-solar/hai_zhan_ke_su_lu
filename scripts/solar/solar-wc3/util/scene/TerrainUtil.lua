local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 4,["9"] = 4,["10"] = 4,["12"] = 4,["13"] = 10,["14"] = 11,["15"] = 10,["16"] = 14,["17"] = 15,["18"] = 14,["19"] = 18,["20"] = 19,["21"] = 18,["22"] = 22,["23"] = 23,["24"] = 22,["25"] = 26,["26"] = 27,["27"] = 26,["28"] = 30,["29"] = 31,["30"] = 32,["31"] = 33,["32"] = 34,["33"] = 35,["34"] = 36,["35"] = 36,["36"] = 36,["37"] = 36,["38"] = 37,["39"] = 38,["40"] = 39,["41"] = 40,["43"] = 36,["44"] = 36,["45"] = 43,["46"] = 44,["47"] = 45,["48"] = 46,["49"] = 47,["50"] = 49,["51"] = 50,["52"] = 51,["53"] = 52,["55"] = 54,["56"] = 30,["57"] = 65,["58"] = 67,["59"] = 68,["60"] = 70,["61"] = 71,["64"] = 72,["65"] = 73,["66"] = 74,["69"] = 75,["70"] = 75,["71"] = 75,["72"] = 75,["73"] = 75,["74"] = 75,["75"] = 75,["76"] = 75,["77"] = 76,["79"] = 78,["81"] = 65,["82"] = 88,["83"] = 89,["84"] = 89,["85"] = 89,["86"] = 89,["87"] = 89,["88"] = 89,["89"] = 89,["90"] = 89,["91"] = 88,["92"] = 7});
local ____exports = {}
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
____exports.default = __TS__Class()
local TerrainUtil = ____exports.default
TerrainUtil.name = "TerrainUtil"
function TerrainUtil.prototype.____constructor(self)
end
function TerrainUtil.isTerrainLand(self, x, y)
    return IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY)
end
function TerrainUtil.isTerrainDeepWater(self, x, y)
    return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)
end
function TerrainUtil.isTerrainShallowWater(self, x, y)
    return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY)
end
function TerrainUtil.isTerrainPlatform(self, x, y)
    return not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY)
end
function TerrainUtil.isTerrainBuildAble(self, x, y)
    return not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) and not IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY)
end
function TerrainUtil.isTerrainWalkable(self, x, y)
    local rect = RectUtil.GetRectFromCircle(x, y, 64)
    local whichItem = CreateItem("wolg", 0, 0)
    local hideItems = {}
    local hidMax = 0
    SetItemVisible(whichItem, false)
    EnumItemsInRect(
        rect.handle,
        nil,
        function()
            if IsItemVisible(GetEnumItem()) then
                hideItems[hidMax + 1] = GetEnumItem()
                SetItemVisible(hideItems[hidMax + 1], false)
                hidMax = hidMax + 1
            end
        end
    )
    SetItemPosition(whichItem, x, y)
    local itemX = GetItemX(whichItem)
    local itemY = GetItemY(whichItem)
    SetItemVisible(whichItem, false)
    rect:destroy()
    while hidMax > 0 do
        hidMax = hidMax - 1
        SetItemVisible(hideItems[hidMax + 1], true)
        hideItems[hidMax + 1] = nil
    end
    return (itemX - x) * (itemX - x) + (itemY - y) * (itemY - y) <= ____exports.default.MAX_RANGE * ____exports.default.MAX_RANGE and not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY)
end
function TerrainUtil.raiseTerrain(self, x, y, x2, y2, height)
    local y0 = y
    local r = 32
    while true do
        if x > x2 then
            break
        end
        y = y0
        while true do
            if y > y2 then
                break
            end
            TerrainDeformCrater(
                x,
                y,
                r,
                -height,
                1,
                true
            )
            y = y + r
        end
        x = x + r
    end
end
function TerrainUtil.raiseTerrainTile(self, x, y, height)
    TerrainDeformCrater(
        x,
        y,
        1,
        -height,
        0.01,
        true
    )
end
TerrainUtil.MAX_RANGE = 10
return ____exports
