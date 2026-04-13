
import {ComponentType} from "./Component";
import {TEXT_ELEMENT} from "./common";
import {compact, getLength} from "./utils/arrays";

export interface VNode<P> {
    type: string | ComponentType<P>;
    props: P & { children?: Children };
    key?: string | number;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type Child = VNode<any> | string | boolean | null | undefined;

export type Children = (Child[] | Child)[];

export const isChild = (obj: Children | Child): obj is Child =>
    (typeof obj === "object" &&
        obj != null &&
        "type" in obj &&
        "props" in obj) ||
    typeof obj === "boolean" ||
    typeof obj === "string";

// eslint-disable-next-line @typescript-eslint/no-explicit-any
type RenderableChildElement = VNode<any> | string;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const processChildren = (children: Children): VNode<any>[] =>
    compact(compact(children).flat())
        .filter(
            (c): c is RenderableChildElement =>
                typeof c !== "boolean" &&
                // filters out empty objects which are left because Array.flat() is not correct
                (typeof c === "string" || !!c.type),
        )
        .map((c) => (typeof c === "string" ? createTextElement(c) : c));

const EMPTY_OBJECT = {};
export type EmptyObject = typeof EMPTY_OBJECT;

export function createElement<P>(
    type: string | ComponentType<P>,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    config: P & { key?: string | number; children?: VNode<any>[] },
    ...children: Children
): VNode<P>;
export function createElement(
    type: string | ComponentType<typeof EMPTY_OBJECT>,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    config?: { key?: string | number; children?: VNode<any>[] },
    ...children: Children
): VNode<typeof EMPTY_OBJECT>;

export function createElement<P>(
    type: string | ComponentType<P>,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    config: P & { key?: string | number; children?: VNode<any>[] },
    ...children: Children
): VNode<P> {
    const {key = null, ...props} = {...config};
    const flattenedChildren = processChildren(
        children && getLength(children) > 0 ? children : [],
    );

    if (flattenedChildren.length > 0) props.children = flattenedChildren as any;
    else delete props.children;

    // IDK why this is mad, prop is LocalP - key + children, which should work...
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    const vnode: VNode<P> = {type, props} as any;

    // Only set key if not nullish
    if (key != null) vnode.key = key;

    return vnode;
}

function createTextElement(value: string): VNode<{ nodeValue: string }> {
    return createElement(TEXT_ELEMENT, {nodeValue: value});
}

export const Fragment = ({
                             children,
                         }: {
    children?: Children;
}): Children | null => children ?? null;
