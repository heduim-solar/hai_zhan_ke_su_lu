import ActorTypeUtil from "@/ActorTypeUtil";
import {l_挑战怪} from "../../_sl_editor/l_挑战怪";
import ActorUnitUtil from "@/ActorUnitUtil";
import PlayerUtil from "@/PlayerUtil";
import MapUtil from "../../util/MapUtil";
import {d_进攻怪演员} from "../../xlsx/单位/进攻怪演员";
import ActorItemUtil from "@/ActorItemUtil";
import ActorItem from "@/ActorItem";
import TextUtil from "@/TextUtil";
import UnitStateUtil from "@/UnitStateUtil";
import TextTagUtil from "@/TextTagUtil";

export default class 超级挑战 {


    constructor() {


        let actorType = ActorTypeUtil.getActorType("超级挑战");
        actorType.onAction = (actor, x, y, targetUnit) => {
            let loc = l_挑战怪[GetRandomInt(1, l_挑战怪.length - 1)]
            let actorUnit = ActorUnitUtil.createActorUnit(PlayerUtil.neutralAggressivePlayer(),
                d_进攻怪演员[Math.min(gv.enemyLevel - 1, d_进攻怪演员.length - 1)].id, loc.x, loc.y);
            //
            MapUtil.根据难度数值加强怪物(actorUnit.unit);
            let unitHandle = actorUnit.unit;
            //
            TextTagUtil.textWarn("超级挑战", unitHandle);
            SetUnitScale(unitHandle, 5, 5, 5);
            SetUnitVertexColor(unitHandle, 255, 100,
                100, 200)
            // new hp
            let multiple = 100;
            UnitStateUtil.setMaxLife(unitHandle, UnitStateUtil.getMaxLife(unitHandle) * multiple);
            UnitStateUtil.setUnitLifeP(unitHandle, 1);
            //  new_dmg
            UnitStateUtil.setDamageBase(unitHandle, Math.min(UnitStateUtil.getDamageMax(unitHandle) * multiple, 2100000000))
            // new hj
            UnitStateUtil.setArmor(unitHandle, (UnitStateUtil.getArmor(unitHandle) + settings.valueCoefficient) * settings.gameDifficulty)
            // actorUnit.set("flyHeight", 200)
            actorUnit.applyTimedLife(90);
            //
            se.onUnitDeath(e => {
                //被杀死的
                if (!IsHandle(e.killingUnit)) {
                    return
                }
                //
                let actorItem = ActorItemUtil.createActorItem("污染的航海器", e.trigUnitX, e.trigUnitY);
                超级挑战.初始化污染的航海器(actorItem);


            }, actorUnit.unit);
        }


    }

    /**
     * 力量+（100~300）*难度系数
     * 敏捷+（100~300）*难度系数
     * 智力+（100~300）*难度系数
     * 攻击力+（200~500）*难度系数
     * 力量强化+（5~10）*难度系数
     * 敏捷强化+（5~10）*难度系数
     * 智力强化+（5~10）*难度系数
     * 攻击力强化+（5~10）*难度系数
     * 伤害强化+（5~10）*难度系数
     * 护甲+10~30
     * 生命值+2500~8000
     * 生命值强化+（5~10）*难度系数
     * 暴击率+（3~10%）跟难度系数无关
     * 暴击伤害+（20~50%）*难度系数
     * @param actorItem
     */

    static ctNames: string[] = ["力量", "敏捷", "智力", "攻击力",
        "力量增幅", "敏捷增幅", "智力增幅", "攻击力增幅",
        "伤害增幅", "伤害减免", "护甲", "护甲增幅", "生命值", "生命增幅", "暴击率", "暴击伤害"];
    static ctKeys: (keyof SolarAttribute)[] = ["strength", "agility", "intelligence", "attack",
        "strength_p", "agility_p", "intelligence_p", "attack_p",
        "damage_increased", "damage_reduction", "def", "def_p", "life", "life_p", "physical_critical_chance", "physical_critical_damage"];


    static 初始化污染的航海器(actorItem: ActorItem) {
        let Lv = GetRandomInt(1, 6);

        actorItem.setName("污染的航海器Lv" + Lv);

        for (let i = 1; i <= Lv; i++) {
            let randomIndex = GetRandomInt(0, this.ctKeys.length - 1);
            let key: string = this.ctKeys[randomIndex] as any;
            let name = this.ctNames[randomIndex];
            let val = 超级挑战.getRandomVal(key, i);
            let valStrInfo = "";
            if (val < 10) {
                valStrInfo = TextUtil.toPercentage(val);
            } else {
                valStrInfo = TextUtil.toCnUnit(val);
            }
            if (actorItem.attribute == null) {
                actorItem.attribute = {};
            }
            actorItem.attribute[key] = (actorItem.attribute[key] as any || 0) + val;
            actorItem.extDescribeLast1 = "(PS:此装备不能被吞噬)"
            actorItem.setExtDescribe("No." + i + ": " + name + " + |cff00ff00", valStrInfo);


        }


    }


    static getRandomVal(key: string, lv: number) {
        let ri = GetRandomInt(lv, 10);
        let nandu = MapUtil.getRealNanduLevel();
        if (key == "strength"
            || key == "agility"
            || key == "intelligence"
            || key == "attack"
            || key == "life"
        ) {
            return ri * nandu * 10 * gv.enemyLevel;
        } else if (key == "strength_p"
            || key == "agility_p"
            || key == "intelligence_p"
            || key == "attack_p"
            || key == "damage_increased"
            || key == "life_p"
        ) {
            return ri * 0.1;
        } else if (key == "def") {
            return ri * nandu;
        } else if (key == "def_p") {
            return ri * 0.05;
        } else if (key == "damage_reduction") {
            return GetRandomInt(lv, 10) * 0.01;
        } else if (key == "physical_critical_chance") {
            return GetRandomInt(lv, 10) * 0.02;
        } else if (key == "physical_critical_damage") {
            return ri * 0.5;
        }
        return 1;
    }

}