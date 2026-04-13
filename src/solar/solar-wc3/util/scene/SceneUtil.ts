import CsvUtil from "@/CsvUtil";
import TerrainUtil from "@sl-wc3/TerrainUtil";
import ObjectDataUtil from "@/ObjectDataUtil";
import Cache from "@/Cache";
import VmUtil from "@/VmUtil";

/**
 * 加载平板地形时 效果很好
 * (即 地形装饰物 地形纹理 通行路径)
 *
 * 动态设置的通行路径 不会被单位自动寻路“完全”考虑
 *
 */
export default class SceneUtil {
    private static _sl_ground_tiles_id: { [index: number]: string } = null;
    private static cache = new Cache();


    /**
     *
     * @param scenePath 场景文件目录的路径
     * @param toCenterX 加载到的中心点x
     * @param toCenterY 加载到的中心点y
     * @param isFull 是否加载地形悬崖
     */
    static loadScene(scenePath: string, toCenterX: number, toCenterY: number, isFull: boolean = false): SceneData {
        if (!VmUtil.hasResource(scenePath + "\\info.csv")) {
            log.errorWithTraceBack("场景不存在:" + scenePath)
            return null;
        }

        SceneUtil._sl_ground_tiles_id = SceneUtil._sl_loadScene_ground_tiles_id(scenePath + "\\ground_tiles_id.csv")
        SceneUtil._sl_loadScene_terrain_tile(scenePath + "\\terrain_tile.csv", toCenterX, toCenterY, isFull);
        if (isFull) {
            SceneUtil._sl_loadScene_terrain_cliff(scenePath + "\\terrain_cliff.csv", toCenterX, toCenterY);
        }
        SceneUtil._sl_loadScene_terrain_route(scenePath + "\\terrain_route.csv", toCenterX, toCenterY, isFull);
        SceneUtil._sl_loadScene_dood(scenePath + "\\dood.csv", toCenterX, toCenterY);
        let units = SceneUtil._sl_loadScene_terrain_unit(scenePath + "\\terrain_unit.csv", toCenterX, toCenterY);
        /**
         * 封装 SceneData
         */
        let rectCsvDatas = CsvUtil.parse(scenePath + "\\rect.csv");
        let infoCsvData = CsvUtil.parse(scenePath + "\\info.csv")[0];
        let rects = {};
        if (rectCsvDatas) {
            for (let rectCsvData of rectCsvDatas) {
                if (!rectCsvData?.name) {
                    continue
                }
                rects[rectCsvData.name] = {
                    index: tonumber(rectCsvData.index),
                    name: rectCsvData.name,
                    x: tonumber(rectCsvData.x) + toCenterX,
                    y: tonumber(rectCsvData.y) + toCenterY,
                    width: tonumber(rectCsvData.width),
                    height: tonumber(rectCsvData.height)
                }
            }
        }
        //
        let sceneData: SceneData = {
            rects,
            units,
            width: tonumber(infoCsvData.width),
            height: tonumber(infoCsvData.height),
            minX: toCenterX + tonumber(infoCsvData.minX),
            maxX: toCenterX + tonumber(infoCsvData.maxX),
            minY: toCenterY + tonumber(infoCsvData.minY),
            maxY: toCenterY + tonumber(infoCsvData.maxY),
        };
        return sceneData;
    }

