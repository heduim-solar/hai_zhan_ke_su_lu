local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 6,["13"] = 6,["14"] = 6,["16"] = 15,["17"] = 15,["18"] = 15,["19"] = 17,["20"] = 18,["21"] = 19,["22"] = 20,["26"] = 17,["27"] = 25,["28"] = 26,["29"] = 27,["30"] = 28,["31"] = 29,["35"] = 25,["36"] = 15,["37"] = 15,["38"] = 13,["39"] = 39,["40"] = 40,["41"] = 41,["42"] = 41,["43"] = 41,["44"] = 41,["45"] = 41,["46"] = 41,["47"] = 41,["48"] = 42,["49"] = 43,["50"] = 44,["51"] = 44,["52"] = 44,["53"] = 45,["55"] = 44,["56"] = 44,["57"] = 48,["58"] = 49,["59"] = 49,["60"] = 49,["61"] = 49,["62"] = 49,["63"] = 49,["64"] = 50,["65"] = 53,["66"] = 39,["67"] = 8,["68"] = 10});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____ActorUnitUtil = require("solar.solar-common.actor.util.ActorUnitUtil")
local ActorUnitUtil = ____ActorUnitUtil.default
____exports.default = __TS__Class()
local _____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57 = ____exports.default
_____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57.name = "开局给Npc头上创建名字"
function _____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57.prototype.____constructor(self)
    BaseUtil.runLater(
        1.1,
        function()
            SelectUtil.forAllAliveUnits(function(____, unit)
                for ____, npcAbilityId in ipairs(____exports.default.npcAbilityIds) do
                    if GetUnitAbilityLevel(unit, npcAbilityId) > 0 and GetPlayerId(GetOwningPlayer(unit)) >= 4 then
                        ____exports.default:createTextTagForNpc(unit)
                        return
                    end
                end
            end)
            se:onUnitEnterMapRect(function(e)
                local unit = e.trigUnit
                for ____, npcAbilityId in ipairs(____exports.default.npcAbilityIds) do
                    if GetUnitAbilityLevel(unit, npcAbilityId) > 0 and GetPlayerId(GetOwningPlayer(unit)) >= 4 then
                        ____exports.default:createTextTagForNpc(unit)
                        return
                    end
                end
            end)
        end
    )
end
function _____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57.createTextTagForNpc(self, npc)
    local textTagHandle = CreateTextTag()
    SetTextTagColor(
        textTagHandle,
        255,
        208,
        80,
        255
    )
    local fontSize = 10 * 0.0023
    local text = GetUnitName(npc) or ""
    ActorUnitUtil:ifHasActorUnit(
        npc,
        function(____, actor)
            text = actor:getName()
            return
        end
    )
    SetTextTagText(textTagHandle, text, fontSize)
    SetTextTagPos(
        textTagHandle,
        GetUnitX(npc) - #text / 2 * 15,
        GetUnitY(npc),
        220
    )
    SetTextTagPermanent(textTagHandle, true)
    return textTagHandle
end
_____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57.cfg = {}
_____5F00_5C40_7ED9Npc_5934_4E0A_521B_5EFA_540D_5B57.npcAbilityIds = {"Aneu", "Apit", "Asid", "Avul"}
return ____exports
