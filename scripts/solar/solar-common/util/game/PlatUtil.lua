local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 5,["7"] = 5,["8"] = 7,["9"] = 7,["10"] = 7,["12"] = 7,["13"] = 15,["14"] = 16,["15"] = 15,["16"] = 25,["17"] = 26,["18"] = 25,["19"] = 36,["20"] = 37,["21"] = 36,["22"] = 44,["23"] = 45,["24"] = 44,["25"] = 52,["26"] = 53,["27"] = 52,["28"] = 60,["29"] = 61,["30"] = 60,["31"] = 68,["32"] = 69,["33"] = 68,["34"] = 76,["35"] = 77,["36"] = 76,["37"] = 84,["38"] = 85,["39"] = 84,["40"] = 96,["41"] = 97,["42"] = 96,["43"] = 104,["44"] = 105,["45"] = 104,["46"] = 116,["47"] = 117,["48"] = 116,["49"] = 126,["50"] = 127,["51"] = 126,["52"] = 137,["53"] = 138,["54"] = 138,["55"] = 138,["56"] = 138,["57"] = 138,["58"] = 137,["59"] = 147,["60"] = 148,["61"] = 147,["62"] = 158,["63"] = 159,["64"] = 160,["65"] = 161,["66"] = 162,["68"] = 164,["70"] = 166,["71"] = 168,["72"] = 169,["73"] = 158,["74"] = 176,["75"] = 177,["76"] = 177,["77"] = 177,["78"] = 177,["79"] = 177,["80"] = 177,["81"] = 177,["82"] = 177,["83"] = 177,["84"] = 177,["85"] = 176,["86"] = 185,["87"] = 186,["88"] = 186,["89"] = 186,["90"] = 186,["91"] = 186,["92"] = 186,["93"] = 186,["94"] = 186,["95"] = 186,["96"] = 186,["97"] = 185,["98"] = 194,["99"] = 195,["100"] = 195,["101"] = 195,["102"] = 195,["103"] = 195,["104"] = 195,["105"] = 195,["106"] = 195,["107"] = 195,["108"] = 195,["109"] = 194,["110"] = 204,["111"] = 205,["112"] = 205,["113"] = 205,["114"] = 205,["115"] = 205,["116"] = 205,["117"] = 205,["118"] = 205,["119"] = 205,["120"] = 205,["121"] = 204,["122"] = 214,["123"] = 215,["124"] = 215,["125"] = 215,["126"] = 215,["127"] = 215,["128"] = 215,["129"] = 215,["130"] = 215,["131"] = 215,["132"] = 215,["133"] = 214,["134"] = 227,["135"] = 228,["136"] = 228,["137"] = 228,["138"] = 228,["139"] = 228,["140"] = 228,["141"] = 228,["142"] = 228,["143"] = 228,["144"] = 228,["145"] = 227,["146"] = 238,["147"] = 239,["148"] = 239,["149"] = 239,["150"] = 239,["151"] = 239,["152"] = 239,["153"] = 239,["154"] = 239,["155"] = 239,["156"] = 239,["157"] = 238,["158"] = 247,["159"] = 248,["160"] = 248,["161"] = 248,["162"] = 248,["163"] = 248,["164"] = 248,["165"] = 248,["166"] = 248,["167"] = 248,["168"] = 248,["169"] = 247,["170"] = 256,["171"] = 257,["172"] = 257,["173"] = 257,["174"] = 257,["175"] = 257,["176"] = 257,["177"] = 257,["178"] = 257,["179"] = 257,["180"] = 257,["181"] = 256,["182"] = 265,["183"] = 266,["184"] = 266,["185"] = 266,["186"] = 266,["187"] = 266,["188"] = 266,["189"] = 266,["190"] = 266,["191"] = 266,["192"] = 266,["193"] = 265,["194"] = 275,["195"] = 276,["196"] = 276,["197"] = 276,["198"] = 276,["199"] = 276,["200"] = 276,["201"] = 276,["202"] = 276,["203"] = 276,["204"] = 276,["205"] = 275,["206"] = 285,["207"] = 286,["208"] = 286,["209"] = 286,["210"] = 286,["211"] = 286,["212"] = 286,["213"] = 286,["214"] = 286,["215"] = 286,["216"] = 286,["217"] = 285,["218"] = 294,["219"] = 295,["220"] = 296,["222"] = 298,["223"] = 294});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local PlatUtil = ____exports.default
PlatUtil.name = "PlatUtil"
function PlatUtil.prototype.____constructor(self)
end
function PlatUtil.hasMallItem(self, p, key)
    return DzAPI_Map_HasMallItem(p, key)
end
function PlatUtil.getMallItemCount(self, p, key)
    return DzAPI_Map_GetMallItemCount(p, key)
end
function PlatUtil.consumeMallItem(self, p, key, count)
    return DzAPI_Map_ConsumeMallItem(p, key, count)
end
function PlatUtil.getMapLevel(self, p)
    return DzAPI_Map_GetMapLevel(p)
