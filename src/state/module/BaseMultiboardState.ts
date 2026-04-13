//#sl-final
import {Trigger} from '@/trigger';
import BaseUtil from '@/BaseUtil';
import ForceUtil from '@/ForceUtil';
import {MapPlayer} from '@/player';
import AttributeUtil from '@/AttributeUtil';
import CombatPowerUtil from '@/CombatPowerUtil';
import TextUtil from "@/TextUtil";
import PlayerUtil from "@/PlayerUtil";
import ActorUtil from "@/ActorUtil";
import MultiboardUtil from "@/MultiboardUtil";

/**
 * Combat power 战力
 * Endless Level 无尽等级
 */
declare global {

    interface AppAttribute {
        /**杀敌获取效率*/
        earn_kill_count_p?: number
    }

}
export default class BaseMultiboardState {

    /**
     * config
     */
    static config = {
        headRowCount: 1,
        showPlayerHeroName: false,
        showPlayerHeroLevel: false,
        showGold: true,
        showLumber: false,
        showCombatPower: true,
        /** 显示吞噬 */
        showSwallowCount: false,
        showEndlessLevel: false,

    }
    /**这里的宽度单位是屏幕百分比 3 = 3% =0.03 */
    static widthConfig = [0.05, 0.025, 0.025, 0.025, 0.025, 0.015, 0.015, 0.015]


    static multiboard: multiboard = null;


    constructor() {
        BaseUtil.runLater(3, () => {
            this.initVars();
            this.init();
            this.initTimerEventTrigger();
            this.initKillCountTrigger();

        })

    }

    initTimerEventTrigger() {
        let trigger = new Trigger()
        trigger.registerTimerEvent(5, true)
        trigger.addAction(() => {
            this.refreshCombatPower()
        })
    }


    refreshCombatPower() {
        ForceUtil.forUserForce(player => {
            MapPlayer.fromHandle(player).solarData.combatPower = CombatPowerUtil.getPlayerCombatPower(GetPlayerId(player));
        })
    }


    initKillCountTrigger() {
        let trigger = new Trigger()
        trigger.registerAnyUnitDeathEvent()
        trigger.addAction(() => {
            let player = GetOwningPlayer(GetKillingUnit());
            if (IsHandle(player) && GetOwningPlayer(GetTriggerUnit()) != player) {
                //太阳自定义数据
                let solarData = db.getPlayerSolarData(player);
                solarData.killCount = (solarData.killCount || 0) + 1 + Math.floor((AttributeUtil.getUnitAttribute(GetKillingUnit())?.earn_kill_count_p ?? 0));

            }
        })
    }


