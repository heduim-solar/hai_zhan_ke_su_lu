local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 6,["7"] = 6,["8"] = 6,["10"] = 6,["11"] = 18,["12"] = 18,["13"] = 18,["15"] = 19,["16"] = 20,["17"] = 21,["18"] = 22,["19"] = 23,["21"] = 25,["23"] = 27,["24"] = 28,["25"] = 18,["26"] = 32,["27"] = 33,["30"] = 36,["31"] = 37,["32"] = 38,["33"] = 39,["34"] = 41,["35"] = 42,["36"] = 43,["37"] = 43,["38"] = 43,["39"] = 44,["40"] = 44,["41"] = 43,["42"] = 43,["43"] = 47,["44"] = 48,["45"] = 49,["46"] = 51,["47"] = 52,["48"] = 32,["49"] = 58,["50"] = 60,["52"] = 61,["53"] = 61,["54"] = 62,["55"] = 62,["56"] = 62,["57"] = 62,["58"] = 62,["60"] = 63,["61"] = 63,["62"] = 64,["63"] = 65,["66"] = 68,["67"] = 69,["68"] = 63,["71"] = 61,["74"] = 72,["75"] = 73,["76"] = 58,["77"] = 7,["78"] = 8,["79"] = 9,["80"] = 10});
local ____exports = {}
____exports.default = __TS__Class()
local GameCenter = ____exports.default
GameCenter.name = "GameCenter"
function GameCenter.prototype.____constructor(self)
end
function GameCenter.getAllUnits(self, realTime)
    if realTime == nil then
        realTime = false
    end
    if ____exports.default._sl_isInit then
        if ____exports.default._sl_last_updateTime ~= time then
            ____exports.default.updateAllUnits()
        elseif realTime then
            ____exports.default.updateAllUnits()
        end
        return ____exports.default._sl_allUnits
    end
    ____exports.default:checkInit()
    return ____exports.default._sl_allUnits
end
function GameCenter.checkInit(self)
    if ____exports.default._sl_isInit then
        return
    end
    ____exports.default._sl_tempGroup = CreateGroup()
    local t = CreateTrigger()
    local r = CreateRegion()
    local world = GetWorldBounds()
    RegionAddRect(r, world)
    TriggerRegisterEnterRegion(t, r, nil)
    TriggerAddAction(
        t,
        function()
            local ____exports_default__sl_allUnits_0 = ____exports.default._sl_allUnits
            ____exports_default__sl_allUnits_0[#____exports_default__sl_allUnits_0 + 1] = GetTriggerUnit()
        end
    )
    local t2 = CreateTrigger()
    TriggerRegisterTimerEvent(t2, 1.97, true)
    TriggerAddAction(t2, ____exports.default.updateAllUnits)
    ____exports.default.updateAllUnits()
    ____exports.default._sl_isInit = true
end
function GameCenter.updateAllUnits()
    local allUnits = {}
    do
        local id = 0
        while id < 16 do
            GroupEnumUnitsOfPlayer(
                ____exports.default._sl_tempGroup,
                Player(id),
                nil
            )
            do
                local i = 0
                while i <= 1000000 do
                    local h = FirstOfGroup(____exports.default._sl_tempGroup)
                    if h == 0 or h == nil then
                        break
                    end
                    allUnits[#allUnits + 1] = h
                    GroupRemoveUnit(____exports.default._sl_tempGroup, h)
                    i = i + 1
                end
            end
            id = id + 1
        end
    end
    ____exports.default._sl_allUnits = allUnits
    ____exports.default._sl_last_updateTime = time
end
GameCenter._sl_isInit = false
GameCenter._sl_allUnits = {}
GameCenter._sl_tempGroup = nil
GameCenter._sl_last_updateTime = 0
return ____exports
