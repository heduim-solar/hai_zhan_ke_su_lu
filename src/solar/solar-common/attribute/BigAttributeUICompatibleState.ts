import UnitUtil from "@/util/unit/UnitUtil";
import NativeFrameUtil from "@/util/frame/NativeFrameUtil";
import TextUtil from "@/util/text/TextUtil";
import {Trigger} from "@/w3ts/handles/trigger";
import ColorStr from "../constant/ColorStr";
import {Frame} from "@/w3ts/handles/frame";
import BaseUtil from "@/util/BaseUtil";
import SelectUtil from "@/util/unit/SelectUtil";
import HeroUtil from "@/util/unit/HeroUtil";
import ExFrameApiUtil from "../util/frame/ExFrameApiUtil";
import SingletonUtil from "../util/lang/SingletonUtil";
import UnitStateUtil from "@/UnitStateUtil";

const textFont = "Fonts\\dfst-m3u.ttf";
const textHeight = 0.01;
export default class BigAttributeUICompatibleState {
    static config = {
        //目前没有精准的办法 算出白字跟绿字的具体值 白字 绿字 受限于骰子数 英雄主属性加成 如开启显示白绿字  偶尔会有几点到几十点的误差 （ 玩家看到错误的白绿字体验会极差）
        isShowGreenAttack: false,//设置为false 则显示白字绿字的总和  这样能准确稳定
        isShowGreenArmor: false,
    }


    //
    static goldFrame: number;
    static lumberFrame: number;
    static hpFrame: number;
    static manaFrame: number;
    //
    //
    static unitUIContainer: number;
    static unitArmorContainer: number;
    static heroUIContainer: number;
    //
    static hpBackdropFrame: number;
    static manaBackdropFrame: number;
    //unit
    static attackValueFrame: number;
    static armorValueFrame: number;
    static heroStrValueFrame: number;
    static heroAgiValueFrame: number;
    static heroIntValueFrame: number;

    constructor() {
        if (SingletonUtil.notFirstTime(BigAttributeUICompatibleState)) {
            print("不能重复new BigAttributeUICompatibleState()")
            return;
        }
        BaseUtil.runLater(0.1, () => {
            this.moveNativeFrame();
            this.createUI();
            //
            let trigger = new Trigger();
            trigger.registerTimerEvent(0.1, true);
            trigger.addAction(this.refreshSolarUI)
        })

    }

