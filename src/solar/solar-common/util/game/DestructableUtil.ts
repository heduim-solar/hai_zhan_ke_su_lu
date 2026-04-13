import RectUtil from "./RectUtil";
import {Rectangle} from "@/w3ts/handles/rect";

/** @noSelf **/
export default class DestructableUtil {


    /**
     * 在指定区域是否有装饰物
     * @param centerX
     * @param centerY
     * @param radius
     * @param destructableId
     */
    static hasDestructableInRect(centerX: number, centerY: number, radius: number, destructableId: string): boolean {
        let r: Rectangle = RectUtil.GetRectFromCircle(centerX, centerY, radius)
        tempBoolean = false;
        tempNumber = FourCC(destructableId);
        //使用命名函数
        r.enumDestructables(null, DestructableUtil._HasDestructableInRectActionFunc)
        r.destroy()
        return tempBoolean
    }

    private static _HasDestructableInRectActionFunc(this: void) {
        if (GetDestructableTypeId(GetEnumDestructable()) == tempNumber) {
            tempBoolean = true
        }
    }

}
