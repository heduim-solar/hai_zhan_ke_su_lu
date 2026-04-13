local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 4,["8"] = 4,["9"] = 4,["11"] = 4,["12"] = 7,["13"] = 8,["14"] = 9,["16"] = 11,["17"] = 7,["18"] = 14,["19"] = 15,["20"] = 16,["22"] = 18,["23"] = 14,["24"] = 25,["25"] = 26,["26"] = 27,["28"] = 25,["29"] = 35,["30"] = 36,["31"] = 37,["33"] = 35,["34"] = 45,["35"] = 46,["36"] = 47,["38"] = 45,["39"] = 56,["40"] = 57,["41"] = 58,["43"] = 56,["44"] = 66,["45"] = 67,["46"] = 68,["48"] = 66,["49"] = 89,["50"] = 90,["51"] = 91,["52"] = 92,["53"] = 93,["56"] = 96,["57"] = 89,["58"] = 104,["59"] = 105,["60"] = 106,["62"] = 104,["63"] = 115,["64"] = 116,["65"] = 117,["66"] = 118,["68"] = 120,["69"] = 121,["70"] = 122,["72"] = 115,["73"] = 132,["74"] = 132,["75"] = 132,["77"] = 134,["78"] = 135,["79"] = 135,["80"] = 135,["81"] = 135,["82"] = 132});
local ____exports = {}
____exports.default = __TS__Class()
local LangUtil = ____exports.default
LangUtil.name = "LangUtil"
function LangUtil.prototype.____constructor(self)
end
function LangUtil.getIntId(self, id)
    if id and type(id) == "string" then
        id = FourCC(id)
    end
    return id
end
function LangUtil.getStringId(self, id)
    if id and type(id) == "string" then
        return id
    end
    return id2string(id)
end
function LangUtil.isNumber(self, obj)
    if type(obj) == "number" then
        return true
    end
end
function LangUtil.isString(self, obj)
    if type(obj) == "string" then
        return true
    end
end
function LangUtil.isBoolean(self, obj)
    if type(obj) == "boolean" then
        return true
    end
end
function LangUtil.isFunction(self, obj)
    if type(obj) == "function" then
        return true
    end
end
function LangUtil.isObject(self, obj)
    if type(obj) == "table" then
        return true
    end
end
function LangUtil.removeSetElement(self, set, ele)
    for key in pairs(set) do
        if set[key] == ele then
            deleteKey(set, key)
            return true
        end
    end
    return false
end
function LangUtil.forEach(self, set, callback)
    for key in pairs(set) do
        callback(nil, key, set[key])
    end
end
function LangUtil.forEachSort(self, set, callback)
    local keys = {}
    for key in pairs(set) do
        keys[#keys + 1] = key
    end
    __TS__ArraySort(keys)
    for ____, key in ipairs(keys) do
        callback(nil, key, set[key])
    end
end
function LangUtil.toFixed(self, num, fractionDigits)
    if fractionDigits == nil then
        fractionDigits = 3
    end
    local stringTs = string
    return stringTs.format(
        ("%." .. tostring(fractionDigits)) .. "f",
        num
    )
end
return ____exports
