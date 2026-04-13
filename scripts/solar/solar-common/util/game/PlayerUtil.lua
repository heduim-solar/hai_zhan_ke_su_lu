local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 3,["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 11,["15"] = 11,["16"] = 11,["18"] = 11,["19"] = 17,["20"] = 18,["21"] = 17,["22"] = 25,["23"] = 26,["24"] = 26,["25"] = 25,["26"] = 34,["28"] = 35,["29"] = 35,["30"] = 36,["31"] = 37,["32"] = 38,["34"] = 35,["37"] = 34,["38"] = 47,["40"] = 48,["41"] = 48,["42"] = 49,["43"] = 50,["44"] = 51,["46"] = 48,["49"] = 47,["50"] = 65,["51"] = 65,["52"] = 65,["54"] = 65,["55"] = 65,["57"] = 65,["58"] = 65,["60"] = 66,["61"] = 66,["62"] = 66,["63"] = 66,["64"] = 66,["65"] = 66,["66"] = 66,["67"] = 65,["68"] = 78,["69"] = 78,["70"] = 78,["72"] = 78,["73"] = 78,["75"] = 78,["76"] = 78,["78"] = 78,["79"] = 78,["81"] = 79,["82"] = 79,["83"] = 79,["84"] = 79,["85"] = 79,["86"] = 79,["87"] = 79,["88"] = 78,["89"] = 87,["91"] = 88,["92"] = 88,["93"] = 89,["94"] = 90,["95"] = 91,["97"] = 88,["100"] = 87,["101"] = 102,["102"] = 103,["103"] = 102,["104"] = 111,["105"] = 112,["106"] = 111,["107"] = 120,["108"] = 121,["109"] = 120,["110"] = 129,["111"] = 130,["112"] = 129,["113"] = 139,["114"] = 140,["115"] = 140,["116"] = 140,["117"] = 140,["118"] = 140,["119"] = 139,["120"] = 148,["121"] = 149,["122"] = 148,["123"] = 156,["124"] = 157,["125"] = 156,["126"] = 164,["127"] = 165,["128"] = 164,["129"] = 173,["130"] = 174,["131"] = 173,["132"] = 181,["133"] = 182,["134"] = 181,["135"] = 191,["136"] = 192,["137"] = 191,["138"] = 199,["139"] = 200,["140"] = 199,["141"] = 209,["142"] = 210,["143"] = 209,["144"] = 219,["145"] = 220,["146"] = 221,["148"] = 223,["149"] = 224,["151"] = 226,["152"] = 219,["153"] = 235,["154"] = 236,["155"] = 237,["157"] = 239,["158"] = 240,["160"] = 242,["161"] = 243,["163"] = 245,["164"] = 246,["166"] = 248,["167"] = 235,["168"] = 255,["169"] = 256,["170"] = 255,["171"] = 262,["172"] = 263,["173"] = 262,["174"] = 269,["175"] = 270,["176"] = 269,["177"] = 280,["178"] = 281,["179"] = 282,["180"] = 283,["183"] = 286,["184"] = 280,["185"] = 294,["186"] = 295,["187"] = 296,["188"] = 297,["191"] = 300,["192"] = 294,["193"] = 308,["194"] = 308,["195"] = 309,["196"] = 310,["197"] = 311,["198"] = 312,["199"] = 313,["201"] = 308,["202"] = 318,["203"] = 319,["204"] = 318,["205"] = 323,["206"] = 324,["207"] = 323,["208"] = 333,["209"] = 336,["210"] = 336,["211"] = 336,["212"] = 337,["213"] = 336,["214"] = 336,["215"] = 333,["216"] = 345,["217"] = 346,["218"] = 347,["219"] = 347,["220"] = 347,["221"] = 347,["222"] = 347,["223"] = 352,["224"] = 345,["225"] = 360,["226"] = 361,["227"] = 362,["230"] = 365,["231"] = 366,["232"] = 366,["233"] = 366,["234"] = 367,["235"] = 368,["236"] = 369,["237"] = 369,["238"] = 369,["239"] = 370,["240"] = 369,["241"] = 369,["242"] = 372,["244"] = 374,["245"] = 375,["246"] = 376,["247"] = 377,["249"] = 379,["250"] = 366,["251"] = 366,["252"] = 360,["253"] = 384,["255"] = 385,["256"] = 385,["257"] = 386,["258"] = 387,["259"] = 388,["260"] = 389,["263"] = 385,["266"] = 394,["267"] = 384});
local ____exports = {}
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local PlayerUtil = ____exports.default
PlayerUtil.name = "PlayerUtil"
function PlayerUtil.prototype.____constructor(self)
end
function PlayerUtil.setHero(self, player, hero)
    DataBase:getPlayerSolarData(player, true).hero = hero
end
function PlayerUtil.getHero(self, player)
    local ____opt_0 = DataBase:getPlayerSolarData(player, false)
    return ____opt_0 and ____opt_0.hero
end
function PlayerUtil.forPlayingPlayers(self, callback)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                callback(nil, tempPlayer)
            end
            i = i + 1
        end
    end
end
function PlayerUtil.forUsers(self, callback)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                callback(nil, tempPlayer)
            end
            i = i + 1
        end
    end
end
function PlayerUtil.text(self, player, text, duration, x, y)
    if duration == nil then
        duration = 10
    end
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    DisplayTimedTextToPlayer(
        player,
        x,
        y,
        duration,
        text
    )
end
function PlayerUtil.message(self, text, duration, player, x, y)
    if duration == nil then
        duration = 10
    end
    if player == nil then
        player = GetLocalPlayer()
    end
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    DisplayTimedTextToPlayer(
        player,
        x,
        y,
        duration,
        text
    )
end
function PlayerUtil.firstOfUsers(self)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                return tempPlayer
            end
            i = i + 1
        end
    end
end
function PlayerUtil.addGoldState(self, player, value)
    ____exports.default:addState(player, PLAYER_STATE_RESOURCE_GOLD, value)
end
function PlayerUtil.addLumberState(self, player, value)
    ____exports.default:addState(player, PLAYER_STATE_RESOURCE_LUMBER, value)
end
function PlayerUtil.addFoodCapState(self, player, value)
    ____exports.default:addState(player, PLAYER_STATE_RESOURCE_FOOD_CAP, value)
end
function PlayerUtil.addFoodUsedState(self, player, value)
    ____exports.default:addState(player, PLAYER_STATE_RESOURCE_FOOD_USED, value)
end
function PlayerUtil.addState(self, player, whichPlayerState, value)
    SetPlayerState(
        player,
        whichPlayerState,
        GetPlayerState(player, whichPlayerState) + value
    )
end
function PlayerUtil.getGold(self, player)
    return GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD)
