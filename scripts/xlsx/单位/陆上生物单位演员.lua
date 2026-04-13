local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 58,["8"] = 59,["9"] = 59,["10"] = 59,["11"] = 59,["12"] = 59,["13"] = 59,["14"] = 59,["15"] = 59,["16"] = 59,["17"] = 59,["18"] = 59,["19"] = 59,["20"] = 59,["21"] = 59,["22"] = 59,["23"] = 59,["24"] = 58,["25"] = 78,["26"] = 78,["27"] = 78,["28"] = 78,["29"] = 78,["30"] = 78,["31"] = 78,["32"] = 78,["33"] = 78,["34"] = 78,["35"] = 78,["36"] = 78,["37"] = 78,["38"] = 78,["39"] = 78,["40"] = 58,["41"] = 94,["42"] = 94,["43"] = 94,["44"] = 94,["45"] = 94,["46"] = 94,["47"] = 94,["48"] = 94,["49"] = 94,["50"] = 94,["51"] = 94,["52"] = 94,["53"] = 94,["54"] = 94,["55"] = 94,["56"] = 94,["57"] = 58,["58"] = 113,["59"] = 113,["60"] = 113,["61"] = 113,["62"] = 113,["63"] = 113,["64"] = 113,["65"] = 113,["66"] = 113,["67"] = 113,["68"] = 113,["69"] = 113,["70"] = 113,["71"] = 113,["72"] = 113,["73"] = 113,["74"] = 58,["75"] = 132,["76"] = 132,["77"] = 132,["78"] = 132,["79"] = 132,["80"] = 132,["81"] = 132,["82"] = 132,["83"] = 132,["84"] = 132,["85"] = 132,["86"] = 132,["87"] = 132,["88"] = 132,["89"] = 132,["90"] = 132,["91"] = 132,["92"] = 58,["93"] = 152,["94"] = 152,["95"] = 152,["96"] = 152,["97"] = 152,["98"] = 152,["99"] = 152,["100"] = 152,["101"] = 152,["102"] = 152,["103"] = 152,["104"] = 152,["105"] = 152,["106"] = 58,["107"] = 58,["108"] = 167,["109"] = 171,["110"] = 173,["111"] = 174,["112"] = 175});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.data = {
    {
        id = "强盗领主",
        class = "陆上生物",
        templateType = "近战力量英雄",
        name = "|cffff0000强盗领主",
        describe = "无敌：被攻击时无敌30秒，冷却45秒。\n中立：目标是中立单位，靠近目标身边125范围目标变为敌对。且在目标头上显示：靠近激活挑战。\n特殊：第二个BOSS死亡后会消失。",
        icon = "ReplaceableTextures\\CommandButtons\\BTNFrost.blp",
        moveType = "amph",
        moveSpeed = 350,
        maxLife = 150000,
        def = 50,
        damage = 15000,
        damageCd = 1,
        range = 175,
        model = "units\\creeps\\BanditLord\\BanditLord.mdx",
        bountyItems = {["船长之心-无敌学习书"] = 1}
    },
    {
        id = "农场",
        class = "陆上生物",
        templateType = "近战力量英雄",
        name = "|cffff0001农场",
        describe = "\n中立：目标是中立单位，靠近目标身边125范围目标变为敌对。且在目标头上显示：靠近激活挑战。\n被摧毁：被摧毁后，每秒刷新12个农民农民持续5秒后消失，每个农民击杀金币300，刷20秒。\n农民属性：2000生命值，护甲0。\n农民刷新完后，10分钟在原地会出现岛主。",
        icon = "ReplaceableTextures\\CommandButtons\\BTNFrost.blp",
        moveType = "amph",
        moveSpeed = 0,
        maxLife = 50000,
        def = 50,
        damage = 0,
        damageCd = 1,
        range = 0,
        model = "buildings\\human\\Farm\\Farm.mdx"
    },
    {
        id = "巫师",
        class = "陆上生物",
        templateType = "近战力量英雄",
        name = "|cffff0001巫师",
        describe = "中立：目标是中立单位，靠近目标身边125范围目标变为敌对。且在目标头上显示：靠近激活挑战。\n变羊：将目标变样5秒，冷却15秒。",
        icon = "ReplaceableTextures\\CommandButtons\\BTNFrost.blp",
        moveType = "amph",
        moveSpeed = 350,
        maxLife = 500000,
        def = 50,
        damage = 15000,
        damageCd = 1.25,
        range = 500,
        model = "units\\creeps\\RevenantOfTheWaves\\RevenantOfTheWaves.mdx",
        bountyItems = {["船长之心-变羊学习书"] = 1}
    },
    {
        id = "兽族酋长",
        class = "陆上生物",
        templateType = "近战力量英雄",
        name = "|cffff0001兽族酋长（高危）",
        describe = "中立：目标是中立单位，靠近目标身边125范围目标变为敌对。且在目标头上显示：靠近激活挑战。\n振奋：10秒内攻击+500%。冷却20秒。\n特殊：闪电链，造成攻击力x5的伤害，全地图弹射7次。（稍有不慎直接团灭）冷却30s。\n特殊：第三个BOSS死亡后会消失。",
        icon = "ReplaceableTextures\\CommandButtons\\BTNFrost.blp",
        moveType = "amph",
        moveSpeed = 350,
        maxLife = 1000000,
        def = 100,
        damage = 20000,
        damageCd = 1.25,
        range = 550,
        model = "units\\orc\\HeroTaurenChieftain\\HeroTaurenChieftain.mdx",
        bountyItems = {["船长之心-酋长学习书"] = 1}
    },
    {
        id = "岛主",
        class = "陆上生物",
        templateType = "近战力量英雄",
        name = "|cffff0001岛主",
        describe = "两栖，会不断追着打爆农场的人打。\n技能：攻击30%概率击晕0.5秒。",
        icon = "ReplaceableTextures\\CommandButtons\\BTNFrost.blp",
        moveType = "amph",
        moveSpeed = 300,
        maxLife = 50000,
        def = 100,
        damage = 100000,
        damageCd = 0.5,
        range = 175,
        modelScale = 4,
        model = "units\\demon\\FelgaurdBlue\\FelgaurdBlue.mdx",
        bountyItems = {["船长之心-岛主学习书"] = 1}
    },
    {
        id = "农民",
        class = "陆上生物",
        templateType = "近战单位",
        name = "|cffff0001农民",
        icon = "ReplaceableTextures\\CommandButtons\\BTNFrost.blp",
        moveType = "amph",
        maxLife = 2000,
        def = 0,
        damage = 10,
        damageCd = 1,
        model = "units\\human\\Peasant\\Peasant.mdx",
        bounty = 100
    }
}
____exports["d_陆上生物单位演员"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
end
return ____exports
