import {Trigger} from '@/trigger';
import {Unit} from '@/unit';
import ActorItemUtil from "@/ActorItemUtil";
import ActorTypeUtil from "@/ActorTypeUtil";

/**
 *太阳 物品合成 系统
 */
export default class SolarNewItemsFormulaState {

    static modelPath = "Abilities\\Spells\\Items\\AIam\\AIamTarget.mdl";
    /**
     * config
     */
    static config: {
        [id: string]: {
            materials?: string[],//ids
            material?: { [id: string]: number },//材料带数量
        }
    } = {}

    constructor() {
        //初始化数据 将只有id的材料设置为 需要的数量为1
        let config = SolarNewItemsFormulaState.config;
        for (let id in config) {
            let configData = config[id];
            if (configData && configData.materials) {
                configData.material = {}
                for (let materialID of configData.materials) {
                    configData.material[materialID] = 1;
                }
            }
        }
        //触发
        let trigger = new Trigger()
        trigger.registerAnyUnitEvent(EVENT_PLAYER_UNIT_PICKUP_ITEM)
        trigger.addAction(this.action)
    }

    action(this: void) {
        let triggerUnit = Unit.fromEvent();
        //one case
        let config = SolarNewItemsFormulaState.config;
        for (let id in config) {
            let configData = config[id];
            let flag = SolarNewItemsFormulaState.NewItemsFormulaByMaterial(triggerUnit, id, configData.material);
            if (flag) {//如果合成了就退出
                return
            }
        }
    }


    static NewItemsFormulaByMaterial(unit: Unit, id: string, material: { [id: string]: number }): boolean {
        //检查是否满足材料
        let itemAndCharges = ActorItemUtil.getItemAndActorItemAndChargesFromUnit(unit.handle);
        for (const materialId in material) {
            let Charges = itemAndCharges[materialId]
            if (!Charges) {
                return false;
            }
            let materialCount = material[materialId];
            if (Charges < materialCount) {
                return false;
            }
        }
        //ok
        for (const materialId in material) {
            ActorItemUtil.costItemAndActorItemChargesFromUnit(unit.handle, materialId, material[materialId])
        }
        //create item
        if (ActorTypeUtil.hasActorType(id) ) {
            //合成演员物品
            ActorItemUtil.addActorItemForUnit(id, unit.handle)
        } else {
            UnitAddItemById(unit.handle, id);
        }
        DestroyEffect(AddSpecialEffectTarget(SolarNewItemsFormulaState.modelPath, unit.handle, "origin"))
        return true;
    }


}