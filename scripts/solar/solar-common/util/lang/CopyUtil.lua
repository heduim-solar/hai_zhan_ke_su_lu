local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local Map = ____lualib.Map
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local __TS__Iterator = ____lualib.__TS__Iterator
local Set = ____lualib.Set
local __TS__TypeOf = ____lualib.__TS__TypeOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 6,["14"] = 6,["15"] = 6,["17"] = 6,["18"] = 9,["19"] = 10,["20"] = 11,["21"] = 12,["23"] = 14,["24"] = 9,["25"] = 18,["26"] = 18,["27"] = 18,["29"] = 19,["30"] = 20,["31"] = 20,["34"] = 21,["35"] = 45,["36"] = 22,["38"] = 23,["39"] = 24,["40"] = 25,["41"] = 25,["42"] = 25,["43"] = 26,["44"] = 26,["45"] = 26,["46"] = 26,["48"] = 28,["50"] = 30,["51"] = 31,["52"] = 32,["53"] = 33,["55"] = 35,["57"] = 37,["58"] = 38,["60"] = 39,["61"] = 39,["62"] = 40,["63"] = 39,["66"] = 42,["68"] = 45,["69"] = 46,["70"] = 47,["72"] = 49,["74"] = 50,["76"] = 51,["78"] = 52,["80"] = 53,["82"] = 54,["84"] = 55,["87"] = 57,["90"] = 18});
local ____exports = {}
____exports.default = __TS__Class()
local CopyUtil = ____exports.default
CopyUtil.name = "CopyUtil"
function CopyUtil.prototype.____constructor(self)
end
function CopyUtil.shallowCopy(self, obj)
    local newObj = {}
    for ____, key in ipairs(__TS__ObjectKeys(obj)) do
        newObj[key] = obj[key]
    end
    return newObj
end
function CopyUtil.deepCopy(self, obj, maxDeep)
    if maxDeep == nil then
        maxDeep = 10
    end
    assert(maxDeep >= 0, self.name)
    if not obj then
        return obj
    end
    repeat
        local ____switch8 = __TS__TypeOf(obj)
        local object
        local ____cond8 = ____switch8 == "object"
        if ____cond8 then
            if __TS__InstanceOf(obj, Map) then
                local map = __TS__New(Map)
                for ____, ____value in __TS__Iterator(obj) do
                    local _key = ____value[1]
                    local _value = ____value[2]
                    map:set(
                        _key,
                        self:deepCopy(_value, maxDeep - 1)
                    )
                end
                return map
            end
            if __TS__InstanceOf(obj, Set) then
                local set = __TS__New(Set)
                for ____, valueElement in __TS__Iterator(obj) do
                    set:add(self:deepCopy(valueElement, maxDeep - 1))
                end
                return set
            end
            if __TS__InstanceOf(obj, Array) then
                local array = Array(nil, #obj)
                do
                    local i = 0
                    while i < #obj do
                        array[i + 1] = self:deepCopy(obj[i + 1], maxDeep - 1)
                        i = i + 1
                    end
                end
                return array
            end
            object = {}
            for ____, key in ipairs(__TS__ObjectKeys(obj)) do
                object[key] = self:deepCopy(obj[key], maxDeep - 1)
            end
            return object
        end
        ____cond8 = ____cond8 or ____switch8 == "function"
        if ____cond8 then
            return nil
        end
        ____cond8 = ____cond8 or ____switch8 == "bigint"
        if ____cond8 then
            return nil
        end
        ____cond8 = ____cond8 or ____switch8 == "symbol"
        if ____cond8 then
            return nil
        end
        do
            return obj
        end
    until true
end
return ____exports
