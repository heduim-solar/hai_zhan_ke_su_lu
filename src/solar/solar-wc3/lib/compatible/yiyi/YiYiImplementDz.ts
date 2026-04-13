/** @noSelfInFile */
/**
 * 在yiyi平台使用yiyi api 来实现dz函数。 上层作者只管使用dz函数即可
 *
 * 在某些11没有的函数 只能返回0或空 可能会导致部分功能缺失  但至少地图整体能玩
 */
import * as YiYiBase from "@sl-wc3/lib/compatible/yiyi/YiYiApi";
import DataBase from "@/DataBase";
import ArchiveUtil from "@/ArchiveUtil";
import LangUtil from "@/LangUtil";
import BaseUtil from "@/BaseUtil";
import PlayerUtil from "@/PlayerUtil";
import DateUtil from "@/DateUtil";

const CJ: NoSelf = require('jass.common')

export default class YiYiImplementDz {
    static is_init = false;
    static config: {
        keyMap: { [codeKey: string]: any }
    } = {
        // keyMap: {KSJZ:"20039579"}
        keyMap: {}
    }

    constructor() {

        YiYiImplementDz.init();
    }


    static init() {
        if (YiYiImplementDz.is_init) {
            return
        }
        YiYiImplementDz.is_init = true;
        //
        for (let gk in YiYiBase) {
            // @ts-ignore
            if (gk.startsWith("YDWE") || gk.startsWith("YY") || gk.startsWith("Player")) {
                // @ts-ignore
                _G[gk] = YiYiBase[gk];
            }
        }

        //one case
        const hook: NoSelf = require('jass.hook')
        //兼容lua使用dz
        YiYiImplementDz._sl_implementDz(_G);
        //兼容jass使用dz
        YiYiImplementDz._sl_implementDz(hook);
        //查看
        // DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10, "输入-maplv可以查看地图经验和等级!");
        // print("输入-maplv可以查看地图经验和等级!");
        se.playerChat("-maplv", (pl) => {
            let level = DzAPI_Map_GetMapLevel(pl);
            let _tt = DataBase.getPlayerSolarData(pl, true)._tt || 0
            let info = "你的地图经验为:" + _tt + "; 地图等级为:" + level;
            print(info)
            DisplayTimedTextToPlayer(pl, 0, 0, 10, info);
        });
        //30 分钟后 每5分钟保存地图等级经验 以兼容模拟的地图经验等级
        BaseUtil.runLater(1800, () => {
            BaseUtil.onTimer(300, () => {
                PlayerUtil.forPlayingPlayers(player => {
                    let _tt = (DataBase.getPlayerSolarData(player)._tt || 0) + Math.floor(_g_time / 1000 / 60);
                    ArchiveUtil.set(player, "_tt", _tt)
                })
                return true;
            })
        });


    }


