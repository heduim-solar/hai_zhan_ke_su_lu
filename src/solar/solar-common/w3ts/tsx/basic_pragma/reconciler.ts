/** @noSelfInFile **/

import {Adapter, adapter} from "./adapter";
import {ComponentType, FunctionalComponent as FunctionalComponentType,} from "./Component";
import {Child, Children, isChild, processChildren, VNode} from "./element";
import {isLua, TEXT_ELEMENT} from "./common";
import {compact} from "./utils/arrays";

export const hooks = {
    // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
    beforeRender: (instance: ClassComponent<any>): void => {
        /* do nothing */
    },
    // eslint-disable-next-line @typescript-eslint/no-unused-vars, @typescript-eslint/no-explicit-any
    beforeUnmount: (instance: ClassComponent<any>): void => {
        /* do nothing */
    },
};

/**
 * A fleshed out vdom, with pointers to instantiated components or frames.
 */
export interface Instance<T, P> {
    // FunctionComponents are dynamically converted into ClassComponents
    component?: ClassComponent<P> | undefined;
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    childInstances: Array<Instance<T, any>>;
    hostFrame?: T;
    vnode: VNode<P>;
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const containerMap = new WeakMap<any, Instance<any, any>>();

export function render<T, P>(vnode: VNode<P> | any, container: T): void {
    const prevInstance = containerMap.get(container) ?? null;
    const nextInstance = reconcile(container, prevInstance, vnode);
    containerMap.set(containerMap, nextInstance);
}

export function reconcile<T, InstanceProps>(
    parentFrame: T | undefined,
    instance: Instance<T, InstanceProps> | null,
    vnode: null,
): null;
export function reconcile<T, VNodeProps, InstanceProps>(
    parentFrame: T | undefined,
    instance: Instance<T, InstanceProps> | null,
    vnode: VNode<VNodeProps>,
): Instance<T, VNodeProps>;
export function reconcile<T, VNodeProps, instanceProps>(
    parentFrame: T | undefined,
    instance: Instance<T, instanceProps> | null,
    vnode: VNode<VNodeProps> | null,
): Instance<T, VNodeProps> | null {
    try {
        if (!instance) {
            // vnode is null if we're deleting something; we can't delete
            // something if there's no instance
            if (!vnode) return null;

            // Create instance
            return instantiate(vnode, parentFrame);
        } else if (!vnode) {
            // Remove instance
            cleanupFrames(instance);
            return null;
        } else if (instance.vnode.type !== vnode.type) {
            // Replace instance
            const newInstance = instantiate(vnode, parentFrame);
            cleanupFrames(instance);
            return newInstance;
        } else {
            // This assumes .type equality => Prop type equality
            // eslint-disable-next-line @typescript-eslint/no-explicit-any
            const instanceOfSameType = (instance as any) as Instance<T,
                VNodeProps>;

            // vnode for a host frame
            if (typeof vnode.type === "string") {
                // Update host vnode
                adapter.updateFrameProperties(
                    instance.hostFrame,
                    instance.vnode.props,
                    vnode.props,
                );

                instanceOfSameType.childInstances = reconcileChildren(
                    instanceOfSameType,
                    vnode,
                );

                // vnode for a compositional frame (class/functional component)
            } else if (instanceOfSameType.component) {
                instanceOfSameType.component.props = vnode.props;

                try {
                    hooks.beforeRender(instanceOfSameType.component);
                } catch (err) {
                    print(err);
                    cleanupFrames(instance);
                    throw err;
                }

                const rendered = instanceOfSameType.component.render(
                    vnode.props,
                );

                const children = isChild(rendered)
                    ? rendered
                        ? [rendered]
                        : []
                    : rendered;

                instanceOfSameType.childInstances = reconcileChildren(
                    instanceOfSameType,
                    vnode,
                    children,
                );
            }

            instanceOfSameType.vnode = vnode;
            return instanceOfSameType;
        }
    } catch (err) {
        // TODO: log this error, but in a JavaScript/Lua general way...
        print(err);
        return null;
    }
}

// eslint-disable-next-line @typescript-eslint/no-explicit-any
function cleanupFrames<T>(instance: Instance<T, any>) {
    if (instance.component) hooks.beforeUnmount(instance.component);

    if (instance.childInstances)
        for (const child of instance.childInstances)
            if (child != null) cleanupFrames(child);

    if (instance.hostFrame) adapter.cleanupFrame(instance.hostFrame);
}

function reconcileChildren<T, P>(
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    instance: Instance<T, any>,
    vnode: VNode<P>,
    children = vnode.props.children,
) {
    const hostFrame = instance.hostFrame;
    const childInstances = instance.childInstances;
    const nextChildElements = processChildren(children || []);
    const newChildInstances = [];
    const count = Math.max(childInstances.length, nextChildElements.length);
    // TODO: add support for keys
    for (let i = 0; i < count; i++) {
        const childInstance = childInstances[i];
        const childElement = nextChildElements[i];
        const newChildInstance = reconcile(
            hostFrame,
            childInstance,
            childElement,
        );
        if (newChildInstance != null) newChildInstances.push(newChildInstance);
    }
    return newChildInstances;
}

function instantiate<T, P>(
    vnode: VNode<P>,
    parentFrame: T | undefined,
): Instance<T, P> {
    const {type, props} = vnode;

    if (typeof type === "string") {
        if (type === TEXT_ELEMENT) throw "Cannot create inline text, yet";
        // Instantiate host vnode
        const frame = (adapter as Adapter<T>).createFrame(
            type,
            parentFrame,
            props,
        );
        const childElements = processChildren(props.children || []);
        const childInstances = childElements.map((child) =>
            instantiate(child, frame),
        );
        const instance: Instance<T, P> = {
            hostFrame: frame,
            vnode,
            childInstances,
        };
        // Apply props after instantiating children
        adapter.updateFrameProperties(frame, {}, props);
        return instance;
    } else {
        // Instantiate component vnode
        const instance = {vnode} as Instance<T, P>;
        instance.component = createPublicInstance(vnode, instance);

        try {
            hooks.beforeRender(instance.component);
        } catch (err) {
            print(err);
        }

        const rendered = instance.component.render(props) ?? [];
        const childElements = isChild(rendered) ? [rendered] : rendered;

        instance.childInstances = compact(childElements)
            .filter(
                // eslint-disable-next-line @typescript-eslint/no-explicit-any
                (child): child is VNode<any> => typeof child === "object",
            )
            .map((child) => instantiate(child, parentFrame));

        return instance;
    }
}

const functionalComponentClasses = new WeakMap<// eslint-disable-next-line @typescript-eslint/no-explicit-any
    FunctionalComponentType<any>,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    new (props: any) => ClassComponent<any>>();

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const isClass = (constructor: ComponentType<any>) => {
    if (isLua) return typeof constructor !== "function";
    else return "prototype" in constructor;
};

function createPublicInstance<T, S, P>(
    vnode: VNode<P>,
    internalInstance: Instance<T, P>,
): ClassComponent<P, S, T> {
    const {type: ComponentType, props} = vnode;
    let constructor;
    if (typeof ComponentType === "string")
        throw "Tried createPublicInstance() with string";
    else if (isClass(ComponentType))
        // ComponentType.prototype && "render" in ComponentType.prototype)
        constructor = ComponentType as new (props: P) => ClassComponent<P,
            S,
            T>;
    else {
        const renderFunc = ComponentType as FunctionalComponentType<P>;
        const existingClass = functionalComponentClasses.get(renderFunc);
        if (existingClass)
            constructor = existingClass as new (props: P) => ClassComponent<P,
                S,
                T>;
        else {
            // Wrap the dynamic class in an object to avoid all functional
            // components being ClassComponent
            constructor = class extends ClassComponent<P, S, T> {
                // get displayName() {
                // 	return renderFunc.name;
                // }
                render(props: P) {
                    return renderFunc(props);
                }
            };
            functionalComponentClasses.set(renderFunc, constructor);
        }
    }

    const publicInstance = new constructor(props);
    publicInstance.instance = internalInstance;
    return publicInstance;
}

const instanceMap = new WeakMap<// eslint-disable-next-line @typescript-eslint/no-explicit-any
    ClassComponent<any>,
    // eslint-disable-next-line @typescript-eslint/no-explicit-any
    Instance<any, any>>();

const scheduledUpdates = new Set<Instance<unknown, unknown>>();
const scheduleUpdate = <T>(instance: Instance<T, unknown>) => {
    scheduledUpdates.add(instance);
    adapter.scheduleUpdate();
};

export abstract class ClassComponent<P, S = unknown, T = unknown> {
    state = {} as S;

    constructor(public props: P) {
    }

    setState(partialState: Partial<S>): void {
        this.state = {...this.state, ...partialState};
        const instance = instanceMap.get(this)!;
        if (instance) scheduleUpdate(instance);
    }

    set instance(instance: Instance<T, P>) {
        instanceMap.set(this, instance);
    }

    abstract render(props: P): Children | Child;
}

function updateInstance<T>(internalInstance: Instance<T, unknown>) {
    const vnode = internalInstance.vnode;
    reconcile(null, internalInstance, vnode);
}

export const flushUpdates = (): void => {
    for (const instance of scheduledUpdates.values()) updateInstance(instance);
    scheduledUpdates.clear();
};

export const test = {functionalComponentClasses};
