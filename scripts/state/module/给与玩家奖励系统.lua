local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 3,["7"] = 3,["8"] = 4,["9"] = 4,["10"] = 5,["11"] = 5,["12"] = 6,["13"] = 6,["14"] = 7,["15"] = 7,["16"] = 8,["17"] = 8,["18"] = 13,["19"] = 13,["20"] = 13,["22"] = 17,["23"] = 17,["24"] = 17,["25"] = 18,["26"] = 19,["27"] = 20,["28"] = 21,["31"] = 24,["32"] = 25,["33"] = 26,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 31,["39"] = 32,["40"] = 33,["41"] = 34,["42"] = 35,["43"] = 36,["44"] = 37,["45"] = 38,["46"] = 39,["47"] = 40,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 41,["54"] = 42,["55"] = 46,["56"] = 47,["57"] = 48,["60"] = 17,["61"] = 17,["62"] = 16,["63"] = 55,["64"] = 56,["65"] = 57,["66"] = 58,["68"] = 55,["69"] = 62,["70"] = 63,["71"] = 64,["72"] = 65,["73"] = 66,["74"] = 67,["75"] = 68,["77"] = 70,["79"] = 72,["80"] = 74,["81"] = 75,["82"] = 76,["84"] = 78,["85"] = 79,["86"] = 81,["89"] = 62,["90"] = 86,["91"] = 87,["92"] = 87,["93"] = 87,["94"] = 88,["95"] = 89,["96"] = 90,["97"] = 91,["98"] = 92,["99"] = 93,["100"] = 95,["102"] = 87,["103"] = 87,["104"] = 86});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
____exports.default = __TS__Class()
local _____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF = ____exports.default
_____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF.name = "给与玩家奖励系统"
function _____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF.prototype.____constructor(self)
    se:on(
        "给与玩家奖励",
        function(e)
            local player = Player(e.p)
            local rewardName = e.key
            local rewardVal = e.val
            if rewardVal == nil then
                return
            end
            if rewardName == "加金币" then
                PlayerUtil:addGoldState(player, rewardVal)
            elseif rewardName == "加木材" then
                PlayerUtil:addLumberState(player, rewardVal)
            elseif rewardName == "加人口" then
                PlayerUtil:addFoodCapState(player, rewardVal)
            elseif rewardName == "加属性" then
                AttributeUtil:addPlayerAttribute(player, rewardVal)
            elseif rewardName == "给buff" then
                self["给buff"](self, player, rewardVal)
            elseif rewardName == "给物品" then
                self["给物品"](self, player, rewardVal)
            elseif rewardName == "给英雄物品" then
                self["给英雄物品"](self, player, rewardVal)
            elseif rewardName == "加科技" then
                AddPlayerTechResearched(player, rewardVal, 1)
            elseif rewardName == "地图全亮" then
                CreateFogModifierRectBJ(
                    true,
                    player,
                    FOG_OF_WAR_VISIBLE,
                    GetPlayableMapRect()
                )
            elseif rewardName == "增加单位建造数量" then
                for unitId in pairs(rewardVal) do
                    local maxAllowed = GetPlayerTechMaxAllowed(player, unitId)
                    SetPlayerTechMaxAllowed(player, unitId, maxAllowed + rewardVal[unitId])
                end
            end
        end
    )
end
_____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF.prototype["给buff"] = function(self, player, rewardVal)
    local hero = SelectUtil.getAnHero(GetPlayerId(player))
    if IsHandle(hero) then
        ActorBuffUtil:addActorBuff(hero, rewardVal)
    end
end
_____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF.prototype["给物品"] = function(self, player, rewardVal)
    local whichStartLocation = GetPlayerStartLocation(player)
    local startLocX = GetStartLocationX(whichStartLocation)
    local startLocY = GetStartLocationY(whichStartLocation)
    local item = nil
    if ActorTypeUtil:hasActorType(rewardVal) then
        item = ActorItemUtil:createActorItem(rewardVal, startLocX, startLocY).item
    else
        item = CreateItem(rewardVal, startLocX, startLocY)
    end
    SetItemPlayer(item, player, false)
    local hero = SelectUtil.getAnHero(GetPlayerId(player))
    if IsHandle(hero) then
        UnitAddItem(hero, item)
    else
        local playerUnits = SelectUtil.getPlayerUnits(GetPlayerId(player))
        if #playerUnits > 0 then
            UnitAddItem(playerUnits[1], item)
        end
    end
end
_____7ED9_4E0E_73A9_5BB6_5956_52B1_7CFB_7EDF.prototype["给英雄物品"] = function(self, player, rewardVal)
    se:on(
        "选择英雄",
        function(hero)
            if GetOwningPlayer(hero) == player then
                local whichStartLocation = GetPlayerStartLocation(player)
                local startLocX = GetStartLocationX(whichStartLocation)
                local startLocY = GetStartLocationY(whichStartLocation)
                local item = CreateItem(rewardVal, startLocX, startLocY)
                SetItemPlayer(item, player, false)
                UnitAddItem(hero, item)
            end
        end
    )
end
return ____exports
