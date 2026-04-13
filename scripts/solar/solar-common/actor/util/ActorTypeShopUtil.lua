local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 9,["23"] = 21,["24"] = 21,["25"] = 21,["27"] = 21,["28"] = 29,["29"] = 30,["32"] = 33,["33"] = 34,["34"] = 35,["35"] = 37,["36"] = 37,["37"] = 37,["38"] = 37,["39"] = 39,["40"] = 40,["41"] = 41,["42"] = 42,["43"] = 42,["44"] = 42,["45"] = 43,["46"] = 44,["48"] = 42,["49"] = 42,["52"] = 49,["53"] = 50,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 52,["58"] = 51,["59"] = 51,["62"] = 35,["63"] = 29,["64"] = 67,["65"] = 68,["66"] = 69,["67"] = 70,["68"] = 71,["69"] = 72,["71"] = 74,["72"] = 74,["73"] = 74,["74"] = 75,["75"] = 76,["76"] = 77,["77"] = 78,["78"] = 79,["80"] = 81,["81"] = 81,["82"] = 81,["83"] = 81,["84"] = 81,["85"] = 81,["86"] = 81,["87"] = 81,["88"] = 81,["89"] = 81,["90"] = 81,["91"] = 81,["92"] = 81,["93"] = 95,["94"] = 96,["95"] = 97,["96"] = 99,["98"] = 101,["99"] = 103,["101"] = 105,["102"] = 106,["103"] = 109,["104"] = 110,["105"] = 111,["106"] = 112,["108"] = 114,["109"] = 114,["110"] = 114,["111"] = 114,["112"] = 116,["113"] = 116,["114"] = 116,["115"] = 116,["116"] = 117,["118"] = 119,["119"] = 119,["120"] = 119,["121"] = 119,["122"] = 119,["123"] = 121,["124"] = 121,["125"] = 121,["126"] = 121,["127"] = 122,["129"] = 127,["130"] = 128,["131"] = 129,["132"] = 130,["133"] = 131,["137"] = 137,["138"] = 137,["139"] = 137,["140"] = 137,["141"] = 137,["142"] = 137,["143"] = 137,["144"] = 141,["145"] = 95,["146"] = 143,["147"] = 144,["148"] = 145,["150"] = 148,["151"] = 149,["152"] = 150,["153"] = 152,["155"] = 155,["156"] = 156,["158"] = 159,["162"] = 143,["163"] = 180,["164"] = 181,["165"] = 74,["166"] = 74,["167"] = 67,["168"] = 185,["169"] = 186,["170"] = 186,["171"] = 186,["172"] = 186,["173"] = 186,["174"] = 187,["175"] = 188,["176"] = 189,["177"] = 191,["179"] = 193,["181"] = 193,["184"] = 195,["186"] = 185,["187"] = 203,["188"] = 204,["191"] = 207,["192"] = 211,["193"] = 211,["194"] = 211,["195"] = 212,["196"] = 213,["197"] = 214,["200"] = 218,["201"] = 219,["203"] = 211,["204"] = 211,["205"] = 203,["206"] = 23,["207"] = 201});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local ____ActorFrameUtil = require("solar.solar-common.actor.util.ActorFrameUtil")
local ActorFrameUtil = ____ActorFrameUtil.default
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
____exports.default = __TS__Class()
local ActorTypeShopUtil = ____exports.default
ActorTypeShopUtil.name = "ActorTypeShopUtil"
function ActorTypeShopUtil.prototype.____constructor(self)
end
function ActorTypeShopUtil.autoDisableSellingAbilityOnNoStoreTarget(self, shopActorUnitTypeId)
    if GetStoreTarget == nil then
        return
    end
    local actorType = ActorTypeUtil:getActorType(shopActorUnitTypeId)
    actorType.interval = 1
    actorType.onUnitInterval = function(____, actor)
        local unit = GetStoreTarget(
            actor.unit,
            GetLocalPlayer()
        )
        if IsHandle(unit) then
            if actor.tempBool ~= true then
                actor.tempBool = true
                ActorAbilityUtil:forUnitActorAbilityList(
                    actor.unit,
                    function(____, actor)
                        if not actor:isDisable() then
                            actor:getRootFrameControl():getDisableFrame().visible = false
                        end
                    end
                )
            end
        else
            if actor.tempBool ~= false then
                actor.tempBool = false
                ActorAbilityUtil:forUnitActorAbilityList(
                    actor.unit,
                    function(____, actor)
                        actor:getRootFrameControl():getDisableFrame().visible = true
                    end
                )
            end
        end
    end
