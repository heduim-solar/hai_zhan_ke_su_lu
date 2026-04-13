/** @noSelfInFile */
import mitt from '@//lib/mitt'
import Cache from "@/tool/Cache";
import TriggerUtil from "@/util/system/TriggerUtil";
import UnitSpellEvent from "@/tool/event/UnitSpellEvent";
import UnitDeathEvent from "@/tool/event/UnitDeathEvent";
import UnitAttackedEvent from "@/tool/event/UnitAttackedEvent";
import UnitDamagedEvent from "../tool/event/UnitDamagedEvent";
import UnitEvent from "../tool/event/UnitEvent";
import UnitItemEvent from "../tool/event/UnitItemEvent";
import SingletonUtil from "@/SingletonUtil";
import SolarTrigger from "@/SolarTrigger";
import DataBase from "@/DataBase";
import PlayerEvent from "@/PlayerEvent";
import UIFrameEvent from "@/UIFrameEvent";

const emitter = mitt()
const cache = new Cache();

/**
 * 太阳事件(总线)
 * 所有监听的事件回调公用一个触发器去注册
 * (相同事件后注册的会先执行 最先注册的会最后执行 倒序遍历数组. 如果需要后注册的后执行 可以考虑使用原生的trigger)
 */
export default class SolarEvent {


    constructor() {
        if (SingletonUtil.notFirstTime(SolarEvent)) {
            print("不能重复new SolarEvent() 请直接使用全局变量se进行访问")
            return;
        }
    }


