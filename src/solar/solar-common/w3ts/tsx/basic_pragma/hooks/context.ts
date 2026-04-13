/** @noSelfInFile **/

import { ClassComponent } from "../reconciler";
import { HookState } from "./types";

interface HookContext {
	currentInstance: ClassComponent<unknown>;
	currentIndex: number;
}

export const hookContext = {} as HookContext;

export const hookMap = new WeakMap<
	ClassComponent<unknown>,
	// eslint-disable-next-line @typescript-eslint/no-explicit-any
	HookState<any, unknown>[]
>();
