import BaseUtil from "@/BaseUtil";
import TipFrameUtil from "@/TipFrameUtil";
import FramePoint from "@/FramePoint";
import PlayerUtil from "@/PlayerUtil";
import MathUtil from "@/MathUtil";
import {l_中心旋涡点} from "../../_sl_editor/l_中心旋涡点";
import UnitUtil from "@/UnitUtil";
import MapRectUtil from "../../util/MapRectUtil";
import STimer from "@/STimer";
import 深度海域1 from "./深度海域1";
import 深度海域2 from "./深度海域2";
import 深度海域3 from "./深度海域3";
import 深度海域4 from "./深度海域4";
import 深度海域5 from "./深度海域5";
import 深度海域6 from "./深度海域6";
import 深度海域7 from "./深度海域7";
import 深度海域8 from "./深度海域8";
import 深度海域9 from "./深度海域9";
import 深度海域10 from "./深度海域10";
import 深度海域11 from "./深度海域11";
import 深度海域12 from "./深度海域12";
import 深度海域13 from "./深度海域13";
import 深度海域14 from "./深度海域14";
import 深度海域15 from "./深度海域15";
import 深度海域16 from "./深度海域16";
import AttributeUtil from "@/AttributeUtil";
import HeroUtil from "@/HeroUtil";
import TextUtil from "@/TextUtil";
import TextTagUtil from "@/TextTagUtil";
import FrameLoadingUtil from "@/FrameLoadingUtil";

export default class 深度海域 {
    static sTimer: STimer;


    static 开启深度海域之门() {

        深度海域.sTimer = BaseUtil.onTimer(1, (count) => {
            TipFrameUtil.showTipText("|cff00ff00等待所有船只集合到中心漩涡!|cffff0000剩余" + (30 - count), FramePoint.center)
            if (深度海域.是否集合()) {
                深度海域.进入深度海域(1);
                return false;
            } else if (count >= 30) {
                深度海域.进入深度海域(1);
                return false;
            }
            return true;
        });


    }

    static 进入深度海域(index: number) {
        if (gv.深度海域层数 && index <= gv.深度海域层数) {
            BJDebugMsg("已经进入深度海域:" + gv.深度海域层数)
            return
        }
        if (index == 1) {
            PlayerUtil.forUsers(player => {
                RemoveUnit(sd(player).assistant);
                let hero = PlayerUtil.getHero(player);
                let attribute = AttributeUtil.getUnitAttribute(hero);
                if (attribute.进入深度海域时加全属性) {
                    HeroUtil.addHeroPropertyP(hero, false, attribute.进入深度海域时加全属性);
                    TextTagUtil.textSuccess("进入深度海域时加全属性+" + TextUtil.toPercentage(attribute.进入深度海域时加全属性), hero);
                }
            });
        }
        gv.深度海域层数 = index
        深度海域.sTimer?.destroy()
        MapRectUtil.setMapRect(gv.深度海域层数)
        BaseUtil.runLater(0.2, () => {
            PlayerUtil.forUsers(player => {
                let hero = PlayerUtil.getHero(player);
                let vector = MapRectUtil.rectLines[index][2];
                UnitUtil.transfer(hero, vector.x, vector.y);
            });
        })
        FrameLoadingUtil.showLoadingScreen(2, "区域小地图\\深海区域载入图.tga")
        BaseUtil.runLater(2, () => {
            深度海域._sl_执行逻辑();
        });

    }

    private static _sl_执行逻辑() {
        gv.enemyLevel = gv.深度海域层数;
        if (gv.深度海域层数 == 1) {
            new 深度海域1();
        } else if (gv.深度海域层数 == 2) {
            new 深度海域2();
        } else if (gv.深度海域层数 == 3) {
            new 深度海域3();
        } else if (gv.深度海域层数 == 4) {
            new 深度海域4();
        } else if (gv.深度海域层数 == 5) {
            new 深度海域5();
        } else if (gv.深度海域层数 == 6) {
            new 深度海域6();
        } else if (gv.深度海域层数 == 7) {
            new 深度海域7();
        } else if (gv.深度海域层数 == 8) {
            new 深度海域8();
        } else if (gv.深度海域层数 == 9) {
            new 深度海域9();
        } else if (gv.深度海域层数 == 10) {
            new 深度海域10();
        } else if (gv.深度海域层数 == 11) {
            new 深度海域11();
        } else if (gv.深度海域层数 == 12) {
            new 深度海域12();
        } else if (gv.深度海域层数 == 13) {
            new 深度海域13();
        } else if (gv.深度海域层数 == 14) {
            new 深度海域14();
        } else if (gv.深度海域层数 == 15) {
            new 深度海域15();
        } else if (gv.深度海域层数 == 16) {
            new 深度海域16();
        } else {

        }


    }


    static 是否集合() {
        let flag = true;
        PlayerUtil.forUsers(player => {
            let hero = PlayerUtil.getHero(player);
            let distance = MathUtil.distanceBetweenPoints(GetUnitX(hero), GetUnitY(hero), l_中心旋涡点[0].x, l_中心旋涡点[0].y);
            //
            if (distance > 1000) {
                flag = false;
            }
        })
        return flag;

    }


}