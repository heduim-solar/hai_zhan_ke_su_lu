local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 39,["16"] = 39,["17"] = 39,["19"] = 39,["20"] = 75,["21"] = 75,["22"] = 75,["24"] = 75,["25"] = 75,["27"] = 76,["28"] = 77,["29"] = 78,["30"] = 79,["31"] = 80,["34"] = 83,["35"] = 84,["36"] = 85,["38"] = 87,["39"] = 75,["40"] = 97,["41"] = 97,["42"] = 97,["44"] = 98,["45"] = 99,["46"] = 100,["47"] = 101,["48"] = 102,["50"] = 104,["51"] = 105,["52"] = 106,["54"] = 97,["55"] = 113,["56"] = 114,["57"] = 115,["58"] = 113,["59"] = 122,["60"] = 123,["61"] = 124,["62"] = 125,["65"] = 128,["66"] = 129,["67"] = 130,["69"] = 132,["70"] = 122,["71"] = 138,["72"] = 139,["73"] = 140,["75"] = 141,["76"] = 141,["77"] = 142,["78"] = 143,["79"] = 141,["82"] = 145,["83"] = 138,["84"] = 151,["85"] = 152,["86"] = 153,["87"] = 151,["88"] = 159,["89"] = 160,["90"] = 161,["91"] = 162,["92"] = 163,["93"] = 164,["94"] = 165,["95"] = 166,["96"] = 167,["97"] = 168,["99"] = 170,["101"] = 172,["102"] = 159,["103"] = 178,["104"] = 179,["105"] = 180,["106"] = 181,["107"] = 182,["108"] = 182,["109"] = 182,["110"] = 183,["111"] = 184,["112"] = 182,["113"] = 182,["116"] = 188,["117"] = 189,["118"] = 190,["119"] = 191,["121"] = 194,["122"] = 195,["123"] = 196,["124"] = 197,["125"] = 199,["126"] = 200,["127"] = 201,["129"] = 203,["130"] = 204,["131"] = 205,["132"] = 206,["133"] = 207,["137"] = 210,["138"] = 210,["139"] = 211,["140"] = 212,["141"] = 213,["143"] = 215,["144"] = 216,["145"] = 217,["146"] = 210,["149"] = 220,["150"] = 221,["151"] = 222,["152"] = 178,["153"] = 232,["154"] = 233,["155"] = 234,["157"] = 236,["158"] = 237,["160"] = 238,["161"] = 238,["162"] = 239,["163"] = 241,["164"] = 242,["165"] = 243,["166"] = 244,["168"] = 238,["171"] = 247,["172"] = 247,["173"] = 247,["174"] = 248,["175"] = 248,["176"] = 248,["177"] = 248,["178"] = 248,["179"] = 248,["180"] = 248,["181"] = 247,["182"] = 247,["183"] = 250,["184"] = 250,["185"] = 250,["186"] = 251,["187"] = 252,["188"] = 252,["189"] = 252,["190"] = 252,["191"] = 252,["192"] = 252,["193"] = 252,["194"] = 250,["195"] = 250,["196"] = 255,["197"] = 232,["198"] = 258,["199"] = 259,["200"] = 260,["201"] = 261,["203"] = 262,["204"] = 262,["205"] = 263,["206"] = 264,["207"] = 265,["208"] = 266,["210"] = 268,["213"] = 262,["216"] = 273,["217"] = 274,["221"] = 323,["222"] = 324,["223"] = 324,["224"] = 324,["225"] = 324,["226"] = 324,["227"] = 324,["228"] = 324,["229"] = 325,["232"] = 277,["233"] = 278,["234"] = 279,["235"] = 280,["236"] = 281,["237"] = 281,["238"] = 281,["239"] = 281,["240"] = 281,["241"] = 281,["242"] = 281,["243"] = 282,["246"] = 286,["247"] = 287,["248"] = 289,["249"] = 290,["250"] = 291,["251"] = 292,["252"] = 292,["253"] = 292,["254"] = 293,["255"] = 292,["256"] = 292,["258"] = 297,["259"] = 298,["260"] = 299,["261"] = 301,["262"] = 303,["263"] = 304,["264"] = 305,["266"] = 308,["267"] = 309,["268"] = 310,["270"] = 313,["271"] = 314,["272"] = 314,["273"] = 314,["274"] = 314,["275"] = 314,["276"] = 314,["277"] = 314,["280"] = 321,["286"] = 276,["289"] = 327,["290"] = 258,["291"] = 44,["292"] = 49,["293"] = 53,["294"] = 57,["295"] = 58,["296"] = 60,["297"] = 61,["298"] = 63,["299"] = 64,["300"] = 65,["301"] = 230});
local ____exports = {}
local ____CodecUtil = require("solar.solar-common.util.math.CodecUtil")
local CodecUtil = ____CodecUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local Old_ArchiveUtil = ____exports.default
Old_ArchiveUtil.name = "Old_ArchiveUtil"
function Old_ArchiveUtil.prototype.____constructor(self)
end
function Old_ArchiveUtil.get(self, whichPlayer, key, limitVal, limitKey)
    if limitVal == nil then
        limitVal = 0
    end
    if limitKey == nil then
        limitKey = ____exports.default.defaultLimitKey
    end
    ____exports.default:_init0()
    if limitVal > 0 then
        local sVal = limitKey and S2I(DzAPI_Map_GetServerValue(whichPlayer, limitKey)) or DzAPI_Map_GetMapLevel(whichPlayer)
        if sVal < limitVal then
            return nil
        end
    end
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        return nil
    end
    return data[key]
