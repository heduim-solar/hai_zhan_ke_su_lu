/** @noSelfInFile **/
import {render} from "./basic_pragma";
import CreateFrameUtil from "./CreateFrameUtil";
import {frameDefaults} from "./FrameDefault";
import FramePropUtil from "./FramePropUtil";

let scale = 1600 * 1.25;
const smartSize = (size: number) =>
    size < 1 && size > -1 ? size : size / scale;


export const setPixelScale = (newScale: number): void => {
    scale = newScale * 1.25;
};

export const tooltipMap: { [id: string]: number } = {};
const defaultSync = false
const setEventProp = (
    frame: number,
    // This typing is wrong, should be prop: K, value?: FrameProps[K]
    event: number,
    val?: () => void,
    oldValue?: () => void,
    sync = false
) => {
    if (sync && isAsync) {
        log.errorWithTraceBack("无法在异步中注册同步方法！请在同步方法中执行！")
        return
    }
    DzFrameSetScriptByCode(frame, event, val, sync)
};

const absurd = (value: any) => {
    throw `Got ${value} when expected nothing`;
};

const previousToParentPoint = (relative: number) => {
    switch (relative) {
        // Span
        case FRAMEPOINT_RIGHT:
            return FRAMEPOINT_LEFT;
        // Div
        case FRAMEPOINT_BOTTOM:
            return FRAMEPOINT_TOP;

        case FRAMEPOINT_BOTTOMLEFT:
            return FRAMEPOINT_TOPLEFT;
        case FRAMEPOINT_BOTTOMRIGHT:
            return FRAMEPOINT_TOPRIGHT;
    }
};

/** @noSelf **/
export default class AdapterUtil {

    static resolveRelative(frame: number, relative: RelativeFrame, relativePoint: number): number {
        if (!relative) {
            if (frame != 0) {
                let parent = DzFrameGetParent(frame);
                if (parent && parent > 0) {
                    return parent;
                }
            }
            return DzGetGameUI();
        }
        if (typeof relative !== "string") {
            return relative;
        }
        switch (relative) {
            case "parent":
                return DzFrameGetParent(frame);
            default:
                log.error("relative 错误=" + relative)
        }

    };

