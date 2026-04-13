import {Trigger} from "@/w3ts/handles/trigger";
import UnitUtil from "@/util/unit/UnitUtil";
import AttributeUtil from "@/util/system/AttributeUtil";
import SingletonUtil from "../util/lang/SingletonUtil";
import HandleUtil from "@/HandleUtil";
import DataBase from "@/DataBase";
import UnitStateUtil from "@/UnitStateUtil";
import BaseUtil from "@/BaseUtil";

/**
 * 单位属性系统
 *
 * 将单位自定义属性数值 对应到 单位实际属性上
 */
export default class UnitAttributeState {
    static greenIncrease = true;//增幅 对 绿字也有效果 （百分比属性对绿字属性有效果 绿字属性百分比加法）

    //推荐使用  AttributeUtil.setUnitTypeAttribute
    static config: { [unitTypeId: string]: AppAttribute } = {}

    //vars


    constructor() {
        if (SingletonUtil.notFirstTime(UnitAttributeState)) {
            print("不能重复new UnitAttributeState()")
            return;
        }
        BaseUtil.runLater(0.1, () => {
            for (let configKey in UnitAttributeState.config) {
                SingletonUtil.executeOnce("UnitAttributeState.config:警告", () => {
                    print("不推荐在UnitAttributeState.config设置属性," +
                        "请直接使用AttributeUtil.setUnitTypeAttribute设置属性。这个方式将在未来移除!")
                });
                AttributeUtil.setUnitTypeAttribute(configKey, UnitAttributeState.config[configKey]);
            }
        });
        //将单位类型的 属性配置 设置到单位身上
        let enterRectTrigger = new Trigger()
        enterRectTrigger.registerEnterRect(GetPlayableMapRect())
        enterRectTrigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_UPGRADE_FINISH)
        enterRectTrigger.addAction(() => {
            let triggerUnit = GetTriggerUnit();
            let typeStr = id2string(GetUnitTypeId(triggerUnit))
            let utsa = AttributeUtil.getUnitTypeAttribute(typeStr);
            if (utsa) {
                let unitAttribute = AttributeUtil.getUnitAttribute(triggerUnit, true);
                AttributeUtil.add(unitAttribute, utsa)
                UnitAttributeState.refreshUnitSolarAttribute(triggerUnit, utsa);
            }
        });

