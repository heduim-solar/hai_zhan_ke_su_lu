import DataBase from "@/DataBase";
import ObjectTemplateUtil from "@/ObjectTemplateUtil";
import LangUtil from "@/LangUtil";
import STimer from "@/STimer";
import UnitStateUtil from "@/UnitStateUtil";
import BaseUtil from "@/BaseUtil";
import FrameControl from "@/FrameControl";
import SyncUtil from "@/SyncUtil";


let index = 0;
/**
 * 基础的演员 (演员是一种通用的数据结构 通过标准的的数据结构可以转接到模拟 单位 物品 技能 buff 等)
 * 演员 是模拟系统的 具体解决方案 可以通过演员方便的模拟技能 物品 以抽取出统一的方法和数据结构 到基类Actor
 *
 * 每一个 物品/技能演员实例都对应一个唯一的基础物编模板 即相同演员类型的多个演员物品获取到的原始物品模板id也是不同的。
 *
 * 单位演员多个实例都是公用一个类型的。
 *
 * 为保证物编模板足够使用 需要在演员实例不需要使用时进行销毁 这样会把占用的物编模板id归还以供下次新建演员实例使用
 *
 * PS: 所有玩法功能应尽可能使用Actor编写逻辑代码 避免使用子类ActorItem，ActorBuff等等，因为子类太具体了 不利于灵活的应对策划变化。比如将一个物品吞噬为buff。
 *
 */
export default class Actor implements Destroyable {

    /** 是否需要更新属性  用于缓存演员属性系统的相关更新状态 修改属性后这里设置为true 演员系统定时更新完属性后 设置这里为false */
    static _sl_needUpdateAttribute = false;
    static allActors: { [actorUuid: string]: Actor } = {};

    //uuid 可能是异步的 不要进行同步计算 是否异步取决于是否异步新建了演员 （现有系统还是同步的 后面可能会加入异步演员类型）
    readonly uuid: string = "sa" + index++;
    /**可以为 技能模板id 物品模板id 单位模板id*/
    templateId: string
    protected _actorType: AppActorType;
    /** 正在更新中... */
    updating: boolean = false;
    /** 创建时间  秒单位 */
    creationTime: number;

    /** 关联的单位 */
    private _sl_unit?: unit
    /** 上一个单位 在单位改变事件时 通过这个可以获取之前的单位 */
    private _sl_lastUnit?: unit
    /** 演员的等级 创建完毕时默认为1级*/
    private _sl_level: number = 0;
    private _sl_isInitializedOnUnitInRangeEvent: boolean = false;
    private _sl_lastReadyTime: { [timerKey: string]: number } = {};

    /** ui */
    protected _sl_rootFrameControl: FrameControl;
    /** 右下角数字 类似物品使用次数 */
    protected _sl_numberOverlay?: number;

    /** 产生这个演员的单位 施法者 可为空 */
    creator?: unit;
    /** 战斗属性  */
    attribute?: AppAttribute;

    /** 部分被动技能需要的循环计时器
     * */
    sTimer?: STimer
    /**
     * onUnitInterval事件 则可能会在演员失去单位时自动销毁此计时器 比如单位丢弃演员物品时
     * */
    protected _sl_intervalTimer?: STimer
    /**
     * 子销毁列表
     *  会在此演员销毁时 自动调用此此列表中的destroy
     * */
    childDestroyList: Destroyable[] = []
    /** 预置 特效变量
     *  会在演员销毁时 自动销毁这些预置的变量 所以使用预置变量时请确保这些变量的生命周期是与演员同步的
     * */
    effect?: effect
    /**
     * 临时 数字变量 可以在事件里方便编码
     * */
    tempNum?: number
    /**
     * 临时 布尔变量 可以在事件里方便编码
     * */
    tempBool?: boolean


    /** 基础数据 */
    private data: { [key: string]: any } = {};
    /** 扩展数据 用作自定义得数据集合 */
    extData: { [key: string]: any } = {};

    /** 扩展显示提示 (在标准提示前面)*/
    extDescribeFirst1?: string
    extDescribeFirst2?: string
    /** 扩展显示提示 (在标准提示后面追加)*/
    extDescribeLast1?: string
    extDescribeLast2?: string
    /**
     * 示例:extDescribeLasts.当前附加几率 = " 10"
     * 会自动在提示后面 拼接为 "当前附加几率 10"
     * 以name为key这种方式 方便刷新提示数据
     * */
    _sl_extDescribes?: { [name: string]: string };

