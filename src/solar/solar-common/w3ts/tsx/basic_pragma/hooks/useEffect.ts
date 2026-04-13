/** @noSelfInFile **/

import { hookContext, hookMap } from "./context";
import { Inputs, argsChanged } from "./helpers";
import { HookState } from "./types";
import "./reconcilerHooks";

export const useEffect = <I extends Inputs>(
	callback: () => void | (() => void),
	inputs?: I,
): void => {
	const index = hookContext.currentIndex++;
	const hooks = hookMap.get(hookContext.currentInstance)!;
	const oldState = hooks[index];
	const state = (oldState ??
		(hooks[index] = { type: "effect" })) as HookState<I>;

	if (state.type !== "effect")
		throw `Expected an effect hook at index ${index}, got ${state.type}`;

	if (
		!oldState ||
		(state.lastInputs && inputs && argsChanged(state.lastInputs, inputs))
	) {
		if (state.cleanup) state.cleanup();
		state.lastInputs = inputs;
		state.cleanup = callback();
	}
};
