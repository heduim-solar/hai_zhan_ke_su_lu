import SingletonUtil from "@/SingletonUtil";
import LangUtil from "@/LangUtil";

/**
 * 物品模拟
 * 可模拟无主动使用的装备
 * （应用场景：ORPG地图上万装备时 建实际物编太卡 单局同时出现的物品不会超过太多 可以用1000个模板物品来运转这上万个装备）
 */
export default class ItemSimulate {
    //配置一个查找器 根据需要模拟的物品id(4个字符的256进制) 获得需要模拟的物品信息
    static finder: (itemId: number) => iobj = null;

    //空技能的 模板物品id 可手动指定更多模板id 以免出现模拟物品使用不够的情况
    static templateIds = ["azhr", "bzbe", "bzbf", "ches", "dkfw", "dphe", "dthb", "engs", "glsk", "gmfr", "gopr", "jpnt",
        "k3m1", "k3m2", "k3m3", "ktrm", "kybl", "kygh", "kymn", "kysn", "ledg", "mgtk", "mort", "phlt", "sclp", "sehr",
        "shwd", "skrt", "sorf", "soul", "thle", "wolg", "wtlg"]
    /**
     * 整数物品的id  与模板id的 映射关系
     */
    static ft_itemIdMap: {
        [fakeId: number]: number
    } = {}
    //模板id 与模拟物品id 的映射
    static tf_itemIdMap: {
        [templateId: number]: number
    } = {}
    //使用数量 这个数量超过模板物品id 会报错 请保证模板id 足够当前游戏局使用
    static index: number = 0;


    constructor() {
        if (SingletonUtil.notFirstTime(ItemSimulate)) {
            print("不能重复new ItemSimulate()")
            return;
        }
        if (!ItemSimulate.finder) {
            print("请先配置物品模拟信息查找器")
            return;
        }
        ItemSimulate._sl_init();
    }

    private static _sl_isInit = false;

    /**
     * 获取真实的物编id
     */
    static getRealObjId(itemid: string | number): number {
        let intId = LangUtil.getIntId(itemid);
        //判断是否已是真实id
        if (_g_objs.item[id2string(intId)]) {
            return intId;
        }
        //从缓存中拿
        let templateId = ItemSimulate.ft_itemIdMap[intId];
        if (templateId) {
            return templateId;
        }
        //模拟id 从模板id池 申请一个id与此id对应
        if (ItemSimulate.index >= ItemSimulate.templateIds.length) {
            log.errorWithTraceBack("模拟物品已达到上限:" + ItemSimulate.index)
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 30, "模拟物品已达到上限(请重开游戏，减少物品类型出现总数):" + ItemSimulate.index);
            return 0;
        }
        //判断是否是模拟物品
        let simulateData = ItemSimulate.finder(intId);
        if (simulateData == null) {
            log.errorWithTraceBack("你正在创建一个不存在的物品:" + id2string(intId) + " -> " + intId)
            return 0;
        }
        //
        templateId = FourCC(ItemSimulate.templateIds[ItemSimulate.index])
        ItemSimulate.ft_itemIdMap[intId] = templateId
        ItemSimulate.tf_itemIdMap[templateId] = intId
        ItemSimulate.index++;
        //模拟数据 套到 模板物品上
        EXSetItemDataString(templateId, 1, simulateData.Art)
        EXSetItemDataString(templateId, 4, simulateData.Tip)
        EXSetItemDataString(templateId, 3, simulateData.Ubertip)
        if (isEmbedJapi) {
            //设置名字
            EXSetItemDataString(templateId, 2, simulateData.Tip)
            //设置物品描述
            EXSetItemDataString(templateId, 5, simulateData.Ubertip)
        }
        //
        return templateId;
    }

    /**
     * 获取逻辑物品id
     * (如果是模板id 则返回模拟的物品id)
     * @param intId
     */
    static getLogicId(intId: number): number {
        //从缓存中拿
        let logicId = ItemSimulate.tf_itemIdMap[intId];
        if (logicId) {
            return logicId;
        }
        return intId;
    }

    /**
     * hook 原生函数
     * @private
     */
    private static _sl_init() {
        if (ItemSimulate._sl_isInit) {
            return
        }
        ItemSimulate._sl_isInit = true;
        //one case
        let oldCreateItem = CreateItem;
        _G.CreateItem = function (this: void, itemid: number | string, x: number, y: number): item {
            let realObjId = ItemSimulate.getRealObjId(itemid);
            return oldCreateItem(realObjId, x, y);
        }
        //one case
        let oldUnitAddItemById = UnitAddItemById;
        _G.UnitAddItemById = function (this: void, whichUnit: unit, itemid: number | string): item {
            let realObjId = ItemSimulate.getRealObjId(itemid);
            return oldUnitAddItemById(whichUnit, realObjId);
        }
        //one case
        let oldUnitAddItemToSlotById = UnitAddItemToSlotById;
        _G.UnitAddItemToSlotById = function (this: void, whichUnit: unit, itemid: number | string, itemSlot: number): boolean {
            let realObjId = ItemSimulate.getRealObjId(itemid);
            return oldUnitAddItemToSlotById(whichUnit, realObjId, itemSlot);
        }

        //使用
        //one case
        let oldGetItemTypeId = GetItemTypeId;
        _G.GetItemTypeId = function (this: void, i: item): number {
            let realItemTypeId = oldGetItemTypeId(i);
            let logicId = ItemSimulate.getLogicId(realItemTypeId);
            return logicId;
        }
    }


}