local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 10,["23"] = 10,["24"] = 10,["29"] = 19,["30"] = 20,["31"] = 21,["32"] = 22,["33"] = 23,["34"] = 24,["35"] = 25,["36"] = 26,["38"] = 28,["39"] = 29,["40"] = 30,["41"] = 30,["42"] = 31,["43"] = 32,["46"] = 34,["47"] = 34,["48"] = 35,["49"] = 36,["50"] = 34,["54"] = 39,["55"] = 40,["56"] = 41,["58"] = 43,["61"] = 21,["62"] = 47,["63"] = 48,["64"] = 49,["65"] = 50,["67"] = 52,["68"] = 53,["69"] = 54,["70"] = 56,["71"] = 58,["73"] = 59,["74"] = 59,["75"] = 60,["76"] = 61,["77"] = 62,["78"] = 63,["79"] = 63,["80"] = 63,["81"] = 63,["82"] = 63,["83"] = 63,["84"] = 63,["85"] = 63,["86"] = 63,["87"] = 59,["91"] = 47,["92"] = 13});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
____exports.default = __TS__Class()
local _____65CB_8F6C_98DE_8F6E_53F7_57FA_7840_6280_80FD = ____exports.default
_____65CB_8F6C_98DE_8F6E_53F7_57FA_7840_6280_80FD.name = "旋转飞轮号基础技能"
function _____65CB_8F6C_98DE_8F6E_53F7_57FA_7840_6280_80FD.prototype.____constructor(self)
    --- "旋转飞轮号
    -- 每拥有一个主炮，旋转飞轮号会拥有一个飞轮进行环绕。飞轮伤害频率为0.3s/次。
    -- 每次触碰造成攻击力x1的伤害。"
    local actorType = ActorTypeUtil:getActorType("旋转飞轮号基础技能")
    actorType.interval = 0.05
    actorType.onUnitChange = function(____, actor, unit)
        local effects = actor.effects
        if IsHandle(unit) then
            if effects == nil then
                effects = {}
                actor.effects = effects
            end
            local modelPath = "Abilities\\Weapons\\SentinelMissile\\SentinelMissile.mdl"
            local modelScale = actor:get("modelScale", 1)
            local ____opt_0 = ActorUtil:getUnitAllActorListByClass(actor.unit, "主炮")
            local zpCount = ____opt_0 and #____opt_0 or 0
            if _____9B54_6539_9053_5177["主炮是否拥有魔改道具"](_____9B54_6539_9053_5177, actor) then
                zpCount = zpCount + 3
            end
            do
                local i = 0
                while i < zpCount do
                    local effect = EffectUtil:addSpecialEffect(modelPath, actor.unitX, actor.unitY, modelScale)
                    effects[#effects + 1] = effect
                    i = i + 1
                end
            end
        else
            if effects then
                for ____, effect in ipairs(effects) do
                    EffectUtil:destroyEffectNoDeathAnim(effect)
                end
                actor.effects = nil
            end
        end
    end
    actorType.onUnitInterval = function(____, actor)
        actor.aface = (actor.aface or 0) - 10
        if actor.aface <= -360 then
            actor.aface = 0
        end
        local effects = actor.effects
        local faceGap = 360 / #effects
        if effects then
            local damage = UnitStateUtil:calculateStateFormula({attack = 0.2}, actor.unit)
            local loc = nil
            do
                local i = 0
                while i < #effects do
                    local effect = effects[i + 1]
                    loc = MathUtil.polarProjection(actor.unitX, actor.unitY, 300, actor.aface + faceGap * i)
                    EXSetEffectXY(effect, loc.x, loc.y)
                    DamageRecordUtil:damageEnemyUnitsInRange(
                        actor:getName(),
                        actor.unit,
                        200,
                        damage,
                        DamageType["s_物理"],
                        loc.x,
                        loc.y
                    )
                    i = i + 1
                end
            end
        end
    end
end
return ____exports
