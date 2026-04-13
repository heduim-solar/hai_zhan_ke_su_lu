import RandomUtil from "@/RandomUtil";

/** @noSelf **/
export default class TextTagUtil {


    /**
     * 推荐使用此方式
     * @param text
     * @param unit
     * @param fontSize
     * @param lifespan
     * @param red
     * @param green
     * @param blue
     */
    static text(text: string, unit: unit, fontSize = 12, lifespan = 2, red: number = 255, green: number = 255, blue: number = 255): texttag {
        let textTagHandle = CreateTextTag();
        SetTextTagColor(textTagHandle, red, green, blue, 255);
        SetTextTagPos(textTagHandle, GetUnitX(unit) - (fontSize * 8), GetUnitY(unit), 150);
        fontSize = fontSize * 0.0023;
        SetTextTagText(textTagHandle, text, fontSize);
        SetTextTagVelocity(textTagHandle, 0, 0.04);
        SetTextTagPermanent(textTagHandle, false);
        if (lifespan > 0) {
            SetTextTagLifespan(textTagHandle, lifespan);
        }
        return textTagHandle
    }

    static textInfo(text: string, unit: unit, fontSize = 12, lifespan = 2): texttag {
        return TextTagUtil.text(text, unit, fontSize, lifespan, 200, 200, 200)
    }

    /**
     * 警告信息
     * @param text
     * @param unit
     * @param fontSize
     * @param lifespan
     */
    static textWarn(text: string, unit: unit, fontSize = 12, lifespan = 2): texttag {
        return TextTagUtil.text(text, unit, fontSize, lifespan, 255, 0, 0)
    }

    /**
     * 成功信息
     * @param text
     * @param unit
     * @param fontSize
     * @param lifespan
     */
    static textSuccess(text: string, unit: unit, fontSize = 12, lifespan = 2): texttag {
        return TextTagUtil.text(text, unit, fontSize, lifespan, 50, 255, 50)
    }

    /**
     * 失败信息
     * @param text
     * @param unit
     * @param fontSize
     * @param lifespan
     */
    static textFail(text: string, unit: unit, fontSize = 12, lifespan = 2): texttag {
        return TextTagUtil.text(text, unit, fontSize, lifespan, 255, 0, 0)
    }

    static textGold(text: string, unit: unit, fontSize = 12, lifespan = 2): texttag {
        return TextTagUtil.text(text, unit, fontSize, lifespan, 255, 208, 76)
    }

    static textLumber(text: string, unit: unit, fontSize = 12, lifespan = 2): texttag {
        return TextTagUtil.text(text, unit, fontSize, lifespan, 77, 208, 108)
    }

    static textExp(text: string, unit: unit, fontSize = 12, lifespan = 2): texttag {
        return TextTagUtil.text(text, unit, fontSize, lifespan, 53, 149, 196)
    }

    /**
     * 漂浮文字随机飘向
     * @param texttag
     */
    static setRandomVelocity(texttag: texttag) {
        SetTextTagVelocity(texttag, RandomUtil.nextLocalReal(-0.10, 0.10), RandomUtil.nextLocalReal(0.01, 0.10))
    }


}
