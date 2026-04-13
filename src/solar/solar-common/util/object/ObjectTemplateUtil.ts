import ObjectPool from "@/ObjectPool";
import DataBase from "@/DataBase";
import DebugUtil from "@/DebugUtil";
import TextUtil from "@/TextUtil";

/**
 * 物编模板
 *   使用前需添加基础物编模板（可在太阳编辑器文件树右键新建中一键添加）
 *
 */
export default class ObjectTemplateUtil {


    static templateInfo: { [templateType: string]: string[] } = {}
    private static _sl_templateStateInfo: {
        [template: string]: {
            objectPool: ObjectPool<string>
            useIndex: number
        }
    } = {}


    /**
     * 获取模板可用的空闲模板数量
     * @param templateType
     */
    static getTemplateIdleCount(templateType: string) {
        let strings = ObjectTemplateUtil.templateInfo[templateType];
        let state = ObjectTemplateUtil._sl_templateStateInfo[templateType];
        return strings.length - ((state?.useIndex || -1) + 1) + (state?.objectPool?.getNumIdle() || 0)
    }

    /**
     * 打印模板id相关信息 方便调试
     */
    static printTemplateInfo() {
        ObjectTemplateUtil._sl_init()
        print("=======ObjectTemplate Start======");
        BJDebugMsg("=======ObjectTemplate Start======");
        let itemKey: string[] = []
        let abilityKey: string[] = []
        let unitKey: string[] = []
        for (let templateInfoKey in ObjectTemplateUtil.templateInfo) {
            if (templateInfoKey.indexOf("物品") >= 0) {
                itemKey.push(templateInfoKey)
            } else if (templateInfoKey.indexOf("主动") >= 0) {
                abilityKey.push(templateInfoKey)
            } else {
                unitKey.push(templateInfoKey)
            }
        }
        abilityKey.sort((a, b) => {
            let an = a.substring(6)
            let bn = b.substring(6)
            return tonumber(an) - tonumber(bn);
        })
        let allKey: string[] = [];
        allKey.push(...itemKey)
        allKey.push(...abilityKey)
        for (let templateInfoKey of allKey) {
            let strings = ObjectTemplateUtil.templateInfo[templateInfoKey];
            let state = ObjectTemplateUtil._sl_templateStateInfo[templateInfoKey];
            let nameCol = TextUtil.rightPad(templateInfoKey, 8, " ")

            let useInfo = TextUtil.rightPad((state?.objectPool?.getNumActive() || 0) + " / " + ((state?.useIndex || -1) + 1) + " / " + strings.length, 6, " ")
            let info = nameCol + "    [ " + useInfo + " ]:  " + strings[0] + "  ......";
            print(info)
            BJDebugMsg(info)
        }
        // let uinfo = ""
        // for (let templateInfoKey of unitKey) {
        //     if (uinfo != "") {
        //         uinfo += ","
        //     }
        //     uinfo += templateInfoKey
        // }
        // print(uinfo)
        // BJDebugMsg(uinfo)
        // print("=======ObjectTemplate End======");
        // BJDebugMsg("=======ObjectTemplate End======");
    }

