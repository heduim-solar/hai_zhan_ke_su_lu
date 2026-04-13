import PlayerUtil from "@/PlayerUtil";
import ActorAbility from "@/ActorAbility";
import {d_船主炮} from "../xlsx/技能/船主炮";
import {d_玩家英雄船} from "../xlsx/单位/玩家英雄船";
import {d_船基本技能} from "../xlsx/技能/船基本技能";
import UnitStateUtil from "@/UnitStateUtil";
import SelectUtil from "@/SelectUtil";
import DataBase from "@/DataBase";
import Actor from "@/Actor";
import HeroUtil from "@/HeroUtil";
import TextTagUtil from "@/TextTagUtil";
import ItemUtil from "@/ItemUtil";
import DialogUtil from "@/DialogUtil";
import XlsxDataUtil from "@/XlsxDataUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";
import {d_传送} from "../xlsx/技能/传送";
import ActorBuffUtil from "@/ActorBuffUtil";
import PlayerAttributeState from "@/PlayerAttributeState";
import PlatUtil from "@/PlatUtil";
import 魔改道具 from "../state/商城/魔改道具";
import BaseUtil from "@/BaseUtil";
import ObjectDataUtil from "@/ObjectDataUtil";
import IconUtil from "@/IconUtil";
import EmbedJapiUtil from "@/EmbedJapiUtil";

export default class MapHeroUtil {
    static jiNengStartPos = 5;
    static zhuPaoStartPos = 9;

    static cshyx_初始化英雄(anHero: unit, addJiNeng = true) {
        let player = GetOwningPlayer(anHero);
        PlayerUtil.setHero(player, anHero);
        UnitStateUtil.enableFlyHeight(anHero);

        //
        let idStr = id2string(GetUnitTypeId(anHero));
        let index = 0;
        for (let i = 0; i < d_玩家英雄船.length; i++) {
            if (d_玩家英雄船[i].id == idStr) {
                new ActorAbility(d_船主炮[i].id, anHero, MapHeroUtil.zhuPaoStartPos);
                print("为" + GetUnitName(anHero) + "添加主炮技能:" + d_船主炮[i].id)
                if (addJiNeng) {
                    new ActorAbility(d_船基本技能[i].id, anHero, MapHeroUtil.jiNengStartPos);
                    print("为" + GetUnitName(anHero) + "添加技能:" + d_船基本技能[i].id)
                }
                index = i;
                break
            }
        }
        //
        UnitSetUsesAltIcon(anHero, true);
        DzWidgetSetMinimapIconEnable?.(anHero, true);
        DzWidgetSetMinimapIcon?.(anHero, "进攻怪图标\\船.blp");
        //
        魔改道具.船只魔改道具奖励(index, anHero);
        //
        UnitStateUtil.addInvulnerableIfNot(anHero, 2);


        //
        UnitAddAbility(anHero, d_传送[0].id)
        SelectUnitForPlayerSingle(anHero, player)
    }

    static getHeroZhuPaoActorId(heroTypeIdStr: string): string {
        for (let i = 0; i < d_玩家英雄船.length; i++) {
            if (d_玩家英雄船[i].id == heroTypeIdStr) {
                return d_船主炮[i].id;
            }
        }
    }

    static getHeroJiNengActorId(heroTypeIdStr: string): string {
        for (let i = 0; i < d_玩家英雄船.length; i++) {
            if (d_玩家英雄船[i].id == heroTypeIdStr) {
                return d_船基本技能[i].id;
            }
        }
    }


    static do进化ByType(player: player, lv: number, newHeroId: string) {
        let oldHero = SelectUtil.getAnHero(GetPlayerId(player))
        let 主炮数量 = ActorAbilityUtil.getUnitActorAbilityListSize(oldHero, "主炮");
        if (主炮数量 >= 4) {
            PlayerUtil.text(player, "你的英雄已经拥有4个主炮了！无法进化!")
            return
        }
        let playerData = DataBase.getPlayerSolarData(player, true);

        if (playerData.jhcs_进化次数 && playerData.jhcs_进化次数 >= 3) {
            let heroData: t_玩家英雄船 = XlsxDataUtil.getDataById(newHeroId);
            DialogUtil.show(GetPlayerId(player), "是否保留当前主炮|n(拥有4门主炮后则停止进化)|n" + heroData.Name, (i, t) => {
                if (i == 0) {
                    MapHeroUtil.do进化ByTypeAndKeepAbility(player, lv, newHeroId, true, false)
                } else if (i == 1) {
                    MapHeroUtil.do进化ByTypeAndKeepAbility(player, lv, newHeroId, false, false)
                }
            }, "是", "否")
        } else {
            MapHeroUtil.do进化ByTypeAndKeepAbility(player, lv, newHeroId, false, false)
        }


    }

