/**
 * 太阳自定义值清理类
 *
 * 由于自定义值是绑定在handle上的  handle会重用 所以在handle重用前 要清理自定义值
 *
 */
import DataBase from "../common/DataBase";
import BaseUtil from "../util/BaseUtil";
import UnitDeathTimeUtil from "@/UnitDeathTimeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorUtil from "@/ActorUtil";
import ItemUtil from "@/ItemUtil";
import Actor from "@/Actor";

/**
 * 单位和英雄死亡时清理数据
 *
 * (低于这个清理时间 的延迟使用的普通单位handle可以不用手动加锁 这里会加锁以保证handle死亡后清理延迟时间内不会被重用)
 *
 * 物品死亡未做处理 所以物品应该只能被贩卖或移除 不能被A死掉 否则可能导致其handle复用关联的solarData等关联数据未销毁
 *
 */
export default class SolarDataClearState {

    static config = {

        removeUnitDelay: 10, //设置普通单位死亡后移除时间
        /**handle重用保护时间 */
        delay: 32, //设置普通单位最迟使用handle和solarData或其他数据的时间 在这个时间内延迟使用handle可以不用对handel引用加减
        heroDealy: 200,//设置英雄单位最迟使用数据的时间,英雄也必须在这个时间内复活。否则会被清空solarData
        openClearCmd: true,//启用 输入-c 5秒后清楚全图地面上的物品 （由于物品不推荐被A死 部分不能售卖的物品 必须通过触发来移除）
    }


    constructor(delay: number = SolarDataClearState.config.delay) {
        SolarDataClearState.config.delay = delay;
        handleReuseMinTime = Math.min(delay, SolarDataClearState.config.heroDealy) - 1;
        if (handleReuseMinTime < 8) {
            log.errorWithTraceBack("清理的延迟不得小于8秒")
            return;
        }
        //普通单位和英雄单位的solarData清理
        se.onUnitDeath(e => {
            let whichUnit = e.trigUnit;
            handle_ref(whichUnit)//防止单位死亡被底层清理导致handle被重用
            UnitDeathTimeUtil.setDeathTime(whichUnit, _g_time);
            let rDelay = SolarDataClearState.config.delay;
            if (e.isHeroUnitTrig) {
                rDelay = SolarDataClearState.config.heroDealy;
            } else if (SolarDataClearState.config.removeUnitDelay > 1) {
                //移除普通单位
                BaseUtil.runLater(SolarDataClearState.config.removeUnitDelay, () => {
                    //判断普通单位是否未被复活 (如圣骑士的复活)
                    if (!UnitStateUtil.isAlive(whichUnit)) {
                        //手动再移除一下(可能底层已经移除。底层会在单位死亡腐化完毕后自动销毁)
                        UnitDeathTimeUtil.clearDeathTime(whichUnit)
                        RemoveUnit(whichUnit);
                    }
                });
            }
            //保护handle 不被重用 且释放handle时清理SolarData
            BaseUtil.runLater(rDelay, () => {
                //兼容复活英雄 复活单位。 如果没有死亡时间 则可能已被RemoveUnit时 清除死亡时间了。 判断死亡时间超时 只有最后一次死亡才会被清除solarData(兼容死亡后复活再死亡复活的情况)
                if (!UnitStateUtil.isAlive(whichUnit)) {
                    if (!UnitDeathTimeUtil.hasDeathTime(whichUnit) || UnitDeathTimeUtil.isTimeOfDeathExceeded(whichUnit, rDelay - 0.001)) {
                        //清空死亡到最大等待时间都还没复活过的 英雄单位的solarData 不需要调用RemoveUnit移除英雄以供随时复活他们(底层会保留最近死亡的7个英雄,超过的会被底层自动销毁)
                        DataBase.clearUnitSolarData(whichUnit)
                    }
                }
                handle_unref(whichUnit)
            })
        });
        //物品抵押
        se.onUnitPawnItem(e => {
            let item = GetSoldItem();
            if (!IsHandle(item)) {
                //可能在注册此事件类型的其他触发里 已经销毁了
                return;
            }
            //移除物品
            handle_ref(item)
            BaseUtil.runLater(SolarDataClearState.config.removeUnitDelay, () => {
                handle_unref(item)
                RemoveItem(item);
            });
        });

        if (SolarDataClearState.config.openClearCmd) {
            se.playerChat("-c", () => {
                BaseUtil.runLater(1, (count, maxCount) => {
                    if (count == maxCount) {
                        ItemUtil.forItemsInRect(GetPlayableMapRect(), item => {
                            RemoveItem(item);
                        }, false)
                        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10,
                            "|cffff0000【系统提示】清理地面物品完毕!");
                    } else {
                        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 10,
                            "|cffff0000【系统提示】清理地面物品倒计时:" + (maxCount - count));
                    }
                }, 6, true)

            })
        }


    }


    /**
     * 清理数据 当移除handle时
     * //底层也会自动移除死亡单位
     */
    static _sl_hookClearHandle() {
        //
        let jassRemoveUnit = RemoveUnit;
        _G.RemoveUnit = function (this: void, whichUnit: unit): void {
            if (IsHandle(whichUnit)) {
                //及时清理一下solarData
                let actorList = ActorUtil.getUnitAllActorList(whichUnit);
                if (actorList != null && actorList.length > 0) {
                    for (let actor of actorList) {
                        if (actor != null) {
                            actor.destroy(true);
                        }
                    }
                }
                DataBase.clearUnitSolarData(whichUnit)
            } else {
                log.errorWithTraceBack("你正在删除一个空的单位handle！请使用IsHandle判断是否有值!")
            }
            handle_ref(whichUnit)
            UnitDeathTimeUtil.setDeathTime(whichUnit);
            jassRemoveUnit(whichUnit)
            //保护handle 不被重用 且释放handle时清理SolarData
            BaseUtil.runLater(handleReuseMinTime + 2, () => {
                //再次清除一下数据 提高框架鲁棒性 以兼容在移除单位之后清空数据之后 又去设置了数据
                DataBase.clearUnitSolarData(whichUnit)
                UnitDeathTimeUtil.clearDeathTime(whichUnit)
                handle_unref(whichUnit)
            });
        }
        //todo 物品应减少SolarData的逻辑 如果物品不是通过RemoveItem销毁的 （比如物品死亡可能会导致物品的SolarData被handle复用）
        let jassRemoveItem = RemoveItem;
        _G.RemoveItem = function (this: void, whichItem: item): void {
            if (IsHandle(whichItem)) {
                let actor: Actor = DataBase.getItemSolarData(whichItem, false)?._SL_solarActorItem
                if (actor) {
                    actor.destroy(true);
                }
                DataBase.clearItemSolarData(whichItem)
                jassRemoveItem(whichItem)
            } else {
                log.errorWithTraceBack("你正在删除一个空的物品handle！请使用IsHandle判断是否有值!")
            }
        }
    }


}