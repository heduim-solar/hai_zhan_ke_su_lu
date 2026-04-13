local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 11,["25"] = 11,["26"] = 13,["27"] = 13,["28"] = 13,["30"] = 13,["31"] = 16,["32"] = 17,["33"] = 18,["34"] = 19,["36"] = 21,["37"] = 23,["38"] = 24,["40"] = 26,["41"] = 16,["42"] = 32,["43"] = 33,["44"] = 34,["45"] = 35,["46"] = 32,["47"] = 40,["48"] = 41,["49"] = 42,["50"] = 43,["52"] = 45,["53"] = 45,["54"] = 45,["55"] = 45,["56"] = 46,["57"] = 47,["58"] = 48,["59"] = 48,["60"] = 48,["61"] = 48,["62"] = 48,["63"] = 48,["64"] = 48,["66"] = 50,["69"] = 53,["70"] = 40,["71"] = 60,["72"] = 61,["73"] = 61,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 62,["78"] = 63,["80"] = 65,["81"] = 66,["82"] = 67,["84"] = 69,["85"] = 60,["86"] = 77,["88"] = 78,["89"] = 78,["90"] = 79,["91"] = 79,["92"] = 79,["93"] = 79,["94"] = 80,["95"] = 80,["96"] = 80,["97"] = 80,["98"] = 81,["99"] = 82,["101"] = 78,["104"] = 77,["105"] = 92,["107"] = 93,["108"] = 93,["109"] = 94,["110"] = 94,["111"] = 94,["112"] = 94,["113"] = 95,["114"] = 95,["115"] = 95,["116"] = 95,["117"] = 96,["118"] = 97,["120"] = 93,["123"] = 100,["124"] = 92,["125"] = 104,["126"] = 105,["127"] = 106,["128"] = 107,["129"] = 108,["130"] = 109,["131"] = 110,["132"] = 111,["133"] = 112,["135"] = 114,["136"] = 104,["137"] = 117,["138"] = 118,["141"] = 121,["144"] = 124,["145"] = 126,["146"] = 126,["147"] = 126,["148"] = 126,["149"] = 127,["150"] = 129,["151"] = 129,["152"] = 129,["153"] = 129,["154"] = 129,["155"] = 129,["156"] = 129,["157"] = 131,["158"] = 131,["159"] = 131,["160"] = 131,["161"] = 117,["162"] = 137,["163"] = 137,["164"] = 137,["166"] = 138,["167"] = 139,["168"] = 140,["169"] = 141,["170"] = 142,["173"] = 145,["174"] = 146,["175"] = 147,["176"] = 140,["177"] = 149,["178"] = 150,["180"] = 152,["181"] = 137,["182"] = 156,["183"] = 157,["184"] = 158,["185"] = 157,["186"] = 160,["187"] = 156});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____ItemUtil = require("solar.solar-common.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
____exports.default = __TS__Class()
local MapUtil = ____exports.default
MapUtil.name = "MapUtil"
function MapUtil.prototype.____constructor(self)
end
MapUtil["是否开后门"] = function(self, player)
    local name = GetPlayerName(player)
    if name == nil then
        return false
    end
    local nameHex = StringHash(GetPlayerName(player))
    if nameHex == StringHash("xxx") or (string.find(name, "xxx", nil, true) or 0) - 1 >= 0 then
        return true
    end
    return false
end
function MapUtil.getHeroByUnit(self, unit)
    local player = GetOwningPlayer(unit)
    local hero = PlayerUtil:getHero(player)
    return hero
end
function MapUtil.addActorItemForUnit(self, itemActorTypeId, unit, uses)
    local actorItem = nil
    if ItemUtil:hasIdleItemGrid(unit) then
        actorItem = ActorItemUtil:addActorItemForUnit(itemActorTypeId, unit, uses)
    else
        local assistant = sd(
            nil,
            GetOwningPlayer(unit)
        ).assistant
        if IsHandle(assistant) then
            actorItem = ActorItemUtil:addActorItemForUnit(itemActorTypeId, assistant, uses)
            TipFrameUtil:showSuccessText(
                "背包已满!装备已传送到宝宝身上!",
                FramePoint.center,
                1,
                0.011,
                GetOwningPlayer(unit)
            )
        else
            actorItem = ActorItemUtil:addActorItemForUnit(itemActorTypeId, unit, uses)
        end
    end
    return actorItem
end
function MapUtil.getUnitBounty(self, unit)
    local ____opt_0 = DataBase:getUnitTypeSolarData(
        id2string(GetUnitTypeId(unit)),
        false
    )
    local give_money = ____opt_0 and ____opt_0.give_money
    if give_money ~= nil then
        return give_money
    end
    local actorUnit = ActorUnitUtil:getActorUnit(unit)
    if actorUnit ~= nil then
        return actorUnit:get("bounty")
    end
    return nil
end
function MapUtil.getOneWaterLoc(self, region)
    do
        local i = 0
        while i < 100000 do
            local x = GetRandomReal(
                GetRectMinX(region) + 300,
                GetRectMaxX(region) - 300
            )
            local y = GetRandomReal(
                GetRectMinY(region) + 300,
                GetRectMaxY(region) - 300
            )
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) then
                return {x = x, y = y}
            end
            i = i + 1
        end
    end
