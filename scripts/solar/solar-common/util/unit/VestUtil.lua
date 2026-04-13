local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 4,["8"] = 4,["9"] = 5,["10"] = 5,["11"] = 6,["12"] = 6,["13"] = 7,["14"] = 7,["15"] = 8,["16"] = 8,["17"] = 9,["18"] = 9,["19"] = 12,["20"] = 12,["21"] = 12,["23"] = 12,["24"] = 25,["25"] = 25,["26"] = 25,["28"] = 25,["29"] = 25,["31"] = 25,["32"] = 25,["34"] = 25,["35"] = 25,["37"] = 25,["38"] = 25,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 26,["49"] = 25,["50"] = 36,["51"] = 36,["52"] = 36,["54"] = 36,["55"] = 36,["57"] = 36,["58"] = 36,["60"] = 36,["61"] = 36,["63"] = 36,["64"] = 36,["66"] = 37,["67"] = 38,["68"] = 38,["69"] = 38,["70"] = 38,["71"] = 38,["72"] = 38,["73"] = 38,["74"] = 38,["76"] = 40,["77"] = 40,["78"] = 40,["79"] = 40,["80"] = 40,["81"] = 40,["82"] = 40,["83"] = 40,["85"] = 36,["86"] = 44,["87"] = 44,["88"] = 44,["90"] = 44,["91"] = 44,["93"] = 44,["94"] = 44,["96"] = 45,["97"] = 45,["98"] = 45,["99"] = 45,["100"] = 45,["101"] = 45,["102"] = 45,["103"] = 46,["104"] = 47,["105"] = 49,["107"] = 52,["108"] = 53,["110"] = 55,["111"] = 56,["112"] = 57,["113"] = 58,["114"] = 59,["115"] = 59,["116"] = 59,["117"] = 59,["118"] = 60,["119"] = 61,["120"] = 61,["121"] = 61,["122"] = 62,["123"] = 61,["124"] = 61,["126"] = 65,["127"] = 44,["128"] = 79,["129"] = 79,["130"] = 79,["132"] = 79,["133"] = 79,["135"] = 79,["136"] = 79,["138"] = 80,["141"] = 84,["142"] = 85,["143"] = 86,["144"] = 87,["145"] = 88,["146"] = 89,["147"] = 89,["148"] = 90,["151"] = 94,["152"] = 95,["156"] = 98,["157"] = 98,["158"] = 99,["159"] = 100,["160"] = 101,["162"] = 98,["165"] = 104,["166"] = 106,["167"] = 106,["168"] = 106,["169"] = 106,["170"] = 107,["171"] = 107,["172"] = 107,["173"] = 107,["174"] = 108,["175"] = 108,["176"] = 108,["177"] = 108,["179"] = 110,["180"] = 110,["181"] = 110,["182"] = 110,["183"] = 111,["184"] = 111,["185"] = 111,["186"] = 111,["187"] = 112,["188"] = 112,["189"] = 112,["190"] = 112,["191"] = 114,["192"] = 114,["193"] = 114,["194"] = 114,["195"] = 115,["196"] = 115,["197"] = 115,["198"] = 115,["199"] = 116,["200"] = 116,["201"] = 116,["202"] = 116,["203"] = 117,["204"] = 117,["205"] = 117,["206"] = 117,["207"] = 87,["208"] = 119,["210"] = 122,["211"] = 123,["212"] = 124,["213"] = 125,["214"] = 126,["215"] = 127,["216"] = 128,["217"] = 129,["218"] = 130,["219"] = 131,["220"] = 132,["221"] = 79,["222"] = 69});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
____exports.default = __TS__Class()
local VestUtil = ____exports.default
VestUtil.name = "VestUtil"
function VestUtil.prototype.____constructor(self)
end
function VestUtil.SunCreateVestByUnit(u, x, y, model, moveType, timer, player)
    if x == nil then
        x = GetUnitX(u)
    end
    if y == nil then
        y = GetUnitY(u)
    end
    if model == nil then
        model = ""
    end
    if moveType == nil then
        moveType = 0
    end
    if timer == nil then
        timer = 2
    end
    return ____exports.default.createVestByUnit(
        u,
        x,
        y,
        model,
        moveType,
        timer,
        player
    )
end
function VestUtil.createVestByUnit(u, x, y, model, moveType, timer, player)
    if x == nil then
        x = GetUnitX(u)
    end
    if y == nil then
        y = GetUnitY(u)
    end
    if model == nil then
        model = ""
    end
    if moveType == nil then
        moveType = 0
    end
    if timer == nil then
        timer = 2
    end
    if player then
        return ____exports.default.createVest(
            player,
            x,
            y,
            model,
            moveType,
            timer
        )
    else
        return ____exports.default.createVest(
            GetOwningPlayer(u),
            x,
            y,
            model,
            moveType,
            timer
        )
    end
