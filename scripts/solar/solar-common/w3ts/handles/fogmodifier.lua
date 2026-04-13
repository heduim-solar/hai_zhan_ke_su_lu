local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 7,["10"] = 7,["11"] = 7,["12"] = 7,["13"] = 9,["14"] = 10,["15"] = 7,["17"] = 7,["18"] = 13,["19"] = 13,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 13,["26"] = 13,["27"] = 13,["28"] = 13,["30"] = 9,["31"] = 20,["32"] = 21,["33"] = 20,["34"] = 27,["35"] = 28,["36"] = 27,["37"] = 34,["38"] = 35,["39"] = 34,["40"] = 38,["41"] = 39,["42"] = 38,["43"] = 42,["44"] = 43,["45"] = 43,["46"] = 43,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 42});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.FogModifier = __TS__Class()
local FogModifier = ____exports.FogModifier
FogModifier.name = "FogModifier"
__TS__ClassExtends(FogModifier, Handle)
function FogModifier.prototype.____constructor(self, forWhichPlayer, whichState, centerX, centerY, radius, useSharedVision, afterUnits)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateFogModifierRadius(
                forWhichPlayer.handle,
                whichState,
                centerX,
                centerY,
                radius,
                useSharedVision,
                afterUnits
            )
        )
    end
end
function FogModifier.prototype.destroy(self)
    DestroyFogModifier(self.handle)
end
function FogModifier.prototype.start(self)
    FogModifierStart(self.handle)
end
function FogModifier.prototype.stop(self)
    FogModifierStop(self.handle)
end
function FogModifier.fromHandle(self, handle)
    return self:getObject(handle)
end
function FogModifier.fromRect(self, forWhichPlayer, whichState, where, useSharedVision, afterUnits)
    return self:fromHandle(CreateFogModifierRect(
        forWhichPlayer.handle,
        whichState,
        where.handle,
        useSharedVision,
        afterUnits
    ))
end
return ____exports
