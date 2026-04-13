local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 12,["27"] = 12,["28"] = 12,["30"] = 18,["31"] = 19,["32"] = 20,["35"] = 23,["38"] = 26,["39"] = 27,["40"] = 28,["41"] = 29,["43"] = 18,["44"] = 15,["45"] = 36,["46"] = 36,["47"] = 36,["49"] = 37,["50"] = 38,["51"] = 38,["52"] = 39,["53"] = 39,["54"] = 39,["55"] = 39,["56"] = 39,["57"] = 40,["59"] = 38,["60"] = 38,["61"] = 38,["62"] = 43,["63"] = 43,["64"] = 43,["65"] = 44,["66"] = 45,["67"] = 46,["68"] = 48,["69"] = 49,["70"] = 50,["71"] = 51,["72"] = 52,["73"] = 53,["74"] = 54,["75"] = 55,["77"] = 57,["79"] = 59,["80"] = 59,["81"] = 59,["82"] = 59,["83"] = 59,["85"] = 60,["86"] = 60,["87"] = 61,["88"] = 61,["89"] = 61,["90"] = 61,["91"] = 61,["92"] = 61,["93"] = 61,["94"] = 60,["97"] = 63,["98"] = 63,["99"] = 63,["100"] = 63,["101"] = 63,["102"] = 63,["103"] = 63,["104"] = 45,["105"] = 66,["106"] = 43,["107"] = 43,["108"] = 36});
local ____exports = {}
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = require("state.刷怪系统.达尔文进化基础刷怪")
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
local _____6DF1_5EA6_6D77_57DF = require("state.深度海域.深度海域")
local _____6DF1_5EA6_6D77_57DF = _____6DF1_5EA6_6D77_57DF.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
____exports.default = __TS__Class()
local _____6E38_620F_80DC_5229 = ____exports.default
_____6E38_620F_80DC_5229.name = "游戏胜利"
function _____6E38_620F_80DC_5229.prototype.____constructor(self)
    se:onUnitDeath(function(e)
        local actorUnit = ActorUnitUtil:getActorUnit(e.trigUnit)
        if actorUnit == nil then
            return
        end
        if settings.gameMode == MapModel["模式0_教学模式"] then
            return
        end
        if actorUnit.actorTypeId == "拉莱耶之主-伟大的克苏鲁" then
            ____exports.default:victorys()
        elseif actorUnit.actorTypeId == "克苏鲁之女-克希拉" and settings.gameDifficulty <= 3 then
            ____exports.default:victorys()
        end
    end)
end
function _____6E38_620F_80DC_5229.victorys(self, msg)
    if msg == nil then
        msg = "|cffff0000游戏胜利!可以进入深度海域挑战更多存档！"
    end
    _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A:stop()
    SelectUtil.forAllEnemyUnits(
        function(____, u)
            if RectUtil.isContainsCoords(
                gg_rct_map,
                GetUnitX(u),
                GetUnitY(u)
            ) then
                RemoveUnit(u)
            end
        end,
        Player(0)
    )
    SingletonUtil:executeOnce(
        "游戏胜利存档积分",
        function()
            se:emit("游戏胜利")
            PlayerUtil:forUsers(function(____, player)
                local key = "n" .. tostring(settings.gameDifficulty)
                PlatUtil:addStoreInt(player, "znjifen", 1)
                ArchiveUtil:addNumber(player, key, 1)
                if settings.gameMode == MapModel["模式3_献祭模式"] then
                    ArchiveUtil:updateMaxNumber(player, "maxn", 20 + settings.gameDifficulty)
                elseif settings.gameMode == MapModel["模式4_真实难度"] then
                    ArchiveUtil:updateMaxNumber(player, "maxn", 30 + settings.gameDifficulty)
                elseif settings.gameMode == MapModel["模式2_寄生模式"] then
                    ArchiveUtil:updateMaxNumber(player, "maxn", 10 + settings.gameDifficulty)
                else
                    ArchiveUtil:updateMaxNumber(player, "maxn", settings.gameDifficulty)
                end
                ArchiveUtil:updateMaxNumber(
                    player,
                    "maxzl",
                    sd(nil, player).combatPower or 0
                )
                do
                    local i = 0
                    while i < 5 do
                        DisplayTimedTextToPlayer(
                            player,
                            0,
                            0,
                            30,
                            msg
                        )
                        i = i + 1
                    end
                end
                DisplayTimedTextToPlayer(
                    player,
                    0,
                    0,
                    30,
                    "【提示】开局输入-gj可以开启休闲模式"
                )
            end)
            _____6DF1_5EA6_6D77_57DF["开启深度海域之门"](_____6DF1_5EA6_6D77_57DF)
        end
    )
end
return ____exports
