local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 8,["17"] = 8,["18"] = 8,["20"] = 8,["21"] = 9,["22"] = 10,["23"] = 12,["26"] = 16,["27"] = 17,["28"] = 9,["29"] = 64,["30"] = 65,["31"] = 66,["32"] = 68,["33"] = 68,["34"] = 68,["36"] = 69,["37"] = 69,["38"] = 70,["39"] = 71,["40"] = 72,["41"] = 73,["42"] = 73,["43"] = 73,["44"] = 73,["45"] = 74,["46"] = 74,["47"] = 74,["48"] = 74,["49"] = 74,["51"] = 69,["54"] = 68,["55"] = 68,["56"] = 79,["57"] = 80,["58"] = 83,["59"] = 84,["60"] = 85,["61"] = 87,["65"] = 64});
local ____exports = {}
local ____YiYiImplementDz = require("solar.solar-wc3.lib.compatible.yiyi.YiYiImplementDz")
local YiYiImplementDz = ____YiYiImplementDz.default
local ____YiYiApi = require("solar.solar-wc3.lib.compatible.yiyi.YiYiApi")
local YiYiApi = ____YiYiApi.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____YiYiApiJassImpl = require("solar.solar-wc3.lib.compatible.yiyi.YiYiApiJassImpl")
local YiYiApiJassImpl = ____YiYiApiJassImpl.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
____exports.default = __TS__Class()
local YiYiEnv = ____exports.default
YiYiEnv.name = "YiYiEnv"
function YiYiEnv.prototype.____constructor(self)
end
function YiYiEnv.init(self)
    if not isEmbedJapi then
        YiYiApiJassImpl.init()
        return
    end
    local g = _G
    g.register_japi((((((((((((((((((((((((((((((((((((((((((("native  InitGameCache           takes string campaignFile returns gamecache\n" .. "native  SaveGameCache           takes gamecache whichCache returns boolean\n") .. "\n") .. "native  EXNetUseItem            takes player p,string key,integer count returns boolean\n") .. "native  EXNetGetTime            takes nothing returns string\n") .. "native  EXNetSaveRemoteData     takes integer player_id, string Key ,string value returns boolean\n") .. "native  EXNetLoadRemoteData     takes integer player_id, string Key returns boolean\n") .. "native  EXGetPlayerRealName     takes player p returns string\n") .. "\n") .. "native  StoreInteger\t\t\ttakes gamecache cache, string missionKey, string key, integer value returns nothing\n") .. "native  StoreReal\t\t\t\ttakes gamecache cache, string missionKey, string key, real value returns nothing\n") .. "native  StoreBoolean\t\t\ttakes gamecache cache, string missionKey, string key, boolean value returns nothing\n") .. "native  StoreUnit\t\t\t\ttakes gamecache cache, string missionKey, string key, unit whichUnit returns boolean\n") .. "native  StoreString\t\t\t\ttakes gamecache cache, string missionKey, string key, string value returns boolean\n") .. "\n") .. "native  SyncStoredInteger       takes gamecache cache, string missionKey, string key returns nothing\n") .. "native  SyncStoredReal          takes gamecache cache, string missionKey, string key returns nothing\n") .. "native  SyncStoredBoolean       takes gamecache cache, string missionKey, string key returns nothing\n") .. "native  SyncStoredUnit          takes gamecache cache, string missionKey, string key returns nothing\n") .. "native  SyncStoredString        takes gamecache cache, string missionKey, string key returns nothing\n") .. "\n") .. "native  HaveStoredInteger\t\ttakes gamecache cache, string missionKey, string key returns boolean\n") .. "native  HaveStoredReal\t\t\ttakes gamecache cache, string missionKey, string key returns boolean\n") .. "native  HaveStoredBoolean\t\ttakes gamecache cache, string missionKey, string key returns boolean\n") .. "native  HaveStoredUnit\t\t\ttakes gamecache cache, string missionKey, string key returns boolean\n") .. "native  HaveStoredString\t\ttakes gamecache cache, string missionKey, string key returns boolean\n") .. "\n") .. "native  FlushGameCache\t\t\ttakes gamecache cache returns nothing\n") .. "native  FlushStoredMission\t\ttakes gamecache cache, string missionKey returns nothing\n") .. "native  FlushStoredInteger\t\ttakes gamecache cache, string missionKey, string key returns nothing\n") .. "native  FlushStoredReal\t\t\ttakes gamecache cache, string missionKey, string key returns nothing\n") .. "native  FlushStoredBoolean\t\ttakes gamecache cache, string missionKey, string key returns nothing\n") .. "native  FlushStoredUnit\t\t\ttakes gamecache cache, string missionKey, string key returns nothing\n") .. "native  FlushStoredString\t\ttakes gamecache cache, string missionKey, string key returns nothing\n") .. "\n") .. "native  GetStoredInteger\t\ttakes gamecache cache, string missionKey, string key returns integer\n") .. "native  GetStoredReal\t\t\ttakes gamecache cache, string missionKey, string key returns real\n") .. "native  GetStoredBoolean\t\ttakes gamecache cache, string missionKey, string key returns boolean\n") .. "native  GetStoredString\t\t\ttakes gamecache cache, string missionKey, string key returns string\n") .. "native  RestoreUnit\t\t\t\ttakes gamecache cache, string missionKey, string key, player forWhichPlayer, real x, real y, real facing returns unit\n") .. "\n") .. "native  EXNetConsume            takes player whichPlayer,integer gold returns boolean\n") .. "native  EXNetCommonConsume      takes player whichPlayer,integer gold returns boolean\n") .. "native  EXGetGamePlaySecs       takes player p returns integer\n")
end
function YiYiEnv.initInEnd(self)
    YiYiApi:init()
    YiYiImplementDz:init()
    BaseUtil.runLater(
        130,
        function()
            do
                local i = 0
                while i < bj_MAX_PLAYER_SLOTS do
                    local tempPlayer = Player(i)
                    if GetPlayerController(tempPlayer) == MAP_CONTROL_USER and GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING then
                        ArchiveUtil:getAllArchive(tempPlayer)
                        local ____YDWERPGSetKey_3 = YDWERPGSetKey
                        local ____tempPlayer_2 = tempPlayer
                        local ____opt_0 = sd(nil, tempPlayer, false)
                        ____YDWERPGSetKey_3(____tempPlayer_2, "mapexp", ____opt_0 and ____opt_0._tt or 0)
                        YDWERPGSetKey(
                            tempPlayer,
                            "maplv",
                            DzAPI_Map_GetMapLevel(tempPlayer)
                        )
                    end
                    i = i + 1
                end
            end
        end
    )
    if isEmbedJapi then
        local iFunNames = {"CreateFrame", "CreateFrameByTagName", "FrameShow", "FrameFindByName"}
        local japi = require("jass.japi")
        for ____, funName in ipairs(iFunNames) do
            if japi[funName] then
                _G["Dz" .. funName] = japi[funName]
            end
        end
    end
end
return ____exports
