/** @noSelfInFile **/

import {Dialog, DialogButton} from "./dialog";
import {Handle} from "./handle";
import {MapPlayer} from "./player";
import {Unit} from "./unit";
import {Widget} from "./widget";
import TriggerUtil from "@/util/system/TriggerUtil";


export class Trigger extends Handle<trigger> {

    constructor() {
        if (Handle.initFromHandle()) {
            super();
        } else {
            super(CreateTrigger());
        }
    }

    public set enabled(flag: boolean) {
        if (flag) {
            EnableTrigger(this.handle);
        } else {
            DisableTrigger(this.handle);
        }
    }

    /**
     * 触发器是否打开
     */
    public get enabled() {
        return IsTriggerEnabled(this.handle);
    }

    public get evalCount() {
        return GetTriggerEvalCount(this.handle);
    }

    public static get eventId() {
        return GetTriggerEventId();
    }

    public get execCount() {
        return GetTriggerExecCount(this.handle);
    }

    public set waitOnSleeps(flag: boolean) {
        TriggerWaitOnSleeps(this.handle, flag);
    }

    public get waitOnSleeps() {
        return IsTriggerWaitOnSleeps(this.handle);
    }

    /**
     * 添加触发器动作
     */
    public addAction(actionFunc: () => void) {
        return TriggerAddAction(this.handle, actionFunc);
    }

    /**
     * Adds a new condition to the trigger.
     *
     * Adding more conditions later wil join them by AND (that means all conditions need to evaluate to `true`)
     *
     * @example
     * ```ts
     * const trg = new Trigger()
     * // trigger fires if a unit is attacked
     * trg.registerAnyUnitEvent(EVENT_PLAYER_UNIT_ATTACKED)
     * // but only if the unit name matches
     * trg.addCondition(Condition(() => Unit.fromHandle(GetAttacker()).name === 'Attacker Unit'))
     * trg.addAction(() => {
     *  //do something...
     * })
     * ```
     * @param condition the condition to add
     */


    /**
     * 添加触发器限制条件
     * @deprecated
     */
    public addCondition(condition: boolexpr) {
        return TriggerAddCondition(this.handle, condition);
    }

    /**
     * 删除触发器 [R]
     */
    public destroy() {
        DestroyTrigger(this.handle);
    }

    /**
     * 触发器条件成立
     */
    public eval() {
        return TriggerEvaluate(this.handle);
    }

    /**
     * 运行触发器 (忽略条件)
     */
    public exec() {
        return TriggerExecute(this.handle);
    }

    /**
     *任意单位伤害事件
     */
    public registerAnyUnitDamagedEvent() {
        TriggerUtil.SystemAnyUnitDamagedRegistTrigger(this.handle)
    }

