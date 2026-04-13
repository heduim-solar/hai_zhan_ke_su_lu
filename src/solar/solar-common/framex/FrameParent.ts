import FrameNode from "@/FrameNode";
import ArrayUtil from "@/ArrayUtil";

export default class FrameParent extends FrameNode {
    protected children: FrameNode[] = [];

    constructor() {
        super();
    }

    attachChild(...node: FrameNode[]) {
        this.children.push(...node)
        this.layout()
    }

    attachChilds(nodes: FrameNode[]) {
        this.children.push(...nodes)
        this.layout()
    }

    detachChild(node: FrameNode): boolean {
        if (node == null) {
            return false
        }
        return ArrayUtil.removeElement(this.children, node)
    }

    detachAllChildren() {
        this.children = [];
    }


    layout() {
        for (let i = 0; i < this.children.length; i++) {
            let child: FrameNode = this.children[i];
            if (child instanceof FrameParent) {
                (child as (FrameParent)).layout();
            }
        }
    }


}