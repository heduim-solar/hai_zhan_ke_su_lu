import AttributeUtil from "@/util/system/AttributeUtil";
import UnitUtil from "@/util/unit/UnitUtil";
import HeroUtil from "@/util/unit/HeroUtil";
import NativeFrameUtil from "@/util/frame/NativeFrameUtil";
import TextUtil from "@/util/text/TextUtil";
import SingletonUtil from "../util/lang/SingletonUtil";
import UnitStateUtil from "@/UnitStateUtil";

/**
 *
 * PS: 此类使用局限性很大。 对魔兽不熟悉的作者请不要使用此类制作大数值，以免被无穷的各种问题折磨。
 *
 * 模拟属性(支持大数值)
 *
 * 此状态下各种属性均使用自定义变量存储。所有修改属性的 均使用代码来修改 通过原生物品属性书 或等级升级奖励的属性值将不可用
 *
 * 通过自定义实数number类型 存储数值
 *
 * 在魔兽原本的设置属性和获取属性  走自定义属性值
 *
 * 如果超过上限 则底层设置到限制值 属性值走自定义变量存储  显示时需自行需自行用UI显示这些大值
 *
 * 注意：在大数值模式下一些方法计算并不严谨和准确 如果对数值扣的很细很准 请不要做大数值！
 * （在大属性模式下 不能斤斤计较）
 * link solar_attribute.d.ts ArmorReducesDamageFactor
 *
 */
const BaseAttributeMax = 10000000;//设置为1kw  原生最大为2**31 即21.4亿多
const AgiDefenseBase = S2R(_g_objs.misc["Misc"]["AgiDefenseBase"]);
export default class BigAttributeCompatibleState {


    constructor() {
        if (SingletonUtil.notFirstTime(BigAttributeCompatibleState)) {
            print("不能重复new BigAttributeCompatibleState()")
            return;
        }
        isBigAttributeMode = true;
        this.playerAttributeCompatible();//兼容 金币 和木材 可超过100万
        this.unitAttributeCompatible();//兼容 单位 攻击力 护甲 可超过21亿
        this.heroAttributeCompatible();//兼容 英雄 3维属性 可超过21亿
    }


    /**
     */
    heroAttributeCompatible() {
        //设置英雄3维 白字属性
        let oldSetHeroStr = SetHeroStr;
        _G.SetHeroStr = function (this: void, whichHero: unit, newStr: number, permanent: boolean): void {
            oldSetHeroStr(whichHero, Math.min(newStr, BaseAttributeMax), permanent);
            //设置到太阳属性中
            AttributeUtil.getUnitAttribute(whichHero, true)._SL_BA_str = newStr;
            //力量奖励生命值
            if (StrHpBonus > 0 && newStr > BaseAttributeMax) {
                UnitUtil.setExtraHp(whichHero, (newStr - BaseAttributeMax) * StrHpBonus, "_SL_SetHeroStr") //将没有走原生力量的 力量 手动转换到生命值上去
            }

        }
        let oldSetHeroAgi = SetHeroAgi;
        _G.SetHeroAgi = function (this: void, whichHero: unit, newAgi: number, permanent: boolean): void {
            oldSetHeroAgi(whichHero, Math.min(newAgi, BaseAttributeMax), permanent);
            //设置到太阳属性中
            AttributeUtil.getUnitAttribute(whichHero, true)._SL_BA_agi = newAgi;
            //敏捷奖励的护甲 在获取地方计算
        }
        let oldSetHeroInt = SetHeroInt;
        _G.SetHeroInt = function (this: void, whichHero: unit, newInt: number, permanent: boolean): void {
            oldSetHeroInt(whichHero, Math.min(newInt, BaseAttributeMax), permanent);
            //设置到太阳属性中
            AttributeUtil.getUnitAttribute(whichHero, true)._SL_BA_int = newInt;

            //智力奖励魔法值
            if (IntManaBonus > 0 && newInt > BaseAttributeMax) {
                UnitUtil.setExtraMana(whichHero, (newInt - BaseAttributeMax) * IntManaBonus, "_SL_SetHeroInt") //将没有走原生的  手动转换上去
            }

        }
        //获取英雄3维
        let oldGetHeroStr = GetHeroStr;
        _G.GetHeroStr = function (this: void, whichHero: unit, includeBonuses: boolean): number {
            let val = AttributeUtil.getUnitAttribute(whichHero)?._SL_BA_str ?? oldGetHeroStr(whichHero, false)
            if (includeBonuses) {
                val += UnitUtil.getExtraStr(whichHero);
            }
            return val;
        }
        let oldGetHeroAgi = GetHeroAgi;
        _G.GetHeroAgi = function (this: void, whichHero: unit, includeBonuses: boolean): number {
            let val = AttributeUtil.getUnitAttribute(whichHero)?._SL_BA_agi ?? oldGetHeroAgi(whichHero, false)
            if (includeBonuses) {
                val += UnitUtil.getExtraAgi(whichHero);
            }
            return val;
        }
        let oldGetHeroInt = GetHeroInt;
        _G.GetHeroInt = function (this: void, whichHero: unit, includeBonuses: boolean): number {
            let val = AttributeUtil.getUnitAttribute(whichHero)?._SL_BA_int ?? oldGetHeroInt(whichHero, false)
            if (includeBonuses) {
                val += UnitUtil.getExtraInt(whichHero);
            }
            return val;
        }

    }