    /**
     * setProp
     */
    static setProp(frame: number, prop: keyof FrameProps | "children", value?: FrameProps[keyof FrameProps], oldValue?: FrameProps[keyof FrameProps]) {
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const val = value ?? (frameDefaults[prop] as any);
        // eslint-disable-next-line @typescript-eslint/no-explicit-any
        const _oldValue = oldValue as any;
        switch (prop) {
            case "text": {
                DzFrameSetText(frame, val);
                break;
            }
            case "maxLength": {
                DzFrameSetTextSizeLimit(frame, val);
                break;
            }
            case "textColor": {
                DzFrameSetTextColor(frame, val);
                break;
            }
            case "texture": {
                const val2 = typeof val === "string" ? {texFile: val} : val;
                DzFrameSetTexture(frame, val2.texFile ?? frameDefaults.texture.texFile,
                    val2.flag ?? frameDefaults.texture.flag);
                break;
            }
            case "model": {
                DzFrameSetModel(frame, val.modelFile ?? frameDefaults.model.modelFile,
                    val.cameraIndex ?? frameDefaults.model.cameraIndex, 1);
                break;
            }
            case "alpha": {
                DzFrameSetAlpha(frame, val);
                break;
            }
            case "visible": {
                DzFrameShow(frame, val);
                break;
            }
            case "enabled": {
                DzFrameSetEnable(frame, val);
                break;
            }
            case "vertexColor": {
                DzFrameSetVertexColor(frame, val);
                break;
            }
            case "value": {
                DzFrameSetValue(frame, val);
                break;
            }
            case "size": {
                DzFrameSetSize(frame, smartSize(val.width ?? frameDefaults.size.width),
                    smartSize(val.height ?? frameDefaults.size.height));
                break;
            }
            case "stepSize": {
                DzFrameSetStepValue(frame, val);
                break;
            }
            case "tooltip": {
                const existingTooltip = tooltipMap["FT_" + frame];
                let tooltip;
                if (existingTooltip) {
                    tooltip = existingTooltip;
                } else {
                    tooltip = CreateFrameUtil.createFrame("container", DzGetGameUI(), {name: "Tooltip"})
                    tooltipMap["FT_" + frame] = tooltip;
                    DzFrameSetTooltip(frame, tooltip);
                }
                render(val, tooltip);
                break;
            }
            case "frametip":
                FramePropUtil.setProp_frametip(frame, prop, value)
                break;
            case "font": {
                DzFrameSetFont(
                    frame,
                    val.fileName ?? frameDefaults.font.fileName,
                    val.height ?? frameDefaults.font.height,
                    val.flags ?? frameDefaults.font.flags,
                );
                break;
            }
            case "minMaxValue": {
                DzFrameSetMinMaxValue(
                    frame,
                    val.min ?? frameDefaults.minMaxValue.min,
                    val.max ?? frameDefaults.minMaxValue.max,
                );
                break;
            }
            case "scale": {
                DzFrameSetScale(frame, val);
                break;
            }
            case "textAlignment": {
                DzFrameSetTextAlignment(frame, val ?? frameDefaults.textAlignment);
                break;
            }
            case "position": {
                AdapterUtil.setProp_position(frame, val);
                break;
            }
            case "absPosition": {
                if (val != null) {
                    const positions: AbsPos[] = val === "clear" || "point" in val ? [val as AbsPos] : (val as AbsPos[]);
                    for (const absPosition of positions) {
                        if (absPosition === "clear") {
                            DzFrameClearAllPoints(frame);
                        } else {
                            DzFrameSetAbsolutePoint(frame, absPosition.point,
                                smartSize(absPosition.x ?? 0), smartSize(absPosition.y ?? 0));
                        }
                    }
                }
                break;
            }
            case "onClick": {
                setEventProp(frame, 1, val, _oldValue);
                break;
            }
            case "onClickSync": {
                setEventProp(frame, 1, val, _oldValue, true);
                break;
            }
            case "onMouseEnter": {
                setEventProp(frame, 2, val, _oldValue);
                break;
            }
            case "onMouseLeave": {
                setEventProp(frame, 3, val, _oldValue);
                break;
            }
            case "onMouseUp": {
                setEventProp(frame, 4, val, _oldValue);
                break;
            }
            case "onMouseDown": {
                setEventProp(frame, 5, val, _oldValue);
                break;
            }
            case "onMouseWheel": {
                setEventProp(frame, 6, val, _oldValue);
                break;
            }
            case "onCheckboxChecked": {
                setEventProp(frame, 7, val, _oldValue);
                break;
            }
            case "onCheckboxUnchecked": {
                setEventProp(frame, 8, val, _oldValue);
                break;
            }
            case "onEditboxTextChanged": {
                setEventProp(frame, 9, val, _oldValue);
                break;
            }
            case "onPopupmenuItemChanged": {
                setEventProp(frame, 11, val, _oldValue);
                break;
            }
            case "onDoubleClick": {
                setEventProp(frame, 12, val, _oldValue);
                break;
            }
            case "onSpriteAnimUpdate": {
                setEventProp(frame, 13, val, _oldValue);
                break;
            }
            case "ref": {
                if (val) val.current = frame;
                break;
            }
            case "id":
            case "name":
            case "priority":
            case "isSimple":
            case "typeName":
            case "inherits":
            case "children":
            case "context":
            case "key":
                break;
            //solar addons
            case "background-image":
                let backdropFrame = CreateFrameUtil.createFrame("backdrop", frame, {})
                DzFrameSetTexture(backdropFrame, val, 0);
                DzFrameSetAllPoints(backdropFrame, frame);
                break;
            case "hideParentOnClick":
                if (val) {
                    DzFrameSetScriptByCode(frame, 1, () => {
                        let parent = DzFrameGetParent(frame);
                        DzFrameShow(parent, false)
                    }, defaultSync)

                }
                break;
            case "showRefOnClick":
                if (val && val.current) {
                    DzFrameSetScriptByCode(frame, 1, () => {
                        DzFrameShow(val.current, true)
                    }, defaultSync)
                }
                break;
            default:
                absurd(prop);
        }
    };


    static setProp_position(frame: number, val?: any) {
        if (val == null) {
            return;
        }
        const positions: Pos[] = val === "parent" || val === "clear" || "x" in val ? [val as Pos] : (val as Pos[]);
        for (const position of positions) {
            if (position === "clear") {
                DzFrameClearAllPoints(frame);
                return;
            }
            if (position === "parent") {
                DzFrameSetAllPoints(frame, DzFrameGetParent(frame));
                return;
            }
            const relative = AdapterUtil.resolveRelative(frame, position.relative, position.relativePoint);
            if (relative) {
                DzFrameSetPoint(frame, position.point ?? 6,
                    relative ?? DzFrameGetParent(frame),
                    position.relativePoint ?? 6,
                    smartSize(position.x ?? 0), smartSize(position.y ?? 0));
                return;
            }
            // We used `previous` and we're the first child
            const parentRelative = previousToParentPoint(position.relativePoint);
            if (parentRelative) {
                DzFrameSetPoint(frame, position.point, DzFrameGetParent(frame),
                    parentRelative, smartSize(position.x ?? 0), smartSize(position.y ?? 0));
            }
        }
    }


}
