local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["16"] = 13,["17"] = 8,["18"] = 20,["19"] = 21,["20"] = 22,["23"] = 25,["24"] = 26,["25"] = 27,["26"] = 20,["27"] = 35,["28"] = 36,["29"] = 35,["30"] = 45,["31"] = 46,["32"] = 47,["33"] = 48,["34"] = 45});
local ____exports = {}
____exports.default = __TS__Class()
local VmUtil = ____exports.default
VmUtil.name = "VmUtil"
function VmUtil.prototype.____constructor(self)
end
function VmUtil.hasResource(self, resourcePath)
    local file = io.open(resourcePath, "r")
    if file then
        return true
    end
    return false
end
function VmUtil.getResourceAsString(self, strResourcePath)
    local file = io.open(strResourcePath, "rb")
    if not file then
        return
    end
    local str = file:read("*a")
    file:close()
    return str
end
function VmUtil.getResourceAsJson(self, jsonResourcePath)
    return JSON:parse(____exports.default:getResourceAsString(jsonResourcePath))
end
function VmUtil.writeFile(self, filename, content)
    local file = io.open(filename, "wb")
    file:write(content)
    file:close()
end
return ____exports
