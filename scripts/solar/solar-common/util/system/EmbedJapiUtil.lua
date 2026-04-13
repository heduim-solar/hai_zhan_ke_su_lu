local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 4,["8"] = 4,["9"] = 6,["10"] = 6,["11"] = 6,["13"] = 6,["14"] = 21,["15"] = 22,["16"] = 23,["17"] = 24,["19"] = 26,["20"] = 27,["21"] = 28,["22"] = 29,["23"] = 30,["24"] = 31,["25"] = 31,["26"] = 31,["27"] = 32,["28"] = 32,["29"] = 32,["30"] = 32,["31"] = 32,["32"] = 32,["33"] = 32,["34"] = 32,["35"] = 33,["36"] = 31,["37"] = 31,["38"] = 21,["39"] = 7});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
____exports.default = __TS__Class()
local EmbedJapiUtil = ____exports.default
EmbedJapiUtil.name = "EmbedJapiUtil"
function EmbedJapiUtil.prototype.____constructor(self)
end
function EmbedJapiUtil.blpRect(self, path, left, top, right, bottom)
    if not EXBlpRect then
        log.errorWithTraceBack("当前环境不是内置japi环境!")
        return path
    end
    left = math.floor(left)
    top = math.floor(top)
    right = math.floor(right)
    bottom = math.floor(bottom)
    local newPath = ((((((("blpRect" .. tostring(left)) .. "_") .. tostring(top)) .. "_") .. tostring(right)) .. "_") .. tostring(bottom)) .. path
    return ____exports.default._sl_cache:get(
        newPath,
        function()
            EXBlpRect(
                path,
                newPath,
                left,
                top,
                right,
                bottom
            )
            return newPath
        end
    )
end
EmbedJapiUtil._sl_cache = __TS__New(Cache)
return ____exports
