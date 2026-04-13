import FrameCallbackUtil from "@/FrameCallbackUtil";
import ActorItemUtil from "@/ActorItemUtil";
import AbilityButtonUtil from "@/AbilityButtonUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";
import {Frame} from "@/frame";
import ActorUnit from "@/ActorUnit";
import CameraUtil from "@/CameraUtil";
import FramePoint from "@/FramePoint";
import SingletonUtil from "@/SingletonUtil";
import GameUtil from "@/GameUtil";
import ActorFrameUtil from "@/ActorFrameUtil";
import FrameControl from "@/FrameControl";
import InputUtil from "@/InputUtil";
import Actor from "@/Actor";

export default class SolarActorFrameState {

    static mouseFocusActor: Actor = null;
    private static _sl_mouseFocusItemIndex: number = -1;
    static commandBarButtonActorFrames: { [i: number]: FrameControl } = {};
    static itemBarButtonActorFrames: { [i: number]: FrameControl } = {};


    constructor() {
        if (SingletonUtil.notFirstTime(SolarActorFrameState)) {
            print("不能重复new SolarActorFrameState()")
            return;
        }
        if (DzFrameGetCommandBarButton == null) {
            return
        }
        FrameCallbackUtil.addFrameSetUpdateCallback(() => {
            SolarActorFrameState.updateItemFrame();
            SolarActorFrameState.updateAbilityFrame();
            SolarActorFrameState.updateUnitFrame();
        });
        //模拟右键事件  左键在message.hook里 那里可以拦截。右键点击是模拟的 不能拦截
        InputUtil.onMouseRightButtonReleased(() => {
            if (SolarActorFrameState.mouseFocusActor) {
                if (SolarActorFrameState.mouseFocusActor.isDisable() ||
                    SolarActorFrameState.mouseFocusActor.isHide()) {
                    return;
                }
                SolarActorFrameState.mouseFocusActor.localClick(2, 0, 0);
            }
        });


        /**
         * 技能移入移出
         */
        for (let x = 0; x <= 3; x++) {
            for (let y = 0; y <= 2; y++) {
                let cmdButton = DzFrameGetCommandBarButton(y, x);
                let cmdButtonFrame = Frame.fromHandle(cmdButton);
                const fx = x;
                const fy = y;
                cmdButtonFrame.addOnMouseEnter(() => {
                    SolarActorFrameState.showAbilityTooltip(fx, fy);
                })
                cmdButtonFrame.addOnMouseLeave(SolarActorFrameState.hideTooltip)
            }
        }
        /**
         * 物品移入移出
         */
        for (let i = 0; i < 6; i++) {
            let cmdButton = DzFrameGetItemBarButton(i);
            let cmdButtonFrame = Frame.fromHandle(cmdButton);
            const fi = i;
            cmdButtonFrame.addOnMouseEnter(() => {
                SolarActorFrameState.showItemTooltip(fi)
            })
            cmdButtonFrame.addOnMouseLeave(SolarActorFrameState.hideTooltip)
        }

        se.onUnitSelected(e => {
            if (SolarActorFrameState._sl_mouseFocusItemIndex >= 0) {
                SolarActorFrameState.showItemTooltip(SolarActorFrameState._sl_mouseFocusItemIndex)
            }
        });
        se.on("刷新UI", () => {
            if (SolarActorFrameState._sl_mouseFocusItemIndex >= 0) {
                SolarActorFrameState.showItemTooltip(SolarActorFrameState._sl_mouseFocusItemIndex)
            } else if (SolarActorFrameState.mouseFocusActor != null) {
                ActorFrameUtil.showTooltip(SolarActorFrameState.mouseFocusActor);
            }
        });

    }

    static showItemTooltip(this: void, i: number) {
        let u = selection();
        if (!IsHandle(u)) {
            return
        }
        SolarActorFrameState._sl_mouseFocusItemIndex = i;
        let item = UnitItemInSlot(u, i);
        let actorItem = ActorItemUtil.getActorItem(item);
        if (actorItem != null) {
            ActorFrameUtil.showTooltip(actorItem);
        }
    }

    static showAbilityTooltip(this: void, x: number, y: number) {
        let [ability, order] = button(x, y);
        if (ability == null || ability == 0) {
            return
        }
        let abilityIdStr = id2string(ability);
        let actorAbility = ActorAbilityUtil.getActorAbility(abilityIdStr);
        if (actorAbility == null) {
            return;
        }
        SolarActorFrameState._sl_mouseFocusItemIndex = -1;
        SolarActorFrameState.mouseFocusActor = actorAbility;
        ActorFrameUtil.showTooltip(actorAbility);
    }

