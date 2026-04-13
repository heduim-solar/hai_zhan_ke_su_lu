local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 24,["8"] = 24,["9"] = 24,["10"] = 24,["11"] = 24,["12"] = 24,["13"] = 24,["14"] = 24,["15"] = 24,["16"] = 24,["17"] = 24,["18"] = 24,["19"] = 24,["20"] = 24,["21"] = 24,["22"] = 24,["23"] = 24,["24"] = 24,["25"] = 24,["26"] = 24,["27"] = 24,["28"] = 24,["29"] = 24,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 24,["35"] = 24,["36"] = 24,["37"] = 24,["38"] = 24,["39"] = 24,["40"] = 24,["41"] = 24,["42"] = 24,["43"] = 181,["44"] = 185,["45"] = 187,["46"] = 188,["47"] = 189,["48"] = 190,["49"] = 190});
local ____exports = {}
local ____UiProperty = require("gui.UiProperty")
local UiProperty = ____UiProperty.default
____exports.data = {
    {Name = "|cffff0000伤害增幅|r", key = "damage_increased", showPercentage = true},
    {Name = "|cffff0000主炮射程附加|r", key = "autoMissileAttackRange"},
    {Name = "|cffff0000主炮射程增幅|r", key = "autoMissileAttackRange_p", showPercentage = true},
    {Name = "|cffff0000主炮射速增幅|r", key = "autoMissileAttackSpeed", showPercentage = true},
    {Name = "|cffff0000攻击增幅|r", key = "attack_p", showPercentage = true},
    {Name = "|cffff0000力量增幅|r", key = "strength_p", showPercentage = true},
    {Name = "|cffff0000敏捷增幅|r", key = "agility_p", showPercentage = true},
    {Name = "|cffff0000智力增幅|r", key = "intelligence_p", showPercentage = true},
    {Name = "|cffff0000全属性增幅|r", key = "full_property_p", showPercentage = true},
    {Name = "|cff00b050复活次数|r", key = "死亡后立刻复活"},
    {Name = "|cff00b050伤害减免|r", key = "damage_reduction", showPercentage = true},
    {Name = "|cff00b050护甲增幅|r", key = "def_p", showPercentage = true},
    {Name = "|cff00b050生命回复|r", key = "reply_life_on_pers"},
    {Name = "|cff00b050生命回复(比例)|r", key = "reply_life_by_p_on_pers", showPercentage = true},
    {Name = "|cffd08953杀敌加攻击|r", key = "add_attack_on_kill"},
    {Name = "|cffd08953每秒加攻击|r", key = "add_attack_on_pers"},
    {Name = "|cffd08953杀敌加生命|r", key = "add_max_life_on_kill"},
    {Name = "|cffd08953每秒加生命|r", key = "add_max_life_on_pers"},
    {Name = "|cffd08953杀敌加力量|r", key = "add_strength_on_kill"},
    {Name = "|cffd08953杀敌加力量增幅|r", key = "add_strength_on_kill_p", showPercentage = true},
    {Name = "|cffd08953杀敌加敏捷|r", key = "add_agility_on_kill"},
    {Name = "|cffd08953杀敌加敏捷增幅|r", key = "add_agility_on_kill_p", showPercentage = true},
    {Name = "|cffd08953杀敌加智力|r", key = "add_intelligence_on_kill"},
    {Name = "|cffd08953杀敌加智力增幅|r", key = "add_intelligence_on_kill_p", showPercentage = true},
    {Name = "|cffd08953每秒加力量|r", key = "add_strength_on_pers"},
    {Name = "|cffd08953每秒加敏捷|r", key = "add_agility_on_pers"},
    {Name = "|cffd08953每秒加智力|r", key = "add_intelligence_on_pers"},
    {Name = "|cffffff00存档掉率|r", key = "存档掉率", showPercentage = true},
    {Name = "|cffffff00金币效率|r", key = "earn_gold_p", showPercentage = true},
    {Name = "|cffffff00经验倍率增幅|r", key = "经验倍率", showPercentage = true},
    {Name = "|cffffff00杀敌经验附加|r", key = "杀敌经验"},
    {Name = "|cffffff00杀敌金币|r", key = "add_gold_on_kill"},
    {Name = "|cffffff00船长信件吞噬上限|r", key = "吞噬船长上限", add_show_num = 2},
    {Name = "|cffffff00吞天石吞噬上限|r", key = "吞天石吞噬上限", add_show_num = 2}
}
____exports["d_属性面板ui显示"] = ____exports.data
function ____exports.default(self)
    UiProperty.config = {}
    for ____, datum in ipairs(____exports.data) do
        if datum.key then
            local ____UiProperty_config_0 = UiProperty.config
            ____UiProperty_config_0[#____UiProperty_config_0 + 1] = datum
        end
    end
end
return ____exports
