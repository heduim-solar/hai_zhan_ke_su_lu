local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 14,["31"] = 14,["32"] = 14,["34"] = 27,["35"] = 28,["36"] = 29,["37"] = 30,["40"] = 33,["41"] = 34,["44"] = 37,["45"] = 38,["46"] = 39,["47"] = 40,["48"] = 41,["49"] = 41,["50"] = 41,["51"] = 41,["52"] = 41,["53"] = 41,["54"] = 41,["55"] = 41,["56"] = 41,["57"] = 42,["58"] = 42,["59"] = 42,["60"] = 42,["61"] = 42,["62"] = 42,["63"] = 44,["64"] = 44,["65"] = 44,["66"] = 44,["67"] = 45,["68"] = 46,["69"] = 47,["70"] = 47,["71"] = 47,["72"] = 47,["73"] = 47,["74"] = 47,["75"] = 48,["76"] = 44,["77"] = 44,["78"] = 44,["79"] = 44,["80"] = 33,["81"] = 28,["82"] = 24});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____DamageRecordUtil = require("solar.solar-common.util.other.DamageRecordUtil")
local DamageRecordUtil = ____DamageRecordUtil.default
local ____DamageType = require("solar.solar-common.constant.DamageType")
local DamageType = ____DamageType.default
local ____EffectUtil = require("solar.solar-common.util.game.EffectUtil")
local EffectUtil = ____EffectUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____JumpUtil = require("solar.solar-common.util.action.JumpUtil")
local JumpUtil = ____JumpUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
____exports.default = __TS__Class()
local _____8239_957F_53F7_4E3B_70AE = ____exports.default
_____8239_957F_53F7_4E3B_70AE.name = "船长号主炮"
function _____8239_957F_53F7_4E3B_70AE.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("船长号")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.onHitTarget = function(____, projectile)
            if not RandomUtil.isInChance(ActorUtil:isUnitHasActor(actor.unit, "麦哲伦") and 0.25 or 0.13) then
                return
            end
            TextTagUtil.text("击飞", projectile.target)
            local damage = UnitStateUtil:calculateStateFormula({str = 6}, actor.unit)
            local x = GetUnitX(projectile.target)
            local y = GetUnitY(projectile.target)
            DamageRecordUtil:damageEnemyUnitsInRange(
                actor:getName(),
                actor.unit,
                350,
                damage,
                DamageType["s_物理"],
                x,
                y
            )
            EffectUtil:addSpecialEffectAndDestroy(
                actor:get("model", "圆形范围伤害特效\\devilslam.mdx"),
                x,
                y,
                actor:get("modelScale", 0.5)
            )
            SelectUtil.forEnemyUnitsInRange(
                projectile.source,
                350,
                function(____, enemy)
                    local enemyX = GetUnitX(enemy)
                    local enemyY = GetUnitY(enemy)
                    local pv = MathUtil.polarProjection(
                        enemyX,
                        enemyY,
                        200,
                        MathUtil.angleBetweenCoords(x, y, enemyX, enemyY)
                    )
                    JumpUtil:jump(enemy, pv.x, pv.y, 300)
                end,
                x,
                y
            )
        end
    end
end
return ____exports
