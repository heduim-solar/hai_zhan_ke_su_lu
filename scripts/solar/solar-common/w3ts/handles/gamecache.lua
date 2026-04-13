local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 6,["10"] = 6,["11"] = 6,["12"] = 6,["13"] = 10,["14"] = 11,["15"] = 6,["17"] = 6,["18"] = 14,["19"] = 14,["20"] = 14,["22"] = 17,["23"] = 10,["24"] = 20,["25"] = 21,["26"] = 20,["27"] = 24,["28"] = 25,["29"] = 24,["30"] = 28,["31"] = 29,["32"] = 28,["33"] = 32,["34"] = 33,["35"] = 32,["36"] = 36,["37"] = 37,["38"] = 36,["39"] = 40,["40"] = 41,["41"] = 40,["42"] = 44,["43"] = 45,["44"] = 44,["45"] = 48,["46"] = 49,["47"] = 48,["48"] = 52,["49"] = 53,["50"] = 52,["51"] = 56,["52"] = 57,["53"] = 56,["54"] = 60,["55"] = 61,["56"] = 60,["57"] = 64,["58"] = 65,["59"] = 64,["60"] = 68,["61"] = 69,["62"] = 68,["63"] = 72,["64"] = 73,["65"] = 72,["66"] = 76,["67"] = 77,["68"] = 76,["69"] = 80,["70"] = 81,["71"] = 81,["72"] = 81,["73"] = 81,["74"] = 81,["75"] = 81,["76"] = 81,["77"] = 81,["78"] = 81,["79"] = 80,["80"] = 84,["81"] = 85,["82"] = 84,["83"] = 88,["84"] = 89,["85"] = 90,["86"] = 91,["87"] = 92,["88"] = 93,["89"] = 94,["91"] = 96,["93"] = 88,["94"] = 100,["95"] = 101,["96"] = 100,["97"] = 104,["98"] = 105,["99"] = 104,["100"] = 108,["101"] = 109,["102"] = 108,["103"] = 112,["104"] = 113,["105"] = 112,["106"] = 116,["107"] = 117,["108"] = 116,["109"] = 120,["110"] = 121,["111"] = 120,["112"] = 124,["113"] = 125,["114"] = 124});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.GameCache = __TS__Class()
local GameCache = ____exports.GameCache
GameCache.name = "GameCache"
__TS__ClassExtends(GameCache, Handle)
function GameCache.prototype.____constructor(self, campaignFile)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            InitGameCache(campaignFile)
        )
    end
    self.filename = campaignFile
end
function GameCache.prototype.flush(self)
    FlushGameCache(self.handle)
end
function GameCache.prototype.flushBoolean(self, missionKey, key)
    FlushStoredBoolean(self.handle, missionKey, key)
end
function GameCache.prototype.flushInteger(self, missionKey, key)
    FlushStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.flushMission(self, missionKey)
    FlushStoredMission(self.handle, missionKey)
end
function GameCache.prototype.flushNumber(self, missionKey, key)
    FlushStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.flushString(self, missionKey, key)
    FlushStoredString(self.handle, missionKey, key)
end
function GameCache.prototype.flushUnit(self, missionKey, key)
    FlushStoredUnit(self.handle, missionKey, key)
end
function GameCache.prototype.getBoolean(self, missionKey, key)
    return GetStoredBoolean(self.handle, missionKey, key)
end
function GameCache.prototype.getInteger(self, missionKey, key)
    return GetStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.getNumber(self, missionKey, key)
    return GetStoredReal(self.handle, missionKey, key)
end
function GameCache.prototype.getString(self, missionKey, key)
    return GetStoredString(self.handle, missionKey, key)
end
function GameCache.prototype.hasBoolean(self, missionKey, key)
    return HaveStoredBoolean(self.handle, missionKey, key)
end
function GameCache.prototype.hasInteger(self, missionKey, key)
    return HaveStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.hasNumber(self, missionKey, key)
    return HaveStoredReal(self.handle, missionKey, key)
end
function GameCache.prototype.hasString(self, missionKey, key)
    return HaveStoredString(self.handle, missionKey, key)
end
function GameCache.prototype.restoreUnit(self, missionKey, key, forWhichPlayer, x, y, face)
    return RestoreUnit(
        self.handle,
        missionKey,
        key,
        forWhichPlayer.handle,
        x,
        y,
        face
    )
end
function GameCache.prototype.save(self)
    return SaveGameCache(self.handle)
end
function GameCache.prototype.store(self, missionKey, key, value)
    if type(value) == "string" then
        StoreString(self.handle, missionKey, key, value)
    elseif type(value) == "boolean" then
        StoreBoolean(self.handle, missionKey, key, value)
    elseif type(value) == "number" then
        StoreReal(self.handle, missionKey, key, value)
    else
        StoreUnit(self.handle, missionKey, key, value)
    end
end
function GameCache.prototype.syncBoolean(self, missionKey, key)
    return SyncStoredBoolean(self.handle, missionKey, key)
end
function GameCache.prototype.syncInteger(self, missionKey, key)
    return SyncStoredInteger(self.handle, missionKey, key)
end
function GameCache.prototype.syncNumber(self, missionKey, key)
    return SyncStoredReal(self.handle, missionKey, key)
end
function GameCache.prototype.syncString(self, missionKey, key)
    return SyncStoredString(self.handle, missionKey, key)
end
function GameCache.prototype.syncUnit(self, missionKey, key)
    return SyncStoredUnit(self.handle, missionKey, key)
end
function GameCache.fromHandle(self, handle)
    return self:getObject(handle)
end
function GameCache.reloadFromDisk(self)
    return ReloadGameCachesFromDisk()
end
return ____exports
