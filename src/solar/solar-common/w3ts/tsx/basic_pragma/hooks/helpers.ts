/** @noSelfInFile **/

export type Inputs = ReadonlyArray<unknown>;

export const argsChanged = (oldArgs: Inputs, newArgs: Inputs): boolean =>
	oldArgs.length !== newArgs.length ||
	newArgs.some((arg, index) => arg !== oldArgs[index]);
