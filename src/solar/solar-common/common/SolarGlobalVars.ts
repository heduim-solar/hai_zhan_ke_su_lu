import DataBase from "@/DataBase";
import FourCC from "@/FourCC";
import SolarEvent from "@/SolarEvent";


export default class SolarGlobalVars {
    static isInit: boolean = false;
    private static justInvoke: boolean = SolarGlobalVars.init0();

    //要调一个函数 以免import GlobalVars 被编译器取消了
    /**
     * @param debug 是否调试模式
     * @param egp_enable 是否启用太阳编辑器游戏插件  (是否打开游戏左上角太阳Logo按钮) 平台测试异步时最好关闭此项 以免因版本不一致导致异步
     */
    static init(debug: boolean = isDebug, egp_enable = debug) {
        SolarGlobalVars.printLogo();
        se.playerChat("-sl-version", () => {
            BJDebugMsg("当前游戏的太阳TS框架版本号为:" + _sl_version)
        });
    }


    private static init0(): boolean {
        if (SolarGlobalVars.isInit) {
            return true;
        }
        SolarGlobalVars.isInit = true;
        _G.FourCC = FourCC.string2id
        _G.id2string = FourCC.id2string
        _G.asyncExec = function (asyncPlayer: player, fun: () => void) {
            if (asyncPlayer == GetLocalPlayer()) {
                let old = isAsync
                isAsync = true;
                fun();
                isAsync = old;
            }
        }
        SolarGlobalVars.initBaseVars();
        return true;
    }


    /**
     * 初始化Lua环境
     */
    private static initBaseVars(): void {
        gameName = "太阳TS地图";
        _sl_version = 6.25
        isBigAttributeMode = false;
        handleReuseMinTime = 2.99;
        isAsync = false;
        if (settings == null) {
            settings = {fontPath: "Fonts\\dfst-m3u.ttf"};
        }
        if (gv == null) {
            gv = {};
        }
        if (globals == null) {
            globals = _G;
        }
        db = DataBase;
        sd = DataBase.sd;
        _G.deleteKey = function (obj: any, key: number | string | any): void {
            // delete obj[key]
            obj[key] = null;
        }
        _G.IsHandle = function (h: handle | number) {
            if (h == null || h == 0) {
                return false
            }
            return true;
        }
        se = new SolarEvent()
    }


    private static printLogo() {

        print(SolarGlobalVars.logoText)

    }


    static logoText =
        "\n     ________      ________     ___          ________     ________\n" +
        "    |\\   ____\\    |\\   __  \\   |\\  \\        |\\   __  \\   |\\   __  \\\n" +
        "    \\ \\  \\___|_   \\ \\  \\|\\  \\  \\ \\  \\       \\ \\  \\|\\  \\  \\ \\  \\|\\  \\\n" +
        "     \\ \\_____  \\   \\ \\  \\\\\\  \\  \\ \\  \\       \\ \\   __  \\  \\ \\   _  _\\\n" +
        "      \\|____|\\  \\   \\ \\  \\\\\\  \\  \\ \\  \\       \\ \\  \\ \\  \\  \\ \\  \\\\  \\|\n" +
        "        ____\\_\\  \\   \\ \\  \\\\\\  \\  \\ \\  \\____   \\ \\  \\ \\  \\  \\ \\  \\\\  \\\n" +
        "       |\\_________\\   \\ \\_______\\  \\ \\_______\\  \\ \\__\\ \\__\\  \\ \\__\\\\ _\\\n" +
        "       \\|_________|    \\|_______|   \\|_______|   \\|__|\\|__|   \\|__|\\|__|\n"


}


