local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 8,["15"] = 11,["16"] = 11,["17"] = 11,["19"] = 11,["20"] = 11,["22"] = 12,["23"] = 13,["24"] = 14,["25"] = 15,["26"] = 16,["27"] = 17,["28"] = 18,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 22,["34"] = 22,["35"] = 23,["36"] = 24,["37"] = 25,["38"] = 26,["39"] = 27,["40"] = 27,["41"] = 27,["42"] = 27,["43"] = 27,["44"] = 27,["45"] = 27,["46"] = 28,["47"] = 28,["48"] = 28,["49"] = 28,["50"] = 29,["51"] = 29,["52"] = 29,["53"] = 29,["54"] = 30,["55"] = 31,["56"] = 31,["57"] = 31,["58"] = 31,["59"] = 31,["60"] = 31,["61"] = 31,["62"] = 31,["63"] = 31,["64"] = 31,["66"] = 28,["67"] = 28,["68"] = 34,["69"] = 35,["70"] = 36,["71"] = 37,["72"] = 38,["73"] = 39,["75"] = 41,["76"] = 42,["77"] = 43,["78"] = 44,["80"] = 46,["81"] = 22,["82"] = 22,["83"] = 11});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
____exports.default = __TS__Class()
local WaveUtil = ____exports.default
WaveUtil.name = "WaveUtil"
function WaveUtil.prototype.____constructor(self)
end
function WaveUtil.wave(self, whichUnit, damageValue, art, maxDistance, angle, callback)
    if maxDistance == nil then
        maxDistance = 600
    end
    if angle == nil then
        angle = GetUnitFacing(whichUnit)
    end
    local triggerX = GetUnitX(whichUnit)
    local triggerY = GetUnitY(whichUnit)
    local effectHandle = AddSpecialEffect(art, triggerX, triggerY)
    EXEffectMatRotateZ(effectHandle, angle)
    handle_ref(effectHandle)
    local groupHandle = CreateGroup()
    local damagedUnitGroup = CreateGroup()
    local delta = 20
    local sumDistance = 0
    handle_ref(whichUnit)
    BaseUtil.onTimer(
        0.02,
        function()
            local x = EXGetEffectX(effectHandle) + delta * CosBJ(angle)
            local y = EXGetEffectY(effectHandle) + delta * SinBJ(angle)
            EXSetEffectXY(effectHandle, x, y)
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
                handle_unref(effectHandle)
                DestroyEffect(effectHandle)
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
