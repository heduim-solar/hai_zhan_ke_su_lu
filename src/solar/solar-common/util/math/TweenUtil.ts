import {Easing, Tween} from "@/lib/tween";
import {Frame} from "@/w3ts/handles/frame";

/** @noSelf **/
export default class TweenUtil {


    /**
     * 动画线性变化
     * @param frame
     * @param duration
     * @param x
     * @param y
     * @param w
     * @param h
     * @param a
     * @param delay
     * @param rollback
     */
    static frameTransition(frame: Frame, duration: number = 200, x: number = 0, y: number = 0, w: number = 0, h: number = 0,
                           a: number = 150, delay: number = 0, rollback: boolean = false) {
        let prop = frame.props;
        let ox = prop.position['x'] ? prop.position['x'] : 0
        let oy = prop.position['y'] ? prop.position['y'] : 0
        let srcObj = {x: ox, y: oy, w: prop.size.width, h: prop.size.height, a: 255}
        let toObj = {
            x: ox + x,
            y: oy + y,
            w: prop.size.width + w,
            h: prop.size.height + h,
            a: a
        }
        let tween1 = new Tween({...srcObj})
            .to(toObj, duration)
            .delay(delay)
            .easing(Easing.Quadratic.Out)
            .onUpdate((temp) => {
                DzFrameSetAlpha(frame.current, temp.a)
                DzFrameSetPoint(frame.current, FRAMEPOINT_BOTTOMLEFT, DzFrameGetParent(frame.current), FRAMEPOINT_BOTTOMLEFT, temp.x, temp.y)
                DzFrameSetSize(frame.current, temp.w, temp.h)
            });
        if (rollback) {
            let tween2 = new Tween(toObj)
                .to(srcObj, duration)
                .delay(delay)
                .easing(Easing.Quadratic.In)
                .onUpdate((temp) => {
                    DzFrameSetAlpha(frame.current, temp.a)
                    DzFrameSetPoint(frame.current, FRAMEPOINT_BOTTOMLEFT, DzFrameGetParent(frame.current), FRAMEPOINT_BOTTOMLEFT, temp.x, temp.y)
                    DzFrameSetSize(frame.current, temp.w, temp.h)
                });
            tween1.chain(tween2)
        }
        DzFrameClearAllPoints(frame.current)
        tween1.start();
    }

}
