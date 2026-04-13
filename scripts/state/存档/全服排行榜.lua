local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 17,["17"] = 18,["18"] = 16,["19"] = 21,["20"] = 22,["21"] = 23,["22"] = 24,["25"] = 27,["26"] = 28,["27"] = 29,["28"] = 30,["29"] = 31,["30"] = 22,["31"] = 21,["32"] = 36,["33"] = 37,["34"] = 37,["35"] = 37,["36"] = 37,["37"] = 38,["40"] = 41,["41"] = 42,["42"] = 43,["45"] = 51,["46"] = 52,["47"] = 53,["48"] = 54,["49"] = 54,["50"] = 54,["51"] = 54,["52"] = 55,["53"] = 56,["55"] = 59,["58"] = 64,["59"] = 64,["60"] = 65,["61"] = 66,["62"] = 67,["63"] = 64,["66"] = 36,["67"] = 73,["68"] = 74,["69"] = 74,["70"] = 74,["71"] = 74,["72"] = 74,["73"] = 74,["74"] = 74,["75"] = 81,["76"] = 73,["77"] = 7,["78"] = 7,["79"] = 7,["80"] = 7,["81"] = 7,["82"] = 7,["83"] = 7});
local ____exports = {}
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local _____5168_670D_6392_884C_699C = ____exports.default
_____5168_670D_6392_884C_699C.name = "全服排行榜"
function _____5168_670D_6392_884C_699C.prototype.____constructor(self)
    ____exports.default["同步给所有玩家计算排行榜奖励"](____exports.default)
    ____exports.default["异步显示"](____exports.default)
end
_____5168_670D_6392_884C_699C["同步给所有玩家计算排行榜奖励"] = function(self)
    PlayerUtil:forUsers(function(____, player)
        local rankIndex = PlatUtil:getCustomRank(player, ____exports.default.config.rankKey)
        if rankIndex <= 0 or rankIndex > 99 then
            return
        end
        local jlVal = (100 - rankIndex) * 5
        local info = ((("你的" .. ____exports.default.config.rankName) .. "排名为") .. tostring(rankIndex)) .. ";"
        info = (info .. "获得金币奖励:") .. tostring(jlVal)
        PlayerUtil:addGoldState(player, jlVal)
        PlayerUtil:message(info, 3, player)
    end)
end
_____5168_670D_6392_884C_699C["异步显示"] = function(self)
    local myVal = PlatUtil:getStoreInt(
        GetLocalPlayer(),
        ____exports.default.config.archiveKey
    )
    if myVal == nil or myVal == 0 then
        return
    end
    local rankCount = PlatUtil:getCustomRankCount(____exports.default.config.rankKey)
    if rankCount <= 0 then
        print("没有榜单数据!")
        return
    end
    local myData = ____exports.default:register(-2)
    myData.icon = ____exports.default.config.myIcon
    myData.name = GetPlayerName(GetLocalPlayer())
    local customRank = PlatUtil:getCustomRank(
        GetLocalPlayer(),
        ____exports.default.config.rankKey
    )
    if customRank <= 0 then
        myData.describe = ("我的排名:|cff00ff00未上榜(前100名之外)榜单每天早上统计昨日的数据" .. "|r|n我的数值:|cff00ff00") .. tostring(myVal)
    else
        myData.describe = (("我的排名:|cff00ff00" .. tostring(customRank)) .. "|r|n我的数值:|cff00ff00") .. tostring(myVal)
    end
    do
        local i = 1
        while i < 100 and i < rankCount do
            local actorType = ____exports.default:register(i)
            actorType.name = tostring(PlatUtil:getCustomRankPlayerName(____exports.default.config.rankKey, i))
            actorType.describe = (((actorType.name .. ":|cff00ff00") .. tostring(PlatUtil:getCustomRankValue(____exports.default.config.rankKey, i))) .. "|r|n排名:") .. tostring(i)
            i = i + 1
        end
    end
end
function _____5168_670D_6392_884C_699C.register(self, id)
    local actorType = ActorTypeUtil:registerActorType({
        id = "_sl_:全服排行榜:" .. tostring(id),
        class = ____exports.default.config.rankName,
        icon = ____exports.default.config.baseIcon,
        uiShowType = "通用图标面板",
        uiEnable = true
    })
    return actorType
end
_____5168_670D_6392_884C_699C.config = {
    rankKey = 2,
    archiveKey = "Itsjf",
    rankName = "探索排行榜",
    myIcon = "ReplaceableTextures\\CommandButtons\\BTNMilitia.blp",
    baseIcon = "ReplaceableTextures\\CommandButtons\\BTNPeasant.blp"
}
return ____exports
