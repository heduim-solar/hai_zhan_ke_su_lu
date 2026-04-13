local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 7,["11"] = 7,["12"] = 7,["14"] = 7,["15"] = 14,["16"] = 16,["17"] = 17,["18"] = 18,["19"] = 19,["20"] = 21,["21"] = 22,["22"] = 22,["23"] = 22,["24"] = 22,["25"] = 22,["26"] = 23,["27"] = 24,["30"] = 25,["31"] = 26,["32"] = 27,["34"] = 29,["35"] = 30,["36"] = 31,["38"] = 33,["40"] = 35,["41"] = 36,["42"] = 37,["45"] = 38,["46"] = 39,["47"] = 39,["48"] = 39,["49"] = 39,["50"] = 39,["51"] = 39,["52"] = 39,["53"] = 39,["55"] = 41,["57"] = 42,["59"] = 44,["60"] = 45,["61"] = 46,["64"] = 47,["65"] = 48,["66"] = 48,["67"] = 48,["68"] = 48,["69"] = 48,["70"] = 48,["71"] = 48,["72"] = 48,["74"] = 50,["76"] = 51,["78"] = 53,["79"] = 54,["80"] = 55,["83"] = 56,["84"] = 57,["86"] = 58,["87"] = 59,["89"] = 60,["91"] = 62,["92"] = 63,["93"] = 64,["96"] = 65,["97"] = 66,["98"] = 67,["100"] = 69,["101"] = 69,["102"] = 69,["103"] = 69,["104"] = 69,["105"] = 70,["106"] = 14,["107"] = 73,["108"] = 75,["109"] = 76,["110"] = 77,["111"] = 78,["112"] = 79,["113"] = 80,["114"] = 81,["115"] = 83,["116"] = 84,["117"] = 85,["118"] = 86,["119"] = 87,["121"] = 89,["122"] = 90,["123"] = 91,["124"] = 92,["125"] = 93,["127"] = 95,["128"] = 96,["129"] = 97,["130"] = 98,["132"] = 99,["133"] = 100,["134"] = 101,["135"] = 102,["136"] = 103,["137"] = 104,["139"] = 106,["141"] = 107,["142"] = 73,["143"] = 117,["144"] = 118,["145"] = 119,["146"] = 119,["147"] = 119,["149"] = 119,["150"] = 120,["151"] = 121,["152"] = 123,["153"] = 125,["154"] = 126,["156"] = 129,["157"] = 130,["158"] = 132,["159"] = 133,["160"] = 134,["161"] = 135,["162"] = 135,["163"] = 135,["164"] = 135,["165"] = 136,["166"] = 137,["167"] = 138,["168"] = 139,["169"] = 140,["170"] = 141,["171"] = 142,["172"] = 143,["175"] = 144,["176"] = 144,["177"] = 144,["178"] = 144,["179"] = 144,["180"] = 144,["181"] = 144,["182"] = 145,["183"] = 146,["184"] = 147,["185"] = 149,["186"] = 151,["187"] = 152,["188"] = 153,["189"] = 154,["190"] = 155,["191"] = 156,["192"] = 157,["197"] = 117});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
____exports.default = __TS__Class()
local DoubleItemSlotUtil = ____exports.default
DoubleItemSlotUtil.name = "DoubleItemSlotUtil"
function DoubleItemSlotUtil.prototype.____constructor(self)
end
function DoubleItemSlotUtil.itemSwitch(self, Ua, Ub)
    local Ia = {}
    local Ib = {}
    local i = 0
    local heroSD = DataBase:getUnitSolarData(Ua)
    heroSD._sl_ItemAbilitySystemTriggerClose = true
    SetUnitOwner(
        Ub,
        GetOwningPlayer(Ua),
        false
    )
    while true do
        if i > 5 then
            break
        end
        if UnitItemInSlot(Ua, i) ~= nil then
            Ia[i + 1] = UnitItemInSlot(Ua, i)
            UnitRemoveItemFromSlot(Ua, i)
        end
        if UnitItemInSlot(Ub, i) ~= nil then
            Ib[i + 1] = UnitItemInSlot(Ub, i)
            UnitRemoveItemFromSlot(Ub, i)
        end
        i = i + 1
    end
    i = 0
    while true do
        if i > 5 then
            break
        end
        if Ia[i + 1] == nil then
            UnitAddItem(
                Ub,
                CreateItem(
                    FourCC("stpg"),
                    GetUnitX(Ub),
                    GetUnitY(Ub)
                )
            )
        else
            UnitAddItem(Ub, Ia[i + 1])
        end
        i = i + 1
    end
    i = 0
    while true do
        if i > 5 then
            break
        end
        if Ib[i + 1] == nil then
            UnitAddItem(
                Ua,
                CreateItem(
                    FourCC("stpg"),
                    GetUnitX(Ua),
                    GetUnitY(Ua)
                )
            )
        else
            UnitAddItem(Ua, Ib[i + 1])
        end
        i = i + 1
    end
    i = 0
    while true do
        if i > 5 then
            break
        end
        if GetItemTypeId(UnitItemInSlot(Ua, i)) == FourCC("stpg") then
            RemoveItem(UnitItemInSlot(Ua, i))
        end
        if GetItemTypeId(UnitItemInSlot(Ub, i)) == FourCC("stpg") then
            RemoveItem(UnitItemInSlot(Ub, i))
        end
        i = i + 1
    end
    i = 0
    while true do
        if i > 5 then
            break
        end
        Ia[i + 1] = nil
        Ib[i + 1] = nil
        i = i + 1
    end
    SetUnitOwner(
        Ub,
        Player(PLAYER_NEUTRAL_PASSIVE),
        false
    )
    heroSD._sl_ItemAbilitySystemTriggerClose = false
