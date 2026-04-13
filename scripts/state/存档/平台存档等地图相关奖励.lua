local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 33,["23"] = 33,["24"] = 33,["26"] = 33,["27"] = 36,["28"] = 37,["31"] = 40,["34"] = 43,["35"] = 44,["36"] = 45,["37"] = 46,["40"] = 49,["43"] = 52,["45"] = 43,["46"] = 55,["47"] = 56,["49"] = 36,["50"] = 60,["51"] = 62,["52"] = 62,["53"] = 62,["54"] = 63,["55"] = 64,["56"] = 65,["57"] = 67,["58"] = 67,["59"] = 67,["60"] = 67,["61"] = 67,["64"] = 70,["65"] = 70,["66"] = 70,["67"] = 70,["68"] = 70,["69"] = 71,["70"] = 72,["71"] = 62,["72"] = 62,["73"] = 60,["74"] = 79,["75"] = 80,["76"] = 81,["77"] = 82,["78"] = 83,["80"] = 85,["81"] = 86,["83"] = 88,["84"] = 89,["85"] = 90,["86"] = 91,["87"] = 92,["88"] = 93,["89"] = 94,["90"] = 95,["91"] = 96,["92"] = 97,["93"] = 98,["94"] = 99,["95"] = 100,["96"] = 101,["97"] = 102,["98"] = 103,["99"] = 104,["100"] = 105,["102"] = 107,["105"] = 111,["106"] = 112,["107"] = 113,["109"] = 115,["110"] = 116,["112"] = 118,["114"] = 120,["115"] = 79,["116"] = 123,["117"] = 125,["118"] = 127,["119"] = 129,["120"] = 130,["121"] = 131,["122"] = 132,["123"] = 133,["125"] = 135,["126"] = 137,["127"] = 138,["128"] = 139,["129"] = 139,["130"] = 139,["131"] = 139,["132"] = 139,["134"] = 142,["135"] = 143,["136"] = 144,["137"] = 145,["139"] = 147,["142"] = 154,["143"] = 155,["144"] = 155,["145"] = 155,["146"] = 155,["147"] = 155,["148"] = 155,["149"] = 155,["150"] = 155,["151"] = 156,["152"] = 158,["153"] = 159,["154"] = 159,["155"] = 159,["156"] = 159,["157"] = 159,["158"] = 159,["159"] = 159,["160"] = 159,["163"] = 166,["164"] = 123});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ForceUtil = require("solar.solar-common.util.game.ForceUtil")
local ForceUtil = ____ForceUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
____exports.default = __TS__Class()
local _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1 = ____exports.default
_____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1.name = "平台存档等地图相关奖励"
function _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1.prototype.____constructor(self)
end
function _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1.distributeRewards(self, datum)
    if not datum.id then
        return
    end
    if not datum.requireKey then
        return
    end
    ForceUtil.forUserForce(function(____, p)
        local _____53D1_653E_6570_91CF = ____exports.default["判断是否符合此奖励"](____exports.default, p, datum)
        if _____53D1_653E_6570_91CF and _____53D1_653E_6570_91CF > 0 then
            if datum.requireVal and LangUtil:isNumber(datum.rewardVal) and _____53D1_653E_6570_91CF < datum.requireVal then
                return
            end
            if datum.requireValMin and _____53D1_653E_6570_91CF < datum.requireValMin then
                return
            end
            ____exports.default["发放奖励"](____exports.default, p, datum, _____53D1_653E_6570_91CF)
        end
    end)
    if datum["激活码"] and #datum["激活码"] > 0 and datum.requireKey and #datum.requireKey > 0 then
        ____exports.default["注册激活码激活存档"](____exports.default, datum["激活码"], datum)
    end
end
_____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1["注册激活码激活存档"] = function(self, _____6FC0_6D3B_7801, datum)
    se:onPlayerChat(
        _____6FC0_6D3B_7801,
        function(e, c)
            local player = e.triggerPlayer
            local oldVal = ArchiveUtil:get(player, datum.requireKey)
            if oldVal and oldVal > 0 then
                PlayerUtil:message(
                    ("|cffff0000【已经激活过了】" .. tostring(datum.name)) .. "!此激活码已被激活过了，无需重复激活!",
                    5,
                    player
                )
                return
            end
            PlayerUtil:message(
                ("|cff00ff00【存档】激活" .. tostring(datum.name)) .. "!后续自动激活，无需再输入此激活码!",
                5,
                player
            )
            ArchiveUtil:set(player, datum.requireKey, 1)
            ____exports.default["发放奖励"](____exports.default, player, datum, 1)
        end
    )
