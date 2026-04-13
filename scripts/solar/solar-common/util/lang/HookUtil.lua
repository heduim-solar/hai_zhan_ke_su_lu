local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 3,["10"] = 3,["11"] = 3,["13"] = 3,["14"] = 9,["15"] = 10,["16"] = 10,["17"] = 10,["18"] = 11,["19"] = 12,["20"] = 13,["21"] = 14,["22"] = 15,["24"] = 17,["25"] = 13,["26"] = 19,["27"] = 10,["28"] = 10,["29"] = 21,["30"] = 9,["31"] = 25,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 29,["38"] = 30,["39"] = 31,["41"] = 33,["42"] = 29,["43"] = 35,["44"] = 26,["45"] = 26,["46"] = 37,["47"] = 25,["48"] = 40,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 42,["53"] = 43,["54"] = 44,["55"] = 45,["56"] = 46,["58"] = 48,["59"] = 44,["60"] = 50,["61"] = 41,["62"] = 41,["63"] = 52,["64"] = 40,["65"] = 55,["66"] = 56,["67"] = 56,["68"] = 56,["69"] = 57,["70"] = 58,["71"] = 59,["72"] = 60,["73"] = 61,["75"] = 63,["76"] = 59,["77"] = 65,["78"] = 56,["79"] = 56,["80"] = 67,["81"] = 55,["82"] = 72,["83"] = 73,["84"] = 74,["85"] = 75,["86"] = 76,["87"] = 73,["88"] = 72,["89"] = 81,["90"] = 82,["91"] = 83,["92"] = 84,["93"] = 82,["94"] = 81,["95"] = 89,["96"] = 90,["97"] = 91,["98"] = 92,["99"] = 93,["100"] = 90,["101"] = 89,["102"] = 5});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
____exports.default = __TS__Class()
local HookUtil = ____exports.default
HookUtil.name = "HookUtil"
function HookUtil.prototype.____constructor(self)
end
function HookUtil.onAdjustPlayerStateBJ(self, listener)
    local listeners = ____exports.default.cache:get(
        "onAdjustPlayerStateBJ",
        function()
            local callbacks = {}
            local oldCallback = AdjustPlayerStateBJ
            _G.AdjustPlayerStateBJ = function(delta, whichPlayer, whichPlayerState)
                for ____, callback in ipairs(callbacks) do
                    callback(delta, whichPlayer, whichPlayerState)
                end
                return oldCallback(delta, whichPlayer, whichPlayerState)
            end
            return callbacks
        end
    )
    listeners[#listeners + 1] = listener
end
function HookUtil.onAddPlayerTechResearched(self, listener)
    local listeners = ____exports.default.cache:get(
        "onAddPlayerTechResearched",
        function()
            local callbacks = {}
            local oldCallback = AddPlayerTechResearched
            _G.AddPlayerTechResearched = function(whichPlayer, techid, levels)
                for ____, callback in ipairs(callbacks) do
                    callback(whichPlayer, techid, levels)
                end
                return oldCallback(whichPlayer, techid, levels)
            end
            return callbacks
        end
    )
    listeners[#listeners + 1] = listener
end
function HookUtil.onUnitAddAbility(self, listener)
    local cs = ____exports.default.cache:get(
        "onUnitAddAbility",
        function()
            local cst = {}
            local old = UnitAddAbility
            _G.UnitAddAbility = function(whichUnit, abilityid)
                for ____, c in ipairs(cst) do
                    c(whichUnit, abilityid)
                end
                return old(whichUnit, abilityid)
            end
            return cst
        end
    )
    cs[#cs + 1] = listener
end
function HookUtil.onUnitRemoveAbility(self, listener)
    local cs = ____exports.default.cache:get(
        "onUnitRemoveAbility",
        function()
            local cst = {}
            local old = UnitRemoveAbility
            _G.UnitRemoveAbility = function(whichUnit, abilityid)
                for ____, c in ipairs(cst) do
                    c(whichUnit, abilityid)
                end
                return old(whichUnit, abilityid)
            end
            return cst
        end
    )
    cs[#cs + 1] = listener
end
function HookUtil.hookArguments(self, oldFunc, newFunc)
    return function(____, ...)
        local val = oldFunc(nil, ...)
        newFunc(nil, ...)
        return val
    end
end
function HookUtil.hookArgumentsBefore(self, oldFunc, newFunc)
    return function(____, ...)
        newFunc(nil, ...)
        return oldFunc(nil, ...)
    end
end
function HookUtil.hookResult(self, hookFunc, passFunc)
    return function(____, ...)
        local value = hookFunc(nil, ...)
        passFunc(nil, value)
        return value
    end
end
HookUtil.cache = __TS__New(Cache)
return ____exports
