local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 5,["10"] = 7,["11"] = 8,["12"] = 12,["13"] = 12,["14"] = 12,["16"] = 12,["17"] = 16,["18"] = 18,["19"] = 19,["20"] = 20,["22"] = 21,["23"] = 21,["24"] = 22,["25"] = 23,["28"] = 26,["29"] = 27,["30"] = 21,["34"] = 29,["35"] = 29,["36"] = 30,["37"] = 29,["40"] = 32,["41"] = 33,["43"] = 35,["44"] = 36,["46"] = 38,["47"] = 19,["48"] = 56,["49"] = 57,["50"] = 57,["51"] = 57,["52"] = 58,["53"] = 60,["54"] = 61,["56"] = 63,["57"] = 57,["58"] = 57,["59"] = 65,["60"] = 56,["61"] = 16,["62"] = 83,["63"] = 84,["64"] = 83,["65"] = 94,["66"] = 95,["67"] = 97,["68"] = 98,["69"] = 99,["70"] = 98,["71"] = 101,["73"] = 102,["74"] = 102,["75"] = 103,["76"] = 104,["79"] = 107,["80"] = 108,["81"] = 102,["85"] = 110,["86"] = 110,["87"] = 111,["88"] = 112,["89"] = 113,["90"] = 110,["93"] = 116,["94"] = 94,["95"] = 125,["96"] = 135,["97"] = 136,["98"] = 135,["99"] = 140,["100"] = 141,["101"] = 140,["102"] = 145,["103"] = 146,["104"] = 145,["105"] = 150,["106"] = 151,["107"] = 150,["108"] = 155,["109"] = 156,["110"] = 155,["111"] = 125,["112"] = 14});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local CJ = require("jass.common")
local deg = CJ.Rad2Deg(1)
local rad = CJ.Deg2Rad(1)
____exports.default = __TS__Class()
local SolveLuaAsyn = ____exports.default
SolveLuaAsyn.name = "SolveLuaAsyn"
function SolveLuaAsyn.prototype.____constructor(self)
end
function SolveLuaAsyn.init()
    _G.ForGroup = ____exports.default.ForGroup
    _G.GroupPickRandomUnit = function(whichGroup)
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
                i = i + 1
            end
        end
        if #unitArray == 0 then
            return nil
        end
        if #unitArray == 1 then
            return unitArray[1]
        end
        return unitArray[GetRandomInt(0, #unitArray - 1) + 1]
    end
    _G.SyncSelections = function()
        ____exports.default.cache:get(
            "runtime_sleep_true",
            function()
                if require("jass.runtime").sleep == false then
                    print("你正在使用一个不推荐的函数:SyncSelections;请使用同步函数或其他方式实现要做的功能; 或手动将require(\"jass.runtime\").sleep = true置顶 以正常使用此函数")
                    log.errorWithTraceBack("你正在使用一个不推荐的函数 SyncSelections")
                end
                return true
            end
        )
        CJ.SyncSelections()
    end
end
function SolveLuaAsyn.TimerStart(whichTimer, timeout, periodic, handlerFunc)
    CJ.TimerStart(whichTimer, timeout, periodic, handlerFunc)
end
function SolveLuaAsyn.ForGroup(whichGroup, callback)
    local unitHandle = nil
    local oldGetEnumUnit = GetEnumUnit
    _G.GetEnumUnit = function()
        return unitHandle
    end
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
            unitHandle = unitArray[i + 1]
            callback()
            i = i + 1
        end
    end
    _G.GetEnumUnit = oldGetEnumUnit
end
function SolveLuaAsyn.SolveMathAsyn()
    math.sin = function(r)
        return CJ.Sin(r * rad)
    end
    math.cos = function(r)
        return CJ.Cos(r * rad)
    end
    math.tan = function(r)
        return CJ.Tan(r * rad)
    end
    math.asin = function(v)
        return CJ.Asin(v) * deg
    end
    math.acos = function(v)
        return CJ.Acos(v) * deg
    end
end
SolveLuaAsyn.cache = __TS__New(Cache)
return ____exports
