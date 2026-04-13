local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__NumberToFixed = ____lualib.__TS__NumberToFixed
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 6,["14"] = 6,["15"] = 7,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 14,["25"] = 16,["26"] = 17,["27"] = 19,["28"] = 20,["31"] = 23,["32"] = 24,["35"] = 14,["36"] = 33,["37"] = 13,["38"] = 13,["39"] = 12,["40"] = 38,["41"] = 39,["44"] = 43,["45"] = 45,["48"] = 48,["49"] = 49,["51"] = 54,["52"] = 55,["53"] = 57,["54"] = 65,["55"] = 65,["56"] = 65,["57"] = 65,["58"] = 66,["59"] = 66,["60"] = 66,["61"] = 66,["62"] = 67,["63"] = 67,["64"] = 68,["65"] = 68,["66"] = 68,["67"] = 68,["69"] = 38});
local ____exports = {}
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
____exports.default = __TS__Class()
local _____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A = ____exports.default
_____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A.name = "主炮演员属性实时刷新提示"
function _____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A.prototype.____constructor(self)
    BaseUtil.onTimer(
        10,
        function()
            PlayerUtil:forUsers(function(____, player)
                local hero = PlayerUtil:getHero(player)
                if IsHandle(hero) then
                    local actorList = ActorUtil:getUnitAllActorList(hero)
                    if actorList == nil or #actorList == 0 then
                        return
                    end
                    for ____, actor in ipairs(actorList) do
                        ____exports.default["刷新提示"](____exports.default, actor)
                    end
                end
            end)
            return true
        end
    )
end
_____4E3B_70AE_6F14_5458_5C5E_6027_5B9E_65F6_5237_65B0_63D0_793A["刷新提示"] = function(self, actor)
    if not IsHandle(actor.unit) or actor:isDestroyed() then
        return
    end
    local ctrl = actor.autoMissileAttackController
    if ctrl == nil then
        return
    end
    if ctrl.damageStateFormula == nil then
        print("伤害公式不存在:" .. actor.actorTypeId)
    end
    local attribute = AttributeUtil:getUnitAttribute(actor.unit, false)
    local r = (ctrl.range + ctrl.extRange + (attribute and attribute.autoMissileAttackRange or 0)) * (1 + (attribute and attribute.autoMissileAttackRange_p or 0))
    local cd = ctrl.coolDown / (1 + (attribute and attribute.autoMissileAttackSpeed or 0))
    actor:setExtDescribe(
        "当前范围:|cff00ff00",
        tostring(math.floor(r))
    )
    actor:setExtDescribe(
        "当前射速:|cff00ff00",
        tostring(__TS__NumberToFixed(cd, 2))
    )
    local ____opt_6 = ctrl.damageStateFormula
    if ____opt_6 and ____opt_6.increased then
        actor:setExtDescribe(
            "当前增伤:|cff00ff00",
            TextUtil:toPercentage(ctrl.damageStateFormula.increased)
        )
    end
end
return ____exports
