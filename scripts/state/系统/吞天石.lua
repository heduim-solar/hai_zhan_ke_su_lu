local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 11,["25"] = 11,["26"] = 12,["27"] = 12,["28"] = 13,["29"] = 13,["30"] = 14,["31"] = 14,["32"] = 15,["33"] = 15,["34"] = 17,["35"] = 17,["36"] = 17,["38"] = 23,["39"] = 24,["40"] = 25,["41"] = 26,["42"] = 27,["45"] = 30,["46"] = 30,["47"] = 31,["48"] = 31,["49"] = 32,["50"] = 33,["51"] = 33,["52"] = 33,["53"] = 33,["54"] = 33,["57"] = 36,["58"] = 37,["59"] = 38,["60"] = 39,["61"] = 40,["62"] = 40,["63"] = 41,["64"] = 42,["67"] = 45,["68"] = 46,["69"] = 47,["72"] = 50,["74"] = 51,["75"] = 52,["77"] = 54,["80"] = 57,["81"] = 58,["85"] = 41,["87"] = 63,["88"] = 65,["90"] = 68,["91"] = 69,["93"] = 72,["94"] = 73,["96"] = 75,["97"] = 77,["98"] = 78,["100"] = 81,["101"] = 82,["103"] = 84,["104"] = 85,["107"] = 88,["108"] = 88,["109"] = 88,["110"] = 88,["111"] = 89,["113"] = 91,["114"] = 92,["115"] = 93,["120"] = 96,["121"] = 99,["122"] = 99,["123"] = 99,["124"] = 99,["125"] = 100,["128"] = 103,["129"] = 104,["130"] = 105,["133"] = 109,["134"] = 111,["135"] = 112,["138"] = 115,["139"] = 116,["141"] = 119,["142"] = 120,["143"] = 121,["144"] = 122,["145"] = 123,["146"] = 123,["147"] = 123,["148"] = 124,["149"] = 123,["150"] = 123,["151"] = 126,["152"] = 127,["153"] = 128,["156"] = 131,["157"] = 133,["158"] = 133,["159"] = 133,["160"] = 133,["161"] = 133,["162"] = 133,["163"] = 133,["164"] = 133,["165"] = 133,["166"] = 135,["167"] = 136,["168"] = 99,["169"] = 99,["170"] = 99,["171"] = 143,["172"] = 24,["173"] = 21,["174"] = 18});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____DialogUtil = require("solar.solar-common.util.game.DialogUtil")
local DialogUtil = ____DialogUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
local ____ActorBuff = require("solar.solar-common.actor.ActorBuff")
local ActorBuff = ____ActorBuff.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____ActorUnit = require("solar.solar-common.actor.ActorUnit")
local ActorUnit = ____ActorUnit.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
____exports.default = __TS__Class()
local _____541E_5929_77F3 = ____exports.default
_____541E_5929_77F3.name = "吞天石"
function _____541E_5929_77F3.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("吞天石")
    actorType.onAction = function(____, actor, x, y, targetUnit)
        local actorItem = actor
        local unitOwner = actor.unitOwner
        if not IsHandle(unitOwner) then
            return
        end
        local ____opt_0 = AttributeUtil:getPlayerAttribute(unitOwner, false)
        local _____6700_5927_541E_566C_6570_91CF = 2 + (____opt_0 and ____opt_0["吞天石吞噬上限"] or 0)
        local ____opt_2 = sd(nil, unitOwner, true)
        if (____opt_2 and ____opt_2["吞天石吞噬数量"] or 0) >= _____6700_5927_541E_566C_6570_91CF then
            actorItem:addUses(1)
            MouseFrameUtil:showFailText(
                "吞噬数量到达上限!" .. tostring(_____6700_5927_541E_566C_6570_91CF),
                1,
                unitOwner
            )
            return
        end
        local actorId = {}
        local actors = {}
        local unit = actor.unit
        local allActorList = ActorUtil:getUnitAllActorList(unit)
        local ____opt_4 = sd(nil, unitOwner)
        if (____opt_4 and ____opt_4.assistant) == actor.unit then
            PlayerUtil:forUsers(function(____, player)
                if player == unitOwner then
                    return
                end
                local hero = PlayerUtil:getHero(player)
                local allActorAbilityList = ActorAbilityUtil:getUnitActorAbilityList(hero)
                if allActorAbilityList == nil then
                    return
                end
                for ____, tempActor in ipairs(allActorAbilityList) do
                    do
                        if __TS__ArrayIncludes(actorId, tempActor.actorTypeId) then
                            goto __continue10
                        end
                        if #actorId > 9 then
                            return
                        end
                        actorId[#actorId + 1] = tempActor.actorTypeId
                        allActorList[#allActorList + 1] = tempActor
                    end
                    ::__continue10::
                end
            end)
        end
        actorId = {}
        for ____, tempActor in ipairs(allActorList) do
            do
                if __TS__ArrayIncludes(____exports.default.banTunShi, tempActor.actorTypeId) then
                    goto __continue14
                end
                if __TS__InstanceOf(tempActor, ActorUnit) then
                    goto __continue14
                end
                if __TS__InstanceOf(tempActor, ActorBuff) then
                    if tempActor:get("tag") == "进化继承" then
                        goto __continue14
                    end
                    if tempActor:get("uiShowType") and tempActor:get("uiShowType") ~= "单位状态栏" then
                        goto __continue14
                    end
                    if tempActor:get("class") ~= "基础" then
                        goto __continue14
                    end
                end
                if ActorBuffUtil:isUnitHasActorBuff(
                    MapUtil:getHeroByUnit(unit),
                    tempActor.actorTypeId
                ) then
                    goto __continue14
                end
                if tempActor ~= actor and tempActor:get("dur", 0) == 0 then
                    actors[#actors + 1] = tempActor
                    actorId[#actorId + 1] = tempActor:getName()
                end
            end
            ::__continue14::
        end
        actorId[#actorId + 1] = "|cffff0000取消"
        DialogUtil:show(
            actor.unitOwnerId,
            "吞天石吞噬选择:",
            function(____, index, text)
                if index >= #actors then
                    return
                end
                local heroByUnit = MapUtil:getHeroByUnit(unit)
                if not IsHandle(heroByUnit) then
                    BJDebugMsg("玩家英雄不存在！" .. tostring(GetUnitName(unit)))
                    return
                end
                local targetActor = actors[index + 1]
                if ActorBuffUtil:isUnitHasActorBuff(heroByUnit, targetActor.actorTypeId) then
                    MouseFrameUtil:showTipText("|cff00ff00不能重复吞噬!", 1, actor.unitOwner)
                    return
                end
                if targetActor.unitOwner == unitOwner then
                    targetActor:destroy()
                end
                local actorBuff = ActorBuffUtil:addActorBuff(heroByUnit, targetActor.actorTypeId)
                actorBuff:set("class", "吞噬")
                actorBuff:set("kind", "吞天石吞噬")
                actorBuff:set("tag", "进化继承")
                BaseUtil.runLater(
                    0.2,
                    function()
                        actorBuff.level = targetActor.level
                    end
                )
                if actor.extData then
                    for extDataKey in pairs(actor.extData) do
                        actorBuff.extData[extDataKey] = actor.extData[extDataKey]
                    end
                end
                MouseFrameUtil:showTipText("|cff00ff00吞噬成功!", 1, actor.unitOwner)
                TipFrameUtil:showIconMoveIntoAnimation(
                    targetActor:getIcon(),
                    0.55,
                    0.17,
                    0.08,
                    0.55,
                    0.5,
                    unitOwner
                )
                sd(nil, unitOwner)["吞天石吞噬数量"] = (sd(nil, unitOwner)["吞天石吞噬数量"] or 0) + 1
                actorItem:addUses(-1)
            end,
            table.unpack(actorId)
        )
        actorItem:addUses(1)
    end
end
_____541E_5929_77F3.banTunShi = {"重生十字章", "吞天石", "船长信件", "污染的航海器"}
return ____exports
