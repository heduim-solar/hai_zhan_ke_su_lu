local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 6,["11"] = 6,["12"] = 9,["13"] = 9,["14"] = 9,["16"] = 9,["17"] = 12,["18"] = 13,["19"] = 14,["20"] = 15,["21"] = 15,["22"] = 15,["23"] = 15,["24"] = 15,["25"] = 15,["26"] = 15,["27"] = 15,["28"] = 16,["29"] = 17,["30"] = 18,["31"] = 19,["32"] = 20,["33"] = 21,["34"] = 22,["35"] = 22,["36"] = 22,["37"] = 23,["38"] = 24,["39"] = 25,["40"] = 26,["41"] = 27,["42"] = 28,["43"] = 29,["44"] = 30,["45"] = 31,["46"] = 32,["47"] = 33,["48"] = 34,["49"] = 35,["50"] = 36,["51"] = 37,["52"] = 37,["53"] = 37,["54"] = 37,["55"] = 37,["56"] = 37,["57"] = 37,["58"] = 38,["59"] = 39,["60"] = 39,["61"] = 39,["62"] = 39,["65"] = 43,["66"] = 22,["67"] = 22,["68"] = 12});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____VestUtil = require("solar.solar-common.util.unit.VestUtil")
local VestUtil = ____VestUtil.default
____exports.default = __TS__Class()
local EjectionUtil = ____exports.default
EjectionUtil.name = "EjectionUtil"
function EjectionUtil.prototype.____constructor(self)
end
function EjectionUtil.ejection(self, whichUnit, targetUnit, model)
    local triggerX = GetUnitX(whichUnit)
    local triggerY = GetUnitY(whichUnit)
    local vestHandle = VestUtil.SunCreateVestByUnit(
        whichUnit,
        triggerX,
        triggerY,
        model,
        1,
        0
    )
    handle_ref(vestHandle)
    handle_ref(whichUnit)
    handle_ref(targetUnit)
    local v = 10
    local i = 10
    local max = 500
    BaseUtil.onTimer(
        0.02,
        function(____, count)
            max = max - 1
            local vestX = GetUnitX(vestHandle)
            local vestY = GetUnitY(vestHandle)
            local targetX = GetUnitX(targetUnit)
            local targetY = GetUnitY(targetUnit)
            local angle = MathUtil.angleBetweenCoords(vestX, vestY, targetX, targetY)
            local x = vestX + 30 * CosBJ(angle)
            local y = vestY + 30 * SinBJ(angle)
            SetUnitFacing(vestHandle, angle)
            SetUnitPosition(vestHandle, x, y)
            local distance = MathUtil.distanceBetweenPoints(x, y, targetX, targetY)
            if distance <= 50 then
                i = i - 1
                if i > 0 then
                    UnitDamageTargetBJ(
                        whichUnit,
                        targetUnit,
                        v,
                        ATTACK_TYPE_NORMAL,
                        DAMAGE_TYPE_NORMAL
                    )
                    DestroyEffect(AddSpecialEffectTarget("Abilities\\Spells\\Other\\Stampede\\StampedeMissileDeath.mdl", targetUnit, "chest"))
                    SetUnitLifeBJ(
                        whichUnit,
                        GetUnitState(whichUnit, UNIT_STATE_LIFE) + 0.03 * (GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE) - GetUnitState(whichUnit, UNIT_STATE_LIFE))
                    )
                end
            end
            return true
        end
    )
end
return ____exports
