import ActorUtil from "@/ActorUtil";
import Actor from "@/Actor";
import SolarDamageState from "@/SolarDamageState";
import SolarActorUnitState from "@/SolarActorUnitState";
import SolarActorItemState from "@/SolarActorItemState";
import SolarActorAbilityState from "@/SolarActorAbilityState";
import SolarActorBuffState from "@/SolarActorBuffState";
import SolarActorAttributeState from "@/SolarActorAttributeState";
import SolarActorFrameState from "@/SolarActorFrameState";
import SingletonUtil from "@/SingletonUtil";
import BaseUtil from "@/BaseUtil";
import MessageUtil from "@/MessageUtil";
import SyncUtil from "@/SyncUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import InputUtil from "@/InputUtil";

export default class SolarActorState {


    constructor() {
        if (SingletonUtil.notFirstTime(SolarActorState)) {
            print("不能重复new SolarActorState()")
            return;
        }
        //启动基础的演员事件
        this.initActor()
        this.initActorSolarDamage()
        //启动基础扩展演员事件
        new SolarActorUnitState()
        new SolarActorItemState()
        new SolarActorAbilityState()
        new SolarActorBuffState()
        new SolarActorAttributeState()
        new SolarActorFrameState()
        //演员携带的属性加成
        if (isEmbedJapi) {
            BaseUtil.runLater(2.3, () => {
                //延迟添加hook 以免被作者直接设置hook 给顶掉
                MessageUtil._sl_init_message_hook()
            })
        } else {
            //非内置环境 模拟左键点击事件发布
            if (isEmbedJapi == false) {
                InputUtil.onMouseLeftButtonReleased(() => {
                    if (SolarActorFrameState.mouseFocusActor) {
                        if (SolarActorFrameState.mouseFocusActor.isDisable() ||
                            SolarActorFrameState.mouseFocusActor.isHide()) {
                            return;
                        }
                        SolarActorFrameState.mouseFocusActor.localClick(1, 0, 0);
                    }
                });
            }
        }
    }


    initActor() {
        se.onUnitAttacked(e => {
            //演员 单位 物品 技能 等
            let actorList = ActorUtil.getUnitAllActorList(e.trigUnit);
            if (actorList != null && actorList.length > 0) {
                let uArg = GetAttacker();
                for (let actor of actorList) {
                    actor.get("onUnitAttacked")?.(actor, uArg);
                }
            }
        });
        //死亡事件
        se.onUnitDeath(e => {
            //演员 单位 物品 技能 等
            let actorList = ActorUtil.getUnitAllActorList(e.trigUnit);
            let killingUnit = e.killingUnit;
            if (actorList != null && actorList.length > 0) {
                for (let actor of actorList) {
                    actor.get("onUnitDeath")?.(actor, killingUnit);
                }
            }
            //是否有凶手单位
            if (IsHandle(killingUnit)) {
                //演员 单位 物品 技能 等
                let actorList = ActorUtil.getUnitAllActorList(killingUnit);
                if (actorList != null && actorList.length > 0) {
                    let uArg = e.trigUnit;
                    for (let actor of actorList) {
                        actor.get("onUnitKillEnemy")?.(actor, uArg);
                    }
                }
            }
        })
        //升级事件
        se.onHeroLevelUp(e => {
            //演员 单位 物品 技能 等
            let actorList = ActorUtil.getUnitAllActorList(e.trigUnit);
            if (actorList != null && actorList.length > 0) {
                for (let actor of actorList) {
                    actor.get("onUnitLevelChange")?.(actor, 1);
                }
            }
        })
        //发动技能效果
        se.onUnitSpellEffect(e => {
            //演员 单位 物品 技能 等
            let actorList = ActorUtil.getUnitAllActorList(e.trigUnit);
            if (actorList != null && actorList.length > 0) {
                let idStr = e.spellAbilityIdStr;
                for (let actor of actorList) {
                    actor.get("onUnitSpell")?.(actor, idStr);
                }
            }
        })
        //发动技能效果
        se.onUnitPickupItem(e => {
            //演员 单位 物品 技能 等
            let actorList = ActorUtil.getUnitAllActorList(e.trigUnit);
            if (actorList != null && actorList.length > 0) {
                let item = e.manipulatedItem;
                for (let actor of actorList) {
                    actor.get("onUnitPickupItem")?.(actor, item);
                }
            }
        })
        //单位获得演员 onUnitAddActor
        se.on("_sl_:单位获得演员", (data: { u: unit, a: Actor }) => {
            //演员 单位 物品 技能 等
            let actorList = ActorUtil.getUnitAllActorList(data.u);
            if (actorList != null && actorList.length > 0) {
                for (let actor of actorList) {
                    if (actor != data.a) {
                        actor.get("onUnitAddActor")?.(actor, data.a);
                        actor.get("onUnitActorsChange")?.(actor, false, data.a);
                    }
                }
            }
        })
        //单位获得演员 onUnitRemoveActor
        se.on("_sl_:单位失去演员", (data: { u: unit, a: Actor }) => {
            //演员 单位 物品 技能 等
            let actorList = ActorUtil.getUnitAllActorList(data.u);
            if (actorList != null && actorList.length > 0) {
                for (let actor of actorList) {
                    if (actor != data.a) {
                        actor.get("onUnitRemoveActor")?.(actor, data.a);
                        actor.get("onUnitActorsChange")?.(actor, true, data.a);
                    }
                }
            }
        });
        //
        SyncUtil.onSyncObjData("_sl_:a:onClick", (triggerPlayer, data) => {
            let actor = Actor.allActors[data.i as string];
            if (actor == null) {
                log.errorWithTraceBack("本地点击的id未找到对应的演员!")
                return
            }
            actor.get("onClick")?.(actor, data.b as number, triggerPlayer, actor.actorType);
        });
        SyncUtil.onSyncObjData("_sl_:at:onClick", (triggerPlayer, data) => {
            let actorType = ActorTypeUtil.getActorType(data.i);
            if (actorType == null) {
                log.errorWithTraceBack("本地点击的id未找到对应的演员类型!")
                return
            }
            actorType.onClick?.(null, data.b as number, triggerPlayer, actorType);
        });

    }


    /**
     * 初始化演员 太阳伤害系统 事件
     */
    initActorSolarDamage() {
        SolarDamageState.addEventHandler(event => {
            //演员 单位 物品 技能 等
            let unit0 = event.unit0;
            let unit1 = event.unit1;
            let actorList = ActorUtil.getUnitAllActorList(unit0);
            if (actorList != null && actorList.length > 0) {
                //受到伤害
                for (let actor of actorList) {
                    actor.get("onUnitDamaged")?.(actor, unit1, event);
                }
                //受到攻击伤害
                if (event.isAttack) {
                    for (let actor of actorList) {
                        actor.get("onUnitAttackedDamage")?.(actor, unit1, event);
                    }
                }
            }
            //当单位伤害敌人时 事件
            if (IsHandle(unit1)) {
                actorList = ActorUtil.getUnitAllActorList(unit1);
                if (actorList != null && actorList.length > 0) {
                    for (let actor of actorList) {
                        actor.get("onUnitDamageEnemy")?.(actor, unit0, event);
                    }
                    if (event.isAttack) {
                        for (let actor of actorList) {
                            actor.get("onUnitAttackDamageEnemy")?.(actor, unit0, event);
                        }
                    }
                }
            }
        })

    }


}