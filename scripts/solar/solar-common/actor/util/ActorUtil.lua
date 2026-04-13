local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 8,["15"] = 17,["16"] = 18,["17"] = 19,["19"] = 21,["20"] = 22,["21"] = 23,["22"] = 25,["23"] = 26,["24"] = 27,["26"] = 30,["27"] = 31,["28"] = 32,["29"] = 33,["31"] = 35,["32"] = 36,["33"] = 36,["34"] = 37,["35"] = 38,["39"] = 43,["40"] = 44,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 48,["45"] = 49,["47"] = 51,["52"] = 56,["54"] = 57,["55"] = 57,["56"] = 58,["57"] = 59,["58"] = 60,["59"] = 60,["60"] = 61,["61"] = 62,["62"] = 63,["64"] = 65,["67"] = 57,["70"] = 69,["71"] = 17,["72"] = 78,["73"] = 79,["74"] = 80,["77"] = 83,["78"] = 84,["79"] = 85,["82"] = 78,["83"] = 95,["84"] = 96,["85"] = 97,["88"] = 100,["89"] = 101,["90"] = 102,["91"] = 103,["94"] = 106,["95"] = 95,["96"] = 116,["97"] = 117,["98"] = 118,["101"] = 121,["102"] = 122,["104"] = 123,["105"] = 124,["107"] = 126,["108"] = 127,["110"] = 129,["111"] = 130,["113"] = 132,["117"] = 134,["118"] = 116,["119"] = 141,["120"] = 142,["121"] = 143,["122"] = 144,["123"] = 146,["125"] = 146,["127"] = 146,["128"] = 147,["129"] = 148,["131"] = 151,["132"] = 152,["133"] = 153,["134"] = 154,["136"] = 156,["137"] = 157,["138"] = 157,["140"] = 157,["142"] = 157,["143"] = 158,["144"] = 159,["148"] = 164,["149"] = 165,["150"] = 166,["151"] = 167,["153"] = 167,["155"] = 167,["156"] = 168,["157"] = 169,["158"] = 170,["160"] = 172,["165"] = 177,["167"] = 178,["168"] = 178,["169"] = 179,["170"] = 180,["171"] = 181,["172"] = 181,["174"] = 181,["176"] = 181,["177"] = 182,["178"] = 183,["179"] = 184,["181"] = 186,["184"] = 178,["187"] = 190,["188"] = 141,["189"] = 199,["190"] = 200,["191"] = 201,["194"] = 204,["195"] = 205,["196"] = 206,["200"] = 199,["201"] = 217,["202"] = 218,["203"] = 219,["204"] = 220,["206"] = 222,["207"] = 223,["208"] = 224,["211"] = 227,["212"] = 217,["213"] = 233,["214"] = 234,["215"] = 234,["216"] = 233,["217"] = 240,["218"] = 241,["219"] = 241,["220"] = 240,["221"] = 247,["222"] = 248,["223"] = 248,["224"] = 247});
local ____exports = {}
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorUtil = ____exports.default
ActorUtil.name = "ActorUtil"
function ActorUtil.prototype.____constructor(self)
end
function ActorUtil.getUnitAllActorList(self, unit)
    if not IsHandle(unit) then
        return nil
    end
    local actorList = nil
    local solarData = DataBase:getUnitSolarData(unit, false)
    if solarData ~= nil then
        local actor = solarData._SL_solarActorUnit
        if actor ~= nil then
            actorList = {actor}
        end
        local abilityTemplate = solarData._SL_abilityTemplate
        if abilityTemplate ~= nil then
            if actorList == nil then
                actorList = {}
            end
            for abilityTemplateKey in pairs(abilityTemplate) do
                local ____opt_0 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
                local actor = ____opt_0 and ____opt_0._SL_solarActorAbility
                if actor ~= nil then
                    actorList[#actorList + 1] = actor
                end
            end
        end
        local _SL_solarActorBuffSet = solarData._SL_solarActorBuffSet
        if _SL_solarActorBuffSet then
            for actorBuffSetKey in pairs(_SL_solarActorBuffSet) do
                local actor = _SL_solarActorBuffSet[actorBuffSetKey]
                if actor ~= nil then
                    if actorList == nil then
                        actorList = {}
                    end
                    actorList[#actorList + 1] = actor
                end
            end
        end
    end
    local invSize = UnitInventorySize(unit)
    do
        local i = 0
        while i < invSize do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_2 = DataBase:getItemSolarData(item, false)
                local actor = ____opt_2 and ____opt_2._SL_solarActorItem
                if actor ~= nil then
                    if actorList == nil then
                        actorList = {}
                    end
                    actorList[#actorList + 1] = actor
                end
            end
            i = i + 1
        end
    end
    return actorList
end
function ActorUtil.forUnitAllActorList(self, unit, callback, clazz)
    local actorList = ____exports.default:getUnitAllActorList(unit)
    if actorList == nil then
        return
    end
    for ____, actor in ipairs(actorList) do
        if clazz == nil or clazz == actor:get("class") then
            callback(nil, actor)
        end
    end
end
function ActorUtil.getUnitAllActorListByClass(self, unit, clazz)
    local actorList = ____exports.default:getUnitAllActorList(unit)
    if actorList == nil then
        return
    end
    local result = {}
    for ____, actor in ipairs(actorList) do
        if clazz == nil or clazz == actor:get("class") then
            result[#result + 1] = actor
        end
    end
    return result
end
function ActorUtil.getUnitAllActorListAndWhere(self, unit, clazz, kind, tag)
    local actorList = ____exports.default:getUnitAllActorList(unit)
    if actorList == nil then
        return
    end
    local result = {}
    for ____, actor in ipairs(actorList) do
        do
            if clazz ~= nil and clazz ~= actor:get("class") then
                goto __continue34
            end
            if kind ~= nil and kind ~= actor:get("kind") then
                goto __continue34
            end
            if tag ~= nil and tag ~= actor:get("tag") then
                goto __continue34
            end
            result[#result + 1] = actor
        end
        ::__continue34::
    end
    return result
end
function ActorUtil.getUnitAllActorAttributes(self, unit)
    local attributeArray = nil
    local solarData = DataBase:getUnitSolarData(unit, false)
    if solarData ~= nil then
        local ____opt_4 = solarData._SL_solarActorUnit
        if ____opt_4 ~= nil then
            ____opt_4 = ____opt_4.attribute
        end
        local attribute = ____opt_4
        if attribute ~= nil then
            attributeArray = {attribute}
        end
        local abilityTemplate = solarData._SL_abilityTemplate
        if abilityTemplate ~= nil then
            if attributeArray == nil then
                attributeArray = {}
            end
            for abilityTemplateKey in pairs(abilityTemplate) do
                local ____opt_8 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
                local ____opt_6 = ____opt_8 and ____opt_8._SL_solarActorAbility
                if ____opt_6 ~= nil then
                    ____opt_6 = ____opt_6.attribute
                end
                local attribute = ____opt_6
                if attribute ~= nil then
                    attributeArray[#attributeArray + 1] = attribute
                end
            end
        end
        local _SL_solarActorBuffSet = solarData._SL_solarActorBuffSet
        if _SL_solarActorBuffSet then
            for actorBuffSetKey in pairs(_SL_solarActorBuffSet) do
                local ____opt_10 = _SL_solarActorBuffSet[actorBuffSetKey]
                if ____opt_10 ~= nil then
                    ____opt_10 = ____opt_10.attribute
                end
                local attribute = ____opt_10
                if attribute ~= nil then
                    if attributeArray == nil then
                        attributeArray = {}
                    end
                    attributeArray[#attributeArray + 1] = attribute
                end
            end
        end
    end
    local invSize = UnitInventorySize(unit)
    do
        local i = 0
        while i < invSize do
            local item = UnitItemInSlot(unit, i)
            if IsHandle(item) then
                local ____opt_14 = DataBase:getItemSolarData(item, false)
                local ____opt_12 = ____opt_14 and ____opt_14._SL_solarActorItem
                if ____opt_12 ~= nil then
                    ____opt_12 = ____opt_12.attribute
                end
                local attribute = ____opt_12
                if attribute ~= nil then
                    if attributeArray == nil then
                        attributeArray = {}
                    end
                    attributeArray[#attributeArray + 1] = attribute
                end
            end
            i = i + 1
        end
    end
    return attributeArray
end
function ActorUtil.ifUnitHasActor(self, unit, actorTypeId, callBack)
    local unitAllActorList = ____exports.default:getUnitAllActorList(unit)
    if unitAllActorList == nil then
        return
    end
    for ____, actor in ipairs(unitAllActorList) do
        if actor.actorTypeId == actorTypeId then
            callBack(nil, actor)
            return
        end
    end
end
function ActorUtil.isUnitHasActor(self, unit, actorTypeId)
    local unitAllActorList = ____exports.default:getUnitAllActorList(unit)
    if unitAllActorList == nil then
        return false
    end
    for ____, actor in ipairs(unitAllActorList) do
        if actor.actorTypeId == actorTypeId then
            return true
        end
    end
    return false
end
function ActorUtil.addAnyActorCreatedListener(self, onActorCreatedListener)
    local ____Actor__sl_anyActorCreatedListeners_16 = Actor._sl_anyActorCreatedListeners
    ____Actor__sl_anyActorCreatedListeners_16[#____Actor__sl_anyActorCreatedListeners_16 + 1] = onActorCreatedListener
end
function ActorUtil.addAnyActorLevelChangeListener(self, onActorLevelChangeListener)
    local ____Actor__sl_anyActorLevelChangeListeners_17 = Actor._sl_anyActorLevelChangeListeners
    ____Actor__sl_anyActorLevelChangeListeners_17[#____Actor__sl_anyActorLevelChangeListeners_17 + 1] = onActorLevelChangeListener
end
function ActorUtil.addAnyActorDestroyListener(self, onActorDestroyListener)
    local ____Actor__sl_anyActorDestroyListeners_18 = Actor._sl_anyActorDestroyListeners
    ____Actor__sl_anyActorDestroyListeners_18[#____Actor__sl_anyActorDestroyListeners_18 + 1] = onActorDestroyListener
end
return ____exports