end
function ActorTypeShopUtil.warpActorItem2SellingAbility(self, actorItemTypeId)
    if GetStoreTarget == nil then
        local info = "|cffff0000无GetStoreTarget环境此API无效:" .. actorItemTypeId
        BJDebugMsg(info)
        log.errorWithTraceBack(info)
        return nil
    end
    return ____exports.default.cache:get(
        "warpActorItem2SellingAbility:" .. actorItemTypeId,
        function()
            ____exports.default:_sl_initBuyActorItem()
            local actorType = ActorTypeUtil:getActorType(actorItemTypeId)
            if actorType == nil then
                log.errorWithTraceBack("不存在此演员物品类型:" .. actorItemTypeId)
                return nil
            end
            local actorAbilityType = {
                id = "_sl_SellingAbility:" .. actorItemTypeId,
                class = "太阳演员物品技能售卖",
                name = actorType.name,
                icon = actorType.icon,
                disable = actorType.disable,
                requiredTip = actorType.requiredTip,
                describe = actorType.describe,
                goldCost = actorType.goldCost,
                lumberCost = actorType.lumberCost,
                manaCost = 0,
                maxCd = 0.2
            }
            actorAbilityType.onLocalClick = function(____, actor)
                local actorAbility = actor
                if actorAbility:getCooldown() > 0 then
                    return false
                end
                if _g_time - (actor.tempNum or 0) < 400 then
                    return false
                end
                actor.tempNum = _g_time
                local p = GetLocalPlayer()
                local unit = GetStoreTarget(actor.unit, p)
                if not IsHandle(unit) then
                    PlayerUtil:message("没有购买单位!请将需要购买物品的单位靠近此单位!", 10, p)
                    return false
                end
                if not PlayerUtil:hasEnoughState(
                    p,
                    actorAbility:get("goldCost")
                ) then
                    ActorFrameUtil:showTipText(
                        actor,
                        "|cffff0000金币不足,还差:" .. tostring(actorAbility:get("goldCost") - PlayerUtil:getGold(p))
                    )
                    return false
                end
                if not PlayerUtil:hasEnoughState(
                    p,
                    nil,
                    actorAbility:get("lumberCost")
                ) then
                    ActorFrameUtil:showTipText(
                        actor,
                        "|cffff0000木材不足,还差:" .. tostring(actorAbility:get("lumberCost") - PlayerUtil:getLumber(p))
                    )
                    return false
                end
                if actorAbility.numberOverlay then
                    if actorAbility.numberOverlay < 1 then
                        PlayerUtil:message("没有库存了!", 10, p)
                        ActorFrameUtil:showTipText(actor, "|cffff0000库存不足")
                        return false
                    else
                    end
                end
                SyncUtil.syncObjData(
                    "_sl_:buyActorItem",
                    {
                        i = actor.uuid,
                        u = h2i(unit)
                    }
                )
                return true
            end
            actorAbilityType.onAction = function(____, actorAbility)
                if actorAbility.numberOverlay then
                    actorAbility.numberOverlay = actorAbility.numberOverlay - 1
                end
                local issueOrderUnitSync = actorAbility.issueOrderUnitSync
                actorAbility.issueOrderUnitSync = nil
                if IsHandle(issueOrderUnitSync) then
                    ____exports.default:_sl_buyActorItemByActorAbility(actorAbility, issueOrderUnitSync, actorItemTypeId)
                else
                    if isEmbedJapi then
                        PlayerUtil:message("网络卡顿,请重新购买!")
                    else
                        print("网络卡顿,或购买资源不足!")
                    end
                    return
                end
            end
            ActorTypeUtil:registerActorType(actorAbilityType)
            return actorAbilityType
        end
    )
end
function ActorTypeShopUtil._sl_buyActorItemByActorAbility(self, actorAbility, issueOrderUnitSync, actorItemTypeId)
    if PlayerUtil:costEnoughState(
        GetOwningPlayer(issueOrderUnitSync),
        actorAbility:get("goldCost"),
        actorAbility:get("lumberCost")
    ) then
        local buyingUnit = issueOrderUnitSync
        local actorItem = ActorItemUtil:addActorItemForUnit(actorItemTypeId, buyingUnit)
        if actorItem:get("stackMax", 0) > 1 and actorItem:get("destroyOnNoUses") == true then
            actorItem:setUses(actorItem:get("uses", 1))
        end
        local ____opt_0 = actorItem:get("onBuy")
        if ____opt_0 ~= nil then
            ____opt_0(nil, actorItem, buyingUnit)
        end
    else
        log.errorWithTraceBack("购买物品的资源消耗不足！请保证技能校验资源与实际资源需求是一样的！")
    end
end
function ActorTypeShopUtil._sl_initBuyActorItem(self)
    if ____exports.default._sl_inited then
        return
    end
    ____exports.default._sl_inited = true
    SyncUtil.onSyncObjData(
        "_sl_:buyActorItem",
        function(____, p, obj)
            local actorAbility = Actor.allActors[obj.i]
            if actorAbility == nil then
                log.errorWithTraceBack("售卖技能演员为null!")
                return
            end
            if not IsHandle(actorAbility.issueOrderUnitSync) then
                actorAbility.issueOrderUnitSync = i2h(obj.u)
            end
        end
    )
end
ActorTypeShopUtil.cache = __TS__New(Cache)
ActorTypeShopUtil._sl_inited = false
return ____exports
