import {Frame} from "@/frame";

export default class ColorUtil {

    static config: {
        [id: string]: string
    } = {
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
        black: "|CFF000000",
    };


    static getColor(g: string): string {
        return ColorUtil.config[g];
    }

    /**
     * 根据rgb 获得 整数类型的颜色
     * @param r
     * @param g
     * @param b
     */
    static getColorIntByRGB(r: number, g: number, b: number): number {
        return 255 * 0x1000000 + r * 0x10000 + g * 0x100 + b
    }


    static getTextColor(key?: string): string {
        if (!key || key == '') {
            return '|CFFFFFFFF';
        }

        if (key == 'C') {
            return '|cff66ff00';
        }

        if (key == 'B') {
            return '|cff0042ff';
        }

        if (key == 'A') {
            return '|cffbe00fe';
        }

        if (key == 'S') {
            return '|cffff0303';
        }

        if (key == 'SS') {
            return '|cfffe8a0e';
        }

        return '|CFFFFFFFF';
    }

    static getTextColorByNumber(key?: number): string {

        if (!key || key == 0) {
            return '|CFFFFFFFF';
        }

        if (key <= 10) {
            return '|CFF0042FF';
        }

        if (key <= 20) {
            return '|CFFBE00FE';
        }

        if (key <= 30) {
            return '|CFFFF0303';
        }

        if (key <= 40) {
            return '|CFFFE8A0E';
        }

        if (key <= 50) {
            return '|CFF000000';
        }

        return '|CFFFFFFFF';
    }
}