local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 12,["27"] = 12,["28"] = 12,["30"] = 23,["31"] = 24,["34"] = 28,["35"] = 28,["36"] = 28,["37"] = 29,["38"] = 28,["39"] = 28,["40"] = 22,["41"] = 37,["42"] = 38,["43"] = 39,["46"] = 42,["47"] = 43,["50"] = 47,["51"] = 48,["52"] = 49,["53"] = 50,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 51,["60"] = 55,["61"] = 56,["62"] = 57,["63"] = 58,["64"] = 59,["65"] = 60,["66"] = 61,["67"] = 61,["68"] = 61,["69"] = 61,["70"] = 61,["71"] = 61,["72"] = 61,["74"] = 63,["80"] = 70,["81"] = 71,["82"] = 72,["83"] = 73,["84"] = 74,["85"] = 75,["86"] = 75,["87"] = 75,["88"] = 75,["89"] = 76,["90"] = 77,["91"] = 77,["92"] = 77,["93"] = 77,["94"] = 77,["95"] = 77,["96"] = 77,["97"] = 77,["99"] = 79,["100"] = 79,["101"] = 79,["102"] = 79,["103"] = 79,["104"] = 79,["105"] = 79,["106"] = 79,["112"] = 38,["113"] = 37,["114"] = 13});
local ____exports = {}
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
local ____UnitRewardUtil = require("solar.solar-common.util.unit.UnitRewardUtil")
local UnitRewardUtil = ____UnitRewardUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ItemUtil = require("solar.solar-common.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local SolarActorUnitState = ____exports.default
SolarActorUnitState.name = "SolarActorUnitState"
function SolarActorUnitState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorUnitState()")
        return
    end
    BaseUtil.runLater(
        2,
        function()
            ____exports.default:openBounty()
        end
    )
end
function SolarActorUnitState.openBounty(self)
    se:onUnitDeath(function(e)
        if not e.hasKillingUnit then
            return
        end
        local actorUnit = ActorUnitUtil:getActorUnit(e.trigUnit)
        if actorUnit == nil then
            return
        end
        if ____exports.default.config.openBounty then
            local bounty = actorUnit:get("bounty")
            if bounty and bounty > 0 then
                local earnGold = UnitRewardUtil:addGoldWithEarnGoldP(e.killingUnit, bounty)
                TextTagUtil.textGold(
                    "+" .. tostring(earnGold),
                    e.trigUnit
                )
            end
        end
        if ____exports.default.config.openBountyItems then
            local bountyItems = actorUnit:get("bountyItems")
            if bountyItems then
                for itemId in pairs(bountyItems) do
                    if RandomUtil.isInChance(bountyItems[itemId]) then
                        if DataBase:getSolarActorType(itemId) == nil then
                            ItemUtil:createItems(
                                itemId,
                                e.trigUnitX,
                                e.trigUnitY,
                                1,
                                e.killingUnitOwnerId
                            )
                        else
                            ActorItemUtil:createActorItem(itemId, e.trigUnitX, e.trigUnitY, e.killingUnitOwner)
                        end
                    end
                end
            end
        end
        if ____exports.default.config.openAfterDeathBirthUnits then
            local afterDeathBirthUnits = actorUnit:get("afterDeathBirthUnits")
            if afterDeathBirthUnits then
                for unitId in pairs(afterDeathBirthUnits) do
                    if RandomUtil.isInChance(afterDeathBirthUnits[unitId]) then
                        local count = math.max(
                            math.floor(afterDeathBirthUnits[unitId]),
                            1
                        )
                        if DataBase:getSolarActorType(unitId) == nil then
                            UnitUtil.createUnit(
                                e.trigUnitOwner,
                                unitId,
                                e.trigUnitX,
                                e.trigUnitY,
                                0,
                                count
                            )
                        else
                            ActorUnitUtil:createActorUnit(
                                e.trigUnitOwner,
                                unitId,
                                e.trigUnitX,
                                e.trigUnitY,
                                0,
                                count
                            )
                        end
                    end
                end
            end
        end
    end)
end
SolarActorUnitState.config = {openBounty = true, openBountyItems = true, openAfterDeathBirthUnits = true}
return ____exports
