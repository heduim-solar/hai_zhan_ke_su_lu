local ____lualib = require("lualib_bundle")
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 11,["25"] = 11,["26"] = 12,["27"] = 12,["28"] = 13,["29"] = 13,["30"] = 14,["31"] = 14,["32"] = 15,["33"] = 15,["34"] = 16,["35"] = 16,["36"] = 17,["37"] = 17,["38"] = 18,["39"] = 18,["40"] = 19,["41"] = 19,["42"] = 20,["43"] = 20,["44"] = 21,["45"] = 21,["46"] = 22,["47"] = 22,["48"] = 23,["49"] = 23,["50"] = 24,["51"] = 24,["52"] = 25,["53"] = 25,["54"] = 26,["55"] = 26,["56"] = 27,["57"] = 27,["58"] = 29,["59"] = 31,["60"] = 32,["61"] = 33,["62"] = 36,["63"] = 37,["64"] = 38,["65"] = 39,["66"] = 40,["67"] = 41,["68"] = 42,["69"] = 43,["70"] = 44,["71"] = 45,["72"] = 46,["73"] = 47,["74"] = 48,["75"] = 49,["76"] = 50,["77"] = 51,["78"] = 52,["79"] = 53,["80"] = 54,["81"] = 55,["82"] = 56,["83"] = 57,["84"] = 59});
local ____exports = {}
local _____57FA_7840_6307_4EE4 = require("state.common.基础指令")
local _____57FA_7840_6307_4EE4 = _____57FA_7840_6307_4EE4.default
local _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1 = require("state.存档.平台存档等地图相关奖励")
local _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1 = _____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1.default
local ____UiProperty = require("gui.UiProperty")
local UiProperty = ____UiProperty.default
local _____82F1_96C4_589E_4F24 = require("attribute.英雄增伤")
local _____82F1_96C4_589E_4F24 = _____82F1_96C4_589E_4F24.default
local _____6BCF_79D2_52A0_5C5E_6027 = require("attribute.每秒加属性")
local _____6BCF_79D2_52A0_5C5E_6027 = _____6BCF_79D2_52A0_5C5E_6027.default
local _____602A_7269_6B7B_4EA1_65F6_5237_65B0_602A_7269 = require("state.玩法机制.怪物死亡时刷新怪物")
local _____602A_7269_6B7B_4EA1_65F6_5237_65B0_602A_7269 = _____602A_7269_6B7B_4EA1_65F6_5237_65B0_602A_7269.default
local _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B = require("state.单位.受到伤害时限制最大伤害值为生命值比例")
local _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B = _____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B.default
local _____9020_6210_4F24_5BB3_65F6_9644_5E26_76EE_6807_6700_5927_751F_547D_503C_6BD4_4F8B_7684_4F24_5BB3 = require("state.单位.造成伤害时附带目标最大生命值比例的伤害")
local _____9020_6210_4F24_5BB3_65F6_9644_5E26_76EE_6807_6700_5927_751F_547D_503C_6BD4_4F8B_7684_4F24_5BB3 = _____9020_6210_4F24_5BB3_65F6_9644_5E26_76EE_6807_6700_5927_751F_547D_503C_6BD4_4F8B_7684_4F24_5BB3.default
local _____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F = require("state.存档.开局刷新平台房间栏位信息")
local _____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F = _____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F.default
local _____7C7B_53CC_51FB_7269_54C1_65F6_82F1_96C4_5B9D_5B9D_4EA4_6362_8BE5_7269_54C1 = require("state.宝宝助手.类双击物品时英雄宝宝交换该物品")
local _____7C7B_53CC_51FB_7269_54C1_65F6_82F1_96C4_5B9D_5B9D_4EA4_6362_8BE5_7269_54C1 = _____7C7B_53CC_51FB_7269_54C1_65F6_82F1_96C4_5B9D_5B9D_4EA4_6362_8BE5_7269_54C1.default
local _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730 = require("state.unit.右键移动时闪现到目的地")
local _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730 = _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730.default
local _____5FEB_901F_5EFA_9020 = require("attribute.玩家属性.快速建造")
local _____5FEB_901F_5EFA_9020 = _____5FEB_901F_5EFA_9020.default
local _____82F1_96C4_5347_7EA7_589E_5E45 = require("attribute.玩家属性.英雄升级增幅")
local _____82F1_96C4_5347_7EA7_589E_5E45 = _____82F1_96C4_5347_7EA7_589E_5E45.default
local _____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF = require("state.module.给与玩家奖励系统")
local _____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF = _____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF.default
local _____56FE_6807_9762_677F = require("界面.图标面板.图标面板")
local _____56FE_6807_9762_677F = _____56FE_6807_9762_677F.default
local _____82F1_96C4_5C5E_6027_4E66 = require("state.物品.英雄属性书")
local _____82F1_96C4_5C5E_6027_4E66 = _____82F1_96C4_5C5E_6027_4E66.default
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = require("state.刷怪系统.达尔文进化基础刷怪")
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.default
local ____AA_split_damage = require("attribute.AA_split_damage")
local AA_split_damage = ____AA_split_damage.default
local _____6740_654C_65F6_52A0_5C5E_6027 = require("attribute.杀敌时加属性")
local _____6740_654C_65F6_52A0_5C5E_6027 = _____6740_654C_65F6_52A0_5C5E_6027.default
local ____AA_reply_life_on_pers = require("attribute.AA_reply_life_on_pers")
local AA_reply_life_on_pers = ____AA_reply_life_on_pers.default
local _____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57 = require("state.系统.开局给Npc头上创建名字")
local _____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57 = _____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57.default
local _____6BCF_79D2_8D44_6E90 = require("attribute.玩家属性.每秒资源")
local _____6BCF_79D2_8D44_6E90 = _____6BCF_79D2_8D44_6E90.default
local ____HeroReviveOnDeath = require("state.common.HeroReviveOnDeath")
local HeroReviveOnDeath = ____HeroReviveOnDeath.default
local ____SolarNewItemsFormulaState = require("state.common.SolarNewItemsFormulaState")
local SolarNewItemsFormulaState = ____SolarNewItemsFormulaState.default
local ____BaseMultiboardState = require("state.module.BaseMultiboardState")
local BaseMultiboardState = ____BaseMultiboardState.default
local ____UpdateCameraHeightOnMouseScroll = require("state.common.UpdateCameraHeightOnMouseScroll")
local UpdateCameraHeightOnMouseScroll = ____UpdateCameraHeightOnMouseScroll.default
function ____exports.default(self)
    __TS__New(UpdateCameraHeightOnMouseScroll)
    __TS__New(BaseMultiboardState)
    __TS__New(SolarNewItemsFormulaState)
    __TS__New(HeroReviveOnDeath)
    __TS__New(_____6BCF_79D2_8D44_6E90)
    __TS__New(_____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57)
    __TS__New(AA_reply_life_on_pers)
    __TS__New(_____6740_654C_65F6_52A0_5C5E_6027)
    __TS__New(AA_split_damage)
    __TS__New(_____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A)
    __TS__New(_____82F1_96C4_5C5E_6027_4E66)
    __TS__New(_____56FE_6807_9762_677F)
    __TS__New(_____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF)
    __TS__New(_____82F1_96C4_5347_7EA7_589E_5E45)
    __TS__New(_____5FEB_901F_5EFA_9020)
    __TS__New(_____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730)
    __TS__New(_____7C7B_53CC_51FB_7269_54C1_65F6_82F1_96C4_5B9D_5B9D_4EA4_6362_8BE5_7269_54C1)
    __TS__New(_____5F00_5C40_5237_65B0_5E73_53F0_623F_95F4_680F_4F4D_4FE1_606F)
    __TS__New(_____9020_6210_4F24_5BB3_65F6_9644_5E26_76EE_6807_6700_5927_751F_547D_503C_6BD4_4F8B_7684_4F24_5BB3)
    __TS__New(_____53D7_5230_4F24_5BB3_65F6_9650_5236_6700_5927_4F24_5BB3_503C_4E3A_751F_547D_503C_6BD4_4F8B)
    __TS__New(_____602A_7269_6B7B_4EA1_65F6_5237_65B0_602A_7269)
    __TS__New(_____6BCF_79D2_52A0_5C5E_6027)
    __TS__New(_____82F1_96C4_589E_4F24)
    __TS__New(UiProperty)
    __TS__New(_____5E73_53F0_5B58_6863_7B49_5730_56FE_76F8_5173_5956_52B1)
    __TS__New(_____57FA_7840_6307_4EE4)
end
return ____exports
