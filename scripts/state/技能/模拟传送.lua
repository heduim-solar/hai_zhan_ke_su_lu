local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 10,["21"] = 10,["22"] = 10,["24"] = 22,["25"] = 22,["26"] = 23,["27"] = 24,["28"] = 25,["30"] = 26,["31"] = 26,["32"] = 27,["33"] = 28,["34"] = 29,["37"] = 26,["41"] = 34,["42"] = 35,["43"] = 35,["44"] = 35,["45"] = 36,["46"] = 37,["47"] = 38,["48"] = 35,["49"] = 35,["50"] = 22,["51"] = 22,["52"] = 22,["53"] = 13});
local ____exports = {}
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local _____4F20_9001 = require("xlsx.技能.传送")
local ____d__4F20_9001 = _____4F20_9001["d_传送"]
local ____TerrainUtil = require("solar.solar-wc3.util.scene.TerrainUtil")
local TerrainUtil = ____TerrainUtil.default
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
____exports.default = __TS__Class()
local _____6A21_62DF_4F20_9001 = ____exports.default
_____6A21_62DF_4F20_9001.name = "模拟传送"
function _____6A21_62DF_4F20_9001.prototype.____constructor(self)
    se:onUnitSpellEffect(
        function(e)
            local x = e.spellTargetX
            local y = e.spellTargetY
            if TerrainUtil:isTerrainLand(x, y) then
                do
                    local i = 0
                    while i < 10000 do
                        x = x + GetRandomInt(-500, 500)
                        y = y + GetRandomInt(-500, 500)
                        if not TerrainUtil:isTerrainLand(x, y) and RectUtil.isContainsCoords(bj_mapInitialPlayableArea, x, y) then
                            break
                        end
                        i = i + 1
                    end
                end
            end
            local trigUnit = e.trigUnit
            BaseUtil.runLater(
                0.1,
                function()
                    UnitUtil.transfer(trigUnit, x, y)
                    local attribute = AttributeUtil:getUnitAttribute(trigUnit, false)
                    AbilityUtil:setUnitAbilityStateCooldown(trigUnit, ____d__4F20_9001[1].id, 15 + (attribute and attribute["传送冷却"] or 0))
                end
            )
        end,
        ____d__4F20_9001[1].id
    )
end
return ____exports
