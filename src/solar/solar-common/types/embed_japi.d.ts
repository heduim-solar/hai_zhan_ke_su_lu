/** @noSelfInFile */

/**
 * 这里是内置Japi的方法定义
 * 需要有内置japi 才能拥有这些的方法
 * 没有的话可以注释掉此文件
 */

/**
 * 内置环境与YDLua环境的区别 以及需要注意的实现
 * 不能在UI事件回调中设置部分UI事件 否则崩溃
 * (已知：鼠标移动时设置鼠标移动事件。鼠标点击时或键盘按下时给UI添加移入移出的事件)
 *
 * @constructor
 */

declare function GetPluginVersion(): any;

/** utf-8 内部已自动互转编码  响应超时为5秒*/
declare function post_message(url: string, post: string, onResult: (result: string) => void): any;

declare function SetOwner(owner: string): any;

declare function GetUserId(): number;

declare function GetUserIdEx(): string;

declare function GetUsedMemory(): number;

/**
 * 隐藏界面元素
 * （不会隐藏小地图。如需隐藏小地图需手动隐藏小地图）
 */
declare function FrameHideInterface(): void;

/**
 解锁帧数上限 突破60帧
 布尔值    is_unlock    填true解锁 填false恢复
 */
declare function UnlockFps(is_unlock: boolean): void;


/**
 * 获取是否窗口化模式
 */
declare function IsWindowMode(): boolean;

/**
 * 隐藏单位跟物品 鼠标指向时显示的UI 包括单位血条

 参数
 类型    名字        说明
 单位    handle    要修改的单位或物品
 字符串    is_show    是否显示 填false就是隐藏

 * @param Handle
 * @param is_show
 * @constructor
 */
declare function SetUnitPressUIVisible(Handle: handle, is_show: boolean): void;


declare function ShowFpsText(show: boolean): void;


declare function SetUnitProperName(handle: unit, name: string): void;

declare function SetUnitName(handle: unit, name: string): void;

declare function world_to_screen(x: number, y: number, z: number): LuaMultiReturn<[number, number, number]>;

/**
 * 屏幕坐标转世界坐标
 * 1    number    屏幕x轴 左到右 0 ~ 0.8
 * 2    number    屏幕y轴 上到下 0 ~ 0.6
 *
 * 返回值
 * 索引    类型    说明
 * 1    number    世界坐标x轴
 * 2    number    世界坐标y轴
 */
declare function screen_to_world(x: number, y: number): LuaMultiReturn<[number, number]>;

/**
 * 用来模拟血条 或者绑定UI到单位头顶时会用到
 * @param unit_handle
 */
declare function unit_overhead(unit_handle: unit): number;


// 获取 框选按钮 slot 从0 ~ 11
declare function FrameGetInfoSelectButton(slot: number): number;

// 获取 下方buff按钮 slot 从0 ~ 7
declare function FrameGetBuffButton(slot: number): number;

// 技能12个按钮
/**
 * @deprecated see DzFrameGetCommandBarButton( y,x )
 * @param x ??
 * @param y ??
 * @constructor
 */
declare function FrameGetCommandBarButton(x: number, y: number): number;

// 物品6个按钮 0-5
/**
 * @deprecated see DzFrameGetItemBarButton
 * @param i
 * @constructor
 */
declare function FrameGetItemBarButton(i: number): number;

/** 获取 农民按钮 */
declare function FrameGetUnitButton(): number;

// 获取 技能右下角数字文本控件 button = 技能按钮  返回值 = SimpleString 类型控件
declare function FrameGetButtonSimpleString(button: number): number;

// 获取 技能右下角控件  button = 技能按钮  返回值 = SimpleFrame 类型控件
declare function FrameGetButtonSimpleFrame(button: number): number;

// 判断控件是否显示
declare function FrameIsShow(frame: number): boolean;

declare function FrameGetOriginButtonTexture(button: number): string;

// 修改/获取 simple类型控件的 父控件
declare function FrameGetSimpleParent(SimpleFrame: number): number;

declare function FrameSetSimpleParent(SimpleFrame: number, parentSimple: number): number;

// 为Simple绑定 frame类型的子控件
// 可以将任意frame类型 绑定到 原生ui下面 返回值 可以解除绑定
// 返回的是一个 SetupFrame值
declare function FrameSimpleBindFrame(SimpleFrame: number, Frame: number): number;

// 解除绑定 解除后 frame跟simple 就不再关联
declare function FrameSimpleUnBindFrame(SetupFrame: number): void;


/**
 * addons
 */

/**
 * 获取玩家选择单位列表
 * 从ui上进行异或获取框选单位
 * 选择0个或1个 会返回0个
 * 只有选择2个或以上时 才能返回对应的单位数组
 */
declare function get_select_list(): unit[];

