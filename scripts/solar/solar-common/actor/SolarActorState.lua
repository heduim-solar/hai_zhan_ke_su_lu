local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 12,["30"] = 12,["31"] = 13,["32"] = 13,["33"] = 14,["34"] = 14,["35"] = 15,["36"] = 15,["37"] = 17,["38"] = 17,["39"] = 17,["41"] = 21,["42"] = 22,["45"] = 26,["46"] = 27,["47"] = 29,["48"] = 30,["49"] = 31,["50"] = 32,["51"] = 33,["52"] = 34,["53"] = 36,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 39,["58"] = 37,["59"] = 37,["61"] = 43,["62"] = 44,["63"] = 45,["64"] = 46,["67"] = 50,["69"] = 44,["72"] = 20,["73"] = 58,["74"] = 59,["75"] = 61,["76"] = 62,["77"] = 63,["78"] = 64,["79"] = 65,["81"] = 65,["85"] = 59,["86"] = 70,["87"] = 72,["88"] = 73,["89"] = 74,["90"] = 75,["91"] = 76,["93"] = 76,["97"] = 80,["98"] = 82,["99"] = 83,["100"] = 84,["101"] = 85,["102"] = 86,["104"] = 86,["109"] = 70,["110"] = 92,["111"] = 94,["112"] = 95,["113"] = 96,["114"] = 97,["116"] = 97,["120"] = 92,["121"] = 102,["122"] = 104,["123"] = 105,["124"] = 106,["125"] = 107,["126"] = 108,["128"] = 108,["132"] = 102,["133"] = 113,["134"] = 115,["135"] = 116,["136"] = 117,["137"] = 118,["138"] = 119,["140"] = 119,["144"] = 113,["145"] = 124,["146"] = 124,["147"] = 124,["148"] = 126,["149"] = 127,["150"] = 128,["151"] = 129,["152"] = 130,["154"] = 130,["156"] = 131,["158"] = 131,["163"] = 124,["164"] = 124,["165"] = 137,["166"] = 137,["167"] = 137,["168"] = 139,["169"] = 140,["170"] = 141,["171"] = 142,["172"] = 143,["174"] = 143,["176"] = 144,["178"] = 144,["183"] = 137,["184"] = 137,["185"] = 150,["186"] = 150,["187"] = 150,["188"] = 151,["189"] = 152,["190"] = 153,["193"] = 156,["195"] = 156,["196"] = 156,["197"] = 156,["198"] = 156,["199"] = 156,["200"] = 156,["201"] = 156,["203"] = 150,["204"] = 150,["205"] = 158,["206"] = 158,["207"] = 158,["208"] = 159,["209"] = 160,["210"] = 161,["214"] = 164,["215"] = 164,["217"] = 164,["218"] = 164,["219"] = 164,["220"] = 164,["221"] = 164,["222"] = 164,["223"] = 164,["225"] = 158,["226"] = 158,["227"] = 58,["228"] = 173,["229"] = 174,["230"] = 176,["231"] = 177,["232"] = 178,["233"] = 179,["234"] = 181,["235"] = 182,["237"] = 182,["240"] = 185,["241"] = 186,["242"] = 187,["244"] = 187,["249"] = 192,["250"] = 193,["251"] = 194,["252"] = 195,["253"] = 196,["255"] = 196,["258"] = 198,["259"] = 199,["260"] = 200,["262"] = 200,["268"] = 174,["269"] = 173});
local ____exports = {}
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____SolarActorUnitState = require("solar.solar-common.actor.state.SolarActorUnitState")
local SolarActorUnitState = ____SolarActorUnitState.default
local ____SolarActorItemState = require("solar.solar-common.actor.state.SolarActorItemState")
local SolarActorItemState = ____SolarActorItemState.default
local ____SolarActorAbilityState = require("solar.solar-common.actor.state.SolarActorAbilityState")
local SolarActorAbilityState = ____SolarActorAbilityState.default
local ____SolarActorBuffState = require("solar.solar-common.actor.state.SolarActorBuffState")
local SolarActorBuffState = ____SolarActorBuffState.default
local ____SolarActorAttributeState = require("solar.solar-common.actor.state.SolarActorAttributeState")
local SolarActorAttributeState = ____SolarActorAttributeState.default
local ____SolarActorFrameState = require("solar.solar-common.actor.state.SolarActorFrameState")
local SolarActorFrameState = ____SolarActorFrameState.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MessageUtil = require("solar.solar-common.util.system.MessageUtil")
local MessageUtil = ____MessageUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
____exports.default = __TS__Class()
local SolarActorState = ____exports.default
SolarActorState.name = "SolarActorState"
function SolarActorState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorState()")
        return
    end
    self:initActor()
    self:initActorSolarDamage()
    __TS__New(SolarActorUnitState)
    __TS__New(SolarActorItemState)
    __TS__New(SolarActorAbilityState)
    __TS__New(SolarActorBuffState)
    __TS__New(SolarActorAttributeState)
    __TS__New(SolarActorFrameState)
    if isEmbedJapi then
        BaseUtil.runLater(
            2.3,
            function()
                MessageUtil:_sl_init_message_hook()
            end
        )
    else
        if isEmbedJapi == false then
            InputUtil:onMouseLeftButtonReleased(function()
                if SolarActorFrameState.mouseFocusActor then
                    if SolarActorFrameState.mouseFocusActor:isDisable() or SolarActorFrameState.mouseFocusActor:isHide() then
                        return
                    end
                    SolarActorFrameState.mouseFocusActor:localClick(1, 0, 0)
                end
            end)
        end
    end