    /**
     * 设置场景的边界
     * @param x
     * @param y
     * @param width
     * @param height
     */
    static setSceneBounds(sceneData: SceneData) {


        //x
        for (let ty = sceneData.minY; ty <= sceneData.maxY; ty = ty + 32) {
            SetTerrainPathable(sceneData.minX, ty, PATHING_TYPE_WALKABILITY, false)
            SetTerrainPathable(sceneData.minX, ty, PATHING_TYPE_FLYABILITY, false)
            //
            SetTerrainPathable(sceneData.maxX, ty, PATHING_TYPE_WALKABILITY, false)
            SetTerrainPathable(sceneData.maxX, ty, PATHING_TYPE_FLYABILITY, false)
        }

        //x
        for (let tx = sceneData.minX; tx <= sceneData.maxX; tx = tx + 32) {
            SetTerrainPathable(tx, sceneData.minY, PATHING_TYPE_WALKABILITY, false)
            SetTerrainPathable(tx, sceneData.minY, PATHING_TYPE_FLYABILITY, false)
            //
            SetTerrainPathable(tx, sceneData.maxY, PATHING_TYPE_WALKABILITY, false)
            SetTerrainPathable(tx, sceneData.maxY, PATHING_TYPE_FLYABILITY, false)
        }


    }


    private static _sl_loadScene_ground_tiles_id(ground_tiles_idPath: string): { [index: number]: string } {
        let ground_tiles_id = CsvUtil.parse(ground_tiles_idPath);
        let indexId = {}
        if (!ground_tiles_id) {
            return indexId
        }
        for (let datum of ground_tiles_id) {
            if (datum.index && datum.id) {
                indexId[datum.index] = datum.id
            }
        }
        return indexId;
    }

    private static _sl_loadScene_terrain_tile(csvPath: string, toCenterX: number, toCenterY: number, loadCliff: boolean = false) {
        let terrain_tile = CsvUtil.parse(csvPath);
        if (!terrain_tile) {
            return
        }
        for (let datum of terrain_tile) {
            if (!datum.x) {
                continue
            }
            let x = toCenterX + tonumber(datum.x)
            let y = toCenterY + tonumber(datum.y)
            if (loadCliff) {
                let height = tonumber(datum.height)
                let cLayer = tonumber(datum.cLayer)
                if (height != 0 || cLayer != 0) {
                    TerrainUtil.raiseTerrainTile(x, y, height + (cLayer * 128))
                }
            }
            SetTerrainType(x, y, FourCC(SceneUtil._sl_ground_tiles_id[datum.tex]), -1, 1, 0)
        }
    }

    /**
     * 加载地形 悬崖
     * @param csvPath
     * @param toCenterX
     * @param toCenterY
     * @private
     */
    private static _sl_loadScene_terrain_cliff(csvPath: string, toCenterX: number, toCenterY: number) {
        let csvDatas = CsvUtil.parse(csvPath);
        if (!csvDatas) {
            return
        }
        for (let datum of csvDatas) {
            if (!datum.x) {
                continue
            }
            let x = toCenterX + tonumber(datum.x)
            let y = toCenterY + tonumber(datum.y)
            let z = toCenterY + tonumber(datum.z)
            let modelPath = null;
            if (datum.type == "R") {
                modelPath = "Cliffs\\CliffTrans" + datum.name + "0.mdx";
                x += 128
            } else {
                modelPath = "Cliffs\\Cliffs" + datum.name + "0.mdx";
            }

            let effect = AddSpecialEffect(modelPath, x, y);
            EXSetEffectZ(effect, z)

        }
    }

