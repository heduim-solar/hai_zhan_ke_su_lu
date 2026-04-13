local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 4,["12"] = 4,["13"] = 4,["15"] = 4,["16"] = 18,["17"] = 18,["18"] = 18,["20"] = 18,["21"] = 18,["23"] = 19,["25"] = 20,["26"] = 20,["27"] = 21,["28"] = 21,["29"] = 21,["30"] = 21,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 22,["35"] = 23,["36"] = 23,["38"] = 20,["41"] = 25,["42"] = 18,["43"] = 35,["44"] = 36,["45"] = 36,["46"] = 37,["49"] = 40,["52"] = 43,["53"] = 35,["54"] = 52,["55"] = 53,["56"] = 53,["57"] = 54,["58"] = 55,["60"] = 57,["61"] = 58,["63"] = 60,["64"] = 52,["65"] = 69,["66"] = 70,["67"] = 70,["68"] = 71,["69"] = 72,["71"] = 74,["72"] = 75,["74"] = 77,["75"] = 69,["76"] = 85,["77"] = 86,["78"] = 86,["79"] = 87,["80"] = 88,["82"] = 90,["83"] = 91,["85"] = 93,["86"] = 85,["87"] = 100,["88"] = 101,["89"] = 101,["90"] = 102,["91"] = 100,["92"] = 110,["93"] = 111,["94"] = 112,["95"] = 113,["97"] = 115,["98"] = 110});
local ____exports = {}
local ____ActorUnit = require("solar.solar-common.actor.ActorUnit")
local ActorUnit = ____ActorUnit.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorUnitUtil = ____exports.default
ActorUnitUtil.name = "ActorUnitUtil"
function ActorUnitUtil.prototype.____constructor(self)
end
function ActorUnitUtil.createActorUnit(self, player, actorUnitTypeId, x, y, face, count, callBack)
    if face == nil then
        face = 0
    end
    if count == nil then
        count = 1
    end
    local actorUnit = nil
    do
        local i = 0
        while i < count do
            actorUnit = __TS__New(
                ActorUnit,
                actorUnitTypeId,
                player,
                x,
                y
            )
            SetUnitFacing(actorUnit.unit, face)
            if callBack ~= nil then
                callBack(nil, actorUnit)
            end
            i = i + 1
        end
    end
    return actorUnit
end
function ActorUnitUtil.ifHasActorUnit(self, unit, callBack, actorTypeId)
    local ____opt_2 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_2 and ____opt_2._SL_solarActorUnit
    if actor == nil then
        return
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return
    end
    callBack(nil, actor)
end
function ActorUnitUtil.hasActorUnit(self, unit, callBack, actorTypeId)
    local ____opt_4 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_4 and ____opt_4._SL_solarActorUnit
    if actor == nil then
        return false
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return false
    end
    return true
end
function ActorUnitUtil.getActorUnit(self, unit, actorTypeId)
    local ____opt_6 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_6 and ____opt_6._SL_solarActorUnit
    if actor == nil then
        return nil
    end
    if actorTypeId ~= nil and actorTypeId ~= actor.actorTypeId then
        return nil
    end
    return actor
end
function ActorUnitUtil.isActorUnitType(self, unit, actorTypeId)
    local ____opt_8 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_8 and ____opt_8._SL_solarActorUnit
    if actor == nil then
        return false
    end
    if actorTypeId == actor.actorTypeId then
        return true
    end
    return false
end
function ActorUnitUtil.getActorUnitTypeId(self, unit)
    local ____opt_10 = DataBase:getUnitSolarData(unit, false)
    local actor = ____opt_10 and ____opt_10._SL_solarActorUnit
    return actor and actor.actorTypeId
end
function ActorUnitUtil.getUnitName(self, whichUnit)
    local actorUnit = ____exports.default:getActorUnit(whichUnit)
    if actorUnit ~= nil then
        return actorUnit:getName()
    end
    return GetUnitName(whichUnit)
end
return ____exports
