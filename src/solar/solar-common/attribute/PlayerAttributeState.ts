import {Trigger} from "@/w3ts/handles/trigger";
import BaseUtil from "@/util/BaseUtil";
import DataBase from "../common/DataBase";
import AttributeUtil from "@/util/system/AttributeUtil";
import UnitAttributeState from "./UnitAttributeState";
import SelectUtil from "@/util/unit/SelectUtil";
import SingletonUtil from "@/SingletonUtil";
import UnitStateUtil from "@/UnitStateUtil";

/**
 * 玩家属性系统
 *
 * 将玩家的属性附加到玩家所有单位身上
 */
export default class PlayerAttributeState {
    static config: {
        refreshInterval: number
        inheritHandlers: ((unit: unit) => boolean)[]
    } = {
        refreshInterval: 9.7,
        inheritHandlers: []
    };

    /**
     * 添加单位继承玩家属性的处理器（只要有一个处理器返回true则表示单位继承玩家属性 否则单位不继承玩家属性）
     * @param inheritHandler
     */
    static addInheritHandlers(inheritHandler: (unit: unit) => boolean) {
        PlayerAttributeState.config.inheritHandlers.push(inheritHandler);
    }

    constructor(addBaseInheritHandler = true) {
        if (SingletonUtil.notFirstTime(PlayerAttributeState)) {
            print("不能重复new PlayerAttributeState()")
            return;
        }
        /**
         * 添加基础英雄继承属性
         */
        if (addBaseInheritHandler) {
            PlayerAttributeState.addInheritHandlers(unit => {
                //默认只有英雄单位继承玩家属性
                return IsUnitType(unit, UNIT_TYPE_HERO)
            })
        }

        PlayerAttributeState.refresh();
        BaseUtil.runLater(1, () => {
            PlayerAttributeState.refresh();
            //循环 对每个单位 进行刷新属性
            let triggerTimer = new Trigger()
            //9.7秒刷新一次
            triggerTimer.registerTimerEvent(PlayerAttributeState.config.refreshInterval, true)
            triggerTimer.addAction(() => {
                PlayerAttributeState.refresh();
            });
            //注册实时事件 以实时刷新单位属性
            se.onUnitEnterMapRect(e => {
                let unit = e.trigUnit;
                let player = GetOwningPlayer(unit);
                let playerAttribute = AttributeUtil.getPlayerAttribute(player, false);
                if (!playerAttribute) {
                    return;
                }
                if (!PlayerAttributeState.checkInherit(unit)) {
                    return;
                }
                BaseUtil.runLater(0.01, () => {
                    //延迟执行的 都要判断一下单位状态 因为可能在这个延迟过程中 单位已经被Remove了!
                    if (UnitStateUtil.isAlive(unit)) {
                        PlayerAttributeState.refreshPlayerAtrr2UnitAtrr(unit, playerAttribute)
                    }
                })
            })
            se.on("属性刷新", () => {
                PlayerAttributeState.refresh();
            })
            se.on("选择英雄", () => {
                PlayerAttributeState.refresh();
            })
        })

    }

    static refresh() {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            let tempPlayer = Player(i);
            //在线玩家 包括电脑也可以有玩家属性
            if (GetPlayerSlotState(tempPlayer) == PLAYER_SLOT_STATE_PLAYING) {
                let playerAttribute = AttributeUtil.getPlayerAttribute(tempPlayer, false);
                PlayerAttributeState.refreshPlayerAttributes2PlayerUnits(tempPlayer, playerAttribute);
            }
        }
    }

    static checkInherit(unitHandle: unit): boolean {
        for (let inheritHandler of PlayerAttributeState.config.inheritHandlers) {
            if (inheritHandler(unitHandle)) {
                return true;
            }
        }
        return false;
    }

    /**
     * 刷新单位携带的物品的属性值 附加到 单位属性中
     * @param player 玩家
     * @param playerAttribute 玩家属性
     */
    static refreshPlayerAttributes2PlayerUnits(player: player, playerAttribute: AppPlayerAttribute) {
        if (playerAttribute == null) {//已有玩家的属性不能再直接把玩家属性设置为null 否则不会进入下面的单位属性刷新 导致单位继承的玩家属性没有清除
            //退出以节省运算性能 防止对进攻怪物进行属性判断
            return;
        }
        SelectUtil.forPlayerUnits(unitHandle => {
            if (!PlayerAttributeState.checkInherit(unitHandle)) {
                return;
            }
            PlayerAttributeState.refreshPlayerAtrr2UnitAtrr(unitHandle, playerAttribute)
        }, GetPlayerId(player))


    }

    static refreshPlayerAtrr2UnitAtrr(unitHandle: unit, playerAttribute: AppPlayerAttribute) {
        let unitOldPlayerSAttr: AppAttribute = DataBase.getUnitSolarData(unitHandle, false)?._SL_inheritPSA;
        /**
         */
        let solarData = DataBase.getUnitSolarData(unitHandle);
        if (!solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }

        AttributeUtil.subtract(solarData._SL_solarAttribute, unitOldPlayerSAttr);
        AttributeUtil.add(solarData._SL_solarAttribute, playerAttribute);

        //重新复制一份 以免改动玩家的属性 影响到这里继承的属性值
        solarData._SL_inheritPSA = {...playerAttribute};
        //发送属性改变事件
        UnitAttributeState.refreshUnitSolarAttribute(unitHandle)
    }

}
