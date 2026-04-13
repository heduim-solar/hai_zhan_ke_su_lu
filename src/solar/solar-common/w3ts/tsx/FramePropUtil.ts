import {frameDefaults} from "./FrameDefault";

export default class FramePropUtil {


    static setProp_frametip(frame: number, prop: keyof FrameProps, value?: FrameProps[keyof FrameProps]) {
        const val = value ?? (frameDefaults[prop] as any);
        DzFrameSetScriptByCode(frame, 2, () => {
            if (!val.pos) {
                val.pos = 7
            }
            if (val.onTip) {
                val.onTip(val.frametipRef.current, frame);
            }
            DzFrameShow(val.frametipRef.current, true)
            DzFrameClearAllPoints(val.frametipRef.current)
            //
            let gap = 0.01;
            let x = 0;
            let y = 0;
            switch (val.pos) {
                case 0:
                    x = -gap;
                    y = gap;
                    break;
                case 1:
                    x = 0;
                    y = gap;
                    break;
                case 2:
                    x = gap;
                    y = gap;
                    break;
                case 3:
                    x = -gap;
                    y = 0;
                    break;
                case 4:
                    x = 0;
                    y = 0;
                    break;
                case 5:
                    x = gap;
                    y = 0;
                    break;
                case 6:
                    x = -gap;
                    y = -gap;
                    break;
                case 7:
                    x = 0;
                    y = -gap;
                    break;
                case 8:
                    x = gap;
                    y = -gap;
                    break;
            }

            DzFrameSetPoint(val.frametipRef.current, 8 - val.pos, frame, val.pos, x, y)
        }, false)
        DzFrameSetScriptByCode(frame, 3, () => {
            DzFrameShow(val.frametipRef.current, false)
        }, false)

    }


}
