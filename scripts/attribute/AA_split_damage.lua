local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 5,["8"] = 5,["9"] = 6,["10"] = 6,["11"] = 7,["12"] = 7,["13"] = 8,["14"] = 8,["15"] = 9,["16"] = 9,["17"] = 10,["18"] = 10,["19"] = 11,["20"] = 11,["21"] = 22,["22"] = 22,["23"] = 22,["25"] = 26,["26"] = 26,["27"] = 25,["28"] = 29,["29"] = 31,["31"] = 31,["33"] = 31,["35"] = 31,["37"] = 31,["38"] = 32,["39"] = 32,["40"] = 32,["41"] = 32,["42"] = 32,["44"] = 32,["45"] = 32,["46"] = 32,["47"] = 32,["48"] = 33,["51"] = 36,["52"] = 36,["54"] = 36,["56"] = 36,["57"] = 37,["58"] = 38,["59"] = 39,["60"] = 39,["61"] = 39,["62"] = 39,["63"] = 40,["64"] = 38,["65"] = 32,["66"] = 32,["68"] = 29,["69"] = 23});
local ____exports = {}
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ColorStr = require("solar.solar-common.constant.ColorStr")
local ColorStr = ____ColorStr.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____CoolDown = require("solar.solar-common.tool.CoolDown")
local CoolDown = ____CoolDown.default
____exports.default = __TS__Class()
local AA_split_damage = ____exports.default
AA_split_damage.name = "AA_split_damage"
function AA_split_damage.prototype.____constructor(self)
    local ____SolarDamageState_config_damageEventHandlers_0 = SolarDamageState.config.damageEventHandlers
    ____SolarDamageState_config_damageEventHandlers_0[#____SolarDamageState_config_damageEventHandlers_0 + 1] = self.damageEventHandler
end
function AA_split_damage.prototype.damageEventHandler(self, event)
    local ____temp_3 = event.isAttack and event.isPhysical
    if ____temp_3 then
        local ____opt_1 = event.u1sa
        if ____opt_1 ~= nil then
            ____opt_1 = ____opt_1.split_damage
        end
        ____temp_3 = ____opt_1
    end
    if ____temp_3 then
        local ____SelectUtil_forEnemyUnitsInRange_9 = SelectUtil.forEnemyUnitsInRange
        local ____event_unit1_8 = event.unit1
        local ____event_u1sa_split_damage_range_4 = event.u1sa.split_damage_range
        if ____event_u1sa_split_damage_range_4 == nil then
            ____event_u1sa_split_damage_range_4 = 300
        end
        ____SelectUtil_forEnemyUnitsInRange_9(
            ____event_unit1_8,
            ____event_u1sa_split_damage_range_4,
            function(____, enemyUnit)
                if enemyUnit == event.unit0 then
                    return
                end
                local ____event_resultDamage_7 = event.resultDamage
                local ____opt_5 = event.u1sa
                if ____opt_5 ~= nil then
                    ____opt_5 = ____opt_5.split_damage
                end
                local flsh = ____event_resultDamage_7 * ____opt_5
                DamageUtil:damage(event.unit1, enemyUnit, flsh)
                ____exports.default.coolDown:ifReady(function()
                    local texttag = TextTagUtil.text(
                        (ColorStr.red .. "分裂:") .. TextUtil:toCnUnit(flsh),
                        enemyUnit
                    )
                    TextTagUtil.setRandomVelocity(texttag)
                end)
            end
        )
    end
end
AA_split_damage.coolDown = __TS__New(CoolDown, 1)
return ____exports
