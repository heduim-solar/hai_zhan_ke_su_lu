local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 6,["14"] = 6,["15"] = 6,["17"] = 40,["18"] = 41,["19"] = 42,["22"] = 45,["23"] = 46,["24"] = 47,["25"] = 48,["26"] = 48,["27"] = 48,["28"] = 48,["29"] = 48,["30"] = 48,["31"] = 48,["32"] = 49,["34"] = 51,["36"] = 54,["37"] = 55,["38"] = 56,["39"] = 57,["40"] = 58,["41"] = 58,["42"] = 58,["43"] = 58,["44"] = 58,["45"] = 58,["46"] = 58,["48"] = 60,["49"] = 62,["50"] = 63,["51"] = 63,["52"] = 63,["53"] = 63,["54"] = 63,["55"] = 63,["56"] = 63,["58"] = 65,["59"] = 66,["60"] = 66,["61"] = 66,["62"] = 66,["63"] = 66,["64"] = 66,["65"] = 66,["66"] = 67,["68"] = 70,["69"] = 71,["71"] = 41,["72"] = 77,["73"] = 78,["74"] = 79,["76"] = 81,["77"] = 82,["78"] = 82,["79"] = 82,["80"] = 82,["81"] = 82,["83"] = 84,["84"] = 39,["85"] = 87,["86"] = 88,["87"] = 89,["88"] = 90,["89"] = 91,["90"] = 92,["91"] = 94,["92"] = 95,["93"] = 96,["94"] = 97,["95"] = 97,["96"] = 97,["97"] = 97,["98"] = 97,["99"] = 97,["100"] = 97,["102"] = 99,["103"] = 99,["104"] = 99,["105"] = 99,["106"] = 99,["107"] = 100,["108"] = 100,["109"] = 100,["110"] = 100,["111"] = 100,["112"] = 100,["113"] = 100,["115"] = 103,["117"] = 106,["118"] = 107,["119"] = 108,["120"] = 109,["121"] = 109,["122"] = 109,["123"] = 109,["124"] = 109,["125"] = 109,["126"] = 109,["128"] = 111,["129"] = 111,["130"] = 111,["131"] = 111,["132"] = 111,["133"] = 112,["134"] = 112,["135"] = 112,["136"] = 112,["137"] = 112,["138"] = 112,["139"] = 112,["141"] = 115,["143"] = 90,["144"] = 87,["145"] = 23,["146"] = 23,["147"] = 23,["148"] = 23,["149"] = 23,["150"] = 23,["151"] = 23,["152"] = 23,["153"] = 23,["154"] = 23,["155"] = 23,["156"] = 23,["157"] = 23,["158"] = 23});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local MapBaseInitState = ____exports.default
MapBaseInitState.name = "MapBaseInitState"
function MapBaseInitState.prototype.____constructor(self)
    local cfg = ____exports.default.config
    PlayerUtil:forPlayingPlayers(function(____, player)
        if GetPlayerId(player) > 3 then
            return
        end
        if ____exports.default.config.goldForMapLvl > 0 then
            local mapLvl = DzAPI_Map_GetMapLevel(player)
            local mapLveAdd = mapLvl * mapLvl * ____exports.default.config.goldForMapLvl
            DisplayTimedTextToPlayer(
                player,
                0,
                0,
                10,
                ((("|cff00ffff你获得了" .. tostring(mapLveAdd)) .. "(地图等级^2*") .. tostring(____exports.default.config.goldForMapLvl)) .. ")的地图等级奖励金币！"
            )
            SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, mapLveAdd + ____exports.default.config.gold)
        else
            SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, ____exports.default.config.gold)
        end
        SetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER, ____exports.default.config.wood)
        SetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_CAP, ____exports.default.config.population)
        SetCameraFieldForPlayer(player, CAMERA_FIELD_TARGET_DISTANCE, ____exports.default.config.initial_lens_height, 0)
        if cfg.start_text and #cfg.start_text > 0 then
            DisplayTimedTextFromPlayer(
                player,
                0,
                0,
                10,
                ____exports.default.config.start_text
            )
        end
        if cfg.start_CreateUnitType and #cfg.start_CreateUnitType > 3 then
            local loc = GetPlayerStartLocationLoc(player)
            DataBase:getPlayerSolarData(player).assistant = CreateUnit(
                player,
                FourCC(cfg.start_CreateUnitType),
                GetLocationX(loc),
                GetLocationY(loc),
                0
            )
        end
        if cfg.addGoldByCollect > 0 and DzAPI_Map_Returns(player, 16) then
            DisplayTimedTextToPlayer(
                player,
                0,
                0,
                10,
                ("|cff00ffff你获得了收藏奖励：" .. tostring(cfg.addGoldByCollect)) .. "金币！"
            )
            AdjustPlayerStateBJ(cfg.addGoldByCollect, player, PLAYER_STATE_RESOURCE_GOLD)
        end
        if cfg.maxHeroesAllowed then
            SetPlayerMaxHeroesAllowed(cfg.maxHeroesAllowed, player)
        end
    end)
    if ____exports.default.config.player_see then
        FogEnableOff()
        FogMaskEnableOff()
    end
    for ____, playerindex in ipairs(____exports.default.config.open_gives_bounty) do
        SetPlayerState(
            Player(playerindex - 1),
            PLAYER_STATE_GIVES_BOUNTY,
            1
        )
    end
    self:initChat()
