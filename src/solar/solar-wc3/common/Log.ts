import ErrorMsgHelper from "@/ErrorMsgHelper";

const log: NoSelf | any = require('jass.log')
/** @noSelf **/
export default class Log {

    static enable = true;
    static enablePrint = true;
    static index = 1;


    get path() {
        return log.path
    }

    set path(path: string) {
        // @ts-ignore
        log.path = path
    }

    trace(...args: any[]): void {
        if (Log.enablePrint) {
            print("Log.trace:", ...args)
        }
        if (Log.enable) {
            log.trace(...args)
        }
    }

    debug(...args: any[]): void {
        if (Log.enablePrint) {
            print("Log.debug:", ...args)
        }
        if (Log.enable) {
            log.debug(...args)
        }
    }

    info(...args: any[]): void {
        if (Log.enablePrint) {
            print("Log.info:", ...args)
        }
        if (Log.enable) {
            log.info(...args)
        }
    }

    warn(...args: any[]): void {
        if (Log.enablePrint) {
            print("Log.warn:", ...args)
        }
        if (Log.enable) {
            log.warn(...args)
        }
    }

    error(...args: any[]): void {
        if (Log.enablePrint) {
            print("Log.error:", ...args)
        }
        if (Log.enable) {
            log.error(...args)
        }
    }

    errorWithTraceBack(...args: any[]): void {
        Log.index++;
        let tb = debug.traceback();
        if (Log.enablePrint) {
            print("Log.errorWithTraceBack:", ...args)
            print("===========Error TraceBack Start[No." + Log.index + "]===========")
            print(tb)
            print("===========Error TraceBack End[No." + Log.index + "]===========")
            if (args && args.length > 0) {
                ErrorMsgHelper.error_handle(args[0]);
            } else {
                ErrorMsgHelper.error_handle("");
            }
        }
        if (Log.enable) {
            log.error(...args)
            log.error("===========Error TraceBack Start[No." + Log.index + "]===========")
            log.error(tb)
            log.error("===========Error TraceBack End[No." + Log.index + "]===========")
        }
    }


    fatal(...args: any[]): void {
        if (Log.enablePrint) {
            print("Log.fatal:", ...args)
        }
        if (Log.enable) {
            log.fatal(...args)
        }
    }


}

/**
 *  log: Log
 */
declare global {
    // let log: Log;
    namespace log {
        let path: string;
    }
}