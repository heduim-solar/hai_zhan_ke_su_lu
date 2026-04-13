import { isLua } from "../common";

export const getLength = <T>(arr: T[]): number =>
	isLua
		? Object.keys(arr).reduce((max, key) => {
				const keyAsNumber = parseInt(key);
				if (typeof keyAsNumber === "number")
					return max > keyAsNumber ? max : keyAsNumber;
				return max;
		  }, 0)
		: arr.length;

/**
 * Removes nils from the array
 */
export const compact = <T>(arr: (T | undefined | null)[]): T[] => {
	const length = getLength(arr);
	const newArr = [];
	for (let i = 0; i < length; i++) {
		const val = arr[i];
		if (val != null) newArr.push(val);
	}
	return newArr;
};

export const forEach = <T>(
	arr: T[],
	fn: (element: T, index: number) => void,
): void => {
	const length = getLength(arr);

	for (let i = 0; i < length; i++) fn(arr[i], i);
};