    private static _sl_loadScene_terrain_route(terrain_route: string, toCenterX: number, toCenterY: number, isFull: boolean = false) {
        let csvDatas = CsvUtil.parse(terrain_route);
        if (!csvDatas) {
            return
        }
        for (let datum of csvDatas) {
            if (!datum.x) {
                continue
            }
            let x = toCenterX + tonumber(datum.x)
            let y = toCenterY + tonumber(datum.y)
            //x,y,unWalk,unFly,unBuild,blight,unWater
            SetTerrainPathable(x, y, PATHING_TYPE_WALKABILITY, tonumber(datum.unWalk) == 0)
            SetTerrainPathable(x, y, PATHING_TYPE_FLYABILITY, tonumber(datum.unFly) == 0)
            SetTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY, tonumber(datum.unBuild) == 0)
            if (isFull) {
                SetTerrainPathable(x, y, PATHING_TYPE_BLIGHTPATHING, tonumber(datum.blight) == 1)
                SetTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY, tonumber(datum.unWater) == 0)
                SetTerrainPathable(x, y, PATHING_TYPE_AMPHIBIOUSPATHING, tonumber(datum.unWater) == 0)
            }
        }

    }

    private static _sl_loadScene_dood(doodPath: string, toCenterX: number, toCenterY: number) {
        let dood = CsvUtil.parse(doodPath);
        let cacheKey = "dood:" + toCenterX + ":" + toCenterY;
        let destCacheKey = "dest:" + toCenterX + ":" + toCenterY;
        let currentEffects: effect[] = SceneUtil.cache.get(cacheKey);
        let currentDests: destructable[] = SceneUtil.cache.get(destCacheKey);
        //清除上次在这个区域加载的 地形装饰物
        if (currentEffects != null) {
            for (let currentEffect of currentEffects) {
                EXSetEffectZ(currentEffect, -5000);//移到底部去 以免显示死亡消散动画
                DestroyEffect(currentEffect);
            }
        }
        if (currentDests != null) {
            for (let dest of currentDests) {
                handle_unref(dest)
                RemoveDestructable(dest);
            }
        }
        currentEffects = [];
        currentDests = [];
        SceneUtil.cache.put(cacheKey, currentEffects);
        SceneUtil.cache.put(destCacheKey, currentDests);
        if (!dood) {
            return
        }

        for (let datum of dood) {
            if (!datum.x) {
                continue
            }
            let typeId = datum.typeId
            let x = toCenterX + tonumber(datum.x)
            let y = toCenterY + tonumber(datum.y)
            let angle = tonumber(datum.angle)
            let obj: dobj = _g_objs.doodad[typeId];
            if (obj) {
                let modelPath = ObjectDataUtil.getStandardModelPath(obj.file);
                let effect = AddSpecialEffect(modelPath, x, y);
                EXSetEffectZ(effect, tonumber(datum.z))
                EXEffectMatScale(effect, tonumber(datum.scaleX), tonumber(datum.scaleY), tonumber(datum.scaleZ))
                EXEffectMatRotateZ(effect, angle)
                //
                currentEffects.push(effect)

                continue;
            }

            // 如果是可破坏物的话 直接创建可破坏物
            obj = _g_objs.destructable[typeId];
            if (obj) {
                let lifePerc = tonumber(datum.lifePerc)
                let v = tonumber(datum.v)
                let destHandle: destructable = null;
                if (lifePerc == 0) {
                    destHandle = CreateDeadDestructable(typeId, x, y, angle, 1, v);
                } else {
                    destHandle = CreateDestructable(typeId, x, y, angle, 1, v);
                    if (lifePerc != 100) {
                        SetDestructableLife(destHandle, GetDestructableMaxLife(destHandle) * lifePerc / 100);
                    }
                }
                handle_ref(destHandle)
                currentDests.push(destHandle);
            }


        }


    }

    private static _sl_loadScene_terrain_unit(csvPath: string, toCenterX: number, toCenterY: number): unit[] {
        let csvData = CsvUtil.parse(csvPath);
        let cacheKey = "unit:" + toCenterX + ":" + toCenterY;
        let currentHandle: unit[] = SceneUtil.cache.get(cacheKey);
        //清除上次在这个区域加载的 地形装饰物
        if (currentHandle != null) {
            for (let h of currentHandle) {
                handle_unref(h)
                RemoveUnit(h);
            }
        }
        currentHandle = [];
        SceneUtil.cache.put(cacheKey, currentHandle);

        if (!csvData) {
            return
        }
        for (let datum of csvData) {
            if (!datum.x) {
                continue
            }
            let typeId = datum.typeId
            let x = toCenterX + tonumber(datum.x)
            let y = toCenterY + tonumber(datum.y)
            let uh = CreateUnit(Player(tonumber(datum.player)), typeId, x, y, tonumber(datum.angle));
            //
            handle_ref(uh)
            currentHandle.push(uh)
        }

        return currentHandle;
    }


}