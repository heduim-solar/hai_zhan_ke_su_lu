local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__StringEndsWith = ____lualib.__TS__StringEndsWith
local __TS__StringReplaceAll = ____lualib.__TS__StringReplaceAll
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 13,["10"] = 13,["11"] = 13,["13"] = 13,["14"] = 26,["15"] = 26,["16"] = 26,["18"] = 26,["19"] = 26,["21"] = 27,["22"] = 28,["24"] = 29,["25"] = 30,["28"] = 33,["29"] = 34,["30"] = 29,["33"] = 36,["34"] = 37,["36"] = 39,["37"] = 40,["38"] = 41,["39"] = 42,["40"] = 43,["41"] = 44,["43"] = 46,["44"] = 47,["45"] = 48,["48"] = 51,["49"] = 26,["50"] = 59,["51"] = 59,["52"] = 59,["54"] = 60,["55"] = 61,["57"] = 63,["58"] = 64,["59"] = 65,["61"] = 67,["62"] = 68,["63"] = 69,["64"] = 70,["66"] = 72,["67"] = 59,["68"] = 80,["69"] = 81,["70"] = 82,["72"] = 84,["73"] = 85,["74"] = 86,["75"] = 86,["76"] = 86,["77"] = 86,["78"] = 86,["79"] = 87,["81"] = 89,["82"] = 90,["83"] = 90,["84"] = 90,["85"] = 90,["86"] = 90,["87"] = 91,["89"] = 93,["90"] = 94,["92"] = 80,["93"] = 98,["95"] = 99,["96"] = 99,["97"] = 100,["98"] = 99,["101"] = 102,["102"] = 98,["103"] = 105,["105"] = 106,["106"] = 106,["107"] = 107,["108"] = 106,["111"] = 109,["112"] = 105,["113"] = 14,["114"] = 16,["115"] = 16,["116"] = 16,["117"] = 16,["118"] = 16,["119"] = 16,["120"] = 16,["121"] = 16,["122"] = 16,["123"] = 14});
local ____exports = {}
____exports.default = __TS__Class()
local TextUtil = ____exports.default
TextUtil.name = "TextUtil"
function TextUtil.prototype.____constructor(self)
end
function TextUtil.toCnUnit(self, num, keepDecimalPoint, maxDigit)
    if keepDecimalPoint == nil then
        keepDecimalPoint = true
    end
    if maxDigit == nil then
        maxDigit = 4
    end
    local cnUnit = ""
    local index = 0
    do
        while index < #____exports.default.config.cnUnit do
            if math.abs(num) < 10000 then
                break
            end
            num = num / 10000
            cnUnit = ____exports.default.config.cnUnit[index + 1]
            index = index + 1
        end
    end
    if not keepDecimalPoint then
        num = math.floor(num)
    else
        local numStr = tostring(num) .. ""
        local indexOf = (string.find(numStr, ".", nil, true) or 0) - 1
        if indexOf < maxDigit then
            numStr = __TS__StringSubstring(numStr, 0, maxDigit + 1)
            if __TS__StringEndsWith(numStr, ".000") or __TS__StringEndsWith(numStr, ".00") or __TS__StringEndsWith(numStr, ".0") then
                numStr = __TS__StringSubstring(numStr, 0, indexOf)
            end
            return numStr .. cnUnit
        elseif indexOf == maxDigit then
            num = math.floor(num)
        end
    end
    return tostring(num) .. cnUnit
end
function TextUtil.toPercentage(self, num, decimalPrecision)
    if decimalPrecision == nil then
        decimalPrecision = 0
    end
    if num == nil then
        return "0%"
    end
    num = num * 100
    if decimalPrecision == 0 then
        return tostring(math.floor(num)) .. "%"
    end
    local percentageStr = tostring(num) .. ""
    local pointIndex = (string.find(percentageStr, ".", nil, true) or 0) - 1
    if pointIndex >= 0 and #percentageStr - pointIndex > decimalPrecision then
        return __TS__StringSubstring(percentageStr, 0, pointIndex + decimalPrecision + 1) .. "%"
    end
    return percentageStr .. "%"
end
function TextUtil.removeColors(self, value)
    if value == nil then
        return value
    else
        local color
        while (string.find(value, "|c", nil, true) or 0) - 1 >= 0 do
            color = __TS__StringSubstring(
                value,
                (string.find(value, "|c", nil, true) or 0) - 1,
                (string.find(value, "|c", nil, true) or 0) - 1 + 10
            )
            value = __TS__StringReplaceAll(value, color, "")
        end
        while (string.find(value, "|C", nil, true) or 0) - 1 >= 0 do
            color = __TS__StringSubstring(
                value,
                (string.find(value, "|C", nil, true) or 0) - 1,
                (string.find(value, "|C", nil, true) or 0) - 1 + 10
            )
            value = __TS__StringReplaceAll(value, color, "")
        end
        value = __TS__StringReplaceAll(value, "|r", "")
        return value
    end
end
function TextUtil.leftPad(self, value, totalLength, pad)
    do
        local i = totalLength - #value
        while i > 0 do
            value = pad .. value
            i = i - 1
        end
    end
    return value
end
function TextUtil.rightPad(self, value, totalLength, pad)
    do
        local i = totalLength - #value
        while i > 0 do
            value = value .. pad
            i = i - 1
        end
    end
    return value
end
TextUtil.config = {cnUnit = {
    "万",
    "亿",
    "兆",
    "京",
    "垓",
    "秭",
    "穰",
    "沟",
    "涧"
}}
return ____exports
