local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 9,["17"] = 6,["19"] = 6,["20"] = 12,["21"] = 12,["22"] = 12,["24"] = 8,["25"] = 19,["26"] = 20,["27"] = 19,["28"] = 26,["29"] = 27,["30"] = 26,["31"] = 33,["32"] = 34,["33"] = 33,["34"] = 40,["35"] = 41,["36"] = 40,["37"] = 47,["38"] = 48,["39"] = 47,["40"] = 54,["41"] = 55,["42"] = 54,["43"] = 61,["44"] = 62,["45"] = 61,["46"] = 68,["47"] = 69,["48"] = 68,["49"] = 75,["50"] = 76,["51"] = 78,["52"] = 78,["53"] = 78,["54"] = 78,["55"] = 78,["56"] = 78,["57"] = 78,["58"] = 78,["59"] = 80,["60"] = 75,["61"] = 86,["62"] = 87,["63"] = 86,["64"] = 93,["65"] = 94,["66"] = 93,["67"] = 100,["68"] = 101,["69"] = 100});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
____exports.Force = __TS__Class()
local Force = ____exports.Force
Force.name = "Force"
__TS__ClassExtends(Force, Handle)
function Force.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateForce()
        )
    end
end
function Force.prototype.addPlayer(self, whichPlayer)
    ForceAddPlayer(self.handle, whichPlayer.handle)
end
function Force.prototype.clear(self)
    ForceClear(self.handle)
end
function Force.prototype.destroy(self)
    DestroyForce(self.handle)
end
function Force.prototype.enumAllies(self, whichPlayer, filter)
    ForceEnumAllies(self.handle, whichPlayer.handle, filter)
end
function Force.prototype.enumEnemies(self, whichPlayer, filter)
    ForceEnumEnemies(self.handle, whichPlayer.handle, filter)
end
function Force.prototype.enumPlayers(self, filter)
    ForceEnumPlayers(self.handle, filter)
end
function Force.prototype.enumPlayersCounted(self, filter, countLimit)
    ForceEnumPlayersCounted(self.handle, filter, countLimit)
end
Force.prototype["for"] = function(self, callback)
    ForForce(self.handle, callback)
end
function Force.prototype.getPlayers(self)
    local players = {}
    ForForce(
        self.handle,
        function()
            local ____temp_0 = #players + 1
            players[____temp_0] = MapPlayer:fromEnum()
            return ____temp_0
        end
    )
    return players
end
function Force.prototype.hasPlayer(self, whichPlayer)
    return IsPlayerInForce(whichPlayer.handle, self.handle)
end
function Force.prototype.removePlayer(self, whichPlayer)
    ForceRemovePlayer(self.handle, whichPlayer.handle)
end
function Force.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
