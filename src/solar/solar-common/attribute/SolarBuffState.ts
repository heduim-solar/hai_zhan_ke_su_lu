/**
 * 太阳Buff系统 调度中心
 *
 */
import {Trigger} from "@/w3ts/handles/trigger";
import BuffUtil from "@/util/system/BuffUtil";
import ObjectPool from "../tool/ObjectPool";
import {Frame} from "@/w3ts/handles/frame";
import SelectUtil from "@/util/unit/SelectUtil";
import Buff from "../tool/Buff";
import ColorStr from "../constant/ColorStr";
import DataBase from "../common/DataBase";
import AttributeUtil from "@/util/system/AttributeUtil";
import UnitAttributeState from "./UnitAttributeState";
import SingletonUtil from "../util/lang/SingletonUtil";
import UnitStateUtil from "@/UnitStateUtil";


/**
 * 注意 此旧buff系统不能与 演员buff系统同时使用 只能选择一个。并且此旧buff系统将在未来删除
 * @deprecated see SolarActorBuffState 推荐使用演员buff 实现功能
 */
export default class SolarBuffState {
    static config: {
        showSolarBuffUI //显示太阳buff UI
    } = {
        showSolarBuffUI: true
    }

    /**
     * 模拟buff的 ui显示
     */
    static objectPool = new ObjectPool<Frame[]>(() => {
        let frame = Frame.createBUTTON();
        let backgroundImage = frame.addBackgroundImage("");
        frame.setOnMouseEnter(SolarBuffState.showUbertip)
        frame.setOnMouseLeave(SolarBuffState.hideUbertip)
        frame.setSize(0.015, 0.015)
        return [frame, backgroundImage];
    });
    static frameBuffMap: { [frameId: string]: Buff } = {}
    static ubertipFrameBD: Frame = null;
    static ubertipFrameText: Frame = null;

    constructor() {
        if (SingletonUtil.notFirstTime(SolarBuffState)) {
            print("不能重复new SolarBuffState()")
            return;
        }
        /**buff 属性更新到单位属性*/
        let trigger2 = new Trigger();
        trigger2.registerTimerEvent(0.83, true)
        trigger2.addAction(() => {
            //遍历所有
            DataBase.forUnitSolarDatas((u, solarData: AppData) => {
                SolarBuffState.refreshBuffAttributes2UnitSolarAttribute(u)
            })
        });
        //实时刷新
        se.on("属性刷新", () => {
            //遍历所有
            DataBase.forUnitSolarDatas((u, solarData: AppData) => {
                SolarBuffState.refreshBuffAttributes2UnitSolarAttribute(u)
            })
        })
        //实时刷新
        BuffUtil.addAnyBuffCreatedListener(buff => {
            if (buff.attribute) {
                SolarBuffState.refreshBuffAttributes2UnitSolarAttribute(buff.getParent())
            }

        })

        // buff ui显示
        if (SolarBuffState.config.showSolarBuffUI) {
            SolarBuffState.ubertipFrameBD = new Frame("BACKDROP", null, null, "_sl_border_backdrop", 0)
            //
            SolarBuffState.ubertipFrameText = Frame.createTEXT()
            SolarBuffState.ubertipFrameText.setAbsPoint(FRAMEPOINT_BOTTOMRIGHT, 0.78, 0.17)
            SolarBuffState.ubertipFrameText.setSize(0.16, 0)


            SolarBuffState.ubertipFrameBD.setPoints(SolarBuffState.ubertipFrameText.current, 0.01, 0.01);
            // SolarBuffState.ubertipFrameBD.setTexture("UI\\Glues\\BattleNet\\BattleNetTeamLevelBar\\Loading-BarBackground.blp")
            SolarBuffState.ubertipFrameBD.visible = false;
            SolarBuffState.ubertipFrameText.visible = false;

            //
            let trigger = new Trigger();
            trigger.registerTimerEvent(0.1, true);
            trigger.addAction(this.refreshSolarBuffUI)
        }

    }