end
function SolarActorState.prototype.initActor(self)
    se:onUnitAttacked(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        if actorList ~= nil and #actorList > 0 then
            local uArg = GetAttacker()
            for ____, actor in ipairs(actorList) do
                local ____opt_0 = actor:get("onUnitAttacked")
                if ____opt_0 ~= nil then
                    ____opt_0(nil, actor, uArg)
                end
            end
        end
    end)
    se:onUnitDeath(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        local killingUnit = e.killingUnit
        if actorList ~= nil and #actorList > 0 then
            for ____, actor in ipairs(actorList) do
                local ____opt_2 = actor:get("onUnitDeath")
                if ____opt_2 ~= nil then
                    ____opt_2(nil, actor, killingUnit)
                end
            end
        end
        if IsHandle(killingUnit) then
            local actorList = ActorUtil:getUnitAllActorList(killingUnit)
            if actorList ~= nil and #actorList > 0 then
                local uArg = e.trigUnit
                for ____, actor in ipairs(actorList) do
                    local ____opt_4 = actor:get("onUnitKillEnemy")
                    if ____opt_4 ~= nil then
                        ____opt_4(nil, actor, uArg)
                    end
                end
            end
        end
    end)
    se:onHeroLevelUp(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        if actorList ~= nil and #actorList > 0 then
            for ____, actor in ipairs(actorList) do
                local ____opt_6 = actor:get("onUnitLevelChange")
                if ____opt_6 ~= nil then
                    ____opt_6(nil, actor, 1)
                end
            end
        end
    end)
    se:onUnitSpellEffect(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        if actorList ~= nil and #actorList > 0 then
            local idStr = e.spellAbilityIdStr
            for ____, actor in ipairs(actorList) do
                local ____opt_8 = actor:get("onUnitSpell")
                if ____opt_8 ~= nil then
                    ____opt_8(nil, actor, idStr)
                end
            end
        end
    end)
    se:onUnitPickupItem(function(e)
        local actorList = ActorUtil:getUnitAllActorList(e.trigUnit)
        if actorList ~= nil and #actorList > 0 then
            local item = e.manipulatedItem
            for ____, actor in ipairs(actorList) do
                local ____opt_10 = actor:get("onUnitPickupItem")
                if ____opt_10 ~= nil then
                    ____opt_10(nil, actor, item)
                end
            end
        end
    end)
    se:on(
        "_sl_:单位获得演员",
        function(data)
            local actorList = ActorUtil:getUnitAllActorList(data.u)
            if actorList ~= nil and #actorList > 0 then
                for ____, actor in ipairs(actorList) do
                    if actor ~= data.a then
                        local ____opt_12 = actor:get("onUnitAddActor")
                        if ____opt_12 ~= nil then
                            ____opt_12(nil, actor, data.a)
                        end
                        local ____opt_14 = actor:get("onUnitActorsChange")
                        if ____opt_14 ~= nil then
                            ____opt_14(nil, actor, false, data.a)
                        end
                    end
                end
            end
        end
    )
    se:on(
        "_sl_:单位失去演员",
        function(data)
            local actorList = ActorUtil:getUnitAllActorList(data.u)
            if actorList ~= nil and #actorList > 0 then
                for ____, actor in ipairs(actorList) do
                    if actor ~= data.a then
                        local ____opt_16 = actor:get("onUnitRemoveActor")
                        if ____opt_16 ~= nil then
                            ____opt_16(nil, actor, data.a)
                        end
                        local ____opt_18 = actor:get("onUnitActorsChange")
                        if ____opt_18 ~= nil then
                            ____opt_18(nil, actor, true, data.a)
                        end
                    end
                end
            end
        end
    )
    SyncUtil.onSyncObjData(
        "_sl_:a:onClick",
        function(____, triggerPlayer, data)
            local actor = Actor.allActors[data.i]
            if actor == nil then
                log.errorWithTraceBack("本地点击的id未找到对应的演员!")
                return
            end
            local ____opt_20 = actor:get("onClick")
            if ____opt_20 ~= nil then
                ____opt_20(
                    nil,
                    actor,
                    data.b,
                    triggerPlayer,
                    actor.actorType
                )
            end
        end
    )
    SyncUtil.onSyncObjData(
        "_sl_:at:onClick",
        function(____, triggerPlayer, data)
            local actorType = ActorTypeUtil:getActorType(data.i)
            if actorType == nil then
                log.errorWithTraceBack("本地点击的id未找到对应的演员类型!")
                return
            end
            local ____this_23
            ____this_23 = actorType
            local ____opt_22 = ____this_23.onClick
            if ____opt_22 ~= nil then
                ____opt_22(
                    ____this_23,
                    nil,
                    data.b,
                    triggerPlayer,
                    actorType
                )
            end
        end
    )