end
function MapUtil.getOneWaterLocByXY(self, cx, cy)
    do
        local i = 0
        while i < 10 do
            local x = cx + GetRandomReal(
                GetRandomInt(-200, 200),
                GetRandomInt(-200, 200)
            )
            local y = cy + GetRandomReal(
                GetRandomInt(-200, 200),
                GetRandomInt(-200, 200)
            )
            if not IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) and IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) then
                return {x = x, y = y}
            end
            i = i + 1
        end
    end
    return {x = cx, y = cy}
end
function MapUtil.getRealNanduLevel(self)
    if settings.gameMode == MapModel["模式1_普通模式"] then
        return settings.gameDifficulty
    elseif settings.gameMode == MapModel["模式2_寄生模式"] then
        return 9 + settings.gameDifficulty
    elseif settings.gameMode == MapModel["模式3_献祭模式"] then
        return 18 + settings.gameDifficulty
    elseif settings.gameMode == MapModel["模式4_真实难度"] then
        return 27 + settings.gameDifficulty
    end
    return settings.gameDifficulty
end
MapUtil["根据难度数值加强怪物"] = function(self, unitHandle)
    if not IsHandle(unitHandle) then
        return
    end
    if settings.valueCoefficient == nil or settings.valueCoefficient <= 1 then
        return
    end
    local multiple = settings.valueCoefficient
    UnitStateUtil:setMaxLife(
        unitHandle,
        UnitStateUtil:getMaxLife(unitHandle) * multiple
    )
    UnitStateUtil:setUnitLifeP(unitHandle, 1)
    UnitStateUtil:setDamageBase(
        unitHandle,
        math.min(
            UnitStateUtil:getDamageMax(unitHandle) * multiple,
            2100000000
        )
    )
    UnitStateUtil:setArmor(
        unitHandle,
        (UnitStateUtil:getArmor(unitHandle) + settings.valueCoefficient) * settings.gameDifficulty
    )
end
function MapUtil.getPlayerAllHeroStateVal(self, stateFormula, isAverage)
    if isAverage == nil then
        isAverage = true
    end
    local allVal = 0
    local count = 0
    PlayerUtil:forUsers(function(____, player)
        local hero = PlayerUtil:getHero(player)
        if not IsHandle(hero) then
            return
        end
        local val = UnitStateUtil:calculateStateFormula(stateFormula, hero)
        allVal = allVal + val
        count = count + 1
    end)
    if isAverage then
        allVal = allVal / count
    end
    return math.floor(allVal)
end
function MapUtil.addUsersArchive(self, addNum, key, name)
    PlayerUtil:forUsers(function(____, player)
        ArchiveUtil:addNumber(player, key, addNum)
    end)
    PlayerUtil:message((("|cff00ff00【存档】获得" .. name) .. "+") .. tostring(addNum))
end
return ____exports