    refreshSolarUI(this: void) {
        DzFrameSetText(BigAttributeUICompatibleState.goldFrame, TextUtil.toCnUnit(GetPlayerState(GetLocalPlayer(), PLAYER_STATE_RESOURCE_GOLD)))
        DzFrameSetText(BigAttributeUICompatibleState.lumberFrame, TextUtil.toCnUnit(GetPlayerState(GetLocalPlayer(), PLAYER_STATE_RESOURCE_LUMBER)))

        //
        let unit = SelectUtil.getRealSelectUnit();
        if (!IsHandle(unit)) {
            BigAttributeUICompatibleState.showSolarUI(false);
            return
        }
        if (HeroUtil.isHero(unit)) {
            BigAttributeUICompatibleState.showSolarUI(true, true);
        } else {
            BigAttributeUICompatibleState.showSolarUI(true, false);
        }

        //生命值
        let life = GetUnitState(unit, UNIT_STATE_LIFE);
        let maxLife = GetUnitState(unit, UNIT_STATE_MAX_LIFE);
        let bfbLife = R2I(life * 100 / maxLife)
        let hpText = TextUtil.toCnUnit(life) + "/" + TextUtil.toCnUnit(maxLife) + `(${bfbLife})%`
        if (bfbLife > 80) {
            hpText = ColorStr.green + hpText;
        } else if (bfbLife > 40) {
            hpText = ColorStr.yellow + hpText;
        } else {
            hpText = ColorStr.red + hpText;
        }
        DzFrameSetText(BigAttributeUICompatibleState.hpFrame, hpText)
        //魔法值
        let mana = GetUnitState(unit, UNIT_STATE_MANA);
        let maxMana = GetUnitState(unit, UNIT_STATE_MAX_MANA);
        if (maxMana && maxMana > 0) {
            let bfbMana = R2I(mana * 100 / maxMana) + "%"
            let manaText = TextUtil.toCnUnit(mana) + " / " + TextUtil.toCnUnit(maxMana) + `(${bfbMana})`
            DzFrameSetText(BigAttributeUICompatibleState.manaFrame, manaText)
        }

        let aAttack = GetUnitState(unit, UnitStateDamageMix)
        if (BigAttributeUICompatibleState.config.isShowGreenAttack) {
            let lvAttack = GetUnitState(unit, UnitStateDamageBonus)
            let bAttack = aAttack - lvAttack

            let blText = TextUtil.toCnUnit(bAttack)
            if (lvAttack > 0) {
                blText = blText + "  " + ColorStr.green + "+" + TextUtil.toCnUnit(lvAttack);
            } else if (lvAttack < -20) { //负攻击力 忽略100以下 //不计算骰子数奖励信息
                blText = blText + "  " + ColorStr.red + TextUtil.toCnUnit(lvAttack);
            }
            DzFrameSetText(BigAttributeUICompatibleState.attackValueFrame, blText)
        } else {
            DzFrameSetText(BigAttributeUICompatibleState.attackValueFrame, TextUtil.toCnUnit(aAttack))
        }

        //护甲
        let armorText = null;
        if (UnitStateUtil.isInvulnerable(unit)) {
            armorText = "|cffffffff无敌"
        } else if (BigAttributeUICompatibleState.config.isShowGreenArmor) {
            let extraDef = UnitUtil.getExtraDef(unit);
            armorText = TextUtil.toCnUnit(GetUnitState(unit, UnitStateArmor) - extraDef);
            if (extraDef > 0) {
                armorText = armorText + "  " + ColorStr.green + "+" + TextUtil.toCnUnit(extraDef);
            } else if (extraDef < 0) {
                armorText = armorText + "  " + ColorStr.red + TextUtil.toCnUnit(extraDef);
            }
        } else {
            armorText = TextUtil.toCnUnit(GetUnitState(unit, UnitStateArmor));
        }
        DzFrameSetText(BigAttributeUICompatibleState.armorValueFrame, armorText)
        //力量文本
        let bStr = GetHeroStr(unit, false)
        let blStr = GetHeroStr(unit, true)
        let strText = TextUtil.toCnUnit(bStr)
        if (bStr != blStr) {
            strText = strText + "  " + ColorStr.green + "+" + TextUtil.toCnUnit(blStr - bStr);
        }
        DzFrameSetText(BigAttributeUICompatibleState.heroStrValueFrame, strText)
        //敏捷文本
        let bAgi = GetHeroAgi(unit, false)
        let blAgi = GetHeroAgi(unit, true)
        let agiText = TextUtil.toCnUnit(bAgi)
        if (bAgi != blAgi) {
            agiText = agiText + "  " + ColorStr.green + "+" + TextUtil.toCnUnit(blAgi - bAgi);
        }

        DzFrameSetText(BigAttributeUICompatibleState.heroAgiValueFrame, agiText)
        //智力文本
        let bInt = GetHeroInt(unit, false)
        let blInt = GetHeroInt(unit, true)
        let intText = TextUtil.toCnUnit(bInt)
        if (bInt != blInt) {
            intText = intText + "  " + ColorStr.green + "+" + TextUtil.toCnUnit(blInt - bInt);
        }
        DzFrameSetText(BigAttributeUICompatibleState.heroIntValueFrame, intText)
    }


    /**
     * 创建太阳模拟UI
     */
    createUI() {
        /**
         * 创建跟随原生ui的ui容器
         */
        // let uid1 = AsyncUtil.getUUIDAsync();
        // let uid2 = AsyncUtil.getUUIDAsync();
        // let uid3 = AsyncUtil.getUUIDAsync();
        // let sfUnit = DzCreateSimpleFrame("_sl_simpleframe_and_frame", NativeFrameUtil.getUnitStatePanel(), uid1)
        // let sfUnitHj = DzCreateSimpleFrame("_sl_simpleframe_and_frame", , uid2)
        // let sfHero = DzCreateSimpleFrame("_sl_simpleframe_and_frame", NativeFrameUtil.getHeroStatePanel(), uid3)

        BigAttributeUICompatibleState.unitUIContainer = ExFrameApiUtil.createBaseFrameInSimpleFrame(NativeFrameUtil.getUnitStatePanel())
        BigAttributeUICompatibleState.unitArmorContainer = ExFrameApiUtil.createBaseFrameInSimpleFrame(DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 2))
        BigAttributeUICompatibleState.heroUIContainer = ExFrameApiUtil.createBaseFrameInSimpleFrame(NativeFrameUtil.getHeroStatePanel())


        /**
         *
         */
        // gold
        BigAttributeUICompatibleState.goldFrame = new Frame("TEXT").current;
        DzFrameSetAbsolutePoint(BigAttributeUICompatibleState.goldFrame, FRAMEPOINT_TOPRIGHT, 0.533, 0.595)
        DzFrameSetFont(BigAttributeUICompatibleState.goldFrame, textFont, textHeight, 0);

