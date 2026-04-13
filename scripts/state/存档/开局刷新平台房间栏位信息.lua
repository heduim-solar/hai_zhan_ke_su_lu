local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 15,["21"] = 15,["22"] = 15,["23"] = 16,["24"] = 17,["25"] = 16,["26"] = 15,["27"] = 15,["28"] = 13,["29"] = 22,["30"] = 23,["31"] = 25,["32"] = 26,["33"] = 27,["35"] = 32,["36"] = 32,["37"] = 32,["38"] = 32,["39"] = 32,["40"] = 34,["41"] = 34,["42"] = 34,["43"] = 34,["44"] = 34,["45"] = 36,["46"] = 36,["47"] = 36,["48"] = 36,["49"] = 36,["50"] = 22,["51"] = 8});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ForceUtil = require("solar.solar-common.util.game.ForceUtil")
local ForceUtil = ____ForceUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
____exports.default = __TS__Class()
local _____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F = ____exports.default
_____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F.name = "开局刷新平台房间栏位信息"
function _____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F.prototype.____constructor(self)
    BaseUtil.runLater(
        5,
        function()
            ForceUtil.forUserForce(function(____, player)
                ____exports.default:refresh(player)
            end)
        end
    )
end
function _____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F.refresh(self, p)
    local archive = ArchiveUtil:getAllArchive(p)
    local _mel = archive._mel or 0
    if _mel > 0 then
        DzAPI_Map_StoreInteger(p, "endless_level", _mel)
    end
    PlatUtil:setStat(
        p,
        "h1",
        tostring(PlatUtil:getStoreInt(p, "znjifen") or 0)
    )
    PlatUtil:setStat(
        p,
        "h2",
        tostring(archive.maxn or 0)
    )
    PlatUtil:setStat(
        p,
        "h3",
        TextUtil:toCnUnit(archive.maxzl or 0)
    )
end
_____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F.cfg = {}
return ____exports
