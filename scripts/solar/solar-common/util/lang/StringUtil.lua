local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 8,["12"] = 9,["13"] = 10,["15"] = 12,["16"] = 8,["17"] = 19,["18"] = 20,["19"] = 19,["20"] = 28,["21"] = 28,["22"] = 28,["24"] = 29,["25"] = 30,["26"] = 30,["27"] = 30,["28"] = 30,["29"] = 31,["30"] = 28,["31"] = 37,["32"] = 38,["33"] = 39,["34"] = 37,["35"] = 43,["36"] = 44,["37"] = 44,["39"] = 45,["40"] = 46,["41"] = 47,["42"] = 48,["43"] = 49,["44"] = 50,["46"] = 52,["48"] = 43,["49"] = 57,["50"] = 58,["51"] = 59,["52"] = 60,["53"] = 61,["54"] = 62,["55"] = 63,["57"] = 65,["58"] = 57,["59"] = 69,["60"] = 70,["61"] = 71,["62"] = 72,["63"] = 73,["64"] = 74,["65"] = 75,["66"] = 76,["67"] = 77,["68"] = 78,["69"] = 79,["70"] = 80,["71"] = 81,["74"] = 84,["75"] = 85,["76"] = 86,["77"] = 87,["79"] = 89,["80"] = 69,["81"] = 93,["82"] = 94,["83"] = 93});
local ____exports = {}
____exports.default = __TS__Class()
local StringUtil = ____exports.default
StringUtil.name = "StringUtil"
function StringUtil.prototype.____constructor(self)
end
function StringUtil.isEmpty(self, str)
    if str == nil or str == "" then
        return true
    end
    return false
end
function StringUtil.notEmpty(self, str)
    return not ____exports.default:isEmpty(str)
end
function StringUtil.prototype.toFixed(self, num, fractionDigits)
    if fractionDigits == nil then
        fractionDigits = 2
    end
    local stringTs = string
    local lm = stringTs.format(
        ("%." .. tostring(fractionDigits)) .. "f",
        num
    )
    return lm
end
function StringUtil.getBytes(self, char)
    local code = string.byte(char)
    return ____exports.default:getBytesByCode(code)
end
function StringUtil.getBytesByCode(self, code)
    if not code then
        return 0
    end
    if code > 240 then
        return 4
    elseif code > 225 then
        return 3
    elseif code > 192 then
        return 2
    else
        return 1
    end
end
function StringUtil.getLength(self, str)
    local length = 0
    local currentIndex = 1
    while currentIndex <= #str do
        local code = string.byte(str, currentIndex)
        currentIndex = currentIndex + ____exports.default:getBytesByCode(code)
        length = length + 1
    end
    return length
end
function StringUtil.subString(self, str, start, ____end)
    local tempStr = str
    local byteStart = 1
    local byteEnd = -1
    local index = 0
    local bytes = 0
    start = math.max(start, 1)
    ____end = ____end or -1
    while #tempStr > 0 do
        if index == start - 1 then
            byteStart = bytes + 1
        elseif index == ____end then
            byteEnd = bytes
            break
        end
        local code = string.byte(tempStr)
        bytes = bytes + ____exports.default:getBytesByCode(code)
        tempStr = string.sub(str, bytes + 1)
        index = index + 1
    end
    return string.sub(str, byteStart, byteEnd)
end
function StringUtil.getCharAtIndex(self, str, index)
    return ____exports.default:subString(str, index, index)
end
return ____exports