end
function VestUtil.createVest(player, x, y, model, moveType, timer)
    if model == nil then
        model = ""
    end
    if moveType == nil then
        moveType = 0
    end
    if timer == nil then
        timer = 2
    end
    local mj = CreateUnit(
        player,
        FourCC("hrdh"),
        x,
        y,
        0
    )
    DzSetUnitModel(mj, model)
    if moveType == 1 then
        EXSetUnitMoveType(mj, 4)
    else
        EXSetUnitMoveType(mj, 0)
        ShowUnit(mj, false)
    end
    SetUnitPosition(mj, x, y)
    SetUnitMoveSpeed(mj, 0)
    SetUnitState(mj, UNIT_STATE_MAX_MANA, 99999)
    SetUnitState(mj, UNIT_STATE_MANA, 99999)
    UnitAddAbility(
        mj,
        FourCC("Aloc")
    )
    if timer > 0 then
        BaseUtil.runLater(
            timer,
            function()
                RemoveUnit(mj)
            end
        )
    end
    return mj
end
function VestUtil.createPhantomUnit(unit, lifeTime, damageP, underDamageP)
    if lifeTime == nil then
        lifeTime = 15
    end
    if damageP == nil then
        damageP = 1
    end
    if underDamageP == nil then
        underDamageP = 2
    end
    if not IsHandle(unit) then
        return
    end
    if ____exports.default._sl_createPhantomUnitTrigger == nil then
        local trigger = __TS__New(Trigger)
        trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_SUMMON)
        trigger:addAction(function()
            local vest = GetSummoningUnit()
            local ____opt_0 = DataBase:getUnitSolarData(vest, false)
            local srcUnit = ____opt_0 and ____opt_0.createPhantomUnit_srcUnit
            if not IsHandle(srcUnit) then
                return
            end
            local phantomUnit = GetSummonedUnit()
            if not IsHandle(phantomUnit) then
                return
            end
            do
                local i = 0
                while i < 6 do
                    local item = UnitItemInSlot(phantomUnit, i)
                    if IsHandle(item) and ActorItemUtil:getActorItem(item) == nil then
                        RemoveItem(item)
                    end
                    i = i + 1
                end
            end
            if UnitUtil.isHero(phantomUnit) then
                UnitUtil.setExtraStr(
                    phantomUnit,
                    UnitUtil.getExtraStr(srcUnit)
                )
                UnitUtil.setExtraAgi(
                    phantomUnit,
                    UnitUtil.getExtraAgi(srcUnit)
                )
                UnitUtil.setExtraInt(
                    phantomUnit,
                    UnitUtil.getExtraInt(srcUnit)
                )
            end
            UnitUtil.setExtraAttack(
                phantomUnit,
                UnitUtil.getExtraAttack(srcUnit)
            )
            UnitUtil.setExtraAttackSpd(
                phantomUnit,
                UnitUtil.getExtraAttackSpd(srcUnit)
            )
            UnitUtil.setExtraDef(
                phantomUnit,
                UnitUtil.getExtraDef(srcUnit)
            )
            UnitStateUtil:setMaxLife(
                phantomUnit,
                UnitStateUtil:getMaxLife(srcUnit)
            )
            UnitStateUtil:setLife(
                phantomUnit,
                UnitStateUtil:getLife(srcUnit)
            )
            UnitStateUtil:setMaxMana(
                phantomUnit,
                UnitStateUtil:getMaxMana(srcUnit)
            )
            UnitStateUtil:setMana(
                phantomUnit,
                UnitStateUtil:getMana(srcUnit)
            )
        end)
        ____exports.default._sl_createPhantomUnitTrigger = trigger
    end
    local vest = ____exports.default.createVestByUnit(unit)
    DataBase:getUnitSolarData(vest, true).createPhantomUnit_srcUnit = unit
    UnitAddAbility(vest, "AIil")
    local abilityTemp = EXGetUnitAbility(vest, "AIil")
    EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DATA_A, damageP)
    EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DATA_B, underDamageP)
    EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_DUR, lifeTime)
    EXSetAbilityDataReal(abilityTemp, 1, ABILITY_DATA_HERODUR, lifeTime)
    IncUnitAbilityLevel(vest, "AIil")
    DecUnitAbilityLevel(vest, "AIil")
    IssueTargetOrderById(vest, 852274, unit)
end
VestUtil._sl_createPhantomUnitTrigger = nil
return ____exports
