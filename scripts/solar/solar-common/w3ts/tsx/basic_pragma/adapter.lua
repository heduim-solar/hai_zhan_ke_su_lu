local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 12,["6"] = 13,["7"] = 12,["8"] = 16,["9"] = 17,["10"] = 16,["11"] = 20,["12"] = 21,["13"] = 20,["14"] = 24,["15"] = 25,["16"] = 24,["17"] = 28,["18"] = 29,["19"] = 28,["20"] = 32,["21"] = 32,["22"] = 32,["23"] = 32,["24"] = 32,["25"] = 32,["26"] = 32,["27"] = 40,["28"] = 42,["29"] = 44,["30"] = 45,["31"] = 46,["32"] = 47,["33"] = 49,["34"] = 42});
local ____exports = {}
local function baseCreateFrame()
    error("Adapter has not implemented createFrame", 0)
end
local function baseCleanupFrame()
    error("Adapter has not implemented cleanupFrame", 0)
end
local function baseUpdateFrameProperties()
    error("Adapter has not implemented updateFrameProperties", 0)
end
local function baseGetParent()
    error("Adapter has not implemented getParent", 0)
end
local function baseScheduleUpdate()
    error("Adapter has not implemented scheduleUdate", 0)
end
local internalAdapter = {
    createFrame = baseCreateFrame,
    cleanupFrame = baseCleanupFrame,
    updateFrameProperties = baseUpdateFrameProperties,
    getParent = baseGetParent,
    scheduleUpdate = baseScheduleUpdate
}
____exports.adapter = internalAdapter
____exports.setAdapter = function(adapter)
    internalAdapter.createFrame = adapter.createFrame or baseCreateFrame
    internalAdapter.cleanupFrame = adapter.cleanupFrame or baseCleanupFrame
    internalAdapter.getParent = adapter.getParent or baseGetParent
    internalAdapter.updateFrameProperties = adapter.updateFrameProperties or baseUpdateFrameProperties
    internalAdapter.scheduleUpdate = adapter.scheduleUpdate or baseScheduleUpdate
end
return ____exports