    /**
     * 注册一个事件接收器
     * @param type
     * @param handler
     */
    on<Key extends keyof AppEventType>(type: Key, handler: (data: AppEventType[Key]) => void): SolarTrigger {
        const key = "on:" + type;
        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            let stSet: SolarTriggerArray = [];
            emitter.on(type as any, (data) => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec(data);
                }
            })
            return stSet;
        })
        return new SolarTrigger((self, data) => {
            handler(data);
        }, solarTriggerSet)

    }

    /**
     * 发布一个事件
     * @param type
     * @param data
     */
    emit<Key extends keyof AppEventType>(type: Key, data?: AppEventType[Key]): void {
        emitter.emit(type as any, data as any)
    }


    /**
     * 玩家输入聊天信息
     * @deprecated see onPlayerChat
     */
    playerChat(chatMessageToDetect: string, callback: (triggerPlayer: player, chatString: string) => void, exactMatchOnly: boolean = true): SolarTrigger {
        return this.onPlayerChat(chatMessageToDetect, (e, s) => {
            callback(e.triggerPlayer, e.eventPlayerChatString);
        }, exactMatchOnly)
    }

    /**
     *   玩家输入聊天信息
     * @param chatMessageToDetect
     * @param callback
     * @param exactMatchOnly  传入false则包含匹配 传入true 则完整匹配
     */
    onPlayerChat(chatMessageToDetect: string, callback: (e: PlayerEvent, solarTrigger: SolarTrigger) => void, exactMatchOnly: boolean = true) {
        const key = "onPlayerChat:" + chatMessageToDetect + ":" + exactMatchOnly;
        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            let stSet: SolarTriggerArray = [];
            let trigger = CreateTrigger()
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerChatEvent(trigger, Player(i), chatMessageToDetect, exactMatchOnly);
            }
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            })
            return stSet;
        })
        return new SolarTrigger((solarTrigger) => {
            callback(PlayerEvent.instance, solarTrigger)
        }, solarTriggerSet)
    }

    /**
     * 任意单位伤害事件
     * @deprecated see onUnitDamaged
     */
    unitDamaged(callback: (triggerUnit: unit, damageSourceUnit: unit, damage: number) => void, onlyHasDamageSource: boolean = true): SolarTrigger {
        const key = "unitDamaged";

        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            let stSet: SolarTriggerArray = [];
            let trigger = CreateTrigger()
            TriggerUtil.SystemAnyUnitDamagedRegistTrigger(trigger)
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }

            })
            return stSet;
        });
        return new SolarTrigger(() => {
            if (onlyHasDamageSource && !IsHandle(GetEventDamageSource())) {
                return
            }
            callback(GetTriggerUnit(), GetEventDamageSource(), GetEventDamage())
        }, solarTriggerSet)
    }

    /**
     *
     * @param callback
     * @param onlyHasDamageSource 默认会判断是否有伤害来源 (投射物射出后 单位死亡 然后投射物造成伤害可能会导致造成伤害却没有伤害来源单位)
     */
    onUnitDamaged(callback: (e: UnitDamagedEvent, solarTrigger: SolarTrigger) => void, onlyHasDamageSource: boolean = true): SolarTrigger {
        const key = "onUnitDamaged";
        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            let stSet: SolarTriggerArray = [];
            let trigger = CreateTrigger()
            TriggerUtil.SystemAnyUnitDamagedRegistTrigger(trigger)
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            })
            return stSet;
        });
        return new SolarTrigger((solarTrigger) => {
            if (onlyHasDamageSource && !IsHandle(GetEventDamageSource())) {
                return
            }
            callback(UnitDamagedEvent.instance, solarTrigger)
        }, solarTriggerSet);
    }

    /**
     * 任意单位离开区域
     */
    onLeaveRect(whichRect: rect = bj_mapInitialPlayableArea, callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void) {
        const key = "onLeaveRect:" + GetHandleId(whichRect);
        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            let stSet: SolarTriggerArray = [];
            let rectRegion: region = CreateRegion()
            RegionAddRect(rectRegion, whichRect)
            //任意单位死亡事件
            let trigger = CreateTrigger()
            TriggerRegisterLeaveRegion(trigger, rectRegion, null);
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            })
            return stSet;
        })
        return new SolarTrigger((solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        }, solarTriggerSet)
    }

    /**
     * 单位进入区域
     */
    onEnterRect(whichRect: rect = bj_mapInitialPlayableArea, callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        const key = "onEnterRect:" + GetHandleId(whichRect);
        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            let stSet: SolarTriggerArray = [];
            let rectRegion: region = CreateRegion()
            RegionAddRect(rectRegion, whichRect)
            //任意单位死亡事件
            let trigger = CreateTrigger()
            TriggerRegisterEnterRegion(trigger, rectRegion, null);
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            })
            return stSet;
        })
        return new SolarTrigger((solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        }, solarTriggerSet)
    }

    /**
     * 当任意单位进入可用地图区域
     * @param callback
     */
    onUnitEnterMapRect(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        const key = "onUnitEnterMapRect";
        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            let stSet: SolarTriggerArray = [];
            let rectRegion: region = CreateRegion()
            RegionAddRect(rectRegion, GetPlayableMapRect())
            //任意单位死亡事件
            let trigger = CreateTrigger()
            TriggerRegisterEnterRegion(trigger, rectRegion, null);
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
            })
            return stSet;
        })
        return new SolarTrigger((solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        }, solarTriggerSet)
    }


    /**
     * 任意单位事件 - 抵押
     * @param callback
     */
    onUnitPawnItem(callback: (e: UnitItemEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_PAWN_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger)
        })
    }

    /**
     * 任意单位事件 - 出售物品
     * @param callback
     */
    onUnitSellItem(callback: (e: UnitItemEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_SELL_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger)
        })
    }

    /**
     * 任意单位事件 - 获得物品
     * @param callback
     */
    onUnitPickupItem(callback: (e: UnitItemEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger)
        })
    }


    /**
     * 任意单位事件 - 丢弃物品
     * @param callback
     */
    onUnitDropItem(callback: (e: UnitItemEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_DROP_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger)
        })
    }


    /**
     * 任意单位事件 - 使用物品
     * @param callback
     */
    onUnitUseItem(callback: (e: UnitItemEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_USE_ITEM, (triggerUnit, solarTrigger) => {
            callback(UnitItemEvent.instance, solarTrigger)
        })
    }


    /**
     * 玩家单位事件 - 开始建造
     * @param callback
     */
    onUnitConstructStart(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_START, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        })
    }

    /**
     * 玩家单位事件 - 完成建造
     * @param callback
     */
    onUnitConstructFinish(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_CONSTRUCT_FINISH, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        })
    }

    /**
     * 玩家单位事件 - 完成建筑升级
     * @param callback
     */
    onUnitUpgradeFinish(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_FINISH, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        })
    }

    /**
     * 任意玩家单位事件 - 选择单位
     * @param callback
     */
    onUnitSelected(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_SELECTED, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        })
    }


    private static _sl_last_select_info: {
        [pid: number]: {
            unit: unit
            time: number
        }
    } = {}

    /**
     * 任意玩家双击选择单位事件
     * @param callback
     */
    onUnitDoubleClickSelected(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_SELECTED, (triggerUnit, solarTrigger) => {
            let tu = GetTriggerUnit()
            let playerId = GetPlayerId(GetOwningPlayer(tu));
            let lastSelectInfo = SolarEvent._sl_last_select_info[playerId];
            if (lastSelectInfo == null) {
                SolarEvent._sl_last_select_info[playerId] = {unit: tu, time: _g_time}
                return
            }
            if (lastSelectInfo.unit == tu && (_g_time - lastSelectInfo.time) < 1000) {
                callback(UnitEvent.instance, solarTrigger)
            }
            lastSelectInfo.unit = tu;
            lastSelectInfo.time = _g_time;
        })
    }


    /**
     * 任意单位事件 - 开始施放技能
     * @param callback
     * @param abilityId
     */
    onUnitSpellChannel(callback: (event: UnitSpellEvent, solarTrigger: SolarTrigger) => void, abilityId?: string): SolarTrigger {
        return this.anyUnitSpellEvent(EVENT_PLAYER_UNIT_SPELL_CHANNEL, callback, abilityId);
    }

    /**
     * 任意单位事件 - 准备施放技能
     * @param callback
     * @param abilityId
     */
    onUnitSpellCast(callback: (event: UnitSpellEvent, solarTrigger: SolarTrigger) => void, abilityId?: string): SolarTrigger {
        return this.anyUnitSpellEvent(EVENT_PLAYER_UNIT_SPELL_CAST, callback, abilityId);
    }

    /**
     * 任意单位事件 - 发动技能效果
     * @param callback
     * @param abilityId
     */
    onUnitSpellEffect(callback: (event: UnitSpellEvent, solarTrigger: SolarTrigger) => void, abilityId?: string): SolarTrigger {
        return this.anyUnitSpellEvent(EVENT_PLAYER_UNIT_SPELL_EFFECT, callback, abilityId);
    }

    /**
     * 任意单位事件 - 死亡
     * @param callback
     */
    unitDeath(callback: (triggerUnit: unit, killingUnit: unit) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_DEATH, triggerUnit => {
            callback(triggerUnit, GetKillingUnit())
        })
    }

    /**
     * 任意单位事件 - 死亡
     * @param callback
     * @param unitTypeIdStr 指定单位类型
     */
    onUnitTypeDeath(callback: (e: UnitDeathEvent, solarTrigger: SolarTrigger) => void, unitTypeIdStr: string): SolarTrigger {
        this.anyUnitEvent(EVENT_PLAYER_UNIT_DEATH, null);
        const key = "anyUnitEvent:" + GetHandleId(EVENT_PLAYER_UNIT_DEATH);
        let solarTriggerSet = SolarEvent.getUnitTypeDataEventHandler(unitTypeIdStr, key, true);
        return new SolarTrigger((solarTrigger) => {
            callback(UnitDeathEvent.instance, solarTrigger)
        }, solarTriggerSet);
    }

    /**
     * 任意单位事件 - 死亡
     * @param callback
     * @param unit 指定单位事件
     */
    onUnitDeath(callback: (e: UnitDeathEvent, solarTrigger: SolarTrigger) => void, unit?: unit): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_DEATH, (t, solarTrigger: SolarTrigger) => {
            callback(UnitDeathEvent.instance, solarTrigger)
        }, unit)
    }

    /**
     * 任意单位事件 - 开始研究科技
     * @param callback
     */
    onUnitResearchStart(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_RESEARCH_START, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        })
    }

    /**
     * 任意单位事件 - 研究科技完成
     * @param callback
     */
    onUnitResearchFinish(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_RESEARCH_FINISH, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        })
    }

    /**
     * 任意单位事件 - 被攻击
     * @param callback
     * @deprecated see onUnitAttacked
     */
    unitAttacked(callback: (triggerUnit: unit, attacker: unit) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, triggerUnit => {
            callback(triggerUnit, GetAttacker())
        })
    }

    /**
     * 任意单位事件 - 被攻击
     * @param callback
     */
    onUnitAttacked(callback: (e: UnitAttackedEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED, (triggerUnit, solarTrigger) => {
            callback(UnitAttackedEvent.instance, solarTrigger)
        })
    }

    /**
     * 任意单位事件 - 出售单位
     * @param callback
     */
    onUnitSellUnit(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_UNIT_SELL, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        })
    }

    /**
     * 任意单位 受到攻击伤害
     * 这个可以防止单位寸止 即抬手时就触发了被攻击事件
     * @param callback
     */
    onUnitAttackedDamage(callback: (e: UnitDamagedEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.onUnitDamaged((e, solarTrigger) => {
            if (0 != EXGetEventDamageData(EVENT_DAMAGE_DATA_IS_ATTACK)) {
                callback(e, solarTrigger);
            }
        })
    }

    /**
     * 英雄单位 - 升级
     * @param callback
     */
    onHeroLevelUp(callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        return this.anyUnitEvent(EVENT_PLAYER_HERO_LEVEL, (triggerUnit, solarTrigger) => {
            callback(UnitEvent.instance, solarTrigger)
        })
    }

    /**
     * 任意单位事件
     */
    anyUnitEvent(whichPlayerUnitEvent: playerunitevent, callback: (triggerUnit: unit, solarTrigger: SolarTrigger) => void, unit?: unit): SolarTrigger {
        const key = "anyUnitEvent:" + GetHandleId(whichPlayerUnitEvent);
        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            //任意单位事件
            let stSet: SolarTriggerArray = [];
            let trigger = CreateTrigger()
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerUnitEvent(trigger, Player(i), whichPlayerUnitEvent, null)
            }
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
                //
                let dataEventHandler = SolarEvent.getUnitDataEventHandler(GetTriggerUnit(), key, false);
                if (dataEventHandler) {
                    for (let i = dataEventHandler.length - 1; i >= 0; i--) {
                        dataEventHandler[i].exec();
                    }
                }
                dataEventHandler = SolarEvent.getUnitTypeDataEventHandler(id2string(GetUnitTypeId(GetTriggerUnit())), key, false);
                if (dataEventHandler) {
                    for (let i = dataEventHandler.length - 1; i >= 0; i--) {
                        dataEventHandler[i].exec();
                    }
                }
            })
            return stSet;
        });
        if (callback == null) {
            return null;
        }
        if (IsHandle(unit)) {
            solarTriggerSet = SolarEvent.getUnitDataEventHandler(unit, key, true);
        }
        return new SolarTrigger((solarTrigger) => {
            callback(GetTriggerUnit(), solarTrigger)
        }, solarTriggerSet)
    }

    /**
     * 任意单位释放技能总事件
     */
    anyUnitSpellEvent(whichPlayerUnitEvent: playerunitevent, callback: (spellEvent: UnitSpellEvent, solarTrigger: SolarTrigger) => void, spellAbilityId?: string): SolarTrigger {
        const key = "anyUnitSpellEvent:" + GetHandleId(whichPlayerUnitEvent);
        let solarTriggerSet: SolarTriggerArray = cache.get(key, () => {
            //任意单位事件
            let stSet: SolarTriggerArray = [];
            let trigger = CreateTrigger()
            for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
                TriggerRegisterPlayerUnitEvent(trigger, Player(i), whichPlayerUnitEvent, null)
            }
            TriggerAddAction(trigger, () => {
                for (let i = stSet.length - 1; i >= 0; i--) {
                    stSet[i].exec();
                }
                //
                let dataEventHandler = SolarEvent.getUnitSpellAbilityDataEventHandler(id2string(GetSpellAbilityId()), key, false);
                if (dataEventHandler) {
                    for (let i = dataEventHandler.length - 1; i >= 0; i--) {
                        dataEventHandler[i].exec();
                    }
                }
            })
            return stSet;
        })
        if (spellAbilityId) {
            solarTriggerSet = SolarEvent.getUnitSpellAbilityDataEventHandler(spellAbilityId, key, true);
        }
        return new SolarTrigger((solarTrigger) => {
            callback(UnitSpellEvent.instance, solarTrigger)
        }, solarTriggerSet)

    }

    /**
     * 异步的ui 事件回调
     */
    onFrameEvent(frame: number, event: number, callback: (event: UIFrameEvent, solarTrigger: SolarTrigger) => void) {
        const key = "onFrameEvent:" + event;
        let funcHandle: (() => void) = cache.get(key, () => {
            //任意单位事件
            return () => {
                //
                let dataEventHandler = SolarEvent.getFrameDataEventHandler(DzGetTriggerUIEventFrame(), key, false);
                if (dataEventHandler) {
                    for (let i = dataEventHandler.length - 1; i >= 0; i--) {
                        dataEventHandler[i].exec();
                    }
                }
            };
        });
        //统一用一个闭包去注册
        DzFrameSetScriptByCode(frame, event, funcHandle, false)
        //
        let solarTriggerSet: SolarTriggerArray = SolarEvent.getFrameDataEventHandler(frame, key, true);
        return new SolarTrigger((solarTrigger) => {
            callback(UIFrameEvent.instance, solarTrigger)
        }, solarTriggerSet);
    }


    /**
     * 当任意单位进入指定单位的范围内时
     * 此事件暂时没有排泄  所以整个游戏不要注册太多本事件 推荐不超过 500次
     * @param unit
     * @param range
     * @param callback
     */
    onUnitInRange(unit: unit, range: number, callback: (e: UnitEvent, solarTrigger: SolarTrigger) => void): SolarTrigger {
        //锁死这个handle
        handle_ref(unit)
        let solarTriggerSet: SolarTriggerArray = [];
        let t = CreateTrigger()
        TriggerRegisterUnitInRange(t, unit, range, null);
        TriggerAddAction(t, () => {
            for (let i = solarTriggerSet.length - 1; i >= 0; i--) {
                solarTriggerSet[i].exec();
            }
        });
        let solarTrigger = new SolarTrigger((solarTrigger) => {
            callback(UnitSpellEvent.instance, solarTrigger)
        }, solarTriggerSet);
        solarTrigger.onDestroy = solarTrigger => {
            TriggerClearActions(t)
            DestroyTrigger(t)
        }
        return solarTrigger
    }

    /**
     * 清除所有注册的事件
     */
    clear() {
        cache.clear();
        emitter.all.clear();
    }


    static getUnitDataEventHandler(unit: unit, eventKey: string, createDefault: boolean): SolarTriggerArray {
        if (createDefault) {
            let unitSolarData = DataBase.getUnitSolarData(unit, createDefault);
            if (unitSolarData._SL_solarEventHandler == null) {
                unitSolarData._SL_solarEventHandler = {}
            }
            if (unitSolarData._SL_solarEventHandler[eventKey] == null) {
                unitSolarData._SL_solarEventHandler[eventKey] = []
            }
            return unitSolarData._SL_solarEventHandler[eventKey]
        }
        return DataBase.getUnitSolarData(unit, createDefault)?._SL_solarEventHandler?.[eventKey]
    }

    static getUnitTypeDataEventHandler(unitType: string, eventKey: string, createDefault: boolean): SolarTriggerArray {
        if (createDefault) {
            let unitSolarData = DataBase.getUnitTypeSolarData(unitType, createDefault);
            if (unitSolarData._SL_solarEventHandler == null) {
                unitSolarData._SL_solarEventHandler = {}
            }
            if (unitSolarData._SL_solarEventHandler[eventKey] == null) {
                unitSolarData._SL_solarEventHandler[eventKey] = []
            }
            return unitSolarData._SL_solarEventHandler[eventKey]
        }
        return DataBase.getUnitTypeSolarData(unitType, createDefault)?._SL_solarEventHandler?.[eventKey]
    }

    //spellAbilityId
    static getUnitSpellAbilityDataEventHandler(abilityIdStr: string, eventKey: string, createDefault: boolean): SolarTriggerArray {
        if (createDefault) {
            let unitSolarData = DataBase.getAbilityTypeSolarData(abilityIdStr, createDefault);
            if (unitSolarData._SL_solarEventHandler == null) {
                unitSolarData._SL_solarEventHandler = {}
            }
            if (unitSolarData._SL_solarEventHandler[eventKey] == null) {
                unitSolarData._SL_solarEventHandler[eventKey] = []
            }
            return unitSolarData._SL_solarEventHandler[eventKey]
        }
        return DataBase.getAbilityTypeSolarData(abilityIdStr, createDefault)?._SL_solarEventHandler?.[eventKey]
    }

    //Frame
    static getFrameDataEventHandler(frame: number, eventKey: string, createDefault: boolean): SolarTriggerArray {
        if (createDefault) {
            let unitSolarData = DataBase.getDataByTypeId("_SL_Frame_Event", tostring(frame));
            if (unitSolarData._SL_solarEventHandler == null) {
                unitSolarData._SL_solarEventHandler = {}
            }
            if (unitSolarData._SL_solarEventHandler[eventKey] == null) {
                unitSolarData._SL_solarEventHandler[eventKey] = []
            }
            return unitSolarData._SL_solarEventHandler[eventKey]
        }
        return DataBase.getDataByTypeId("_SL_Frame_Event", tostring(frame))?._SL_solarEventHandler?.[eventKey]
    }

}
/**
 * se : SolarEvent (太阳事件总线)
 */
declare global {
    let se: SolarEvent;
}