end
_____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1["判断是否符合此奖励"] = function(self, p, datum)
    if datum.requireKey == "商城道具" then
        local mallItemCount = PlatUtil:getMallItemCount(p, datum.id)
        if mallItemCount and mallItemCount > 0 then
            return mallItemCount
        end
        if MapUtil["是否开后门"](MapUtil, p) then
            return 1
        end
        return PlatUtil:hasMallItem(p, datum.id) and 1 or 0
    elseif datum.requireKey == "收藏过地图" then
        return PlatUtil:isCollect(p) and 1 or 0
    elseif datum.requireKey == "累计获得赞数" then
        return PlatUtil:getForumDataTotalLikes(p) >= (datum.requireValMin or 1) and PlatUtil:getForumDataTotalLikes(p) or 0
    elseif datum.requireKey == "总签到天数" then
        return PlatUtil:continuousCount(p) >= (datum.requireValMin or 1) and PlatUtil:continuousCount(p) or 0
    elseif datum.requireKey == "地图等级" then
        local mapLevel = PlatUtil:getMapLevel(p)
        return mapLevel >= (datum.requireValMin or 1) and mapLevel or 0
    elseif datum.requireKey == "测试福利" then
        return DzAPI_Map_GetStoredString(p, "maptest2020") ~= "1" and 1 or 0
    elseif datum.requireKey == "预约福利" then
        return DzAPI_Map_GetStoredString(p, "prebook2023") ~= "1" and 1 or 0
    elseif datum.requireKey == "公会名称" then
        local guildName = PlatUtil:getGuildName(p)
        if guildName and (string.find(guildName, datum.requireVal, nil, true) or 0) - 1 >= 0 then
            return 1
        else
            return 0
        end
    else
        local archiveVal = PlatUtil:getStoreInt(p, datum.requireKey)
        if archiveVal == nil or archiveVal == 0 then
            archiveVal = ArchiveUtil:get(p, datum.requireKey)
        end
        if archiveVal and type(archiveVal) == "string" and #tostring(archiveVal) > 0 then
            return 1
        end
        return archiveVal
    end
    return nil
end
_____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1["发放奖励"] = function(self, p, datum, _____53D1_653E_6570_91CF)
    local rewardVal = datum.rewardVal
    if datum["数量叠加"] == true or datum["数量叠加"] == "无上限" or datum["数量叠加"] == "数量消耗" or datum["数量叠加"] == "地图等级" or LangUtil:isNumber(datum["数量叠加"]) and datum["数量叠加"] ~= 0 then
        local maxLimit = 100000000
        if datum["数量叠加"] == "地图等级" then
            maxLimit = PlatUtil:getMapLevel(p)
        elseif LangUtil:isNumber(datum["数量叠加"]) and datum["数量叠加"] > 1 then
            maxLimit = datum["数量叠加"]
        end
        if LangUtil:isNumber(rewardVal) then
            rewardVal = rewardVal * math.min(_____53D1_653E_6570_91CF, maxLimit)
        elseif LangUtil:isObject(rewardVal) then
            rewardVal = AttributeUtil:multiply(
                rewardVal,
                math.min(_____53D1_653E_6570_91CF, maxLimit),
                {}
            )
        end
        if datum["显示数量"] ~= false then
            local countInfo = "|cff00ff00当前数量:" .. tostring(_____53D1_653E_6570_91CF)
            if _____53D1_653E_6570_91CF > maxLimit then
                countInfo = countInfo .. ("(生效数量:" .. tostring(maxLimit)) .. ")"
            end
            ActorTypeUtil:setTypeDescribe(datum.id, (countInfo .. "|r|n") .. datum.describe, p)
        end
    end
    if datum.rewardKey and #datum.rewardKey > 0 then
        se:emit(
            "给与玩家奖励",
            {
                p = GetPlayerId(p),
                key = datum.rewardKey,
                val = rewardVal
            }
        )
    elseif rewardVal ~= nil then
        for rewardValKey in pairs(rewardVal) do
            se:emit(
                "给与玩家奖励",
                {
                    p = GetPlayerId(p),
                    key = rewardValKey,
                    val = rewardVal[rewardValKey]
                }
            )
        end
    end
    ActorTypeUtil:setUiEnable(datum.id, true, p)
end
return ____exports
