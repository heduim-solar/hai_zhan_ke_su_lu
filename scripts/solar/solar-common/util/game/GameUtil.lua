local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 9,["14"] = 9,["15"] = 9,["17"] = 9,["18"] = 9,["20"] = 10,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 11,["25"] = 11,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 13,["31"] = 10,["32"] = 9,["33"] = 21,["34"] = 21,["35"] = 21,["37"] = 22,["38"] = 23,["39"] = 24,["40"] = 22,["41"] = 21,["42"] = 31,["43"] = 31,["44"] = 31,["46"] = 32,["47"] = 32,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 33,["53"] = 31,["54"] = 40,["55"] = 41,["56"] = 40,["57"] = 49,["58"] = 49,["59"] = 49,["61"] = 49,["62"] = 49,["64"] = 50,["65"] = 51,["66"] = 49,["67"] = 59,["68"] = 59,["69"] = 59,["71"] = 60,["72"] = 61,["73"] = 61,["74"] = 61,["75"] = 61,["76"] = 61,["77"] = 61,["78"] = 60,["79"] = 63,["80"] = 64,["81"] = 65,["83"] = 59,["84"] = 72,["86"] = 73,["87"] = 73,["88"] = 74,["89"] = 75,["90"] = 76,["92"] = 73,["95"] = 72,["96"] = 86,["97"] = 87,["98"] = 88,["99"] = 86});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local GameUtil = ____exports.default
GameUtil.name = "GameUtil"
function GameUtil.prototype.____constructor(self)
end
function GameUtil.victorys(self, msg, endGame)
    if msg == nil then
        msg = "游戏胜利!"
    end
    if endGame == nil then
        endGame = false
    end
    PlayerUtil:forPlayingPlayers(function(____, player)
        DisplayTimedTextToPlayer(
            player,
            0,
            0,
            30,
            msg
        )
        if endGame then
            CustomVictoryBJ(player, true, true)
        end
    end)
end
function GameUtil.defeats(self, msg)
    if msg == nil then
        msg = "游戏失败!"
    end
    PlayerUtil:forPlayingPlayers(function(____, player)
        DisplayTextToPlayer(player, 0, 0, msg)
        CustomDefeatBJ(player, msg)
    end)
end
function GameUtil.gameOver(self, msg)
    if msg == nil then
        msg = "游戏结束!"
    end
    DisplayTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        msg
    )
    PauseAllUnitsBJ(true)
end
function GameUtil.closeWorldFogBoundary(self)
    EnableWorldFogBoundary(false)
end
function GameUtil.setTimeOfDay(self, timeOfDay, scale)
    if timeOfDay == nil then
        timeOfDay = 12
    end
    if scale == nil then
        scale = 0
    end
    SetFloatGameState(GAME_STATE_TIME_OF_DAY, timeOfDay)
    SetTimeOfDayScale(scale)
end
function GameUtil.openFullMapView(self, maskEnableOff)
    if maskEnableOff == nil then
        maskEnableOff = false
    end
    PlayerUtil:forPlayingPlayers(function(____, p)
        CreateFogModifierRectBJ(
            true,
            p,
            FOG_OF_WAR_VISIBLE,
            GetPlayableMapRect()
        )
    end)
    FogEnableOff()
    if maskEnableOff then
        FogMaskEnableOff()
    end
end
function GameUtil.openComputerPlayerGivesBounty(self)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_COMPUTER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                SetPlayerState(tempPlayer, PLAYER_STATE_GIVES_BOUNTY, 1)
            end
            i = i + 1
        end
    end
end
function GameUtil.getTerrainHeight(self, x, y)
    MoveLocation(tempLocation, x, y)
    return GetLocationZ(tempLocation)
end
return ____exports