end
function PlayerUtil.setGold(self, player, gold)
    SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, gold)
end
function PlayerUtil.getLumber(self, player)
    return GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER)
end
function PlayerUtil.setLumber(self, player, lumber)
    SetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER, lumber)
end
function PlayerUtil.getFoodCap(self, player)
    return GetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_CAP)
end
function PlayerUtil.setFoodCap(self, player, foodCap)
    SetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_CAP, foodCap)
end
function PlayerUtil.getFoodUsed(self, player)
    return GetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_USED)
end
function PlayerUtil.setFoodUsed(self, player, foodUsed)
    SetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_USED, foodUsed)
end
function PlayerUtil.hasEnoughState(self, player, gold, lumber)
    if gold and gold > 0 and GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) < gold then
        return false
    end
    if lumber and lumber > 0 and GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER) < lumber then
        return false
    end
    return true
end
function PlayerUtil.costEnoughState(self, player, gold, lumber)
    if gold and gold > 0 and GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD) < gold then
        return false
    end
    if lumber and lumber > 0 and GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER) < lumber then
        return false
    end
    if gold then
        ____exports.default:addGoldState(player, -gold)
    end
    if lumber then
        ____exports.default:addLumberState(player, -lumber)
    end
    return true
end
function PlayerUtil.isOnlineUser(self, pid)
    return GetPlayerController(Player(pid)) == MAP_CONTROL_USER and GetPlayerSlotState(Player(pid)) == PLAYER_SLOT_STATE_PLAYING
end
function PlayerUtil.isUser(self, player)
    return GetPlayerController(player) == MAP_CONTROL_USER
end
function PlayerUtil.isComputer(self, player)
    return GetPlayerController(player) == MAP_CONTROL_COMPUTER
end
function PlayerUtil.hasAllUnitTypes(self, player, unitIds)
    for ____, unitId in ipairs(unitIds) do
        if GetPlayerTechCount(player, unitId, false) < 1 then
            return false
        end
    end
    return true
end
function PlayerUtil.hasUnitType(self, player, unitIds)
    for ____, unitId in ipairs(unitIds) do
        if GetPlayerTechCount(player, unitId, false) > 0 then
            return true
        end
    end
    return false
end
function PlayerUtil.allianceWithNeutralAggressive(self, ...)
    local playerIds = {...}
    local neutralAggressivePlayer = Player(PLAYER_NEUTRAL_AGGRESSIVE)
    for ____, playerId in ipairs(playerIds) do
        local player = Player(playerId)
        SetPlayerAlliance(player, neutralAggressivePlayer, ALLIANCE_PASSIVE, true)
        SetPlayerAlliance(neutralAggressivePlayer, player, ALLIANCE_PASSIVE, true)
    end
end
function PlayerUtil.neutralAggressivePlayer(self)
    return Player(PLAYER_NEUTRAL_AGGRESSIVE)
end
function PlayerUtil.neutralPassivePlayer(self)
    return Player(PLAYER_NEUTRAL_PASSIVE)
end
function PlayerUtil.onSyncSelectedUnit(self, key, callBack)
    SyncUtil.onSyncObjData(
        "_sl_ssu" .. key,
        function(____, p, data)
            callBack(nil, p, data)
        end
    )
end
function PlayerUtil.syncSelectedUnit(self, key)
    local localSelectedUnit = selection()
    local data = {
        u = h2i(localSelectedUnit),
        x = DzGetMouseTerrainX(),
        y = DzGetMouseTerrainY()
    }
    SyncUtil.syncObjData("_sl_ssu" .. key, data)
end
function PlayerUtil.onUsersUidReady(self, callback)
    if GetUserId == nil then
        log.errorWithTraceBack("当前环境不支持使用此函数!")
        return
    end
    local gap = 0.05
    BaseUtil.onTimer(
        gap,
        function(____, count)
            if ____exports.default:_sl_isUsersUidReady() then
                print(("Uid同步完成:" .. tostring(gap * count)) .. "秒!")
                BaseUtil.runLater(
                    0.01,
                    function()
                        callback(nil)
                    end
                )
                return false
            end
            if count > 200 then
                BJDebugMsg("等待UID同步超时!请尝试重开游戏!")
                log.errorWithTraceBack("等待UID同步超时!")
                return false
            end
            return true
        end
    )
end
function PlayerUtil._sl_isUsersUidReady(self)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                if MapPlayer:fromHandle(tempPlayer).userId == -1 then
                    return false
                end
            end
            i = i + 1
        end
    end
    return true
end
return ____exports