    /**
     * 清洗通魔 ability
     * 使所有数据恢复的初始默认值
     * @param ability
     */
    static cleanAbility(ability: ability) {
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_COOL, 0.5)
        EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_HOTKET, 0)
        //默认为 无目标
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1);
        EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0);
    }


    /**
     * 获取一个模版技能id
     * @param unit
     * @param abilityNum 技能所在位置序号 1-12 不传则自动计算空的位置
     */
    static addUnitAbilityTemplate(unit: unit, abilityNum?: number): string {
        let abilityTemplate = DataBase.getUnitSolarData(unit)._SL_abilityTemplate;
        if (abilityTemplate == null) {
            abilityTemplate = {};
            DataBase.getUnitSolarData(unit)._SL_abilityTemplate = abilityTemplate
        }
        //如果为空则自动分配一个位置
        if (abilityNum == null || abilityNum <= 0) {
            for (let i = 1; i <= 12; i++) {
                if (abilityTemplate[i] == null) {
                    abilityNum = i;
                    break;
                }
            }
        }
        if (abilityTemplate[abilityNum] == null) {
            let templateType = "主动" + abilityNum
            abilityTemplate[abilityNum] = ObjectTemplateUtil.borrowTemplate(templateType)
            UnitAddAbility(unit, abilityTemplate[abilityNum])
            ObjectTemplateUtil.cleanAbility(EXGetUnitAbility(unit, abilityTemplate[abilityNum]))
            return abilityTemplate[abilityNum];
        } else {
            log.errorWithTraceBack("这个位置已经有模板实例了。请先销毁这个位置的技能引用实例。" +
                GetUnitName(unit) + "->" + tostring(abilityNum) + "=" + abilityTemplate[abilityNum])
            return null;
        }

    }

    /**
     * 从单位移除一个模版技能
     * @param unit
     * @param abilityId
     */
    static removeUnitAbilityTemplate(unit: unit, abilityId: string): void {
        let abilityTemplate = DataBase.getUnitSolarData(unit, false)?._SL_abilityTemplate;
        if (abilityTemplate != null) {
            for (let key in abilityTemplate) {
                if (abilityTemplate[key] == abilityId) {
                    abilityTemplate[key] = null;
                }
            }
        }
        UnitRemoveAbility(unit, abilityId);
        let abilityObj = _g_objs.ability[abilityId];
        ObjectTemplateUtil.returnTemplate(abilityObj['Tip1'] || abilityObj.Tip, abilityId)
    }

    /**
     * 获取单位 默认的下一个技能位置序号
     * @param unit
     * @param startNum
     */
    static getUnitAbilityTemplateNextNumber(unit: unit, startNum: number = 1) {
        let abilityTemplate = DataBase.getUnitSolarData(unit)._SL_abilityTemplate;
        if (abilityTemplate == null) {
            return startNum;
        }
        //如果为空则自动分配一个位置
        for (let i = startNum; i <= 12; i++) {
            if (abilityTemplate[i] == null) {
                return i;
            }
        }
        log.errorWithTraceBack("单位" + GetUnitName(unit) + "从起始位置" + startNum + "开始已经没有多余的空位置了!")
        return 12;
    }


    /**
     * 领取一个模板
     * @param templateType
     */
    static borrowTemplate(templateType: string): string {
        ObjectTemplateUtil._sl_init();
        //
        let stateInfo = ObjectTemplateUtil._sl_templateStateInfo[templateType];
        if (stateInfo == null) {
            let objTemplates = ObjectTemplateUtil.templateInfo[templateType];
            let objectPool = new ObjectPool<string>(() => {
                stateInfo.useIndex++;
                if (objTemplates == null || stateInfo.useIndex >= objTemplates.length) {
                    let info = "模板不足!请增加基础模板物编的数量!当前类型的模板数量:" + templateType + " -> " + objTemplates?.length
                    BJDebugMsg(info)
                    print("请检查是否有模板泄漏的情况。即移除物品时未归还模板id。")
                    log.errorWithTraceBack(info)
                    return null;
                } else if (objTemplates.length > 10 && (stateInfo.useIndex + 3) > objTemplates.length) {
                    //提前警告 以免报错时 一大堆堆栈信息。事实上我们只需要知道是哪个模板不足的信息就可以了
                    BJDebugMsg("|cffff0000【太阳TS框架提示】《" + templateType + "》(" + objTemplates.length + ")模板不足！" +
                        "请作者增加模板!玩家可减少场上存在的技能或物品等，以免地图逻辑出错！")
                }
                return objTemplates[stateInfo.useIndex]
            });
            stateInfo = {
                useIndex: -1,
                objectPool: objectPool,
            }
            ObjectTemplateUtil._sl_templateStateInfo[templateType] = stateInfo;
        }
        return stateInfo.objectPool.borrowObject();
    }

    /**
     * 返还一个模板技能
     * （当模板技能领取后不再使用时可以使用此方法返还这个技能 以让后续的其他需要获取的地方能继续使用这个模板技能）
     * @param templateType
     * @param objIdStr
     */
    static returnTemplate(templateType: string, objIdStr: string) {
        let stateInfo = ObjectTemplateUtil._sl_templateStateInfo[templateType];
        if (stateInfo == null) {
            return;
        }
        return stateInfo.objectPool.returnObject(objIdStr)
    }


    /**
     * 初始化模板技能 数据
     * @private
     */
    private static _sl_isInitialized = false

    static _sl_init() {
        if (ObjectTemplateUtil._sl_isInitialized) {
            return
        }
        DebugUtil.refreshCodeExecStartTime();
        let _sl_templateName = "[$ST]";
        for (let objId in _g_objs.ability) {
            let objInfo = _g_objs.ability[objId];
            if (objInfo.Name == _sl_templateName) {
                this.addTemplate(objInfo.Tip1 || objInfo.Tip, objId)
            }
        }
        for (let objId in _g_objs.item) {
            let objInfo = _g_objs.item[objId];
            if (objInfo.Name == _sl_templateName) {
                this.addTemplate(objInfo.Tip, objId)
            }
        }
        for (let objId in _g_objs.unit) {
            let objInfo = _g_objs.unit[objId];
            if (objInfo.Name == _sl_templateName) {
                this.addTemplate(objInfo.Tip, objId)
            }
        }
        //
        ObjectTemplateUtil._sl_isInitialized = true;
        let number = DebugUtil.countCodeExecuteTime();
        if (number > 0.01) {
            print("模板初始化耗时:" + number)
        }
        se.playerChat("-sl-tmpl", () => {
            ObjectTemplateUtil.printTemplateInfo()
        })
    }

    static addTemplate(template: string, objIdStr: string) {
        let templates = ObjectTemplateUtil.templateInfo[template];
        if (templates == null) {
            templates = []
            ObjectTemplateUtil.templateInfo[template] = templates;
        }
        templates.push(objIdStr)
    }


}