local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 5,["17"] = 8,["18"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["23"] = 12,["24"] = 19,["25"] = 8,["26"] = 23,["27"] = 23,["29"] = 25,["30"] = 25,["31"] = 26,["32"] = 27,["33"] = 27,["34"] = 27,["35"] = 28,["36"] = 27,["37"] = 27,["38"] = 25,["41"] = 23});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
____exports.default = __TS__Class()
local _____6D77_57DF_5DE5_5177 = ____exports.default
_____6D77_57DF_5DE5_5177.name = "海域工具"
function _____6D77_57DF_5DE5_5177.prototype.____constructor(self)
end
_____6D77_57DF_5DE5_5177["增加玩家探索积分"] = function(self, addNum)
    PlayerUtil:forUsers(function(____, player)
        local flag = PlatUtil:addStoreInt(player, "Itsjf", addNum)
        if flag == false then
            PlayerUtil:message("|cffffff00【存档规则提示】每局探索积分最多300！每天探索积分最多3000。超过会保存失败！", 10, player)
        end
    end)
    PlayerUtil:message("|cff00ff00【存档】获得探索积分+" .. tostring(addNum))
end
_____6D77_57DF_5DE5_5177["提示聊天信息"] = function(self, ...)
    local msgs = {...}
    do
        local i = 0
        while i < #msgs do
            local msg = msgs[i + 1]
            BaseUtil.runLater(
                i + 1,
                function()
                    PlayerUtil:message(msg, 20)
                end
            )
            i = i + 1
        end
    end
end
return ____exports
