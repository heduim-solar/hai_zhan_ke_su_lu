local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArraySort = ____lualib.__TS__ArraySort
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 7,["21"] = 7,["22"] = 8,["23"] = 8,["24"] = 25,["25"] = 25,["26"] = 25,["27"] = 67,["28"] = 67,["29"] = 67,["31"] = 29,["32"] = 31,["33"] = 32,["34"] = 34,["35"] = 35,["36"] = 41,["37"] = 43,["38"] = 44,["39"] = 45,["40"] = 47,["41"] = 48,["42"] = 49,["43"] = 50,["44"] = 59,["45"] = 60,["46"] = 62,["47"] = 68,["48"] = 69,["49"] = 70,["50"] = 71,["51"] = 67,["52"] = 75,["53"] = 76,["54"] = 76,["55"] = 76,["56"] = 77,["57"] = 78,["60"] = 82,["63"] = 86,["65"] = 86,["67"] = 88,["68"] = 88,["69"] = 89,["70"] = 91,["73"] = 95,["74"] = 96,["75"] = 76,["76"] = 76,["77"] = 76,["78"] = 75,["79"] = 101,["80"] = 102,["81"] = 103,["82"] = 104,["83"] = 105,["84"] = 106,["86"] = 108,["87"] = 109,["90"] = 112,["91"] = 113,["92"] = 101,["93"] = 116,["94"] = 117,["95"] = 118,["96"] = 119,["97"] = 120,["98"] = 121,["101"] = 124,["102"] = 116,["103"] = 127,["104"] = 128,["105"] = 129,["106"] = 130,["109"] = 133,["110"] = 134,["111"] = 136,["112"] = 136,["113"] = 136,["114"] = 137,["115"] = 137,["116"] = 137,["117"] = 137,["118"] = 137,["119"] = 137,["120"] = 138,["121"] = 138,["122"] = 138,["123"] = 138,["124"] = 138,["125"] = 138,["126"] = 139,["127"] = 136,["128"] = 136,["129"] = 142,["131"] = 143,["132"] = 143,["134"] = 144,["135"] = 146,["136"] = 147,["137"] = 149,["140"] = 152,["141"] = 153,["144"] = 157,["145"] = 158,["146"] = 159,["148"] = 161,["149"] = 161,["150"] = 161,["151"] = 161,["152"] = 161,["153"] = 161,["154"] = 161,["155"] = 161,["156"] = 162,["157"] = 163,["158"] = 164,["159"] = 165,["160"] = 166,["161"] = 167,["162"] = 168,["163"] = 170,["164"] = 171,["165"] = 173,["169"] = 177,["172"] = 143,["175"] = 127,["176"] = 182,["177"] = 183,["178"] = 184,["179"] = 182,["180"] = 26});
local ____exports = {}
local ____Projectile = require("solar.solar-common.tool.Projectile")
local Projectile = ____Projectile.default
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____WeaponType = require("solar.solar-common.constant.WeaponType")
local WeaponType = ____WeaponType.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local AutoMissileAttackController = ____exports.default
AutoMissileAttackController.name = "AutoMissileAttackController"
function AutoMissileAttackController.prototype.____constructor(self, unit, projectileModelPath, damageStateFormula, onHitTarget)
    if projectileModelPath == nil then
        projectileModelPath = "Abilities\\Weapons\\RocketMissile\\RocketMissile.mdx"
    end
    self.range = 1000
    self.extRange = 0
    self.coolDown = 1
    self.speed = 1000
    self.targetCount = 1
    self.projectileModelScale = 1
    self.colorR = 255
    self.colorG = 255
    self.colorB = 255
    self.alpha = 255
    self.damageTypeId = DamageType["s_法术"]
    self.weaponTypeID = WeaponType.T0_WHOKNOWS
    self.attackType = ATTACK_TYPE_CHAOS
    self.sTimer = __TS__New(STimer)
    self._isDestroy = false
    self._lastLaunchTime = 0
    self.unit = unit
    self.projectileModelPath = projectileModelPath
    self.damageStateFormula = damageStateFormula
    self.onHitTarget = onHitTarget
