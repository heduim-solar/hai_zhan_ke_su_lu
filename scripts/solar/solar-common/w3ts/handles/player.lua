local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 6,["11"] = 6,["12"] = 8,["13"] = 10,["14"] = 10,["15"] = 10,["16"] = 10,["17"] = 15,["18"] = 16,["19"] = 10,["21"] = 10,["22"] = 19,["23"] = 19,["24"] = 19,["26"] = 15,["27"] = 37,["28"] = 38,["29"] = 39,["31"] = 41,["32"] = 37,["33"] = 47,["34"] = 48,["35"] = 49,["36"] = 50,["37"] = 47,["38"] = 56,["39"] = 56,["40"] = 56,["42"] = 57,["43"] = 57,["44"] = 57,["45"] = 57,["46"] = 57,["47"] = 57,["48"] = 57,["49"] = 56,["50"] = 197,["51"] = 198,["52"] = 197,["53"] = 210,["54"] = 211,["55"] = 210,["56"] = 217,["57"] = 218,["58"] = 217,["59"] = 224,["60"] = 225,["61"] = 224,["62"] = 231,["63"] = 232,["64"] = 231,["65"] = 238,["66"] = 239,["67"] = 238,["68"] = 245,["69"] = 246,["70"] = 245,["71"] = 252,["72"] = 253,["73"] = 252,["74"] = 259,["75"] = 260,["76"] = 259,["77"] = 266,["78"] = 267,["79"] = 266,["80"] = 273,["81"] = 274,["82"] = 273,["83"] = 280,["84"] = 281,["85"] = 280,["86"] = 288,["87"] = 289,["88"] = 288,["89"] = 295,["90"] = 296,["91"] = 295,["92"] = 302,["93"] = 303,["94"] = 302,["95"] = 312,["96"] = 313,["97"] = 312,["98"] = 319,["99"] = 320,["100"] = 319,["101"] = 326,["102"] = 327,["103"] = 326,["104"] = 333,["105"] = 334,["106"] = 333,["107"] = 340,["108"] = 341,["109"] = 340,["110"] = 347,["111"] = 348,["112"] = 347,["113"] = 354,["114"] = 355,["115"] = 354,["116"] = 361,["117"] = 362,["118"] = 361,["119"] = 368,["120"] = 369,["121"] = 368,["122"] = 375,["123"] = 376,["124"] = 375,["125"] = 382,["126"] = 383,["127"] = 382,["128"] = 389,["129"] = 390,["130"] = 389,["131"] = 396,["132"] = 397,["133"] = 396,["134"] = 403,["135"] = 404,["136"] = 403,["137"] = 410,["138"] = 411,["139"] = 410,["140"] = 417,["141"] = 418,["142"] = 417,["143"] = 424,["144"] = 425,["145"] = 424,["146"] = 431,["147"] = 432,["148"] = 431,["149"] = 438,["150"] = 439,["151"] = 438,["152"] = 445,["153"] = 446,["154"] = 445,["155"] = 452,["156"] = 453,["157"] = 452,["158"] = 459,["159"] = 460,["160"] = 460,["161"] = 460,["162"] = 460,["163"] = 459,["164"] = 466,["165"] = 467,["166"] = 466,["167"] = 473,["168"] = 474,["169"] = 473,["170"] = 482,["171"] = 483,["172"] = 482,["173"] = 489,["174"] = 490,["175"] = 489,["176"] = 496,["177"] = 497,["178"] = 496,["179"] = 503,["180"] = 504,["181"] = 503,["182"] = 510,["183"] = 511,["184"] = 510,["185"] = 517,["186"] = 518,["187"] = 517,["188"] = 524,["189"] = 525,["190"] = 526,["191"] = 527,["192"] = 528,["194"] = 530,["195"] = 524,["196"] = 536,["197"] = 537,["198"] = 536,["199"] = 543,["200"] = 544,["201"] = 543,["207"] = 27,["209"] = 30,["210"] = 31,["220"] = 84,["222"] = 76,["223"] = 77,["232"] = 91,["241"] = 96,["243"] = 102,["244"] = 103,["254"] = 110,["256"] = 116,["257"] = 117,["266"] = 124,["275"] = 131,["277"] = 137,["278"] = 138,["287"] = 145,["295"] = 152,["303"] = 159,["311"] = 166,["319"] = 173,["327"] = 180,["335"] = 187});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local cache = {}
____exports.MapPlayer = __TS__Class()
local MapPlayer = ____exports.MapPlayer
MapPlayer.name = "MapPlayer"
__TS__ClassExtends(MapPlayer, Handle)
function MapPlayer.prototype.____constructor(self, index)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            Player(index)
        )
    end
