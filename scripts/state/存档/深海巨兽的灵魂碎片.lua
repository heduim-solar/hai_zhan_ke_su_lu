local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 11,["25"] = 11,["26"] = 11,["28"] = 19,["29"] = 19,["30"] = 19,["31"] = 20,["32"] = 19,["33"] = 19,["34"] = 18,["35"] = 25,["36"] = 27,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 34,["44"] = 35,["45"] = 36,["46"] = 37,["47"] = 38,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 39,["54"] = 35,["55"] = 44,["56"] = 45,["57"] = 46,["58"] = 46,["59"] = 46,["60"] = 46,["61"] = 46,["62"] = 47,["63"] = 48,["64"] = 49,["65"] = 50,["67"] = 44,["68"] = 25});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local _____6DF1_5EA6_6D77_57DF_5B58_6863 = require("xlsx.存档.深度海域存档")
local ____d__6DF1_5EA6_6D77_57DF_5B58_6863 = _____6DF1_5EA6_6D77_57DF_5B58_6863["d_深度海域存档"]
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
____exports.default = __TS__Class()
local _____6DF1_6D77_5DE8_517D_7684_7075_9B42_788E_7247 = ____exports.default
_____6DF1_6D77_5DE8_517D_7684_7075_9B42_788E_7247.name = "深海巨兽的灵魂碎片"
function _____6DF1_6D77_5DE8_517D_7684_7075_9B42_788E_7247.prototype.____constructor(self)
    BaseUtil.runLater(
        1,
        function()
            self:init()
        end
    )
end
function _____6DF1_6D77_5DE8_517D_7684_7075_9B42_788E_7247.prototype.init(self)
    local actorType = ActorTypeUtil:registerActorType({
        id = "深海巨兽的灵魂",
        class = "宝物",
        tag = "进化继承",
        icon = "ReplaceableTextures\\CommandButtons\\BTNCrushingWave.blp",
        describe = "每5秒，对周围400范围释放一次毁灭，造成攻击力x0.5的伤害 每多搜集5个，毁灭的伤害+20%，最大10级"
    })
    actorType.interval = 5
    actorType.onUnitInterval = function(____, actor)
        local damage = UnitStateUtil:calculateStateFormula({attack = 0.5}, actor.unit)
        damage = damage * (1 + 0.2 * actor.level)
        DamageRecordUtil:damageEnemyUnitsInRange(
            actor:getName(),
            actor.unit,
            actor:get("area", 400),
            damage
        )
        EffectUtil:addSpecialEffectAndDestroy("model\\基本技能\\海皇波塞冬基础技能.mdx", actor.unitX, actor.unitY, 1)
    end
    PlayerUtil:forUsers(function(____, player)
        local spCount = ArchiveUtil:get(player, ____d__6DF1_5EA6_6D77_57DF_5B58_6863[5].requireKey) or 0
        ActorTypeUtil:setTypeDescribe(
            ____d__6DF1_5EA6_6D77_57DF_5B58_6863[5].id,
            (("|cff00ff00当前数量:" .. tostring(spCount)) .. "|r|n") .. ____d__6DF1_5EA6_6D77_57DF_5B58_6863[5].describe,
            player
        )
        if spCount and spCount >= 15 then
            local hero = PlayerUtil:getHero(player)
            local actorBuff = ActorBuffUtil:addActorBuff(hero, "深海巨兽的灵魂")
            actorBuff.level = math.floor((spCount - 15) / 5) + 1
        end
    end)
end
return ____exports
