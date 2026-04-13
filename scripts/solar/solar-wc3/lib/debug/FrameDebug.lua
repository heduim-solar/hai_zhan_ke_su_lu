local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 6,["12"] = 7,["15"] = 10,["16"] = 12,["17"] = 13,["18"] = 15,["19"] = 16,["21"] = 18,["22"] = 19,["23"] = 19,["24"] = 19,["25"] = 19,["26"] = 19,["27"] = 19,["28"] = 19,["29"] = 13,["30"] = 23,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 27,["36"] = 29,["37"] = 24,["38"] = 6,["39"] = 3,["40"] = 4});
local ____exports = {}
____exports.default = __TS__Class()
local FrameDebug = ____exports.default
FrameDebug.name = "FrameDebug"
function FrameDebug.prototype.____constructor(self)
end
function FrameDebug.init(self)
    if ____exports.default.is_init then
        return
    end
    ____exports.default.is_init = true
    local oldDzCreateFrameByTagName = DzCreateFrameByTagName
    _G.DzCreateFrameByTagName = function(frameType, name, parent, template, id)
        if ____exports.default.frameName[name] and ____exports.default.frameName[name] > 0 then
            log.errorWithTraceBack("你正在使用已经被使用过的Frame名字:" .. tostring(name))
        end
        ____exports.default.frameName[name] = 1
        return oldDzCreateFrameByTagName(
            frameType,
            name,
            parent,
            template,
            id
        )
    end
    local oldDzGetTriggerUIEventPlayer = DzGetTriggerUIEventPlayer
    _G.DzGetTriggerUIEventPlayer = function()
        local result = oldDzGetTriggerUIEventPlayer()
        if not IsHandle(result) then
            log.errorWithTraceBack("DzGetTriggerUIEventPlayer返回了一个空handle。请检查当前函数是否在UI触发回调之外使用！")
        end
        return result
    end
end
FrameDebug.is_init = false
FrameDebug.frameName = {}
return ____exports
