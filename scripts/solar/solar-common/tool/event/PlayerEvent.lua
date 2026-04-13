local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 8,["15"] = 8,["16"] = 8,["18"] = 12,["19"] = 10,["24"] = 20,["32"] = 27,["40"] = 34,["48"] = 41,["56"] = 48,["64"] = 55,["72"] = 62});
local ____exports = {}
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local PlayerEvent = ____exports.default
PlayerEvent.name = "PlayerEvent"
function PlayerEvent.prototype.____constructor(self)
end
PlayerEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    PlayerEvent.prototype,
    "triggerPlayer",
    {get = function(self)
        return GetTriggerPlayer()
    end},
    true
)
__TS__SetDescriptor(
    PlayerEvent.prototype,
    "triggerPlayerObj",
    {get = function(self)
        return MapPlayer:fromHandle(GetTriggerPlayer())
    end},
    true
)
__TS__SetDescriptor(
    PlayerEvent.prototype,
    "triggerPlayerId",
    {get = function(self)
        return GetPlayerId(GetTriggerPlayer())
    end},
    true
)
__TS__SetDescriptor(
    PlayerEvent.prototype,
    "triggerPlayerName",
    {get = function(self)
        return GetPlayerName(GetTriggerPlayer())
    end},
    true
)
__TS__SetDescriptor(
    PlayerEvent.prototype,
    "eventPlayerChatString",
    {get = function(self)
        return GetEventPlayerChatString()
    end},
    true
)
__TS__SetDescriptor(
    PlayerEvent.prototype,
    "triggerPlayerSolarData",
    {get = function(self)
        return DataBase:getPlayerSolarData(GetTriggerPlayer())
    end},
    true
)
__TS__SetDescriptor(
    PlayerEvent.prototype,
    "triggerPlayerAttribute",
    {get = function(self)
        return AttributeUtil:getPlayerAttribute(GetTriggerPlayer())
    end},
    true
)
return ____exports
