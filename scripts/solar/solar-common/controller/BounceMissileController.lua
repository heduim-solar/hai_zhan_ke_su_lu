local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 10,["19"] = 10,["20"] = 10,["21"] = 46,["22"] = 46,["23"] = 46,["25"] = 12,["26"] = 14,["27"] = 15,["28"] = 17,["29"] = 23,["30"] = 25,["31"] = 26,["32"] = 27,["33"] = 29,["34"] = 30,["35"] = 31,["36"] = 32,["37"] = 41,["38"] = 47,["39"] = 48,["40"] = 49,["41"] = 50,["42"] = 46,["43"] = 54,["44"] = 55,["45"] = 56,["46"] = 57,["47"] = 58,["48"] = 59,["49"] = 60,["50"] = 61,["52"] = 64,["53"] = 65,["56"] = 69,["59"] = 75,["60"] = 76,["61"] = 77,["62"] = 79,["66"] = 83,["67"] = 85,["68"] = 86,["69"] = 88,["74"] = 93,["77"] = 97,["78"] = 97,["79"] = 99,["80"] = 100,["81"] = 102,["84"] = 105,["88"] = 110,["89"] = 111,["90"] = 112,["92"] = 114,["93"] = 114,["94"] = 114,["95"] = 114,["96"] = 114,["97"] = 114,["98"] = 114,["99"] = 114,["100"] = 115,["101"] = 116,["102"] = 117,["103"] = 118,["104"] = 119,["105"] = 120,["106"] = 121,["107"] = 122,["108"] = 123,["109"] = 124,["110"] = 126,["111"] = 127,["112"] = 128,["114"] = 130,["115"] = 132,["116"] = 133,["117"] = 132,["119"] = 137,["120"] = 138,["121"] = 140,["125"] = 144,["126"] = 145,["127"] = 54,["128"] = 149,["129"] = 150,["130"] = 149});
local ____exports = {}
local ____Projectile = require("solar.solar-common.tool.Projectile")
local Projectile = ____Projectile.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____WeaponType = require("solar.solar-common.constant.WeaponType")
local WeaponType = ____WeaponType.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local BounceMissileController = ____exports.default
BounceMissileController.name = "BounceMissileController"
function BounceMissileController.prototype.____constructor(self, unit, projectileModelPath, damageStateFormula, onHitTarget)
    if projectileModelPath == nil then
        projectileModelPath = "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdx"
    end
    self.range = 600
    self.speed = 1000
    self.loopCount = 5
    self.hitUnitList = {}
    self.projectileModelScale = 1
    self.colorR = 255
    self.colorG = 255
    self.colorB = 255
    self.alpha = 255
    self.damageTypeId = DamageType.T4_NORMAL
    self.weaponTypeID = WeaponType.T0_WHOKNOWS
    self.attackType = ATTACK_TYPE_CHAOS
    self._isDestroy = false
    self.unit = unit
    self.projectileModelPath = projectileModelPath
    self.damageStateFormula = damageStateFormula
    self.onHitTarget = onHitTarget
end
function BounceMissileController.prototype.launch(self)
    local x = GetUnitX(self.unit)
    local y = GetUnitY(self.unit)
    local lastHitUnit = nil
    if #self.hitUnitList > 0 then
        lastHitUnit = self.hitUnitList[#self.hitUnitList]
        x = GetUnitX(lastHitUnit)
        y = GetUnitY(lastHitUnit)
    end
    local enemyUnitList = SelectUtil.getEnemyUnitsInRangeOrderByDistance(self.unit, self.range, x, y)
    if enemyUnitList == nil or #enemyUnitList == 0 then
        return
    end
    if #enemyUnitList == 1 and enemyUnitList[1] == lastHitUnit then
        return
    end
    local targetUnit = nil
    for ____, enemyUnit in ipairs(enemyUnitList) do
        if enemyUnit ~= lastHitUnit and not __TS__ArrayIncludes(self.hitUnitList, enemyUnit) then
            targetUnit = enemyUnit
            break
        end
    end
    if targetUnit == nil then
        for ____, enemyUnit in ipairs(enemyUnitList) do
            if enemyUnit ~= lastHitUnit then
                targetUnit = enemyUnit
                break
            end
        end
    end
    if targetUnit == nil then
        return
    end
    local ____self_hitUnitList_0 = self.hitUnitList
    ____self_hitUnitList_0[#____self_hitUnitList_0 + 1] = targetUnit
    if self.onBeforeLaunchMissile then
        local b = self:onBeforeLaunchMissile(self, targetUnit)
        if self._isDestroy then
            return
        end
        if b == false then
            return
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
    projectile.damageName = self.damageName
    projectile.speed = self.speed
    projectile.projectileModelScale = self.projectileModelScale
    projectile.colorR = self.colorR
    projectile.colorG = self.colorG
    projectile.colorB = self.colorB
    projectile.alpha = self.alpha
    projectile.damageTypeId = self.damageTypeId
    projectile.weaponTypeID = self.weaponTypeID
    projectile.attackType = self.attackType
    if lastHitUnit ~= nil then
        projectile.x = GetUnitX(lastHitUnit)
        projectile.y = GetUnitY(lastHitUnit)
    end
    if #self.hitUnitList < self.loopCount then
        projectile.onHitTarget = function(____, p)
            self:launch()
        end
    end
    if self.onLaunchMissile then
        self:onLaunchMissile(self, projectile)
        if self._isDestroy then
            return
        end
    end
    projectile:start()
    return projectile
end
function BounceMissileController.prototype.destroy(self)
    self._isDestroy = true
end
return ____exports