end
function SolarActorState.prototype.initActorSolarDamage(self)
    SolarDamageState:addEventHandler(function(____, event)
        local unit0 = event.unit0
        local unit1 = event.unit1
        local actorList = ActorUtil:getUnitAllActorList(unit0)
        if actorList ~= nil and #actorList > 0 then
            for ____, actor in ipairs(actorList) do
                local ____opt_24 = actor:get("onUnitDamaged")
                if ____opt_24 ~= nil then
                    ____opt_24(nil, actor, unit1, event)
                end
            end
            if event.isAttack then
                for ____, actor in ipairs(actorList) do
                    local ____opt_26 = actor:get("onUnitAttackedDamage")
                    if ____opt_26 ~= nil then
                        ____opt_26(nil, actor, unit1, event)
                    end
                end
            end
        end
        if IsHandle(unit1) then
            actorList = ActorUtil:getUnitAllActorList(unit1)
            if actorList ~= nil and #actorList > 0 then
                for ____, actor in ipairs(actorList) do
                    local ____opt_28 = actor:get("onUnitDamageEnemy")
                    if ____opt_28 ~= nil then
                        ____opt_28(nil, actor, unit0, event)
                    end
                end
                if event.isAttack then
                    for ____, actor in ipairs(actorList) do
                        local ____opt_30 = actor:get("onUnitAttackDamageEnemy")
                        if ____opt_30 ~= nil then
                            ____opt_30(nil, actor, unit0, event)
                        end
                    end
                end
            end
        end
    end)
end
return ____exports
