local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 22,["17"] = 22,["18"] = 22,["20"] = 32,["21"] = 33,["22"] = 33,["23"] = 33,["24"] = 34,["25"] = 35,["26"] = 35,["27"] = 36,["28"] = 37,["29"] = 38,["30"] = 39,["31"] = 40,["32"] = 41,["33"] = 42,["34"] = 35,["35"] = 35,["36"] = 35,["38"] = 33,["39"] = 33,["40"] = 48,["41"] = 49,["42"] = 50,["43"] = 51,["44"] = 52,["45"] = 53,["46"] = 54,["47"] = 55,["48"] = 56,["49"] = 58,["50"] = 58,["51"] = 58,["52"] = 59,["53"] = 59,["54"] = 59,["55"] = 59,["56"] = 59,["57"] = 59,["58"] = 59,["59"] = 60,["60"] = 61,["61"] = 62,["62"] = 63,["63"] = 64,["64"] = 65,["65"] = 66,["66"] = 58,["67"] = 58,["69"] = 48,["70"] = 31,["71"] = 23});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local _____602A_7269_6B7B_4EA1_65F6_5237_65B0_602A_7269 = ____exports.default
_____602A_7269_6B7B_4EA1_65F6_5237_65B0_602A_7269.name = "怪物死亡时刷新怪物"
function _____602A_7269_6B7B_4EA1_65F6_5237_65B0_602A_7269.prototype.____constructor(self)
    ____exports.default.config.playerIds = {GetPlayerId(PlayerUtil:neutralAggressivePlayer())}
    BaseUtil.runLater(
        ____exports.default.config.registrationTime,
        function()
            for ____, playerId in ipairs(____exports.default.config.playerIds) do
                SelectUtil.forPlayerUnits(
                    function(____, u)
                        local solarData = DataBase:getUnitSolarData(u, true)
                        solarData["_sl_怪物死亡时刷新怪物_pid"] = GetPlayerId(GetOwningPlayer(u))
                        solarData["_sl_怪物死亡时刷新怪物_type"] = GetUnitTypeId(u)
                        solarData["_sl_怪物死亡时刷新怪物_x"] = GetUnitX(u)
                        solarData["_sl_怪物死亡时刷新怪物_y"] = GetUnitY(u)
                        solarData["_sl_怪物死亡时刷新怪物_face"] = GetUnitFacing(u)
                        solarData["_sl_怪物死亡时刷新怪物_time"] = UnitUtil.isHero(u) and ____exports.default.config.heroTime or ____exports.default.config.baseTime
                    end,
                    playerId
                )
            end
        end
    )
    se:onUnitDeath(function(e)
        local solarData = DataBase:getUnitSolarData(e.trigUnit, false)
        if (solarData and solarData["_sl_怪物死亡时刷新怪物_x"]) ~= nil then
            local pid = solarData["_sl_怪物死亡时刷新怪物_pid"]
            local ____type = solarData["_sl_怪物死亡时刷新怪物_type"]
            local x = solarData["_sl_怪物死亡时刷新怪物_x"]
            local y = solarData["_sl_怪物死亡时刷新怪物_y"]
            local face = solarData["_sl_怪物死亡时刷新怪物_face"]
            local time = solarData["_sl_怪物死亡时刷新怪物_time"]
            BaseUtil.runLater(
                time,
                function()
                    local newUnit = CreateUnit(
                        Player(pid),
                        ____type,
                        x,
                        y,
                        face
                    )
                    local newUnitSolarData = DataBase:getUnitSolarData(newUnit, true)
                    newUnitSolarData["_sl_怪物死亡时刷新怪物_pid"] = pid
                    newUnitSolarData["_sl_怪物死亡时刷新怪物_type"] = ____type
                    newUnitSolarData["_sl_怪物死亡时刷新怪物_x"] = x
                    newUnitSolarData["_sl_怪物死亡时刷新怪物_y"] = y
                    newUnitSolarData["_sl_怪物死亡时刷新怪物_face"] = face
                    newUnitSolarData["_sl_怪物死亡时刷新怪物_time"] = time
                end
            )
        end
    end)
end
_____602A_7269_6B7B_4EA1_65F6_5237_65B0_602A_7269.config = {registrationTime = 0.5, playerIds = {10, 11}, baseTime = 60, heroTime = 60}
return ____exports
