local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 4,["10"] = 5,["11"] = 4,["12"] = 13,["13"] = 14,["14"] = 15,["15"] = 16,["16"] = 17,["18"] = 19,["19"] = 13,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 29,["25"] = 31,["26"] = 26,["27"] = 39,["28"] = 40,["29"] = 41,["30"] = 42,["31"] = 39,["32"] = 49,["33"] = 50,["34"] = 49,["35"] = 56,["36"] = 57,["37"] = 56});
local ____exports = {}
____exports.default = __TS__Class()
local Cache = ____exports.default
Cache.name = "Cache"
function Cache.prototype.____constructor(self)
    self.dataBase = {}
end
function Cache.prototype.get(self, key, defaultValue)
    local val = self.dataBase[key]
    if val == nil and defaultValue ~= nil then
        val = defaultValue(nil)
        self.dataBase[key] = val
    end
    return val
end
function Cache.prototype.has(self, key)
    local val = self.dataBase[key]
    if val == nil then
        return false
    end
    return true
end
function Cache.prototype.put(self, key, value)
    local old = self.dataBase[key]
    self.dataBase[key] = value
    return old
end
function Cache.prototype.remove(self, key)
    self.dataBase[key] = nil
end
function Cache.prototype.clear(self)
    self.dataBase = {}
end
return ____exports
