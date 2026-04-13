local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringStartsWith = ____lualib.__TS__StringStartsWith
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 1,["12"] = 1,["13"] = 2,["14"] = 2,["15"] = 4,["16"] = 4,["17"] = 4,["19"] = 4,["20"] = 14,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 18,["25"] = 19,["26"] = 20,["27"] = 20,["30"] = 14,["31"] = 30,["32"] = 31,["33"] = 32,["34"] = 33,["36"] = 34,["37"] = 35,["39"] = 37,["40"] = 38,["42"] = 40,["46"] = 42,["47"] = 30,["48"] = 50,["49"] = 51,["50"] = 51,["51"] = 51,["52"] = 52,["53"] = 53,["54"] = 54,["55"] = 55,["56"] = 56,["57"] = 51,["58"] = 51,["59"] = 50,["60"] = 6});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____CodecUtil = require("solar.solar-common.util.math.CodecUtil")
local CodecUtil = ____CodecUtil.default
____exports.default = __TS__Class()
local ListFileUtil = ____exports.default
ListFileUtil.name = "ListFileUtil"
function ListFileUtil.prototype.____constructor(self)
end
function ListFileUtil.requireDir(self, dirPath, onRequireResult)
    local result = ____exports.default:lookupAll(dirPath, ".lua")
    for ____, luaPath in ipairs(result) do
        local requirePath = __TS__StringReplaceAll(luaPath, "\\", ".")
        requirePath = __TS__StringSubstring(requirePath, 0, #requirePath - 4)
        local requireResult = require(requirePath)
        if onRequireResult ~= nil then
            onRequireResult(nil, luaPath, requireResult)
        end
    end
end
function ListFileUtil.lookupAll(self, start, ____end)
    local listFileArray = ____exports.default:getListFile()
    local result = {}
    for ____, path in ipairs(listFileArray) do
        do
            if not __TS__StringStartsWith(path, start) then
                goto __continue7
            end
            if ____end and not __TS__StringEndsWith(path, ____end) then
                goto __continue7
            end
            result[#result + 1] = path
        end
        ::__continue7::
    end
    return result
end
function ListFileUtil.getListFile(self)
    return ____exports.default._sl_cache:get(
        "getListFile",
        function()
            local envars = require("env_vars")
            local listFileS = envars.listFile
            local jsonStr = CodecUtil:saesDecode(listFileS)
            local listFileArray = JSON:parse(jsonStr)
            return listFileArray
        end
    )
end
ListFileUtil._sl_cache = __TS__New(Cache)
return ____exports
