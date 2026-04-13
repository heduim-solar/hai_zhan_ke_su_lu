local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 9,["11"] = 9,["12"] = 9,["14"] = 32,["15"] = 33,["18"] = 36,["19"] = 37,["22"] = 40,["23"] = 31,["24"] = 48,["25"] = 49,["26"] = 51,["27"] = 52,["29"] = 55,["30"] = 56,["31"] = 57,["33"] = 60,["34"] = 61,["35"] = 62,["36"] = 62,["37"] = 62,["38"] = 62,["39"] = 62,["40"] = 62,["41"] = 62,["42"] = 63,["44"] = 66,["45"] = 67,["46"] = 68,["47"] = 69,["49"] = 72,["50"] = 73,["51"] = 74,["53"] = 75,["54"] = 77,["55"] = 78,["56"] = 79,["57"] = 80,["58"] = 82,["59"] = 84,["61"] = 87,["62"] = 48,["63"] = 95,["64"] = 97,["65"] = 98,["66"] = 99,["68"] = 101,["69"] = 95,["70"] = 108,["71"] = 109,["74"] = 112,["75"] = 114,["76"] = 115,["77"] = 116,["78"] = 117,["79"] = 115,["80"] = 120,["81"] = 121,["82"] = 122,["83"] = 123,["84"] = 121,["85"] = 126,["86"] = 127,["87"] = 128,["88"] = 129,["89"] = 127,["90"] = 134,["91"] = 135,["92"] = 136,["93"] = 137,["94"] = 138,["95"] = 135,["96"] = 108,["97"] = 11,["98"] = 14,["99"] = 14,["100"] = 14,["101"] = 14,["102"] = 14,["103"] = 14,["104"] = 14,["105"] = 14,["106"] = 14,["107"] = 14,["108"] = 14,["109"] = 14,["110"] = 14,["111"] = 14,["112"] = 14,["113"] = 14,["114"] = 14,["115"] = 14,["116"] = 14,["117"] = 14,["118"] = 14,["119"] = 14,["120"] = 14,["121"] = 14,["122"] = 14,["123"] = 14,["124"] = 14,["125"] = 14,["126"] = 14,["127"] = 14,["128"] = 14,["129"] = 14,["130"] = 14,["131"] = 14,["132"] = 14,["133"] = 22,["134"] = 26,["135"] = 28,["136"] = 43});
local ____exports = {}
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____LangUtil = require("solar.solar-common.util.lang.LangUtil")
local LangUtil = ____LangUtil.default
____exports.default = __TS__Class()
local ItemSimulate = ____exports.default
ItemSimulate.name = "ItemSimulate"
function ItemSimulate.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new ItemSimulate()")
        return
    end
    if not ____exports.default.finder then
        print("请先配置物品模拟信息查找器")
        return
    end
    ____exports.default:_sl_init()
end
function ItemSimulate.getRealObjId(self, itemid)
    local intId = LangUtil:getIntId(itemid)
    if _g_objs.item[id2string(intId)] then
        return intId
    end
    local templateId = ____exports.default.ft_itemIdMap[intId]
    if templateId then
        return templateId
    end
    if ____exports.default.index >= #____exports.default.templateIds then
        log.errorWithTraceBack("模拟物品已达到上限:" .. tostring(____exports.default.index))
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            30,
            "模拟物品已达到上限(请重开游戏，减少物品类型出现总数):" .. tostring(____exports.default.index)
        )
        return 0
    end
    local simulateData = ____exports.default:finder(intId)
    if simulateData == nil then
        log.errorWithTraceBack((("你正在创建一个不存在的物品:" .. id2string(intId)) .. " -> ") .. tostring(intId))
        return 0
    end
    templateId = FourCC(____exports.default.templateIds[____exports.default.index + 1])
    ____exports.default.ft_itemIdMap[intId] = templateId
    ____exports.default.tf_itemIdMap[templateId] = intId
    local ____exports_default_0, ____index_1 = ____exports.default, "index"
    ____exports_default_0[____index_1] = ____exports_default_0[____index_1] + 1
    EXSetItemDataString(templateId, 1, simulateData.Art)
    EXSetItemDataString(templateId, 4, simulateData.Tip)
    EXSetItemDataString(templateId, 3, simulateData.Ubertip)
    if isEmbedJapi then
        EXSetItemDataString(templateId, 2, simulateData.Tip)
        EXSetItemDataString(templateId, 5, simulateData.Ubertip)
    end
    return templateId
end
function ItemSimulate.getLogicId(self, intId)
    local logicId = ____exports.default.tf_itemIdMap[intId]
    if logicId then
        return logicId
    end
    return intId
end
function ItemSimulate._sl_init(self)
    if ____exports.default._sl_isInit then
        return
    end
    ____exports.default._sl_isInit = true
    local oldCreateItem = CreateItem
    _G.CreateItem = function(itemid, x, y)
        local realObjId = ____exports.default:getRealObjId(itemid)
        return oldCreateItem(realObjId, x, y)
    end
    local oldUnitAddItemById = UnitAddItemById
    _G.UnitAddItemById = function(whichUnit, itemid)
        local realObjId = ____exports.default:getRealObjId(itemid)
        return oldUnitAddItemById(whichUnit, realObjId)
    end
    local oldUnitAddItemToSlotById = UnitAddItemToSlotById
    _G.UnitAddItemToSlotById = function(whichUnit, itemid, itemSlot)
        local realObjId = ____exports.default:getRealObjId(itemid)
        return oldUnitAddItemToSlotById(whichUnit, realObjId, itemSlot)
    end
    local oldGetItemTypeId = GetItemTypeId
    _G.GetItemTypeId = function(i)
        local realItemTypeId = oldGetItemTypeId(i)
        local logicId = ____exports.default:getLogicId(realItemTypeId)
        return logicId
    end
end
ItemSimulate.finder = nil
ItemSimulate.templateIds = {
    "azhr",
    "bzbe",
    "bzbf",
    "ches",
    "dkfw",
    "dphe",
    "dthb",
    "engs",
    "glsk",
    "gmfr",
    "gopr",
    "jpnt",
    "k3m1",
    "k3m2",
    "k3m3",
    "ktrm",
    "kybl",
    "kygh",
    "kymn",
    "kysn",
    "ledg",
    "mgtk",
    "mort",
    "phlt",
    "sclp",
    "sehr",
    "shwd",
    "skrt",
    "sorf",
    "soul",
    "thle",
    "wolg",
    "wtlg"
}
ItemSimulate.ft_itemIdMap = {}
ItemSimulate.tf_itemIdMap = {}
ItemSimulate.index = 0
ItemSimulate._sl_isInit = false
return ____exports
