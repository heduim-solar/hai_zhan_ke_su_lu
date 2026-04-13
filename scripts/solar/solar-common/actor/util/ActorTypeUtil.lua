local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 9,["13"] = 9,["14"] = 9,["16"] = 9,["17"] = 19,["18"] = 20,["19"] = 21,["20"] = 22,["22"] = 24,["24"] = 26,["25"] = 27,["26"] = 28,["29"] = 32,["30"] = 33,["31"] = 34,["32"] = 34,["34"] = 36,["36"] = 38,["37"] = 19,["38"] = 45,["39"] = 47,["40"] = 48,["42"] = 50,["43"] = 51,["45"] = 53,["46"] = 45,["47"] = 61,["48"] = 62,["49"] = 63,["50"] = 64,["52"] = 66,["53"] = 67,["54"] = 68,["56"] = 71,["57"] = 61,["58"] = 79,["59"] = 79,["60"] = 81,["61"] = 82,["62"] = 83,["63"] = 84,["64"] = 85,["65"] = 86,["69"] = 90,["70"] = 91,["71"] = 92,["74"] = 79,["75"] = 107,["76"] = 108,["79"] = 111,["80"] = 112,["81"] = 113,["84"] = 116,["85"] = 107,["86"] = 126,["87"] = 127,["90"] = 130,["91"] = 131,["92"] = 132,["95"] = 135,["96"] = 126,["97"] = 147,["98"] = 147,["99"] = 147,["101"] = 147,["102"] = 147,["104"] = 148,["105"] = 149,["106"] = 150,["107"] = 151,["109"] = 153,["110"] = 154,["111"] = 155,["112"] = 156,["113"] = 157,["114"] = 158,["116"] = 160,["117"] = 161,["119"] = 163,["120"] = 164,["122"] = 166,["123"] = 167,["125"] = 169,["126"] = 170,["128"] = 172,["129"] = 173,["130"] = 174,["131"] = 175,["132"] = 176,["133"] = 177,["134"] = 178,["136"] = 174,["138"] = 182,["139"] = 147,["140"] = 11});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorItem = require("solar.solar-common.actor.ActorItem")
local ActorItem = ____ActorItem.default
____exports.default = __TS__Class()
local ActorTypeUtil = ____exports.default
ActorTypeUtil.name = "ActorTypeUtil"
function ActorTypeUtil.prototype.____constructor(self)
end
function ActorTypeUtil.registerActorType(self, actorTypeIdOrActorType)
    local actorType = nil
    if type(actorTypeIdOrActorType) == "string" then
        actorType = {id = actorTypeIdOrActorType}
    else
        actorType = actorTypeIdOrActorType
    end
    if actorType.id == nil or actorType.id.length == 0 then
        print_r(actorType)
        log.errorWithTraceBack("ActorType id必须赋值！")
        return
    end
    if DataBase:getSolarActorType(actorType.id) == nil then
        DataBase:setSolarActorType(actorType.id, actorType)
        local ____exports_default_actorTypes_0 = ____exports.default.actorTypes
        ____exports_default_actorTypes_0[#____exports_default_actorTypes_0 + 1] = actorType
    else
        log.errorWithTraceBack((("不能重复注册ActorType:" .. tostring(actorType.id)) .. " -> ") .. tostring(actorType.name))
    end
    return actorType
end
function ActorTypeUtil.hasActorType(self, actorTypeId)
    if actorTypeId == nil or #actorTypeId == 0 then
        return false
    end
    if DataBase:getSolarActorType(actorTypeId) == nil then
        return false
    end
    return true
end
function ActorTypeUtil.getActorType(self, actorTypeId)
    if actorTypeId == nil then
        log.errorWithTraceBack("actorTypeId不能为null!")
        return nil
    end
    local actorType = DataBase:getSolarActorType(actorTypeId)
    if actorType == nil then
        log.errorWithTraceBack(((("不存在此演员类型id:" .. actorTypeId) .. " 请在获取时刻之前注册此id,当前获取时刻是:") .. tostring(_g_time / 1000)) .. "秒")
    end
    return actorType
end
function ActorTypeUtil.forAllActorTypes(self, callback, ...)
    local actorTypeClass = {...}
    local index = 0
    if actorTypeClass and #actorTypeClass > 0 then
        for ____, actorType in ipairs(____exports.default.actorTypes) do
            if __TS__ArrayIncludes(actorTypeClass, actorType.class) then
                callback(nil, actorType, index)
                index = index + 1
            end
        end
    else
        for ____, actorType in ipairs(____exports.default.actorTypes) do
            callback(nil, actorType, index)
            index = index + 1
        end
    end
end
function ActorTypeUtil.setUiEnable(self, actorTypeId, uiEnable, player)
    if player ~= nil and GetLocalPlayer() ~= player then
        return
    end
    local actorType = ____exports.default:getActorType(actorTypeId)
    if actorType == nil then
        print("设置未注册的Actor图标:" .. actorTypeId)
        return
    end
    actorType.uiEnable = uiEnable
end
function ActorTypeUtil.setTypeDescribe(self, actorTypeId, describe, player)
    if player ~= nil and GetLocalPlayer() ~= player then
        return
    end
    local actorType = ____exports.default:getActorType(actorTypeId)
    if actorType == nil then
        print("设置未注册的Actor提示:" .. actorTypeId)
        return
    end
    actorType.describe = describe
end
function ActorTypeUtil.registerActorTypeFromBaseItemType(self, itemTypeIdStr, baseData, bindItemAndActor)
    if baseData == nil then
        baseData = {}
    end
    if bindItemAndActor == nil then
        bindItemAndActor = false
    end
    local itemObjInfo = _g_objs.item[itemTypeIdStr]
    if itemObjInfo == nil then
        log.errorWithTraceBack("不存在此物品id:" .. itemTypeIdStr)
        return nil
    end
    baseData.id = itemTypeIdStr
    baseData.name = itemObjInfo.Tip
    baseData.icon = itemObjInfo.Art
    baseData.describe = itemObjInfo.Ubertip
    if itemObjInfo.file then
        baseData.model = itemObjInfo.file
    end
    if itemObjInfo.pawnable then
        baseData.pawnable = itemObjInfo.pawnable == "1"
    end
    if itemObjInfo.droppable then
        baseData.droppable = itemObjInfo.droppable == "1"
    end
    if itemObjInfo.goldcost then
        baseData.goldCost = math.floor(tonumber(itemObjInfo.goldcost))
    end
    if itemObjInfo.lumbercost then
        baseData.lumberCost = math.floor(tonumber(itemObjInfo.lumbercost))
    end
    ____exports.default:registerActorType(baseData)
    if bindItemAndActor then
        se:onUnitPickupItem(function(e)
            if e.manipulatedItemTypeIdStr == itemTypeIdStr then
                RemoveItem(e.manipulatedItem)
                local actorItem = __TS__New(ActorItem, itemTypeIdStr)
                UnitAddItem(e.trigUnit, actorItem.item)
            end
        end)
    end
    return baseData
end
ActorTypeUtil.actorTypes = {}
return ____exports