end
function AutoMissileAttackController.prototype.start(self)
    self.sTimer:start(
        0.05,
        function()
            if self._isDestroy then
                self.sTimer:destroy()
                return
            end
            if not UnitStateUtil:isAlive(self.unit) then
                return
            end
            local ____opt_0 = self.onUpdate
            if ____opt_0 ~= nil then
                ____opt_0(self, self)
            end
            local ____opt_2 = AttributeUtil:getUnitAttribute(self.unit, false)
            local autoMissileAttackSpeed = ____opt_2 and ____opt_2.autoMissileAttackSpeed or 0
            local cd = self.coolDown / (autoMissileAttackSpeed + 1)
            if _g_time - self._lastLaunchTime < cd * 1000 then
                return
            end
            self:doLaunchMissile()
            self._lastLaunchTime = _g_time
        end,
        true
    )
end
function AutoMissileAttackController.prototype.getRealRange(self)
    local range = self.range + self.extRange
    local unitAttribute = AttributeUtil:getUnitAttribute(self.unit, false)
    if unitAttribute then
        if unitAttribute.autoMissileAttackRange then
            range = range + unitAttribute.autoMissileAttackRange
        end
        if unitAttribute.autoMissileAttackRange_p then
            range = range * (1 + unitAttribute.autoMissileAttackRange_p)
        end
    end
    range = math.min(range, self.rangeMaxLimit or ____exports.default.defaultRangeMaxLimit)
    return range
end
function AutoMissileAttackController.prototype.getRealTargetCount(self)
    local targetCount = self.targetCount
    local unitAttribute = AttributeUtil:getUnitAttribute(self.unit, false)
    if unitAttribute then
        if unitAttribute.autoMissileAttackTargetCount then
            targetCount = targetCount + unitAttribute.autoMissileAttackTargetCount
        end
    end
    return targetCount
end
function AutoMissileAttackController.prototype.doLaunchMissile(self)
    local range = self:getRealRange()
    local enemyUnits = SelectUtil.getEnemyUnitsInRange(self.unit, range)
    if enemyUnits == nil or #enemyUnits == 0 then
        return
    end
    local x = GetUnitX(self.unit)
    local y = GetUnitY(self.unit)
    __TS__ArraySort(
        enemyUnits,
        function(____, a, b)
            local aD = MathUtil.distanceBetweenPoints(
                x,
                y,
                GetUnitX(a),
                GetUnitY(a)
            )
            local bD = MathUtil.distanceBetweenPoints(
                x,
                y,
                GetUnitX(b),
                GetUnitY(b)
            )
            return aD - bD
        end
    )
    local realTargetCount = self:getRealTargetCount()
    do
        local i = 0
        while i < realTargetCount and i < #enemyUnits do
            do
                local targetUnit = enemyUnits[i + 1]
                if self.onBeforeLaunchMissile then
                    local b = self:onBeforeLaunchMissile(self, targetUnit)
                    if self._isDestroy then
                        return
                    end
                    if b == false then
                        goto __continue19
                    end
                end
                local damage = 0
                if self.damageStateFormula then
                    damage = UnitStateUtil:calculateStateFormula(self.damageStateFormula, self.unit, targetUnit)
                end
                local projectile = __TS__New(
                    Projectile,
                    self.unit,
                    targetUnit,
                    damage,
                    self.projectileModelPath,
                    self.onHitTarget
                )
                projectile.speed = self.speed
                projectile.damageName = self.damageName
                projectile.projectileModelScale = self.projectileModelScale
                projectile.colorR = self.colorR
                projectile.colorG = self.colorG
                projectile.colorB = self.colorB
                projectile.alpha = self.alpha
                if self.onLaunchMissile then
                    self:onLaunchMissile(self, projectile)
                    if self._isDestroy then
                        return
                    end
                end
                projectile:start()
            end
            ::__continue19::
            i = i + 1
        end
    end
end
function AutoMissileAttackController.prototype.destroy(self)
    self._isDestroy = true
    self.sTimer:destroy()
end
AutoMissileAttackController.defaultRangeMaxLimit = 3000
return ____exports
