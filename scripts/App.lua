local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 8,["18"] = 8,["19"] = 9,["20"] = 9,["21"] = 10,["22"] = 10,["23"] = 11,["24"] = 11,["25"] = 12,["26"] = 12,["27"] = 13,["28"] = 13,["29"] = 14,["30"] = 14,["31"] = 15,["32"] = 15,["33"] = 16,["34"] = 16,["35"] = 17,["36"] = 17,["37"] = 18,["38"] = 18,["39"] = 19,["40"] = 19,["41"] = 20,["42"] = 20,["43"] = 21,["44"] = 21,["45"] = 22,["46"] = 22,["47"] = 23,["48"] = 23,["49"] = 24,["50"] = 24,["51"] = 25,["52"] = 25,["53"] = 26,["54"] = 26,["55"] = 27,["56"] = 27,["57"] = 28,["58"] = 28,["59"] = 31,["60"] = 33,["61"] = 33,["62"] = 33,["64"] = 38,["65"] = 38,["66"] = 38,["67"] = 38,["68"] = 38,["69"] = 38,["70"] = 38,["71"] = 39,["72"] = 39,["73"] = 39,["74"] = 39,["75"] = 39,["76"] = 39,["77"] = 39,["78"] = 40,["79"] = 41,["80"] = 50,["81"] = 51,["82"] = 53,["83"] = 54,["84"] = 55,["85"] = 55,["86"] = 55,["87"] = 56,["88"] = 56,["89"] = 57,["90"] = 57,["91"] = 55,["92"] = 55,["93"] = 59,["94"] = 60,["95"] = 61,["96"] = 62,["97"] = 63,["98"] = 64,["99"] = 64,["102"] = 67,["103"] = 68,["104"] = 69,["105"] = 69,["108"] = 72,["109"] = 76,["110"] = 79,["111"] = 80,["112"] = 81,["113"] = 82,["114"] = 85,["115"] = 86,["116"] = 89,["117"] = 93,["118"] = 93,["119"] = 93,["120"] = 94,["121"] = 95,["123"] = 97,["124"] = 98,["125"] = 99,["126"] = 100,["127"] = 100,["128"] = 101,["129"] = 101,["130"] = 102,["131"] = 102,["132"] = 103,["133"] = 104,["134"] = 104,["135"] = 105,["136"] = 105,["137"] = 106,["138"] = 106,["139"] = 107,["140"] = 108,["141"] = 108,["142"] = 109,["143"] = 109,["144"] = 110,["145"] = 110,["147"] = 113,["148"] = 114,["149"] = 115,["150"] = 116,["151"] = 117,["152"] = 93,["153"] = 93,["154"] = 120,["155"] = 124,["156"] = 35,["157"] = 131,["158"] = 131,["159"] = 131,["160"] = 132,["161"] = 131,["162"] = 131,["163"] = 135,["164"] = 135,["165"] = 135,["166"] = 137,["167"] = 139,["168"] = 140,["169"] = 139,["171"] = 144,["173"] = 135,["174"] = 135});
local ____exports = {}
local ____GlobalVars = require("solar.solar-wc3.common.GlobalVars")
local GlobalVars = ____GlobalVars.default
local ____StateInit = require("StateInit")
local StateInit = ____StateInit.default
local ____StateConfigInit = require("StateConfigInit")
local StateConfigInit = ____StateConfigInit.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SolarDataClearState = require("solar.solar-common.attribute.SolarDataClearState")
local SolarDataClearState = ____SolarDataClearState.default
local ____UnitAttributeState = require("solar.solar-common.attribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____ItemAttributeState = require("solar.solar-common.attribute.ItemAttributeState")
local ItemAttributeState = ____ItemAttributeState.default
local ____PlayerAttributeState = require("solar.solar-common.attribute.PlayerAttributeState")
local PlayerAttributeState = ____PlayerAttributeState.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SolarActorState = require("solar.solar-common.actor.SolarActorState")
local SolarActorState = ____SolarActorState.default
local _____521D_59CB_5316 = require("初始化")
local _____521D_59CB_5316 = _____521D_59CB_5316.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local _____5730_56FE_6D4B_8BD5 = require("地图测试")
local _____5730_56FE_6D4B_8BD5 = _____5730_56FE_6D4B_8BD5.default
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = require("state.刷怪系统.达尔文进化基础刷怪")
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.default
local ____XlsxDataUtil = require("solar.solar-common.util.system.XlsxDataUtil")
local XlsxDataUtil = ____XlsxDataUtil.default
local _____73A9_5BB6_82F1_96C4_8239 = require("xlsx.单位.玩家英雄船")
local ____d__73A9_5BB6_82F1_96C4_8239 = _____73A9_5BB6_82F1_96C4_8239["d_玩家英雄船"]
local ____ForceUtil = require("solar.solar-common.util.game.ForceUtil")
local ForceUtil = ____ForceUtil.default
local ____GameDifficultyChooseDialogState = require("state.common.GameDifficultyChooseDialogState")
local GameDifficultyChooseDialogState = ____GameDifficultyChooseDialogState.default
local _____8FDB_653B_602A_6F14_5458 = require("xlsx.单位.进攻怪演员")
local ____d__8FDB_653B_602A_6F14_5458 = _____8FDB_653B_602A_6F14_5458["d_进攻怪演员"]
local _____8FDB_653B_602Aboss = require("xlsx.单位.进攻怪boss")
local ____d__8FDB_653B_602Aboss = _____8FDB_653B_602Aboss["d_进攻怪boss"]
local ____MapBaseInitState = require("state.module.MapBaseInitState")
local MapBaseInitState = ____MapBaseInitState.default
local ____SolarActorUnitState = require("solar.solar-common.actor.state.SolarActorUnitState")
local SolarActorUnitState = ____SolarActorUnitState.default
local ____MapRectUtil = require("util.MapRectUtil")
local MapRectUtil = ____MapRectUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
local _____521D_59CB_5316_5B58_6863_548C_5546_57CE = require("初始化存档和商城")
local _____521D_59CB_5316_5B58_6863_548C_5546_57CE = _____521D_59CB_5316_5B58_6863_548C_5546_57CE.default
GlobalVars:init()
____exports.default = __TS__Class()
local App = ____exports.default
App.name = "App"
function App.prototype.____constructor(self)
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        20,
        "|cff00ff00升级可进行进化，进化可选择性保留主炮，快去构筑最强船只吧！"
    )
    DisplayTimedTextToPlayer(
        GetLocalPlayer(),
        0,
        0,
        20,
        "|cffff0000一定要准备个马达和甲板，跑图速度和防秒很重要。"
    )
    gv.bossAbilityLimit = 1
    gv["上手入门模式"] = true
    StateConfigInit(nil)
    XlsxDataUtil:registerData(____d__73A9_5BB6_82F1_96C4_8239)
    _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.createOnDeepWater = true
    _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_palyer_nos = {8, 9, 10, 11}
    BaseUtil.runLater(
        300,
        function()
            local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_0, ____creeper_min_1 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "creeper_min"
            ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_0[____creeper_min_1] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_0[____creeper_min_1] + 100
            local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_2, ____create_creeper_pers_3 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "create_creeper_pers"
            ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_2[____create_creeper_pers_3] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_2[____create_creeper_pers_3] + ForceUtil.getUserCount()
        end
    )
    _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.regions = {"gg_rct_map"}
    for ____, data in ipairs(____d__8FDB_653B_602A_6F14_5458) do
        if data and data.id then
            local u = {}
            u[data.id] = 1
            local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_unit_ids_6 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.unit_ids
            ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_unit_ids_6[#____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_unit_ids_6 + 1] = u
        end
    end
    for ____, data in ipairs(____d__8FDB_653B_602Aboss) do
        if data and data.id then
            local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_boss_unit_ids_9 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.boss_unit_ids
            ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_boss_unit_ids_9[#____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_boss_unit_ids_9 + 1] = data.id
        end
    end
    _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.regions = {"gg_rct_map"}
    __TS__New(SolarDataClearState)
    __TS__New(SolarDamageState)
    __TS__New(ItemAttributeState)
    __TS__New(PlayerAttributeState)
    __TS__New(UnitAttributeState)
    SolarActorUnitState.config.openBounty = false
    __TS__New(SolarActorState)
    __TS__New(GameDifficultyChooseDialogState)
    se:on(
        "选择难度",
        function()
            if settings.gameDifficulty > 1 or settings.gameMode ~= MapModel["模式1_普通模式"] then
                gv["上手入门模式"] = false
            end
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_min = 50 + settings.gameDifficulty * 5
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.create_creeper_pers = 1 + math.floor(settings.gameDifficulty / 3)
            if settings.gameMode == MapModel["模式2_寄生模式"] then
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_10, ____creeper_min_11 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "creeper_min"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_10[____creeper_min_11] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_10[____creeper_min_11] * 2
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_12, ____create_creeper_pers_13 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "create_creeper_pers"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_12[____create_creeper_pers_13] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_12[____create_creeper_pers_13] + 2
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_14, ____create_creeper_pers_15 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "create_creeper_pers"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_14[____create_creeper_pers_15] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_14[____create_creeper_pers_15] * 2
            elseif settings.gameMode == MapModel["模式3_献祭模式"] then
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_16, ____creeper_min_17 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "creeper_min"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_16[____creeper_min_17] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_16[____creeper_min_17] * 3
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_18, ____create_creeper_pers_19 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "create_creeper_pers"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_18[____create_creeper_pers_19] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_18[____create_creeper_pers_19] + 3
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_20, ____create_creeper_pers_21 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "create_creeper_pers"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_20[____create_creeper_pers_21] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_20[____create_creeper_pers_21] * 3
            elseif settings.gameMode == MapModel["模式4_真实难度"] then
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_22, ____creeper_min_23 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "creeper_min"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_22[____creeper_min_23] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_22[____creeper_min_23] * 4
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_24, ____create_creeper_pers_25 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "create_creeper_pers"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_24[____create_creeper_pers_25] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_24[____create_creeper_pers_25] + 5
                local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_26, ____create_creeper_pers_27 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "create_creeper_pers"
                ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_26[____create_creeper_pers_27] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_26[____create_creeper_pers_27] * 3
            end
            __TS__New(MapBaseInitState)
            __TS__New(_____521D_59CB_5316)
            __TS__New(_____521D_59CB_5316_5B58_6863_548C_5546_57CE)
            StateInit(nil)
            MapRectUtil:setMapRect(0)
        end
    )
    GameUtil:openFullMapView()
    __TS__New(_____5730_56FE_6D4B_8BD5)
end
BaseUtil.runLater(
    0.01,
    function()
        DzSetWar3MapMap("区域小地图\\主图.blp")
    end
)
BaseUtil.runLater(
    0.02,
    function()
        if isEmbedJapi then
            PlayerUtil:onUsersUidReady(function()
                __TS__New(____exports.default)
            end)
        else
            __TS__New(____exports.default)
        end
    end
)
return ____exports
