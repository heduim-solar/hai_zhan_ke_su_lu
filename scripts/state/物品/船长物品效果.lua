local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 40,["21"] = 42,["22"] = 43,["23"] = 44,["24"] = 45,["27"] = 48,["28"] = 49,["29"] = 50,["30"] = 51,["31"] = 52,["32"] = 52,["33"] = 52,["34"] = 52,["35"] = 53,["37"] = 49,["38"] = 43,["39"] = 58,["40"] = 59,["41"] = 60,["42"] = 61,["45"] = 64,["46"] = 65,["47"] = 66,["48"] = 67,["49"] = 68,["50"] = 68,["51"] = 68,["52"] = 68,["53"] = 69,["55"] = 65,["56"] = 59,["57"] = 74,["58"] = 75,["59"] = 76,["60"] = 77,["63"] = 80,["64"] = 81,["65"] = 82,["66"] = 83,["69"] = 86,["70"] = 87,["71"] = 88,["72"] = 88,["73"] = 88,["74"] = 88,["75"] = 89,["77"] = 81,["78"] = 75,["79"] = 94,["80"] = 95,["81"] = 96,["82"] = 97,["85"] = 100,["86"] = 101,["87"] = 102,["88"] = 103,["91"] = 106,["92"] = 107,["93"] = 108,["94"] = 108,["95"] = 108,["96"] = 108,["97"] = 109,["99"] = 101,["100"] = 95,["101"] = 114,["102"] = 115,["103"] = 116,["104"] = 117,["107"] = 120,["108"] = 121,["109"] = 122,["110"] = 123,["113"] = 126,["114"] = 127,["115"] = 128,["116"] = 128,["117"] = 128,["118"] = 128,["119"] = 129,["121"] = 121,["122"] = 115,["123"] = 134,["124"] = 135,["125"] = 136,["126"] = 137,["129"] = 140,["130"] = 141,["131"] = 142,["132"] = 143,["135"] = 146,["136"] = 147,["137"] = 148,["138"] = 148,["139"] = 148,["140"] = 148,["141"] = 149,["143"] = 141,["144"] = 135,["145"] = 10});
local ____exports = {}
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____UnitRewardUtil = require("solar.solar-common.util.unit.UnitRewardUtil")
local UnitRewardUtil = ____UnitRewardUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = require("state.主炮.主炮基础事件")
local _____4E3B_70AE_57FA_7840_4E8B_4EF6 = _____4E3B_70AE_57FA_7840_4E8B_4EF6.default
____exports.default = __TS__Class()
local _____8239_957F_7269_54C1_6548_679C = ____exports.default
_____8239_957F_7269_54C1_6548_679C.name = "船长物品效果"
function _____8239_957F_7269_54C1_6548_679C.prototype.____constructor(self)
    local actorType = nil
    actorType = ActorTypeUtil:getActorType("赏金王")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.projectileModelScale = 0.3
        attackController.onHitTarget = function(____, projectile)
            local realAddGold = UnitRewardUtil:addGoldWithEarnGoldP(projectile.source, 3)
            if realAddGold ~= 0 then
                local textTagHandle = TextTagUtil.textGold(
                    "+" .. tostring(realAddGold),
                    projectile.target
                )
                SetTextTagVelocity(textTagHandle, 0.04, 0)
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("强盗王")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.projectileModelScale = 0.4
        attackController.onHitTarget = function(____, projectile)
            local realAddGold = UnitRewardUtil:addGoldWithEarnGoldP(projectile.source, 5)
            if realAddGold ~= 0 then
                local textTagHandle = TextTagUtil.textGold(
                    "+" .. tostring(realAddGold),
                    projectile.target
                )
                SetTextTagVelocity(textTagHandle, 0.04, 0)
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("山贼王")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.projectileModelScale = 0.6
        attackController.onHitTarget = function(____, projectile)
            local give_money = MapUtil:getUnitBounty(projectile.target)
            if give_money == nil then
                return
            end
            local realAddGold = UnitRewardUtil:addGoldWithEarnGoldP(projectile.source, 8 + give_money * 0.1)
            if realAddGold ~= 0 then
                local textTagHandle = TextTagUtil.textGold(
                    "+" .. tostring(realAddGold),
                    projectile.target
                )
                SetTextTagVelocity(textTagHandle, 0.04, 0)
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("海贼王")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.projectileModelScale = 0.8
        attackController.onHitTarget = function(____, projectile)
            local give_money = MapUtil:getUnitBounty(projectile.target)
            if give_money == nil then
                return
            end
            local realAddGold = UnitRewardUtil:addGoldWithEarnGoldP(projectile.source, 10 + give_money * 0.2)
            if realAddGold ~= 0 then
                local textTagHandle = TextTagUtil.textGold(
                    "+" .. tostring(realAddGold),
                    projectile.target
                )
                SetTextTagVelocity(textTagHandle, 0.04, 0)
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("娜米")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.projectileModelScale = 1
        attackController.onHitTarget = function(____, projectile)
            local give_money = MapUtil:getUnitBounty(projectile.target)
            if give_money == nil then
                return
            end
            local realAddGold = UnitRewardUtil:addGoldWithEarnGoldP(projectile.source, 15 + give_money * 0.4)
            if realAddGold ~= 0 then
                local textTagHandle = TextTagUtil.textGold(
                    "+" .. tostring(realAddGold),
                    projectile.target
                )
                SetTextTagVelocity(textTagHandle, 0.04, 0)
            end
        end
    end
    actorType = ActorTypeUtil:getActorType("猫·娜米")
    actorType.onUnitChange = function(____, actor, unit)
        local attackController = _____4E3B_70AE_57FA_7840_4E8B_4EF6:onUnitChange(actor, unit)
        if attackController == nil then
            return
        end
        attackController.projectileModelScale = 1.2
        attackController.onHitTarget = function(____, projectile)
            local give_money = MapUtil:getUnitBounty(projectile.target)
            if give_money == nil then
                return
            end
            local realAddGold = UnitRewardUtil:addGoldWithEarnGoldP(projectile.source, 20 + give_money * 0.8)
            if realAddGold ~= 0 then
                local textTagHandle = TextTagUtil.textGold(
                    "+" .. tostring(realAddGold),
                    projectile.target
                )
                SetTextTagVelocity(textTagHandle, 0.04, 0)
            end
        end
    end
end
return ____exports
