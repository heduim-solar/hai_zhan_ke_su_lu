local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 27,["36"] = 27,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 28,["43"] = 30,["46"] = 34,["47"] = 36,["48"] = 38,["49"] = 39,["51"] = 41,["52"] = 42,["53"] = 43,["56"] = 46,["57"] = 47,["58"] = 48,["61"] = 52,["62"] = 53,["63"] = 54,["64"] = 55,["65"] = 56,["66"] = 57,["69"] = 60,["70"] = 60,["71"] = 61,["72"] = 62,["73"] = 63,["75"] = 65,["76"] = 65,["77"] = 65,["78"] = 65,["79"] = 55,["80"] = 67,["81"] = 68,["82"] = 69,["84"] = 67,["85"] = 72,["86"] = 73,["88"] = 75,["89"] = 76,["90"] = 77,["92"] = 79,["93"] = 80,["94"] = 80,["95"] = 80,["96"] = 80,["98"] = 25,["99"] = 25,["100"] = 16,["101"] = 89,["102"] = 95,["103"] = 96,["104"] = 97,["105"] = 98,["106"] = 99,["107"] = 97,["109"] = 103,["110"] = 104,["111"] = 105,["112"] = 106,["113"] = 107,["114"] = 105,["116"] = 111,["117"] = 112,["118"] = 113,["119"] = 114,["120"] = 115,["121"] = 113,["123"] = 119,["124"] = 120,["125"] = 121,["126"] = 122,["127"] = 123,["128"] = 121,["130"] = 89,["131"] = 138,["132"] = 139,["133"] = 140,["134"] = 141,["135"] = 142,["136"] = 142,["137"] = 142,["138"] = 142,["139"] = 143,["140"] = 144,["141"] = 145,["142"] = 146,["143"] = 147,["144"] = 148,["146"] = 150,["147"] = 151,["149"] = 153,["150"] = 154,["151"] = 155,["152"] = 156,["153"] = 155,["154"] = 138});
local ____exports = {}
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local _____4E3B_70AE_5B58_6863A = require("xlsx.存档.主炮存档A")
local ____d__4E3B_70AE_5B58_6863A = _____4E3B_70AE_5B58_6863A["d_主炮存档A"]
local _____4E3B_70AE_5B58_6863B = require("xlsx.存档.主炮存档B")
local ____d__4E3B_70AE_5B58_6863B = _____4E3B_70AE_5B58_6863B["d_主炮存档B"]
local _____4E3B_70AE_5B58_6863C = require("xlsx.存档.主炮存档C")
local ____d__4E3B_70AE_5B58_6863C = _____4E3B_70AE_5B58_6863C["d_主炮存档C"]
local _____51FB_6740BOSS_88C5_5907_5B58_6863 = require("xlsx.存档.击杀BOSS装备存档")
local ____d__51FB_6740BOSS_88C5_5907_5B58_6863 = _____51FB_6740BOSS_88C5_5907_5B58_6863["d_击杀BOSS装备存档"]
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
local _____6D77_57DF_5DE5_5177 = require("state.深度海域.海域工具")
local _____6D77_57DF_5DE5_5177 = _____6D77_57DF_5DE5_5177.default
____exports.default = __TS__Class()
local _____5B58_6863_83B7_53D6 = ____exports.default
_____5B58_6863_83B7_53D6.name = "存档获取"
function _____5B58_6863_83B7_53D6.prototype.____constructor(self)
    se:on(
        "游戏胜利",
        function()
            ____exports.default["击杀BOSS装备存档"](
                ____exports.default,
                GetRandomInt(
                    1,
                    math.min(settings.gameDifficulty, 5)
                )
            )
            if _g_time < 600000 then
                PlayerUtil:message("通关时间小于10分钟！无法奖励主炮存档！")
                return
            end
            local chance = 0.01 * MapUtil:getRealNanduLevel()
            ____exports.default["获得主炮存档"](____exports.default)
            if RandomUtil.isInChance(chance) then
                ____exports.default["获得主炮存档"](____exports.default)
            end
            if chance > 0.1 then
                if RandomUtil.isInChance(chance) then
                    ____exports.default["获得主炮存档"](____exports.default)
                end
            end
            if chance > 0.2 then
                if RandomUtil.isInChance(chance) then
                    ____exports.default["获得主炮存档"](____exports.default)
                end
            end
            local _____603B_5B58_6863_6389_7387 = 0
            local _____6709_65B0_4EBA_73A9_5BB6 = false
            local maxMapLv = 1
            PlayerUtil:forUsers(function(____, player)
                local hero = PlayerUtil:getHero(player)
                if not IsHandle(hero) then
                    return
                end
                local ____opt_0 = AttributeUtil:getUnitAttribute(hero, false)
                local _____5B58_6863_6389_7387 = ____opt_0 and ____opt_0["存档掉率"] or 0
                _____603B_5B58_6863_6389_7387 = _____603B_5B58_6863_6389_7387 + _____5B58_6863_6389_7387
                if PlatUtil:getMapLevel(player) < 6 then
                    _____6709_65B0_4EBA_73A9_5BB6 = true
                end
                maxMapLv = math.max(
                    maxMapLv,
                    PlatUtil:getMapLevel(player)
                )
            end)
            PlayerUtil:forUsers(function(____, player)
                if maxMapLv - PlatUtil:getMapLevel(player) > 5 then
                    _____6709_65B0_4EBA_73A9_5BB6 = true
                end
            end)
            if RandomUtil.isInChance(_____603B_5B58_6863_6389_7387) then
                ____exports.default["获得主炮存档"](____exports.default)
            end
            if _____6709_65B0_4EBA_73A9_5BB6 then
                PlayerUtil:message("|cffff0000带新福利！额外掉落一个存档:")
                ____exports.default["获得主炮存档"](____exports.default)
            end
            if MapUtil:getRealNanduLevel() > 9 then
                _____6D77_57DF_5DE5_5177["增加玩家探索积分"](
                    _____6D77_57DF_5DE5_5177,
                    MapUtil:getRealNanduLevel() * 2
                )
            end
        end
    )
