local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 3,["14"] = 24,["15"] = 25,["17"] = 26,["18"] = 26,["19"] = 27,["20"] = 28,["23"] = 31,["24"] = 32,["25"] = 26,["28"] = 34,["29"] = 24,["30"] = 42,["32"] = 43,["33"] = 43,["34"] = 44,["35"] = 45,["38"] = 48,["39"] = 49,["40"] = 43,["43"] = 42,["44"] = 58,["45"] = 59,["47"] = 60,["48"] = 60,["49"] = 61,["50"] = 62,["53"] = 65,["54"] = 66,["55"] = 60,["59"] = 68,["60"] = 68,["61"] = 69,["62"] = 70,["63"] = 68,["66"] = 58,["67"] = 8,["68"] = 8,["69"] = 8,["70"] = 9,["71"] = 10,["72"] = 11,["74"] = 13,["75"] = 8,["76"] = 14,["77"] = 15,["78"] = 8,["79"] = 8});
local ____exports = {}
local ____ObjectPool = require("solar.solar-common.tool.ObjectPool")
local ObjectPool = ____ObjectPool.default
____exports.default = __TS__Class()
local GroupUtil = ____exports.default
GroupUtil.name = "GroupUtil"
function GroupUtil.prototype.____constructor(self)
end
function GroupUtil.toArray(self, whichGroup)
    local unitArray = {}
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(whichGroup)
            if not IsHandle(unitHandle) then
                break
            end
            unitArray[#unitArray + 1] = unitHandle
            GroupRemoveUnit(whichGroup, unitHandle)
            i = i + 1
        end
    end
    return unitArray
end
GroupUtil["for"] = function(self, whichGroup, callback)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(whichGroup)
            if not IsHandle(unitHandle) then
                break
            end
            callback(nil, unitHandle)
            GroupRemoveUnit(whichGroup, unitHandle)
            i = i + 1
        end
    end
end
function GroupUtil.forSL(self, whichGroup, callback)
    local unitArray = {}
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(whichGroup)
            if not IsHandle(unitHandle) then
                break
            end
            unitArray[#unitArray + 1] = unitHandle
            GroupRemoveUnit(whichGroup, unitHandle)
            i = i + 1
        end
    end
    do
        local i = 0
        while i < #unitArray do
            GroupAddUnit(whichGroup, unitArray[i + 1])
            callback(nil, unitArray[i + 1])
            i = i + 1
        end
    end
end
GroupUtil.groupObjectPool = __TS__New(
    ObjectPool,
    function()
        if isAsync then
            log.errorWithTraceBack("不能在异步操作中创建handle!")
            return nil
        end
        return CreateGroup()
    end,
    function(____, g)
        GroupClear(g)
    end
)
return ____exports
