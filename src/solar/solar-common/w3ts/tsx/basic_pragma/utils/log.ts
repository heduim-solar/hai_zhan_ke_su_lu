import {colorize} from "./colorize";

const MAX_WIDTH = 78;
const TRAILING_COMMA = false;
const INDENT = "  ";
const INDENT_WIDTH = INDENT.length;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const isArray = (v: any): boolean => {
	if (typeof v !== "object") return false;

	// Lua uses 1 as the starter index
	return (
		Object.keys(v).every(
			(v, index) => parseInt(v as string) === index + 1 || parseInt(v as string) === index,
		) &&
		(v[0] != null || v[1] != null)
	);
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
const userdataType = (userdata: Record<string, any>): string => {
	const typeString = userdata.toString();
	return typeString.slice(0, typeString.indexOf(":"));
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any, @typescript-eslint/explicit-module-boundary-types
export const termToString = (v: any, color = true, level = 0): string => {
	if (typeof v === "string") return color ? colorize.string(`"${v}"`) : v;
	if (typeof v === "number") return color ? colorize.number(v) : v.toString();
	if (typeof v === "boolean")
		return color ? colorize.boolean(v) : v.toString();
	if (typeof v === "function")
		return color ? colorize.number("<function>") : "<function>";
	if (v == null) return color ? colorize.boolean("null") : "null";

	if (isArray(v)) {
		// eslint-disable-next-line @typescript-eslint/no-explicit-any
		const arr = v as Array<any>;

		// A minimum; "[ 0 ]".length = 5, "{ 0, 1 }".length = 8, etc
		let tryingCompact = level + arr.length * 3 + 2 < MAX_WIDTH;
		let compact = "[" + (arr.length ? " " : "");

		for (let i = 0; i < arr.length && tryingCompact; i++) {
			compact +=
				termToString(arr[i], color, level + 1) +
				(i < arr.length - 1 ? ", " : "");

			if (compact.length > MAX_WIDTH) tryingCompact = false;
		}
		if (tryingCompact) {
			compact += (arr.length ? " " : "") + "]";
			if (compact.length <= MAX_WIDTH) return compact;
		}

		return [
			"[",
			arr
				.map(
					(element) =>
						INDENT.repeat(level + 1) +
						termToString(element, color, level + 1),
				)
				.join(",\n") + (TRAILING_COMMA ? "," : ""),
			INDENT.repeat(level) + "]",
		].join("\n");

		// return `[ ${arr
		// 	// eslint-disable-next-line @typescript-eslint/no-explicit-any
		// 	.map((v: any) => termToString(v, color, level + 1))
		// 	.join(", ")} ]`;
	}

	if (typeof v === "object" && v != null) {
		const entries = Object.entries(v);
		let tryingCompact =
			level * INDENT_WIDTH + entries.length * 3 + 2 < MAX_WIDTH;

		if (tryingCompact) {
			let compact = "{" + (entries.length > 0 ? " " : "");
			for (let i = 0; i < entries.length && tryingCompact; i++) {
				const [key, value] = entries[i];

				compact +=
					key +
					": " +
					termToString(value, color, level + 1) +
					(i < entries.length - 1 ? ", " : "");

				if (level * INDENT_WIDTH + compact.length > MAX_WIDTH)
					tryingCompact = false;
			}

			if (tryingCompact) {
				compact += (entries.length ? " " : "") + "}";
				if (level * INDENT_WIDTH + compact.length <= MAX_WIDTH)
					return compact;
			}
		}

		return [
			"{",
			entries
				.map(([key, value]) => {
					const prefix = key + ": ";
					return (
						INDENT.repeat(level + 1) +
						prefix +
						termToString(value, color, level + 1)
					);
				})
				.join(",\n") + (TRAILING_COMMA ? "," : ""),
			INDENT.repeat(level) + "}",
		].join("\n");
	}

	const type = userdataType(v);

	const str = `<${type}>`;
	return color ? colorize.handle(str) : str;
};

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const log = (...args: Array<any>): void =>
	args
		.map((v) => termToString(v))
		.join(" ")
		.split("\n")
		.forEach((line) => print(line));
