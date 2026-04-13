local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 5,["15"] = 5,["16"] = 5,["18"] = 10,["19"] = 8,["24"] = 18,["32"] = 26,["40"] = 33,["48"] = 40,["56"] = 47,["64"] = 55,["65"] = 55,["66"] = 55,["67"] = 55,["75"] = 62,["76"] = 62,["77"] = 62,["78"] = 62});
local ____exports = {}
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
____exports.default = __TS__Class()
local UIFrameEvent = ____exports.default
UIFrameEvent.name = "UIFrameEvent"
function UIFrameEvent.prototype.____constructor(self)
end
UIFrameEvent.instance = __TS__New(____exports.default)
__TS__SetDescriptor(
    UIFrameEvent.prototype,
    "triggerFrame",
    {get = function(self)
        return DzGetTriggerUIEventFrame()
    end},
    true
)
__TS__SetDescriptor(
    UIFrameEvent.prototype,
    "triggerPlayer",
    {get = function(self)
        return DzGetTriggerUIEventPlayer()
    end},
    true
)
__TS__SetDescriptor(
    UIFrameEvent.prototype,
    "triggerPlayerObj",
    {get = function(self)
        return MapPlayer:fromHandle(DzGetTriggerUIEventPlayer())
    end},
    true
)
__TS__SetDescriptor(
    UIFrameEvent.prototype,
    "triggerPlayerId",
    {get = function(self)
        return GetPlayerId(DzGetTriggerUIEventPlayer())
    end},
    true
)
__TS__SetDescriptor(
    UIFrameEvent.prototype,
    "triggerPlayerName",
    {get = function(self)
        return GetPlayerName(DzGetTriggerUIEventPlayer())
    end},
    true
)
__TS__SetDescriptor(
    UIFrameEvent.prototype,
    "triggerPlayerSolarData",
    {get = function(self)
        return DataBase:getPlayerSolarData(
            DzGetTriggerUIEventPlayer(),
            false
        )
    end},
    true
)
__TS__SetDescriptor(
    UIFrameEvent.prototype,
    "triggerPlayerAttribute",
    {get = function(self)
        return AttributeUtil:getPlayerAttribute(
            DzGetTriggerUIEventPlayer(),
            false
        )
    end},
    true
)
return ____exports
