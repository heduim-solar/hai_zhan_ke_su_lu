local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 40,["8"] = 41,["9"] = 41,["10"] = 41,["11"] = 41,["12"] = 41,["13"] = 41,["14"] = 41,["15"] = 41,["16"] = 41,["17"] = 41,["18"] = 41,["19"] = 40,["20"] = 53,["21"] = 53,["22"] = 53,["23"] = 53,["24"] = 53,["25"] = 53,["26"] = 53,["27"] = 53,["28"] = 53,["29"] = 40,["30"] = 63,["31"] = 63,["32"] = 63,["33"] = 63,["34"] = 63,["35"] = 63,["36"] = 63,["37"] = 63,["38"] = 63,["39"] = 40,["40"] = 73,["41"] = 73,["42"] = 73,["43"] = 73,["44"] = 73,["45"] = 73,["46"] = 73,["47"] = 73,["48"] = 73,["49"] = 73,["50"] = 40,["51"] = 84,["52"] = 84,["53"] = 84,["54"] = 84,["55"] = 84,["56"] = 84,["57"] = 84,["58"] = 84,["59"] = 84,["60"] = 84,["61"] = 84,["62"] = 84,["63"] = 40,["64"] = 97,["65"] = 97,["66"] = 97,["67"] = 97,["68"] = 97,["69"] = 97,["70"] = 97,["71"] = 97,["72"] = 97,["73"] = 97,["74"] = 97,["75"] = 97,["76"] = 40,["77"] = 110,["78"] = 110,["79"] = 110,["80"] = 110,["81"] = 110,["82"] = 110,["83"] = 110,["84"] = 110,["85"] = 110,["86"] = 110,["87"] = 110,["88"] = 110,["89"] = 40,["90"] = 123,["91"] = 123,["92"] = 123,["93"] = 123,["94"] = 123,["95"] = 123,["96"] = 123,["97"] = 123,["98"] = 123,["99"] = 123,["100"] = 123,["101"] = 123,["102"] = 40,["103"] = 40,["104"] = 137,["105"] = 141,["106"] = 143,["107"] = 144,["108"] = 145});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {
    {
        id = "胶胶果实",
        class = "海上奇珍",
        passive = true,
        name = "胶胶果实",
        describe = "死亡后5秒复活，复活后拥有3秒无敌。可堆叠10个|n|cffcccccc 胶胶果实x20=【鲁灰】|r",
        icon = "物品图标\\胶胶果实.blp",
        goldCost = 1400,
        pawnable = true,
        stackMax = 10,
        destroyOnNoUses = true
    },
    {
        id = "杀敌抽奖",
        class = "海上奇珍",
        passive = true,
        name = "杀敌抽奖",
        describe = "消耗杀敌数随机获得一些属性或装备奖励！\n",
        icon = "图标\\核心部件\\18杀敌抽奖.blp",
        goldCost = 0,
        pawnable = false
    },
    {
        id = "修炼",
        class = "海上奇珍",
        passive = true,
        name = "修炼",
        describe = "奖励三选一，选完进入下一层",
        icon = "图标\\核心部件\\19金币.blp",
        goldCost = 0,
        pawnable = false
    },
    {
        id = "核心部件",
        class = "海上奇珍",
        passive = true,
        name = "核心部件",
        describe = "随机获得一个核心部件！\n点击可以消耗金币强化\n每次强化可以获得括号后面的数值增长\n11-12级强化失败有几率回退到1级\n13-15级强化失败有几率回退到10级",
        icon = "图标\\核心部件\\14奇珍商店.blp",
        goldCost = 0,
        lumberCost = 1,
        pawnable = false
    },
    {
        id = "吞天石",
        class = "海上奇珍",
        passive = false,
        name = "吞天石",
        describe = "可以吞噬任意东西,比如物品、天赋、技能、主炮。\n宝宝使用此物品可以复制吞噬队友的天赋技能、主炮。\n(部分特殊效果不会生效：比如允许上岸，允许普通攻击)\n基础吞噬上限2。",
        icon = "图标\\存档\\吞天石.blp",
        targetType = "无目标",
        goldCost = 50000,
        pawnable = false,
        stackMax = 10,
        destroyOnNoUses = true
    },
    {
        id = "船长信件",
        class = "海上奇珍",
        passive = false,
        name = "船长信件",
        describe = "可以吞噬一个船长道具。吞噬上限2",
        icon = "图标\\核心部件\\17船长信件.blp",
        targetType = "物品",
        goldCost = 200000,
        pawnable = false,
        stackMax = 10,
        destroyOnNoUses = true
    },
    {
        id = "改造设计图",
        class = "海上奇珍",
        passive = false,
        name = "改造设计图",
        describe = "对核心部件进行改造\n|cffcccccc(核心部件在难度4以上海上奇珍木材抽奖获得)",
        icon = "图标\\核心部件\\15改造设计图.blp",
        targetType = "物品",
        lumberCost = 1,
        pawnable = true,
        stackMax = 10,
        destroyOnNoUses = true
    },
    {
        id = "天工图",
        class = "海上奇珍",
        passive = false,
        name = "天工图",
        describe = "对核心部件强化时100%成功\n|cffcccccc(核心部件在难度4以上海上奇珍木材抽奖获得)",
        icon = "图标\\核心部件\\16天工图.blp",
        targetType = "物品",
        lumberCost = 1,
        pawnable = true,
        stackMax = 10,
        destroyOnNoUses = true
    }
}
____exports["d_海上奇珍物品"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
