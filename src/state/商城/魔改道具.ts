import Actor from "@/Actor";
import AutoMissileAttackController from "@/AutoMissileAttackController";
import PlatUtil from "@/PlatUtil";
import Cache from "@/Cache";
import ActorItemUtil from "@/ActorItemUtil";
import HeroUtil from "@/HeroUtil";
import TextTagUtil from "@/TextTagUtil";
import PlayerUtil from "@/PlayerUtil";
import UnitStateUtil from "@/UnitStateUtil";
import EffectUtil from "@/EffectUtil";
import DamageUtil from "@/DamageUtil";
import ArrayUtil from "@/ArrayUtil";
import {d_核心部件} from "../../xlsx/装备/核心部件";
import BaseUtil from "@/BaseUtil";
import ActorUtil from "@/ActorUtil";

export default class 魔改道具 {


    constructor() {

        //团结号主炮 升级后立刻获得下次升级所需的80%经验值
        se.onHeroLevelUp((e, solarTrigger) => {
            let trigUnitOwner = e.trigUnitOwner;

            solarTrigger.enable = false;
            BaseUtil.runLater(0.01, () => {
                let unit = PlayerUtil.getHero(trigUnitOwner);
                if (PlatUtil.hasMallItem(trigUnitOwner, "CZMG46")) {
                    if (ActorUtil.isUnitHasActor(unit, "团结号主炮")) {
                        let neededXP = DzGetUnitNeededXP(unit, GetUnitLevel(unit)) - GetHeroXP(unit);
                        AddHeroXP(unit, neededXP * 0.6, true)
                    }
                }
                //每次进化后，获得当前经验20%的基础经验。
                if (PlatUtil.hasMallItem(trigUnitOwner, "CZDZC")) {
                    let neededXP = DzGetUnitNeededXP(unit, GetUnitLevel(unit)) - GetHeroXP(unit);
                    AddHeroXP(unit, neededXP * 0.2, true)
                }
                solarTrigger.enable = true;
            });
        })


    }

    static 船只魔改道具奖励(index: number, unit: unit) {
        let mgShopKey = "CZMG" + index;
        if (!PlatUtil.hasMallItem(GetOwningPlayer(unit), mgShopKey)) {
            return
        }
        if (index == 28) {
            //转职为天使号时获得5个胶胶果实
            ActorItemUtil.addActorItemForUnit("胶胶果实", unit, 5)
        } else if (index == 32) {
            //转职位皇家宝藏号时获得5万金币
            PlayerUtil.addGoldState(GetOwningPlayer(unit), 50000);
            TextTagUtil.textSuccess("获得5万金币", unit)
        } else if (index == 33) {
            //转职为雷雨号时，获得20%当前智力。
            HeroUtil.addHeroPropertyP(unit, false, 0, 0, 0.2);
            TextTagUtil.textSuccess("获得20%智力", unit)
        } else if (index == 34) {
            //转职为狂风呼啸号时，获得20%当前敏捷。
            HeroUtil.addHeroPropertyP(unit, false, 0, 0.2, 0);
            TextTagUtil.textSuccess("获得20%敏捷", unit)
        } else if (index == 36) {
            //  转职为最强攻击号时，获得20%当前攻击。
            UnitStateUtil.setDamageBase(unit, UnitStateUtil.getDamageBase(unit) * 1.2);
            TextTagUtil.textSuccess("获得20%攻击", unit)
        } else if (index == 37) {
            //  转职为兽族兵营号时，获得20%当前力量。
            HeroUtil.addHeroPropertyP(unit, false, 0.2, 0, 0);
            TextTagUtil.textSuccess("获得20%力量", unit)
        } else if (index == 38) {
            //          转职为人族兵营号时，获得20 % 当前护甲。
            UnitStateUtil.setArmor(unit, UnitStateUtil.getArmor(unit) * 1.2);
            TextTagUtil.textSuccess("获得20%护甲", unit)
        } else if (index == 39) {
            //  转职为暗夜精灵号时，获得20 % 当前生命值。
            UnitStateUtil.addMaxLifeAndLife(unit, UnitStateUtil.getMaxLife(unit) * 0.2);
            TextTagUtil.textSuccess("获得20%生命值", unit)
        } else if (index == 43) {
            //  转职成黑龙时，攻击1200范围内所有敌人一次。
            let damage = UnitStateUtil.calculateStateFormula({attack: 10}, unit);
            DamageUtil.damageEnemyUnitsInRange(unit, 1200, damage)
            EffectUtil.addSpecialEffectAndDestroy("model\\基本技能\\瘟疫号基础技能.mdx",
                GetUnitX(unit), GetUnitY(unit), 1);
        } else if (index == 44) {
            //  转职成神之号时，无敌30秒。
            UnitStateUtil.addInvulnerableIfNot(unit, 30);
            TextTagUtil.textSuccess("无敌30秒", unit)
        } else if (index == 50) {
            // 萧炎号可以直接随机获得一个核心部件
            let randomElement = ArrayUtil.randomElement(d_核心部件);
            ActorItemUtil.addActorItemForUnit(randomElement.id, unit)
        }


    }

