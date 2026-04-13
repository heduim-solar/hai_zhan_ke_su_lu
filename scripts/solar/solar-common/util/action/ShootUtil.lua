local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 8,["15"] = 11,["16"] = 12,["19"] = 13,["20"] = 14,["21"] = 15,["22"] = 16,["23"] = 17,["24"] = 18,["25"] = 19,["26"] = 20,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 24,["31"] = 25,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 29,["38"] = 30,["39"] = 31,["40"] = 32,["41"] = 33,["42"] = 34,["43"] = 34,["44"] = 34,["45"] = 34,["46"] = 35,["47"] = 35,["48"] = 35,["49"] = 35,["50"] = 35,["51"] = 35,["52"] = 35,["53"] = 35,["54"] = 35,["55"] = 35,["57"] = 37,["58"] = 38,["60"] = 40,["61"] = 41,["63"] = 43,["64"] = 26,["65"] = 26,["66"] = 11});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
____exports.default = __TS__Class()
local ShootUtil = ____exports.default
ShootUtil.name = "ShootUtil"
function ShootUtil.prototype.____constructor(self)
end
function ShootUtil.shoot(self, whichUnit, targetUnit, damageValue, damageType, maxDistance, missileart, callback)
    if not IsHandle(whichUnit) or not IsHandle(targetUnit) then
        return
    end
    local triggerX = GetUnitX(whichUnit)
    local triggerY = GetUnitY(whichUnit)
    local targetX = GetUnitX(targetUnit)
    local targetY = GetUnitY(targetUnit)
    local model = missileart or "Abilities\\Weapons\\Arrow\\ArrowMissile.mdl"
    local angle = MathUtil.angleBetweenCoords(triggerX, triggerY, targetX, targetY)
    local distance = maxDistance or MathUtil.distanceBetweenPoints(triggerX, triggerY, targetX, targetY)
    local effectHandle = AddSpecialEffect(model, triggerX, triggerY)
    EXEffectMatRotateZ(effectHandle, angle)
    handle_ref(effectHandle)
    local delta = 20
    local shootDistance = 0
    handle_ref(whichUnit)
    BaseUtil.onTimer(
        0.02,
        function()
            local x = EXGetEffectX(effectHandle) + delta * CosBJ(angle)
            local y = EXGetEffectY(effectHandle) + delta * SinBJ(angle)
            EXSetEffectXY(effectHandle, x, y)
            shootDistance = shootDistance + delta
            if shootDistance >= distance then
                handle_unref(effectHandle)
                DestroyEffect(effectHandle)
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
                        ATTACK_TYPE_PIERCE,
                        damageType or DAMAGE_TYPE_UNIVERSAL,
                        nil
                    )
                end
                if callback then
                    callback(nil, whichUnit, targetUnit)
                end
                handle_unref(whichUnit)
                return false
            end
            return true
        end
    )
end
return ____exports
