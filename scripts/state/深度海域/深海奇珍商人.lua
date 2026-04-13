local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 12,["21"] = 13,["22"] = 14,["23"] = 15,["24"] = 16,["25"] = 19,["26"] = 21,["27"] = 22,["30"] = 25,["31"] = 15,["32"] = 10});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____6DF1_5EA6_6D77_57DF = require("state.深度海域.深度海域")
local _____6DF1_5EA6_6D77_57DF = _____6DF1_5EA6_6D77_57DF.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
____exports.default = __TS__Class()
local _____6DF1_6D77_5947_73CD_5546_4EBA = ____exports.default
_____6DF1_6D77_5947_73CD_5546_4EBA.name = "深海奇珍商人"
function _____6DF1_6D77_5947_73CD_5546_4EBA.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("深海下一关")
    local actorTypeAbility = ActorTypeShopUtil:warpActorItem2SellingAbility("深海下一关")
    actorTypeAbility.maxCd = 3
    actorType.onBuy = function(____, actor, buyingUnit)
        actor:destroy()
        local realNanduLevel = MapUtil:getRealNanduLevel()
        if gv["深度海域层数"] >= realNanduLevel then
            PlayerUtil:message(("当前难度下只能探索到此层数:" .. tostring(realNanduLevel)) .. " 如需探索更深层数下一局请开更高游戏难度。")
            return
        end
        _____6DF1_5EA6_6D77_57DF["进入深度海域"](_____6DF1_5EA6_6D77_57DF, gv["深度海域层数"] + 1)
    end
end
return ____exports
