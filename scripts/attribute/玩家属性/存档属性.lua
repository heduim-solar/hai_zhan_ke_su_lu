local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 12,["24"] = 13,["25"] = 14,["28"] = 17,["29"] = 18,["31"] = 21,["32"] = 22,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 25,["37"] = 25,["38"] = 25,["39"] = 25,["41"] = 27,["42"] = 28,["43"] = 29,["44"] = 30,["46"] = 33,["47"] = 34,["48"] = 35,["49"] = 36,["50"] = 37,["51"] = 37,["52"] = 37,["53"] = 37,["54"] = 37,["56"] = 40,["57"] = 41,["58"] = 42,["59"] = 43,["61"] = 12,["62"] = 11,["63"] = 11,["64"] = 10});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
____exports.default = __TS__Class()
local _____5B58_6863_5C5E_6027 = ____exports.default
_____5B58_6863_5C5E_6027.name = "存档属性"
function _____5B58_6863_5C5E_6027.prototype.____constructor(self)
    BaseUtil.runLater(
        1.2,
        function()
            PlayerUtil:forUsers(function(____, player)
                local playerAttr = AttributeUtil:getPlayerAttribute(player, false)
                if playerAttr == nil then
                    return
                end
                if playerAttr["初始金币"] and playerAttr["初始金币"] > 0 then
                    PlayerUtil:addGoldState(player, playerAttr["初始金币"])
                end
                if playerAttr["初始船长信件"] and playerAttr["初始船长信件"] > 0 then
                    local ffsl = playerAttr["初始船长信件"]
                    if ffsl > 2 and ffsl > PlatUtil:getMapLevel(player) / 2 then
                        ffsl = math.floor(PlatUtil:getMapLevel(player) / 2)
                        PlayerUtil:message(
                            (("你有" .. tostring(playerAttr["初始吞天石"])) .. "初始船长信件,但发放数量受到地图等级/2的数量限制:实际发放") .. tostring(ffsl),
                            10,
                            player
                        )
                    end
                    local hero = PlayerUtil:getHero(player)
                    local actorItem = ActorItemUtil:addActorItemForUnit("船长信件", hero, ffsl)
                    actorItem:set("pawnable", true)
                    actorItem:set("goldCost", 100)
                end
                if playerAttr["初始吞天石"] and playerAttr["初始吞天石"] > 0 then
                    local ffsl = playerAttr["初始吞天石"]
                    if ffsl > 2 and ffsl > PlatUtil:getMapLevel(player) / 2 then
                        ffsl = math.floor(PlatUtil:getMapLevel(player) / 2)
                        PlayerUtil:message(
                            (("你有" .. tostring(playerAttr["初始吞天石"])) .. "初始吞天石,但发放数量受到地图等级/2的数量限制:实际发放") .. tostring(ffsl),
                            10,
                            player
                        )
                    end
                    local hero = PlayerUtil:getHero(player)
                    local actorItem = ActorItemUtil:addActorItemForUnit("吞天石", hero, ffsl)
                    actorItem:set("pawnable", true)
                    actorItem:set("goldCost", 100)
                end
            end)
        end
    )
end
return ____exports
