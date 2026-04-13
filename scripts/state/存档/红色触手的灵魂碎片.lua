local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["28"] = 15,["29"] = 15,["30"] = 15,["31"] = 16,["32"] = 15,["33"] = 15,["34"] = 14,["35"] = 21,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 23,["43"] = 30,["44"] = 33,["45"] = 34,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 36,["50"] = 37,["51"] = 38,["52"] = 35,["53"] = 35,["55"] = 33,["56"] = 44,["57"] = 45,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 46,["62"] = 46,["63"] = 47,["64"] = 48,["65"] = 49,["67"] = 44,["68"] = 21});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
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
____exports.default = __TS__Class()
local _____7EA2_8272_89E6_624B_7684_7075_9B42_788E_7247 = ____exports.default
_____7EA2_8272_89E6_624B_7684_7075_9B42_788E_7247.name = "红色触手的灵魂碎片"
function _____7EA2_8272_89E6_624B_7684_7075_9B42_788E_7247.prototype.____constructor(self)
    BaseUtil.runLater(
        1,
        function()
            self:init()
        end
    )
end
function _____7EA2_8272_89E6_624B_7684_7075_9B42_788E_7247.prototype.init(self)
    local actorType = ActorTypeUtil:registerActorType({
        id = "红色触手的灵魂",
        class = "宝物",
        tag = "进化继承",
        icon = "ReplaceableTextures\\CommandButtons\\BTNTentacle.blp",
        describe = "全属性+20，主炮造成伤害时有30%的概率使用触手击晕目标1秒并且造成10000的额外伤害(内置15秒cd)"
    })
    actorType.attribute = {full_property = 20}
    actorType.onUnitDamageEnemy = function(____, actor, enemy, event)
        if RandomUtil.isInChance(0.3) then
            actor:ifReady(
                15,
                function()
                    UnitStateUtil:stunUnit(enemy, 1)
                    event.resultDamage = event.resultDamage + 10000
                    TextTagUtil.textWarn("红色触手", enemy)
                end
            )
        end
    end
    PlayerUtil:forUsers(function(____, player)
        local spCount = ArchiveUtil:get(player, ____d__6DF1_5EA6_6D77_57DF_5B58_6863[1].requireKey) or 0
        ActorTypeUtil:setTypeDescribe(
            ____d__6DF1_5EA6_6D77_57DF_5B58_6863[1].id,
            (("|cff00ff00当前数量:" .. tostring(spCount)) .. "|r|n") .. ____d__6DF1_5EA6_6D77_57DF_5B58_6863[1].describe,
            player
        )
        if spCount and spCount >= 10 then
            local hero = PlayerUtil:getHero(player)
            local actorBuff = ActorBuffUtil:addActorBuff(hero, "红色触手的灵魂")
        end
    end)
end
return ____exports