end
function MapPlayer.prototype.isLocalPlayer(self)
    if GetLocalPlayer() == self.handle then
        return true
    end
    return false
end
function MapPlayer.prototype.getAllUnits(self)
    local g = CreateGroup()
    GroupEnumUnitsOfPlayer(g, self.handle, nil)
    return g
end
function MapPlayer.prototype.displayText(self, text, duration)
    if duration == nil then
        duration = 5
    end
    DisplayTimedTextToPlayer(
        self.handle,
        0,
        0,
        duration,
        text
    )
end
function MapPlayer.prototype.addTechResearched(self, techId, levels)
    AddPlayerTechResearched(self.handle, techId, levels)
end
function MapPlayer.prototype.cacheHeroData(self)
    CachePlayerHeroData(self.handle)
end
function MapPlayer.prototype.compareAlliance(self, otherPlayer, whichAllianceSetting)
    return GetPlayerAlliance(self.handle, otherPlayer.handle, whichAllianceSetting)
end
function MapPlayer.prototype.coordsFogged(self, x, y)
    return IsFoggedToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.coordsMasked(self, x, y)
    return IsMaskedToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.coordsVisible(self, x, y)
    return IsVisibleToPlayer(x, y, self.handle)
end
function MapPlayer.prototype.cripple(self, toWhichPlayers, flag)
    CripplePlayer(self.handle, toWhichPlayers.handle, flag)
end
function MapPlayer.prototype.getScore(self, whichPlayerScore)
    return GetPlayerScore(self.handle, whichPlayerScore)
end
function MapPlayer.prototype.getState(self, whichPlayerState)
    return GetPlayerState(self.handle, whichPlayerState)
end
function MapPlayer.prototype.getStructureCount(self, includeIncomplete)
    return GetPlayerStructureCount(self.handle, includeIncomplete)
end
function MapPlayer.prototype.getTaxRate(self, otherPlayer, whichResource)
    return GetPlayerTaxRate(self.handle, otherPlayer, whichResource)
end
function MapPlayer.prototype.getTechCount(self, techId, specificonly)
    return GetPlayerTechCount(self.handle, techId, specificonly)
end
function MapPlayer.prototype.getTechMaxAllowed(self, techId)
    return GetPlayerTechMaxAllowed(self.handle, techId)
end
function MapPlayer.prototype.getTechResearched(self, techId, specificonly)
    return GetPlayerTechResearched(self.handle, techId, specificonly)
end
function MapPlayer.prototype.getUnitCount(self, includeIncomplete)
    return GetPlayerUnitCount(self.handle, includeIncomplete)
end
function MapPlayer.prototype.getUnitCountByType(self, unitName, includeIncomplete, includeUpgrades)
    return GetPlayerTypedUnitCount(self.handle, unitName, includeIncomplete, includeUpgrades)
end
function MapPlayer.prototype.inForce(self, whichForce)
    return IsPlayerInForce(self.handle, whichForce.handle)
end
function MapPlayer.prototype.isObserver(self)
    return IsPlayerObserver(self.handle)
end
function MapPlayer.prototype.isPlayerAlly(self, otherPlayer)
    return IsPlayerAlly(self.handle, otherPlayer.handle)
end
function MapPlayer.prototype.isPlayerEnemy(self, otherPlayer)
    return IsPlayerEnemy(self.handle, otherPlayer.handle)
end
function MapPlayer.prototype.isRacePrefSet(self, pref)
    return IsPlayerRacePrefSet(self.handle, pref)
end
function MapPlayer.prototype.isSelectable(self)
    return GetPlayerSelectable(self.handle)
end
function MapPlayer.prototype.pointFogged(self, whichPoint)
    return IsLocationFoggedToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.pointMasked(self, whichPoint)
    return IsLocationMaskedToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.pointVisible(self, whichPoint)
    return IsLocationVisibleToPlayer(whichPoint.handle, self.handle)
end
function MapPlayer.prototype.remove(self, gameResult)
    RemovePlayer(self.handle, gameResult)
end
function MapPlayer.prototype.removeAllGuardPositions(self)
    RemoveAllGuardPositions(self.handle)
end
function MapPlayer.prototype.setAbilityAvailable(self, abilId, avail)
    SetPlayerAbilityAvailable(self.handle, abilId, avail)
end
function MapPlayer.prototype.setAlliance(self, otherPlayer, whichAllianceSetting, value)
    SetPlayerAlliance(self.handle, otherPlayer.handle, whichAllianceSetting, value)
