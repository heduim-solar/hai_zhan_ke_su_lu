local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 10,["23"] = 10,["24"] = 10,["26"] = 20,["27"] = 20,["28"] = 20,["29"] = 21,["30"] = 20,["31"] = 20,["32"] = 19,["33"] = 27,["34"] = 29,["35"] = 29,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 29,["40"] = 29,["41"] = 36,["42"] = 37,["43"] = 38,["44"] = 39,["46"] = 36,["47"] = 44,["48"] = 45,["49"] = 46,["50"] = 46,["51"] = 46,["52"] = 46,["53"] = 46,["54"] = 47,["55"] = 48,["56"] = 49,["57"] = 50,["59"] = 44,["60"] = 27});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local _____6DF1_5EA6_6D77_57DF_5B58_6863 = require("xlsx.存档.深度海域存档")
local ____d__6DF1_5EA6_6D77_57DF_5B58_6863 = _____6DF1_5EA6_6D77_57DF_5B58_6863["d_深度海域存档"]
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
____exports.default = __TS__Class()
local _____53E4_8001_8005_7684_7075_9B42_788E_7247 = ____exports.default
_____53E4_8001_8005_7684_7075_9B42_788E_7247.name = "古老者的灵魂碎片"
function _____53E4_8001_8005_7684_7075_9B42_788E_7247.prototype.____constructor(self)
    BaseUtil.runLater(
        1,
        function()
            self:init()
        end
    )
end
function _____53E4_8001_8005_7684_7075_9B42_788E_7247.prototype.init(self)
    local actorType = ActorTypeUtil:registerActorType({
        id = "古老者的灵魂",
        class = "宝物",
        tag = "进化继承",
        icon = "ReplaceableTextures\\CommandButtons\\BTNDestroyer.blp",
        describe = "杀敌有30%概率全属性+1，每多搜集5个，概率+10%，只有5级"
    })
    actorType.onUnitKillEnemy = function(____, actor, enemy)
        local c = 0.3 + 0.1 * actor.level
        if RandomUtil.isInChance(c) then
            HeroUtil:addHeroProperty(actor.unit, 1)
        end
    end
    PlayerUtil:forUsers(function(____, player)
        local spCount = ArchiveUtil:get(player, ____d__6DF1_5EA6_6D77_57DF_5B58_6863[8].requireKey) or 0
        ActorTypeUtil:setTypeDescribe(
            ____d__6DF1_5EA6_6D77_57DF_5B58_6863[8].id,
            (("|cff00ff00当前数量:" .. tostring(spCount)) .. "|r|n") .. ____d__6DF1_5EA6_6D77_57DF_5B58_6863[8].describe,
            player
        )
        if spCount and spCount >= 25 then
            local hero = PlayerUtil:getHero(player)
            local actorBuff = ActorBuffUtil:addActorBuff(hero, "古老者的灵魂")
            actorBuff.level = math.floor((spCount - 25) / 5) + 1
        end
    end)
end
return ____exports
