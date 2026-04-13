local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 14,["22"] = 14,["23"] = 14,["25"] = 19,["26"] = 20,["29"] = 23,["30"] = 23,["31"] = 23,["32"] = 24,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 26,["37"] = 25,["38"] = 25,["39"] = 29,["41"] = 23,["42"] = 23,["43"] = 33,["44"] = 34,["45"] = 35,["46"] = 36,["47"] = 37,["48"] = 38,["49"] = 40,["50"] = 40,["51"] = 40,["52"] = 41,["53"] = 40,["54"] = 40,["55"] = 37,["56"] = 45,["57"] = 47,["58"] = 48,["59"] = 49,["60"] = 50,["61"] = 49,["62"] = 48,["63"] = 53,["64"] = 53,["65"] = 53,["66"] = 54,["67"] = 55,["68"] = 54,["69"] = 53,["70"] = 53,["71"] = 18,["72"] = 65,["73"] = 67,["75"] = 68,["76"] = 68,["78"] = 69,["79"] = 70,["80"] = 71,["82"] = 73,["83"] = 74,["85"] = 76,["86"] = 77,["87"] = 79,["88"] = 80,["89"] = 81,["91"] = 84,["92"] = 85,["93"] = 86,["97"] = 68,["100"] = 91,["101"] = 65,["102"] = 98,["103"] = 99,["104"] = 100,["105"] = 100,["106"] = 101,["107"] = 102,["111"] = 106,["113"] = 111,["114"] = 112,["115"] = 113,["117"] = 116,["118"] = 117,["119"] = 119,["120"] = 121,["121"] = 98,["122"] = 16});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitAttributeState = require("solar.solar-common.attribute.UnitAttributeState")
local UnitAttributeState = ____UnitAttributeState.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local ItemAttributeState = ____exports.default
ItemAttributeState.name = "ItemAttributeState"
function ItemAttributeState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new ItemAttributeState()")
        return
    end
    BaseUtil.runLater(
        0.1,
        function()
            for configKey in pairs(____exports.default.config) do
                SingletonUtil:executeOnce(
                    "ItemAttributeState.config:警告",
                    function()
                        print("不推荐在ItemAttributeState.config设置属性," .. "请直接使用AttributeUtil.setItemTypeAttribute设置属性。这个方式将在未来移除!")
                    end
                )
                AttributeUtil:setItemTypeAttribute(configKey, ____exports.default.config[configKey])
            end
        end
    )
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_PAWN_ITEM)
    trigger:addAction(function()
        local unitHandle = GetTriggerUnit()
        BaseUtil.runLater(
            0.1,
            function()
                ____exports.default:refreshItemAttributes2UnitSolarAttribute(unitHandle)
            end
        )
    end)
    local triggerTimer = __TS__New(Trigger)
    triggerTimer:registerTimerEvent(5.89, true)
    triggerTimer:addAction(function()
        SelectUtil.forAllUnits(function(____, u)
            ____exports.default:refreshItemAttributes2UnitSolarAttribute(u)
        end)
    end)
    se:on(
        "属性刷新",
        function()
            SelectUtil.forAllUnits(function(____, u)
                ____exports.default:refreshItemAttributes2UnitSolarAttribute(u)
            end)
        end
    )
end
function ItemAttributeState.getItemsAttributes(self, unitHandle)
    local itemAttributes = nil
    do
        local i = 0
        while i < 6 do
            do
                local itemHandle = UnitItemInSlot(unitHandle, i)
                if not IsHandle(itemHandle) then
                    goto __continue16
                end
                if not itemAttributes then
                    itemAttributes = {}
                end
                local itemTypeId = GetItemTypeId(itemHandle)
                local itemTypeIdStr = id2string(itemTypeId)
                local itemAttribute = AttributeUtil:getItemAttribute(itemHandle)
                if itemAttribute then
                    itemAttributes[#itemAttributes + 1] = itemAttribute
                end
                local configItemAttribute = AttributeUtil:getItemTypeAttribute(itemTypeIdStr)
                if configItemAttribute then
                    itemAttributes[#itemAttributes + 1] = configItemAttribute
                end
            end
            ::__continue16::
            i = i + 1
        end
    end
    return itemAttributes
end
function ItemAttributeState.refreshItemAttributes2UnitSolarAttribute(self, unitHandle)
    local itemAttributes = ____exports.default:getItemsAttributes(unitHandle)
    local ____opt_0 = DataBase:getUnitSolarData(unitHandle, false)
    local unitOldItemSAttr = ____opt_0 and ____opt_0._SL_totalItemsSolarAttribute
    if unitOldItemSAttr == nil then
        if itemAttributes == nil or #itemAttributes == 0 then
            return
        end
    end
    local totalAttribute = AttributeUtil:sumAttributes(itemAttributes)
    --- dmg system
    local solarData = DataBase:getUnitSolarData(unitHandle)
    if not solarData._SL_solarAttribute then
        solarData._SL_solarAttribute = {}
    end
    AttributeUtil:subtract(solarData._SL_solarAttribute, unitOldItemSAttr)
    AttributeUtil:add(solarData._SL_solarAttribute, totalAttribute)
    solarData._SL_totalItemsSolarAttribute = totalAttribute
    UnitAttributeState:refreshUnitSolarAttribute(unitHandle)
end
ItemAttributeState.config = {}
return ____exports
