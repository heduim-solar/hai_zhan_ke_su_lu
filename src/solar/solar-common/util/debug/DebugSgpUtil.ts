/**
 * sgp = solar game plugin （太阳编辑器游戏插件）
 * 可通过此类与左上角的太阳按钮交互 提交自定义的扩展功能 以方便调试
 */
type EditorActionCommand = "ObjectSelectPanel" | string
type CustomMenuType = {
    name: string//分类 一级菜单名
    menuItems: {
        name: string,//二级具体的可点击菜单的名字
        editorActionCommand?: EditorActionCommand //编辑器动作命令
        editorActionCommandParams?: any //编辑器动作命令的参数
    }[]
}
export default class DebugSgpUtil {

    static _sl_onCreateUnitListeners: ((unit: unit) => void)[] = [];
    static _sl_onCreateItemListeners: ((item: item) => void)[] = [];
    static _sl_onCreateAbilityUnitListeners: ((unit: unit, abilityIds: string[]) => void)[] = [];
    static _sl_customMenus: CustomMenuType[] = [];
    static _sl_customMenuActions: { [key: string]: (...args: any[]) => void } = {};


    /**
     * 添加自定义的菜单项
     * 请在地图游戏开始1.5秒内添加 之后添加的数据不会被刷新到太阳按钮上
     * editorActionCommand 会在点击onAction回调之前在编辑器里执行 并且将执行的结果传入onAction的参数列表
     */
    static addCustomMenu(menuName: string, onAction: (...args: any[]) => void, category: string = "基础",
                         editorActionCommand?: EditorActionCommand, editorActionCommandParams?: any) {
        let categoryMenu: CustomMenuType = null;
        for (let temp of DebugSgpUtil._sl_customMenus) {
            if (temp.name == category) {
                categoryMenu = temp;
                break
            }
        }
        if (!categoryMenu) {
            categoryMenu = {
                name: category,
                menuItems: []
            }
            DebugSgpUtil._sl_customMenus.push(categoryMenu);
        }
        //
        categoryMenu.menuItems.push({
            name: menuName,
            editorActionCommand: editorActionCommand,
            editorActionCommandParams: editorActionCommandParams
        });
        let key = category + "_sl_" + menuName;
        DebugSgpUtil._sl_customMenuActions[key] = onAction;
    }

    static addCustomMenu_SelectUnitIds(menuName: string, onAction: (unitIds: string[]) => void, category: string = "单位测试") {
        DebugSgpUtil.addCustomMenu(menuName, onAction, category, "ObjectSelectPanel", "unit")
    }

    static addCustomMenu_SelectItemIds(menuName: string, onAction: (itemIds: string[]) => void, category: string = "物品测试") {
        DebugSgpUtil.addCustomMenu(menuName, onAction, category, "ObjectSelectPanel", "unit")
    }

    static addCustomMenu_SelectAbilityIds(menuName: string, onAction: (abilityIds: string[]) => void, category: string = "技能测试") {
        DebugSgpUtil.addCustomMenu(menuName, onAction, category, "ObjectSelectPanel", "unit")
    }

    /**
     *
     * @param menuName 菜单名字
     * @param onAction 点击后的回调
     * @param category 菜单分类
     * @param allOptionStrs 所有字符串选项
     */
    static addCustomMenu_SelectCustomStrs(menuName: string, onAction: (choiceStrs: string[]) => void, category: string, allOptionStrs: string[]) {
        DebugSgpUtil.addCustomMenu(menuName, onAction, category, "CustomStrsPanel", allOptionStrs)
    }

    /**
     * 在左上角太阳按钮右键点击创建单位物编后会回调此方法
     * 添加创建单位的监听
     * @param listener
     */
    static addOnCreateUnitListener(listener: (unit: unit) => void) {
        DebugSgpUtil._sl_onCreateUnitListeners.push(listener)
    }

    /**
     * 创建物品物编时的回调
     * @param listener
     */
    static addOnCreateItemListener(listener: (item: item) => void) {
        DebugSgpUtil._sl_onCreateItemListeners.push(listener)
    }

    /**
     * 创建携带技能的单位
     * @param listener
     */
    static addOnCreateAbilityUnitListener(listener: (unit: unit, abilityIds: string[]) => void) {
        DebugSgpUtil._sl_onCreateAbilityUnitListeners.push(listener)
    }


}