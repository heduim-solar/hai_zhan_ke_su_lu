import RectUtil from "@/RectUtil";
import {Rectangle} from "@/rect";

export default class TerrainUtil {


    private static MAX_RANGE: number = 10;

    //
    static isTerrainLand(x: number, y: number): boolean {
        return IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY);
    }

    static isTerrainDeepWater(x: number, y: number): boolean {
        return !IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY);
    }

    static isTerrainShallowWater(x: number, y: number): boolean {
        return !IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) && IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY);
    }

    static isTerrainPlatform(x: number, y: number): boolean {
        return !IsTerrainPathable(x, y, PATHING_TYPE_FLOATABILITY) && !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) && !IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY);
    }

    static isTerrainBuildAble(x: number, y: number): boolean {
        return !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY) && !IsTerrainPathable(x, y, PATHING_TYPE_BUILDABILITY);
    }

    static isTerrainWalkable(x: number, y: number): boolean {
        let rect: Rectangle = RectUtil.GetRectFromCircle(x, y, 64);
        let whichItem: item = CreateItem('wolg', 0, 0);
        let hideItems: item[] = [];
        let hidMax: number = 0;
        SetItemVisible(whichItem, false);
        EnumItemsInRect(rect.handle, null, () => {
            if (IsItemVisible(GetEnumItem())) {
                hideItems[hidMax] = GetEnumItem();
                SetItemVisible(hideItems[hidMax], false);
                hidMax++;
            }
        });
        SetItemPosition(whichItem, x, y);
        let itemX: number = GetItemX(whichItem);
        let itemY: number = GetItemY(whichItem);
        SetItemVisible(whichItem, false);
        rect.destroy();

        while (hidMax > 0) {
            hidMax--;
            SetItemVisible(hideItems[hidMax], true);
            hideItems[hidMax] = null;
        }
        return (itemX - x) * (itemX - x) + (itemY - y) * (itemY - y) <= TerrainUtil.MAX_RANGE * TerrainUtil.MAX_RANGE && !IsTerrainPathable(x, y, PATHING_TYPE_WALKABILITY);
    }

    /**
     * 提高地形
     * @param x
     * @param y
     * @param x2
     * @param y2
     * @param height
     */
    static raiseTerrain(x: number, y: number, x2: number, y2: number, height: number): void {

        let y0: number = y;
        let r: number = 32.00;

        while (true) {
            if (x > x2) break;
            y = y0;
            while (true) {
                if (y > y2) break;
                TerrainDeformCrater(x, y, r, -height, 1, true);
                y = y + r;
            }
            x = x + r;
        }
    }

    /**
     * 提高地形
     * @param x
     * @param y
     * @param height
     */
    static raiseTerrainTile(x: number, y: number, height: number): void {
        TerrainDeformCrater(x, y, 1, -height, 0.01, true);
    }


}