    /** 任意附加数据 */
    [key: string]: any

    //
    private _sl_isInitialized = false;
    protected _sl_isDestroyed = false;

    constructor(actorTypeId: string) {
        this._actorType = DataBase.getSolarActorType(actorTypeId);
        if (this._actorType == null) {
            log.errorWithTraceBack("不能创建不存在的演员类型:" + actorTypeId);
            return
        }
        if (this._actorType.attribute) {
            this.attribute = {...this._actorType.attribute}
            Actor._sl_needUpdateAttribute = true;
        }
        Actor.allActors[this.uuid] = this;
    }

    /**
     * 将类型中的模板数据设置到实例中
     */
    protected _sl_init() {
        if (this._sl_isInitialized) {
            return
        }
        this._sl_isInitialized = true;
        this.creationTime = _g_time / 1000;
        for (let key in this._actorType) {
            let value = this._actorType[key];
            if (!LangUtil.isFunction(value) && "attribute" != key) {
                this._sl_rawset(key, value)
            }
        }
        if (this._actorType.name == null) {
            this.setName(this._actorType.id);
        }
        //计时器启动 by interval 和 onInterval
        let timeoutS = this.get("interval");
        if (timeoutS != null && timeoutS > 0 && this.get("onInterval") != null) {
            this.startIntervalTimer(timeoutS, () => {
                this.interval();
            })
        }
        //
        this.get("onCreated")?.(this);
        //任意Actor创建 事件回调
        for (let listner of Actor._sl_anyActorCreatedListeners) {
            listner(this);
        }
        //
        this.level = 1;
    }

    /**
     * 获取演员的类型
     */
    get actorType(): AppActorType {
        return this._actorType;
    }

    get solarData(): AppSolarBuffData {
        return DataBase.getSolarActorSolarData(this.uuid)
    }

    set solarData(obj: { [key: string]: any }) {
        DataBase.setSolarActorSolarData(this.uuid, obj)
    }

    protected _sl_rawset<Key extends keyof AppActorType>(key: Key, value: AppActorType[Key]): void {
        Actor._sl_needUpdateAttribute = true;
    }

    set<Key extends keyof AppActorType>(key: Key, value: AppActorType[Key]): void {
        this.data[key] = value;
        this._sl_rawset(key, value);

    }

    get<Key extends keyof AppActorType>(key: Key, defaultValue?: AppActorType[Key]): AppActorType[Key] {
        if (this.data[key] != null) {
            return this.data[key] as any
        }
        if (this._actorType?.[key] != null) {
            return this._actorType[key]
        }
        return defaultValue;
    }

    /**
     * 刷新
     * 更新应该是无副作用的 即保证冥等性
     */
    update() {
        if (this._sl_isDestroyed) {
            return
        }
        //更新类型数据
        for (let key in this._actorType) {
            let value = this._actorType[key];
            if (!LangUtil.isFunction(value) && "attribute" != key) {
                this._sl_rawset(key, value)
            }
        }
        //更新当前演员对象手动指定的数据
        for (let dataKey in this.data) {
            this._sl_rawset(dataKey, this.data[dataKey])
        }
        this.get("onUpdate")?.(this);
    }


    /**
     * 获取类型id
     */
    get actorTypeId(): string {
        return this._actorType.id
    }


    /**
     * 获取模板类型
     */
    getTemplateType(): string {
        return this.get("templateType")
    }

    getAttribute(createDefault = false): AppAttribute | null {
        if (!this.attribute && createDefault) {
            this.attribute = {};
        }
        return this.attribute;
    }

    /**
     * 获取最后一个有效的单位
     */
    get lastUnit(): unit {
        return this._sl_lastUnit;
    }

    get unit(): unit {
        return this._sl_unit;
    }

