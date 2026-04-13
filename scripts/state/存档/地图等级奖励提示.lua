local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 10,["19"] = 10,["20"] = 10,["21"] = 11,["22"] = 10,["23"] = 10,["24"] = 9,["25"] = 17,["26"] = 20,["27"] = 21,["28"] = 22,["29"] = 23,["31"] = 24,["32"] = 25,["34"] = 27,["35"] = 28,["36"] = 29,["38"] = 31,["43"] = 35,["44"] = 17});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local _____5730_56FE_7B49_7EA7_5956_52B1 = require("xlsx.存档.地图等级奖励")
local ____d__5730_56FE_7B49_7EA7_5956_52B1 = _____5730_56FE_7B49_7EA7_5956_52B1["d_地图等级奖励"]
____exports.default = __TS__Class()
local _____5730_56FE_7B49_7EA7_5956_52B1_63D0_793A = ____exports.default
_____5730_56FE_7B49_7EA7_5956_52B1_63D0_793A.name = "地图等级奖励提示"
function _____5730_56FE_7B49_7EA7_5956_52B1_63D0_793A.prototype.____constructor(self)
    BaseUtil.runLater(
        1,
        function()
            self:init()
        end
    )
end
function _____5730_56FE_7B49_7EA7_5956_52B1_63D0_793A.prototype.init(self)
    local actorType = ActorTypeUtil:getActorType("地图等级")
    local count = PlatUtil:getMapLevel(GetLocalPlayer()) or 0
    local describe = ((actorType.describe .. "|n|cff00ff00当前等级:") .. tostring(count)) .. "  累计解锁:|n|r"
    for ____, data in ipairs(____d__5730_56FE_7B49_7EA7_5956_52B1) do
        do
            if data.requireValMin < 1 then
                goto __continue5
            end
            if count >= data.requireValMin then
                describe = ((((describe .. "|n|cff00ff00") .. tostring(data.requireValMin)) .. " ") .. data.describe) .. "|r"
                actorType.uiEnable = true
            else
                describe = (((describe .. "|n") .. tostring(data.requireValMin)) .. " ") .. data.describe
            end
        end
        ::__continue5::
    end
    actorType.describe = describe
end
return ____exports