end
function Old_ArchiveUtil.set(self, whichPlayer, key, value, isSaveAll)
    if isSaveAll == nil then
        isSaveAll = true
    end
    ____exports.default:_init0()
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        data = {}
        ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))] = data
    end
    data[key] = value
    if isSaveAll then
        ____exports.default:saveAll(whichPlayer)
    end
end
function Old_ArchiveUtil.getAllArchive(self, whichPlayer)
    ____exports.default:_init0()
    return ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
end
function Old_ArchiveUtil.printAllArchive(self, whichPlayer)
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
function Old_ArchiveUtil.clearAllArchive(self, whichPlayer)
    ____exports.default:_init0()
    ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))] = {}
    do
        local i = 0
        while i < ____exports.default.ArchiveKeyCountMax do
            local key = ____exports.default.baseArchiveKeyPrefix .. tostring(i)
            DzAPI_Map_FlushStoredMission(whichPlayer, key)
            i = i + 1
        end
    end
    print("已清理全部存档!")
end
function Old_ArchiveUtil.getCurrentArchiveKeyMax(self, whichPlayer)
    ____exports.default:_init0()
    return ____exports.default._sl_playerCurrentArchiveKeyMax["P" .. tostring(GetPlayerId(whichPlayer))] or 0
end
function Old_ArchiveUtil.getCurrentArchiveKeyMaxInfo(self, whichPlayer)
    local used = ____exports.default:getCurrentArchiveKeyMax(whichPlayer)
    local p = math.ceil(used * 100 / ____exports.default.ArchiveKeyCountMax)
    local info = ("(" .. tostring(p)) .. "%)"
    if p > 90 then
        info = "|cffff0000" .. info
    elseif p > 80 then
        info = "|cffe24700" .. info
    elseif p > 70 then
        info = "|cffdb7835" .. info
    else
        info = "|cff0a8f17" .. info
    end
    return ((tostring(used) .. "/") .. tostring(____exports.default.ArchiveKeyCountMax)) .. info
end
function Old_ArchiveUtil.saveAll(self, whichPlayer)
    if isDebug and ____exports.default._init_time + 500 > time then
        print("本地存档提示:本地调试情况下多玩家公用一个本地存档文件，保存与初始化相隔太近可能导致后初始化读取存档的玩家读到更新后的存档文件。导致多玩家存档不一致")
        log.errorWithTraceBack("(PS:即一个玩家初始化存档后 再保存存档，另外一个玩家才执行到初始化存档，就会导致2个玩家读取到的存档文件不是一个版本的。这可能导致本地多玩家调试时异步)")
        BaseUtil.runLater(
            1,
            function()
                print("本地存档提示:延迟1秒再保存。")
                ____exports.default:saveAll(whichPlayer)
            end
        )
        return
    end
    local data = ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))]
    if not data then
        data = {}
        ____exports.default.playerDatas["P" .. tostring(GetPlayerId(whichPlayer))] = data
    end
    data._SL = DzAPI_Map_GetMapLevel(whichPlayer)
    data._SH = StringHash(GetPlayerName(whichPlayer))
    data._SI = MapPlayer:fromHandle(whichPlayer).userId
    data._tt = (DataBase:getPlayerSolarData(whichPlayer)._tt or 0) + math.floor(time / 1000 / 60)
    local dataJsonStr = JSON:stringify(data)
    if ____exports.default.encrypt then
        dataJsonStr = CodecUtil:saesEncode(dataJsonStr, gameName .. ____exports.default.salt)
    end
    local dataJsonStrLength = #dataJsonStr
    local keyLength = math.floor(dataJsonStrLength / 64) + 1
    log.debug((("玩家" .. tostring(GetPlayerId(whichPlayer) + 1)) .. ":的存档栏位大小为:") .. tostring(keyLength))
    if keyLength > ____exports.default.ArchiveKeyCountMax then
        log.errorWithTraceBack((("存档栏位大小超过" .. tostring(____exports.default.ArchiveKeyCountMax)) .. "！") .. tostring(keyLength))
        return
    end
    do
        local i = 0
        while i < keyLength do
            local endIndex = (i + 1) * 64
            if endIndex > dataJsonStrLength then
                endIndex = dataJsonStrLength
            end
            local oneData = __TS__StringSubstring(dataJsonStr, i * 64, endIndex)
            local key = ____exports.default.baseArchiveKeyPrefix .. tostring(i)
            DzAPI_Map_SaveServerValue(whichPlayer, key, oneData)
            i = i + 1
        end
    end
    local key = ____exports.default.baseArchiveKeyPrefix .. tostring(keyLength)
    DzAPI_Map_FlushStoredMission(whichPlayer, key)
    ____exports.default._sl_playerCurrentArchiveKeyMax["P" .. tostring(GetPlayerId(whichPlayer))] = keyLength
