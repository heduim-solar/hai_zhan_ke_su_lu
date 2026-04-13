local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 5,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 7,["15"] = 8,["16"] = 5,["18"] = 5,["19"] = 11,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 11,["25"] = 11,["26"] = 11,["27"] = 11,["28"] = 11,["29"] = 11,["31"] = 7,["32"] = 47,["33"] = 48,["34"] = 47,["35"] = 51,["36"] = 52,["37"] = 51,["38"] = 55,["39"] = 56,["40"] = 55,["41"] = 59,["42"] = 60,["43"] = 59,["44"] = 63,["45"] = 64,["46"] = 63,["47"] = 67,["48"] = 68,["49"] = 67,["50"] = 71,["51"] = 72,["52"] = 71,["53"] = 87,["54"] = 88,["55"] = 87,["56"] = 91,["57"] = 92,["58"] = 91,["59"] = 99,["60"] = 100,["61"] = 99,["62"] = 103,["63"] = 104,["64"] = 103,["65"] = 107,["66"] = 108,["67"] = 107,["68"] = 111,["69"] = 112,["70"] = 111,["71"] = 115,["72"] = 116,["73"] = 115,["74"] = 119,["75"] = 120,["76"] = 119,["77"] = 123,["78"] = 124,["79"] = 123,["80"] = 127,["81"] = 128,["82"] = 127,["83"] = 131,["84"] = 132,["85"] = 131,["91"] = 32,["93"] = 35,["94"] = 36,["103"] = 40,["111"] = 44});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Sound = __TS__Class()
local Sound = ____exports.Sound
Sound.name = "Sound"
__TS__ClassExtends(Sound, Handle)
function Sound.prototype.____constructor(self, fileName, looping, is3D, stopWhenOutOfRange, fadeInRate, fadeOutRate, eaxSetting)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateSound(
                fileName,
                looping,
                is3D,
                stopWhenOutOfRange,
                fadeInRate,
                fadeOutRate,
                eaxSetting
            )
        )
    end
end
function Sound.prototype.killWhenDone(self)
    KillSoundWhenDone(self.handle)
end
function Sound.prototype.registerStacked(self, byPosition, rectWidth, rectHeight)
    RegisterStackedSound(self.handle, byPosition, rectWidth, rectHeight)
end
function Sound.prototype.setChannel(self, channel)
    SetSoundChannel(self.handle, channel)
end
function Sound.prototype.setConeAngles(self, inside, outside, outsideVolume)
    SetSoundConeAngles(self.handle, inside, outside, outsideVolume)
end
function Sound.prototype.setConeOrientation(self, x, y, z)
    SetSoundConeOrientation(self.handle, x, y, z)
end
function Sound.prototype.setDistanceCutoff(self, cutoff)
    SetSoundDistanceCutoff(self.handle, cutoff)
end
function Sound.prototype.setDistances(self, minDist, maxDist)
    SetSoundDistances(self.handle, minDist, maxDist)
end
function Sound.prototype.setParamsFromLabel(self, soundLabel)
    SetSoundParamsFromLabel(self.handle, soundLabel)
end
function Sound.prototype.setPitch(self, pitch)
    SetSoundPitch(self.handle, pitch)
end
function Sound.prototype.setPlayPosition(self, millisecs)
    SetSoundPlayPosition(self.handle, millisecs)
end
function Sound.prototype.setPosition(self, x, y, z)
    SetSoundPosition(self.handle, x, y, z)
end
function Sound.prototype.setVelocity(self, x, y, z)
    SetSoundVelocity(self.handle, x, y, z)
end
function Sound.prototype.setVolume(self, volume)
    SetSoundVolume(self.handle, volume)
end
function Sound.prototype.start(self)
    StartSound(self.handle)
end
function Sound.prototype.stop(self, killWhenDone, fadeOut)
    StopSound(self.handle, killWhenDone, fadeOut)
end
function Sound.prototype.unregisterStacked(self, byPosition, rectWidth, rectHeight)
    UnregisterStackedSound(self.handle, byPosition, rectWidth, rectHeight)
end
function Sound.fromHandle(self, handle)
    return self:getObject(handle)
end
function Sound.getFileDuration(self, fileName)
    return GetSoundFileDuration(fileName)
end
__TS__SetDescriptor(
    Sound.prototype,
    "duration",
    {
        get = function(self)
            return GetSoundDuration(self.handle)
        end,
        set = function(self, duration)
            SetSoundDuration(self.handle, duration)
        end
    },
    true
)
__TS__SetDescriptor(
    Sound.prototype,
    "loading",
    {get = function(self)
        return GetSoundIsLoading(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Sound.prototype,
    "playing",
    {get = function(self)
        return GetSoundIsPlaying(self.handle)
    end},
    true
)
return ____exports