/**
 * 获取玩家选取的单位
 * 当前玩家大头像模型的单位 当框选一群单位时 切换选择也会改变返回值 一般用来做 UI 操作时需要用到的接口
 */
declare function GetRealSelectUnit(): unit;

/**
 * 获取选中物品
 * (注意,取消选择物品后,该值并不会改变,只会等到下一次选择了新物品后才会改变该值)
 */
declare function GetRealSelectItem(): item;

/**
 * UI模型X轴旋转
 */
declare function FrameSetModelRotateX(ui: number, jd: number): void;

/**
 * UI模型Y轴旋转
 */
declare function FrameSetModelRotateY(ui: number, jd: number): void;

/**
 * UI模型Z轴旋转
 */
declare function FrameSetModelRotateZ(ui: number, jd: number): void;

/**
 * 设置单位模型
 */
declare function SetUnitModel(dw: unit, model: string): void;

/**
 * 设置单位头像模型
 */
declare function SetUnitPortrait(dw: unit, model: string): void;

/**
 * 设置单位称谓
 */
declare function SetUnitProperName(handle: unit, name: string): void;

/**
 * 获取英雄头像BTN
 */
declare function FrameGetHeroBarButton(id: number): number;

/**
 * 修改 原生按钮图片 button 可以是 技能按钮 物品按钮 英雄按钮 农民按钮 框选按钮 buff按钮
 */
declare function FrameSetOriginButtonTexture(ui: number, txt: string): void;

/**
 内置默认是 解锁frame控件的 屏幕限制的 就是可以随便移动到屏幕之外的位置，
 */
declare function SetFrameLimitScreen(is_limit: boolean): void;

/**
 可以用来 缩放 单位/特效的 粒子2 的模型缩放 相当于是绿苹果里中间那3个缩放至
 有些模型有些情况下使用此函数会底层jass报错
 */
declare function SetPariticle2Size(Handle: handle, scale: number): void;

/**
 是用来缩放 ui模型上面的粒子2的
 */
declare function FrameSetModelPariticle2Size(frame: number, scale: number): void;


/**
 * 获取游戏用户界面
 * @deprecated see DzGetGameUI
 */
declare function GetGameUI(): number;

/**
 * 设置窗体绝对位置
 */
declare function FrameSetAbsolutePoint(frame: number, point: number, x: number, y: number): void;

/**
 * 设置父窗口 [NEW]
 */
declare function FrameSetParent(frame: number, parent: number): void;

/**
 * 销毁窗体
 */
declare function DestroyFrame(frame: number): void;

/**
 *修改UI图片（内置版）
 */
declare function FrameSetTexture(ui: number, str: string, pp: number): void;

/**
 *修改Frame Level
 */
declare function FrameSetLevel(ui: number, level: number): void;

/**
 * 显示/隐藏窗体
 */
declare function FrameShow(frame: number, enable: boolean): void;

/**
 * 设置透明度（0-255）
 */
declare function FrameSetAlpha(frame: number, alpha: number): void;

/**
 * 获取透明度（0-255）
 */
declare function FrameGetAlpha(frame: number): number;

/**
 * 设置窗体大小
 */
declare function FrameSetSize(frame: number, w: number, h: number): void;

/**
 * 设置模型缩放
 */
declare function FrameSetModelScale(frame: number, x: number, y: number, z: number): void;

/**
 *修改Frame宽度（内置版）
 */
declare function FrameSetWidth(ui: number, width: number): void;

/**
 *修改Frame高度（内置版）
 */
declare function FrameSetHeight(ui: number, height: number): void;

/**
 *修改Frame模型大小（内置版）
 */
declare function FrameSetModelSize(ui: number, scale: number): void;

/**
 *得到控制台1
 */
declare function FrameGetSimpleConsole(): number;

/**
 *框架显示界面
 */
declare function FrameShowInterface(): void;

/**
 *设置控件视口
 */
declare function FrameSetViewPort(p1: number, p2: boolean): void;

/**
 *获取子控件
 */
declare function FrameGetChilds(p1: number, p2: number): number;

/**
 *获取父控件
 */
declare function FrameGetParent(p1: number): number;

/**
 * 根据tag创建窗体
 */
declare function CreateFrameByTagName(frameType: string, name: string, parent: number, template: string, id: number): number;

/**
 *获取控件宽度
 */
declare function FrameGetWidth(p1: number): number;

/**
 *获取控件高度
 */
declare function FrameGetHeight(ui: number): number;

/**
 * 销毁框架
 */
declare function DestroySimpleFrame(ui: number): void;

/**
 * UI模型动作
 */
declare function FrameSetAnimationByIndex(ui: number, animIndex: number): void;

/**
 * UI设置模型颜色
 */
declare function FrameSetModelColor(ui: number, p2: number): void;

/**
 *模型动画播放速度
 */
