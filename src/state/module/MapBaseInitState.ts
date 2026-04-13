import ForceUtil from '@/ForceUtil';
import {Trigger} from '@/trigger';
import DataBase from '@/DataBase';
import PlayerUtil from "@/PlayerUtil";

export default class MapBaseInitState {

    static config: {
        player_see: boolean;//全图视野
        initial_lens_height: number;//初始化高度
        gold: number//初始金币
        goldForMapLvl: number//地图等级的平方奖励金币
        wood: number//初始木材
        population: number//人口
        start_text: string//初始文本
        start_CreateUnitType: string//初始创建单位类型
        open_gives_bounty: number[]//获得奖励
        addGoldsOnChat: { [text: string]: { v: number, n: string } },
        addLumbersOnChat: { [text: string]: { v: number, n: string } },
        addGoldByCollect: number,
        maxHeroesAllowed?: number,

    } = {
        player_see: true,//全图视野
        initial_lens_height: 2500,//初始化高度
        gold: 0,//初始金币
        goldForMapLvl: 0,//地图等级的平方奖励金币
        wood: 0,//初始木材
        population: 100,//人口
        start_text: "",//初始文本
        start_CreateUnitType: "",//初始创建单位类型
        open_gives_bounty: [],//
        addGoldsOnChat: {},//
        addLumbersOnChat: {},//
        addGoldByCollect: 0,

    }

    constructor() {
        let cfg = MapBaseInitState.config
        PlayerUtil.forPlayingPlayers(player => {
            if (GetPlayerId(player) > 3) {
                return
            }
            if (MapBaseInitState.config.goldForMapLvl > 0) {
                let mapLvl = DzAPI_Map_GetMapLevel(player)
                let mapLveAdd = mapLvl * mapLvl * MapBaseInitState.config.goldForMapLvl;
                DisplayTimedTextToPlayer(player, 0, 0, 10, '|cff00ffff你获得了' + mapLveAdd + '(地图等级^2*' + MapBaseInitState.config.goldForMapLvl + ")的地图等级奖励金币！");
                SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, mapLveAdd + MapBaseInitState.config.gold);
            } else {
                SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, MapBaseInitState.config.gold);
            }

            SetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER, MapBaseInitState.config.wood);
            SetPlayerState(player, PLAYER_STATE_RESOURCE_FOOD_CAP, MapBaseInitState.config.population);
            SetCameraFieldForPlayer(player, CAMERA_FIELD_TARGET_DISTANCE, MapBaseInitState.config.initial_lens_height, 0);
            if (cfg.start_text && cfg.start_text.length > 0) {
                DisplayTimedTextFromPlayer(player, 0, 0, 10, MapBaseInitState.config.start_text)
            }
            if (cfg.start_CreateUnitType && cfg.start_CreateUnitType.length > 3) {

                let loc = GetPlayerStartLocationLoc(player)
                DataBase.getPlayerSolarData(player).assistant = CreateUnit(player, FourCC(cfg.start_CreateUnitType), GetLocationX(loc), GetLocationY(loc), 0);
            }
            if (cfg.addGoldByCollect > 0 && DzAPI_Map_Returns(player, 16)) {
                DisplayTimedTextToPlayer(player, 0, 0, 10, "|cff00ffff你获得了收藏奖励：" + cfg.addGoldByCollect + "金币！");
                AdjustPlayerStateBJ(cfg.addGoldByCollect, player, PLAYER_STATE_RESOURCE_GOLD)
            }

            if (cfg.maxHeroesAllowed) {
                SetPlayerMaxHeroesAllowed(cfg.maxHeroesAllowed, player)
            }


        });

        if (MapBaseInitState.config.player_see) {
            FogEnableOff();
            FogMaskEnableOff();
        }
        for (const playerindex of MapBaseInitState.config.open_gives_bounty) {
            SetPlayerState(Player(playerindex - 1), PLAYER_STATE_GIVES_BOUNTY, 1)
        }
        this.initChat();
    }

    initChat() {
        let trigger = new Trigger();
        trigger.registerAnyPlayerChatEvent("", false)
        trigger.addAction(() => {
            let playerChatString = GetEventPlayerChatString();
            let solarData = DataBase.getPlayerSolarData(GetTriggerPlayer());

            let cfgData = MapBaseInitState.config.addGoldsOnChat[playerChatString];
            if (cfgData && cfgData.v && cfgData.v > 0) {
                if (solarData["MapBaseInitState_addGoldsOnChat_" + playerChatString]) {
                    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5.00, "|cffffff00你已经领取过了！");
                } else {
                    AdjustPlayerStateBJ(cfgData.v, GetTriggerPlayer(), PLAYER_STATE_RESOURCE_GOLD);
                    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5.00, "|cffffff00你获得了礼包:"
                        + cfgData.n + "，系统已为您增加了" + cfgData.v + "金币！");
                }
                solarData["MapBaseInitState_addGoldsOnChat_" + playerChatString] = true

            }
            let cfgDataLumbers = MapBaseInitState.config.addLumbersOnChat[playerChatString];
            if (cfgDataLumbers && cfgDataLumbers.v && cfgDataLumbers.v > 0) {
                if (solarData["MapBaseInitState_addLumbersOnChat_" + playerChatString]) {
                    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5.00, "|cffffff00你已经领取过了！");
                } else {
                    AdjustPlayerStateBJ(cfgDataLumbers.v, GetTriggerPlayer(), PLAYER_STATE_RESOURCE_LUMBER);
                    DisplayTimedTextToPlayer(GetTriggerPlayer(), 0, 0, 5.00, "|cffffff00你获得了礼包:"
                        + cfgDataLumbers.n + "，系统已为您增加了" + cfgDataLumbers.v + "木材！");
                }
                solarData["MapBaseInitState_addLumbersOnChat_" + playerChatString] = true

            }
        })
    }

}