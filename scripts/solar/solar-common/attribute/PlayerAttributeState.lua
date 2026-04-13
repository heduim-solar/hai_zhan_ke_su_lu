local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 32,["28"] = 32,["29"] = 32,["31"] = 33,["32"] = 34,["35"] = 40,["36"] = 41,["37"] = 43,["38"] = 41,["40"] = 47,["41"] = 48,["42"] = 48,["43"] = 48,["44"] = 49,["45"] = 51,["46"] = 53,["47"] = 54,["48"] = 55,["49"] = 54,["50"] = 58,["51"] = 59,["52"] = 60,["53"] = 61,["54"] = 62,["57"] = 65,["60"] = 68,["61"] = 68,["62"] = 68,["63"] = 70,["64"] = 71,["66"] = 68,["67"] = 68,["68"] = 58,["69"] = 75,["70"] = 75,["71"] = 75,["72"] = 76,["73"] = 75,["74"] = 75,["75"] = 78,["76"] = 78,["77"] = 78,["78"] = 79,["79"] = 78,["80"] = 78,["81"] = 48,["82"] = 48,["83"] = 32,["84"] = 28,["85"] = 29,["86"] = 29,["87"] = 28,["88"] = 85,["90"] = 86,["91"] = 86,["92"] = 87,["93"] = 89,["94"] = 90,["95"] = 91,["97"] = 86,["100"] = 85,["101"] = 96,["102"] = 97,["103"] = 98,["104"] = 99,["107"] = 102,["108"] = 96,["109"] = 110,["110"] = 111,["113"] = 115,["114"] = 115,["115"] = 116,["118"] = 119,["119"] = 115,["120"] = 115,["121"] = 115,["122"] = 110,["123"] = 125,["124"] = 126,["125"] = 126,["126"] = 129,["127"] = 130,["128"] = 131,["130"] = 134,["131"] = 135,["132"] = 138,["133"] = 140,["134"] = 125,["135"] = 19});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitAttributeState = require("solar.solar-common.attribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local PlayerAttributeState = ____exports.default
PlayerAttributeState.name = "PlayerAttributeState"
function PlayerAttributeState.prototype.____constructor(self, addBaseInheritHandler)
    if addBaseInheritHandler == nil then
        addBaseInheritHandler = true
    end
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new PlayerAttributeState()")
        return
    end
    if addBaseInheritHandler then
        ____exports.default:addInheritHandlers(function(____, unit)
            return IsUnitType(unit, UNIT_TYPE_HERO)
        end)
    end
    ____exports.default:refresh()
    BaseUtil.runLater(
        1,
        function()
            ____exports.default:refresh()
            local triggerTimer = __TS__New(Trigger)
            triggerTimer:registerTimerEvent(____exports.default.config.refreshInterval, true)
            triggerTimer:addAction(function()
                ____exports.default:refresh()
            end)
            se:onUnitEnterMapRect(function(e)
                local unit = e.trigUnit
                local player = GetOwningPlayer(unit)
                local playerAttribute = AttributeUtil:getPlayerAttribute(player, false)
                if not playerAttribute then
                    return
                end
                if not ____exports.default:checkInherit(unit) then
                    return
                end
                BaseUtil.runLater(
                    0.01,
                    function()
                        if UnitStateUtil:isAlive(unit) then
                            ____exports.default:refreshPlayerAtrr2UnitAtrr(unit, playerAttribute)
                        end
                    end
                )
            end)
            se:on(
                "属性刷新",
                function()
                    ____exports.default:refresh()
                end
            )
            se:on(
                "选择英雄",
                function()
                    ____exports.default:refresh()
                end
            )
        end
    )
end
function PlayerAttributeState.addInheritHandlers(self, inheritHandler)
    local ____exports_default_config_inheritHandlers_0 = ____exports.default.config.inheritHandlers
    ____exports_default_config_inheritHandlers_0[#____exports_default_config_inheritHandlers_0 + 1] = inheritHandler
end
function PlayerAttributeState.refresh(self)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                local playerAttribute = AttributeUtil:getPlayerAttribute(tempPlayer, false)
                ____exports.default:refreshPlayerAttributes2PlayerUnits(tempPlayer, playerAttribute)
            end
            i = i + 1
        end
    end
end
function PlayerAttributeState.checkInherit(self, unitHandle)
    for ____, inheritHandler in ipairs(____exports.default.config.inheritHandlers) do
        if inheritHandler(nil, unitHandle) then
            return true
        end
    end
    return false
end
function PlayerAttributeState.refreshPlayerAttributes2PlayerUnits(self, player, playerAttribute)
    if playerAttribute == nil then
        return
    end
    SelectUtil.forPlayerUnits(
        function(____, unitHandle)
            if not ____exports.default:checkInherit(unitHandle) then
                return
            end
            ____exports.default:refreshPlayerAtrr2UnitAtrr(unitHandle, playerAttribute)
        end,
        GetPlayerId(player)
    )
end
function PlayerAttributeState.refreshPlayerAtrr2UnitAtrr(self, unitHandle, playerAttribute)
    local ____opt_1 = DataBase:getUnitSolarData(unitHandle, false)
    local unitOldPlayerSAttr = ____opt_1 and ____opt_1._SL_inheritPSA
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    AttributeUtil:subtract(solarData._SL_solarAttribute, unitOldPlayerSAttr)
    AttributeUtil:add(solarData._SL_solarAttribute, playerAttribute)
    solarData._SL_inheritPSA = __TS__ObjectAssign({}, playerAttribute)
    UnitAttributeState:refreshUnitSolarAttribute(unitHandle)
end
PlayerAttributeState.config = {refreshInterval = 9.7, inheritHandlers = {}}
return ____exports
