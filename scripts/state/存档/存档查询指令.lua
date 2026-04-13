local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 9,["15"] = 9,["16"] = 9,["17"] = 10,["19"] = 11,["20"] = 11,["21"] = 12,["22"] = 12,["23"] = 12,["24"] = 12,["25"] = 11,["28"] = 14,["29"] = 9,["30"] = 9,["31"] = 7});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
____exports.default = __TS__Class()
local _____5B58_6863_67E5_8BE2_6307_4EE4 = ____exports.default
_____5B58_6863_67E5_8BE2_6307_4EE4.name = "存档查询指令"
function _____5B58_6863_67E5_8BE2_6307_4EE4.prototype.____constructor(self)
    se:onPlayerChat(
        "-cx",
        function(e, solarTrigger)
            local text = "当前通关积分为:"
            do
                local i = 1
                while i <= 9 do
                    text = ((((text .. "N") .. tostring(i)) .. ":") .. tostring(ArchiveUtil:get(
                        e.triggerPlayer,
                        "n" .. tostring(i)
                    ) or 0)) .. "  "
                    i = i + 1
                end
            end
            PlayerUtil:message(text)
        end
    )
end
return ____exports
