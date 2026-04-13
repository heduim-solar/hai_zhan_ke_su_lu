/** @noSelfInFile */
import FunctionInfo = debug.FunctionInfo;

export default class DebugVmUtil {

    /**
     * * 'c': the hook is called every time Lua calls a function;
     * * 'r': the hook is called every time Lua returns from a function;
     * * 'l': the hook is called every time Lua enters a new line of code.
     * 'call' | 'return' | 'line' | 'count'
     */
    static sethook(hook: (event: 'call' | 'return' | 'line' | 'count', line?: number) => any, mask: string) {
        debug.sethook(hook, mask, 0)
    }


    /**
     * 获取函数信息对应的TS的代码行
     * @param functionInfo
     */
    static getTsLine(functionInfo: FunctionInfo) {
        if (functionInfo.short_src == null) {
            return functionInfo.linedefined;
        }
        let tsLine = tostring(functionInfo.linedefined || 0)
        if (_G['__TS__sourcemap']) {
            if (_G['__TS__sourcemap'][functionInfo.short_src]) {
                tsLine = tostring(_G['__TS__sourcemap'][functionInfo.short_src][tsLine] || tsLine)
            }
        }
        return tsLine;
    }

    /**
     * 获取TS代码文件路径与名字与代码行
     * @param functionInfo
     */
    static getTsSrcLineName(functionInfo: FunctionInfo) {
        if (!functionInfo) {
            return "";
        }
        let src = functionInfo.source;
        if (!src) {
            src = "<C>";
        } else if (src.substring(src.length - 4, src.length) == ".lua") {
            src = src.substring(0, src.length - 4);
        }
        let name = functionInfo.name;
        if (!name) {
            name = "匿名";
        } else if (name.substring(name.length - 2, name.length) == "_l") {
            name = name.substring(0, name.length - 2);
        }
        let title = src + ":" + tostring(DebugVmUtil.getTsLine(functionInfo)) + ":" + name;
        return title;
    }


    /**
     * 勾住函数调用与返回 并打印信息
     * (用作崩溃查询 看崩溃时调用到哪个函数了)
     * @param writeFile 将最近的函数调用写到文件里
     * @param printMaxCount 每秒内相同函数最大打印次数
     * @param mask c/cr c=函数开始调用时   r=函数结束返回时
     */
    static hookCRAndPrintInfo(writeFile: boolean = true, printMaxCount: number = 2, mask: string = "c") {
        let pt: { [name: string]: number } = {}
        let [file] = io.open("_sre/temp/hookCRAndPrintInfo.txt", "wb");
        let cLines = []
        DebugVmUtil.sethook((e) => {
            let information = debug.getinfo(2, "nS");
            let tsSrcNameLine = DebugVmUtil.getTsSrcLineName(information as any);
            let count = (pt[tsSrcNameLine] || 0) + 1
            pt[tsSrcNameLine] = count
            if (printMaxCount < 0 || count < printMaxCount) {
                print(tsSrcNameLine)
            }
            if (time % 1000 == 0) {
                pt = {};
            }
            if (!writeFile) {
                return;
            }
            if (cLines.length > 1000) {
                cLines = cLines.slice(cLines.length - 20, cLines.length)
            }
            cLines.push(tsSrcNameLine)
            file.seek("set")
            file.write("\uFEFF")
            for (let i = Math.max(cLines.length - 20, 0); i < cLines.length; i++) {
                file.write(cLines[i] + "\r\n")
            }
            file.write("\r\n####结束####\r\n")
            file.flush();
        }, mask)
    }
}