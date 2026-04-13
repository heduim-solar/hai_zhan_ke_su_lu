import DataBase from "../common/DataBase";
import STimer from "@/STimer";
import Actor from "@/Actor";
import BaseUtil from "@/BaseUtil";
import TargetAttach from "@/TargetAttach";

/**
 * 演员buff
 * 优先保证写法兼容(ActorBuff 这样吞噬后才有效果)
 */
export default class ActorBuff extends Actor {

    /**
     *
     * @param actorTypeId
     * @param unit
     * @param creator buff来源单位 可为空 如羁绊增益效果 就没有来源单位
     * @param initActorBuff 初始化buff回调 会在  buffType.onCreated 之前调用  以给buff设置初始自定义值
     */
    constructor(actorTypeId: string, unit: unit, creator?: unit | null, initActorBuff?: (actorBuff: ActorBuff) => void) {
        super(actorTypeId);
        this.unit = unit;
        this.creator = creator;
        //添加到buff 单位自定义数据里
        let solarData = DataBase.getUnitSolarData(unit);
        if (!solarData._SL_solarActorBuffSet) {
            solarData._SL_solarActorBuffSet = {};
        }
        solarData._SL_solarActorBuffSet[actorTypeId] = this;
        //刷新创建时间
        this.update();
        //如果有创建事件监听 则回调此事件监听
        initActorBuff?.(this);
        //添加寄生单位的特效 .mdx
        if (this.get("modelAttach") != null && this.get("modelAttach").length > 4) {
            this.effect = AddSpecialEffectTarget(this.get("modelAttach"), unit, this.get("modelAttachTarget", TargetAttach.origin));
        }
        super._sl_init();
        //
        //计算是否销毁 //dur为0的则为永久存在 只能手动销毁
        let dur = this.get("dur");
        if (dur != null && dur > 0) {
            this.initDur(dur);
        }
    }


    get<Key extends keyof AppActorBuffType>(key: Key, defaultValue?: AppActorBuffType[Key]): AppActorBuffType[Key] {
        return super.get(key, defaultValue);
    }

    private initDur(dur: number) {
        BaseUtil.runLater(dur, () => {
            if (this._sl_isDestroyed) {
                return;
            }
            //普通到期了
            if (this.getRemainingTime() <= 0) {
                this.destroy();
                return;
            }
            //可能被 刷新 叠加buff层数 等 延迟了销毁时间
            BaseUtil.onTimer(1, count => {
                if (this.getRemainingTime() <= 0) {
                    this.destroy();
                    return false;
                }
                return true;
            })
        });
    }


    /**
     * 获取演员的类型
     */
    get actorType(): AppActorBuffType {
        return this._actorType;
    }

    /**
     * 动态设置这个间隔值 精度设置到0.01秒
     */
    setTimerInterval(timeS: number) {
        this.set("interval", timeS);
        //如果不存在的话
        if (timeS > 0) {
            if (this._sl_intervalTimer == null) {
                this._sl_intervalTimer = new STimer();
                this._sl_intervalTimer.start(timeS, () => {
                    this.interval();
                }, true)
            }
            //设置值
            this._sl_intervalTimer.timeout = timeS;
        } else if (this._sl_intervalTimer) {
            log.errorWithTraceBack("buff间隔必须 > 0")
            this._sl_intervalTimer.destroy()
            this._sl_intervalTimer = null;
        }
    }

    /**
     * 刷新这个buff
     */
    update() {
        this.creationTime = (_g_time / 1000);
        this.get("onUpdate")?.(this);
    }

    /**
     * 获取这个buff的终止时间 秒单位
     */
    getDieTime(): number {
        return this.creationTime + this.get("dur", 0)
    }

    /**
     * 获取剩余时间 秒单位
     */
    getRemainingTime(): number {
        return this.creationTime + this.get("dur", 0) - (_g_time / 1000);
    }

    /**
     * 销毁此buff
     */
    destroy(): void {
        let unit = this.unit;
        //销毁buff
        super.destroy();
        if (this._sl_isDestroyed && IsHandle(unit)) {
            //清空数据
            let solarData = DataBase.getUnitSolarData(unit, false);
            if (solarData?._SL_solarActorBuffSet) {//清除buff
                solarData._SL_solarActorBuffSet[this.actorType.id] = null;
            }
        }
    }


}