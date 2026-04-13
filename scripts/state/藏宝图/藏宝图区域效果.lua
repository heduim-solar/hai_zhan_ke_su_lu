local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 9,["19"] = 10,["20"] = 10,["21"] = 10,["22"] = 10,["23"] = 10,["24"] = 10,["25"] = 10,["26"] = 10,["27"] = 19,["28"] = 19,["29"] = 19,["30"] = 20,["31"] = 22,["34"] = 27,["35"] = 28,["36"] = 28,["37"] = 28,["38"] = 28,["39"] = 28,["40"] = 28,["41"] = 28,["42"] = 28,["43"] = 28,["44"] = 29,["46"] = 19,["47"] = 19,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 33,["52"] = 34,["53"] = 35,["55"] = 32,["56"] = 32,["57"] = 8});
local ____exports = {}
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
____exports.default = __TS__Class()
local _____85CF_5B9D_56FE_533A_57DF_6548_679C = ____exports.default
_____85CF_5B9D_56FE_533A_57DF_6548_679C.name = "藏宝图区域效果"
function _____85CF_5B9D_56FE_533A_57DF_6548_679C.prototype.____constructor(self)
    local _____85CF_5B9D_56FE_533A_57DF_964D_4F4E_79FB_901F = "藏宝图区域降低移速"
    ActorTypeUtil:registerActorType({
        id = _____85CF_5B9D_56FE_533A_57DF_964D_4F4E_79FB_901F,
        name = "降低100%移速",
        describe = "藏宝图区域降低移速100%移速",
        icon = "ReplaceableTextures\\CommandButtons\\BTNFrostBolt.blp",
        model = "Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdx",
        attribute = {move_speed = -1000}
    })
    se:onEnterRect(
        gg_rct_left_top,
        function(e)
            local idStr = e.trigUnitTypeIdStr
            if ActorUtil:isUnitHasActor(e.trigUnit, "水手号") or ActorUtil:isUnitHasActor(e.trigUnit, "水手号·改") or ActorUtil:isUnitHasActor(e.trigUnit, "水手号基础技能") or ActorUtil:isUnitHasActor(e.trigUnit, "水手号·改基础技能") then
                return
            end
            if e.trigUnitOwnerId < 6 then
                TextTagUtil.text(
                    "受到强烈冰冻,移速降低100%",
                    e.trigUnit,
                    18,
                    3,
                    255,
                    0,
                    0
                )
                ActorBuffUtil:addActorBuff(e.trigUnit, _____85CF_5B9D_56FE_533A_57DF_964D_4F4E_79FB_901F)
            end
        end
    )
    se:onLeaveRect(
        gg_rct_left_top,
        function(e)
            local trigUnit = e.trigUnit
            if e.trigUnitOwnerId < 6 then
                ActorBuffUtil:clearUnitActorBuff(trigUnit, _____85CF_5B9D_56FE_533A_57DF_964D_4F4E_79FB_901F)
            end
        end
    )
end
return ____exports