    initVars() {
        let widthConfig = BaseMultiboardState.widthConfig;
        if (BaseMultiboardState.config.showPlayerHeroName) {
            widthConfig[0] += 0.03;
        }
        if (BaseMultiboardState.config.showPlayerHeroLevel) {
            widthConfig[0] += 0.01;
        }
        //
        BaseMultiboardState.multiboard = CreateMultiboard();
        //
        MultiboardSetRowCount(BaseMultiboardState.multiboard, ForceUtil.getUserCount() + BaseMultiboardState.config.headRowCount);
        // MultiboardSetItemsWidth(BaseMultiboardState.multiboard, 0.03);
        MultiboardSetColumnCount(BaseMultiboardState.multiboard, 7);
        MultiboardUtil.forMultiboardItems(BaseMultiboardState.multiboard, (item, row, column) => {
            MultiboardSetItemWidth(item, widthConfig[column]);
        })

        MultiboardMinimize(BaseMultiboardState.multiboard, false);
        MultiboardSetItemsStyle(BaseMultiboardState.multiboard, true, false);
        MultiboardSetTitleTextColor(BaseMultiboardState.multiboard, 0, 204, 51, 255);

        // =============第一行为标题行==========


        let col = 0;
        MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, 0, col, "玩家名");
        MultiboardUtil.setItemWidth(BaseMultiboardState.multiboard, 0, col, widthConfig[0]);
        if (BaseMultiboardState.config.showGold) {
            col++;
            MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, 0, col, "黄金");
            MultiboardUtil.setItemWidth(BaseMultiboardState.multiboard, 0, col, widthConfig[1]);
        }
        if (BaseMultiboardState.config.showLumber) {
            col++;
            MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, 0, col, "木材");
            MultiboardUtil.setItemWidth(BaseMultiboardState.multiboard, 0, col, widthConfig[2]);
        }
        if (BaseMultiboardState.config.showCombatPower) {
            col++;
            MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, 0, col, "战力");
            MultiboardUtil.setItemWidth(BaseMultiboardState.multiboard, 0, col, widthConfig[3]);
        }
        col++;
        MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, 0, col, "杀敌");
        MultiboardUtil.setItemWidth(BaseMultiboardState.multiboard, 0, col, widthConfig[4]);
        if (BaseMultiboardState.config.showSwallowCount) {
            col++;
            MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, 0, col, "吞噬");
            MultiboardUtil.setItemWidth(BaseMultiboardState.multiboard, 0, col, widthConfig[5]);
        }
        if (BaseMultiboardState.config.showEndlessLevel) {
            col++;
            MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, 0, col, "无尽等级");
            MultiboardUtil.setItemWidth(BaseMultiboardState.multiboard, 0, col, widthConfig[6]);
        }

        MultiboardSetColumnCount(BaseMultiboardState.multiboard, col + 1);
        for (let i = 0; i <= col; i++) {
            MultiboardUtil.setItemColor(BaseMultiboardState.multiboard, 0, i, 0, 204, 51, 255);
        }
        MultiboardDisplay(BaseMultiboardState.multiboard, true);
        //30秒内一直轮询 显示 以免被其他对话框阻碍
        BaseUtil.runLater(3, () => {
            MultiboardDisplay(BaseMultiboardState.multiboard, true)
        }, 10)

    }

    init() {
        let trigger = new Trigger()
        trigger.registerTimerEvent(1, true)
        trigger.addAction(this.refresh)
    }

    refresh(this: void) {

        let gameTime = BaseUtil.getGameTime();
        let title = I2S(gameTime / 60) + ":" + I2S(gameTime % 60)
        if (gv.enemyLevel) {
            let level_str = "波数" + "：" + gv.enemyLevel
            title = title + "  " + level_str
        }
        if (gv.enemyCount) {
            let life_str = "敌人" + "：" + (gv.enemyCount ?? 0)
            if (settings.enemyUpperLimit) {
                life_str = life_str + "/" + settings.enemyUpperLimit
            }
            title = title + "  " + life_str
        }
        if (settings.gameMode && settings.gameMode.length > 0) {
            title = title + "  " + settings.gameMode + "-N" + settings.gameDifficulty
        } else {
            title = title + "  N" + settings.gameDifficulty
        }

        if (settings.isEndlessMode == true) {
            title = title + "(无尽)"
        }

        MultiboardSetTitleText(BaseMultiboardState.multiboard, title);
        // =============玩家数据==========

        let i = 0;
        MultiboardSetRowCount(BaseMultiboardState.multiboard, ForceUtil.getUserCount() + BaseMultiboardState.config.headRowCount);
        ForceUtil.forUserForce(player => {
            i++;
            let row = i + BaseMultiboardState.config.headRowCount - 1;
            let col = 0;
            let name = GetPlayerName(player);
            if (BaseMultiboardState.config.showPlayerHeroName) {
                let hero = PlayerUtil.getHero(player);
                if (IsHandle(hero)) {
                    name = name + " (" + tostring(GetUnitName(hero)) + ")";
                    if (BaseMultiboardState.config.showPlayerHeroLevel) {
                        name = name + " Lv." + tostring(GetUnitLevel(hero));
                    }
                }
            }

            MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, row, col, name);

            let psd = db.getPlayerSolarData(player);
            if (BaseMultiboardState.config.showGold) {
                col++;
                MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, row, col, TextUtil.toCnUnit(GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD)));
            }
            if (BaseMultiboardState.config.showLumber) {
                col++;
                MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, row, col, GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER) + "");
            }
            if (BaseMultiboardState.config.showCombatPower) {
                col++;
                let combatPowerStr = TextUtil.toCnUnit(psd.combatPower ?? 0)
                MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, row, col, combatPowerStr);
            }
            col++;
            MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, row, col, tostring(psd.killCount ?? 0));
            if (psd.killCount) {
                PlayerUtil.setFoodUsed(player, psd.killCount)
            }

            if (BaseMultiboardState.config.showSwallowCount) {
                col++;
                let hero = PlayerUtil.getHero(player);
                let tssl = 0;
                if (IsHandle(hero)) {
                    tssl = ActorUtil.getUnitAllActorListByClass(hero, "吞噬")?.length || 0;
                }
                MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, row, col, tostring(tssl));
            }
            if (BaseMultiboardState.config.showEndlessLevel) {
                col++;
                MultiboardUtil.setItemValue(BaseMultiboardState.multiboard, row, col, tostring(DzAPI_Map_GetStoredInteger(player, "endless_level") || 0));
            }


        })


    }


}