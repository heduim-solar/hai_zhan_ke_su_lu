local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 15,["24"] = 15,["25"] = 15,["27"] = 25,["28"] = 26,["31"] = 29,["32"] = 29,["33"] = 29,["34"] = 30,["35"] = 31,["36"] = 31,["37"] = 31,["38"] = 32,["39"] = 31,["40"] = 31,["41"] = 35,["43"] = 29,["44"] = 29,["45"] = 39,["46"] = 40,["47"] = 41,["48"] = 42,["49"] = 43,["50"] = 44,["51"] = 45,["52"] = 46,["53"] = 47,["54"] = 48,["55"] = 49,["57"] = 42,["58"] = 54,["59"] = 56,["60"] = 57,["61"] = 58,["62"] = 59,["63"] = 58,["64"] = 57,["65"] = 63,["66"] = 63,["67"] = 63,["68"] = 64,["69"] = 64,["70"] = 64,["71"] = 65,["72"] = 66,["73"] = 65,["74"] = 64,["75"] = 64,["76"] = 63,["77"] = 63,["78"] = 24,["79"] = 79,["80"] = 81,["81"] = 82,["82"] = 83,["85"] = 86,["86"] = 87,["88"] = 89,["91"] = 93,["94"] = 97,["95"] = 101,["96"] = 102,["98"] = 104,["99"] = 107,["100"] = 108,["101"] = 109,["102"] = 110,["104"] = 112,["105"] = 113,["107"] = 118,["108"] = 119,["109"] = 120,["111"] = 123,["112"] = 124,["113"] = 125,["114"] = 126,["115"] = 127,["117"] = 129,["119"] = 132,["120"] = 133,["121"] = 134,["123"] = 136,["124"] = 137,["125"] = 138,["126"] = 139,["127"] = 140,["129"] = 142,["131"] = 145,["132"] = 146,["133"] = 147,["135"] = 149,["136"] = 150,["137"] = 151,["138"] = 152,["139"] = 153,["141"] = 156,["143"] = 159,["144"] = 160,["145"] = 161,["147"] = 165,["148"] = 166,["150"] = 169,["151"] = 170,["153"] = 173,["154"] = 174,["156"] = 177,["157"] = 178,["158"] = 179,["160"] = 182,["161"] = 183,["162"] = 184,["163"] = 185,["164"] = 186,["165"] = 187,["166"] = 189,["167"] = 190,["169"] = 192,["170"] = 193,["171"] = 194,["172"] = 195,["174"] = 197,["176"] = 200,["177"] = 201,["178"] = 202,["180"] = 204,["181"] = 205,["183"] = 207,["184"] = 208,["186"] = 210,["187"] = 211,["188"] = 212,["189"] = 213,["191"] = 215,["193"] = 217,["194"] = 218,["195"] = 219,["197"] = 221,["198"] = 222,["200"] = 224,["201"] = 225,["203"] = 227,["204"] = 228,["205"] = 229,["206"] = 230,["208"] = 232,["210"] = 234,["211"] = 235,["212"] = 236,["214"] = 238,["215"] = 239,["217"] = 242,["218"] = 242,["219"] = 242,["220"] = 242,["221"] = 242,["222"] = 242,["223"] = 242,["224"] = 79,["225"] = 16,["226"] = 19});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____HandleUtil = require("solar.solar-common.util.lang.HandleUtil")
local HandleUtil = ____HandleUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local UnitAttributeState = ____exports.default
UnitAttributeState.name = "UnitAttributeState"
function UnitAttributeState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new UnitAttributeState()")
        return
    end
    BaseUtil.runLater(
        0.1,
        function()
            for configKey in pairs(____exports.default.config) do
                SingletonUtil:executeOnce(
                    "UnitAttributeState.config:警告",
                    function()
                        print("不推荐在UnitAttributeState.config设置属性," .. "请直接使用AttributeUtil.setUnitTypeAttribute设置属性。这个方式将在未来移除!")
                    end
                )
                AttributeUtil:setUnitTypeAttribute(configKey, ____exports.default.config[configKey])
            end
        end
    )
    local enterRectTrigger = __TS__New(Trigger)
    enterRectTrigger:registerEnterRect(GetPlayableMapRect())
    enterRectTrigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
    enterRectTrigger:addAction(function()
        local triggerUnit = GetTriggerUnit()
        local typeStr = id2string(GetUnitTypeId(triggerUnit))
        local utsa = AttributeUtil:getUnitTypeAttribute(typeStr)
        if utsa then
            local unitAttribute = AttributeUtil:getUnitAttribute(triggerUnit, true)
            AttributeUtil:add(unitAttribute, utsa)
            ____exports.default:refreshUnitSolarAttribute(triggerUnit, utsa)
        end
    end)
    local triggerTimer = __TS__New(Trigger)
    triggerTimer:registerTimerEvent(1.97, true)
    triggerTimer:addAction(function()
        AttributeUtil:forAllUnitsAttribute(function(____, unitHandle, attribute)
            ____exports.default:refreshUnitSolarAttribute(unitHandle, attribute)
        end)
    end)
    BaseUtil.runLater(
        0.01,
        function()
            se:on(
                "属性刷新",
                function()
                    AttributeUtil:forAllUnitsAttribute(function(____, unitHandle, attribute)
                        ____exports.default:refreshUnitSolarAttribute(unitHandle, attribute)
                    end)
                end
            )
        end
    )
