local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 49,["15"] = 49,["16"] = 49,["18"] = 51,["19"] = 52,["22"] = 55,["23"] = 56,["24"] = 58,["25"] = 59,["26"] = 59,["27"] = 59,["28"] = 59,["29"] = 60,["30"] = 61,["32"] = 64,["33"] = 65,["34"] = 67,["35"] = 68,["37"] = 71,["38"] = 72,["40"] = 76,["41"] = 77,["42"] = 78,["43"] = 79,["45"] = 81,["46"] = 82,["47"] = 82,["48"] = 82,["49"] = 82,["50"] = 83,["52"] = 88,["53"] = 89,["54"] = 90,["55"] = 91,["57"] = 93,["58"] = 94,["59"] = 94,["60"] = 94,["61"] = 94,["62"] = 95,["64"] = 100,["65"] = 101,["66"] = 102,["67"] = 103,["69"] = 105,["70"] = 106,["71"] = 106,["72"] = 106,["73"] = 106,["74"] = 106,["76"] = 111,["77"] = 112,["78"] = 113,["79"] = 114,["81"] = 116,["82"] = 117,["83"] = 117,["84"] = 117,["85"] = 117,["86"] = 117,["88"] = 121,["89"] = 122,["90"] = 123,["91"] = 124,["93"] = 126,["94"] = 127,["95"] = 127,["96"] = 127,["97"] = 127,["98"] = 127,["100"] = 130,["101"] = 131,["102"] = 131,["103"] = 131,["104"] = 131,["105"] = 132,["107"] = 135,["108"] = 136,["109"] = 137,["110"] = 138,["112"] = 140,["113"] = 141,["114"] = 141,["115"] = 141,["116"] = 141,["119"] = 51,["120"] = 50});
local ____exports = {}
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local _____6740_654C_52A0_5C5E_6027 = ____exports.default
_____6740_654C_52A0_5C5E_6027.name = "杀敌加属性"
function _____6740_654C_52A0_5C5E_6027.prototype.____constructor(self)
    se:onUnitDeath(function(e)
        if not e.hasKillingUnit then
            return
        end
        local triggerunit = e.trigUnit
        local killunit = e.killingUnit
        local attribute = AttributeUtil:getUnitAttribute(killunit)
        if IsUnitEnemy(
            triggerunit,
            GetOwningPlayer(killunit)
        ) and IsHandle(killunit) and attribute then
            if attribute.reply_life_on_kill then
                UnitStateUtil:addLife(killunit, attribute.reply_life_on_kill)
            end
            local add_max_life = attribute.add_max_life_on_kill or 0
            local add_max_life_on_kill_p = attribute.add_max_life_on_kill_p or 0
            if add_max_life_on_kill_p ~= 0 then
                add_max_life = add_max_life * (add_max_life_on_kill_p + 1)
            end
            if add_max_life > 0 then
                UnitStateUtil:addMaxLifeAndLife(killunit, add_max_life)
            end
            local add_attack_on_kill = attribute.add_attack_on_kill or 0
            local add_attack_on_kill_p = attribute.add_attack_on_kill_p or 0
            if add_attack_on_kill_p ~= 0 then
                add_attack_on_kill = add_attack_on_kill * (add_attack_on_kill_p + 1)
            end
            if add_attack_on_kill > 0 then
                local attack = GetUnitState(
                    killunit,
                    ConvertUnitState(18)
                )
                UnitStateUtil:setDamageBase(killunit, add_attack_on_kill + attack)
            end
            local add_def_on_kill = attribute.add_def_on_kill or 0
            local add_def_on_kill_p = attribute.add_def_on_kill_p or 0
            if add_def_on_kill_p ~= 0 then
                add_def_on_kill = add_def_on_kill * (add_def_on_kill_p + 1)
            end
            if add_def_on_kill > 0 then
                local def = GetUnitState(
                    killunit,
                    ConvertUnitState(32)
                )
                UnitStateUtil:setArmor(killunit, add_def_on_kill + def)
            end
            local add_strength_on_kill = attribute.add_strength_on_kill or 0
            local add_strength_on_kill_p = attribute.add_strength_on_kill_p or 0
            if add_strength_on_kill_p ~= 0 then
                add_strength_on_kill = add_strength_on_kill * (add_strength_on_kill_p + 1)
            end
            if add_strength_on_kill > 0 then
                SetHeroStr(
                    killunit,
                    GetHeroStr(killunit, false) + add_strength_on_kill,
                    true
                )
            end
            local add_agility_on_kill = attribute.add_agility_on_kill or 0
            local add_agility_on_kill_p = attribute.add_agility_on_kill_p or 0
            if add_agility_on_kill_p ~= 0 then
                add_agility_on_kill = add_agility_on_kill * (add_agility_on_kill_p + 1)
            end
            if add_agility_on_kill > 0 then
                SetHeroAgi(
                    killunit,
                    GetHeroAgi(killunit, false) + add_agility_on_kill,
                    true
                )
            end
            local add_intelligence_on_kill = attribute.add_intelligence_on_kill or 0
            local add_intelligence_on_kill_p = attribute.add_intelligence_on_kill_p or 0
            if add_intelligence_on_kill_p ~= 0 then
                add_intelligence_on_kill = add_intelligence_on_kill * (add_intelligence_on_kill_p + 1)
            end
            if add_intelligence_on_kill > 0 then
                SetHeroInt(
                    killunit,
                    GetHeroInt(killunit, false) + add_intelligence_on_kill,
                    true
                )
            end
            if attribute.add_killCount_on_kill and attribute.add_killCount_on_kill > 0 then
                local solarData = DataBase:getPlayerSolarData(
                    GetOwningPlayer(killunit),
                    true
                )
                solarData.killCount = (solarData.killCount or 0) + attribute.add_killCount_on_kill
            end
            local gold = attribute.add_gold_on_kill or 0
            local basics_gold = attribute.earn_gold_p or 0
            if gold ~= 0 and basics_gold ~= 0 then
                gold = gold * (basics_gold + 1)
            end
            if gold > 0 then
                PlayerUtil:addGoldState(
                    GetOwningPlayer(killunit),
                    gold
                )
            end
        end
    end)
end
return ____exports