    set unit(value: unit) {
        if (this._sl_isDestroyed) {
            return
        }
        this._sl_unit = value;
        this.get("onUnitChange")?.(this, value)
        //延迟启动 以避免不必要的启动 比如怪物掉落装备有被动周期效果 如果装备没有单位拾取就没必要去启动这个计时器 可能被当做材料去合成其他装备了
        //计时器启动 by interval 和 onWithUnitInterval
        if (this._sl_intervalTimer == null) {
            //启动计时器
            if (this.get("onUnitInterval") != null && IsHandle(this._sl_unit)) {
                let timeoutS = this.get("interval");
                if (timeoutS != null && timeoutS > 0) {
                    this.startIntervalTimer(timeoutS, () => {
                        this.interval();
                    })
                }
            }
        } else if (value == null && this.get("onUnitInterval") != null && this.get("onInterval") == null) {
            //脱下装备时 销毁onUnitInterval计时器
            this._sl_intervalTimer.destroy();
            this._sl_intervalTimer = null;
        }
        //关联单位事件
        if (IsHandle(this._sl_unit)) {
            //关联单位范围事件
            if (this._sl_isInitializedOnUnitInRangeEvent == false &&
                this.actorType.onUnitInRange != null && this.get("unitInRangeValue") != null) {
                this._sl_isInitializedOnUnitInRangeEvent = true;
                se.onUnitInRange(value, this.get("unitInRangeValue"), () => {
                    this.get("onUnitInRange")?.(this, GetEnteringUnit())
                });
            }

            //onUnitAddActor
            se.emit("_sl_:单位获得演员", {u: this.unit, a: this})

            //保存一下上一个单位
            this._sl_lastUnit = this._sl_unit;
        } else {
            //onUnitAddActor
            se.emit("_sl_:单位失去演员", {u: this._sl_lastUnit, a: this})
        }


    }

    /**
     * 获取关联单位的 坐标x
     */
    get unitX(): number {
        return GetUnitX(this._sl_unit)
    }

    /**
     * 获取关联单位的 坐标y
     */
    get unitY(): number {
        return GetUnitY(this._sl_unit)
    }

    /**
     * 获取当前单位的名字
     */
    get unitName(): string {
        if (!IsHandle(this._sl_unit)) {
            return null;
        }
        let actor: Actor = DataBase.getUnitSolarData(this._sl_unit, false)?._SL_solarActorUnit;
        if (actor != null) {
            return actor.getName()
        }
        return GetUnitName(this._sl_unit)
    }

    /**
     * 获取当前单位的等级
     */
    get unitLevel(): number {
        return GetUnitLevel(this._sl_unit)
    }

    /**
     * 获取关联单位的 面向角度
     */
    get unitFacing(): number {
        return GetUnitFacing(this._sl_unit)
    }

    /**
     * 获取关联单位的 玩家
     */
    get unitOwner(): player {
        return GetOwningPlayer(this._sl_unit)
    }

    /**
     * 获取关联单位的 玩家id
     */
    get unitOwnerId(): number {
        return GetPlayerId(GetOwningPlayer(this._sl_unit))
    }

    /**
     * 获取释放点x
     * （示例:在onAction中可以使用）
     */
    getSpellTargetX() {
        return GetSpellTargetX();
    }

    /**
     * 获取释放点y
     * （示例:在onAction中可以使用）
     */
    getSpellTargetY() {
        return GetSpellTargetY();
    }

    /**
     * 获取技能释放目标
     * （示例:在onAction中可以使用）
     */
    getSpellTargetUnit() {
        return GetSpellTargetUnit();
    }

    /**
     * 获取该演员对应的ui 根Frame （该ui会自动在合适的位置显示和隐藏 技能就是在技能按钮上 物品就是在物品按钮上）
     * 可以把自己的ui绑定位置到这个节点上 以自动在合适的时候合适的位置显示自己的ui
     * @param createDefault 如果没有初始化则默认创建一个
     */
    getRootFrameControl(createDefault: boolean = true): FrameControl {
        if (createDefault && this._sl_rootFrameControl == null) {
            this._sl_rootFrameControl = new FrameControl();
            this._sl_rootFrameControl.rootFrame.setSize(0.04, 0.04);
        }
        return this._sl_rootFrameControl;
    }

    /**
     * 设置右下角数字
     */
    set numberOverlay(num: number | null) {
        this._sl_numberOverlay = num;
        if (num) {
            this.getRootFrameControl().setNumberOverlayText("" + num)
        } else {
            this.getRootFrameControl(false)?.setNumberOverlayText(null)
        }
    }

    /**
     * 获取右下角数字
     */
    get numberOverlay() {
        return this._sl_numberOverlay;
    }

