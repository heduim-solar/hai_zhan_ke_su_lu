local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 64,["25"] = 64,["26"] = 64,["28"] = 64,["29"] = 64,["31"] = 25,["32"] = 27,["33"] = 29,["34"] = 30,["35"] = 31,["36"] = 33,["37"] = 35,["38"] = 37,["39"] = 39,["40"] = 41,["41"] = 43,["42"] = 48,["43"] = 50,["44"] = 53,["45"] = 54,["46"] = 55,["47"] = 56,["48"] = 62,["49"] = 65,["50"] = 66,["51"] = 67,["52"] = 68,["53"] = 69,["54"] = 71,["55"] = 72,["58"] = 75,["59"] = 76,["62"] = 80,["63"] = 81,["64"] = 64,["65"] = 84,["66"] = 85,["67"] = 86,["68"] = 86,["69"] = 86,["70"] = 86,["71"] = 86,["73"] = 88,["74"] = 89,["75"] = 90,["76"] = 90,["77"] = 90,["78"] = 90,["79"] = 91,["80"] = 92,["81"] = 92,["82"] = 92,["83"] = 92,["85"] = 84,["86"] = 96,["87"] = 97,["88"] = 96,["89"] = 101,["90"] = 103,["91"] = 104,["92"] = 104,["93"] = 104,["94"] = 104,["95"] = 104,["96"] = 104,["97"] = 105,["98"] = 107,["99"] = 107,["100"] = 107,["101"] = 108,["102"] = 109,["105"] = 112,["106"] = 113,["107"] = 114,["109"] = 116,["110"] = 117,["112"] = 120,["113"] = 107,["114"] = 107,["115"] = 107,["116"] = 101,["117"] = 125,["118"] = 126,["119"] = 127,["121"] = 127,["123"] = 128,["124"] = 125,["125"] = 131,["126"] = 132,["127"] = 133,["128"] = 134,["129"] = 135,["130"] = 136,["131"] = 137,["132"] = 138,["133"] = 140,["134"] = 141,["135"] = 143,["136"] = 144,["137"] = 145,["138"] = 146,["140"] = 148,["141"] = 149,["142"] = 150,["143"] = 152,["144"] = 153,["145"] = 155,["146"] = 156,["147"] = 156,["148"] = 156,["149"] = 156,["150"] = 159,["151"] = 160,["153"] = 160,["155"] = 161,["156"] = 162,["157"] = 163,["158"] = 163,["159"] = 163,["160"] = 163,["161"] = 163,["162"] = 163,["163"] = 163,["164"] = 163,["165"] = 163,["166"] = 163,["167"] = 163,["169"] = 165,["170"] = 165,["171"] = 165,["172"] = 165,["173"] = 165,["174"] = 165,["175"] = 165,["176"] = 165,["177"] = 165,["178"] = 165,["181"] = 168,["183"] = 131});
local ____exports = {}
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____WeaponType = require("solar.solar-common.constant.WeaponType")
local WeaponType = ____WeaponType.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____DamageUtil = require("solar.solar-common.util.system.DamageUtil")
local DamageUtil = ____DamageUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
____exports.default = __TS__Class()
local Projectile = ____exports.default
Projectile.name = "Projectile"
function Projectile.prototype.____constructor(self, source, target, damage, projectileModelPath, onHitTarget)
    if damage == nil then
        damage = 0
    end
    if projectileModelPath == nil then
        projectileModelPath = "Abilities\\Weapons\\RocketMissile\\RocketMissile.mdx"
    end
    self.projectileModelScale = 1
    self.projectileHeight = 50
    self.colorR = 255
    self.colorG = 255
    self.colorB = 255
    self.alpha = 255
    self.speed = 1000
    self._sl_lifeTime = 0
    self._sl_distance = 0
    self.lifeTimeMax = 0
    self.distanceMax = 0
    self.sTimer = __TS__New(STimer)
    self.updateInterval = 0.03
    self.damage = 0
    self.damageTypeId = DamageType["s_法术"]
    self.weaponTypeID = WeaponType.T0_WHOKNOWS
    self.attackType = ATTACK_TYPE_CHAOS
    self.done = false
    self.source = source
    self.target = target
    self.projectileModelPath = projectileModelPath
    self.damage = damage
    self.onHitTarget = onHitTarget
    if not IsHandle(self.source) then
        log.errorWithTraceBack("投射物发射源单位不能为空!")
        return
    end
    if not IsHandle(self.target) then
        log.errorWithTraceBack("投射物目标单位不能为空!")
        return
    end
    self.x = GetUnitX(self.source)
    self.y = GetUnitY(self.source)
