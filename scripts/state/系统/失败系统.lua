local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 8,["19"] = 8,["20"] = 8,["22"] = 12,["23"] = 13,["26"] = 16,["27"] = 17,["30"] = 20,["31"] = 21,["34"] = 24,["35"] = 12,["36"] = 11,["37"] = 32,["38"] = 33,["39"] = 34,["40"] = 35,["41"] = 36,["44"] = 39,["45"] = 40,["46"] = 41,["47"] = 44,["48"] = 45,["49"] = 46,["50"] = 47,["51"] = 48,["53"] = 34,["54"] = 52,["55"] = 54,["56"] = 54,["57"] = 54,["58"] = 55,["59"] = 56,["60"] = 57,["61"] = 58,["64"] = 61,["65"] = 62,["66"] = 63,["67"] = 66,["68"] = 67,["69"] = 68,["70"] = 69,["71"] = 70,["73"] = 56,["74"] = 73,["75"] = 74,["77"] = 54,["78"] = 54,["80"] = 32});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
____exports.default = __TS__Class()
local _____5931_8D25_7CFB_7EDF = ____exports.default
_____5931_8D25_7CFB_7EDF.name = "失败系统"
function _____5931_8D25_7CFB_7EDF.prototype.____constructor(self)
    se:onUnitDeath(function(e, solarTrigger)
        if e.trigUnitOwnerId > 3 then
            return
        end
        if settings.gameMode == MapModel["模式0_教学模式"] then
            solarTrigger:destroy()
            return
        end
        if gv["深度海域层数"] and gv["深度海域层数"] > 0 then
            solarTrigger:destroy()
            return
        end
        ____exports.default:checkDefeats()
    end)
end
function _____5931_8D25_7CFB_7EDF.checkDefeats(self)
    local isAllDead = true
    PlayerUtil:forPlayingPlayers(function(____, player)
        local hero = PlayerUtil:getHero(player)
        if not IsHandle(hero) then
            return
        end
        if UnitAlive(hero) then
            isAllDead = false
        elseif ActorUtil:isUnitHasActor(hero, "鲁灰") or ActorUtil:isUnitHasActor(hero, "尼卡·鲁灰") then
            isAllDead = false
        elseif ActorItemUtil:isUnitHasActorItem(hero, "胶胶果实") then
            isAllDead = false
        elseif ActorItemUtil:isUnitHasActorItem(hero, "重生十字章") then
            isAllDead = false
        end
    end)
    if isAllDead then
        BaseUtil.runLater(
            1,
            function()
                local isAllDead = true
                PlayerUtil:forPlayingPlayers(function(____, player)
                    local hero = PlayerUtil:getHero(player)
                    if not IsHandle(hero) then
                        return
                    end
                    if UnitAlive(hero) then
                        isAllDead = false
                    elseif ActorUtil:isUnitHasActor(hero, "鲁灰") or ActorUtil:isUnitHasActor(hero, "尼卡·鲁灰") then
                        isAllDead = false
                    elseif ActorItemUtil:isUnitHasActorItem(hero, "胶胶果实") then
                        isAllDead = false
                    elseif ActorItemUtil:isUnitHasActorItem(hero, "重生十字章") then
                        isAllDead = false
                    end
                end)
                if isAllDead then
                    GameUtil:defeats("船全部沉了!你们GG了!")
                end
            end
        )
    end
end
return ____exports