end
function MapBaseInitState.prototype.initChat(self)
    local trigger = __TS__New(Trigger)
    trigger:registerAnyPlayerChatEvent("", false)
    trigger:addAction(function()
        local playerChatString = GetEventPlayerChatString()
        local solarData = DataBase:getPlayerSolarData(GetTriggerPlayer())
        local cfgData = ____exports.default.config.addGoldsOnChat[playerChatString]
        if cfgData and cfgData.v and cfgData.v > 0 then
            if solarData["MapBaseInitState_addGoldsOnChat_" .. playerChatString] then
                DisplayTimedTextToPlayer(
                    GetTriggerPlayer(),
                    0,
                    0,
                    5,
                    "|cffffff00你已经领取过了！"
                )
            else
                AdjustPlayerStateBJ(
                    cfgData.v,
                    GetTriggerPlayer(),
                    PLAYER_STATE_RESOURCE_GOLD
                )
                DisplayTimedTextToPlayer(
                    GetTriggerPlayer(),
                    0,
                    0,
                    5,
                    ((("|cffffff00你获得了礼包:" .. cfgData.n) .. "，系统已为您增加了") .. tostring(cfgData.v)) .. "金币！"
                )
            end
            solarData["MapBaseInitState_addGoldsOnChat_" .. playerChatString] = true
        end
        local cfgDataLumbers = ____exports.default.config.addLumbersOnChat[playerChatString]
        if cfgDataLumbers and cfgDataLumbers.v and cfgDataLumbers.v > 0 then
            if solarData["MapBaseInitState_addLumbersOnChat_" .. playerChatString] then
                DisplayTimedTextToPlayer(
                    GetTriggerPlayer(),
                    0,
                    0,
                    5,
                    "|cffffff00你已经领取过了！"
                )
            else
                AdjustPlayerStateBJ(
                    cfgDataLumbers.v,
                    GetTriggerPlayer(),
                    PLAYER_STATE_RESOURCE_LUMBER
                )
                DisplayTimedTextToPlayer(
                    GetTriggerPlayer(),
                    0,
                    0,
                    5,
                    ((("|cffffff00你获得了礼包:" .. cfgDataLumbers.n) .. "，系统已为您增加了") .. tostring(cfgDataLumbers.v)) .. "木材！"
                )
            end
            solarData["MapBaseInitState_addLumbersOnChat_" .. playerChatString] = true
        end
    end)
end
MapBaseInitState.config = {
    player_see = true,
    initial_lens_height = 2500,
    gold = 0,
    goldForMapLvl = 0,
    wood = 0,
    population = 100,
    start_text = "",
    start_CreateUnitType = "",
    open_gives_bounty = {},
    addGoldsOnChat = {},
    addLumbersOnChat = {},
    addGoldByCollect = 0
}
return ____exports
