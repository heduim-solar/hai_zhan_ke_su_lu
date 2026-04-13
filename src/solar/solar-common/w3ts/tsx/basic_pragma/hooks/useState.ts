/** @noSelfInFile **/

import { useReducer } from "./useReducer";

export const useState = <S>(
	initialState: S,
): [S, (nextState: S | ((oldState: S) => S)) => void] =>
	useReducer((oldState, v) => {
		if (typeof v !== "function") return v;
		return (v as (oldState: S) => S)(oldState);
	}, initialState);

export const useForceUpdate = (): (() => void) => {
	const [, setTick] = useState(0);
	const update = () => {
		setTick((tick: number) => tick + 1);
	};
	return update;
};