    /**
     *
     */
    unitAttributeCompatible() {
        //设置单位属性
        let oldSetUnitState = SetUnitState;
        _G.SetUnitState = function (this: void, whichUnit: unit, whichUnitState: unitstate, newVal: number): void {
            //设置到太阳属性中
            if (whichUnitState == UnitStateDamageBase) {//白字
                oldSetUnitState(whichUnit, whichUnitState, Math.min(newVal, BaseAttributeMax));
                AttributeUtil.getUnitAttribute(whichUnit, true)._SL_BA_damage_base = newVal;
            } else if (whichUnitState == UnitStateArmor) { //设置总护甲值 （实际是设置白字护甲为 输入总值-绿字护甲）
                oldSetUnitState(whichUnit, whichUnitState, Math.min(newVal, BaseAttributeMax));//护甲最大设置到1亿
                AttributeUtil.getUnitAttribute(whichUnit, true)._SL_BA_armor = newVal;
            } else {
                oldSetUnitState(whichUnit, whichUnitState, newVal);
            }
        }
        //获取单位属性
        let oldGetUnitState = GetUnitState;
        _G.GetUnitState = function (this: void, whichUnit: unit, whichUnitState: unitstate): number {
            //设置到太阳属性中
            if (whichUnitState == UnitStateDamageBase) {//获取 白字攻击+英雄主属性奖励的绿字攻击值
                let val = AttributeUtil.getUnitAttribute(whichUnit)?._SL_BA_damage_base;
                if (val == null) {
                    let ba = oldGetUnitState(whichUnit, whichUnitState);
                    if (UnitStateUtil.isAlive(whichUnit)) {
                        AttributeUtil.getUnitAttribute(whichUnit, true)._SL_BA_damage_base = ba;
                    }
                    return ba;
                }

                // if (HeroUtil.isHero(whichUnit)) {//如果是英雄 则加上英雄的白字主属性奖励的攻击力
                //     let primaryValue = HeroUtil.getHeroPrimaryValue(whichUnit, false);
                //     val += primaryValue * PrimaryAttackBonus;
                // }
                return val
            } else if (whichUnitState == UnitStateDamageBonus) {//绿字攻击
                let val = UnitUtil.getExtraAttack(whichUnit);
                if (HeroUtil.isHero(whichUnit)) {//如果是英雄 则加上英雄的绿字主属性奖励的攻击力
                    let primaryAndBonusValue = HeroUtil.getHeroPrimaryValue(whichUnit, true);
                    let primaryValue = HeroUtil.getHeroPrimaryValue(whichUnit, false);
                    let primaryBonusValue = primaryAndBonusValue - primaryValue;
                    val += primaryBonusValue * PrimaryAttackBonus;
                }
                return val
            } else if (whichUnitState == UnitStateArmor) { //获取绿字加白字护甲
                //单位护甲
                let val = AttributeUtil.getUnitAttribute(whichUnit)?._SL_BA_armor

                if (val == null) {
                    let ba = oldGetUnitState(whichUnit, whichUnitState);
                    if (UnitStateUtil.isAlive(whichUnit)) {
                        AttributeUtil.getUnitAttribute(whichUnit, true)._SL_BA_armor = (ba - UnitUtil.getExtraDef(whichUnit));
                    }
                    return ba;
                }
                val = val + UnitUtil.getExtraDef(whichUnit);
                //英雄属性奖励护甲
                if (HeroUtil.isHero(whichUnit) && AgiDefenseBonus > 0) {//如果是英雄 则加上英雄的主属性奖励的护甲
                    //
                    let primaryAndBonusValue = GetHeroAgi(whichUnit, true);
                    val = val + primaryAndBonusValue * AgiDefenseBonus
                    //
                }
                // return val + AgiDefenseBase;
                return val;
            } else if (whichUnitState == UnitStateDamageMix || whichUnitState == UnitStateDamageMax) {//攻击最小值和攻击最大值 包含绿字
                let val = AttributeUtil.getUnitAttribute(whichUnit)?._SL_BA_damage_base;
                if (val == null) {
                    let ba = oldGetUnitState(whichUnit, UnitStateDamageBase);
                    if (UnitStateUtil.isAlive(whichUnit)) {
                        if (HeroUtil.isHero(whichUnit)) {//如果是英雄 则加上英雄的主属性奖励的攻击力
                            let primaryAndBonusValue = HeroUtil.getHeroPrimaryValue(whichUnit, true);
                            val = val + primaryAndBonusValue * PrimaryAttackBonus
                            ba = ba - val;
                        }
                        AttributeUtil.getUnitAttribute(whichUnit, true)._SL_BA_damage_base = ba;
                    }
                    return ba;
                }
                let extVal = UnitUtil.getExtraAttack(whichUnit);
                val = val + extVal;
                if (HeroUtil.isHero(whichUnit)) {//如果是英雄 则加上英雄的主属性奖励的攻击力
                    let primaryAndBonusValue = HeroUtil.getHeroPrimaryValue(whichUnit, true);
                    val = val + primaryAndBonusValue * PrimaryAttackBonus
                }
                return val;
            }
            return oldGetUnitState(whichUnit, whichUnitState);
        }
    }

