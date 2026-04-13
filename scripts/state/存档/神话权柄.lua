local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 10,["19"] = 10,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 10,["24"] = 9,["25"] = 17,["26"] = 20,["27"] = 21,["28"] = 21,["29"] = 21,["30"] = 21,["31"] = 22,["32"] = 23,["33"] = 24,["34"] = 25,["36"] = 27,["39"] = 31,["40"] = 17});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local _____795E_8BDD_6743_67C4_7D2F_8BA1_89E3_9501 = require("xlsx.存档.神话权柄累计解锁")
local ____d__795E_8BDD_6743_67C4_7D2F_8BA1_89E3_9501 = _____795E_8BDD_6743_67C4_7D2F_8BA1_89E3_9501["d_神话权柄累计解锁"]
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
____exports.default = __TS__Class()
local _____795E_8BDD_6743_67C4 = ____exports.default
_____795E_8BDD_6743_67C4.name = "神话权柄"
function _____795E_8BDD_6743_67C4.prototype.____constructor(self)
    BaseUtil.runLater(
        1,
        function()
            self:init()
        end
    )
end
function _____795E_8BDD_6743_67C4.prototype.init(self)
    local actorType = ActorTypeUtil:getActorType("神话权柄")
    local count = PlatUtil:getStoreInt(
        GetLocalPlayer(),
        "shqb"
    ) or 0
    local describe = ((actorType.describe .. "|n|cff00ff00当前数量:") .. tostring(count)) .. "  累计解锁:|n|r"
    for ____, data in ipairs(____d__795E_8BDD_6743_67C4_7D2F_8BA1_89E3_9501) do
        if count >= data.requireValMin then
            describe = ((((describe .. "|n|cff00ff00") .. tostring(data.requireValMin)) .. " ") .. data.describe) .. "|r"
        else
            describe = (((describe .. "|n") .. tostring(data.requireValMin)) .. " ") .. data.describe
        end
    end
    actorType.describe = describe
end
return ____exports