    static hideTooltip(this: void) {
        ActorFrameUtil.hideTooltip();
        SolarActorFrameState.mouseFocusActor = null;
        SolarActorFrameState._sl_mouseFocusItemIndex = -1;
    }


    static updateItemFrame() {
        //物品栏
        let unit = selection();
        for (let i = 0; i < 6; i++) {
            let item = UnitItemInSlot(unit, i);
            let actorItem = ActorItemUtil.getActorItem(item);
            if (actorItem == null) {
                if (SolarActorFrameState.itemBarButtonActorFrames[i]) {
                    SolarActorFrameState.itemBarButtonActorFrames[i].rootFrame.visible = false;
                    SolarActorFrameState.itemBarButtonActorFrames[i] = null;
                }
            } else {
                let buttonFrame = DzFrameGetItemBarButton(i);
                //
                let frame = actorItem.getRootFrameControl(false);
                if (frame != SolarActorFrameState.itemBarButtonActorFrames[i]) {
                    if (SolarActorFrameState.itemBarButtonActorFrames[i]) {
                        SolarActorFrameState.itemBarButtonActorFrames[i].rootFrame.visible = false;
                        SolarActorFrameState.itemBarButtonActorFrames[i] = null;
                    }
                    if (frame) {
                        frame.rootFrame.clearPoints();
                        frame.rootFrame.setAllPoints(buttonFrame);
                        frame.rootFrame.visible = true;
                    }
                    SolarActorFrameState.itemBarButtonActorFrames[i] = frame
                }
            }
        }

    }

    static updateAbilityFrame() {
        //技能
        for (let i = 1; i <= 12; i++) {
            let pos = AbilityButtonUtil.getPosByNumber(i);
            let [button_abilityId, orderID, orderType] = button(pos.x, pos.y);
            if (button_abilityId == null || button_abilityId == 0) {
                if (SolarActorFrameState.commandBarButtonActorFrames[i]) {
                    SolarActorFrameState.commandBarButtonActorFrames[i].rootFrame.visible = false;
                    SolarActorFrameState.commandBarButtonActorFrames[i] = null;
                }
                continue
            }
            let actorAbility = ActorAbilityUtil.getActorAbility(id2string(button_abilityId));
            if (actorAbility == null) {
                if (SolarActorFrameState.commandBarButtonActorFrames[i]) {
                    SolarActorFrameState.commandBarButtonActorFrames[i].rootFrame.visible = false;
                    SolarActorFrameState.commandBarButtonActorFrames[i] = null;
                }
            } else {
                let buttonFrame = DzFrameGetCommandBarButton(pos.y, pos.x);
                //
                let frame = actorAbility.getRootFrameControl(false);
                if (frame != SolarActorFrameState.commandBarButtonActorFrames[i]) {
                    if (SolarActorFrameState.commandBarButtonActorFrames[i]) {
                        SolarActorFrameState.commandBarButtonActorFrames[i].rootFrame.visible = false;
                        SolarActorFrameState.commandBarButtonActorFrames[i] = null;
                    }
                    if (frame) {
                        frame.rootFrame.clearPoints();
                        frame.rootFrame.setAllPoints(buttonFrame);
                        frame.rootFrame.visible = true;
                    }
                    SolarActorFrameState.commandBarButtonActorFrames[i] = frame
                }
            }
        }
    }


    static updateUnitFrame() {
        //头上血条 或ui图标
        for (let actorUuid in ActorUnit._sl_hasFrameActorUnits) {
            let actorUnit = ActorUnit._sl_hasFrameActorUnits[actorUuid];
            if (actorUnit == null || actorUnit.isDestroyed()) {
                continue;
            }
            let rootFrame = actorUnit.getRootFrameControl(false);
            if (rootFrame == null) {
                return;
            }
            if (!UnitAlive(actorUnit.unit)) {
                rootFrame.rootFrame.visible = false;
                continue
            }
            let x = actorUnit.unitX;
            let y = actorUnit.unitY
            let z = GameUtil.getTerrainHeight(x, y);
            if (unit_overhead) {
                z = z + unit_overhead(actorUnit.unit) - 50;
            } else {
                z = z + 150;
            }

            let scoordinates = CameraUtil.getScreenCoordinates(x, y, z);
            if (scoordinates.x <= 0 || scoordinates.x >= 0.8) {
                rootFrame.rootFrame.visible = false;
                continue
            }
            if (scoordinates.y <= 0.13 || scoordinates.y >= 0.56) {
                rootFrame.rootFrame.visible = false;
                continue
            }
            rootFrame.rootFrame.setAbsPoint(FramePoint.bottom, scoordinates.x, scoordinates.y);
            rootFrame.rootFrame.visible = true;
        }

    }


}