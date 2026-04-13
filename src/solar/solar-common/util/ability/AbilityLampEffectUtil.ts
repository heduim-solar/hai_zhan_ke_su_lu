import LangUtil from "@/LangUtil";
import ObjectDataUtil from "@/ObjectDataUtil";
import AsyncUtil from "@/AsyncUtil";
import AbilityUtil from "@/AbilityUtil";
import Cache from "@/Cache";
import SelectUtil from "@/SelectUtil";
import {Frame} from "@/frame";
import AbilityButtonUtil from "@/AbilityButtonUtil";
import AbilityIconUtil from "@/AbilityIconUtil";
import FrameCallbackUtil from "@/FrameCallbackUtil";
import InputUtil from "@/InputUtil";
import BaseUtil from "@/BaseUtil";

/**
 * 修改过原始技能按钮大小位置的 可以手动修改AbilityButtonUtil.btnUIWidth 等变量来适配转圈大小位置
 */
export default class AbilityLampEffectUtil {


    /** 转圈 跑马灯效果 做点击提示用 */
    static lampEffect = "UI\\Feedback\\Autocast\\UI-ModalButtonOn.mdl"


    private static cache: Cache = new Cache();

    /**
     * 添加跑马灯转圈特效 以提示点击
     * @param abilityId
     * @param unit
     */
    private static _sl_unitObjIdLampEffectInfo: {
        [uhid: number]: string[]
    } = {}
    private static _sl_lampEffectFrames: {
        [btnXYId: string]: number
    } = {}


    /**
     * 为玩家下的所有单位此时拥有此技能的 单位 添加按钮跑马灯转圈特效
     * @param player
     * @param abilityId
     */
    static addAbilityLampEffectForPlayer(abilityId: string | number, player: player) {
        let playerUnits = SelectUtil.getPlayerUnits(GetPlayerId(player));
        for (let playerUnit of playerUnits) {
            if (GetUnitAbilityLevel(playerUnit, abilityId) > 0) {
                AbilityLampEffectUtil.addUnitObjIdLampEffect(abilityId, playerUnit);
            }
        }
    }

    /**
     * 为玩家下的所有单位此时拥有此技能的 单位 移除按钮跑马灯转圈特效
     * @param player
     * @param abilityId
     */
    static removeAbilityLampEffectForPlayer(abilityId: string | number, player: player) {
        let playerUnits = SelectUtil.getPlayerUnits(GetPlayerId(player));
        for (let playerUnit of playerUnits) {
            if (GetUnitAbilityLevel(playerUnit, abilityId) > 0) {
                AbilityLampEffectUtil.removeUnitObjIdLampEffect(abilityId, playerUnit);
            }
        }
    }

    /**
     * 为一个单位添加按钮跑马灯转圈特效
     * @param unit
     * @param abilityIdOrUnitId 技能id 或单位id
     */
    static addUnitObjIdLampEffect(abilityIdOrUnitId: string | number, unit: unit) {
        AbilityLampEffectUtil._sl_init_lampEffect_system()
        let abilityIdStrs = AbilityLampEffectUtil._sl_unitObjIdLampEffectInfo[GetHandleId(unit)];
        if (abilityIdStrs == null) {
            abilityIdStrs = []
            AbilityLampEffectUtil._sl_unitObjIdLampEffectInfo[GetHandleId(unit)] = abilityIdStrs
        }
        abilityIdStrs.push(LangUtil.getStringId(abilityIdOrUnitId))
        //
        if (GetLocalPlayer() == GetOwningPlayer(unit)) {
            AbilityLampEffectUtil.refreshUnitAbilityLampEffect(selection())
        }
    }

    /**
     * 为一个单位移除技能按钮跑马灯转圈特效
     * @param unit
     * @param abilityIdOrUnitId
     */
    static removeUnitObjIdLampEffect(abilityIdOrUnitId: string | number, unit: unit) {
        AbilityLampEffectUtil._sl_init_lampEffect_system()
        let abilityIdStrs = AbilityLampEffectUtil._sl_unitObjIdLampEffectInfo[GetHandleId(unit)];
        if (abilityIdStrs == null) {
            return
        }
        let index = abilityIdStrs.indexOf(LangUtil.getStringId(abilityIdOrUnitId));
        abilityIdStrs.splice(index, 1)
        AbilityLampEffectUtil._sl_unitObjIdLampEffectInfo[GetHandleId(unit)] = abilityIdStrs
        if (GetLocalPlayer() == GetOwningPlayer(unit)) {
            AbilityLampEffectUtil.refreshUnitAbilityLampEffect(selection())
        }
    }

    private static _sl_isInitialized = false

    private static _sl_init_lampEffect_system() {
        if (AbilityLampEffectUtil._sl_isInitialized) {
            return;
        }
        if (isAsync) {
            log.errorWithTraceBack("不能异步初始化")
        }
        se.onUnitSelected(e => {
            let selectUnit = e.trigUnit;
            if (GetLocalPlayer() == GetTriggerPlayer()) {
                AbilityLampEffectUtil.refreshUnitAbilityLampEffect(selectUnit)
            }
        });
        InputUtil.onMouseLeftButtonReleased(() => {
            BaseUtil.runLater(0.05, () => {
                AbilityLampEffectUtil.refreshUnitAbilityLampEffect(selection())
            })
        })
        AbilityLampEffectUtil._sl_isInitialized = true;
    }

    static refreshUnitAbilityLampEffect(selectUnit: unit) {
        //隐藏全部
        for (let key in AbilityLampEffectUtil._sl_lampEffectFrames) {
            let frame = AbilityLampEffectUtil._sl_lampEffectFrames[key]
            DzFrameShow(frame, false)
        }
        if (GetLocalPlayer() != GetOwningPlayer(selectUnit)) {
            return
        }
        let objIds = AbilityLampEffectUtil._sl_unitObjIdLampEffectInfo[GetHandleId(selectUnit)];
        if (objIds == null || objIds.length == 0) {
            return;
        }
        for (let x = 0; x < 4; x++) {
            for (let y = 0; y < 3; y++) {
                let [button_abilityId, orderID, orderType] = button(x, y);
                if (button_abilityId == null) {
                    continue
                }
                let show = false;
                if (orderType == 8 && AbilityUtil.isBookUi()) {//建造单位面板
                    if (objIds.includes(id2string(orderID))) {
                        show = true;
                    } else {
                        continue
                    }
                } else if (objIds.includes(id2string(button_abilityId))) {
                    show = true;
                } else {
                    continue
                }
                //
                let btnXYId = x + "_" + y
                let frame = AbilityLampEffectUtil._sl_lampEffectFrames[btnXYId];
                if (frame == null) {
                    frame = DzCreateFrameByTagName("SPRITE", "refreshUnitAbilityLampEffect_" + AsyncUtil.getUUIDAsync(), DzGetGameUI(), "", 0);
                    DzFrameSetModel(frame, AbilityLampEffectUtil.lampEffect, 0, 0);
                    DzFrameSetSize(frame, AbilityButtonUtil.btnUIWidth, AbilityButtonUtil.btnUIHeight)
                    let uiPos = AbilityButtonUtil.getUIXYByPos(x, y);
                    DzFrameSetAbsolutePoint(frame, 8, uiPos.x, uiPos.y)
                    AbilityLampEffectUtil._sl_lampEffectFrames[btnXYId] = frame;
                }
                DzFrameShow(frame, show)
            }
        }


    }

}