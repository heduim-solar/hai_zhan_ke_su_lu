local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 3,["9"] = 3,["12"] = 8,["13"] = 8,["14"] = 8,["15"] = 8,["17"] = 11,["18"] = 8,["20"] = 8,["21"] = 14,["22"] = 14,["23"] = 14,["25"] = 10,["26"] = 42,["27"] = 43,["28"] = 44,["29"] = 42,["30"] = 50,["31"] = 51,["32"] = 52,["33"] = 50,["34"] = 58,["35"] = 59,["36"] = 60,["37"] = 58,["38"] = 68,["39"] = 69,["40"] = 70,["41"] = 68,["42"] = 76,["43"] = 77,["44"] = 76,["45"] = 80,["46"] = 81,["47"] = 80,["52"] = 22,["60"] = 29,["68"] = 36});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
---
-- @deprecated 请尽量使用BaseUtil.runLater 中心计时器替代 以减少内存泄漏
____exports.Timer = __TS__Class()
local Timer = ____exports.Timer
Timer.name = "Timer"
__TS__ClassExtends(Timer, Handle)
function Timer.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateTimer()
        )
    end
end
function Timer.prototype.destroy(self)
    DestroyTimer(self.handle)
    return self
end
function Timer.prototype.pause(self)
    PauseTimer(self.handle)
    return self
end
function Timer.prototype.resume(self)
    ResumeTimer(self.handle)
    return self
end
function Timer.prototype.start(self, timeout, periodic, handlerFunc)
    TimerStart(self.handle, timeout, periodic, handlerFunc)
    return self
end
function Timer.fromExpired(self)
    return self:fromHandle(GetExpiredTimer())
end
function Timer.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    Timer.prototype,
    "elapsed",
    {get = function(self)
        return TimerGetElapsed(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Timer.prototype,
    "remaining",
    {get = function(self)
        return TimerGetRemaining(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Timer.prototype,
    "timeout",
    {get = function(self)
        return TimerGetTimeout(self.handle)
    end},
    true
)
return ____exports