    /**
     *任意单位死亡事件
     */
    public registerAnyUnitDeathEvent() {
        this.registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH)
    }


    /**
     * 任意玩家单位事件
     */
    public registerAnyUnitEvent(whichPlayerUnitEvent: playerunitevent) {
        // return TriggerRegisterAnyUnitEventBJ(this.handle, whichPlayerUnitEvent);
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            TriggerRegisterPlayerUnitEvent(this.handle, Player(i), whichPlayerUnitEvent, null)
        }
    }

    // public registerCommandEvent(whichAbility: number, order: string) {
    //   return TriggerRegisterCommandEvent(this.handle, whichAbility, order);
    // }

    /**
     * 可毁坏物死亡
     */
    public registerDeathEvent(whichWidget: Widget) {
        return TriggerRegisterDeathEvent(this.handle, whichWidget.handle);
    }

    /**
     * 对话框按钮被点击 [R]
     */
    public registerDialogButtonEvent(whichButton: DialogButton) {
        return TriggerRegisterDialogButtonEvent(this.handle, whichButton.handle);
    }

    /**
     * 对话框事件
     */
    public registerDialogEvent(whichDialog: Dialog) {
        return TriggerRegisterDialogEvent(this.handle, whichDialog.handle);
    }

    /**
     * 单位进入区域[R]
     */
    public registerEnterRect(whichRect: rect) {
        let rectRegion: region = CreateRegion()
        RegionAddRect(rectRegion, whichRect)
        return TriggerRegisterEnterRegion(this.handle, rectRegion, null);
    }

    /**
     * 单位离开区域[R]
     */
    public registerLeaveRect(whichRect: rect) {
        let rectRegion: region = CreateRegion()
        RegionAddRect(rectRegion, whichRect)
        return TriggerRegisterLeaveRegion(this.handle, rectRegion, null);
    }

    /**
     * 单位进入不规则区域(指定条件) [R]
     */
    public registerEnterRegion(whichRegion: region, filter: boolexpr | null) {
        return TriggerRegisterEnterRegion(this.handle, whichRegion, filter);
    }


    /**
     * 特定玩家事件
     */
    public registerFilterUnitEvent(whichUnit: unit, whichEvent: unitevent, filter: boolexpr | null) {
        return TriggerRegisterFilterUnitEvent(this.handle, whichUnit, whichEvent, filter);
    }

    /**
     * 比赛游戏事件
     */
    public registerGameEvent(whichGameEvent: gameevent) {
        return TriggerRegisterGameEvent(this.handle, whichGameEvent);
    }

    /**
     * 游戏状态事件
     */
    public registerGameStateEvent(whichState: gamestate, opcode: limitop, limitval: number) {
        return TriggerRegisterGameStateEvent(this.handle, whichState, opcode, limitval);
    }

    /**
     * 单位离开不规则区域(指定条件) [R]
     */
    public registerLeaveRegion(whichRegion: region, filter: boolexpr | null) {
        return TriggerRegisterLeaveRegion(this.handle, whichRegion, filter);
    }

    /**
     * 联盟状态改变(特殊)
     */
    public registerPlayerAllianceChange(whichPlayer: MapPlayer, whichAlliance: alliancetype) {
        return TriggerRegisterPlayerAllianceChange(this.handle, whichPlayer.handle, whichAlliance);
    }

    /**
     * 玩家输入聊天信息
     */
    public registerPlayerChatEvent(whichPlayer: MapPlayer, chatMessageToDetect: string, exactMatchOnly: boolean) {
        return TriggerRegisterPlayerChatEvent(this.handle, whichPlayer.handle, chatMessageToDetect, exactMatchOnly);
    }

    /**
     * 任意玩家输入聊天信息
     */
    public registerAnyPlayerChatEvent(chatMessageToDetect: string, exactMatchOnly: boolean) {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            TriggerRegisterPlayerChatEvent(this.handle, Player(i), chatMessageToDetect, exactMatchOnly);
        }
    }

    /**
     * 玩家事件
     */
    public registerPlayerEvent(whichPlayer: MapPlayer, whichPlayerEvent: playerevent) {
        return TriggerRegisterPlayerEvent(this.handle, whichPlayer.handle, whichPlayerEvent);
    }

    /**
     * 任意玩家事件
     */
    public registerAnyPlayerEvent(whichPlayerEvent: playerevent) {
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            TriggerRegisterPlayerEvent(this.handle, Player(i), whichPlayerEvent);
        }
    }

    // public registerPlayerKeyEvent(whichPlayer: MapPlayer, whichKey: oskeytype, metaKey: number, fireOnKeyDown: boolean) {
    //   return BlzTriggerRegisterPlayerKeyEvent(this.handle, whichPlayer.handle, whichKey, metaKey, fireOnKeyDown);
    // }

    // public registerPlayerMouseEvent(whichPlayer: MapPlayer, whichMouseEvent: number) {
    //   return TriggerRegisterPlayerMouseEventBJ(this.handle, whichPlayer.handle, whichMouseEvent);
    // }

    /**
     * 属性
     */
    public registerPlayerStateEvent(whichPlayer: MapPlayer, whichState: playerstate, opcode: limitop, limitval: number) {
        return TriggerRegisterPlayerStateEvent(this.handle, whichPlayer.handle, whichState, opcode, limitval);
    }

    // public registerPlayerSyncEvent(whichPlayer: MapPlayer, prefix: string, fromServer: boolean) {
    //   return BlzTriggerRegisterPlayerSyncEvent(this.handle, whichPlayer.handle, prefix, fromServer);
    // }

    /**
     * 玩家单位事件
     */
    public registerPlayerUnitEvent(whichPlayer: MapPlayer, whichPlayerUnitEvent: playerunitevent, filter: boolexpr | null) {
        return TriggerRegisterPlayerUnitEvent(this.handle, whichPlayer.handle, whichPlayerUnitEvent, filter);
    }

    // Creates it's own timer and triggers when it expires

    /**
     * 注册计时器事件
     */
    public registerTimerEvent(timeout: number, periodic: boolean) {
        return TriggerRegisterTimerEvent(this.handle, timeout, periodic);
    }

    // Triggers when the timer you tell it about expires

    /**
     *  计时器到期事件
     */
    public registerTimerExpireEvent(t: timer) {
        return TriggerRegisterTimerExpireEvent(this.handle, t);
    }

    /**
     * 鼠标点击可追踪物 [R]
     */
    public registerTrackableHitEvent(whichTrackable: trackable) {
        return TriggerRegisterTrackableHitEvent(this.handle, whichTrackable);
    }

    /**
     * 鼠标移动到追踪对象 [R]
     */
    public registerTrackableTrackEvent(whichTrackable: trackable) {
        return TriggerRegisterTrackableTrackEvent(this.handle, whichTrackable);
    }

    /**
     * 详细单位的事件
     */
    public registerUnitEvent(whichUnit: Unit, whichEvent: unitevent) {
        return TriggerRegisterUnitEvent(this.handle, whichUnit.handle, whichEvent);
    }

    /**
     * 范围内玩家事件
     */
    public registerUnitInRage(whichUnit: unit, range: number, filter: boolexpr | null) {
        return TriggerRegisterUnitInRange(this.handle, whichUnit, range, filter);
    }

    /**
     * 单位状态事件
     */
    public registerUnitStateEvent(whichUnit: Unit, whichState: unitstate, opcode: limitop, limitval: number) {
        return TriggerRegisterUnitStateEvent(this.handle, whichUnit.handle, whichState, opcode, limitval);
    }

    // public registerUpgradeCommandEvent(whichUpgrade: number) {
    //   return TriggerRegisterUpgradeCommandEvent(this.handle, whichUpgrade);
    // }

    /**
     *  变量的值
     */
    public registerVariableEvent(varName: string, opcode: limitop, limitval: number) {
        return TriggerRegisterVariableEvent(this.handle, varName, opcode, limitval);
    }

    /**
     * 移除触发器动作
     */
    public removeAction(whichAction: triggeraction) {
        return TriggerRemoveAction(this.handle, whichAction);
    }

    /**
     * 清空触发器动作
     */
    public removeActions() {
        return TriggerClearActions(this.handle);
    }

    /**
     * 移除触发器限制条件
     */
    public removeCondition(whichCondition: triggercondition) {
        return TriggerRemoveCondition(this.handle, whichCondition);
    }

    /**
     * 清空触发器限制条件
     */
    public removeConditions() {
        return TriggerClearConditions(this.handle);
    }

    /**
     * 重置触发
     */
    public reset() {
        ResetTrigger(this.handle);
    }

    // public triggerRegisterFrameEvent(frame: Frame, eventId: frameeventtype) {
    //   return BlzTriggerRegisterFrameEvent(this.handle, frame.handle, eventId);
    // }

    /**
     *
     */
    public static fromEvent() {
        return this.fromHandle(GetTriggeringTrigger());
    }

    /**
     *
     */
    public static fromHandle(handle: trigger): Trigger {
        return this.getObject(handle);
    }

}
