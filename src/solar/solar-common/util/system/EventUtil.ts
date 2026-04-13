/** @noSelfInFile */
import mitt from '@/lib/mitt'


const emitter = mitt()
/**
 * 事件总线工具
 * 用作逻辑解耦
 * @deprecated see se.on() se.emit
 */
export default class EventUtil {

    /**
     * 注册一个事件接收器
     * @param type
     * @param handler
     */
    static on(type: string | symbol, handler: (data: any) => void) {
        emitter.on(type as any, handler)
    }

    /**
     * 发布一个事件
     * @param type
     * @param data
     */
    static emit(type: string | symbol, data?: any) {

        emitter.emit(type as any, data)
    }

    /**
     * 清除所有注册的事件
     */
    static clear() {
        emitter.all.clear()
    }


}
