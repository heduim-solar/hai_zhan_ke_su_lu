local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 14,["7"] = 14,["8"] = 14,["10"] = 14,["11"] = 28,["12"] = 28,["13"] = 28,["15"] = 30,["16"] = 31,["17"] = 32,["18"] = 33,["22"] = 37,["23"] = 38,["24"] = 42,["25"] = 42,["27"] = 45,["28"] = 45,["29"] = 50,["30"] = 51,["31"] = 28,["32"] = 54,["33"] = 54,["34"] = 54,["36"] = 55,["37"] = 55,["38"] = 55,["39"] = 55,["40"] = 55,["41"] = 55,["42"] = 55,["43"] = 54,["44"] = 58,["45"] = 58,["46"] = 58,["48"] = 59,["49"] = 59,["50"] = 59,["51"] = 59,["52"] = 59,["53"] = 59,["54"] = 59,["55"] = 58,["56"] = 62,["57"] = 62,["58"] = 62,["60"] = 63,["61"] = 63,["62"] = 63,["63"] = 63,["64"] = 63,["65"] = 63,["66"] = 63,["67"] = 62,["68"] = 73,["69"] = 74,["70"] = 74,["71"] = 74,["72"] = 74,["73"] = 74,["74"] = 74,["75"] = 74,["76"] = 73,["77"] = 82,["78"] = 83,["79"] = 83,["80"] = 82,["81"] = 90,["82"] = 91,["83"] = 91,["84"] = 90,["85"] = 98,["86"] = 99,["87"] = 99,["88"] = 98,["89"] = 16,["90"] = 17,["91"] = 18,["92"] = 19,["93"] = 20});
local ____exports = {}
____exports.default = __TS__Class()
local DebugSgpUtil = ____exports.default
DebugSgpUtil.name = "DebugSgpUtil"
function DebugSgpUtil.prototype.____constructor(self)
end
function DebugSgpUtil.addCustomMenu(self, menuName, onAction, category, editorActionCommand, editorActionCommandParams)
    if category == nil then
        category = "基础"
    end
    local categoryMenu = nil
    for ____, temp in ipairs(____exports.default._sl_customMenus) do
        if temp.name == category then
            categoryMenu = temp
            break
        end
    end
    if not categoryMenu then
        categoryMenu = {name = category, menuItems = {}}
        local ____exports_default__sl_customMenus_0 = ____exports.default._sl_customMenus
        ____exports_default__sl_customMenus_0[#____exports_default__sl_customMenus_0 + 1] = categoryMenu
    end
    local ____categoryMenu_menuItems_1 = categoryMenu.menuItems
    ____categoryMenu_menuItems_1[#____categoryMenu_menuItems_1 + 1] = {name = menuName, editorActionCommand = editorActionCommand, editorActionCommandParams = editorActionCommandParams}
    local key = (category .. "_sl_") .. menuName
    ____exports.default._sl_customMenuActions[key] = onAction
end
function DebugSgpUtil.addCustomMenu_SelectUnitIds(self, menuName, onAction, category)
    if category == nil then
        category = "单位测试"
    end
    ____exports.default:addCustomMenu(
        menuName,
        onAction,
        category,
        "ObjectSelectPanel",
        "unit"
    )
end
function DebugSgpUtil.addCustomMenu_SelectItemIds(self, menuName, onAction, category)
    if category == nil then
        category = "物品测试"
    end
    ____exports.default:addCustomMenu(
        menuName,
        onAction,
        category,
        "ObjectSelectPanel",
        "unit"
    )
end
function DebugSgpUtil.addCustomMenu_SelectAbilityIds(self, menuName, onAction, category)
    if category == nil then
        category = "技能测试"
    end
    ____exports.default:addCustomMenu(
        menuName,
        onAction,
        category,
        "ObjectSelectPanel",
        "unit"
    )
end
function DebugSgpUtil.addCustomMenu_SelectCustomStrs(self, menuName, onAction, category, allOptionStrs)
    ____exports.default:addCustomMenu(
        menuName,
        onAction,
        category,
        "CustomStrsPanel",
        allOptionStrs
    )
end
function DebugSgpUtil.addOnCreateUnitListener(self, listener)
    local ____exports_default__sl_onCreateUnitListeners_2 = ____exports.default._sl_onCreateUnitListeners
    ____exports_default__sl_onCreateUnitListeners_2[#____exports_default__sl_onCreateUnitListeners_2 + 1] = listener
end
function DebugSgpUtil.addOnCreateItemListener(self, listener)
    local ____exports_default__sl_onCreateItemListeners_3 = ____exports.default._sl_onCreateItemListeners
    ____exports_default__sl_onCreateItemListeners_3[#____exports_default__sl_onCreateItemListeners_3 + 1] = listener
end
function DebugSgpUtil.addOnCreateAbilityUnitListener(self, listener)
    local ____exports_default__sl_onCreateAbilityUnitListeners_4 = ____exports.default._sl_onCreateAbilityUnitListeners
    ____exports_default__sl_onCreateAbilityUnitListeners_4[#____exports_default__sl_onCreateAbilityUnitListeners_4 + 1] = listener
end
DebugSgpUtil._sl_onCreateUnitListeners = {}
DebugSgpUtil._sl_onCreateItemListeners = {}
DebugSgpUtil._sl_onCreateAbilityUnitListeners = {}
DebugSgpUtil._sl_customMenus = {}
DebugSgpUtil._sl_customMenuActions = {}
return ____exports
