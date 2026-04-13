export default class NativeFrameUtil {

    /*** 获取金币文本 */
    static getGoldText(): number {
        return DzSimpleFontStringFindByName("ResourceBarGoldText", 0);
    }

    /*** 获取木材文本 */
    static getLumberText(): number {
        return DzSimpleFontStringFindByName("ResourceBarLumberText", 0);
    }

    /*** 获取人口文本 */
    static getSupplyText(): number {
        return DzSimpleFontStringFindByName("ResourceBarSupplyText", 0);
    }

    /*** 获取物品名称 */
    static getItemName(): number {
        return DzSimpleFontStringFindByName("SimpleItemNameValue", 3);
    }

    /*** 获取物品说明*/
    static getItemTips(): number {
        return DzSimpleFontStringFindByName("SimpleItemDescriptionValue", 3);
    }

    /*** 单位状态攻击面板 */
    static getUnitStatePanel(): number {
        return DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0);
    }

    /*** 英雄面板父对象*/
    static getHeroStatePanel(): number {
        return DzSimpleFrameFindByName("SimpleInfoPanelIconHeroText", 6);
    }

    /*** 英雄主属性父对象*/
    static getHeroPanel(): number {
        return DzSimpleFrameFindByName("SimpleInfoPanelIconHero", 6);
    }

    /*** 获取单位名称*/
    static getUnitName(): number {
        return DzSimpleFontStringFindByName("SimpleNameValue", 0);
    }

    /*** 获取英雄称谓*/
    static getUnitClass(): number {
        return DzSimpleFontStringFindByName("SimpleClassValue", 0);
    }

    /*** 获取单位攻击图标*/
    static getUnitAttackIcon(index: number): number {
        return DzSimpleTextureFindByName("InfoPanelIconBackdrop", index);
    }

    /*** 单位攻击标签*/
    static getUnitAttackLabel(index: number): number {
        return DzSimpleFontStringFindByName("InfoPanelIconLabel", index);
    }

    /*** 单位攻击数值*/
    static getUnitAttackValue(index: number): number {
        return DzSimpleFontStringFindByName("InfoPanelIconValue", index);
    }

    /*** 获取单位护甲图标*/
    static getUnitArmorIcon(): number {
        return DzSimpleTextureFindByName("InfoPanelIconBackdrop", 2);
    }

    /*** 单位护甲标签*/
    static getUnitArmorLabel(): number {
        return DzSimpleFontStringFindByName("InfoPanelIconLabel", 2);
    }

    /*** 单位护甲数值*/
    static getUnitArmorValue(): number {
        return DzSimpleFontStringFindByName("InfoPanelIconValue", 2);
    }

    /*** 获取单位*/
    static getUnitAttack2Icon(): number {
        return DzSimpleTextureFindByName("InfoPanelIconBackdrop", 5);
    }

    /*** 英雄主属性图标*/
    static getHeroPanelIcon(): number {
        return DzSimpleTextureFindByName("InfoPanelIconHeroIcon", 6);
    }

    /*** 获取生命周期条*/
    static getProgressBar(): number {
        return DzSimpleFrameFindByName("SimpleProgressIndicator", 0);
    }

    /*** 获取英雄经验条*/
    static getHeroLevelBar(): number {
        return DzSimpleFrameFindByName("SimpleHeroLevelBar", 0);
    }

    /*** 英雄属性数值*/
    static getHeroStrValue(): number {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroStrengthValue", 6);
    }

    static getHeroAgiValue(): number {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroAgilityValue", 6);
    }

    static getHeroIntValue(): number {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroIntellectValue", 6);
    }

    /*** 英雄属性标签*/

    static getHeroStrLabel(): number {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroStrengthLabel", 6);
    }

    static getHeroAgiLabel(): number {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroAgilityLabel", 6);
    }

    static getHeroIntLabel(): number {
        return DzSimpleFontStringFindByName("InfoPanelIconHeroIntellectLabel", 6);
    }

    /*** 英雄属性标签 带参数  */
    static getHeroStateLabel(index: number): number {
        if (index == 1) {
            return NativeFrameUtil.getHeroStrLabel();
        } else if (index == 2) {
            return NativeFrameUtil.getHeroAgiLabel();
        } else if (index == 3) {
            return NativeFrameUtil.getHeroIntLabel();
        }
        return 0;
    }

    /*** 英雄属性数值 带参数 */
    static getHeroStateValue(index: number): number {
        if (index == 1) {
            return NativeFrameUtil.getHeroStrValue();
        } else if (index == 2) {
            return NativeFrameUtil.getHeroAgiValue();
        } else if (index == 3) {
            return NativeFrameUtil.getHeroIntValue();
        }
        return 0
    }



    /*** 单位信息面板 */
    static getUnitDetail(): number {
        return DzSimpleFrameFindByName("SimpleInfoPanelUnitDetail", 0);
    }
}