    /**
     * 是否准备好 比如做有冷却时间的相关逻辑 可使用这个
     * @param timeSec 冷却时间 （秒单位）
     * @param onReady 准备好的回调
     * @param timerKey 任务名称 （每个Actor对象独立的）
     */
    ifReady(timeSec: number, onReady: () => void, timerKey = "base") {
        if (((_g_time / 1000) - (this._sl_lastReadyTime[timerKey] || -10000)) >= timeSec) {
            this._sl_lastReadyTime[timerKey] = (_g_time / 1000);
            onReady();
        }
    }

    get level() {
        return this._sl_level;
    }

    set level(value) {
        let delta = value - (this._sl_level || 0)
        this._sl_level = value;
        //任意actor等级改变事件
        for (let listener of Actor._sl_anyActorLevelChangeListeners) {
            listener(this, delta);
        }
        this.get("onActorLevelChange")?.(this, delta)
        //可能在事件里重新设置了属性
        Actor._sl_needUpdateAttribute = true;
    }

    /**
     * 启动此演员的 内部太阳计时器 循环周期执行
     * 此计时器会在演员 销毁时 自动销毁此计时器
     * (如果此演员具有onUnitInterval事件 则可能会在演员失去单位时自动销毁此计时器 比如单位丢弃演员物品时)
     * @param timeoutS  （单位：秒 精度为小数点后2位 0.01）
     * @param handlerFunc
     */
    protected startIntervalTimer(timeoutS: number, handlerFunc: (this: void, timer: STimer) => void): STimer {
        if (this._sl_intervalTimer != null) {
            log.errorWithTraceBack("已经启动过计时器了。 再启动新计时器请手动在外部自行管理。(有interval事件的演员会自动启动计时器!)")
            return null;
        }
        this._sl_intervalTimer = new STimer();
        this._sl_intervalTimer.start(timeoutS, handlerFunc, true)
        return this._sl_intervalTimer;
    }

    /**
     * 设置名字
     * @param name
     */
    setName(name: AppActorType["name"]) {
        this.set("name", name)
    }

    getName(): string {
        let name = this.get("name");
        if (name == null) {
            return this.actorTypeId
        }
        return name;
    }

    /**
     * 设置图标
     * @param icon
     */
    setIcon(icon: AppActorType["icon"]) {
        this.set("icon", icon)
    }

    getIcon(): string {
        return this.get("icon")
    }

    /**
     * 设置模型
     * @param icon
     */
    setModel(icon: AppActorType["model"]) {
        this.set("model", icon)
    }

    getModel(): string {
        return this.get("model")
    }

    /**
     * 设置描述
     * @param describe
     */
    setDescribe(describe: AppActorType["describe"]) {
        this.set("describe", describe)
    }

    getDescribe(includeExts: boolean = false): string {
        let realDescribe = this.get("describe", "")
        if (includeExts == false) {
            return realDescribe;
        }
        //包含扩展提示
        if (this.extDescribeFirst2 && this.extDescribeFirst2.length > 0) {
            realDescribe = this.extDescribeFirst2 + "|r|n" + realDescribe;
        }
        if (this.extDescribeFirst1 && this.extDescribeFirst1.length > 0) {
            realDescribe = this.extDescribeFirst1 + "|r|n" + realDescribe;
        }

        if (this.extDescribeLast1 && this.extDescribeLast1.length > 0) {
            realDescribe += "|r|n" + this.extDescribeLast1;
        }
        if (this.extDescribeLast2 && this.extDescribeLast2.length > 0) {
            realDescribe += "|r|n" + this.extDescribeLast2;
        }
        if (this._sl_extDescribes) {
            //排序遍历 以免每次游戏的 提示顺序不一样 影响体验
            LangUtil.forEachSort(this._sl_extDescribes, (name, text) => {
                realDescribe += "|r|n" + name + text;
            });
        }
        return realDescribe;
    }

    /**
     * 设置扩展的提示信息 在某些地方 如鼠标移上物品技能按钮时 会显示这些信息
     * @param name
     * @param text
     */
    setExtDescribe(name: string, text: string) {
        if (this._sl_extDescribes == null) {
            this._sl_extDescribes = {};
        }
        this._sl_extDescribes[name] = text;
    }

    removeExtDescribe(name: string) {
        deleteKey(this._sl_extDescribes, name);
    }


    /**
     * 设置Dur 持续时间
     * @param dur
     */
    setDur(dur: AppActorType["dur"]) {
        this.set("dur", dur)
    }

    getDur(): number {
        return this.get("dur")
    }


