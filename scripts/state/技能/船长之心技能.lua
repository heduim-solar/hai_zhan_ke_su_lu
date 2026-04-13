local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 10,["23"] = 10,["24"] = 10,["26"] = 16,["27"] = 16,["28"] = 17,["29"] = 17,["30"] = 17,["31"] = 17,["32"] = 17,["33"] = 17,["34"] = 17,["35"] = 17,["36"] = 17,["37"] = 17,["38"] = 17,["39"] = 28,["40"] = 29,["41"] = 30,["42"] = 31,["43"] = 17,["44"] = 17,["45"] = 16,["46"] = 16,["47"] = 16,["48"] = 39,["49"] = 40,["50"] = 41,["51"] = 42,["52"] = 43,["53"] = 44,["54"] = 44,["55"] = 44,["56"] = 45,["57"] = 44,["58"] = 44,["59"] = 47,["61"] = 41,["62"] = 53,["63"] = 54,["64"] = 55,["65"] = 55,["66"] = 55,["67"] = 55,["68"] = 56,["69"] = 55,["70"] = 55,["71"] = 54,["72"] = 63,["73"] = 63,["74"] = 63,["75"] = 63,["76"] = 63,["77"] = 63,["78"] = 63,["79"] = 73,["80"] = 74,["81"] = 75,["82"] = 75,["83"] = 76,["84"] = 75,["85"] = 75,["86"] = 75,["87"] = 78,["88"] = 74,["89"] = 13});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____VestAbilityUtil = require("solar.solar-common.util.unit.VestAbilityUtil")
local VestAbilityUtil = ____VestAbilityUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
____exports.default = __TS__Class()
local _____8239_957F_4E4B_5FC3_6280_80FD = ____exports.default
_____8239_957F_4E4B_5FC3_6280_80FD.name = "船长之心技能"
function _____8239_957F_4E4B_5FC3_6280_80FD.prototype.____constructor(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            ActorTypeUtil:registerActorType({
                id = actorType.id .. "学习书",
                name = actorType.name,
                icon = actorType.icon,
                class = actorType.class .. "学习书",
                describe = actorType.describe,
                model = "Objects\\InventoryItems\\tomeBrown\\tomeBrown.mdx",
                targetType = "无目标",
                passive = false,
                uses = 1,
                destroyOnNoUses = true,
                onAction = function(____, actor)
                    ActorAbilityUtil:destroyUnitAllActorAbility(actor.unit, "船长之心")
                    ActorAbilityUtil:createActorAbility(actorType.id, actor.unit, 6)
                    actor:destroy()
                end
            })
        end,
        "船长之心"
    )
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("船长之心-无敌")
    actorType.onAction = function(____, actor)
        if not UnitStateUtil:isInvulnerable(actor.unit) then
            UnitStateUtil:setInvulnerable(actor.unit, true)
            BaseUtil.runLater(
                2,
                function()
                    UnitStateUtil:setInvulnerable(actor.unit, false)
                end
            )
            TextTagUtil.textInfo("无敌", actor.unit)
        end
    end
    actorType = ActorTypeUtil:getActorType("船长之心-变羊")
    actorType.onAction = function(____, actor)
        SelectUtil.forEnemyUnitsInRange(
            actor.unit,
            400,
            function(____, unit)
                VestAbilityUtil:polymorph(unit, 5)
            end
        )
    end
    ActorTypeUtil:registerActorType({
        id = "船长之心-酋长Buff",
        name = "酋长",
        icon = "ReplaceableTextures\\CommandButtons\\BTNBloodLustOn.blp",
        attribute = {attack_p = 5},
        dur = 10
    })
    actorType = ActorTypeUtil:getActorType("船长之心-酋长")
    actorType.onAction = function(____, actor)
        SelectUtil.forAllEnemyUnits(
            function(____, unit)
                ActorBuffUtil:addActorBuff(unit, "船长之心-酋长Buff")
            end,
            Player(11)
        )
        TextTagUtil.textInfo("船长之心-酋长", actor.unit)
    end
end
return ____exports
