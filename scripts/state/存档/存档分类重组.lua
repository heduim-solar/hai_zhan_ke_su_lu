local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 7,["17"] = 7,["18"] = 7,["20"] = 12,["21"] = 12,["22"] = 12,["23"] = 13,["24"] = 22,["25"] = 23,["26"] = 24,["27"] = 24,["28"] = 24,["29"] = 24,["30"] = 25,["31"] = 25,["32"] = 25,["33"] = 25,["36"] = 12,["37"] = 12,["38"] = 31,["39"] = 31,["40"] = 31,["41"] = 32,["42"] = 31,["43"] = 31,["44"] = 10,["45"] = 38,["46"] = 39,["47"] = 39,["48"] = 40,["49"] = 39,["50"] = 39,["51"] = 39,["52"] = 42,["53"] = 42,["54"] = 43,["55"] = 42,["56"] = 42,["57"] = 42,["58"] = 45,["59"] = 45,["60"] = 46,["61"] = 45,["62"] = 45,["63"] = 45,["64"] = 48,["65"] = 48,["66"] = 49,["67"] = 48,["68"] = 48,["69"] = 48,["70"] = 38,["71"] = 55,["72"] = 56,["73"] = 57,["74"] = 58,["75"] = 59,["76"] = 60,["77"] = 61,["79"] = 63,["82"] = 55});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local _____51FB_6740BOSS_88C5_5907_5B58_6863 = require("xlsx.存档.击杀BOSS装备存档")
local ____d__51FB_6740BOSS_88C5_5907_5B58_6863 = _____51FB_6740BOSS_88C5_5907_5B58_6863["d_击杀BOSS装备存档"]
local _____901A_5173_5956_52B1 = require("xlsx.存档.通关奖励")
local ____d__901A_5173_5956_52B1 = _____901A_5173_5956_52B1["d_通关奖励"]
____exports.default = __TS__Class()
local _____5B58_6863_5206_7C7B_91CD_7EC4 = ____exports.default
_____5B58_6863_5206_7C7B_91CD_7EC4.name = "存档分类重组"
function _____5B58_6863_5206_7C7B_91CD_7EC4.prototype.____constructor(self)
    BaseUtil.runLater(
        0.11,
        function()
            ____exports.default["重组"](____exports.default)
            for ____, data in ipairs(____d__51FB_6740BOSS_88C5_5907_5B58_6863) do
                if data.val1 == 1 then
                    local archiveVal = ArchiveUtil:get(
                        GetLocalPlayer(),
                        data.requireKey
                    ) or 0
                    ActorTypeUtil:setTypeDescribe(
                        data.id,
                        (("|cff00ff00当前数量:" .. tostring(archiveVal)) .. "|r|n") .. data.describe
                    )
                end
            end
        end
    )
    BaseUtil.runLater(
        5,
        function()
            ____exports.default["渐进式显示图标"](____exports.default)
        end
    )
end
_____5B58_6863_5206_7C7B_91CD_7EC4["重组"] = function(self)
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.class = "击杀BOSS"
        end,
        "深度海域"
    )
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.class = "基础礼包"
        end,
        "地图等级"
    )
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.class = "基础礼包"
        end,
        "礼包奖励"
    )
    ActorTypeUtil:forAllActorTypes(
        function(____, actorType)
            actorType.class = "基础礼包"
        end,
        "通关奖励"
    )
end
_____5B58_6863_5206_7C7B_91CD_7EC4["渐进式显示图标"] = function(self)
    local lastOpen = true
    for ____, dataType in ipairs(____d__901A_5173_5956_52B1) do
        if dataType.id and ActorTypeUtil:hasActorType(dataType.id) then
            local actorType = ActorTypeUtil:getActorType(dataType.id)
            if lastOpen == true and actorType.hide == true then
                actorType.hide = false
            end
            lastOpen = actorType.uiEnable
        end
    end
end
return ____exports
