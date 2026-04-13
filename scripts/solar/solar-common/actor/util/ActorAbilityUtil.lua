local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 7,["12"] = 7,["13"] = 7,["15"] = 7,["16"] = 16,["17"] = 17,["18"] = 16,["19"] = 25,["20"] = 26,["21"] = 27,["22"] = 28,["24"] = 30,["25"] = 31,["26"] = 25,["27"] = 39,["28"] = 40,["29"] = 40,["30"] = 41,["31"] = 42,["33"] = 44,["34"] = 45,["35"] = 45,["36"] = 46,["37"] = 47,["40"] = 50,["41"] = 39,["42"] = 58,["43"] = 59,["44"] = 59,["45"] = 60,["46"] = 61,["48"] = 63,["49"] = 63,["50"] = 64,["51"] = 65,["53"] = 67,["54"] = 58,["55"] = 76,["56"] = 77,["57"] = 77,["58"] = 78,["61"] = 81,["64"] = 84,["65"] = 76,["66"] = 93,["67"] = 94,["68"] = 94,["69"] = 95,["70"] = 96,["72"] = 98,["73"] = 99,["75"] = 101,["76"] = 93,["77"] = 110,["78"] = 111,["79"] = 111,["80"] = 112,["81"] = 113,["83"] = 115,["84"] = 116,["86"] = 118,["87"] = 110,["88"] = 126,["89"] = 127,["90"] = 128,["91"] = 129,["93"] = 131,["94"] = 126,["95"] = 139,["96"] = 140,["97"] = 140,["98"] = 141,["99"] = 142,["101"] = 144,["102"] = 145,["104"] = 146,["105"] = 146,["106"] = 147,["107"] = 148,["108"] = 149,["110"] = 151,["111"] = 152,["113"] = 154,["118"] = 157,["119"] = 139,["120"] = 166,["121"] = 167,["122"] = 167,["123"] = 168,["124"] = 169,["126"] = 171,["128"] = 172,["129"] = 172,["130"] = 173,["131"] = 174,["132"] = 175,["134"] = 177,["139"] = 166,["140"] = 189,["141"] = 190,["142"] = 190,["143"] = 191,["146"] = 194,["147"] = 195,["148"] = 195,["149"] = 196,["150"] = 197,["155"] = 189,["156"] = 210,["157"] = 211,["158"] = 211,["159"] = 212,["160"] = 213,["162"] = 215,["163"] = 216,["164"] = 216,["165"] = 217,["166"] = 218,["169"] = 221,["170"] = 210,["171"] = 229,["172"] = 230,["173"] = 230,["174"] = 231,["175"] = 232,["177"] = 234,["178"] = 235,["179"] = 235,["180"] = 236,["181"] = 237,["182"] = 238,["186"] = 229});
local ____exports = {}
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorAbilityUtil = ____exports.default
ActorAbilityUtil.name = "ActorAbilityUtil"
function ActorAbilityUtil.prototype.____constructor(self)
end
function ActorAbilityUtil.createActorAbility(self, actorTypeId, unit, startPosNum)
    return __TS__New(ActorAbility, actorTypeId, unit, startPosNum)
end
function ActorAbilityUtil.destroyUnitAbility(self, unit, actorTypeId)
    local actorAbility = ____exports.default:getUnitActorAbility(unit, actorTypeId)
    if actorAbility == nil then
        return false
    end
    actorAbility:destroy()
    return true
end
function ActorAbilityUtil.getUnitActorAbility(self, unit, actorTypeId)
    local ____opt_0 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_0 and ____opt_0._SL_abilityTemplate
    if abilityTemplate == nil then
        return nil
    end
    for abilityTemplateKey in pairs(abilityTemplate) do
        local ____opt_2 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
        local actor = ____opt_2 and ____opt_2._SL_solarActorAbility
        if actor ~= nil and actor.actorTypeId == actorTypeId then
            return actor
        end
    end
    return nil
end
function ActorAbilityUtil.getUnitActorAbilityByPos(self, unit, pos)
    local ____opt_4 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_4 and ____opt_4._SL_abilityTemplate
    if abilityTemplate == nil then
        return nil
    end
    local ____opt_6 = DataBase:getAbilityTypeSolarData(abilityTemplate[pos], false)
    local actor = ____opt_6 and ____opt_6._SL_solarActorAbility
    if actor ~= nil then
        return actor
    end
    return nil
