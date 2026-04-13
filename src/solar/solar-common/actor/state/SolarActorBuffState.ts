/**
 * 太阳Buff系统 调度中心
 *
 */
import {Trigger} from "@/w3ts/handles/trigger";
import ObjectPool from "@/ObjectPool";
import {Frame} from "@/w3ts/handles/frame";
import SelectUtil from "@/util/unit/SelectUtil";
import ColorStr from "@/ColorStr";
import SingletonUtil from "@/SingletonUtil";
import ActorBuff from "@/ActorBuff";
import SolarBuffState from "@/SolarBuffState";
import BuffUtil from "@/BuffUtil";
import Buff from "@/Buff";
import ActorBuffUtil from "@/ActorBuffUtil";
import AttributeUtil from "@/AttributeUtil";
import BaseUtil from "@/BaseUtil";


export default class SolarActorBuffState {
    static config: {
        showSolarActorBuffUI //显示太阳buff UI
    } = {
        showSolarActorBuffUI: true
    }

    /**
     * 模拟buff的 ui显示
     */
    static objectPool = new ObjectPool<Frame[]>(() => {
        let frame = Frame.createBUTTON();
        let backgroundImage = frame.addBackgroundImage("");
        frame.setOnMouseEnter(SolarActorBuffState.showUbertip)
        frame.setOnMouseLeave(SolarActorBuffState.hideUbertip)
        frame.setSize(0.015, 0.015)
        return [frame, backgroundImage];
    });
    static frameBuffMap: { [frameId: string]: ActorBuff } = {}
    static ubertipFrameBD: Frame = null;
    static ubertipFrameText: Frame = null;

    constructor() {
        if (SingletonUtil.notFirstTime(SolarActorBuffState)) {
            print("不能重复new SolarActorBuffState()")
            return;
        }

        //冲突检测
        if (SingletonUtil.notFirstTime(SolarBuffState)) {
            print("演员buff系统不能与旧buff系统同时使用!")
            return;
        }
        BuffUtil.registerBuffType = (buffType: AppBuffType) => {
            log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
            return null;
        }
        BuffUtil.getBuffType = (buffTypeId: string) => {
            log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
            return null;
        }
        BuffUtil.forAllBuffTypes = (callback: (buffType: AppBuffType) => void, buffTypeClass?: string) => {
            log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
            return null;
        }
        BuffUtil.addBuff = (unit: unit, buffTypeId: string, caster?: unit, initBuff?: (buff: Buff) => void) => {
            log.errorWithTraceBack("演员buff系统不能与旧buff系统同时使用！")
            return null;
        }

        //注册任意buff层数改变事件 修改对应的属性附加值
        ActorBuffUtil.addAnyActorBuffLevelChangeListener((buff, delta) => {
            if (buff.attribute == null || buff.actorType.attribute == null) {
                return
            }
            BaseUtil.runLater(0.1, () => {
                //如果没有手动指定属性的话 则自动根据等级修改属性
                if (AttributeUtil.isEquals(buff.attribute, buff.actorType.attribute)) {
                    buff.attribute = AttributeUtil.multiply(buff.actorType.attribute, buff.level)
                }
            });
        });


        // buff ui显示
        if (SolarActorBuffState.config.showSolarActorBuffUI) {
            SolarActorBuffState.ubertipFrameBD = new Frame("BACKDROP", null, null, "_sl_border_backdrop", 0)
            //
            SolarActorBuffState.ubertipFrameText = Frame.createTEXT()
            SolarActorBuffState.ubertipFrameText.setAbsPoint(FRAMEPOINT_BOTTOMRIGHT, 0.78, 0.17)
            SolarActorBuffState.ubertipFrameText.setSize(0.16, 0)


            SolarActorBuffState.ubertipFrameBD.setPoints(SolarActorBuffState.ubertipFrameText.current, 0.01, 0.01);
            // SolarBuffState.ubertipFrameBD.setTexture("UI\\Glues\\BattleNet\\BattleNetTeamLevelBar\\Loading-BarBackground.blp")
            SolarActorBuffState.ubertipFrameBD.visible = false;
            SolarActorBuffState.ubertipFrameText.visible = false;

            //
            let trigger = new Trigger();
            trigger.registerTimerEvent(0.1, true);
            trigger.addAction(this.refreshSolarBuffUI)
        }

    }

    static showUbertip(this: void) {
        let frameH = DzGetTriggerUIEventFrame();
        let actorBuff = SolarActorBuffState.frameBuffMap["f" + frameH];
        if (actorBuff) {
            let buffTips = ColorStr.yellow + (actorBuff.getName() ?? "") + "|n|n";
            if (actorBuff.level && actorBuff.level != 1) {
                buffTips = buffTips + ColorStr.green + "等级: " + (actorBuff.level ?? "1") + "|n|n"
            }
            buffTips = buffTips + ColorStr.white + (actorBuff.getDescribe() ?? "")
            //超过3秒的才显示 部分光环buff可能就是3秒 然后循环添加这个buff 这种就不会显示剩余时间
            if (actorBuff.get("dur") && actorBuff.get("dur") > 3) {
                buffTips = buffTips + "|n剩余时间:" + Math.ceil(actorBuff.getRemainingTime()) + "秒"
            }

            SolarActorBuffState.ubertipFrameText.setText(buffTips)
            SolarActorBuffState.ubertipFrameBD.visible = true;
            SolarActorBuffState.ubertipFrameText.visible = true;
        }
    }

    static hideUbertip(this: void) {
        SolarActorBuffState.ubertipFrameBD.visible = false;
        SolarActorBuffState.ubertipFrameText.visible = false;
    }

    /**
     * 更新太阳buff
     */
    refreshSolarBuffUI(this: void) {
        let realSelectUnit = SelectUtil.getRealSelectUnit();
        if (!IsHandle(realSelectUnit)) {
            SolarActorBuffState.showBuffsUI(false);
            return;
        }


        let unitBuffs = ActorBuffUtil.getUnitActorBuffs(realSelectUnit);
        if (!unitBuffs) {
            SolarActorBuffState.showBuffsUI(false);
            return;
        }
        //
        let objectPool = SolarActorBuffState.objectPool;
        objectPool.setAllIdleStatus(true);//设置对象池所有 ui为 空闲可使用状态
        let index = 0;
        for (let actorTypeId in unitBuffs) {
            let actorBuff = unitBuffs[actorTypeId];
            let uiShowType = actorBuff.get("uiShowType");
            if (uiShowType != null && uiShowType != "单位状态栏") {
                continue
            } else if (actorBuff.get("class") && actorBuff.get("class") != "基础" &&
                actorBuff.get("class") != "演员buff" &&
                actorBuff.get("class") != "羁绊" &&
                uiShowType != "单位状态栏") {
                continue;//不是基础类型的其他类型则不在这里显示
            }
            let frames = objectPool.borrowObject();
            let frame = frames[0];
            frame.visible = true
            frames[1].setTexture(actorBuff.get("icon", "ReplaceableTextures\\CommandButtons\\BTNTemp.blp"))
            frame.setAbsPoint(FRAMEPOINT_BOTTOMLEFT, 0.37 + (index * 0.016), 0.007)
            //绑定ui跟 actorBuff
            SolarActorBuffState.frameBuffMap["f" + frame.current] = actorBuff;
            index++;
        }

        objectPool.forDirtyObjects(frames => {
            frames[0].visible = false;
        })


    }

    /**
     * UI显示
     */
    static showBuffsUI(show: boolean) {
        SolarActorBuffState.objectPool.forActiveObjects(frames => {
            frames[0].visible = show;
        });
    }


}