end
function MapPlayer.prototype.setOnScoreScreen(self, flag)
    SetPlayerOnScoreScreen(self.handle, flag)
end
function MapPlayer.prototype.addGoldState(self, value)
    self:addState(PLAYER_STATE_RESOURCE_GOLD, value)
end
function MapPlayer.prototype.addLumberState(self, value)
    self:addState(PLAYER_STATE_RESOURCE_LUMBER, value)
end
function MapPlayer.prototype.hasGold(self, value)
    return self:getState(PLAYER_STATE_RESOURCE_GOLD) >= value
end
function MapPlayer.prototype.hasLumber(self, value)
    return self:getState(PLAYER_STATE_RESOURCE_LUMBER) >= value
end
function MapPlayer.prototype.getGold(self)
    return self:getState(PLAYER_STATE_RESOURCE_GOLD)
end
function MapPlayer.prototype.getLumber(self)
    return self:getState(PLAYER_STATE_RESOURCE_LUMBER)
end
function MapPlayer.prototype.addState(self, whichPlayerState, value)
    self:setState(
        whichPlayerState,
        self:getState(whichPlayerState) + value
    )
end
function MapPlayer.prototype.setState(self, whichPlayerState, value)
    SetPlayerState(self.handle, whichPlayerState, value)
end
function MapPlayer.prototype.setTaxRate(self, otherPlayer, whichResource, rate)
    SetPlayerTaxRate(self.handle, otherPlayer.handle, whichResource, rate)
end
function MapPlayer.prototype.setTechMaxAllowed(self, techId, maximum)
    SetPlayerTechMaxAllowed(self.handle, techId, maximum)
end
function MapPlayer.prototype.setTechResearched(self, techId, setToLevel)
    SetPlayerTechResearched(self.handle, techId, setToLevel)
end
function MapPlayer.prototype.setUnitsOwner(self, newOwner)
    SetPlayerUnitsOwner(self.handle, newOwner)
end
function MapPlayer.fromEnum(self)
    return ____exports.MapPlayer:fromHandle(GetEnumPlayer())
end
function MapPlayer.fromEvent(self)
    return ____exports.MapPlayer:fromHandle(GetTriggerPlayer())
end
function MapPlayer.fromFilter(self)
    return ____exports.MapPlayer:fromHandle(GetFilterPlayer())
end
function MapPlayer.fromHandle(self, handle)
    local obj = cache[GetHandleId(handle)]
    if not obj then
        obj = self:getObject(handle)
        cache[GetHandleId(handle)] = obj
    end
    return obj
end
function MapPlayer.fromIndex(self, index)
    return self:fromHandle(Player(index))
end
function MapPlayer.fromLocal(self)
    return self:fromHandle(GetLocalPlayer())
end
__TS__SetDescriptor(
    MapPlayer.prototype,
    "solarData",
    {
        get = function(self)
            return DataBase:getPlayerSolarData(self.handle)
        end,
        set = function(self, obj)
            DataBase:setDataByHandle("+ply", self.handle, obj)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "color",
    {
        get = function(self)
            return GetPlayerColor(self.handle)
        end,
        set = function(self, color)
            SetPlayerColor(self.handle, color)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "controller",
    {get = function(self)
        return GetPlayerController(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "handicap",
    {
        get = function(self)
            return GetPlayerHandicap(self.handle)
        end,
        set = function(self, handicap)
            SetPlayerHandicap(self.handle, handicap)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "handicapXp",
    {
        get = function(self)
            return GetPlayerHandicapXP(self.handle)
        end,
        set = function(self, handicap)
            SetPlayerHandicapXP(self.handle, handicap)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "id",
    {get = function(self)
        return GetPlayerId(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "name",
    {
        get = function(self)
            return GetPlayerName(self.handle)
        end,
        set = function(self, value)
            SetPlayerName(self.handle, value)
        end
    },
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "race",
    {get = function(self)
        return GetPlayerRace(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "slotState",
    {get = function(self)
        return GetPlayerSlotState(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocation",
    {get = function(self)
        return GetPlayerStartLocation(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationX",
    {get = function(self)
        return GetStartLocationX(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationY",
    {get = function(self)
        return GetStartLocationY(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "startLocationPoint",
    {get = function(self)
        return GetStartLocationLoc(self.startLocation)
    end},
    true
)
__TS__SetDescriptor(
    MapPlayer.prototype,
    "team",
    {get = function(self)
        return GetPlayerTeam(self.handle)
    end},
    true
)
return ____exports
