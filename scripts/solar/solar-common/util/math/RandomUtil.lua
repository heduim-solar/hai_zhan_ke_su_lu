local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 2,["11"] = 2,["12"] = 10,["13"] = 11,["14"] = 10,["15"] = 19,["16"] = 20,["17"] = 19,["18"] = 29,["19"] = 30,["20"] = 31,["21"] = 29,["22"] = 39,["23"] = 40,["24"] = 39,["25"] = 48,["26"] = 49,["27"] = 48,["28"] = 60,["29"] = 61,["31"] = 62,["32"] = 62,["33"] = 63,["35"] = 63,["37"] = 63,["38"] = 63,["39"] = 63,["41"] = 63,["42"] = 64,["43"] = 62,["46"] = 66,["47"] = 67,["48"] = 68,["49"] = 69,["51"] = 71,["52"] = 72,["53"] = 73,["55"] = 75,["56"] = 60,["57"] = 85,["58"] = 88,["60"] = 89,["61"] = 89,["62"] = 90,["63"] = 91,["64"] = 92,["66"] = 94,["69"] = 89,["72"] = 98,["73"] = 99,["74"] = 100,["76"] = 102,["77"] = 85,["78"] = 111,["79"] = 111,["80"] = 112,["81"] = 113,["82"] = 114,["83"] = 115,["86"] = 118,["87"] = 119,["88"] = 120,["89"] = 121,["90"] = 122,["91"] = 123,["95"] = 127,["96"] = 111,["97"] = 137,["98"] = 138,["99"] = 137,["100"] = 144,["101"] = 145,["102"] = 144,["103"] = 152,["104"] = 153,["105"] = 152,["106"] = 160,["107"] = 161,["108"] = 160,["109"] = 3});
local ____exports = {}
____exports.default = __TS__Class()
local RandomUtil = ____exports.default
RandomUtil.name = "RandomUtil"
function RandomUtil.prototype.____constructor(self)
end
function RandomUtil.nextInt(min, max)
    return GetRandomInt(min, max)
end
function RandomUtil.nextReal(min, max)
    return GetRandomReal(min, max)
end
function RandomUtil.nextLocal()
    ____exports.default._SL_seed_local = 314159269 * ____exports.default._SL_seed_local + 453806245
    return ____exports.default._SL_seed_local / 2147483648
end
function RandomUtil.nextLocalInt(min, max)
    return math.floor(____exports.default.nextLocalReal(min, max) + 0.5)
end
function RandomUtil.nextLocalReal(min, max)
    return ____exports.default.nextLocal() % (max - min) + min
end
function RandomUtil.getRandomElementByObjArrays(needkeyCount, weightKey, objArray)
    local indexAndWeight = {}
    do
        local i = 0
        while i < #objArray do
            local ____opt_0 = objArray[i + 1]
            if ____opt_0 ~= nil then
                ____opt_0 = ____opt_0[weightKey]
            end
            local ____opt_0_2 = ____opt_0
            if ____opt_0_2 == nil then
                ____opt_0_2 = 0
            end
            local weight = ____opt_0_2
            indexAndWeight[i] = weight
            i = i + 1
        end
    end
    local keys = ____exports.default.getRandomKeysByWeight(needkeyCount, indexAndWeight)
    local result = {}
    for ____, key in ipairs(keys) do
        result[#result + 1] = objArray[key + 1]
    end
    if #result < needkeyCount then
        print("getRandomElementByObjArrays: 没有找到足够的元素")
        return result
    end
    return result
end
function RandomUtil.getRandomKeysByWeight(needkeyCount, ...)
    local result = {}
    do
        local i = 0
        while i < 1000000 do
            local one = ____exports.default.getRandomKeyByWeight(...)
            if not __TS__ArrayIncludes(result, one) then
                result[#result + 1] = one
            end
            if #result >= needkeyCount then
                break
            end
            i = i + 1
        end
    end
    if #result < needkeyCount then
        print("getRandomKeysByWeight: 没有找到足够的元素")
        return result
    end
    return result
end
function RandomUtil.getRandomKeyByWeight(...)
    local objAndWeights = {...}
    local max = 0
    for ____, objAndWeight in ipairs(objAndWeights) do
        for objAndWeightKey in pairs(objAndWeight) do
            max = max + objAndWeight[objAndWeightKey]
        end
    end
    local ri = ____exports.default.nextReal(0, max)
    for ____, objAndWeight in ipairs(objAndWeights) do
        for objAndWeightKey in pairs(objAndWeight) do
            ri = ri - objAndWeight[objAndWeightKey]
            if ri <= 0 then
                return objAndWeightKey
            end
        end
    end
    return nil
end
function RandomUtil.isInChance(chance)
    return GetRandomReal(0, 1) < chance
end
function RandomUtil.randomAngle()
    return GetRandomReal(0, 360)
end
function RandomUtil.randomPercent()
    return GetRandomReal(0, 1)
end
function RandomUtil.randomBool()
    return GetRandomInt(0, 100) < 50
end
RandomUtil._SL_seed_local = 314159269 * os.time() * math.floor(os.clock() * 1000) + 453806245
return ____exports
