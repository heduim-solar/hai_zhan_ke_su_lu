import LangUtil from "../lang/LangUtil";

/**
 * 技能映射
 *
 * 通常在使用QWER模板技能时 释放自定义的技能
 *
 */
export default class AbilityMappingUtil {

    private static abilityMappingData: {
        [unitHandleId: number]: {
            [qwerId: number]: number
        }
    } = {}


    /**
     * 将类似qwer这种模板id 在释放时 映射到真正需要释放的技能id
     * @param unit 需要映射技能的 单位
     * @param templateId qwer模板的技能物编id
     * @param targetId 目标技能id也可以是虚拟的技能(即无真实技能物编是这个id)
     */
    static mapping(unit: unit, templateId: string, targetId: string) {
        //启动映射系统
        AbilityMappingUtil._sl_init_mapping_system();
        //
        let unitHandleId = GetHandleId(unit);
        let mappingDatum = AbilityMappingUtil.abilityMappingData[unitHandleId];
        if (!mappingDatum) {
            mappingDatum = {};
            AbilityMappingUtil.abilityMappingData[unitHandleId] = mappingDatum;
        }
        mappingDatum[FourCC(templateId)] = FourCC(targetId);

    }


    /**
     *
     * @param unit 移除所有技能映射的单位
     */
    static removeMappings(unit: unit): void {
        let unitHandleId = GetHandleId(unit);
        let mappingDatum = AbilityMappingUtil.abilityMappingData[unitHandleId];
        if (mappingDatum) {
            AbilityMappingUtil.abilityMappingData[unitHandleId] = null;
        }
    }

    /**
     *
     * @param unit 移除映射的单位
     * @param templateId 指定映射的技能
     */
    static removeMapping(unit: unit, templateId: string): void {
        let unitHandleId = GetHandleId(unit);
        let mappingDatum = AbilityMappingUtil.abilityMappingData[unitHandleId];
        if (mappingDatum) {
            mappingDatum[FourCC(templateId)] = null;
        }
    }

    /**
     *
     * 获取真实的释放id 获取到模板id 即没有经过本系统处理的id
     */
    static getRealSpellAbilityId() {
        //todo
        // return CJ.GetSpellAbilityId();
    }


    private static _sl_isInitialized = false

    private static _sl_init_mapping_system() {
        if (AbilityMappingUtil._sl_isInitialized) {
            return;
        }
        //重写 GetSpellAbilityId
        let oldGetSpellAbilityId = GetSpellAbilityId;
        _G.GetSpellAbilityId = function (this: void) {
            let cjRealId = oldGetSpellAbilityId();
            //判断是否有映射的id
            let unitHandleId = GetHandleId(GetTriggerUnit());
            let targetId = AbilityMappingUtil.abilityMappingData[unitHandleId]?.[cjRealId];
            if (targetId) {
                //返回映射后的id
                return targetId;
            }
            //返回真实的id
            return cjRealId;
        }
        //重写 GetUnitAbilityLevel 以应对被动技能
        let oldGetUnitAbilityLevel = GetUnitAbilityLevel;
        _G.GetUnitAbilityLevel = function (this: void, whichUnit: unit, abilcode: number | string) {

            //判断是否有映射的id
            let unitHandleId = GetHandleId(whichUnit);
            if (LangUtil.isString(abilcode)) {
                abilcode = FourCC(abilcode as string)
            }
            //遍历是否有此id对应的模板id
            let mappingDatum = AbilityMappingUtil.abilityMappingData[unitHandleId];
            for (let templateIdNum in mappingDatum) {
                if (mappingDatum[templateIdNum] == abilcode) {
                    //返回映射的模板id等级
                    return oldGetUnitAbilityLevel(whichUnit, templateIdNum);
                }
            }
            //返回真实的等级
            let cjRealLv = oldGetUnitAbilityLevel(whichUnit, abilcode);
            return cjRealLv;
        }

        //
        AbilityMappingUtil._sl_isInitialized = true;
    }

}