local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 1,["12"] = 1,["13"] = 9,["14"] = 9,["15"] = 10,["16"] = 11,["18"] = 13,["19"] = 14,["21"] = 16,["22"] = 17,["23"] = 18,["25"] = 20,["26"] = 21,["28"] = 22,["29"] = 23,["31"] = 26,["33"] = 28,["34"] = 28,["35"] = 29,["36"] = 30,["39"] = 28,["42"] = 34,["43"] = 35,["48"] = 38,["49"] = 9,["50"] = 47,["51"] = 48,["52"] = 49,["53"] = 50,["55"] = 52,["56"] = 47,["57"] = 59,["58"] = 60,["59"] = 61,["61"] = 63,["62"] = 59,["63"] = 72,["65"] = 73,["66"] = 73,["67"] = 74,["68"] = 75,["69"] = 76,["70"] = 77,["71"] = 73,["74"] = 79,["75"] = 72,["76"] = 88,["77"] = 89,["78"] = 90,["80"] = 92,["81"] = 93,["82"] = 94,["83"] = 95,["85"] = 97,["86"] = 88,["87"] = 104,["88"] = 105,["91"] = 108,["92"] = 109,["94"] = 104});
local ____exports = {}
____exports.default = __TS__Class()
local ArrayUtil = ____exports.default
ArrayUtil.name = "ArrayUtil"
function ArrayUtil.prototype.____constructor(self)
end
function ArrayUtil.selectByWhere(self, dataArray, ...)
    local keyAndSelectVal = {...}
    if dataArray == nil or #dataArray == 0 then
        return dataArray
    end
    if keyAndSelectVal == nil or #keyAndSelectVal == 0 then
        return dataArray
    end
    if #keyAndSelectVal % 2 ~= 0 then
        log.errorWithTraceBack("查询参数和值必须成对传入!")
        return dataArray
    end
    local result = {}
    for ____, data in ipairs(dataArray) do
        do
            if data == nil then
                goto __continue7
            end
            local isOk = true
            do
                local i = 0
                while i < #keyAndSelectVal - 1 do
                    if data[keyAndSelectVal[i + 1]] ~= keyAndSelectVal[i + 1 + 1] then
                        isOk = false
                        break
                    end
                    i = i + 2
                end
            end
            if isOk then
                result[#result + 1] = data
            end
        end
        ::__continue7::
    end
    return result
end
function ArrayUtil.getPropertyVals(self, array, key)
    local result = {}
    for ____, arrayElement in ipairs(array) do
        result[#result + 1] = arrayElement[key]
    end
    return result
end
function ArrayUtil.randomElement(self, array)
    if array == nil or #array == 0 then
        return nil
    end
    return array[GetRandomInt(0, #array - 1) + 1]
end
function ArrayUtil.shuffle(self, array)
    do
        local i = #array - 1
        while i >= 0 do
            local randomIndex = math.floor(math.random() * (i + 1))
            local itemAtIndex = array[randomIndex + 1]
            array[randomIndex + 1] = array[i + 1]
            array[i + 1] = itemAtIndex
            i = i - 1
        end
    end
    return array
end
function ArrayUtil.removeElement(self, array, deleteElement)
    if array == nil or deleteElement == nil then
        return false
    end
    local indexOf = __TS__ArrayIndexOf(array, deleteElement)
    if indexOf >= 0 then
        __TS__ArraySplice(array, indexOf, 1)
        return true
    end
    return false
end
function ArrayUtil.clear(self, array)
    if array == nil then
        return
    end
    for key in pairs(array) do
        deleteKey(array, key)
    end
end
return ____exports
