local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 14,["20"] = 14,["21"] = 14,["22"] = 69,["23"] = 69,["24"] = 69,["26"] = 70,["27"] = 71,["30"] = 74,["31"] = 75,["32"] = 77,["34"] = 79,["35"] = 80,["36"] = 81,["37"] = 82,["38"] = 69,["39"] = 49,["40"] = 50,["41"] = 50,["42"] = 49,["43"] = 57,["44"] = 58,["45"] = 58,["46"] = 57,["47"] = 65,["48"] = 66,["49"] = 66,["50"] = 65,["51"] = 86,["52"] = 87,["53"] = 89,["56"] = 93,["57"] = 94,["58"] = 96,["61"] = 99,["62"] = 99,["63"] = 99,["64"] = 99,["67"] = 102,["68"] = 103,["69"] = 104,["70"] = 105,["71"] = 106,["72"] = 107,["74"] = 109,["77"] = 115,["78"] = 116,["79"] = 119,["80"] = 121,["81"] = 122,["82"] = 124,["83"] = 126,["84"] = 128,["85"] = 129,["86"] = 129,["87"] = 129,["88"] = 129,["91"] = 135,["92"] = 135,["93"] = 135,["94"] = 135,["95"] = 135,["96"] = 135,["97"] = 135,["98"] = 135,["99"] = 135,["100"] = 135,["101"] = 135,["102"] = 135,["103"] = 135,["104"] = 135,["105"] = 152,["106"] = 153,["107"] = 154,["108"] = 155,["109"] = 156,["113"] = 160,["114"] = 161,["115"] = 162,["116"] = 163,["120"] = 167,["121"] = 168,["122"] = 169,["123"] = 170,["127"] = 174,["128"] = 177,["129"] = 86,["130"] = 186,["131"] = 188,["132"] = 189,["133"] = 190,["136"] = 193,["137"] = 194,["138"] = 196,["140"] = 199,["141"] = 201,["142"] = 202,["144"] = 206,["145"] = 208,["146"] = 209,["148"] = 213,["149"] = 214,["151"] = 218,["152"] = 220,["153"] = 222,["154"] = 224,["155"] = 225,["157"] = 229,["158"] = 230,["161"] = 236,["162"] = 237,["163"] = 238,["166"] = 244,["167"] = 245,["168"] = 246,["170"] = 252,["171"] = 253,["173"] = 261,["174"] = 262,["177"] = 268,["178"] = 269,["179"] = 270,["182"] = 275,["183"] = 276,["184"] = 277,["186"] = 284,["187"] = 285,["188"] = 286,["189"] = 286,["190"] = 286,["191"] = 286,["192"] = 286,["193"] = 286,["194"] = 286,["195"] = 286,["197"] = 290,["198"] = 186,["199"] = 33,["200"] = 33,["201"] = 33,["202"] = 33,["203"] = 33,["204"] = 33,["205"] = 33,["206"] = 33});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local SolarDamageState = ____exports.default
SolarDamageState.name = "SolarDamageState"
function SolarDamageState.prototype.____constructor(self, useBaseAttribute)
    if useBaseAttribute == nil then
        useBaseAttribute = ____exports.default.config.useBaseAttribute
    end
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarDamageState()")
        return
    end
    ____exports.default.config.useBaseAttribute = useBaseAttribute
    if useBaseAttribute then
        ____exports.default:addEventHandler(____exports.default.calculateAttributeDamage)
    end
    isSolarDamageEnable = true
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitDamagedEvent()
    trigger:addAction(self.action)