    /**
     * 兼容玩家属性限制
     */
    //
    playerAttributeCompatible() {
        //设置玩家属性
        let oldSetPlayerState = SetPlayerState;
        _G.SetPlayerState = function (this: void, whichPlayer: player, whichPlayerState: playerstate, value: number): void {
            //设置到原生属性中 超过100万则设置100万
            let temp = Math.min(value, 1000000);
            oldSetPlayerState(whichPlayer, whichPlayerState, temp)
            //设置到太阳属性中
            if (whichPlayerState == PLAYER_STATE_RESOURCE_GOLD) {
                DzFrameSetText(NativeFrameUtil.getGoldText(), TextUtil.toCnUnit(value))
                AttributeUtil.getPlayerAttribute(whichPlayer, true)._SL_BA_gold = value;
                AttributeUtil.getPlayerAttribute(whichPlayer, true)._SL_BA_gold_temp = temp;
            } else if (whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER) {
                DzFrameSetText(NativeFrameUtil.getLumberText(), TextUtil.toCnUnit(value))
                AttributeUtil.getPlayerAttribute(whichPlayer, true)._SL_BA_lumber = value;
                AttributeUtil.getPlayerAttribute(whichPlayer, true)._SL_BA_lumber_temp = temp;
            }
        }

        //获取玩家属性
        let oldGetPlayerState = GetPlayerState;
        _G.GetPlayerState = function (this: void, whichPlayer: player, whichPlayerState: playerstate): number {
            //设置到太阳属性中
            if (whichPlayerState == PLAYER_STATE_RESOURCE_GOLD) {
                return AttributeUtil.getPlayerAttribute(whichPlayer)?._SL_BA_gold ??
                    oldGetPlayerState(whichPlayer, whichPlayerState);
            } else if (whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER) {
                return AttributeUtil.getPlayerAttribute(whichPlayer)?._SL_BA_lumber ??
                    oldGetPlayerState(whichPlayer, whichPlayerState);
            }
            return oldGetPlayerState(whichPlayer, whichPlayerState);
        }
        //更新玩家属性消耗自定义值
        let goldTrigger = CreateTrigger();
        let lumberTrigger = CreateTrigger();
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            TriggerRegisterPlayerStateEvent(goldTrigger, Player(i), PLAYER_STATE_RESOURCE_GOLD, NOT_EQUAL, -1.00)
            TriggerRegisterPlayerStateEvent(lumberTrigger, Player(i), PLAYER_STATE_RESOURCE_LUMBER, NOT_EQUAL, -1.00)
        }

        TriggerAddAction(goldTrigger, () => {
            let player = GetTriggerPlayer();
            let playerAttribute = AttributeUtil.getPlayerAttribute(player, true);
            let nowTempGold = oldGetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD);
            if (!playerAttribute._SL_BA_gold || !playerAttribute._SL_BA_gold_temp) {
                playerAttribute._SL_BA_gold_temp = nowTempGold;
                return
            }
            let add = nowTempGold - playerAttribute._SL_BA_gold_temp;
            playerAttribute._SL_BA_gold += add;
            //刷新金币
            DisableTrigger(GetTriggeringTrigger())
            SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, playerAttribute._SL_BA_gold)
            EnableTrigger(GetTriggeringTrigger())
        });
        TriggerAddAction(lumberTrigger, () => {
            let player = GetTriggerPlayer();
            let playerAttribute = AttributeUtil.getPlayerAttribute(player, true);
            let nowTempGold = oldGetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER);
            if (!playerAttribute._SL_BA_lumber || !playerAttribute._SL_BA_lumber_temp) {
                playerAttribute._SL_BA_lumber_temp = nowTempGold;
                return
            }
            let add = nowTempGold - playerAttribute._SL_BA_lumber_temp;
            playerAttribute._SL_BA_lumber += add;
            //刷新木材
            DisableTrigger(GetTriggeringTrigger())
            SetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER, playerAttribute._SL_BA_lumber)
            EnableTrigger(GetTriggeringTrigger())
        });


    }


    /**
     * fun
     */
}