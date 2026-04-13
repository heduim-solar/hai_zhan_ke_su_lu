export default class ErrorMsgHelper {
    private static justInvoke: boolean = false;
    private static lastError: ErrorMsgHelper;
    static onError: (errorMsgHelper: ErrorMsgHelper) => void;

    private static init0() {
        if (!isDebug || ErrorMsgHelper.justInvoke) {
            return true;
        }
        let trigger = CreateTrigger();
        for (let i = 0; i < bj_MAX_PLAYER_SLOTS; i++) {
            TriggerRegisterPlayerChatEvent(trigger, Player(i), "se", true);
        }
        TriggerAddAction(trigger, () => {
            if (ErrorMsgHelper.lastError) {
                ErrorMsgHelper.printErrorMsgHelper(ErrorMsgHelper.lastError, false);
            } else {
                DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, "没有最近的错误消息！");
            }
        });
        return true;
    }

    private _msg: string;
    private _traceback: string;
    cnMsg: string;
    cnTraceback: string;
    private _repairSuggestions: string = "";


    constructor(msg: any, traceback: any) {
        ErrorMsgHelper.init0();
        this._msg = tostring(msg);
        this._traceback = tostring(traceback);
        if (isDebug) {//只有在调试模式才中文转义
            this.cnMsg = this.translateMsg();
            this.cnTraceback = this.translateTraceback();
        } else {
            this.cnMsg = this._msg;
            this.cnTraceback = this._traceback;
        }
        ErrorMsgHelper.lastError = this;
    }

    private translateMsg(): string {
        let newMsg = tostring(this._msg);
        if (!newMsg || !newMsg.length || newMsg.length == 0) {
            return newMsg;
        }
        let cn: string = null;
        let onlyCn = false;
        if (newMsg.indexOf("invalid key to 'next'") >= 0) {
            cn = newMsg.replace("invalid key to 'next'", "'next'键无效")
            this._repairSuggestions = "请检查是否存在对象遍历中先进行置空操作，再进行了增加新元素的操作！"
            onlyCn = true;
        }
        if (newMsg.indexOf("attempt to index a number value") >= 0) {
            cn = newMsg.replace("attempt to index a number value", "不能从数字类型获取属性")
            this._repairSuggestions = "请检查变量读取正确或存入了正确的值！"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to index a nil value") >= 0) {
            cn = newMsg.replace("attempt to index a nil value", "不能从空值中获取属性")
            this._repairSuggestions = "请在获取属性前加上对空值判断！"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to call a nil value") >= 0) {
            cn = newMsg.replace("attempt to call a nil value", "不能调用空值函数")
            this._repairSuggestions = "请在要调用的函数前加上对空值判断！"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to compare number with nil") >= 0) {
            cn = newMsg.replace("attempt to compare number with nil", "不能用空值与数字比较大小")
            this._repairSuggestions = "请在判断中加上对空值判断！"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to compare table with nil") >= 0) {
            cn = newMsg.replace("attempt to compare table with nil", "不能用空值与对象比较大小")
            this._repairSuggestions = "请检查判断中的值是否为数字！"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to compare nil with number") >= 0) {
            cn = newMsg.replace("attempt to compare nil with number", "不能用空值与数字比较大小")
            this._repairSuggestions = "请在判断中加上对空值判断！"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to concatenate a nil") >= 0) {
            cn = newMsg.replace("attempt to concatenate a nil", "不能连接一个空值")
            this._repairSuggestions = "请在使用的变量前加上对空值的判断！"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to perform arithmetic on a nil value") >= 0) {
            cn = newMsg.replace("attempt to perform arithmetic on a nil value", "不能对空值进行算术运算")
            this._repairSuggestions = "请在算术运算前面加上对空值或赋予初始值进行运算！"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to perform 'n%0'") >= 0) {
            cn = newMsg.replace("attempt to perform 'n%0'", "不能对0取余数")
            this._repairSuggestions = "请修改余数不能为0"
            onlyCn = true;
        } else if (newMsg.indexOf("Call jass function crash.") >= 0) {
            cn = newMsg.replace("Call jass function crash.", "调用底层Jass函数异常")
            this._repairSuggestions = "请检查函数的所有参数是否正确！(如参数是否为空值、是否存在此物编、数值是否超过最大边界、参数类型是否正确)"
            onlyCn = true;
        } else if (newMsg.indexOf("table index is nil") >= 0) {
            cn = newMsg.replace("table index is nil", "访问表的索引是空")
            this._repairSuggestions = "请检查访问表的索引"
            onlyCn = true;
        } else if (newMsg.indexOf("stack overflow") >= 0) {
            cn = newMsg.replace("stack overflow", "栈溢出")
            this._repairSuggestions = "请检查访问表的索引"
            onlyCn = true;
        } else if (newMsg.indexOf("attempt to perform") >= 0) {
            cn = newMsg.replace("attempt to perform", "不能执行")
            this._repairSuggestions = "请检查算法是否存在0或null！请赋值初始值！"
        } else if (newMsg.indexOf("(data string too short)") >= 0) {
            cn = newMsg.replace("(data string too short)", "字符串数据长度太短")
            this._repairSuggestions = "请检查字符串数据是否为空值或长度过短"
        }
        if (cn && cn.length && cn.length > 0) {
            cn = cn.replace(" (local ", " (局部变量 ")
            cn = cn.replace(" (field ", " (属性 ")
            cn = cn.replace(" (global ", " (全局变量 ")
            cn = cn.replace("bad argument", "参数错误")
            cn = cn.replace(" (value expected)", " (允许值)")
            cn = cn.replace("bad argument #", "错误的参数 #")
            cn = cn.replace("<unknown>", "<未知>")
            newMsg = newMsg + "\r\n" + cn;
        }
        if (onlyCn) {
            return cn;
        }
        return newMsg
    }


    private translateTraceback(): string {
        let newMsg = this.traceback;
        if (!newMsg || !newMsg.length || newMsg.length == 0) {
            return newMsg;
        }
        let strings = newMsg.split("\n");
        let cnMsg = "";
        for (let line of strings) {
            if (line.indexOf("solar\\common\\") >= 0 ||
                line.indexOf("lualib_bundle.lua:") >= 0 ||
                line.indexOf("solar\\") >= 0 ||
                line.indexOf("\\_sl_egp\\") >= 0 ||
                line.indexOf("[C]:") >= 0 ||
                line.indexOf("[string \"fix_closure\"]:") >= 0
            ) {
                continue;
            }
            line = line.replace("[C]: in upvalue ", "在上值底层C代码: ")
            line = line.replace(" in ", " 在 ")
            line = line.replace(" local ", " 局部变量 ")
            line = line.replace(" global ", " 全局变量 ")
            line = line.replace(" method ", " 方法 ")
            line = line.replace(" function ", " 函数 ")
            line = line.replace(" upvalue ", " 上值 ")
            line = line.replace("(...tail calls...)", "(...尾调用...)")

            // line = line.replace("lualib_bundle.lua:", "lualib_bundle.lua(TSTL标准库):")
            // line = line.replace("solar\\common\\GlobalVars.ts:", "solar\\common\\GlobalVars.ts(太阳标准库):")

            cnMsg = cnMsg + line + "\r\n";
        }
        cnMsg = cnMsg.replace("stack traceback:", "函数堆栈:")
        return cnMsg
    }


    get msg(): string {
        return this._msg;
    }

    get traceback(): string {
        return this._traceback;
    }

    get repairSuggestions(): string {
        return this._repairSuggestions;
    }

    static error_handle(this: void, msg: any): void {
        let errorMsgHelper = new ErrorMsgHelper(msg, debug.traceback());
        ErrorMsgHelper.printErrorMsgHelper(errorMsgHelper);
    }

    public static printErrorMsgHelper(this: void, errorMsgHelper: ErrorMsgHelper, translate: boolean = true): void {
        const title = "------------------太阳RPG异常报告S---------------------"
        const end = "------------------太阳RPG异常报告E---------------------"

        let newMsg: string
        let tb: string
        if (translate) {
            newMsg = errorMsgHelper.cnMsg
            tb = errorMsgHelper.cnTraceback;
        } else {
            newMsg = errorMsgHelper.msg
            tb = errorMsgHelper.traceback;
        }

        //打印
        print(title)
        print(newMsg + "\n")
        print(tb);
        if (translate) {
            let baseTb = "\n\n-------------------原始堆栈--------------------\n\n" + errorMsgHelper.traceback;
            print(baseTb);
        }
        print(end)
        if (errorMsgHelper.repairSuggestions.length > 0) {
            print(errorMsgHelper.repairSuggestions)
        }

        //war3 打印
        if (DisplayTimedTextToPlayer) {
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, title);
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, newMsg);
            let tbLines = tb.split("\n");
            for (let dz of tbLines) {
                if (dz && dz.length > 0) {
                    DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, dz);
                }
            }
            if (errorMsgHelper.repairSuggestions.length > 0) {
                DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, end);
                DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0, 60, errorMsgHelper.repairSuggestions)
            }
        }
        //
        ErrorMsgHelper.onError?.(errorMsgHelper);
    }


}