end
function UnitAttributeState.refreshUnitSolarAttribute(self, unitHandle, attribute)
    if isDebug and not HandleUtil:isUnitHandle(unitHandle) then
        print_r(handledef(unitHandle))
        log.errorWithTraceBack("你传的单位handle 有误。可能已被其它类型的handle对象重用")
        return
    end
    if not attribute then
        attribute = AttributeUtil:getUnitAttribute(unitHandle)
    end
    if not attribute then
        return
    end
    if not UnitStateUtil:isAlive(unitHandle) then
        return
    end
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if attribute.attack then
        UnitUtil.setExtraAttack(unitHandle, attribute.attack or 0, "_SLA_attack")
    end
    if attribute.attack_p then
        local base = GetUnitState(unitHandle, UnitStateDamageMax) - (solarData._sla_temp_attack_p or 0)
        local val = (attribute.attack_p or 0) * base
        if val < 2100000000 then
            val = math.floor(val)
        end
        solarData._sla_temp_attack_p = val
        UnitUtil.setExtraAttack(unitHandle, val, "_SLA_attack_p")
    end
    if attribute.life then
        local val = attribute.life or 0
        UnitUtil.setExtraHp(unitHandle, val, "_SLA_life")
    end
    if attribute.life_p then
        local base = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) - UnitUtil.getExtraHp(unitHandle, "_SLA_life_p")
        local val = (attribute.life_p or 0) * base
        if val < 2100000000 then
            val = math.floor(val)
        end
        UnitUtil.setExtraHp(unitHandle, val, "_SLA_life_p")
    end
    if attribute.mana then
        local val = attribute.mana and attribute.mana or 0
        UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana")
    end
    if attribute.mana_p then
        local base = GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) - UnitUtil.getExtraMana(unitHandle, "_SLA_mana_p")
        local val = (attribute.mana_p or 0) * base
        if val < 2100000000 then
            val = math.floor(val)
        end
        UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana_p")
    end
    if attribute.def ~= nil then
        local val = attribute.def or 0
        UnitUtil.setExtraDef(unitHandle, val, "_SLA_def")
    end
    if attribute.def_p ~= nil then
        local base = GetUnitState(unitHandle, UnitStateArmor) - UnitUtil.getExtraDef(unitHandle, "_SLA_def_p")
        local val = (attribute.def_p or 0) * base
        if val < 2100000000 then
            val = math.floor(val)
        end
        UnitUtil.setExtraDef(unitHandle, val, "_SLA_def_p")
    end
    if attribute.attackSpd_p ~= nil then
        local val = attribute.attackSpd_p
        UnitUtil.setExtraAttackSpd(unitHandle, val, "_SLA_attackSpd_p")
    end
    if attribute.damage_cool ~= nil then
        UnitUtil.setExtraDamageCool(unitHandle, attribute.damage_cool, "_SLA_damage_cool")
    end
    if attribute.damage_range ~= nil then
        UnitUtil.setExtraDamageRange(unitHandle, attribute.damage_range, "_SLA_damage_range")
    end
    if attribute.move_speed ~= nil then
        UnitUtil.setExtraMoveSpeed(unitHandle, attribute.move_speed, "_SLA_move_speed")
    end
    if attribute.move_speed_p ~= nil then
        local ms = GetUnitMoveSpeed(unitHandle) * attribute.move_speed_p
        UnitUtil.setExtraMoveSpeed(unitHandle, ms, "_SLA_move_speed_p")
    end
    local strength = attribute.full_property or 0
    local agility = strength
    local intelligence = strength
    local strength_p = (attribute.full_property_p or 0) + (attribute.strength_p or 0)
    local agility_p = (attribute.full_property_p or 0) + (attribute.agility_p or 0)
    local intelligence_p = (attribute.full_property_p or 0) + (attribute.intelligence_p or 0)
    if attribute.strength then
        strength = strength + attribute.strength
    end
    if strength_p then
        local base = 0
        if ____exports.default.greenIncrease then
            base = GetHeroStr(unitHandle, true) - (solarData._sla_temp_strength_p or 0)
        else
            base = GetHeroStr(unitHandle, false)
        end
        local val = (strength_p or 0) * base
        if val < 2100000000 then
            val = math.floor(val)
        end
        strength = strength + val
        solarData._sla_temp_strength_p = val
    end
    if attribute.agility then
        agility = agility + attribute.agility
    end
    if agility_p then
        local base = 0
        if ____exports.default.greenIncrease then
            base = GetHeroAgi(unitHandle, true) - (solarData._sla_temp_agility_p or 0)
        else
            base = GetHeroAgi(unitHandle, false)
        end
        local val = (agility_p or 0) * base
        if val < 2100000000 then
            val = math.floor(val)
        end
        agility = agility + val
        solarData._sla_temp_agility_p = val
    end
    if attribute.intelligence then
        intelligence = intelligence + attribute.intelligence
    end
    if intelligence_p then
        local base = 0
        if ____exports.default.greenIncrease then
            base = GetHeroInt(unitHandle, true) - (solarData._sla_temp_intelligence_p or 0)
        else
            base = GetHeroInt(unitHandle, false)
        end
        local val = (intelligence_p or 0) * base
        if val < 2100000000 then
            val = math.floor(val)
        end
        intelligence = intelligence + val
        solarData._sla_temp_intelligence_p = val
    end
    UnitUtil.setExtraStrAgiInt(
        unitHandle,
        "_SLA_StrAgiInt",
        strength,
        agility,
        intelligence
    )
end
UnitAttributeState.greenIncrease = true
UnitAttributeState.config = {}
return ____exports