        BigAttributeUICompatibleState.lumberFrame = new Frame("TEXT").current;
        DzFrameSetAbsolutePoint(BigAttributeUICompatibleState.lumberFrame, FRAMEPOINT_TOPRIGHT, 0.621, 0.595)
        DzFrameSetFont(BigAttributeUICompatibleState.lumberFrame, textFont, textHeight, 0);
        // unit
        BigAttributeUICompatibleState.attackValueFrame = new Frame("TEXT", null, BigAttributeUICompatibleState.unitUIContainer).current;
        // DzFrameSetParent(BigAttributeUICompatibleState.attackValueFrame, NativeFrameUtil.getUnitAttackLabel(0))
        DzFrameSetAbsolutePoint(BigAttributeUICompatibleState.attackValueFrame, FRAMEPOINT_TOPLEFT, 0.35, 0.07)
        DzFrameSetFont(BigAttributeUICompatibleState.attackValueFrame, textFont, textHeight, 0);
        //
        BigAttributeUICompatibleState.armorValueFrame = new Frame("TEXT", null, BigAttributeUICompatibleState.unitArmorContainer).current;
        // DzFrameSetParent(BigAttributeUICompatibleState.armorValueFrame, NativeFrameUtil.getUnitArmorLabel())
        DzFrameSetAbsolutePoint(BigAttributeUICompatibleState.armorValueFrame, FRAMEPOINT_TOPLEFT, 0.35, 0.036)
        DzFrameSetFont(BigAttributeUICompatibleState.armorValueFrame, textFont, textHeight, 0);
        //
        BigAttributeUICompatibleState.heroStrValueFrame = new Frame("TEXT", null, BigAttributeUICompatibleState.heroUIContainer).current;
        DzFrameSetFont(BigAttributeUICompatibleState.heroStrValueFrame, textFont, textHeight, 0);
        DzFrameSetPoint(BigAttributeUICompatibleState.heroStrValueFrame, FRAMEPOINT_TOPLEFT, NativeFrameUtil.getHeroStrLabel(), FRAMEPOINT_BOTTOMLEFT,
            0.005, 0.0)
        //
        BigAttributeUICompatibleState.heroAgiValueFrame = new Frame("TEXT", null, BigAttributeUICompatibleState.heroUIContainer).current;
        // DzFrameSetParent(BigAttributeUICompatibleState.heroAgiValueFrame, NativeFrameUtil.getHeroStrLabel())
        DzFrameSetPoint(BigAttributeUICompatibleState.heroAgiValueFrame, FRAMEPOINT_TOPLEFT, NativeFrameUtil.getHeroAgiLabel(), FRAMEPOINT_BOTTOMLEFT,
            0.005, 0.0)
        DzFrameSetFont(BigAttributeUICompatibleState.heroAgiValueFrame, textFont, textHeight, 0);
        //
        BigAttributeUICompatibleState.heroIntValueFrame = new Frame("TEXT", null, BigAttributeUICompatibleState.heroUIContainer).current;
        DzFrameSetPoint(BigAttributeUICompatibleState.heroIntValueFrame, FRAMEPOINT_TOPLEFT, NativeFrameUtil.getHeroIntLabel(), FRAMEPOINT_BOTTOMLEFT,
            0.005, 0.0)
        DzFrameSetFont(BigAttributeUICompatibleState.heroIntValueFrame, textFont, textHeight, 0);
        /**
         * 生命值与魔法值
         */
        //使用黑色图片盖住原生生命魔法
        BigAttributeUICompatibleState.hpBackdropFrame = new Frame("BACKDROP", null, BigAttributeUICompatibleState.unitArmorContainer).current;
        DzFrameSetTexture(BigAttributeUICompatibleState.hpBackdropFrame, "UI\\Glues\\SinglePlayer\\HumanCampaign3D\\Black32.blp", 0)
        DzFrameSetSize(BigAttributeUICompatibleState.hpBackdropFrame, 0.076, 0.012)
        DzFrameSetAbsolutePoint(BigAttributeUICompatibleState.hpBackdropFrame, FRAMEPOINT_CENTER, 0.254, 0.023)
        //
        BigAttributeUICompatibleState.manaBackdropFrame = new Frame("BACKDROP", null, BigAttributeUICompatibleState.unitArmorContainer).current;
        DzFrameSetSize(BigAttributeUICompatibleState.manaBackdropFrame, 0.076, 0.012)
        DzFrameSetTexture(BigAttributeUICompatibleState.manaBackdropFrame, "UI\\Glues\\SinglePlayer\\HumanCampaign3D\\Black32.blp", 0)
        DzFrameSetAbsolutePoint(BigAttributeUICompatibleState.manaBackdropFrame, FRAMEPOINT_CENTER, 0.254, 0.009)
        //hp
        BigAttributeUICompatibleState.hpFrame = new Frame("TEXT", null, BigAttributeUICompatibleState.unitArmorContainer).current;
        DzFrameSetFont(BigAttributeUICompatibleState.hpFrame, textFont, textHeight, 0);
        DzFrameSetAbsolutePoint(BigAttributeUICompatibleState.hpFrame, FRAMEPOINT_CENTER, 0.254, 0.023)
        //mana
        BigAttributeUICompatibleState.manaFrame = new Frame("TEXT", null, BigAttributeUICompatibleState.unitArmorContainer).current;
        DzFrameSetAbsolutePoint(BigAttributeUICompatibleState.manaFrame, FRAMEPOINT_CENTER, 0.254, 0.009)
        DzFrameSetFont(BigAttributeUICompatibleState.manaFrame, textFont, textHeight, 0);


    }


    /**
     * 移除原生UI
     */
    moveNativeFrame() {
        /**
         * 隐藏攻击和护甲图标
         */
        DzFrameClearAllPoints(NativeFrameUtil.getUnitAttackIcon(0))
        DzFrameSetPoint(NativeFrameUtil.getUnitAttackIcon(0), 4, DzGetGameUI(), 4, 0.0, -0.5)
        DzFrameClearAllPoints(NativeFrameUtil.getUnitArmorIcon())
        DzFrameSetPoint(NativeFrameUtil.getUnitArmorIcon(), 4, DzGetGameUI(), 4, 0.0, -0.5)


        /**
         * res
         */
        //res
        DzFrameClearAllPoints(NativeFrameUtil.getGoldText())
        DzFrameSetPoint(NativeFrameUtil.getGoldText(), 4, DzGetGameUI(), 4, 0.0, -0.5)
        //
        DzFrameClearAllPoints(NativeFrameUtil.getLumberText())
        DzFrameSetPoint(NativeFrameUtil.getLumberText(), 4, DzGetGameUI(), 4, 0.0, -0.5)
        //unit
        DzFrameClearAllPoints(NativeFrameUtil.getUnitAttackValue(0))
        DzFrameSetPoint(NativeFrameUtil.getUnitAttackValue(0), 4, DzGetGameUI(), 4, 0.0, -0.5)
        //

        //
        DzFrameClearAllPoints(NativeFrameUtil.getUnitArmorValue())
        DzFrameSetPoint(NativeFrameUtil.getUnitArmorValue(), 4, DzGetGameUI(), 4, 0.0, -0.5)

        //
        DzFrameClearAllPoints(NativeFrameUtil.getHeroStrValue())
        DzFrameSetPoint(NativeFrameUtil.getHeroStrValue(), 4, DzGetGameUI(), 4, 0.0, -0.5)
        //
        DzFrameClearAllPoints(NativeFrameUtil.getHeroAgiValue())
        DzFrameSetPoint(NativeFrameUtil.getHeroAgiValue(), 4, DzGetGameUI(), 4, 0.0, -0.5)
        //
        DzFrameClearAllPoints(NativeFrameUtil.getHeroIntValue())
        DzFrameSetPoint(NativeFrameUtil.getHeroIntValue(), 4, DzGetGameUI(), 4, 0.0, -0.5)
        //移动回标签
        DzFrameClearAllPoints(NativeFrameUtil.getUnitAttackLabel(0))
        DzFrameSetAbsolutePoint(NativeFrameUtil.getUnitAttackLabel(0), FRAMEPOINT_TOPLEFT, 0.34, 0.08)
        //移动回标签
        DzFrameClearAllPoints(NativeFrameUtil.getUnitArmorLabel())
        DzFrameSetAbsolutePoint(NativeFrameUtil.getUnitArmorLabel(), FRAMEPOINT_TOPLEFT, 0.34, 0.048)
        //移动回标签
        DzFrameClearAllPoints(NativeFrameUtil.getHeroAgiLabel())
        DzFrameSetAbsolutePoint(NativeFrameUtil.getHeroAgiLabel(), FRAMEPOINT_TOPLEFT, 0.44, 0.06)
        //移动回标签
        DzFrameClearAllPoints(NativeFrameUtil.getHeroIntLabel())
        DzFrameSetAbsolutePoint(NativeFrameUtil.getHeroIntLabel(), FRAMEPOINT_TOPLEFT, 0.44, 0.04)
    }

    static showSolarUI(showAttackAndArmor: boolean, showHeroAtts: boolean = showAttackAndArmor) {
        DzFrameShow(BigAttributeUICompatibleState.hpFrame, showAttackAndArmor);
        DzFrameShow(BigAttributeUICompatibleState.manaFrame, showAttackAndArmor);
        DzFrameShow(BigAttributeUICompatibleState.attackValueFrame, showAttackAndArmor);
        DzFrameShow(BigAttributeUICompatibleState.armorValueFrame, showAttackAndArmor);
        DzFrameShow(BigAttributeUICompatibleState.heroStrValueFrame, showHeroAtts);
        DzFrameShow(BigAttributeUICompatibleState.heroAgiValueFrame, showHeroAtts);
        DzFrameShow(BigAttributeUICompatibleState.heroIntValueFrame, showHeroAtts);
    }


}