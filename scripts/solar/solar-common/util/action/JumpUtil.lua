local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 8,["15"] = 13,["16"] = 14,["17"] = 15,["18"] = 18,["19"] = 20,["20"] = 21,["21"] = 22,["22"] = 22,["23"] = 22,["24"] = 23,["25"] = 22,["26"] = 22,["27"] = 25,["28"] = 25,["29"] = 25,["30"] = 26,["31"] = 25,["32"] = 25,["33"] = 13,["34"] = 32,["35"] = 32,["36"] = 32,["38"] = 33,["39"] = 33,["40"] = 33,["41"] = 33,["42"] = 33,["43"] = 33,["44"] = 34,["45"] = 35,["46"] = 36,["47"] = 37,["48"] = 38,["49"] = 38,["50"] = 38,["51"] = 38,["52"] = 38,["53"] = 38,["54"] = 39,["55"] = 40,["56"] = 41,["57"] = 42,["58"] = 43,["59"] = 44,["60"] = 44,["61"] = 44,["62"] = 45,["63"] = 46,["64"] = 47,["65"] = 48,["66"] = 49,["67"] = 50,["68"] = 51,["69"] = 52,["70"] = 53,["71"] = 54,["73"] = 56,["74"] = 57,["76"] = 59,["77"] = 60,["78"] = 61,["79"] = 62,["80"] = 63,["81"] = 44,["82"] = 44,["83"] = 32});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
____exports.default = __TS__Class()
local JumpUtil = ____exports.default
JumpUtil.name = "JumpUtil"
function JumpUtil.prototype.____constructor(self)
end
function JumpUtil.strikeFly(self, whichUnit, time)
    UnitAddAbility(whichUnit, "Amrf")
    UnitRemoveAbility(whichUnit, "Amrf")
    local oldFlyHeight = 0
    EXPauseUnit(whichUnit, true)
    SetUnitFlyHeight(whichUnit, oldFlyHeight + 500, time * 1000)
    BaseUtil.runLater(
        time / 2,
        function()
            SetUnitFlyHeight(whichUnit, oldFlyHeight, time * 1000)
        end
    )
    BaseUtil.runLater(
        time,
        function()
            EXPauseUnit(whichUnit, false)
        end
    )
end
function JumpUtil.jump(self, whichUnit, targetX, targetY, maxDistance, targetArt, effectArt, callback)
    if maxDistance == nil then
        maxDistance = 800
    end
    local angle = MathUtil.angleBetweenCoords(
        GetUnitX(whichUnit),
        GetUnitY(whichUnit),
        targetX,
        targetY
    )
    UnitAddAbility(whichUnit, "Amrf")
    UnitRemoveAbility(whichUnit, "Amrf")
    SetUnitPathing(whichUnit, false)
    local effectHandle = AddSpecialEffectTarget(targetArt or "Abilities\\Spells\\Items\\ClarityPotion\\ClarityTarget.mdl", whichUnit, "chest")
    local distance = MathUtil.distanceBetweenPoints(
        GetUnitX(whichUnit),
        GetUnitY(whichUnit),
        targetX,
        targetY
    )
    distance = math.min(distance, maxDistance)
    local maxHeight = distance / 2.15
    handle_ref(whichUnit)
    local jumpDistance = 0
    local delta = 40
    BaseUtil.onTimer(
        0.02,
        function()
            jumpDistance = jumpDistance + delta
            local x = GetUnitX(whichUnit) + delta * CosBJ(angle)
            local y = GetUnitY(whichUnit) + delta * SinBJ(angle)
            if jumpDistance >= distance or IsUnitType(whichUnit, UNIT_TYPE_DEAD) or IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) then
                SetUnitPathing(whichUnit, true)
                SetUnitFlyHeight(whichUnit, 0, 0)
                DestroyEffect(effectHandle)
                DestroyEffect(AddSpecialEffect(effectArt or "Abilities\\Weapons\\AncientProtectorMissile\\AncientProtectorMissile.mdl", x, y))
                if callback then
                    callback(nil, whichUnit, x, y)
                end
                handle_unref(whichUnit)
                return false
            end
            SetUnitPosition(whichUnit, x, y)
            local A = -4 * maxHeight / Pow(distance, 2)
            local height = A * (jumpDistance - 0) * (jumpDistance - distance)
            SetUnitFlyHeight(whichUnit, height, 0)
            return true
        end
    )
end
return ____exports
