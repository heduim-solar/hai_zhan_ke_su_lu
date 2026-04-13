local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 2,["9"] = 2,["10"] = 6,["11"] = 6,["12"] = 6,["13"] = 11,["14"] = 12,["15"] = 11,["16"] = 20,["17"] = 21,["18"] = 20,["19"] = 24,["20"] = 29,["21"] = 30,["22"] = 31,["23"] = 32,["24"] = 33,["26"] = 36,["27"] = 37,["28"] = 38,["30"] = 40,["31"] = 41,["32"] = 42,["33"] = 43,["34"] = 44,["37"] = 47,["39"] = 49,["40"] = 50,["41"] = 24,["46"] = 17});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.Handle = __TS__Class()
local Handle = ____exports.Handle
Handle.name = "Handle"
function Handle.prototype.____constructor(self, handle)
    self.handle = handle == nil and ____exports.Handle.initHandle or handle
end
function Handle.initFromHandle(self)
    return ____exports.Handle.initHandle ~= nil
end
function Handle.getObject(self, handle, handleType)
    if not IsHandle(handle) then
        local tb = debug.traceback()
        log.error("Handle.getObject():你传的handle为空或0！")
        log.error(tb)
        return nil
    end
    ____exports.Handle.initHandle = handle
    local handleObj = nil
    if handleType ~= nil then
        --- 从solarData里获取 包装对象 以保证每次获取的都是相同的对象
        local solarData = DataBase:getDataByHandle(handleType, handle, true)
        handleObj = solarData._sl_handleObj
        if handleObj == nil then
            handleObj = __TS__New(self)
            solarData._sl_handleObj = handleObj
        end
    else
        handleObj = __TS__New(self)
    end
    ____exports.Handle.initHandle = nil
    return handleObj
end
__TS__SetDescriptor(
    Handle.prototype,
    "handleId",
    {get = function(self)
        return GetHandleId(self.handle)
    end},
    true
)
return ____exports