declare function FrameSetModelSpeed(ui: number, p2: number): void;

/**
 *播放特效动画
 */
declare function EXSetEffectAnimation(p1: effect, p2: number): void;

/**
 *非动作性(暂停)用作技能制作
 */
declare function EXPauseUnit(p1: unit, p2: boolean): void;


/**
 * 玩家是否打开了聊天框
 */
declare function GetChatState(): boolean;

/**
 * 设置小地图贴图
 */
declare function SetWar3MapMap(p1: string): void;

/**
 * 设置单位技能隐藏
 */
declare function SetUnitAbilityButtonShow(p1: number, p2: number, p3: boolean): void;

/**
 * 解除特效绑定
 */
declare function UnBindEffect(p1: handle): void;

/**
 * 获取当前指向Handle(物品，单位)
 */
declare function GetTargetObject(): unit;

/**
 * 获取UI的宽度
 */
declare function FrameGetTextWidth(p1: number): number;

/**
 * 设置窗口大小
 */
declare function SetWindowSize(width: number, height: number): void;

/**
 * 按钮冷却模型大小
 */
declare function FrameSetButtonCooldownModelSize(p1: number, p2: number): void;

/**
 * 文本字体间距
 */
declare function FrameSetTextFontSpacing(p1: number, p2: number): void;

/**
 * 特效播放速度
 */
declare function EXSetEffectSpeed(p1: number, p2: number): void;

/**
 * 设置单位普攻弹道模型
 */
declare function SetUnitMissileModel(p1: unit, p2: string): void;

/**
 * 设置handle贴图
 */
declare function SetUnitTexture(p1: handle, p2: string, texId: number): void;

/**
 * 获取剪贴板内容
 */
declare function get_copy_str(): string;

/**
 * 设置剪贴板内容
 */
declare function set_copy_str(txt: string): void;

/**
 * 设置Frame文字颜色
 */
declare function FrameSetTextColor(pi: number, p2: number): void;

/**
 * 获取帧数
 */
declare function GetFps(): number;

/**
 * 获取字体高度
 */
declare function FrameGetTextHeight(p1: number): number;

/** 设置特效颜色*/
declare function EXSetEffectColor(handle: effect, color: number);

/** 设置特效是否显示*/
declare function EXSetEffectVisible(handle: effect, visible: boolean);

/**
 *播放特效动画(EXPlayEffectAnimation(eff, "attack", ""))
 */
declare function EXPlayEffectAnimation(handle: effect, animation_name: string, link_name: string): void;

/**
 * 获取物品技能
 */
declare function GetItemAbility(item: item, index: number): ability;

/**
 * 获取技能ID
 */
declare function EXGetAbilityId(p1: ability): number;

/**
 * 获取特效颜色
 */
declare function EXGetEffectColor(p1: effect): number;

/**
 * 设置特效迷雾可见
 */
declare function EXSetEffectFogVisible(p1: effect, p2: boolean): void;

/**
 * 单位，物品，特效绑定特效
 * @param unit
 * @param p2 绑定节点
 * @param p3 绑定handle
 */
declare function BindEffect(unit: handle, p2: string, p3: effect): void;

/**
 *
 * @param unit
 * @param index
 * @constructor
 */
declare function GetUnitSpellAbility(unit: unit, index: number): ability;


/**
 * 设置物品大小
 * @param item
 * @param size
 * @constructor
 */
declare function EXSetItemSize(item: item, size: number): void;

/**
 * 设置物品颜色
 * @param item
 * @param color
 * @constructor
 */
declare function EXSetItemColor(item: item, color: number): void;


/**
 * 忽视frame鼠标点击效果
 */
declare function FrameSetIgnoreTrackEvents(frame: number, isIgnore: boolean): void;

/**
 *添加内置Japi模型（内置版）
 let modelex = FrameAddModel(DzGetGameUI())
 */
declare function FrameAddModel(ui: number): number;

/**
 *设置：内置Japi模型动作（内置版）
 ps:
 */
declare function FramePlayAnimation(ui: number, action: string, path: string,): void;

/**
 *设置：内置Japi模型路径（内置版）
 ps:更换模型路径后，会重置模型大小，需要再次设置大小
 */
declare function FrameSetModel2(ui: number, path: string, ID: number): number;

/**
 *设置：内置Japi模型的镜头位置（内置版）
 FrameSetModelCameraSource(modelex, 150, 0, 90 )
 */
declare function FrameSetModelCameraSource(ui: number, x: number, y: number, z: number): number;

/**
 *设置：内置Japi模型的镜头"目标"位置（内置版）
 FrameSetModelCameraTarget(modelex, -100, -50, -50)
 */
declare function FrameSetModelCameraTarget(ui: number, x: number, y: number, z: number): number;

/**
 * 设置模型x
 * @param ui
 * @param x
 */