end
function ActorAbilityUtil.ifHasActorAbility(self, abilityId, callBack, actorTypeId)
    local ____opt_8 = DataBase:getAbilityTypeSolarData(abilityId, false)
    local actor = ____opt_8 and ____opt_8._SL_solarActorAbility
    if actor == nil then
        return
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return
    end
    callBack(nil, actor)
end
function ActorAbilityUtil.isHasActorAbility(self, abilityId, actorTypeId)
    local ____opt_10 = DataBase:getAbilityTypeSolarData(abilityId, false)
    local actor = ____opt_10 and ____opt_10._SL_solarActorAbility
    if actor == nil then
        return false
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return false
    end
    return true
end
function ActorAbilityUtil.getActorAbility(self, abilityId, actorTypeId)
    local ____opt_12 = DataBase:getAbilityTypeSolarData(abilityId, false)
    local actor = ____opt_12 and ____opt_12._SL_solarActorAbility
    if actor == nil then
        return nil
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return nil
    end
    return actor
end
function ActorAbilityUtil.getUnitActorAbilityListSize(self, unit, clazz)
    local abilityList = ____exports.default:getUnitActorAbilityList(unit, clazz)
    if abilityList == nil then
        return 0
    end
    return #abilityList
end
function ActorAbilityUtil.getUnitActorAbilityList(self, unit, clazz)
    local ____opt_14 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_14 and ____opt_14._SL_abilityTemplate
    if abilityTemplate == nil then
        return nil
    end
    local actorList = nil
    for abilityTemplateKey in pairs(abilityTemplate) do
        do
            local ____opt_16 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
            local actor = ____opt_16 and ____opt_16._SL_solarActorAbility
            if actor ~= nil then
                if clazz ~= nil and clazz ~= actor.actorType.class then
                    goto __continue27
                end
                if actorList == nil then
                    actorList = {}
                end
                actorList[#actorList + 1] = actor
            end
        end
        ::__continue27::
    end
    return actorList
end
function ActorAbilityUtil.forUnitActorAbilityList(self, unit, callBack, clazz)
    local ____opt_18 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_18 and ____opt_18._SL_abilityTemplate
    if abilityTemplate == nil then
        return nil
    end
    for abilityTemplateKey in pairs(abilityTemplate) do
        do
            local ____opt_20 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
            local actor = ____opt_20 and ____opt_20._SL_solarActorAbility
            if actor ~= nil then
                if clazz ~= nil and clazz ~= actor.actorType.class then
                    goto __continue34
                end
                callBack(nil, actor)
            end
        end
        ::__continue34::
    end
end
function ActorAbilityUtil.ifUnitHasActorAbility(self, unit, callBack, actorTypeId)
    local ____opt_22 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_22 and ____opt_22._SL_abilityTemplate
    if abilityTemplate == nil then
        return
    end
    for abilityTemplateKey in pairs(abilityTemplate) do
        local ____opt_24 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
        local actor = ____opt_24 and ____opt_24._SL_solarActorAbility
        if actor ~= nil and actor.actorTypeId == actorTypeId then
            callBack(nil, actor)
            return
        end
    end
    return
end
function ActorAbilityUtil.isUnitHasActorAbility(self, unit, actorTypeId)
    local ____opt_26 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_26 and ____opt_26._SL_abilityTemplate
    if abilityTemplate == nil then
        return false
    end
    for abilityTemplateKey in pairs(abilityTemplate) do
        local ____opt_28 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
        local actor = ____opt_28 and ____opt_28._SL_solarActorAbility
        if actor ~= nil and actor.actorTypeId == actorTypeId then
            return true
        end
    end
    return false
end
function ActorAbilityUtil.destroyUnitAllActorAbility(self, unit, clazz)
    local ____opt_30 = DataBase:getUnitSolarData(unit, false)
    local abilityTemplate = ____opt_30 and ____opt_30._SL_abilityTemplate
    if abilityTemplate == nil then
        return nil
    end
    for abilityTemplateKey in pairs(abilityTemplate) do
        local ____opt_32 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
        local actor = ____opt_32 and ____opt_32._SL_solarActorAbility
        if actor ~= nil then
            if clazz == nil or clazz == actor.actorType.class then
                actor:destroy()
            end
        end
    end
end
return ____exports
