local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 13,["17"] = 13,["18"] = 13,["20"] = 13,["21"] = 55,["22"] = 55,["23"] = 55,["25"] = 56,["26"] = 57,["27"] = 58,["30"] = 61,["31"] = 62,["32"] = 63,["34"] = 65,["35"] = 55,["36"] = 75,["37"] = 75,["38"] = 75,["40"] = 76,["41"] = 77,["42"] = 78,["44"] = 80,["45"] = 75,["46"] = 88,["47"] = 89,["50"] = 92,["51"] = 93,["52"] = 94,["53"] = 95,["54"] = 96,["55"] = 97,["57"] = 99,["60"] = 88,["61"] = 109,["62"] = 109,["63"] = 109,["65"] = 110,["66"] = 111,["67"] = 112,["69"] = 114,["70"] = 109,["71"] = 122,["72"] = 122,["73"] = 122,["75"] = 123,["76"] = 124,["77"] = 125,["79"] = 127,["80"] = 122,["81"] = 136,["82"] = 136,["83"] = 136,["85"] = 137,["86"] = 138,["87"] = 139,["88"] = 140,["89"] = 141,["91"] = 143,["92"] = 144,["93"] = 136,["94"] = 152,["95"] = 152,["96"] = 152,["98"] = 153,["99"] = 154,["100"] = 155,["102"] = 157,["103"] = 152,["104"] = 165,["105"] = 166,["108"] = 169,["109"] = 170,["110"] = 171,["111"] = 172,["112"] = 173,["113"] = 174,["115"] = 176,["118"] = 165,["119"] = 188,["120"] = 188,["121"] = 188,["123"] = 189,["124"] = 190,["125"] = 191,["126"] = 192,["127"] = 193,["129"] = 195,["130"] = 196,["131"] = 188,["132"] = 205,["133"] = 205,["134"] = 205,["136"] = 206,["137"] = 207,["138"] = 208,["139"] = 209,["140"] = 210,["142"] = 212,["143"] = 213,["144"] = 205,["145"] = 222,["146"] = 222,["147"] = 222,["149"] = 223,["150"] = 224,["151"] = 225,["152"] = 226,["153"] = 227,["155"] = 229,["156"] = 230,["157"] = 222,["158"] = 239,["159"] = 239,["160"] = 239,["162"] = 240,["163"] = 241,["164"] = 242,["165"] = 243,["166"] = 244,["168"] = 246,["169"] = 247,["170"] = 239,["171"] = 253,["172"] = 254,["173"] = 255,["174"] = 256,["175"] = 257,["177"] = 254,["178"] = 253,["179"] = 265,["180"] = 266,["181"] = 267,["182"] = 268,["183"] = 269,["185"] = 266,["186"] = 265,["187"] = 278,["188"] = 279,["189"] = 280,["190"] = 281,["192"] = 283,["193"] = 284,["195"] = 285,["196"] = 286,["198"] = 288,["199"] = 289,["201"] = 291,["206"] = 295,["207"] = 278,["208"] = 302,["209"] = 303,["212"] = 306,["213"] = 307,["214"] = 308,["217"] = 302,["218"] = 317,["219"] = 318,["222"] = 321,["223"] = 322,["224"] = 323,["227"] = 317,["228"] = 332,["229"] = 333,["232"] = 336,["233"] = 337,["235"] = 339,["236"] = 340,["238"] = 342,["239"] = 343,["240"] = 344,["243"] = 347,["244"] = 332,["245"] = 353,["246"] = 354,["247"] = 355,["249"] = 357,["250"] = 358,["252"] = 360,["253"] = 361,["254"] = 362,["255"] = 363,["257"] = 365,["258"] = 366,["259"] = 367,["262"] = 370,["263"] = 353,["264"] = 384,["265"] = 385,["266"] = 386,["267"] = 384,["268"] = 395,["269"] = 396,["270"] = 397,["271"] = 395,["272"] = 406,["273"] = 407,["274"] = 408,["275"] = 409,["276"] = 406,["277"] = 418,["278"] = 419,["279"] = 420,["280"] = 418,["281"] = 429,["282"] = 430,["283"] = 431,["284"] = 429,["285"] = 440,["286"] = 441,["287"] = 442,["288"] = 443,["289"] = 440,["290"] = 15,["291"] = 15,["292"] = 15,["293"] = 15,["294"] = 15,["295"] = 15,["296"] = 15,["297"] = 15,["298"] = 15,["299"] = 15,["300"] = 15,["301"] = 15,["302"] = 15,["303"] = 15,["304"] = 15,["305"] = 15,["306"] = 15,["307"] = 15,["308"] = 15,["309"] = 15,["310"] = 15,["311"] = 15,["312"] = 15,["313"] = 15,["314"] = 15,["315"] = 15,["316"] = 15,["317"] = 15,["318"] = 15,["319"] = 15,["320"] = 15,["321"] = 15});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____HandleUtil = require("solar.solar-common.util.lang.HandleUtil")
local HandleUtil = ____HandleUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local AttributeUtil = ____exports.default
AttributeUtil.name = "AttributeUtil"
function AttributeUtil.prototype.____constructor(self)
end
function AttributeUtil.getUnitAttribute(self, unitHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    if isDebug and createDefault and not UnitUtil.isHero(unitHandle) then
        if not UnitAlive(unitHandle) or not HandleUtil:isUnitHandle(unitHandle) then
            log.errorWithTraceBack(("警告：你正在给一个死亡的单位创建属性: " .. GetUnitName(unitHandle)) .. " 如果只是查询数据请将createDefault参数传false")
        end
    end
    local solarData = db:getUnitSolarData(unitHandle, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.getUnitTypeAttribute(self, unitTypeId, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getUnitTypeSolarData(unitTypeId, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.addUnitAttribute(self, unitHandle, addAttribute)
    if not addAttribute then
        return
    end
    local baseAttribute = ____exports.default:getUnitAttribute(unitHandle, true)
    for key in pairs(addAttribute) do
        if type(addAttribute[key]) == "number" then
            baseAttribute[key] = (baseAttribute[key] or 0) + addAttribute[key]
        elseif baseAttribute[key] == nil then
            baseAttribute[key] = addAttribute[key]
        else
            print("未覆盖单位旧属性值:" .. key)
        end
    end
end
function AttributeUtil.getItemAttribute(self, itemHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getItemSolarData(itemHandle, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.getItemTypeAttribute(self, itemTypeId, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getItemTypeSolarData(itemTypeId, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.setItemTypeAttribute(self, itemTypeId, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getItemTypeSolarData(itemTypeId)
    local oldAttribute = solarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此物品类型已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. itemTypeId)
        return oldAttribute
    end
    solarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.getPlayerAttribute(self, playerHandle, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    local solarData = db:getPlayerSolarData(playerHandle, createDefault)
    if createDefault and not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    return solarData and solarData._SL_solarAttribute
end
function AttributeUtil.addPlayerAttribute(self, playerHandle, addAttribute)
    if not addAttribute then
        return
    end
    local basePlayerAttribute = ____exports.default:getPlayerAttribute(playerHandle, true)
    for key in pairs(addAttribute) do
        if type(addAttribute[key]) == "number" then
            basePlayerAttribute[key] = (basePlayerAttribute[key] or 0) + addAttribute[key]
        elseif basePlayerAttribute[key] == nil then
            basePlayerAttribute[key] = addAttribute[key]
        else
            print("未覆盖玩家旧属性值:" .. key)
        end
    end
end
function AttributeUtil.setPlayerAttribute(self, playerHandle, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getPlayerSolarData(playerHandle)
    local oldAttribute = solarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此玩家已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. tostring(GetPlayerId(playerHandle)))
        return oldAttribute
    end
    solarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.setUnitAttribute(self, unitHandle, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local unitSolarData = db:getUnitSolarData(unitHandle)
    local oldAttribute = unitSolarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此单位已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. GetUnitName(unitHandle))
        return oldAttribute
    end
    unitSolarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.setUnitTypeAttribute(self, unitTypeId, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getUnitTypeSolarData(unitTypeId, true)
    local oldAttribute = solarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此单位已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. unitTypeId)
        return oldAttribute
    end
    solarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.setItemAttribute(self, itemHandle, attribute, allowCover)
    if allowCover == nil then
        allowCover = false
    end
    local solarData = db:getItemSolarData(itemHandle)
    local oldAttribute = solarData._SL_solarAttribute
    if oldAttribute and not allowCover then
        log.errorWithTraceBack("此物品已有属性了，无法覆盖所有属性!可直接修改已有属性的对应词条!" .. GetItemName(itemHandle))
        return oldAttribute
    end
    solarData._SL_solarAttribute = attribute
    return oldAttribute
end
function AttributeUtil.forAllUnitsAttribute(self, callback)
    DataBase:forUnitSolarDatas(function(____, u, solarData)
        local solarAttribute = solarData and solarData._SL_solarAttribute
        if solarAttribute then
            callback(nil, u, solarAttribute)
        end
    end)
end
function AttributeUtil.forAllPlayerAttribute(self, callback)
    PlayerUtil:forPlayingPlayers(function(____, player)
        local playerAttribute = ____exports.default:getPlayerAttribute(player, false)
        if playerAttribute then
            callback(nil, player, playerAttribute)
        end
    end)
end
function AttributeUtil.sumAttributes(self, attributes)
    local result = {}
    if attributes == nil then
        return result
    end
    for ____, attribute in ipairs(attributes) do
        for key in pairs(attribute) do
            do
                if type(attribute[key]) ~= "number" then
                    goto __continue48
                end
                if not result[key] then
                    result[key] = 0
                end
                result[key] = result[key] + attribute[key]
            end
            ::__continue48::
        end
    end
    return result
end
function AttributeUtil.add(self, attribute, _attribute)
    if not _attribute then
        return
    end
    for key in pairs(_attribute) do
        if type(_attribute[key]) == "number" then
            attribute[key] = (attribute[key] or 0) + _attribute[key]
        end
    end
end
function AttributeUtil.subtract(self, attribute, _attribute)
    if not _attribute then
        return
    end
    for key in pairs(_attribute) do
        if type(_attribute[key]) == "number" then
            attribute[key] = (attribute[key] or 0) - _attribute[key]
        end
    end
end
function AttributeUtil.multiply(self, attribute, scale, store)
    if not attribute then
        return
    end
    if scale == 0 then
        return {}
    end
    if store == nil then
        store = __TS__ObjectAssign({}, attribute)
    end
    for key in pairs(attribute) do
        if type(attribute[key]) == "number" then
            store[key] = (attribute[key] or 0) * scale
        end
    end
    return store
end
function AttributeUtil.isEquals(self, attribute, otherAttribute)
    if attribute == otherAttribute then
        return true
    end
    if attribute == nil or otherAttribute == nil then
        return false
    end
    local keys1 = __TS__ObjectKeys(attribute)
    local keys2 = __TS__ObjectKeys(otherAttribute)
    if #keys1 ~= #keys2 then
        return false
    end
    for ____, key in ipairs(keys1) do
        if attribute[key] ~= otherAttribute[key] then
            return false
        end
    end
    return true
end
function AttributeUtil.getAbilityCDP(self, unitHandle, abilityIdStr)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, false)
    return attribute and attribute["ability_cd_p_" .. abilityIdStr] or 0
end
function AttributeUtil.setAbilityCDP(self, unitHandle, abilityIdStr, val)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, true)
    attribute["ability_cd_p_" .. abilityIdStr] = val
end
function AttributeUtil.addAbilityCDP(self, unitHandle, abilityIdStr, val)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, true)
    local key = "ability_cd_p_" .. abilityIdStr
    attribute[key] = (attribute[key] or 0) + val
end
function AttributeUtil.getAbilityCD(self, unitHandle, abilityIdStr)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, false)
    return attribute and attribute["ability_cd_" .. abilityIdStr] or 0
end
function AttributeUtil.setAbilityCD(self, unitHandle, abilityIdStr, val)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, true)
    attribute["ability_cd_" .. abilityIdStr] = val
end
function AttributeUtil.addAbilityCD(self, unitHandle, abilityIdStr, val)
    local attribute = ____exports.default:getUnitAttribute(unitHandle, true)
    local key = "ability_cd_" .. abilityIdStr
    attribute[key] = (attribute[key] or 0) + val
end
AttributeUtil.keyNameMap = {
    attack = "攻击",
    attack_p = "攻击增幅",
    life = "生命",
    life_p = "生命增幅",
    mana = "魔法",
    mana_p = "魔法增幅",
    def = "护甲",
    def_p = "护甲增幅",
    full_property = "全属性",
    full_property_p = "全属性增幅",
    strength = "力量",
    strength_p = "力量增幅",
    agility = "敏捷",
    agility_p = "敏捷增幅",
    intelligence = "智力",
    intelligence_p = "智力增幅",
    attackSpd_p = "攻击速度",
    move_speed = "移动速度",
    damage_cool = "攻击间隔",
    damage_range = "攻击范围",
    attack_damage_increased = "攻击增伤",
    physical_damage_increased = "物理增伤",
    magic_damage_increased = "法术增伤",
    physical_critical_chance = "物理暴击几率",
    physical_critical_damage = "物理暴击伤害",
    magic_critical_chance = "法术暴击几率",
    magic_critical_damage = "法术暴击伤害",
    damage_increased = "全伤害增幅",
    damage_reduction = "伤害减免",
    blood_sucking = "伤害吸血"
}
return ____exports
