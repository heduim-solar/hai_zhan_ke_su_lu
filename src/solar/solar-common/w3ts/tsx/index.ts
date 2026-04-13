/** @noSelfInFile **/

import {adapter} from "./adapter";
import {setAdapter, VNode} from "./basic_pragma";

setAdapter(adapter);
// eslint-disable-next-line @typescript-eslint/no-explicit-any
export type Node<T = any> = VNode<T> | null;

export {setPixelScale} from "./AdapterUtil";

export {data} from "./CreateFrameUtil";

export {
    Children,
    createElement,
    EmptyObject,
    Fragment,
    FunctionalComponent,
    render,
    useEffect,
    useForceUpdate,
    useRef,
    useState,
} from "./basic_pragma";

/**
 *  use case
 *  import * as React from "solar/w3ts/tsx";
 */


