local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 10,["23"] = 10,["24"] = 10,["26"] = 18,["27"] = 18,["28"] = 18,["29"] = 19,["30"] = 18,["31"] = 18,["32"] = 17,["33"] = 24,["34"] = 26,["35"] = 26,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 26,["41"] = 26,["42"] = 26,["43"] = 26,["44"] = 26,["45"] = 37,["46"] = 38,["47"] = 39,["48"] = 40,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 42,["54"] = 42,["55"] = 42,["56"] = 42,["57"] = 42,["58"] = 42,["59"] = 42,["60"] = 42,["61"] = 42,["63"] = 38,["64"] = 47,["65"] = 48,["66"] = 49,["67"] = 49,["68"] = 49,["69"] = 49,["70"] = 49,["71"] = 50,["72"] = 51,["73"] = 52,["74"] = 52,["75"] = 52,["76"] = 52,["77"] = 52,["78"] = 52,["79"] = 53,["80"] = 54,["81"] = 55,["82"] = 56,["83"] = 57,["84"] = 58,["85"] = 59,["86"] = 60,["87"] = 60,["89"] = 61,["90"] = 61,["91"] = 61,["92"] = 61,["93"] = 61,["94"] = 61,["95"] = 61,["96"] = 61,["97"] = 61,["99"] = 47,["100"] = 24});
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
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____GuardUtil = require("solar.solar-common.util.system.GuardUtil")
local GuardUtil = ____GuardUtil.default
____exports.default = __TS__Class()
local _____5927_526F_7684_7075_9B42_788E_7247 = ____exports.default
_____5927_526F_7684_7075_9B42_788E_7247.name = "大副的灵魂碎片"
function _____5927_526F_7684_7075_9B42_788E_7247.prototype.____constructor(self)
    BaseUtil.runLater(
        1,
        function()
            self:init()
        end
    )
end
function _____5927_526F_7684_7075_9B42_788E_7247.prototype.init(self)
    local actorType = ActorTypeUtil:registerActorType({
        id = "大副的灵魂",
        class = "基础",
        templateType = "远程单位",
        icon = "ReplaceableTextures\\CommandButtons\\BTNKelThuzad.blp",
        model = "units\\undead\\Kelthuzad\\Kelthuzad.mdx",
        colorR = 100,
        colorG = 100,
        colorB = 100,
        damageCd = 1
    })
    actorType.interval = 5
    actorType.onUnitInterval = function(____, actor)
        local hero = PlayerUtil:getHero(actor.unitOwner)
        if IsHandle(hero) then
            UnitStateUtil:setDamageBase(
                actor.unit,
                UnitStateUtil:getDamageMax(hero)
            )
            GuardUtil:resetGuard(
                actor.unit,
                hero,
                3,
                600,
                800,
                1500,
                5
            )
        end
    end
    PlayerUtil:forUsers(function(____, player)
        local spCount = ArchiveUtil:get(player, ____d__6DF1_5EA6_6D77_57DF_5B58_6863[7].requireKey) or 0
        ActorTypeUtil:setTypeDescribe(
            ____d__6DF1_5EA6_6D77_57DF_5B58_6863[7].id,
            (("|cff00ff00当前数量:" .. tostring(spCount)) .. "|r|n") .. ____d__6DF1_5EA6_6D77_57DF_5B58_6863[7].describe,
            player
        )
        if spCount and spCount >= 20 then
            local hero = PlayerUtil:getHero(player)
            local actorUnit = ActorUnitUtil:createActorUnit(
                player,
                "大副的灵魂",
                GetUnitX(hero),
                GetUnitY(hero)
            )
            local cd = 0.2 * math.floor((spCount - 20) / 5)
            cd = 1 - cd
            cd = math.max(0.3, cd)
            actorUnit:set("damageCd", cd)
            UnitAddAbility(actorUnit.unit, "Avul")
            UnitAddAbility(actorUnit.unit, "Aloc")
            UnitStateUtil:setDamageRange(actorUnit.unit, 200)
            if SetUnitPressUIVisible ~= nil then
                SetUnitPressUIVisible(actorUnit.unit, false)
            end
            GuardUtil:setGuard(
                actorUnit.unit,
                hero,
                3,
                600,
                800,
                1500,
                5
            )
        end
    end)
end
return ____exports
