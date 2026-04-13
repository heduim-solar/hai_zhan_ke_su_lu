/**
 * 776京
 * 215.6涧
 * 10**38
 * 1、万：10的四次方。
 * 2、亿：10的八次方。
 * 3、兆：10的12次方。
 * 4、京：10的16次方。
 * 5、垓：10的20次方。
 * 6、秭：10的24次方。
 * 7、壤：10的28次方。
 */
export default class TextUtil {
    static config = {
        //中文单位 以万跨度 排列
        cnUnit: ["万", "亿", "兆", "京", "垓", "秭", "穰", "沟", "涧"]
    }


    /**
     * 将数字转换为中文数字
     * @param num
     * @param keepDecimalPoint 保留小数位
     * @param maxDigit 最大数字显示位数 不得小于4
     */
    static toCnUnit(num: number, keepDecimalPoint = true, maxDigit = 4): string {
        let cnUnit = "";
        let index = 0
        for (; index < TextUtil.config.cnUnit.length; index++) {
            if (math.abs(num) < 10000) {
                break;
            }
            num = num / 10000;
            cnUnit = TextUtil.config.cnUnit[index];
        }
        if (!keepDecimalPoint) {
            num = math.floor(num);
        } else {
            let numStr = num + "";
            let indexOf = numStr.indexOf(".");
            if (indexOf < maxDigit) {
                numStr = numStr.substring(0, maxDigit + 1)
                if (numStr.endsWith(".000") || numStr.endsWith(".00") || numStr.endsWith(".0")) {
                    numStr = numStr.substring(0, indexOf)
                }
                return numStr + cnUnit;
            } else if (indexOf == maxDigit) {
                num = math.floor(num);
            }
        }
        return num + cnUnit;
    }

    /**
     * 将小数转换为百分比
     * @param num
     * @param decimalPrecision
     */
    static toPercentage(num: number, decimalPrecision = 0): string {
        if (num == null) {
            return "0%";
        }
        num *= 100;
        if (decimalPrecision == 0) {
            return math.floor(num) + "%";
        }
        let percentageStr = num + "";
        let pointIndex = percentageStr.indexOf(".");
        if (pointIndex >= 0 && (percentageStr.length - pointIndex) > decimalPrecision) {
            return percentageStr.substring(0, pointIndex + decimalPrecision + 1) + "%";
        }
        return percentageStr + "%";
    }


    /**
     * 移除一个文本的 |cxxx颜色
     * @param value
     */
    static removeColors(value: string): string {
        if (value == null) {
            return value;
        } else {
            let color;
            while (value.indexOf("|c") >= 0) {
                color = value.substring(value.indexOf("|c"), value.indexOf("|c") + 10);
                value = value.replaceAll(color, "");
            }
            while (value.indexOf("|C") >= 0) {
                color = value.substring(value.indexOf("|C"), value.indexOf("|C") + 10);
                value = value.replaceAll(color, "");
            }
            value = value.replaceAll("|r", "");
            return value;
        }
    }

    static leftPad(value: string, totalLength: number, pad: string): string {
        for (let i = totalLength - value.length; i > 0; --i) {
            value = pad + value;
        }
        return value;
    }

    static rightPad(value: string, totalLength: number, pad: string): string {
        for (let i = totalLength - value.length; i > 0; --i) {
            value = value + pad;
        }
        return value;
    }

}
