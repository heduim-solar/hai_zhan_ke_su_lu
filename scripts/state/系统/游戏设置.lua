local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 13,["31"] = 13,["32"] = 14,["33"] = 14,["34"] = 15,["35"] = 15,["36"] = 16,["37"] = 16,["38"] = 17,["39"] = 17,["40"] = 18,["41"] = 18,["42"] = 19,["43"] = 19,["44"] = 20,["45"] = 20,["46"] = 21,["47"] = 21,["48"] = 22,["49"] = 22,["50"] = 23,["51"] = 23,["52"] = 26,["53"] = 26,["54"] = 26,["56"] = 30,["57"] = 31,["58"] = 32,["59"] = 33,["60"] = 33,["61"] = 33,["62"] = 34,["63"] = 35,["64"] = 36,["65"] = 36,["66"] = 36,["67"] = 37,["68"] = 38,["69"] = 36,["70"] = 36,["71"] = 33,["72"] = 33,["73"] = 43,["74"] = 49,["75"] = 50,["76"] = 51,["77"] = 52,["79"] = 54,["80"] = 55,["81"] = 54,["82"] = 58,["83"] = 59,["84"] = 58,["86"] = 49,["87"] = 64,["88"] = 64,["89"] = 64,["90"] = 65,["91"] = 66,["94"] = 69,["95"] = 70,["96"] = 71,["97"] = 72,["98"] = 73,["99"] = 74,["100"] = 75,["102"] = 79,["103"] = 65,["104"] = 64,["105"] = 64,["106"] = 85,["107"] = 85,["108"] = 85,["109"] = 86,["110"] = 87,["111"] = 88,["113"] = 85,["114"] = 85,["115"] = 95,["116"] = 99,["117"] = 99,["118"] = 99,["119"] = 99,["120"] = 99,["121"] = 99,["122"] = 99,["123"] = 100,["124"] = 100,["125"] = 100,["126"] = 100,["127"] = 101,["128"] = 101,["129"] = 101,["130"] = 101,["131"] = 105,["132"] = 106,["133"] = 107,["134"] = 29});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____MapHeroUtil = require("util.MapHeroUtil")
local MapHeroUtil = ____MapHeroUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____l__4E2D_5FC3_65CB_6DA1_70B9 = require("_sl_editor.l_中心旋涡点")
local ____l__4E2D_5FC3_65CB_6DA1_70B9 = ____l__4E2D_5FC3_65CB_6DA1_70B9["l_中心旋涡点"]
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
local _____64C2_53F0_5355_4F4D_6311_6218NPC = require("xlsx.单位.擂台单位挑战NPC")
local ____d__64C2_53F0_5355_4F4D_6311_6218NPC = _____64C2_53F0_5355_4F4D_6311_6218NPC["d_擂台单位挑战NPC"]
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____l__8D77_59CB_70B9 = require("_sl_editor.l_起始点")
local ____l__8D77_59CB_70B9 = ____l__8D77_59CB_70B9["l_起始点"]
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____XlsxDataUtil = require("solar.solar-common.util.system.XlsxDataUtil")
local XlsxDataUtil = ____XlsxDataUtil.default
local _____6DF1_5EA6_6D77_57DF_5B58_6863 = require("xlsx.存档.深度海域存档")
local ____d__6DF1_5EA6_6D77_57DF_5B58_6863 = _____6DF1_5EA6_6D77_57DF_5B58_6863["d_深度海域存档"]
local _____5386_53F2_4E2D_7684_6218_8230_788E_7247 = require("xlsx.存档.历史中的战舰碎片")
local ____d__5386_53F2_4E2D_7684_6218_8230_788E_7247 = _____5386_53F2_4E2D_7684_6218_8230_788E_7247["d_历史中的战舰碎片"]
local _____5151_6362_521D_59CB_5C5E_6027_5B58_6863 = require("xlsx.存档.兑换初始属性存档")
local ____d__5151_6362_521D_59CB_5C5E_6027_5B58_6863 = _____5151_6362_521D_59CB_5C5E_6027_5B58_6863["d_兑换初始属性存档"]
local ____BaseMultiboardState = require("state.module.BaseMultiboardState")
local BaseMultiboardState = ____BaseMultiboardState.default
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = require("state.刷怪系统.达尔文进化基础刷怪")
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
____exports.default = __TS__Class()
local _____6E38_620F_8BBE_7F6E = ____exports.default
_____6E38_620F_8BBE_7F6E.name = "游戏设置"
function _____6E38_620F_8BBE_7F6E.prototype.____constructor(self)
    BaseMultiboardState.config.showPlayerHeroName = true
    BaseMultiboardState.config.showPlayerHeroLevel = true
    BaseMultiboardState.config.showSwallowCount = true
    se:onPlayerChat(
        "-gj",
        function(e, solarTrigger)
            BJDebugMsg("停止刷怪系统!")
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A:stop()
            BaseUtil.runLater(
                60 * 60 * 7,
                function()
                    GameUtil:defeats()
                    EndGame(true)
                end
            )
        end
    )
    ActorTypeShopUtil:autoDisableSellingAbilityOnNoStoreTarget(____d__64C2_53F0_5355_4F4D_6311_6218NPC[1].id)
    ActorTypeUtil:forAllActorTypes(function(____, actorType)
        if actorType["sc_射程"] and actorType["sc_射程"] > 0 and actorType["ss_射速"] and actorType["sc_射程"] > 0 then
            if actorType.stateFormula == nil and actorType["shgs_伤害公式"] then
                actorType.stateFormula = actorType["shgs_伤害公式"]
            end
            actorType.onUnitChange = function(____, actor, unit)
                _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
            end
            actorType.onDestroy = function(____, actor)
                _____4E3B_70AE_57FA_7840_4E8B_4EF6:onDestroy(actor)
            end
        end
    end)
    BaseUtil.runLater(
        1,
        function()
            PlayerUtil:forPlayingPlayers(function(____, player)
                if GetPlayerId(player) > 3 then
                    return
                end
                local playerAttribute = AttributeUtil:getPlayerAttribute(player, true)
                playerAttribute["每秒金币"] = (playerAttribute["每秒金币"] or 0) + 1
                local anHero = SelectUtil.getAnHero(GetPlayerId(player))
                MapHeroUtil["cshyx_初始化英雄"](MapHeroUtil, anHero)
                if settings.gameDifficulty == 1 and PlatUtil:getMapLevel(player) < 3 then
                    playerAttribute["死亡后立刻复活"] = (playerAttribute["死亡后立刻复活"] or 0) + 2
                    PlayerUtil:message("|cffff0000【萌新福利】检测到你的地图等级不超过2级.所以奖励你额外生命2条。以免你被怪物暴虐！", 10, player)
                end
                sd(nil, player).assistant = ActorUnitUtil:createActorUnit(player, "宝宝助手", ____l__8D77_59CB_70B9[1].x, ____l__8D77_59CB_70B9[1].y).unit
            end)
        end
    )
    se:onLeaveRect(
        gg_rct_base,
        function(e)
            if ActorUnitUtil:isActorUnitType(e.trigUnit, "宝宝助手") then
                UnitUtil.transfer(e.trigUnit, ____l__8D77_59CB_70B9[1].x, ____l__8D77_59CB_70B9[1].y)
                TextTagUtil.textWarn("宝宝不能离开基地！右键双击物品可以传送到英雄!", e.trigUnit, 10, 5)
            end
        end
    )
    PlayerUtil:allianceWithNeutralAggressive(8, 9, 10, 11)
    local zxd = CreateUnit(
        Player(11),
        "A45g",
        ____l__4E2D_5FC3_65CB_6DA1_70B9[1].x,
        ____l__4E2D_5FC3_65CB_6DA1_70B9[1].y,
        0
    )
    UnitStateUtil:addArmor(
        zxd,
        UnitStateUtil:getArmor(zxd) * settings.valueCoefficient
    )
    UnitStateUtil:addMaxLifeAndLife(
        zxd,
        UnitStateUtil:getMaxLife(zxd) * settings.valueCoefficient
    )
    XlsxDataUtil:registerData(____d__6DF1_5EA6_6D77_57DF_5B58_6863)
    XlsxDataUtil:registerData(____d__5386_53F2_4E2D_7684_6218_8230_788E_7247)
    XlsxDataUtil:registerData(____d__5151_6362_521D_59CB_5C5E_6027_5B58_6863)
end
return ____exports
