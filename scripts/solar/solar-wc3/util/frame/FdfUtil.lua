local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 8,["12"] = 9,["13"] = 12,["14"] = 13,["15"] = 14,["16"] = 15,["17"] = 16,["18"] = 8,["19"] = 2});
local ____exports = {}
____exports.default = __TS__Class()
local FdfUtil = ____exports.default
FdfUtil.name = "FdfUtil"
function FdfUtil.prototype.____constructor(self)
end
function FdfUtil.loadFdfContent(self, fdfContent)
    local storm = require("jass.storm")
    local temp_path = "_sre\\temp\\ui\\loadFdfContent_temp"
    storm.save(temp_path .. ".fdf", fdfContent)
    storm.save(temp_path .. ".toc", temp_path .. ".fdf\r\n")
    DzLoadToc(temp_path .. ".toc")
    return true
end
FdfUtil.__index = 0
return ____exports