    static do进化ByTypeAndKeepAbility(player: player, lv: number, newHeroId: string, keepZhuPao: boolean = false, keepJineng: boolean = false) {


        //换英雄
        let oldHero = SelectUtil.getAnHero(GetPlayerId(player))
        if (keepZhuPao && ActorAbilityUtil.getUnitActorAbilityListSize(oldHero, "主炮") >= 4) {
            PlayerUtil.text(player, "你的英雄已经拥有4个主炮了！无法进化!")
            return
        }
        let newHero = CreateUnit(GetOwningPlayer(oldHero), FourCC(newHeroId), GetUnitX(oldHero), GetUnitY(oldHero), GetUnitFacing(oldHero))
        //
        if (keepJineng) {
            let jiNengActorId = MapHeroUtil.getHeroJiNengActorId(id2string(GetUnitTypeId(oldHero)));
            new ActorAbility(jiNengActorId, newHero, MapHeroUtil.jiNengStartPos);
        }
        let actorId = MapHeroUtil.getHeroZhuPaoActorId(id2string(GetUnitTypeId(oldHero)))
        ActorAbilityUtil.forUnitActorAbilityList(oldHero, actor => {
            if (keepZhuPao || actor.actorType.id != actorId) {
                let actorAbility = new ActorAbility(actor.actorType.id, newHero, MapHeroUtil.zhuPaoStartPos);
                if (actor.extData) {
                    for (let extDataKey in actor.extData) {
                        actorAbility.extData[extDataKey] = actor.extData[extDataKey];
                    }
                }
            }
        }, "主炮")
        ActorAbilityUtil.forUnitActorAbilityList(oldHero, actor => {
            new ActorAbility(actor.actorType.id, newHero, 6);
        }, "船长之心")
        ActorBuffUtil.forUnitActorBuffs(oldHero, actor => {
            if (actor.get("tag") != "进化继承") {
                return
            }
            let actorBuff = ActorBuffUtil.addActorBuff(newHero, actor.actorType.id);
            actorBuff.set("class", actor.get("class"));
            actorBuff.set("tag", actor.get("tag"));
            actorBuff.set("uiShowType", actor.get("uiShowType"));
            if (actor.extData) {
                for (let extDataKey in actor.extData) {
                    actorBuff.extData[extDataKey] = actor.extData[extDataKey];
                }
            }
            BaseUtil.runLater(0.2, () => {
                actorBuff.level = actor.level;
            })

        });
        //及时清理一下 演员技能携带的属性
        let solarData = DataBase.getUnitSolarData(oldHero, false);
        let actor: Actor = solarData?._SL_solarActorUnit
        actor?.destroy();
        ActorAbilityUtil.destroyUnitAllActorAbility(oldHero)
        ActorBuffUtil.clearUnitActorBuffs(oldHero)
        //
        se.emit("属性刷新");

        let playerData = DataBase.getPlayerSolarData(GetOwningPlayer(oldHero), true);
        playerData.正在进化 = true;
        // let attribute = AttributeUtil.getUnitAttribute(oldHero, false);
        // if (attribute) {
        //     AttributeUtil.setUnitAttribute(newHero, attribute)
        // }
        AddHeroXP(newHero, GetHeroXP(oldHero), true)
        playerData.正在进化 = false;
        ItemUtil.transferItems(oldHero, newHero);


        HeroUtil.addHeroProperty(newHero, HeroUtil.getFullProperty(oldHero, false) / 3);
        //获取真正的白字 攻击力
        HeroUtil.setHeroProperty(oldHero, 1, 1, 1)
        se.emit("属性刷新");
        let damageBase = UnitStateUtil.getDamageBase(oldHero) - HeroUtil.getHeroPrimaryValue(oldHero);
        if (damageBase > 0) {
            UnitStateUtil.addDamageBase(newHero, damageBase);
            print("继承白字攻击力+" + damageBase)
        }

        //"存档掉落率+5%
        // 每次进化，当前属性+5%"
        if (PlatUtil.hasMallItem(player, "HYBZ")) {
            HeroUtil.addHeroPropertyP(newHero, false, 0.05);
            TextTagUtil.textSuccess("海域霸主+全属性5%", newHero)
        }
        // SCJF016	积分商城	通用商品	循序渐进 每次进化，三维+10
        if (PlatUtil.hasMallItem(player, "SCJF016")) {
            HeroUtil.addHeroProperty(newHero, 10);
            TextTagUtil.textSuccess("循序渐进+全属性10", newHero);
        }


        TextTagUtil.text("进化!", newHero, 20, 3, 255, 0, 0)
        MapHeroUtil.cshyx_初始化英雄(newHero, !keepJineng);


        //
        RemoveUnit(oldHero)
        //
        PlayerAttributeState.refresh();

    }

}