export const hex = {
	mana: 0xc3dbff,
	health: 0x00ff00,
	healthHigh: 0x00ff00,
};

const color = {
	red: "|cffff0303",
	blue: "|cff0042ff",
	teal: "|cff1ce6b9",
	purple: "|cff540081",
	yellow: "|cfffffc00",
	orange: "|cfffe8a0e",
	green: "|cff20c000",
	pink: "|cffe55bb0",
	gray: "|cff959697",
	lightblue: "|cff7ebff1",
	darkgreen: "|cff106246",
	brown: "|cff4a2a04",

	maroon: "|cff9b0000",
	navy: "|cff0000c3",
	turquoise: "|cff00eaff",
	violet: "|cffbe00fe",
	wheat: "|cffebcd87",
	peach: "|cfff8a48b",
	mint: "|cffbfff80",
	lavender: "|cffdcb9eb",
	coal: "|cff282828",
	snow: "|cffebf0ff",
	emerald: "|cff00781e",
	peanut: "|cffa46f33",

	sheepblue: "|CFF3F81F8",
	wolfred: "|CFFC00040",
	gold: "|CFFD9D919",

	string: "|cffce915b",
	number: "|cffdcdc8b",
	boolean: "|cff569cd6",
	white: "|cffffffff",
	handle: "|cff7ebff1",
};

export type Color = keyof typeof color;

// eslint-disable-next-line @typescript-eslint/no-explicit-any
export const colorize = {} as Record<Color, (v: any) => string>;
Object.entries(color).forEach(
	([color, code]) =>
		// eslint-disable-next-line @typescript-eslint/no-explicit-any
		(colorize[color as Color] = (string: any): string =>
			`${code}${string}|r`),
);
