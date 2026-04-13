local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 13,["17"] = 13,["18"] = 13,["20"] = 13,["21"] = 19,["22"] = 20,["23"] = 20,["24"] = 21,["25"] = 22,["27"] = 20,["28"] = 19,["29"] = 30,["30"] = 31,["31"] = 31,["32"] = 32,["33"] = 33,["35"] = 31,["36"] = 30,["37"] = 41,["38"] = 42,["39"] = 42,["40"] = 43,["41"] = 44,["43"] = 42,["44"] = 41,["45"] = 60,["46"] = 61,["47"] = 62,["48"] = 63,["49"] = 64,["51"] = 67,["52"] = 68,["53"] = 69,["54"] = 71,["55"] = 72,["56"] = 73,["57"] = 74,["58"] = 74,["59"] = 74,["60"] = 75,["61"] = 74,["62"] = 74,["66"] = 81,["67"] = 82,["69"] = 85,["70"] = 85,["71"] = 85,["72"] = 85,["73"] = 85,["74"] = 85,["75"] = 85,["76"] = 60,["77"] = 95,["78"] = 96,["80"] = 97,["81"] = 97,["82"] = 98,["83"] = 99,["86"] = 102,["87"] = 103,["88"] = 104,["90"] = 106,["91"] = 97,["94"] = 108,["95"] = 95,["96"] = 116,["97"] = 117,["98"] = 117,["99"] = 116,["100"] = 126,["101"] = 127,["102"] = 127,["103"] = 126,["104"] = 137,["105"] = 138,["106"] = 138,["107"] = 139,["108"] = 140,["110"] = 137,["111"] = 148,["112"] = 149,["113"] = 150,["114"] = 148,["115"] = 158,["116"] = 159,["117"] = 161,["118"] = 162,["119"] = 163,["120"] = 164,["121"] = 165,["122"] = 166,["123"] = 167,["127"] = 161,["129"] = 174,["130"] = 175,["131"] = 176,["132"] = 177,["133"] = 178,["136"] = 174,["138"] = 158,["139"] = 189,["140"] = 190,["141"] = 191,["144"] = 194,["145"] = 195,["146"] = 196,["147"] = 197,["148"] = 198,["149"] = 199,["153"] = 203,["154"] = 189,["155"] = 209,["156"] = 210,["157"] = 211,["160"] = 214,["161"] = 215,["162"] = 216,["163"] = 217,["164"] = 218,["168"] = 209,["169"] = 230,["170"] = 231,["172"] = 231,["174"] = 230,["175"] = 239,["176"] = 239,["177"] = 239,["179"] = 240,["180"] = 241,["183"] = 244,["184"] = 245,["185"] = 246,["186"] = 246,["187"] = 247,["190"] = 250,["192"] = 250,["196"] = 239,["197"] = 261,["198"] = 262,["199"] = 263,["202"] = 266,["203"] = 267,["204"] = 268,["205"] = 268,["206"] = 269,["209"] = 261});
local ____exports = {}
local ____ActorBuff = require("solar.solar-common.actor.ActorBuff")
local ActorBuff = ____ActorBuff.default
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local ActorBuffUtil = ____exports.default
ActorBuffUtil.name = "ActorBuffUtil"
function ActorBuffUtil.prototype.____constructor(self)
end
function ActorBuffUtil.addAnyActorBuffCreatedListener(self, onActorBuffCreatedListener)
    local ____Actor__sl_anyActorCreatedListeners_0 = Actor._sl_anyActorCreatedListeners
    ____Actor__sl_anyActorCreatedListeners_0[#____Actor__sl_anyActorCreatedListeners_0 + 1] = function(____, buff)
        if __TS__InstanceOf(buff, ActorBuff) then
            onActorBuffCreatedListener(nil, buff)
        end
    end
end
function ActorBuffUtil.addAnyActorBuffLevelChangeListener(self, onActorBuffLevelChangeListener)
    local ____Actor__sl_anyActorLevelChangeListeners_1 = Actor._sl_anyActorLevelChangeListeners
    ____Actor__sl_anyActorLevelChangeListeners_1[#____Actor__sl_anyActorLevelChangeListeners_1 + 1] = function(____, buff, delta)
        if __TS__InstanceOf(buff, ActorBuff) then
            onActorBuffLevelChangeListener(nil, buff, delta)
        end
    end
end
function ActorBuffUtil.addAnyActorBuffDestroyListener(self, onActorBuffDestroyListener)
    local ____Actor__sl_anyActorDestroyListeners_2 = Actor._sl_anyActorDestroyListeners
    ____Actor__sl_anyActorDestroyListeners_2[#____Actor__sl_anyActorDestroyListeners_2 + 1] = function(____, buff)
        if __TS__InstanceOf(buff, ActorBuff) then
            onActorBuffDestroyListener(nil, buff)
        end
    end
end
function ActorBuffUtil.addActorBuff(self, unit, actorTypeId, creator, initActorBuff)
    local actorType = DataBase:getSolarActorType(actorTypeId)
    if not actorType then
        log.errorWithTraceBack("buff不存在!请先使用registerActorType注册演员类型! id=" .. actorTypeId)
        return nil
    end
    local oldUnitBuff = ____exports.default:getUnitActorBuff(unit, actorTypeId)
    if oldUnitBuff then
        if actorType.levelMax and actorType.levelMax ~= 0 then
            if actorType.levelMax == -1 or oldUnitBuff.level < actorType.levelMax then
                oldUnitBuff.level = oldUnitBuff.level + 1
                if actorType.levelDurMode == true then
                    BaseUtil.runLater(
                        actorType.dur,
                        function()
                            oldUnitBuff.level = oldUnitBuff.level - 1
                        end
                    )
                end
            end
        end
        oldUnitBuff:update()
        return oldUnitBuff
    end
    return __TS__New(
        ActorBuff,
        actorTypeId,
        unit,
        creator,
        initActorBuff
    )
end
function ActorBuffUtil.getPlayerUnitBuff(self, player, buffTypeId)
    GroupEnumUnitsOfPlayer(_sl_tempGroup3, player, nil)
    do
        local i = 0
        while i <= 1000000 do
            local unitHandle = FirstOfGroup(_sl_tempGroup3)
            if not IsHandle(unitHandle) then
                break
            end
            local buff = ____exports.default:getUnitActorBuff(unitHandle, buffTypeId)
            if (buff and buff.buffType.id) == buffTypeId then
                return buff
            end
            GroupRemoveUnit(_sl_tempGroup3, unitHandle)
            i = i + 1
        end
    end
    return nil
end
function ActorBuffUtil.getUnitActorBuff(self, unit, actorTypeId)
    local ____opt_5 = ____exports.default:getUnitActorBuffs(unit)
    return ____opt_5 and ____opt_5[actorTypeId]
end
function ActorBuffUtil.isUnitHasActorBuff(self, unit, actorTypeId)
    local ____opt_7 = ____exports.default:getUnitActorBuffs(unit)
    return (____opt_7 and ____opt_7[actorTypeId]) ~= nil
end
function ActorBuffUtil.ifUnitHasActorBuff(self, unit, callBack, actorTypeId)
    local ____opt_9 = ____exports.default:getUnitActorBuffs(unit)
    local actorBuff = ____opt_9 and ____opt_9[actorTypeId]
    if actorBuff then
        callBack(nil, actorBuff)
    end
end
function ActorBuffUtil.getUnitActorBuffs(self, unit)
    local unitSolarData = DataBase:getUnitSolarData(unit, false)
    return unitSolarData and unitSolarData._SL_solarActorBuffSet
end
function ActorBuffUtil.forAllActorBuffs(self, callback, actorBuffTypeId)
    if actorBuffTypeId then
        DataBase:forUnitSolarDatas(function(____, id, solarData)
            local _SL_solarActorBuffSet = solarData and solarData._SL_solarActorBuffSet
            if _SL_solarActorBuffSet then
                for tempActorBuffTypeId in pairs(_SL_solarActorBuffSet) do
                    local actorBuff = _SL_solarActorBuffSet[tempActorBuffTypeId]
                    if (actorBuff and actorBuff.actorType.id) == actorBuffTypeId then
                        callback(nil, actorBuff)
                    end
                end
            end
        end)
    else
        DataBase:forUnitSolarDatas(function(____, id, solarData)
            local _SL_solarActorBuffSet = solarData and solarData._SL_solarActorBuffSet
            if _SL_solarActorBuffSet then
                for tempActorBuffTypeId in pairs(_SL_solarActorBuffSet) do
                    callback(nil, _SL_solarActorBuffSet[tempActorBuffTypeId])
                end
            end
        end)
    end
end
function ActorBuffUtil.getUnitActorBuffsByClass(self, unit, clazz)
    local actorBuffSet = ____exports.default:getUnitActorBuffs(unit)
    if not actorBuffSet then
        return
    end
    local result = {}
    for actorBuffTypeId in pairs(actorBuffSet) do
        local actorBuff = actorBuffSet[actorBuffTypeId]
        if actorBuff then
            if clazz == nil or clazz == actorBuff:get("class") then
                result[#result + 1] = actorBuff
            end
        end
    end
    return result
end
function ActorBuffUtil.forUnitActorBuffs(self, unit, callback, clazz)
    local actorBuffSet = ____exports.default:getUnitActorBuffs(unit)
    if not actorBuffSet then
        return
    end
    for actorBuffTypeId in pairs(actorBuffSet) do
        local actorBuff = actorBuffSet[actorBuffTypeId]
        if actorBuff then
            if clazz == nil or clazz == actorBuff:get("class") then
                callback(nil, actorBuff)
            end
        end
    end
end
function ActorBuffUtil.clearUnitActorBuff(self, unit, actorBuffTypeId)
    local ____opt_19 = ____exports.default:getUnitActorBuff(unit, actorBuffTypeId)
    if ____opt_19 ~= nil then
        ____opt_19:destroy()
    end
end
function ActorBuffUtil.clearUnitActorBuffs(self, unit, onlyDeBuff)
    if onlyDeBuff == nil then
        onlyDeBuff = false
    end
    local actorBuffs = ____exports.default:getUnitActorBuffs(unit)
    if not actorBuffs then
        return
    end
    for actorBuffsKey in pairs(actorBuffs) do
        if onlyDeBuff then
            local ____opt_21 = actorBuffs[actorBuffsKey]
            if ____opt_21 and ____opt_21.actorType.isDebuff then
                actorBuffs[actorBuffsKey]:destroy()
            end
        else
            local ____opt_23 = actorBuffs[actorBuffsKey]
            if ____opt_23 ~= nil then
                ____opt_23:destroy()
            end
        end
    end
end
function ActorBuffUtil.clearUnitActorBuffsByClass(self, unit, clazz)
    local actorBuffs = ____exports.default:getUnitActorBuffs(unit)
    if not actorBuffs then
        return
    end
    for ActorBuffsKey in pairs(actorBuffs) do
        local actorBuff = actorBuffs[ActorBuffsKey]
        local ____opt_25 = actorBuff and actorBuff.actorType
        if (____opt_25 and ____opt_25.class) == clazz then
            actorBuff:destroy()
        end
    end
end
return ____exports
