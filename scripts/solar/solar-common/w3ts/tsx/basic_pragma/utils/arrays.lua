local ____lualib = require("lualib_bundle")
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayReduce = ____lualib.__TS__ArrayReduce
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 7,["15"] = 8,["17"] = 9,["18"] = 5,["19"] = 5,["20"] = 3,["22"] = 16,["23"] = 17,["24"] = 18,["26"] = 19,["27"] = 19,["28"] = 20,["29"] = 21,["30"] = 21,["32"] = 19,["35"] = 23,["36"] = 16,["37"] = 26,["38"] = 30,["40"] = 32,["41"] = 32,["42"] = 32,["43"] = 32,["46"] = 26});
local ____exports = {}
local ____common = require("solar.solar-common.w3ts.tsx.basic_pragma.common")
local isLua = ____common.isLua
____exports.getLength = function(____, arr) return isLua and __TS__ArrayReduce(
    __TS__ObjectKeys(arr),
    function(____, max, key)
        local keyAsNumber = __TS__ParseInt(key)
        if type(keyAsNumber) == "number" then
            return max > keyAsNumber and max or keyAsNumber
        end
        return max
    end,
    0
) or #arr end
--- Removes nils from the array
____exports.compact = function(____, arr)
    local length = ____exports.getLength(nil, arr)
    local newArr = {}
    do
        local i = 0
        while i < length do
            local val = arr[i + 1]
            if val ~= nil then
                newArr[#newArr + 1] = val
            end
            i = i + 1
        end
    end
    return newArr
end
____exports.forEach = function(____, arr, fn)
    local length = ____exports.getLength(nil, arr)
    do
        local i = 0
        while i < length do
            fn(nil, arr[i + 1], i)
            i = i + 1
        end
    end
end
return ____exports
