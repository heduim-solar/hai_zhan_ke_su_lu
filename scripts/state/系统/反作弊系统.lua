local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["15"] = 11,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 12,["20"] = 13,["21"] = 14,["23"] = 17,["24"] = 18,["25"] = 19,["27"] = 11,["28"] = 9,["29"] = 6});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
____exports.default = __TS__Class()
local _____53CD_4F5C_5F0A_7CFB_7EDF = ____exports.default
_____53CD_4F5C_5F0A_7CFB_7EDF.name = "反作弊系统"
function _____53CD_4F5C_5F0A_7CFB_7EDF.prototype.____constructor(self)
    PlayerUtil:forUsers(function(____, player)
        if __TS__ArrayIncludes(
            ____exports.default.banPlayerNames,
            GetPlayerName(player)
        ) then
            RemovePlayer(player, PLAYER_GAME_RESULT_DEFEAT)
            BJDebugMsg("|cffff0000【反作弊系统1】移除玩家:" .. GetPlayerName(player))
        end
        if PlatUtil:getStoreInt(player, "znjifen") > 9999 then
            RemovePlayer(player, PLAYER_GAME_RESULT_DEFEAT)
            BJDebugMsg("|cffff0000【反作弊系统2】移除玩家:" .. GetPlayerName(player))
        end
    end)
end
_____53CD_4F5C_5F0A_7CFB_7EDF.banPlayerNames = {"塔防菜鸟", "脾气", "Symbolism"}
return ____exports
