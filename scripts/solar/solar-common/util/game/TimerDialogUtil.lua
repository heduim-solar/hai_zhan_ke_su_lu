local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 13,["14"] = 13,["15"] = 13,["17"] = 14,["18"] = 15,["19"] = 16,["20"] = 17,["21"] = 18,["22"] = 19,["23"] = 20,["24"] = 20,["25"] = 20,["26"] = 21,["27"] = 22,["28"] = 20,["29"] = 20,["30"] = 24,["31"] = 13,["32"] = 5});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local TimerDialogUtil = ____exports.default
TimerDialogUtil.name = "TimerDialogUtil"
function TimerDialogUtil.prototype.____constructor(self)
end
function TimerDialogUtil.show(self, title, timeout, periodic)
    if periodic == nil then
        periodic = false
    end
    local timer = CreateTimer()
    local timerDialog = CreateTimerDialog(timer)
    TimerDialogSetTitle(timerDialog, title)
    TimerDialogDisplay(timerDialog, true)
    ____exports.default._sl_cache["_t" .. tostring(GetHandleId(timer))] = timerDialog
    TimerStart(timer, timeout, periodic, nil)
    BaseUtil.runLater(
        timeout,
        function()
            DestroyTimerDialog(timerDialog)
            DestroyTimer(timer)
        end
    )
    return timerDialog
end
TimerDialogUtil._sl_cache = {}
return ____exports
