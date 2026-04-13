local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 12,["11"] = 12,["12"] = 12,["14"] = 12,["15"] = 24,["16"] = 24,["17"] = 24,["19"] = 25,["20"] = 26,["21"] = 27,["23"] = 29,["24"] = 30,["25"] = 31,["27"] = 33,["28"] = 24,["29"] = 43,["30"] = 43,["31"] = 43,["33"] = 44,["34"] = 45,["35"] = 46,["36"] = 47,["37"] = 48,["39"] = 50,["40"] = 51,["41"] = 52,["43"] = 43,["44"] = 59,["45"] = 60,["46"] = 61,["47"] = 59,["48"] = 68,["49"] = 69,["50"] = 70,["51"] = 71,["54"] = 74,["55"] = 75,["56"] = 76,["58"] = 78,["59"] = 68,["60"] = 85,["61"] = 85,["62"] = 85,["64"] = 86,["65"] = 87,["66"] = 88,["68"] = 90,["69"] = 85,["70"] = 97,["71"] = 97,["72"] = 97,["74"] = 98,["77"] = 101,["78"] = 102,["79"] = 103,["80"] = 104,["82"] = 106,["83"] = 107,["84"] = 108,["85"] = 109,["86"] = 97,["87"] = 116,["88"] = 117,["89"] = 118,["91"] = 120,["92"] = 121,["93"] = 121,["94"] = 121,["95"] = 123,["96"] = 124,["99"] = 130,["100"] = 131,["101"] = 131,["102"] = 131,["103"] = 131,["104"] = 131,["105"] = 131,["106"] = 131,["107"] = 132,["108"] = 133,["111"] = 126,["112"] = 127,["113"] = 128,["120"] = 136,["122"] = 138,["123"] = 121,["124"] = 121,["125"] = 140,["126"] = 141,["127"] = 116,["128"] = 144,["129"] = 145,["130"] = 147,["131"] = 148,["132"] = 149,["133"] = 151,["134"] = 152,["136"] = 155,["137"] = 156,["138"] = 144,["139"] = 14,["140"] = 15,["141"] = 114});
local ____exports = {}
local ____CodecUtil = require("solar.solar-common.util.math.CodecUtil")
local CodecUtil = ____CodecUtil.default
local ____SyncUtil = require("solar.solar-common.util.net.SyncUtil")
local SyncUtil = ____SyncUtil.default
____exports.default = __TS__Class()
local LocalArchiveUtil = ____exports.default
LocalArchiveUtil.name = "LocalArchiveUtil"
function LocalArchiveUtil.prototype.____constructor(self)
end
function LocalArchiveUtil.get(self, whichPlayer, key, mapLevelLimit)
    if mapLevelLimit == nil then
        mapLevelLimit = 0
    end
    ____exports.default:_init0()
    if mapLevelLimit > 0 and DzAPI_Map_GetMapLevel(whichPlayer) < mapLevelLimit then
        return nil
    end
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        return nil
    end
    return data[key]
end
function LocalArchiveUtil.set(self, whichPlayer, key, value, saveAll)
    if saveAll == nil then
        saveAll = false
    end
    ____exports.default:_init0()
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        data = {}
        ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))] = data
    end
    data[key] = value
    if saveAll then
        ____exports.default:saveAll(whichPlayer)
    end
end
function LocalArchiveUtil.getAllArchive(self, whichPlayer)
    ____exports.default:_init0()
    return ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
end
function LocalArchiveUtil.printAllArchive(self, whichPlayer)
    ____exports.default:_init0()
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        return
    end
    print(("========打印玩家" .. tostring(GetPlayerId(whichPlayer) + 1)) .. "的存档 开始========")
    for dataKey in pairs(data) do
        print(((dataKey .. "=[") .. tostring(data[dataKey])) .. "]")
    end
    print(("========打印玩家" .. tostring(GetPlayerId(whichPlayer) + 1)) .. "的存档 结束========")
end
function LocalArchiveUtil.clearAllArchive(self, whichPlayer)
    if whichPlayer == nil then
        whichPlayer = GetLocalPlayer()
    end
    ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))] = {}
    if whichPlayer == GetLocalPlayer() then
        ____exports.default:saveAll(whichPlayer)
    end
    print("已清空全部存档!")
end
function LocalArchiveUtil.saveAll(self, whichPlayer)
    if whichPlayer == nil then
        whichPlayer = GetLocalPlayer()
    end
    if whichPlayer ~= GetLocalPlayer() then
        return
    end
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        data = {}
        ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))] = data
    end
    local dataJsonStr = JSON:stringify(data)
    local file = io.open("solar/" .. ____exports.default.fileName, "wb")
    file:write(CodecUtil:saesEncode(dataJsonStr))
    file:close()
end
function LocalArchiveUtil._init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    SyncUtil.onSyncBigData(
        "SL:LAU",
        function(____, player, dataJsonStr)
            local playerId = GetPlayerId(player)
            if #dataJsonStr > 2 then
                do
                    local function ____catch(e)
                        log.errorWithTraceBack("存档Json解析出错!")
                        DisplayTimedTextToPlayer(
                            GetLocalPlayer(),
                            0,
                            0,
                            60,
                            "存档Json解析出错！"
                        )
                        print(("需要解析的Json字符串为[" .. dataJsonStr) .. "]")
                        ____exports.default.playerDatas["P" .. tostring(playerId)] = {}
                    end
                    local ____try, ____hasReturned = pcall(function()
                        local data = JSON:parse(dataJsonStr)
                        ____exports.default.playerDatas["P" .. tostring(playerId)] = data
                        log.debug((("玩家" .. tostring(playerId + 1)) .. ":的存档数据为:") .. dataJsonStr)
                    end)
                    if not ____try then
                        ____catch(____hasReturned)
                    end
                end
            else
                ____exports.default.playerDatas["P" .. tostring(playerId)] = {}
            end
            log.debug((("玩家" .. tostring(playerId + 1)) .. "本地存档同步完成！") .. tostring(#dataJsonStr))
        end
    )
    ____exports.default:_init_SyncData()
    return true
end
function LocalArchiveUtil._init_SyncData(self)
    local dataJsonStr = ""
    local file = io.open("solar/" .. ____exports.default.fileName, "rb")
    if file then
        local ciphertext = file:read("*a")
        dataJsonStr = CodecUtil:saesDecode(ciphertext)
        file:close()
    end
    SyncUtil.syncBigData("SL:LAU", dataJsonStr)
    return true
end
LocalArchiveUtil.playerDatas = {}
LocalArchiveUtil.fileName = ("LocalArchive_" .. CodecUtil:md5hex(gameName)) .. ".sdb"
LocalArchiveUtil.isInit = false
return ____exports
