local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 16,["17"] = 17,["19"] = 25,["20"] = 27,["21"] = 28,["24"] = 31,["25"] = 32,["26"] = 33,["27"] = 33,["28"] = 33,["29"] = 33,["30"] = 25,["31"] = 15,["32"] = 12});
local ____exports = {}
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local _____4FEE_7406_5DE5 = require("xlsx.装备.修理工")
local ____d__4FEE_7406_5DE5 = _____4FEE_7406_5DE5["d_修理工"]
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
____exports.default = __TS__Class()
local _____4F7F_7528_7269_54C1_65F6_6062_590D_751F_547D = ____exports.default
_____4F7F_7528_7269_54C1_65F6_6062_590D_751F_547D.name = "使用物品时恢复生命"
function _____4F7F_7528_7269_54C1_65F6_6062_590D_751F_547D.prototype.____constructor(self)
    for ____, data in ipairs(____d__4FEE_7406_5DE5) do
        ____exports.default.cfg[data.id] = {base = data.attribute.reply_life_on_pers, life_p = data.reply_life_p}
    end
    se:onUnitUseItem(function(e)
        local cfgElement = ____exports.default.cfg[ActorItemUtil:getActorItemTypeId(e.manipulatedItem)]
        if not cfgElement then
            return
        end
        local unit = e.trigUnit
        UnitStateUtil:addLife(unit, cfgElement.base * 50)
        UnitStateUtil:addLife(
            unit,
            UnitStateUtil:getMaxLife(unit) * cfgElement.life_p
        )
    end)
end
_____4F7F_7528_7269_54C1_65F6_6062_590D_751F_547D.cfg = {}
return ____exports
