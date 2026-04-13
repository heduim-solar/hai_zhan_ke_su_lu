local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 8,["10"] = 9,["11"] = 10,["12"] = 10,["13"] = 10,["15"] = 10,["16"] = 18,["17"] = 19,["18"] = 19,["19"] = 19,["20"] = 20,["21"] = 21,["22"] = 22,["24"] = 24,["25"] = 25,["26"] = 19,["27"] = 19,["28"] = 18,["29"] = 11});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local _require = require
local ftcsv = _require("ftcsv")
____exports.default = __TS__Class()
local CsvUtil = ____exports.default
CsvUtil.name = "CsvUtil"
function CsvUtil.prototype.____constructor(self)
end
function CsvUtil.parse(self, csvPath)
    return ____exports.default.cache:get(
        csvPath,
        function()
            local file = io.open(csvPath, "r")
            if not file then
                return nil
            end
            local data, headers = ftcsv.parse(csvPath, ",")
            return data
        end
    )
end
CsvUtil.cache = __TS__New(Cache)
return ____exports
