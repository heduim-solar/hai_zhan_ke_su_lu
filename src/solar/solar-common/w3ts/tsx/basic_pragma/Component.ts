/** @noSelfInFile **/

import { Child, Children } from "./element";
import { ClassComponent } from "./reconciler";

export type FunctionalComponent<P> = (
	props: P & { children?: Children; key?: string | number },
) => Children | Child;

export type ComponentType<P> =
	| (new (
			props: P & { children?: Children; key?: string | number },
	  ) => ClassComponent<P>)
	| FunctionalComponent<P>;
