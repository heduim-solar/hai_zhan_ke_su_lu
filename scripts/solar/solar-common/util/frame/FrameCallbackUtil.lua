local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 5,["10"] = 5,["11"] = 5,["13"] = 5,["14"] = 13,["15"] = 14,["16"] = 15,["18"] = 18,["19"] = 18,["20"] = 18,["21"] = 19,["22"] = 20,["23"] = 21,["24"] = 22,["25"] = 23,["26"] = 19,["27"] = 25,["28"] = 18,["29"] = 18,["30"] = 27,["31"] = 13,["32"] = 36,["33"] = 37,["34"] = 37,["35"] = 37,["36"] = 38,["37"] = 39,["38"] = 40,["39"] = 41,["41"] = 39,["42"] = 45,["43"] = 46,["44"] = 45,["45"] = 48,["46"] = 37,["47"] = 37,["48"] = 50,["49"] = 36,["50"] = 6,["51"] = 7,["52"] = 8});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
____exports.default = __TS__Class()
local FrameCallbackUtil = ____exports.default
FrameCallbackUtil.name = "FrameCallbackUtil"
function FrameCallbackUtil.prototype.____constructor(self)
end
function FrameCallbackUtil.getFps(self)
    if isEmbedJapi then
        return GetFps()
    end
    ____exports.default.cache:get(
        "getFps",
        function()
            ____exports.default:addFrameSetUpdateCallback(function()
                local nowTime = os.clock()
                local fpsGap = nowTime - ____exports.default._sl_lastFrameUpdateTime
                ____exports.default._sl_tempFps = 1 / fpsGap
                ____exports.default._sl_lastFrameUpdateTime = nowTime
            end)
            return true
        end
    )
    return ____exports.default._sl_tempFps
end
function FrameCallbackUtil.addFrameSetUpdateCallback(self, frameUpdateCallback)
    local callbacks = ____exports.default.cache:get(
        "AddFrameSetUpdateCallback",
        function()
            local cbs = {}
            DzFrameSetUpdateCallbackByCode(function()
                for ____, cb in ipairs(cbs) do
                    cb()
                end
            end)
            _G.DzFrameSetUpdateCallbackByCode = function(funcHandle)
                ____exports.default:addFrameSetUpdateCallback(funcHandle)
            end
            return cbs
        end
    )
    callbacks[#callbacks + 1] = frameUpdateCallback
end
FrameCallbackUtil._sl_tempFps = 0
FrameCallbackUtil._sl_lastFrameUpdateTime = 0
FrameCallbackUtil.cache = __TS__New(Cache)
return ____exports