end
function Old_ArchiveUtil._init0(self)
    if ____exports.default.isInit then
        return true
    end
    ____exports.default.isInit = true
    ____exports.default._init_time = time
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            local tempPlayer = Player(i)
            if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                local playerAllArchiveData = ____exports.default:_init0_onePlayer(tempPlayer)
                ____exports.default.playerDatas["P" .. tostring(i)] = playerAllArchiveData
                DataBase:getPlayerSolarData(tempPlayer, true)._tt = playerAllArchiveData._tt or 0
            end
            i = i + 1
        end
    end
    se:playerChat(
        "-sl-ia",
        function(p)
            DisplayTimedTextToPlayer(
                p,
                0,
                0,
                10,
                ____exports.default:getCurrentArchiveKeyMaxInfo(p)
            )
        end
    )
    se:playerChat(
        "-sl-save",
        function(p)
            ____exports.default:saveAll(p)
            DisplayTimedTextToPlayer(
                p,
                0,
                0,
                10,
                "保存存档完毕! tt=" .. tostring(____exports.default:getAllArchive(p)._tt)
            )
        end
    )
    return true
end
function Old_ArchiveUtil._init0_onePlayer(self, tempPlayer)
    local data = {}
    local pId = GetPlayerId(tempPlayer)
    local dataJsonStr = ""
    do
        local i = 0
        while i < ____exports.default.ArchiveKeyCountMax do
            local key = ____exports.default.baseArchiveKeyPrefix .. tostring(i)
            local serverValue = DzAPI_Map_GetServerValue(tempPlayer, key)
            if serverValue and #serverValue > 0 then
                dataJsonStr = dataJsonStr .. serverValue
            else
                ____exports.default._sl_playerCurrentArchiveKeyMax["P" .. tostring(pId)] = i
                break
            end
            i = i + 1
        end
    end
    if #dataJsonStr < 2 then
        return {}
    end
    do
        local function ____catch(e)
            print("存档Json格式解析出错!")
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                "存档格式解析出错！请不要私自修改存档数据！"
            )
            print(("需要解析的Json字符串为[" .. dataJsonStr) .. "]")
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            if ____exports.default.encrypt then
                dataJsonStr = CodecUtil:saesDecode(dataJsonStr, gameName .. ____exports.default.salt)
                if dataJsonStr == nil then
                    print("存档Json格式解析出错!")
                    DisplayTimedTextToPlayer(
                        GetLocalPlayer(),
                        0,
                        0,
                        60,
                        "存档格式解析出错！请不要私自修改存档数据！"
                    )
                    return true, {}
                end
            end
            data = JSON:parse(dataJsonStr)
            log.debug((("玩家" .. tostring(pId + 1)) .. ":的存档数据为:") .. dataJsonStr)
            if ____exports.default.verifyPlayerMapLv and DzAPI_Map_GetMapLevel(tempPlayer) < data._SL then
                print("存档验证失败!默认使用空存档!")
                data = {}
                BaseUtil.runLater(
                    1,
                    function()
                        CustomDefeatBJ(tempPlayer, "警告:存档验证失败C1！")
                    end
                )
            end
            local shTemp = StringHash(GetPlayerName(tempPlayer))
            local userId = MapPlayer:fromHandle(tempPlayer).userId
            if userId == -1 then
                local info = "提示:请不要再地图初始时获取存档！应当延迟执行存档逻辑!"
                print(info)
                print("请等待内置userId(用户id)同步完成！(为了解决玩家名更改后靠userId判断是否是自己的存档)")
                log.errorWithTraceBack(info)
            end
            if ____exports.default.verifyPlayerName and data._SH and data._SH ~= shTemp then
                if data._SI and data._SI > 0 and data._SI == userId then
                    print("检测到玩家改名了！自动修正存档!")
                else
                    data = {}
                    DisplayTimedTextToPlayer(
                        tempPlayer,
                        0,
                        0,
                        60,
                        "存档玩家名验证失败!请主动退出游戏或使用空存档继续游玩!"
                    )
                end
            end
            return true, data
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
    return data
end
Old_ArchiveUtil.encrypt = true
Old_ArchiveUtil.verifyPlayerName = not isDebug
Old_ArchiveUtil.verifyPlayerMapLv = false
Old_ArchiveUtil.ArchiveKeyCountMax = 150 - 10
Old_ArchiveUtil.salt = "s_z_b_s_q_j"
Old_ArchiveUtil.baseArchiveKeyPrefix = "SA_"
Old_ArchiveUtil.defaultLimitKey = nil
Old_ArchiveUtil.playerDatas = {}
Old_ArchiveUtil._sl_playerCurrentArchiveKeyMax = {}
Old_ArchiveUtil._init_time = -1
Old_ArchiveUtil.isInit = false
return ____exports
