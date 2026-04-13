local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 13,["29"] = 13,["30"] = 13,["32"] = 17,["33"] = 17,["34"] = 18,["35"] = 19,["36"] = 20,["37"] = 18,["38"] = 17,["39"] = 17,["40"] = 17,["41"] = 25,["42"] = 26,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 28,["47"] = 29,["48"] = 30,["49"] = 31,["51"] = 33,["52"] = 34,["54"] = 36,["55"] = 27,["56"] = 27,["58"] = 25,["59"] = 43,["60"] = 44,["61"] = 45,["62"] = 48,["63"] = 49,["64"] = 50,["65"] = 51,["66"] = 52,["67"] = 52,["68"] = 52,["69"] = 53,["70"] = 54,["71"] = 52,["72"] = 52,["74"] = 50,["75"] = 60,["76"] = 61,["77"] = 67,["78"] = 68,["79"] = 69,["80"] = 70,["81"] = 71,["82"] = 72,["83"] = 73,["84"] = 69,["85"] = 78,["86"] = 79,["87"] = 80,["88"] = 82,["89"] = 82,["90"] = 83,["91"] = 84,["92"] = 80,["93"] = 16});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local _____4E3B_70AE_5B58_6863ABC = require("state.存档.主炮存档ABC")
local _____4E3B_70AE_5B58_6863ABC = _____4E3B_70AE_5B58_6863ABC.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
____exports.default = __TS__Class()
local _____725B_5E01_9053_5177 = ____exports.default
_____725B_5E01_9053_5177.name = "牛币道具"
function _____725B_5E01_9053_5177.prototype.____constructor(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.onCreated = function(____, actor)
                actor:set("uiShowType", "宝物")
                actor:set("tag", "进化继承")
            end
        end,
        "商城"
    )
    PlayerUtil:forUsers(function(____, player)
        if PlatUtil:hasMallItem(player, "WZWD") then
            BaseUtil.onTimer(
                60,
                function(____, count)
                    local hero = PlayerUtil:getHero(player)
                    if count == 10 then
                        HeroUtil:addHeroPropertyP(hero, false, 0.1)
                        TextTagUtil.textSuccess("稳扎稳打+10%全属性", hero)
                    else
                        HeroUtil:addHeroProperty(hero, 30)
                        TextTagUtil.textSuccess("稳扎稳打+30全属性", hero)
                    end
                    return true
                end
            )
        end
    end)
    local actorType = ActorTypeUtil:getActorType("KZML")
    actorType.attribute = {move_speed = 300}
    actorType.dur = 180
    actorType = ActorTypeUtil:getActorType("YLBD")
    actorType.attribute = {def = 10}
    actorType.onUnitDamaged = function(____, actor, damageSource, event)
        if UnitUtil.isHero(damageSource) then
            actor:ifReady(
                300,
                function()
                    UnitStateUtil:addInvulnerableIfNot(actor.unit, 5)
                    TextTagUtil.textSuccess("屹立不倒-无敌5秒", actor.unit)
                end
            )
        end
    end
    actorType = ActorTypeUtil:getActorType("HLQK")
    actorType.attribute = {attack_p = 0.1, add_attack_on_kill = 1}
    actorType = ActorTypeUtil:getActorType("YGXW")
    actorType.attribute = {["存档掉率"] = 0.05, full_property_p = 0.5}
    actorType.onCreated = function(____, actor)
        actor:set("uiShowType", "宝物")
        actor:set("tag", "进化继承")
        actorType.attribute.full_property = _____4E3B_70AE_5B58_6863ABC["获取激活的存档设计图数量"](_____4E3B_70AE_5B58_6863ABC, actor.unitOwner, false)
        actor:setDescribe((actor.actorType.describe .. "|n|cff00ff00当前加属性:") .. tostring(actorType.attribute.full_property))
    end
    actorType = ActorTypeUtil:getActorType("CSZDCZ")
    actorType.attribute = {full_property_p = 1}
    actorType.onUnitActorsChange = function(____, actor)
        local ____opt_0 = ActorUtil:getUnitAllActorListByClass(actor.unit, "主炮")
        local zpCount = ____opt_0 and #____opt_0 or 0
        actor.attribute = {full_property_p = 1 + zpCount * 0.2}
        actor:setDescribe((actor.actorType.describe .. "|n|cff00ff00当前加全属性:") .. TextUtil:toPercentage(actorType.attribute.full_property_p))
    end
end
return ____exports