end
_____5B58_6863_83B7_53D6["击杀BOSS装备存档"] = function(self, bossID)
    if RandomUtil.isInChance(0.2) then
        local actorType = ____d__51FB_6740BOSS_88C5_5907_5B58_6863[(bossID - 1) * 4 + 0 + 1]
        PlayerUtil:forUsers(function(____, player)
            PlayerUtil:message("|cffff0000获得" .. actorType.name, 10, player)
            ArchiveUtil:addNumber(player, actorType.requireKey, 1)
        end)
    end
    if RandomUtil.isInChance(0.1) then
        local actorType = ____d__51FB_6740BOSS_88C5_5907_5B58_6863[(bossID - 1) * 4 + 1 + 1]
        PlayerUtil:forUsers(function(____, player)
            PlayerUtil:message("|cffff0000获得" .. actorType.name, 10, player)
            ArchiveUtil:addNumber(player, actorType.requireKey, 1)
        end)
    end
    if settings.gameDifficulty >= 4 and RandomUtil.isInChance(0.35) then
        local actorType = ____d__51FB_6740BOSS_88C5_5907_5B58_6863[(bossID - 1) * 4 + 2 + 1]
        PlayerUtil:forUsers(function(____, player)
            PlayerUtil:message("|cffff0000获得" .. actorType.name, 10, player)
            ArchiveUtil:addNumber(player, actorType.requireKey, 1)
        end)
    end
    if settings.gameDifficulty >= 7 and RandomUtil.isInChance(0.35) then
        local actorType = ____d__51FB_6740BOSS_88C5_5907_5B58_6863[(bossID - 1) * 4 + 3 + 1]
        PlayerUtil:forUsers(function(____, player)
            PlayerUtil:message("|cffff0000获得" .. actorType.name, 10, player)
            ArchiveUtil:addNumber(player, actorType.requireKey, 1)
        end)
    end
end
_____5B58_6863_83B7_53D6["获得主炮存档"] = function(self)
    local randomInt = GetRandomInt(0, 100)
    local cdKey = "a"
    local cdName
    local zhuPaoIndex = GetRandomInt(
        0,
        math.min(#____d__4E3B_70AE_5B58_6863A - 1)
    )
    if randomInt < 33 then
        cdKey = "a"
        cdName = ____d__4E3B_70AE_5B58_6863A[zhuPaoIndex + 1].name
    elseif randomInt < 66 then
        cdKey = "b"
        cdName = ____d__4E3B_70AE_5B58_6863B[zhuPaoIndex + 1].name
    else
        cdKey = "c"
        cdName = ____d__4E3B_70AE_5B58_6863C[zhuPaoIndex + 1].name
    end
    PlayerUtil:message("|cffff0000获得" .. cdName)
    local fk = (("_zp_" .. cdKey) .. "_") .. tostring(zhuPaoIndex)
    PlayerUtil:forUsers(function(____, player)
        ArchiveUtil:addNumber(player, fk, 1)
    end)
end
return ____exports
