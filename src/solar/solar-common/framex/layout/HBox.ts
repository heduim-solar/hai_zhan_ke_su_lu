import Pane from "@/Pane";
import FrameNode from "@/FrameNode";
import FramePoint from "@/FramePoint";

export default class HBox extends Pane {
    private _spacing: number

    constructor(spacing: number, ...children: FrameNode[]) {
        super();
        this.spacing = spacing;
        this.attachChilds(children)
    }


    get spacing(): number {
        return this._spacing;
    }

    set spacing(value: number) {
        this._spacing = value;
    }


    layout() {
        for (let i = 0; i < this.children.length; i++) {
            let child: FrameNode = this.children[i];
            child.rootFrame.setParent(this.rootFrame.handle)
            child.rootFrame.clearPoints()
            if (i == 0) {
                child.rootFrame.setPoint(FramePoint.left, this.rootFrame.handle, FramePoint.left, 0, 0)
            } else {
                child.rootFrame.setPoint(FramePoint.left, this.children[i - 1].rootFrame.handle, FramePoint.right, this._spacing, 0)
            }
        }
        super.layout();
    }
}