declare function FrameSetModelX(ui: number, x: number): void;

/**
 * 设置模型y
 * @param ui
 * @param x
 */
declare function FrameSetModelY(ui: number, y: number): void;

/**
 * 设置模型z
 * @param ui
 * @param x
 */
declare function FrameSetModelZ(ui: number, z: number): void;

/**
 * 获取鼠标的frame
 * （这个相当于是sprite 2d模型控件）
 * (通过缩小这个模型 FrameSetModelSize 0.001 即可达到隐藏鼠标)
 */
declare function FrameGetMouse(): number;

/**
 *  设置模型的贴图
 *  id 可传 模型的 replace Id
 */
declare function FrameSetModelTexture(ui: number, texPath: string, id: number): void;

/**
 * 矩形裁剪图片
 * 左上角为0,0 原点
 * 右下角为 图片的 maxX maxY
 * @param path
 * @param resultPath
 * @param left minX
 * @param top minY
 * @param right maxX
 * @param bottom maxY
 * @constructor
 */
declare function EXBlpRect(path: string, resultPath: string, left: number, top: number, right: number, bottom: number): void;

/**
 * 扇形截面
 * @param path
 * @param resultPath
 * @param x
 * @param y
 * @param r
 * @param angle
 * @param section
 * @constructor
 */
declare function EXBlpSector(path: string, resultPath: string, x: number, y: number, r: number, angle: number, section: number): void;


/**
 * 设置装饰物垫子比例
 */
declare function SetDoodadMatScale(a: handle, x: number, y: number, z: number): void;

/**
 * 设置装饰物速度
 */
declare function SetDoodadSpeed(a: handle, speed: number): void;

/**
 * 获取装饰物X坐标
 */
declare function GetDoodadX(a: handle): number;

/**
 * 获取装饰物播放动画名称
 */
declare function GetDoodadAnimationnName(a: handle, i: number): string;

/**
 * 设置装饰物模型
 */
declare function SetDoodadModel(a: handle, str: string): void;

/**
 * 获取装饰物动画数量
 */
declare function GetDoodadAnimationCount(a: handle): number;

/**
 * 获取装饰物数量
 */
declare function GetDoodadCount(): number;

/**
 * 获取装饰物地址
 */
declare function GetDoodadAddress(a: handle): handle;

/**
 * 设置装饰物团队颜色
 */
declare function SetDoodadTeamColor(a: handle, b: number): void;

/**
 * 获取装饰物类型
 */
declare function GetDoodadTypeId(a: handle): number;

/**
 * 设置装饰物颜色
 */
declare function SetDoodadColor(a: handle, b: number): void;

/**
 * 获取装饰物Y坐标
 */
declare function GetDoodadY(a: handle): number;

/**
 * 获取装饰物Z坐标
 */
declare function GetDoodadZ(a: handle): number;

/**
 * 设置装饰物位置
 */
declare function SetDoodadPosition(a: handle, x: number, y: number, z: number): void;

/**
 * 设置装饰物旋转X
 */
declare function SetDoodadMatRotateX(a: handle, b: number): void;

/**
 * 设置装饰物旋转Y
 */
declare function SetDoodadMatRotateY(a: handle, b: number): void;

/**
 * 设置装饰物旋转Z
 */
declare function SetDoodadMatRotateZ(a: handle, b: number): void;

/**
 * 设置装饰物垫子大小
 */
declare function SetDoodadMatResize(a: handle): void;

/**
 * 设置装饰物显示
 */
declare function SetDoodadVisible(a: handle, b: boolean): void;

/**
 * 设置装饰物动画
 */
declare function SetDoodadAnimation(a: handle, b: number, c: string, d: number): void;

/**
 * 获取装饰物速度
 */
declare function GetDoodadSpeed(a: handle): number;

/**
 * 获取装饰物当前动画索引
 */
declare function GetDoodadCurrentAnimationIndex(a: handle): number;

/**
 * 获取装饰物动画时间
 */
declare function GetDoodadAnimationTime(a: handle, b: number): number;

/**
 * 新建装饰物
 * @param id 装饰物id
 * @param style 样式
 * @param x 目标X
 * @param y 目标y
 * @param z 高度
 * @param f
 * @param jd 角度
 */
declare function CreateDoodad(id: number, style: number, x: number, y: number, z: number, f: number, jd: number): handle;


/***
 * 返回指定商店选择的指定玩具的单位 (返回值是同步的 可以放心使用)
 * @param store 商店单位
 * @param p 玩家
 */
declare function GetStoreTarget(store: unit, p: player): unit;

/**
 * 设置移动类型 物编完全效果 ExSetUnitMoveType设置不完全 部分判断使用时还是旧物编填的类型
 */
declare function SetUnitMoveType(unit: unit, moveType: string): void;