    static

    主炮商城道具加强(actor: Actor) {
        let 拥有魔改道具 = 魔改道具.主炮是否拥有魔改道具(actor);
        if (拥有魔改道具 == false) {
            return;
        }

        let ctrl: AutoMissileAttackController = actor.autoMissileAttackController
        if (ctrl == null) {
            return
        }
        let index = actor.actorType.index;
        if (index == 0) {
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.add_strength_on_kill = (actor.attribute.add_strength_on_kill || 0) + 1;
            actor.attribute.add_agility_on_kill = (actor.attribute.add_agility_on_kill || 0) + 1;
            actor.attribute.add_intelligence_on_kill = (actor.attribute.add_intelligence_on_kill || 0) + 1;
        } else if (index == 5) {
            //黑珍珠号主炮的范围+200
            ctrl.range += 200;
        } else if (index == 6) {
            //黑色幽灵号附带真实伤害+5%
            ctrl.damageStateFormula.increased = (ctrl.damageStateFormula.increased || 0) + 0.05;
        } else if (index == 7 || index == 8) {
            //桑尼号的每次弹射伤害+10%
            // 阳光桑尼号的每次弹射伤害+10%
            ctrl.damageStateFormula.increased = (ctrl.damageStateFormula.increased || 0) + 0.05;
        } else if (index == 15) {
            //海皇波塞冬主炮范围+300
            ctrl.range += 300;
        } else if (index == 16 || index == 17) {
            //深海之女移速变为max
            // 武装直升机移速变为max
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.move_speed = 522;
        } else if (index == 19) {
            //商船杀敌金币额外+20
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.add_gold_on_kill = (actor.attribute.add_gold_on_kill || 0) + 20;
        } else if (index == 20) {
            //缅电船杀敌经验额外+1
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.杀敌经验 = (actor.attribute.杀敌经验 || 0) + 1;
        } else if (index == 22 || index == 23) {
            //魔法船技能伤害+35%
            // 顽石号技能伤害+35%
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.magic_damage_increased = (actor.attribute.magic_damage_increased || 0) + 0.35;
        } else if (index == 24) {
            //巡洋舰初始护甲+1000
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.def = (actor.attribute.def || 0) + 1000;
        } else if (index == 25) {
            //猩红之女初始敏捷+3000
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.agility = (actor.attribute.agility || 0) + 3000;
        } else if (index == 26) {
            //光明号主炮目标+1
            ctrl.targetCount++;
        } else if (index == 27) {
            //猩红之女初始敏捷+3000
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.attack_p = (actor.attribute.attack_p || 0) + 0.2;
        } else if (index == 29) {
            //船长号射程+500
            ctrl.range += 500;
        } else if (index == 30) {
            //安妮女王复仇号的主炮附带杀敌+2全属性
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.add_strength_on_kill = (actor.attribute.add_strength_on_kill || 0) + 2;
            actor.attribute.add_agility_on_kill = (actor.attribute.add_agility_on_kill || 0) + 2;
            actor.attribute.add_intelligence_on_kill = (actor.attribute.add_intelligence_on_kill || 0) + 2;
        } else if (index == 31) {
            //冒险号护甲+500
            if (actor.attribute == null) {
                actor.attribute = {};
            }
            actor.attribute.def = (actor.attribute.def || 0) + 500;
        } else if (index == 35) {
            //刀山号主炮射速+50%
            ctrl.coolDown *= 0.75;
        } else if (index == 40) {
            //不死亡灵号射程+500
            ctrl.range += 500;
        } else if (index == 45) {
            //剑圣主炮伤害范围+250
            ctrl.range += 250;
        }
    }


    static cache = new Cache();

    static 主炮是否拥有魔改道具(actor: Actor): boolean {
        if (actor.actorType.class != "主炮" && actor.actorType.class != "技能A") {
            return false;
        } else {
            // return true;
        }
        return 魔改道具.cache.get(actor.actorTypeId + actor.unitOwnerId, () => {
            let index = actor.actorType.index;
            let mgShopKey = "CZMG" + index;
            return PlatUtil.hasMallItem(actor.unitOwner, mgShopKey);
        });
    }


}