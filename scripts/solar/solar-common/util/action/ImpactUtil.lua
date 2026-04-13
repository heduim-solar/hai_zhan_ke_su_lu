local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 8,["15"] = 11,["16"] = 11,["17"] = 11,["19"] = 11,["20"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 19,["32"] = 20,["33"] = 21,["34"] = 22,["36"] = 24,["37"] = 25,["38"] = 25,["39"] = 25,["40"] = 25,["41"] = 25,["42"] = 25,["43"] = 25,["44"] = 26,["45"] = 26,["46"] = 26,["47"] = 26,["48"] = 27,["49"] = 27,["50"] = 27,["51"] = 27,["52"] = 28,["53"] = 29,["54"] = 29,["55"] = 29,["56"] = 29,["57"] = 29,["58"] = 29,["59"] = 29,["60"] = 29,["61"] = 29,["62"] = 29,["64"] = 26,["65"] = 26,["66"] = 32,["67"] = 33,["68"] = 34,["69"] = 35,["70"] = 36,["72"] = 38,["73"] = 39,["74"] = 40,["75"] = 41,["77"] = 43,["78"] = 18,["79"] = 18,["80"] = 11});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
____exports.default = __TS__Class()
local ImpactUtil = ____exports.default
ImpactUtil.name = "ImpactUtil"
function ImpactUtil.prototype.____constructor(self)
end
function ImpactUtil.impact(self, whichUnit, damageValue, maxDistance, angle, callback)
    if maxDistance == nil then
        maxDistance = 600
    end
    if angle == nil then
        angle = GetUnitFacing(whichUnit)
    end
    local groupHandle = CreateGroup()
    local damagedUnitGroup = CreateGroup()
    local delta = 20
    local sumDistance = 0
    handle_ref(whichUnit)
    SetUnitPathing(whichUnit, false)
    BaseUtil.onTimer(
        0.02,
        function()
            local x = GetUnitX(whichUnit) + delta * CosBJ(angle)
            local y = GetUnitY(whichUnit) + delta * SinBJ(angle)
            if not IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) then
                SetUnitPosition(whichUnit, x, y)
            end
            GroupClear(groupHandle)
            GroupEnumUnitsInRange(
                groupHandle,
                x,
                y,
                128,
                nil
            )
            GroupUtil["for"](
                GroupUtil,
                groupHandle,
                function(____, unitHandle)
                    if IsUnitAliveBJ(unitHandle) and IsUnitEnemy(
                        unitHandle,
                        GetOwningPlayer(whichUnit)
                    ) and not IsUnitInGroup(unitHandle, damagedUnitGroup) then
                        GroupAddUnit(damagedUnitGroup, unitHandle)
                        UnitDamageTarget(
                            whichUnit,
                            unitHandle,
                            damageValue,
                            false,
                            false,
                            ATTACK_TYPE_NORMAL,
                            DAMAGE_TYPE_MAGIC,
                            nil
                        )
                    end
                end
            )
            sumDistance = sumDistance + delta
            if sumDistance >= maxDistance then
                SetUnitPathing(whichUnit, true)
                if callback then
                    callback(nil, whichUnit, x, y)
                end
                handle_unref(whichUnit)
                DestroyGroup(groupHandle)
                DestroyGroup(damagedUnitGroup)
                return false
            end
            return true
        end
    )
end
return ____exports
