local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 11,["14"] = 11,["15"] = 11,["17"] = 13,["18"] = 14,["19"] = 15,["20"] = 12,["21"] = 19,["22"] = 21,["25"] = 24,["26"] = 25,["27"] = 26,["28"] = 27,["29"] = 29,["30"] = 30,["31"] = 31,["32"] = 32,["34"] = 34,["37"] = 37,["38"] = 39,["39"] = 40,["41"] = 42,["45"] = 46,["48"] = 50,["49"] = 51,["50"] = 52,["52"] = 53,["53"] = 53,["54"] = 54,["55"] = 55,["56"] = 56,["59"] = 53,["62"] = 63,["63"] = 64,["64"] = 64,["65"] = 64,["66"] = 65,["68"] = 66,["69"] = 66,["70"] = 67,["71"] = 68,["72"] = 69,["75"] = 66,["78"] = 75,["79"] = 76,["80"] = 78,["81"] = 79,["82"] = 80,["83"] = 80,["84"] = 80,["85"] = 80,["86"] = 80,["87"] = 80,["88"] = 80,["91"] = 64,["92"] = 64,["93"] = 86,["95"] = 19});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
____exports.default = __TS__Class()
local _____7C7B_53CC_51FB_7269_54C1_65F6_82F1_96C4_5B9D_5B9D_4EA4_6362_8BE5_7269_54C1 = ____exports.default
_____7C7B_53CC_51FB_7269_54C1_65F6_82F1_96C4_5B9D_5B9D_4EA4_6362_8BE5_7269_54C1.name = "类双击物品时英雄宝宝交换该物品"
function _____7C7B_53CC_51FB_7269_54C1_65F6_82F1_96C4_5B9D_5B9D_4EA4_6362_8BE5_7269_54C1.prototype.____constructor(self)
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitEvent(EVENT_PLAYER_UNIT_ISSUED_TARGET_ORDER)
    trigger:addAction(self.action)
end
function _____7C7B_53CC_51FB_7269_54C1_65F6_82F1_96C4_5B9D_5B9D_4EA4_6362_8BE5_7269_54C1.prototype.action()
    if gv.isUnitDropItemSlotExecIng == true then
        return
    end
    if GetIssuedOrderId() >= 852002 and GetIssuedOrderId() <= 852007 then
        DisableTrigger(GetTriggeringTrigger())
        local u = GetTriggerUnit()
        local p = GetOwningPlayer(u)
        local collect_item_unit
        if u == DataBase:getPlayerSolarData(p).hero then
            if DataBase:getPlayerSolarData(p).assistant then
                collect_item_unit = DataBase:getPlayerSolarData(p).assistant
            else
                EnableTrigger(GetTriggeringTrigger())
                return
            end
        elseif u == DataBase:getPlayerSolarData(p).assistant then
            if DataBase:getPlayerSolarData(p).hero then
                collect_item_unit = DataBase:getPlayerSolarData(p).hero
            else
                EnableTrigger(GetTriggeringTrigger())
                return
            end
        else
            EnableTrigger(GetTriggeringTrigger())
            return
        end
        local target_item = GetOrderTargetItem()
        local old_coordinate = 7
        local new_coordinate = 8
        do
            local i = 0
            while i < 6 do
                local item = UnitItemInSlot(u, i)
                if target_item == item then
                    old_coordinate = i
                    break
                end
                i = i + 1
            end
        end
        handle_ref(u)
        BaseUtil.runLater(
            0.03,
            function()
                handle_unref(u)
                do
                    local i = 0
                    while i < 6 do
                        local item = UnitItemInSlot(u, i)
                        if target_item == item then
                            new_coordinate = i
                            break
                        end
                        i = i + 1
                    end
                end
                if old_coordinate == new_coordinate then
                    UnitAddItem(collect_item_unit, target_item)
                    local item = UnitItemInSlot(u, new_coordinate)
                    if target_item == item then
                        DisplayTimedTextToPlayer(
                            p,
                            0,
                            0,
                            5,
                            "|cff00ffff传送对象的背包已满！|r"
                        )
                    end
                end
            end
        )
        EnableTrigger(GetTriggeringTrigger())
    end
end
return ____exports
