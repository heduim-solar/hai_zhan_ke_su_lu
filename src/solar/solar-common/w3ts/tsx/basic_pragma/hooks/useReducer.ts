/** @noSelfInFile **/

import { hookContext, hookMap } from "./context";
import { HookState } from "./types";
import "./reconcilerHooks";

export const useReducer = <S, A>(
	reducer: (prevState: S, action: A) => S,
	initialState: S,
): [S, (action: A) => void] => {
	const index = hookContext.currentIndex++;
	const hooks = hookMap.get(hookContext.currentInstance)!;
	const state = (hooks[index] ??
		(hooks[index] = { type: "reducer" })) as HookState<S, A>;

	if (state.type !== "reducer")
		throw `Expected a reducer hook at index ${index}, got ${state.type}`;

	state.reducer = reducer;

	if (!state.instance) {
		state.value = [
			initialState,
			(action: A) => {
				const nextValue = state.reducer!(state.value![0], action);
				if (state.value![0] !== nextValue) {
					state.value = [nextValue, state.value![1]];
					state.instance!.setState({});
				}
			},
		];

		state.instance = hookContext.currentInstance;
	}

	return state.value!;
};
