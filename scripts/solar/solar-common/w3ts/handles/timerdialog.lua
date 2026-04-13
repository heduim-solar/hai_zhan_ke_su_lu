local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 8,["15"] = 9,["16"] = 6,["18"] = 6,["19"] = 12,["20"] = 12,["21"] = 12,["23"] = 8,["24"] = 24,["25"] = 25,["26"] = 24,["27"] = 28,["28"] = 29,["29"] = 28,["30"] = 32,["31"] = 33,["32"] = 32,["33"] = 36,["34"] = 37,["35"] = 36,["36"] = 40,["37"] = 41,["38"] = 40,["44"] = 17,["46"] = 20,["47"] = 21});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.TimerDialog = __TS__Class()
local TimerDialog = ____exports.TimerDialog
TimerDialog.name = "TimerDialog"
__TS__ClassExtends(TimerDialog, Handle)
function TimerDialog.prototype.____constructor(self, t)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateTimerDialog(t.handle)
        )
    end
end
function TimerDialog.prototype.destroy(self)
    DestroyTimerDialog(self.handle)
end
function TimerDialog.prototype.setSpeed(self, speedMultFactor)
    TimerDialogSetSpeed(self.handle, speedMultFactor)
end
function TimerDialog.prototype.setTimeRemaining(self, value)
    TimerDialogSetRealTimeRemaining(self.handle, value)
end
function TimerDialog.prototype.setTitle(self, title)
    TimerDialogSetTitle(self.handle, title)
end
function TimerDialog.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    TimerDialog.prototype,
    "display",
    {
        get = function(self)
            return IsTimerDialogDisplayed(self.handle)
        end,
        set = function(self, display)
            TimerDialogDisplay(self.handle, display)
        end
    },
    true
)
return ____exports