    setDisable(disable: AppActorType["disable"]) {
        this.set("disable", disable)
        //可能在事件里重新设置了属性
        Actor._sl_needUpdateAttribute = true;
    }

    isDisable(): boolean {
        return this.get("disable", false)
    }


    /**
     * 设置xy位置
     */
    setXY(x: number, y: number): void {
        this.set("x", x)
        this.set("y", y)
    }

    /**
     * 获取xy位置
     */
    getXY(): Vector {
        return {x: this.get("x"), y: this.get("y")}
    }


    setHide(hide: boolean) {
        this.set("hide", hide)
    }

    isHide(): boolean {
        return this.get("hide", false)
    }


    clone(): void {

    }

    /**
     * btn 1=左键 2=右键
     * @param btn
     * @param x
     * @param y
     */
    localClick(btn: number, x: number, y: number): boolean {
        //异步检查 是否禁用了 此演员
        if (this._sl_disableFrame != null && this._sl_disableFrame.visible == true) {
            return false;
        }
        isAsync = true;
        let b = this.get("onLocalClick")?.(this, btn, x, y, this.actorType);
        isAsync = false;
        if (b == false) {
            return false;
        }
        //同步点击
        if (this.get("onClick") != null) {
            SyncUtil.syncObjData("_sl_:a:onClick", {
                i: this.uuid,
                b: btn,
            });
        }
        return true;
    }

    action(x: number, y: number, targetUnit?: unit) {
        this.get("onAction")?.(this, x, y, targetUnit);
        //可能在事件里重新设置了属性
        Actor._sl_needUpdateAttribute = true;
    }

    protected interval() {
        let onInterval = this.get("onInterval");
        if (onInterval) {
            onInterval(this)
            //可能在事件里重新设置了属性
            Actor._sl_needUpdateAttribute = true;
        }
        if (this._sl_unit != null && UnitStateUtil.isAlive(this._sl_unit)) {
            let onUnitInterval = this.get("onUnitInterval");
            if (onUnitInterval) {
                onUnitInterval(this)
                //可能在事件里重新设置了属性
                Actor._sl_needUpdateAttribute = true;
            }
        }
    }

    /**
     * 是否已经销毁了
     */
    isDestroyed(): boolean {
        return this._sl_isDestroyed;
    }

    /**
     * 销毁此actor
     * 注意 销毁后的unit会被清空 所以销毁后不要去获取unit了！
     */
    destroy(forceDestroy: boolean = false): void {
        //如果有创建事件监听 则回调此事件监听
        if (this._sl_isDestroyed) {
            return;
        }
        let onDestroy = this.get("onDestroy");
        if (onDestroy) {
            let flag = onDestroy(this);
            if (flag == false && forceDestroy == false) {
                return
            }
        }
        //任意actor销毁事件
        for (let listener of Actor._sl_anyActorDestroyListeners) {
            listener(this);
        }
        this.unit = null;
        this._sl_isDestroyed = true;
        this.sTimer?.destroy();
        this._sl_intervalTimer?.destroy();
        if (this.childDestroyList && this.childDestroyList.length > 0) {
            for (let destroyable of this.childDestroyList) {
                destroyable.destroy();
            }
            this.childDestroyList = null;
        }
        if (this.effect) {
            DestroyEffect(this.effect)
            this.effect = null;
        }
        if (this._sl_rootFrameControl != null) {
            this._sl_rootFrameControl.rootFrame.visible = false;
            this._sl_rootFrameControl.destroy();
            this._sl_rootFrameControl = null;
        }

        if (this.templateId != null) {
            if (this.getTemplateType() != null) {
                ObjectTemplateUtil.returnTemplate(this.getTemplateType(), this.templateId);
            }
        }
        this.solarData = null;
        deleteKey(Actor.allActors, this.uuid);
        Actor._sl_needUpdateAttribute = true;
    }

    /**
     * 指定时间后 销毁此Actor
     * @param timeOut
     */
    destroyLater(timeOut: number) {
        BaseUtil.runLater(timeOut, () => {
            //触发一次更新 以检测可能的间隔到期
            this.destroy();
        })
    }


    /**
     * 全局任意buff 事件
     */
    static _sl_anyActorCreatedListeners: ((buff: Actor) => void)[] = [];
    static _sl_anyActorLevelChangeListeners: ((buff: Actor, delta: number) => void)[] = [];
    static _sl_anyActorDestroyListeners: ((buff: Actor) => void)[] = [];
}