end
function DoubleItemSlotUtil._sl_doubleItemSlotByAbility_CON()
    local u = nil
    local trg = GetTriggeringTrigger()
    local hero = GetTriggerUnit()
    local trgSD = DataBase:getDataByHandle("trigger", trg)
    local ab = trgSD.Ability
    local ItemSlotMax = trgSD.ItemSlotMax
    local i = 0
    if GetSpellAbilityId() ~= ab then
        u = nil
        trg = nil
        hero = nil
        return false
    end
    if ItemSlotMax == 1 then
        u = nil
        trg = nil
        hero = nil
        return false
    end
    i = trgSD.ItemSlotNum
    i = i + 1
    if i > ItemSlotMax then
        i = 1
    end
    trgSD.ItemSlotNum = i
    u = trgSD[I2S(i)]
    ____exports.default:itemSwitch(hero, u)
    SetUnitAbilityLevel(hero, ab, i)
    if i == 1 then
        trgSD[I2S(ItemSlotMax)] = u
    else
        trgSD[I2S(i - 1)] = u
    end
    return false
end
function DoubleItemSlotUtil.doubleItemSlotByAbility(self, hero, ab, MaxItemSlot, uid)
    local heroSD = DataBase:getUnitSolarData(hero)
    local ____heroSD_MulItemSlotByAbility_0 = heroSD.MulItemSlotByAbility
    if ____heroSD_MulItemSlotByAbility_0 == nil then
        ____heroSD_MulItemSlotByAbility_0 = 0
    end
    local i = ____heroSD_MulItemSlotByAbility_0
    local trg = nil
    local u = nil
    local useDefaultHelpUnit = uid == nil
    if useDefaultHelpUnit then
        uid = "hrdh"
    end
    ab = LangUtil:getIntId(ab)
    uid = LangUtil:getIntId(uid)
    if i == 0 then
        trg = CreateTrigger()
        TriggerRegisterUnitEvent(trg, hero, EVENT_UNIT_SPELL_EFFECT)
        TriggerAddCondition(
            trg,
            Condition(____exports.default._sl_doubleItemSlotByAbility_CON)
        )
        heroSD.MulItemSlotByAbility = trg
        local trgSD = DataBase:getDataByHandle("trigger", trg)
        trgSD.Ability = ab
        trgSD.ItemSlotMax = MaxItemSlot
        trgSD.ItemSlotNum = 1
        if MaxItemSlot > 1 then
            while true do
                if MaxItemSlot == 1 then
                    break
                end
                u = CreateUnit(
                    Player(PLAYER_NEUTRAL_PASSIVE),
                    uid,
                    0,
                    0,
                    0
                )
                heroSD._sl_ItemAbilitySystemTriggerClose = true
                trgSD[I2S(MaxItemSlot)] = u
                MaxItemSlot = MaxItemSlot - 1
                if useDefaultHelpUnit then
                    UnitAddAbility(u, "AInv")
                    UnitAddAbility(u, "Avul")
                    UnitAddAbility(u, "Apiv")
                    UnitAddAbility(u, "Aloc")
                    SetUnitState(u, UNIT_STATE_MAX_LIFE, 1000000000)
                    SetUnitState(u, UNIT_STATE_LIFE, 1000000000)
                    ShowUnit(u, false)
                end
            end
        end
    end
end
return ____exports
