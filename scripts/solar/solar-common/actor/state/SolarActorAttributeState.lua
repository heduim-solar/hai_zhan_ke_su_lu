local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 12,["28"] = 12,["29"] = 12,["31"] = 16,["32"] = 17,["36"] = 21,["37"] = 22,["38"] = 23,["39"] = 24,["40"] = 26,["41"] = 27,["44"] = 30,["45"] = 31,["46"] = 33,["47"] = 34,["48"] = 33,["49"] = 24,["50"] = 39,["51"] = 39,["52"] = 39,["53"] = 41,["54"] = 42,["55"] = 41,["56"] = 39,["57"] = 39,["58"] = 46,["59"] = 47,["60"] = 48,["62"] = 46,["63"] = 51,["64"] = 52,["65"] = 53,["66"] = 53,["67"] = 53,["68"] = 54,["69"] = 53,["70"] = 53,["71"] = 51,["72"] = 57,["73"] = 59,["74"] = 60,["75"] = 60,["76"] = 60,["77"] = 61,["78"] = 60,["79"] = 60,["80"] = 57,["81"] = 15,["82"] = 67,["83"] = 69,["86"] = 72,["87"] = 73,["88"] = 73,["89"] = 74,["90"] = 75,["94"] = 79,["96"] = 84,["97"] = 85,["98"] = 86,["100"] = 89,["101"] = 90,["102"] = 92,["103"] = 94,["104"] = 67});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitAttributeState = require("solar.solar-common.attribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local SolarActorAttributeState = ____exports.default
SolarActorAttributeState.name = "SolarActorAttributeState"
function SolarActorAttributeState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new SolarActorAttributeState()")
        return
    end
    --- buff 属性更新到单位属性
    local trigger2 = __TS__New(Trigger)
    local noUpdateAttributeTime = 0
    trigger2:registerTimerEvent(0.99, true)
    trigger2:addAction(function()
        if Actor._sl_needUpdateAttribute == false and noUpdateAttributeTime < 5 then
            noUpdateAttributeTime = noUpdateAttributeTime + 1
            return
        end
        Actor._sl_needUpdateAttribute = false
        noUpdateAttributeTime = 0
        DataBase:forUnitSolarDatas(function(____, u, solarData)
            ____exports.default:refreshActorAttributes2UnitSolarAttribute(u)
        end)
    end)
    se:on(
        "属性刷新",
        function()
            DataBase:forUnitSolarDatas(function(____, u, solarData)
                ____exports.default:refreshActorAttributes2UnitSolarAttribute(u)
            end)
        end
    )
    ActorBuffUtil:addAnyActorBuffCreatedListener(function(____, buff)
        if buff.attribute then
            ____exports.default:refreshActorAttributes2UnitSolarAttribute(buff.unit)
        end
    end)
    se:onUnitPickupItem(function(e)
        local trigUnit = e.trigUnit
        BaseUtil.runLater(
            0.1,
            function()
                ____exports.default:refreshActorAttributes2UnitSolarAttribute(trigUnit)
            end
        )
    end)
    se:onUnitDropItem(function(e)
        local trigUnit = e.trigUnit
        BaseUtil.runLater(
            0.1,
            function()
                ____exports.default:refreshActorAttributes2UnitSolarAttribute(trigUnit)
            end
        )
    end)
end
function SolarActorAttributeState.refreshActorAttributes2UnitSolarAttribute(self, unitHandle)
    if not UnitStateUtil:isAlive(unitHandle) then
        return
    end
    local attributes = ActorUtil:getUnitAllActorAttributes(unitHandle)
    local ____opt_0 = DataBase:getUnitSolarData(unitHandle, false)
    local oldAttr = ____opt_0 and ____opt_0._SL_totalActorsSolarAttribute
    if oldAttr == nil then
        if attributes == nil or #attributes == 0 then
            return
        end
    end
    local totalAttribute = AttributeUtil:sumAttributes(attributes)
    --- 属性 系统
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    AttributeUtil:subtract(solarData._SL_solarAttribute, oldAttr)
    AttributeUtil:add(solarData._SL_solarAttribute, totalAttribute)
    solarData._SL_totalActorsSolarAttribute = totalAttribute
    UnitAttributeState:refreshUnitSolarAttribute(unitHandle)
end
return ____exports
