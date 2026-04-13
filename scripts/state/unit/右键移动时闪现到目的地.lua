local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 7,["19"] = 7,["20"] = 7,["22"] = 15,["23"] = 16,["24"] = 17,["25"] = 16,["26"] = 20,["27"] = 21,["28"] = 22,["29"] = 23,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 25,["34"] = 25,["35"] = 25,["36"] = 26,["37"] = 27,["38"] = 27,["39"] = 27,["40"] = 27,["41"] = 29,["42"] = 29,["43"] = 29,["44"] = 29,["45"] = 29,["46"] = 29,["47"] = 30,["48"] = 31,["49"] = 31,["50"] = 31,["51"] = 32,["52"] = 31,["53"] = 31,["56"] = 20,["57"] = 12,["58"] = 9});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
____exports.default = __TS__Class()
local _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730 = ____exports.default
_____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730.name = "右键移动时闪现到目的地"
function _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730.prototype.____constructor(self)
    local tri = __TS__New(Trigger)
    PlayerUtil:forPlayingPlayers(function(____, player)
        TriggerRegisterPlayerUnitEvent(tri.handle, player, EVENT_PLAYER_UNIT_ISSUED_POINT_ORDER, nil)
    end)
    tri:addAction(function()
        local dw = GetTriggerUnit()
        local x = GetOrderPointX()
        local y = GetOrderPointY()
        if GetIssuedOrderId() == 851971 and MathUtil.distanceBetweenPoints(
            x,
            y,
            GetUnitX(dw),
            GetUnitY(dw)
        ) > 500 then
            local actorUnitTypeId = ActorUnitUtil:getActorUnitTypeId(dw)
            if __TS__ArrayIncludes(
                ____exports.default.cfg,
                id2string(GetUnitTypeId(dw))
            ) or actorUnitTypeId ~= nil and __TS__ArrayIncludes(____exports.default.cfg, actorUnitTypeId) then
                local angleBetweenCoords = MathUtil.angleBetweenCoords(
                    GetUnitX(dw),
                    GetUnitY(dw),
                    x,
                    y
                )
                SetUnitPosition(dw, x, y)
                BaseUtil.runLater(
                    0.1111,
                    function()
                        SetUnitFacingTimed(dw, angleBetweenCoords, 0)
                    end
                )
            end
        end
    end)
end
_____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730.cfg = {}
return ____exports