end
function SolarDamageState.addEventHandlerFirst(self, eventHandler)
    local ____exports_default_config_firstDamageEventHandlers_0 = ____exports.default.config.firstDamageEventHandlers
    ____exports_default_config_firstDamageEventHandlers_0[#____exports_default_config_firstDamageEventHandlers_0 + 1] = eventHandler
end
function SolarDamageState.addEventHandler(self, eventHandler)
    local ____exports_default_config_damageEventHandlers_1 = ____exports.default.config.damageEventHandlers
    ____exports_default_config_damageEventHandlers_1[#____exports_default_config_damageEventHandlers_1 + 1] = eventHandler
end
function SolarDamageState.addEventHandlerLast(self, eventHandler)
    local ____exports_default_config_lastDamageEventHandlers_2 = ____exports.default.config.lastDamageEventHandlers
    ____exports_default_config_lastDamageEventHandlers_2[#____exports_default_config_lastDamageEventHandlers_2 + 1] = eventHandler
end
function SolarDamageState.prototype.action()
    local eventDamage = GetEventDamage()
    if eventDamage <= 0 then
        return
    end
    local unit0 = GetTriggerUnit()
    local unit1 = GetEventDamageSource()
    if not IsHandle(unit1) then
        return
    end
    if IsUnitAlly(
        unit0,
        GetOwningPlayer(unit1)
    ) then
        return
    end
    local isAttack = 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)
    if isBigAttributeMode and isAttack then
        local u1Attack = GetUnitState(unit1, UnitStateDamageMax)
        local u0Armor = GetUnitState(unit0, UnitStateArmor)
        eventDamage = u1Attack * (1 - MathUtil.armorReduction(u0Armor))
        EXSetEventDamage(eventDamage)
    end
    if not isSolarDamageEnable then
        return
    end
    local u0sa = AttributeUtil:getUnitAttribute(unit0)
    local u1sa = AttributeUtil:getUnitAttribute(unit1)
    local resultDamage = eventDamage
    if ____exports.default.config.useBaseAttribute and isAttack and u1sa ~= nil then
        if u1sa.def_pierce_p or u1sa.def_pierce then
            local armor = UnitStateUtil:getArmor(unit0) * (1 - (u1sa.def_pierce_p or 0))
            armor = armor - (u1sa.def_pierce or 0)
            local rd = MathUtil.armorReduction(armor)
            resultDamage = math.max(
                resultDamage,
                UnitStateUtil:getDamageMax(unit1)
            ) * (1 - rd)
        end
    end
    local event = {
        baseDamage = eventDamage,
        damageType = EXGetEventDamageData(EVENT_DAMAGE_DATA_DAMAGE_TYPE),
        weaponType = EXGetEventDamageData(EVENT_DAMAGE_DATA_WEAPON_TYPE),
        unit0 = unit0,
        unit1 = unit1,
        u0sa = u0sa,
        u1sa = u1sa,
        isAttack = isAttack,
        isRanged = 0 ~= EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_RANGED),
        isPhysical = DamageUtil:isEventPhysicalDamageType(),
        isCritical = false,
        resultDamage = resultDamage
    }
    isSolarDamageEnable = false
    for ____, damageEventHandler in ipairs(____exports.default.config.firstDamageEventHandlers) do
        damageEventHandler(nil, event)
        if event.consumed then
            isSolarDamageEnable = true
            return
        end
    end
    for ____, damageEventHandler in ipairs(____exports.default.config.damageEventHandlers) do
        damageEventHandler(nil, event)
        if event.consumed then
            isSolarDamageEnable = true
            return
        end
    end
    for ____, damageEventHandler in ipairs(____exports.default.config.lastDamageEventHandlers) do
        damageEventHandler(nil, event)
        if event.consumed then
            isSolarDamageEnable = true
            return
        end
    end
    isSolarDamageEnable = true
    EXSetEventDamage(event.resultDamage)
end
function SolarDamageState.calculateAttributeDamage(self, event)
    local u0sa = event.u0sa
    local u1sa = event.u1sa
    if u0sa == nil and u1sa == nil then
        return
    end
    local newResultDamage = event.resultDamage
    if event.isAttack and (u1sa and u1sa.attack_damage_increased) then
        newResultDamage = newResultDamage * (u1sa.attack_damage_increased + 1)
    end
    if event.isPhysical then
        if ____exports.default.config.physical_damage_increased_attack or event.isAttack == false then
            newResultDamage = newResultDamage * ((u1sa and u1sa.physical_damage_increased or 0) + 1)
        end
        if GetRandomReal(0, 1) < (u1sa and u1sa.physical_critical_chance or 0) then
            newResultDamage = newResultDamage * ((u1sa and u1sa.physical_critical_damage or 0) + 1)
            event.isCritical = true
        end
        local physical_damage_pierce = (u1sa and u1sa.physical_damage_pierce or 0) - (u0sa and u0sa.physical_damage_reduction or 0)
        newResultDamage = newResultDamage * (1 + physical_damage_pierce)
    else
        newResultDamage = newResultDamage + (u1sa and u1sa.magic_power or 0)
        newResultDamage = newResultDamage * ((u1sa and u1sa.magic_damage_increased or 0) + 1)
        if GetRandomReal(0, 1) < (u1sa and u1sa.magic_critical_chance or 0) then
            newResultDamage = newResultDamage * ((u1sa and u1sa.magic_critical_damage or 0) + 1)
            event.isCritical = true
        end
        local magic_damage_pierce = (u1sa and u1sa.magic_damage_pierce or 0) - (u0sa and u0sa.magic_damage_reduction or 0)
        newResultDamage = newResultDamage * (1 + magic_damage_pierce)
    end
    --- 根据伤害类型 增伤
    local damage_increased_dt_x = "damage_increased_dt_" .. tostring(event.damageType)
    if u1sa and u1sa[damage_increased_dt_x] then
        newResultDamage = newResultDamage * (1 + u1sa[damage_increased_dt_x])
    end
    --- 根据武器类型 增伤
    local damage_increased_wt_x = "damage_increased_wt_" .. tostring(event.weaponType)
    if u1sa and u1sa[damage_increased_wt_x] then
        newResultDamage = newResultDamage * (1 + u1sa[damage_increased_wt_x])
    end
    if u1sa and u1sa.damage_increased then
        newResultDamage = newResultDamage * (1 + u1sa.damage_increased)
    end
    if u0sa and u0sa.damage_reduction then
        newResultDamage = newResultDamage * (1 - math.min(u0sa.damage_reduction, ____exports.default.config.damage_reduction_max))
    end
    --- 根据伤害类型 抗性 减伤
    local damage_reduction_dt_x = "damage_reduction_dt_" .. tostring(event.damageType)
    if u0sa and u0sa[damage_reduction_dt_x] then
        newResultDamage = newResultDamage * (1 - u0sa[damage_reduction_dt_x])
    end
    --- 根据武器类型 抗性 减伤
    local damage_reduction_wt_x = "damage_reduction_wt_" .. tostring(event.weaponType)
    if u0sa and u0sa[damage_reduction_wt_x] then
        newResultDamage = newResultDamage * (1 - u0sa[damage_reduction_wt_x])
    end
    if u1sa and u1sa.blood_sucking then
        local add_hp = newResultDamage * u1sa.blood_sucking
        SetUnitState(
            event.unit1,
            UNIT_STATE_LIFE,
            math.max(
                0,
                GetUnitState(event.unit1, UNIT_STATE_LIFE) + add_hp
            )
        )
    end
    event.resultDamage = newResultDamage
end
SolarDamageState.config = {
    useBaseAttribute = true,
    physical_damage_increased_attack = true,
    damage_reduction_max = 0.99,
    firstDamageEventHandlers = {},
    damageEventHandlers = {},
    lastDamageEventHandlers = {}
}
return ____exports