end
function Projectile.prototype.init(self)
    if self.projectileModel == nil and self.projectileModelPath ~= nil then
        self.projectileModel = AddSpecialEffect(
            self.projectileModelPath,
            GetUnitX(self.source),
            GetUnitY(self.source)
        )
    end
    EXSetEffectSize(self.projectileModel, self.projectileModelScale)
    if EXSetEffectColor then
        EXSetEffectColor(
            self.projectileModel,
            DzGetColor(self.colorR, self.colorG, self.colorB, self.alpha)
        )
    elseif DzSetEffectVertexColor then
        DzSetEffectVertexColor(
            self.projectileModel,
            DzGetColor(self.colorR, self.colorG, self.colorB, self.alpha)
        )
    end
end
function Projectile.prototype.stop(self)
    self.done = true
end
function Projectile.prototype.start(self)
    self:init()
    local angleBetweenCoords = MathUtil.angleBetweenCoords(
        self.x,
        self.y,
        GetUnitX(self.target),
        GetUnitY(self.target)
    )
    EXEffectMatRotateZ(self.projectileModel, angleBetweenCoords)
    self.sTimer:start(
        self.updateInterval,
        function()
            if self.done then
                self:destroy()
                return
            end
            self._sl_lifeTime = self._sl_lifeTime + self.updateInterval
            if self.lifeTimeMax > 0 and self._sl_lifeTime > self.lifeTimeMax then
                self:destroy()
            end
            if self.distanceMax > 0 and self._sl_distance > self.distanceMax then
                self:destroy()
            end
            self:update()
        end,
        true
    )
end
function Projectile.prototype.destroy(self)
    self.done = true
    local ____opt_0 = self.sTimer
    if ____opt_0 ~= nil then
        ____opt_0:destroy()
    end
    DestroyEffect(self.projectileModel)
end
function Projectile.prototype.update(self)
    local tx = GetUnitX(self.target)
    local ty = GetUnitY(self.target)
    local sx = self.x
    local sy = self.y
    local dtsx = tx - sx
    local dtsy = ty - sy
    local c = math.sqrt(dtsx * dtsx + dtsy * dtsy)
    local d1x = dtsx / c
    local d1y = dtsy / c
    local travelDistance = math.min(c, self.speed * self.updateInterval)
    local doneTemp = c <= travelDistance
    if doneTemp then
        travelDistance = c
    end
    self._sl_distance = self._sl_distance + travelDistance
    local dx = d1x * travelDistance
    local dy = d1y * travelDistance
    self.x = self.x + dx
    self.y = self.y + dy
    EXSetEffectXY(self.projectileModel, self.x, self.y)
    EXSetEffectZ(
        self.projectileModel,
        GameUtil:getTerrainHeight(self.x, self.y) + self.projectileHeight
    )
    if doneTemp and not self.done then
        local ____opt_2 = self.onHitTarget
        if ____opt_2 ~= nil then
            ____opt_2(self, self)
        end
        if self.damage > 0 then
            if self.damageName then
                DamageRecordUtil:damage(
                    self.damageName,
                    self.source,
                    self.target,
                    self.damage,
                    self.damageTypeId,
                    self.weaponTypeID,
                    true,
                    false,
                    self.attackType
                )
            else
                DamageUtil:damage(
                    self.source,
                    self.target,
                    self.damage,
                    self.damageTypeId,
                    self.weaponTypeID,
                    true,
                    false,
                    self.attackType
                )
            end
        end
        self.done = true
    end
end
return ____exports
