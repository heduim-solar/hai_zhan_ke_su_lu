/**
 * 多重背包工具
 */
import DataBase from "@/common/DataBase";
import LangUtil from "../lang/LangUtil";

export default class DoubleItemSlotUtil {


    // static IsItemSwitch(u: unit): boolean {
    //     return DataBase.getUnitSolarData(u)._sl_ItemAbilitySystemTriggerClose
    // }

    static itemSwitch(Ua: unit, Ub: unit): void {

        let Ia: item[] = [];
        let Ib: item[] = [];
        let i: number = 0;
        let heroSD = DataBase.getUnitSolarData(Ua);

        heroSD._sl_ItemAbilitySystemTriggerClose = true;
        SetUnitOwner(Ub, GetOwningPlayer(Ua), false);
        while (true) {
            if (i > 5) break;
            if (UnitItemInSlot(Ua, i) != null) {
                Ia[i] = UnitItemInSlot(Ua, i);
                UnitRemoveItemFromSlot(Ua, i);
            }
            if (UnitItemInSlot(Ub, i) != null) {
                Ib[i] = UnitItemInSlot(Ub, i);
                UnitRemoveItemFromSlot(Ub, i);
            }
            i = i + 1;
        }
        i = 0;
        while (true) {
            if (i > 5) break;
            if (Ia[i] == null)
                UnitAddItem(Ub, CreateItem(FourCC('stpg'), GetUnitX(Ub), GetUnitY(Ub)));
            else
                UnitAddItem(Ub, Ia[i]);
            i = i + 1;
        }
        i = 0;
        while (true) {
            if (i > 5) break;
            if (Ib[i] == null)
                UnitAddItem(Ua, CreateItem(FourCC('stpg'), GetUnitX(Ua), GetUnitY(Ua)));
            else
                UnitAddItem(Ua, Ib[i]);
            i = i + 1;
        }
        i = 0;
        while (true) {
            if (i > 5) break;
            if (GetItemTypeId(UnitItemInSlot(Ua, i)) == FourCC('stpg'))
                RemoveItem(UnitItemInSlot(Ua, i));
            if (GetItemTypeId(UnitItemInSlot(Ub, i)) == FourCC('stpg'))
                RemoveItem(UnitItemInSlot(Ub, i));
            i = i + 1;
        }
        i = 0;
        while (true) {
            if (i > 5) break;
            Ia[i] = null;
            Ib[i] = null;
            i = i + 1;
        }
        SetUnitOwner(Ub, Player(PLAYER_NEUTRAL_PASSIVE), false);
        heroSD._sl_ItemAbilitySystemTriggerClose = false;
    }

    private static _sl_doubleItemSlotByAbility_CON(this: void): boolean {

        let u: unit = null;
        let trg: trigger = GetTriggeringTrigger();
        let hero: unit = GetTriggerUnit();
        let trgSD = DataBase.getDataByHandle("trigger", trg);
        let ab: number = trgSD.Ability;
        let ItemSlotMax: number = trgSD.ItemSlotMax;
        let i: number = 0;

        if (GetSpellAbilityId() != ab) {
            u = null;
            trg = null;
            hero = null;
            return false;
        }
        if (ItemSlotMax == 1) {
            u = null;
            trg = null;
            hero = null;
            return false;
        }
        i = trgSD.ItemSlotNum;
        i = i + 1;
        if (i > ItemSlotMax)
            i = 1;
        trgSD.ItemSlotNum = i;
        u = trgSD[I2S(i)];
        DoubleItemSlotUtil.itemSwitch(hero, u);
        SetUnitAbilityLevel(hero, ab, i);
        if (i == 1)
            trgSD[I2S(ItemSlotMax)] = u;
        else
            trgSD[I2S(i - 1)] = u;
        return false;
    }

    /**
     * 多重物品栏 技能切换
     * @param hero
     * @param ab
     * @param uid
     * @param MaxItemSlot
     */
    static doubleItemSlotByAbility(hero: unit, ab: string | number, MaxItemSlot: number, uid ?: string | number): void {
        let heroSD = DataBase.getUnitSolarData(hero);
        let i: number = heroSD.MulItemSlotByAbility ?? 0;
        let trg: trigger = null;
        let u: unit = null;
        //使用默认的 帮助单位
        let useDefaultHelpUnit: boolean = (uid == null);
        //
        if (useDefaultHelpUnit) {
            uid = "hrdh";
        }
        //统一使用整数id
        ab = LangUtil.getIntId(ab);
        uid = LangUtil.getIntId(uid);

        if (i == 0) {
            trg = CreateTrigger();
            TriggerRegisterUnitEvent(trg, hero, EVENT_UNIT_SPELL_EFFECT);
            TriggerAddCondition(trg, Condition(DoubleItemSlotUtil._sl_doubleItemSlotByAbility_CON));
            heroSD.MulItemSlotByAbility = trg;
            let trgSD = DataBase.getDataByHandle("trigger", trg);
            trgSD.Ability = ab;
            trgSD.ItemSlotMax = MaxItemSlot;
            trgSD.ItemSlotNum = 1;
            if (MaxItemSlot > 1)
                while (true) {
                    if (MaxItemSlot == 1) break;
                    u = CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), uid, 0, 0, 0);
                    heroSD._sl_ItemAbilitySystemTriggerClose = true;
                    trgSD[I2S(MaxItemSlot)] = u;
                    MaxItemSlot = MaxItemSlot - 1;
                    //
                    if (useDefaultHelpUnit) {
                        //添加 英雄物品栏 无敌 隐形 蝗虫
                        UnitAddAbility(u, "AInv")
                        UnitAddAbility(u, "Avul")
                        UnitAddAbility(u, "Apiv")
                        UnitAddAbility(u, "Aloc")
                        SetUnitState(u, UNIT_STATE_MAX_LIFE, 1000000000)
                        SetUnitState(u, UNIT_STATE_LIFE, 1000000000)
                        ShowUnit(u, false)
                    }
                }
        }
    }

}