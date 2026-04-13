import {frameDefaults} from "./FrameDefault";
import {Frame} from "../handles/frame";


const typeNames = [
    "backdrop",
    "button",
    "chatdisplay",
    "checkbox",
    "frame",
    "control",
    "dialog",
    "editbox",
    "gluebutton",
    "gluecheckbox",
    "glueeditbox",
    "gluepopupmenu",
    "gluetextbutton",
    "highlight",
    "listbox",
    "menu",
    "model",
    "popupmenu",
    "scrollbar",
    "slashchatbox",
    "slider",
    "sprite",
    "text",
    "textarea",
    "textbutton",
    "timertext",
];
const simpleTypeNames = [
    "simple-button",
    "simple-checkbox",
    "simple-statusbar",
];
let frameDefaultsNameIndex = 1;


export const data: {
    [id: string]: FrameProps & any
} = {}


/** @noSelf **/
export default class CreateFrameUtil {


    static nextFrameName(): string {
        frameDefaultsNameIndex++;
        return frameDefaults.name + "" + frameDefaultsNameIndex
    }


    static createFrame(jsxType: string, parentFrame: number | undefined, props: FrameProps): number {
        if (!parentFrame) {
            throw `expected parent frame for ${jsxType}`;
        }
        let {
            id,
            name,
            priority = frameDefaults.priority,
            inherits,
            isSimple,
            position,
            size,
            context = frameDefaults.context,
            ref,
        } = props;
        if (!name || name.length < 1) {
            name = CreateFrameUtil.nextFrameName()
        } else {
            // print("props.name=" + name)
        }
        if (!id) {
            id = inherits
        }
        if (id && id.length > 0) {
            if (!ref) {
                ref = {current: 0}
                props.ref = ref
            }
            data[id] = props
        }
        let typeName = props.typeName;

        if (typeName == null && typeNames.includes(jsxType))
            typeName = jsxType.toUpperCase();

        if (typeName == null && simpleTypeNames.includes(jsxType))
            typeName = jsxType.replace("-", "").toUpperCase();

        // frame is both our base component and a typeName; we expose it as
        // container
        if (typeName == null) {
            if (jsxType === "root") {
                return DzGetGameUI();
            } else if (jsxType === "container" || jsxType === "div") {
                typeName = "FRAME";
            } else if (jsxType === "simple-container") {
                typeName = "SIMPLEFRAME";
            } else if (jsxType === "img") {
                typeName = "BACKDROP";
            }
        }


        let frame: number;

        if (isSimple ?? jsxType === "simple-frame") {
            frame = DzCreateSimpleFrame(name, parentFrame, context);
            // log.info("DzCreateSimpleFrame=[name]=" + name +
            //     "[parentFrame]=" + parentFrame + "[context]=" + context)
        } else if (typeName) {
            frame = DzCreateFrameByTagName(
                typeName,
                name,
                parentFrame,
                inherits ?? "",
                context,
            );
            // log.info(frame+"DzCreateFrameByTagName=typeName=" + typeName + "[name]=" + name +
            //     "[parentFrame]=" + parentFrame + "[context]=" + context + "[inherits]=" + tostring(inherits))


        } else {
            frame = DzCreateFrame(name, parentFrame, context);
            // log.info("DzCreateSimpleFrame=[name]=" + name +
            //     "[parentFrame]=" + parentFrame + "[context]=" + context)
        }
        if (!position && !size) {
            DzFrameSetAllPoints(frame, DzFrameGetParent(frame));
        } else if (!position) {
            DzFrameSetPoint(frame, 6,
                DzFrameGetParent(frame),
                6,
                0, 0);
        } else if (!size) {
            DzFrameSetSize(frame, frameDefaults.size.width, frameDefaults.size.height);
        }

        if (ref) ref.current = frame;
        if (ref instanceof Frame){
            ref.type = typeName
            ref.props = props
        }
        return frame;
    }


}

