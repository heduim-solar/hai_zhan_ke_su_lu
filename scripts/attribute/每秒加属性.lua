local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 50,["16"] = 50,["17"] = 50,["19"] = 52,["20"] = 53,["21"] = 54,["22"] = 55,["23"] = 54,["24"] = 51,["25"] = 60,["26"] = 61,["27"] = 62,["28"] = 63,["29"] = 64,["30"] = 65,["32"] = 67,["34"] = 70,["35"] = 71,["36"] = 72,["37"] = 73,["39"] = 75,["40"] = 75,["41"] = 75,["42"] = 75,["43"] = 76,["45"] = 79,["46"] = 80,["47"] = 81,["48"] = 82,["50"] = 84,["51"] = 84,["52"] = 84,["53"] = 84,["54"] = 85,["56"] = 88,["57"] = 89,["58"] = 90,["59"] = 91,["61"] = 94,["62"] = 94,["63"] = 94,["64"] = 94,["65"] = 94,["67"] = 98,["68"] = 99,["69"] = 100,["70"] = 101,["72"] = 103,["73"] = 103,["74"] = 103,["75"] = 103,["76"] = 103,["78"] = 106,["79"] = 107,["80"] = 108,["81"] = 109,["83"] = 111,["84"] = 111,["85"] = 111,["86"] = 111,["87"] = 111,["89"] = 114,["90"] = 115,["91"] = 116,["92"] = 117,["94"] = 119,["95"] = 120,["96"] = 120,["97"] = 120,["98"] = 120,["101"] = 61,["102"] = 60});
local ____exports = {}
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local _____6BCF_79D2_52A0_5C5E_6027 = ____exports.default
_____6BCF_79D2_52A0_5C5E_6027.name = "每秒加属性"
function _____6BCF_79D2_52A0_5C5E_6027.prototype.____constructor(self)
    local t = __TS__New(Trigger)
    t:registerTimerEvent(1, true)
    t:addAction(function()
        ____exports.default:doAllUnitsAttribute()
    end)
end
function _____6BCF_79D2_52A0_5C5E_6027.doAllUnitsAttribute(self)
    AttributeUtil:forAllUnitsAttribute(function(____, unitHandle, attribute)
        if attribute.add_max_life_on_pers then
            local add = attribute.add_max_life_on_pers
            if attribute.add_max_life_on_pers_p then
                add = attribute.add_max_life_on_pers * (attribute.add_max_life_on_pers_p + 1)
            end
            UnitStateUtil:addMaxLifeAndLife(unitHandle, attribute.add_max_life_on_pers)
        end
        if attribute.add_attack_on_pers then
            local add = attribute.add_attack_on_pers
            if attribute.add_attack_on_pers_p then
                add = attribute.add_attack_on_pers * (attribute.add_attack_on_pers_p + 1)
            end
            local attack = GetUnitState(
                unitHandle,
                ConvertUnitState(18)
            )
            UnitStateUtil:setDamageBase(unitHandle, add + attack)
        end
        if attribute.add_def_on_pers then
            local add = attribute.add_def_on_pers
            if attribute.add_def_on_pers_p then
                add = attribute.add_def_on_pers * (attribute.add_def_on_pers_p + 1)
            end
            local def = GetUnitState(
                unitHandle,
                ConvertUnitState(32)
            )
            UnitStateUtil:setArmor(unitHandle, add + def)
        end
        if attribute.add_strength_on_pers then
            local add = attribute.add_strength_on_pers
            if attribute.add_strength_on_pers_p then
                add = attribute.add_strength_on_pers * (attribute.add_strength_on_pers_p + 1)
            end
            SetHeroStr(
                unitHandle,
                GetHeroStr(unitHandle, false) + add,
                true
            )
        end
        if attribute.add_agility_on_pers then
            local add = attribute.add_agility_on_pers
            if attribute.add_agility_on_pers_p then
                add = attribute.add_agility_on_pers * (attribute.add_agility_on_pers_p + 1)
            end
            SetHeroAgi(
                unitHandle,
                GetHeroAgi(unitHandle, false) + add,
                true
            )
        end
        if attribute.add_intelligence_on_pers then
            local add = attribute.add_intelligence_on_pers
            if attribute.add_intelligence_on_pers_p then
                add = attribute.add_intelligence_on_pers * (attribute.add_intelligence_on_pers_p + 1)
            end
            SetHeroInt(
                unitHandle,
                GetHeroInt(unitHandle, false) + add,
                true
            )
        end
        if attribute.add_gold_on_pers then
            local basics_gold = attribute.add_gold_on_pers
            if attribute.earn_gold_p then
                basics_gold = basics_gold * (attribute.earn_gold_p + 1)
            end
            if basics_gold > 0 then
                PlayerUtil:addGoldState(
                    GetOwningPlayer(unitHandle),
                    basics_gold
                )
            end
        end
    end)
end
return ____exports
