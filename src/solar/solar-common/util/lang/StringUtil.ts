export default class StringUtil {


    /**
     * 是否是空的字符串
     * @param str
     */
    static isEmpty(str: string): boolean {
        if (str == null || str == "") {
            return true
        }
        return false
    }

    /**
     * 是否 不是空的字符串
     * @param str
     */
    static notEmpty(str: string): boolean {
        return !StringUtil.isEmpty(str);
    }

    /**
     * 返回一个以定点表示法表示数字的字符串。
     * @param num
     * @param fractionDigits
     */
    toFixed(num: number, fractionDigits: number = 2): string {
        let stringTs: NoSelf = string as NoSelf
        let lm = stringTs.format("%." + fractionDigits + "f", num);
        return lm;
    }



    /**获取字符的字节数*/
    public static getBytes(char: string) {
        let code: number = string.byte(char);
        return StringUtil.getBytesByCode(code);
    }

    /**获取字符的字节数*/
    public static getBytesByCode(code: number): number {
        if (!code) return 0;
        if (code > 240) {
            return 4;
        } else if (code > 225) {
            return 3;
        } else if (code > 192) {
            return 2;
        } else {
            return 1;
        }
    }

    /**获取字符串的长度*/
    public static getLength(str: string) {
        let length: number = 0;
        let currentIndex: number = 1;
        while (currentIndex <= str.length) {
            let code: number = string.byte(str, currentIndex);
            currentIndex = currentIndex + StringUtil.getBytesByCode(code);
            length++;
        }
        return length;
    }

    /**截取子字符串(索引从1开始)*/
    public static subString(str: string, start: number, end?: number): string {
        let tempStr: string = str;
        let byteStart: number = 1;
        let byteEnd: number = -1;
        let index: number = 0;
        let bytes: number = 0;
        start = math.max(start, 1);
        end = end ?? -1;
        while (tempStr.length > 0) {
            if (index == start - 1) {
                byteStart = bytes + 1;
            } else if (index == end) {
                byteEnd = bytes;
                break;
            }
            let code: number = string.byte(tempStr);
            bytes += StringUtil.getBytesByCode(code);
            tempStr = string.sub(str, bytes + 1);
            index++;
        }
        return string.sub(str, byteStart, byteEnd);
    }

    /**获取字符串(索引从1开始)*/
    public static getCharAtIndex(str: string, index: number): string {
        return StringUtil.subString(str, index, index);
    }

}