    static showUbertip(this: void) {
        let frameH = DzGetTriggerUIEventFrame();
        let buff = SolarBuffState.frameBuffMap["f" + frameH];
        if (buff) {
            let buffTips = ColorStr.yellow + (buff.getName() ?? "") + "|n|n";
            if (buff.stackCount && buff.stackCount != 1) {
                buffTips = buffTips + ColorStr.green + "等级: " + (buff.stackCount ?? "1") + "|n|n"
            }
            buffTips = buffTips + ColorStr.white + (buff.getUbertip() ?? "")
            SolarBuffState.ubertipFrameText.setText(buffTips)
            SolarBuffState.ubertipFrameBD.visible = true;
            SolarBuffState.ubertipFrameText.visible = true;
        }
    }

    static hideUbertip(this: void) {
        SolarBuffState.ubertipFrameBD.visible = false;
        SolarBuffState.ubertipFrameText.visible = false;
    }

    /**
     * 更新太阳buff
     */
    refreshSolarBuffUI(this: void) {
        let realSelectUnit = SelectUtil.getRealSelectUnit();
        if (!IsHandle(realSelectUnit)) {
            SolarBuffState.showBuffsUI(false);
            return;
        }


        let unitBuffs = BuffUtil.getUnitBuffs(realSelectUnit);
        if (!unitBuffs) {
            SolarBuffState.showBuffsUI(false);
            return;
        }
        //
        let objectPool = SolarBuffState.objectPool;
        objectPool.setAllIdleStatus(true);//设置对象池所有 ui为 空闲可使用状态
        let index = 0;
        for (let buffTypeId in unitBuffs) {
            let buff = unitBuffs[buffTypeId];
            if (buff.buffType.class && buff.buffType.class != "基础" && buff.buffType.class != "羁绊" && buff.buffType.uiShowType != "单位状态栏") {
                continue;//不是基础类型的其他类型则不在这里显示
            }
            let frames = objectPool.borrowObject();
            let frame = frames[0];
            frame.visible = true
            frames[1].setTexture(buff.buffType.art)
            frame.setAbsPoint(FRAMEPOINT_BOTTOMLEFT, 0.37 + (index * 0.016), 0.007)
            //绑定ui跟 buff
            SolarBuffState.frameBuffMap["f" + frame.current] = buff;
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
        SolarBuffState.objectPool.forActiveObjects(frames => {
            frames[0].visible = show;
        });
    }


    /**
     *
     */
    /**
     * 刷新单位携带的buff的属性值 附加到 单位属性中
     * @param unitHandle
     */
    static refreshBuffAttributes2UnitSolarAttribute(unitHandle: unit) {
        //死亡单位不刷新
        if (!UnitStateUtil.isAlive(unitHandle)) {
            return;
        }
        let attributes: AppAttribute[] = BuffUtil.getUnitBuffAttributes(unitHandle);
        let unitOldBuffsAttr: AppAttribute = DataBase.getUnitSolarData(unitHandle, false)?._SL_totalBuffsSolarAttribute;
        if (unitOldBuffsAttr == null) {//如果之前没有旧buff属性 则退出后续逻辑  否则还需将之前的旧属性 移除
            if (attributes == null || attributes.length == 0) {
                return
            }
        }
        let totalAttribute: SolarAttribute = AttributeUtil.sumAttributes(attributes);

        /**
         dmg system
         */
        let solarData = DataBase.getUnitSolarData(unitHandle);
        if (!solarData._SL_solarAttribute) {
            solarData._SL_solarAttribute = {}
        }

        AttributeUtil.subtract(solarData._SL_solarAttribute, unitOldBuffsAttr);
        AttributeUtil.add(solarData._SL_solarAttribute, totalAttribute);

        solarData._SL_totalBuffsSolarAttribute = totalAttribute;
        //发送属性改变事件
        UnitAttributeState.refreshUnitSolarAttribute(unitHandle)
    }

}