        //循环 对每个单位 进行刷新属性
        let triggerTimer = new Trigger()
        //2秒刷新一次
        triggerTimer.registerTimerEvent(1.97, true)
        triggerTimer.addAction(() => {
            AttributeUtil.forAllUnitsAttribute((unitHandle, attribute) => {
                UnitAttributeState.refreshUnitSolarAttribute(unitHandle, attribute);
            })
        })
        //
        BaseUtil.runLater(0.01, () => {
            se.on("属性刷新", () => {
                AttributeUtil.forAllUnitsAttribute((unitHandle, attribute) => {
                    UnitAttributeState.refreshUnitSolarAttribute(unitHandle, attribute);
                })
            })
        })

    }


    /**
     * 刷新单位携带的物品的属性值
     * @param unitHandle
     * @param attribute
     */
    static refreshUnitSolarAttribute(unitHandle: unit, attribute ?: AppAttribute) {
        //开发环境 校验一下handle类型 以提前告知地图发生了 地图脚本使用了 错误的重用handle
        if (isDebug && !HandleUtil.isUnitHandle(unitHandle)) {
            print_r(handledef(unitHandle));
            log.errorWithTraceBack("你传的单位handle 有误。可能已被其它类型的handle对象重用")
            return
        }
        if (!attribute) {
            attribute = AttributeUtil.getUnitAttribute(unitHandle);
        }
        if (!attribute) {
            return
        }
        //死亡单位不刷新
        if (!UnitStateUtil.isAlive(unitHandle)) {
            return;
        }
        //刷新装备总计数值到单位
        let solarData = DataBase.getUnitSolarData(unitHandle);

        //108 = dataA
        //one case 将最新的数据刷新到单位绿字上 若最新的不存在则重置旧的数据到0
        if (attribute.attack) {
            UnitUtil.setExtraAttack(unitHandle, attribute.attack ?? 0, "_SLA_attack");
        }
        if (attribute.attack_p) {//攻击 计算绿字
            //基础伤害不包括绿字 和附加伤害 但是会包括主属性绿字奖励的攻击力
            //攻击最大值 包括 白字和绿字攻击力
            let base = GetUnitState(unitHandle, UnitStateDamageMax) - (solarData._sla_temp_attack_p || 0)
            let val = (attribute.attack_p ?? 0) * base
            if (val < 2100000000) {//不是大数值走整数 大数值才能走实数模拟 走整数可以防止小数点浮动
                val = Math.floor(val)//整数最大约21亿多
            }
            solarData._sla_temp_attack_p = val
            UnitUtil.setExtraAttack(unitHandle, val, "_SLA_attack_p");
        }


        //one case
        if (attribute.life) {
            let val = attribute.life ?? 0
            UnitUtil.setExtraHp(unitHandle, val, "_SLA_life");
        }

        if (attribute.life_p) {
            let base = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE) - UnitUtil.getExtraHp(unitHandle, "_SLA_life_p");
            let val = (attribute.life_p ?? 0) * base
            if (val < 2100000000) {
                val = Math.floor(val);
            }
            UnitUtil.setExtraHp(unitHandle, val, "_SLA_life_p");
        }
        //one case
        if (attribute.mana) {
            let val = attribute.mana ? attribute.mana : 0
            UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana");
        }
        if (attribute.mana_p) {
            let base = GetUnitState(unitHandle, UNIT_STATE_MAX_MANA) - UnitUtil.getExtraMana(unitHandle, "_SLA_mana_p");
            let val = (attribute.mana_p ?? 0) * base;
            if (val < 2100000000) {
                val = Math.floor(val);
            }
            UnitUtil.setExtraMana(unitHandle, val, "_SLA_mana_p");
        }
        //one case
        if (attribute.def != null) {
            let val = attribute.def ?? 0
            UnitUtil.setExtraDef(unitHandle, val, "_SLA_def");
        }
        if (attribute.def_p != null) {
            let base = GetUnitState(unitHandle, UnitStateArmor) - UnitUtil.getExtraDef(unitHandle, "_SLA_def_p");
            let val = (attribute.def_p ?? 0) * base
            if (val < 2100000000) {
                val = Math.floor(val);
            }
            // attribute.def_p_temp = val
            UnitUtil.setExtraDef(unitHandle, val, "_SLA_def_p");
        }
        //one case
        if (attribute.attackSpd_p != null) {//攻击速度 0.5 = 50%
            let val = attribute.attackSpd_p
            UnitUtil.setExtraAttackSpd(unitHandle, val, "_SLA_attackSpd_p");

        }
        //one case
        if (attribute.damage_cool != null) {//攻击间隔
            UnitUtil.setExtraDamageCool(unitHandle, attribute.damage_cool, "_SLA_damage_cool");
        }
        //one case
        if (attribute.damage_range != null) {//攻击范围
            UnitUtil.setExtraDamageRange(unitHandle, attribute.damage_range, "_SLA_damage_range");
        }
        //one case
        if (attribute.move_speed != null) {//移动速度
            UnitUtil.setExtraMoveSpeed(unitHandle, attribute.move_speed, "_SLA_move_speed");
        }
        //one case
        if (attribute.move_speed_p != null) {//移动速度
            let ms = GetUnitMoveSpeed(unitHandle) * attribute.move_speed_p
            UnitUtil.setExtraMoveSpeed(unitHandle, ms, "_SLA_move_speed_p");
        }
        //one case 属性附加
        let strength = attribute.full_property ?? 0
        let agility = strength
        let intelligence = strength
        let strength_p = (attribute.full_property_p || 0) + (attribute.strength_p || 0)
        let agility_p = (attribute.full_property_p || 0) + (attribute.agility_p || 0)
        let intelligence_p = (attribute.full_property_p || 0) + (attribute.intelligence_p || 0)
        //
        if (attribute.strength) {
            strength += attribute.strength
        }
        if (strength_p) {//属性增幅 计算绿字 即使为0也要走一下 以清空_sla_temp_strength_p到0
            let base = 0;
            if (UnitAttributeState.greenIncrease) {
                base = GetHeroStr(unitHandle, true) - (solarData._sla_temp_strength_p || 0);
            } else {
                base = GetHeroStr(unitHandle, false);
            }

            let val = (strength_p ?? 0) * base;
            if (val < 2100000000) {
                val = Math.floor(val);
            }
            strength += val
            solarData._sla_temp_strength_p = val
        }
        if (attribute.agility) {
            agility += attribute.agility
        }
        if (agility_p) {
            let base = 0;
            if (UnitAttributeState.greenIncrease) {
                base = GetHeroAgi(unitHandle, true) - (solarData._sla_temp_agility_p || 0);
            } else {
                base = GetHeroAgi(unitHandle, false);
            }
            let val = (agility_p ?? 0) * base;
            if (val < 2100000000) {
                val = Math.floor(val);
            }
            agility += val
            solarData._sla_temp_agility_p = val
        }
        if (attribute.intelligence) {
            intelligence += attribute.intelligence
        }
        if (intelligence_p) {
            let base = 0;
            if (UnitAttributeState.greenIncrease) {
                base = GetHeroInt(unitHandle, true) - (solarData._sla_temp_intelligence_p || 0);
            } else {
                base = GetHeroInt(unitHandle, false);
            }
            let val = (intelligence_p ?? 0) * base;
            if (val < 2100000000) {
                val = Math.floor(val);
            }
            intelligence += val
            solarData._sla_temp_intelligence_p = val
        }

        UnitUtil.setExtraStrAgiInt(unitHandle, "_SLA_StrAgiInt", strength, agility, intelligence);

    }


}
