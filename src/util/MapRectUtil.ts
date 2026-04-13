import {l_基础区域} from "../_sl_editor/l_基础区域";
import {l_地形11} from "../_sl_editor/l_地形11";
import {l_地形12} from "../_sl_editor/l_地形12";
import {l_地形13} from "../_sl_editor/l_地形13";
import {l_地形14} from "../_sl_editor/l_地形14";
import {l_地形15} from "../_sl_editor/l_地形15";
import {l_地形16} from "../_sl_editor/l_地形16";
import {l_地形18} from "../_sl_editor/l_地形18";
import {l_地形17} from "../_sl_editor/l_地形17";
import {l_地形25} from "../_sl_editor/l_地形25";
import {l_地形21} from "../_sl_editor/l_地形21";
import {l_地形22} from "../_sl_editor/l_地形22";
import {l_地形23} from "../_sl_editor/l_地形23";
import {l_地形24} from "../_sl_editor/l_地形24";
import {l_地形31} from "../_sl_editor/l_地形31";
import {l_地形35} from "../_sl_editor/l_地形35";
import {l_地形32} from "../_sl_editor/l_地形32";
import {l_地形33} from "../_sl_editor/l_地形33";
import {l_地形34} from "../_sl_editor/l_地形34";
import {l_地形41} from "../_sl_editor/l_地形41";
import {l_地形42} from "../_sl_editor/l_地形42";
import {l_地形43} from "../_sl_editor/l_地形43";
import {l_地形44} from "../_sl_editor/l_地形44";
import {l_地形51} from "../_sl_editor/l_地形51";
import {l_地形55} from "../_sl_editor/l_地形55";
import {l_地形56} from "../_sl_editor/l_地形56";
import CameraUtil from "@/CameraUtil";
import RectUtil from "@/RectUtil";
import BaseUtil from "@/BaseUtil";
import Cache from "@/Cache";

export default class MapRectUtil {
    static cache = new Cache();

    static rectLines: (Vector[])[] = [
        l_基础区域,
        l_地形11,
        l_地形12,
        l_地形13,
        //sd4 迷宫
        l_地形22,
        //sd5 世外桃源
        l_地形55,
        //sd6 血色桃源
        l_地形51,
        l_地形14,
        l_地形15,
        l_地形16,
        l_地形17,
        l_地形18,
        l_地形21,
        l_地形23,
        l_地形24,
        l_地形25,
        l_地形31,
        l_地形32,
        l_地形33,
        l_地形34,
        l_地形35,
        l_地形41,
        l_地形42,
        l_地形43,
        l_地形44,


        l_地形56,
    ];

    static lineMapMap: any = {
        [l_基础区域 as any]: "区域小地图\\主图.blp",
        [l_地形11 as any]: "区域小地图\\1-1.blp",
        [l_地形12 as any]: "区域小地图\\1-2.blp",
        [l_地形13 as any]: "区域小地图\\1-3.blp",
        [l_地形14 as any]: "区域小地图\\1-4.blp",
        [l_地形15 as any]: "区域小地图\\1-5.blp",
        [l_地形16 as any]: "区域小地图\\1-6.blp",
        [l_地形17 as any]: "区域小地图\\1-7.blp",
        [l_地形18 as any]: "区域小地图\\1-8.blp",
        [l_地形21 as any]: "区域小地图\\2-1.blp",
        [l_地形22 as any]: "区域小地图\\2-2.blp",
        [l_地形23 as any]: "区域小地图\\2-3.blp",
        [l_地形24 as any]: "区域小地图\\2-4.blp",
        [l_地形25 as any]: "区域小地图\\2-5.blp",
        [l_地形31 as any]: "区域小地图\\3-1.blp",
        [l_地形32 as any]: "区域小地图\\3-2.blp",
        [l_地形33 as any]: "区域小地图\\3-3.blp",
        [l_地形34 as any]: "区域小地图\\3-4.blp",
        [l_地形35 as any]: "区域小地图\\3-5.blp",
        [l_地形41 as any]: "区域小地图\\4-1.blp",
        [l_地形42 as any]: "区域小地图\\4-2.blp",
        [l_地形43 as any]: "区域小地图\\4-3.blp",
        [l_地形44 as any]: "区域小地图\\4-4.blp",
        [l_地形51 as any]: "区域小地图\\4-5.blp",
        [l_地形55 as any]: "区域小地图\\5-1.blp",
        [l_地形56 as any]: "区域小地图\\5-2.blp",

    }

    static getLine(index: number): Vector[] {
        return MapRectUtil.rectLines[index];
    }

    static getRect(index: number): rect {
        return MapRectUtil.cache.get("getRect:" + index, () => {
            return RectUtil.createRectByVecs(...MapRectUtil.rectLines[index]);
        });
    }

    static setMapRect(index: number) {
        BaseUtil.runLater(0.01, () => {
            // MapRectUtil.setCameraBounds(index, "区域小地图\\主地图小地图.blp")
            // MapRectUtil.setCameraBounds(index, "区域小地图\\主图.blp")
            let r: rect = null;
            let mapMapPath: string = null;
            if (index == 0) {
                r = RectUtil.createRectByVecs({x: -5496 + 128, y: -6081 + 256}, {x: 5369 - 128, y: 5392 - 256});
                mapMapPath = "区域小地图\\主图.blp";
            } else {
                r = MapRectUtil.getRect(index);
                mapMapPath = MapRectUtil.lineMapMap[MapRectUtil.rectLines[index] as any];
            }
            //左下: -5496 -6081
            //右上: 5369 5392
            print("mapMapPath=" + tostring(mapMapPath))
            CameraUtil.setCameraBoundsByRect(r, mapMapPath)
            // CameraUtil.setCameraBoundsByRect(gg_rct_map, "区域小地图\\自导.blp")
            // SetCameraBounds(-5496, -6081, -5496, 5392, 5369, 5392, 5369, -6081)
            // CameraUtil.setCameraBoundsByRect(gg_rct_map, "区域小地图\\QQ截图20231229162742.blp")
        })

    }

    private static setCameraBounds(index: number, mapMapPath?: string) {
        let r = RectUtil.createRectByVecs(...MapRectUtil.rectLines[index]);
        let minX = GetRectMinX(r) + 512 * 2;
        let minY = GetRectMinY(r) + 256 * 2;
        let maxY = GetRectMaxY(r) - 256 * 2;
        let maxX = GetRectMaxX(r) - 512 * 2;
        SetCameraBounds(minX, minY, minX, maxY, maxX, maxY, maxX, minY)
        //
        if (mapMapPath) {
            BaseUtil.runLater(0.1, () => {
                DzSetWar3MapMap(mapMapPath)
            });
        }
    }


}