    private static _sl_implementDz(env: any) {

        //存档
        env.DzAPI_Map_GetServerValue = YiYiBase.YDWERPGGetRemoteData
        env.DzAPI_Map_SaveServerValue = YiYiBase.YDWESaveRemoteData
        env.DzAPI_Map_FlushStoredMission = (whichPlayer, key) => {
            YiYiBase.YDWESaveRemoteData(whichPlayer, key, "");
        };

        env.GetPlayerServerValueSuccess = (whichPlayer) => {
            return true;
        };

        //
        /**获取游戏开始时间 */
        let startTime = EXNetGetTime()
        let dzGameStartTime = DateUtil.parseDate(startTime);
        //容差10秒
        dzGameStartTime = math.floor((dzGameStartTime + 5) / 10) * 10

        env.DzAPI_Map_GetGameStartTime = () => {
            return dzGameStartTime
        }
        /**获取地图全局设置 (全局存档) */
        env.DzAPI_Map_GetMapConfig = (key: string) => {
            return YDWERPGGetMapConfig(key)
        }
        /**获取玩家名字 */
        env.GetPlayerName = (pl: player): string => {
            if (EXGetPlayerRealName) {
                return EXGetPlayerRealName(pl)
            } else {
                return CJ.GetPlayerName(pl)
            }

        }
        /**获取公会名称 */
        env.GetGuildName = (pl: player): string => {
            return ""
        }
        /**获取地图等级
         * (11平台没此Api, 返回1) */
        env.DzAPI_Map_GetMapLevel = (pl: player): number => {
            //获取 _tt
            ArchiveUtil.getAllArchive(pl);
            //
            let _tt = DataBase.getPlayerSolarData(pl, true)._tt || 0
            let th = Math.floor(_tt / 60);//总计小时
            let lv = Math.floor(Math.sqrt(th));
            return 1 + lv;
        }
        /**  */
        env.DzAPI_Map_MapsTotalPlayed = (pl: player): number => {
            return 1
        }
        env.DzAPI_Map_GetMapLevelRank = (pl: player): number => {
            return 0
        }
        /**获取游戏局数
         * 在Up平台 >=5分钟 算1局
         * (11平台没此Api, 返回1) */
        env.DzAPI_Map_PlayedGames = (pl: player): number => {
            return 1
        }

        /** DzAPI_Map_Returns
         * (11平台没此Api, 返回false) */
        env.DzAPI_Map_Returns = (pl: player) => {
            return false
        }
        /**是否拥有商城道具 (针对期限型道具) */
        env.DzAPI_Map_HasMallItem = (pl: player, key: string) => {
            if (key == null) {
                return false
            }
            key = YiYiImplementDz.config.keyMap[key] || key
            //检测状态道具
            if (YDWERPGBillingHasStatus(pl, key)) {
                return true;
            }
            //检测次数型道具 是否大于0
            return YDWERPGBillingGetItem(pl, key) > 0
        }
        /**获取商城道具拥有数量 (针对数量型道具) */
        env.DzAPI_Map_GetMallItemCount = (pl: player, key: string) => {
            if (key == null) {
                return 0
            }
            key = YiYiImplementDz.config.keyMap[key] || key
            return YDWERPGBillingGetItem(pl, key)
        }
        /**扣减商城道具拥有数量 (针对数量型道具) */
        env.DzAPI_Map_ConsumeMallItem = (pl: player, key: string, num: number) => {
            key = YiYiImplementDz.config.keyMap[key] || key
            return EXNetUseItem(pl, key, num)
        }


        /**设置房间显示数据 (11平台只能设置数字) */
        env.DzAPI_Map_Stat_SetStat = (pl: player, key: string, val: string) => {
            try {
                let num = tonumber(val)
                if (LangUtil.isNumber(num)) {
                    YDWERPGSetKey(pl, key, num)
                } else {
                    log.errorWithTraceBack("设置房间显示数据 (11平台只能设置数字)")
                }
            } catch (e) {
                print(e)
            }
        }

        /**触发击杀Boss
         * 触发后方可调用下面的函数:
         * (11平台无效) */
        env.DzAPI_Map_OrpgTrigger = (pl: player, key: string): void => {

        }
        /**获取掉落的装备Key
         * 需先调用函数: KillBoss
         * (11平台无效) */
        env.DzAPI_Map_GetServerArchiveDrop = (pl: player, key: string): string => {
            return ""
        }

        /**获取论坛数据
         * whichData参数说明
         * 0=累计获得赞数
         * 1=精华帖数量
         * 2=发表回复次数
         * 3=收到的欢乐数
         * 4=是否发过贴子
         * 5=是否版主
         * 6=主题数量）
         * @param pl
         * @param whichData
         * @returns 数字
         */
        env.DzAPI_Map_GetForumData = (pl: player, whichData: number): number => {
            return 0
        }

        env.DzAPI_Map_ContinuousCount = (pl: player, id: number): number => {
            return 0
        }

        /***
         *
         */
        env.RequestExtraIntegerData = (dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): number => {
            if (dataType == 41) {
                return DzAPI_Map_GetMallItemCount(whichPlayer, param1);
            }
            return 0
        }
        env.RequestExtraBooleanData = (dataType: number, whichPlayer: player, param1: string, param2: string, param3: boolean, param4: number, param5: number, param6: number): boolean => {
            if (dataType == 42) {
                return DzAPI_Map_ConsumeMallItem(whichPlayer, param1, param4);
            }
            return false
        }


    }


}