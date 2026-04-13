local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 6,["11"] = 6,["12"] = 9,["13"] = 9,["14"] = 9,["16"] = 9,["17"] = 12,["18"] = 13,["19"] = 14,["20"] = 15,["21"] = 16,["22"] = 17,["23"] = 18,["24"] = 19,["25"] = 20,["26"] = 20,["27"] = 20,["28"] = 20,["29"] = 20,["30"] = 20,["31"] = 20,["32"] = 20,["33"] = 21,["34"] = 22,["35"] = 23,["36"] = 24,["37"] = 25,["38"] = 26,["39"] = 27,["40"] = 28,["41"] = 29,["42"] = 29,["43"] = 29,["44"] = 30,["45"] = 31,["46"] = 32,["47"] = 33,["48"] = 34,["49"] = 35,["50"] = 36,["51"] = 37,["52"] = 38,["53"] = 39,["54"] = 39,["55"] = 39,["56"] = 39,["57"] = 40,["58"] = 40,["59"] = 40,["60"] = 40,["61"] = 40,["62"] = 40,["63"] = 40,["64"] = 40,["65"] = 40,["66"] = 40,["68"] = 42,["69"] = 43,["71"] = 45,["72"] = 46,["73"] = 47,["75"] = 49,["76"] = 29,["77"] = 29,["78"] = 12});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____VestUtil = require("solar.solar-common.util.unit.VestUtil")
local VestUtil = ____VestUtil.default
____exports.default = __TS__Class()
local ThrowUtil = ____exports.default
ThrowUtil.name = "ThrowUtil"
function ThrowUtil.prototype.____constructor(self)
end
function ThrowUtil.throw(self, whichUnit, targetUnit, damageValue, missileart, callback)
    local triggerX = GetUnitX(whichUnit)
    local triggerY = GetUnitY(whichUnit)
    local targetX = GetUnitX(targetUnit)
    local targetY = GetUnitY(targetUnit)
    local distance = MathUtil.distanceBetweenPoints(triggerX, triggerY, targetX, targetY)
    local angle = MathUtil.angleBetweenCoords(triggerX, triggerY, targetX, targetY)
    local model = missileart or "Abilities\\Weapons\\Dryadmissile\\Dryadmissile.mdl"
    local vestHandle = VestUtil.SunCreateVestByUnit(
        whichUnit,
        triggerX,
        triggerY,
        model,
        1,
        0
    )
    SetUnitFacing(vestHandle, angle)
    UnitAddAbility(vestHandle, "Amrf")
    UnitRemoveAbility(vestHandle, "Amrf")
    handle_ref(vestHandle)
    local throwDistance = 0
    local delta = 20
    handle_ref(whichUnit)
    handle_ref(targetUnit)
    BaseUtil.onTimer(
        0.02,
        function()
            local x = GetUnitX(vestHandle) + delta * CosBJ(angle)
            local y = GetUnitY(vestHandle) + delta * SinBJ(angle)
            SetUnitPosition(vestHandle, x, y)
            throwDistance = throwDistance + delta
            local height = -1600 / (distance * distance) * (throwDistance - distance) * throwDistance
            SetUnitFlyHeight(vestHandle, height, 999999)
            if throwDistance >= distance then
                handle_unref(vestHandle)
                RemoveUnit(vestHandle)
                if IsUnitAliveBJ(targetUnit) and IsUnitEnemy(
                    targetUnit,
                    GetOwningPlayer(whichUnit)
                ) then
                    UnitDamageTarget(
                        whichUnit,
                        targetUnit,
                        damageValue,
                        false,
                        false,
                        ATTACK_TYPE_MAGIC,
                        DAMAGE_TYPE_SONIC,
                        nil
                    )
                end
                if callback then
                    callback(nil, whichUnit, targetUnit)
                end
                handle_unref(whichUnit)
                handle_unref(targetUnit)
                return false
            end
            return true
        end
    )
end
return ____exports