end
function PlatUtil.continuousCount(self, p)
    return DzAPI_Map_ContinuousCount(p, 0)
end
function PlatUtil.getForumDataTotalLikes(self, p)
    return DzAPI_Map_GetForumData(p, 0)
end
function PlatUtil.getForumDataTotalSubject(self, p)
    return DzAPI_Map_GetForumData(p, 6)
end
function PlatUtil.isCollect(self, p)
    return DzAPI_Map_Returns(p, 16)
end
function PlatUtil.getGuildName(self, p)
    return DzAPI_Map_GetGuildName(p)
end
function PlatUtil.setStat(self, whichPlayer, key, value)
    DzAPI_Map_Stat_SetStat(whichPlayer, key, value)
end
function PlatUtil.mapsTotalPlayed(self, whichPlayer)
    return DzAPI_Map_MapsTotalPlayed(whichPlayer)
end
function PlatUtil.storeStr(self, whichPlayer, key, value)
    DzAPI_Map_StoreString(whichPlayer, key, value)
end
function PlatUtil.getStoreStr(self, whichPlayer, key)
    return DzAPI_Map_GetStoredString(whichPlayer, key)
end
function PlatUtil.storeInt(self, whichPlayer, key, value)
    return DzAPI_Map_SaveServerValue(
        whichPlayer,
        key,
        I2S(value)
    )
end
function PlatUtil.getStoreInt(self, whichPlayer, key)
    return S2I(DzAPI_Map_GetServerValue(whichPlayer, key))
end
function PlatUtil.addStoreInt(self, whichPlayer, key, addValue)
    local oldNum = 0
    local playerSolarData = DataBase:getPlayerSolarData(whichPlayer)
    if playerSolarData["_sl_addStoreInt:" .. key] then
        oldNum = playerSolarData["_sl_addStoreInt:" .. key]
    else
        oldNum = ____exports.default:getStoreInt(whichPlayer, key) or 0
    end
    local newNum = oldNum + addValue
    playerSolarData["_sl_addStoreInt:" .. key] = newNum
    return ____exports.default:storeInt(whichPlayer, key, newNum)
end
function PlatUtil.getPlayerUserName(self, whichPlayer)
    return RequestExtraIntegerData(
        81,
        whichPlayer,
        nil,
        nil,
        false,
        0,
        0,
        0
    )
end
function PlatUtil.getCustomRank(self, whichPlayer, id)
    return RequestExtraIntegerData(
        52,
        whichPlayer,
        nil,
        nil,
        false,
        id,
        0,
        0
    )
end
function PlatUtil.getCustomRankCount(self, id)
    return RequestExtraIntegerData(
        78,
        nil,
        nil,
        nil,
        false,
        id,
        0,
        0
    )
end
function PlatUtil.getCustomRankPlayerName(self, id, ranking)
    return RequestExtraStringData(
        79,
        nil,
        nil,
        nil,
        false,
        id,
        ranking,
        0
    )
end
function PlatUtil.getCustomRankValue(self, id, ranking)
    return RequestExtraIntegerData(
        80,
        nil,
        nil,
        nil,
        false,
        id,
        ranking,
        0
    )
end
function PlatUtil.requestBackendLogic(self, whichPlayer, key, groupkey)
    return RequestExtraBooleanData(
        83,
        whichPlayer,
        key,
        groupkey,
        false,
        0,
        0,
        0
    )
end
function PlatUtil.checkBackendLogicExists(self, whichPlayer, key)
    return RequestExtraBooleanData(
        84,
        whichPlayer,
        key,
        nil,
        false,
        0,
        0,
        0
    )
end
function PlatUtil.getBackendLogicIntResult(self, whichPlayer, key)
    return RequestExtraIntegerData(
        85,
        whichPlayer,
        key,
        nil,
        false,
        0,
        0,
        0
    )
end
function PlatUtil.getBackendLogicUpdateTime(self, whichPlayer, key)
    return RequestExtraIntegerData(
        87,
        whichPlayer,
        key,
        nil,
        false,
        0,
        0,
        0
    )
end
function PlatUtil.getBackendLogicGroup(self, whichPlayer, key)
    return RequestExtraStringData(
        88,
        whichPlayer,
        key,
        nil,
        false,
        0,
        0,
        0
    )
end
function PlatUtil.removeBackendLogicResult(self, whichPlayer, key)
    return RequestExtraBooleanData(
        89,
        whichPlayer,
        key,
        nil,
        false,
        0,
        0,
        0
    )
end
function PlatUtil.getServerValueLimitLeft(self, whichPlayer, key)
    return RequestExtraIntegerData(
        82,
        whichPlayer,
        key,
        nil,
        false,
        0,
        0,
        0
    )
end
function PlatUtil.getPlayerGUID(self, player)
    if KKApiPlayerGUID then
        return KKApiPlayerGUID(player)
    end
    return GetPlayerName(player)
end
return ____exports
