local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 9,["12"] = 10,["14"] = 11,["15"] = 11,["16"] = 12,["17"] = 13,["18"] = 14,["20"] = 11,["23"] = 17,["24"] = 9,["25"] = 24,["26"] = 24,["27"] = 24,["29"] = 25,["31"] = 26,["32"] = 26,["33"] = 27,["34"] = 28,["35"] = 29,["36"] = 30,["39"] = 26,["42"] = 34,["43"] = 24,["44"] = 40,["45"] = 41,["47"] = 42,["48"] = 42,["49"] = 43,["50"] = 44,["51"] = 45,["53"] = 42,["56"] = 48,["57"] = 40,["58"] = 56,["60"] = 57,["61"] = 57,["62"] = 58,["63"] = 59,["64"] = 60,["66"] = 57,["69"] = 56,["70"] = 69,["72"] = 70,["73"] = 70,["74"] = 71,["75"] = 72,["76"] = 73,["78"] = 70,["81"] = 69});
local ____exports = {}
____exports.default = __TS__Class()
local ForceUtil = ____exports.default
ForceUtil.name = "ForceUtil"
function ForceUtil.prototype.____constructor(self)
end
function ForceUtil.getUserCount()
    local count = 0
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                count = count + 1
            end
            i = i + 1
        end
    end
    return count
end
function ForceUtil.getUserAndComputerCount(playerIdMax)
    if playerIdMax == nil then
        playerIdMax = 4
    end
    local count = 0
    do
        local i = 0
        while i < playerIdMax do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER or GetPlayerController(tempPlayer) == MAP_CONTROL_COMPUTER then
                if GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                    count = count + 1
                end
            end
            i = i + 1
        end
    end
    return count
end
function ForceUtil.getUserForce()
    local force = CreateForce()
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                ForceAddPlayer(force, tempPlayer)
            end
            i = i + 1
        end
    end
    return force
end
function ForceUtil.forUserForce(callback)
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
function ForceUtil.forPlayerAllyForce(player, callback)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING and IsPlayerAlly(tempPlayer, player) then
                callback(nil, tempPlayer)
            end
            i = i + 1
        end
    end
end
return ____exports
