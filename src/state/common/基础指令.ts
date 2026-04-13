import BaseUtil from "@/BaseUtil";
import InputUtil from "@/InputUtil";
import KeyCode from "@/KeyCode";
import PlayerUtil from "@/PlayerUtil";

let runtime: NoSelf | any = require('jass.runtime')
export default class 基础指令 {

    constructor() {
        InputUtil.onKeyPressed(KeyCode.VK_F7, () => {
            基础指令.修复字体重叠();
        });

        /**
         * 结束游戏
         * 使用场景 队友挂机时 不退出游戏没法结算当局地图经验
         */
        se.onPlayerChat("-end", (e) => {
            //只能主机玩家输入 以免小号捣乱
            if (PlayerUtil.firstOfUsers() != e.triggerPlayer) {
                return
            }
            PlayerUtil.message("玩家" + e.triggerPlayerId + 1 + ":" + e.triggerPlayerName + " 手动结束了游戏!")
            EndGame(true);
        });

        se.onPlayerChat("-open-console", () => {
            runtime.console = true;
        });

        se.onPlayerChat("-off-console", () => {
            runtime.console = false;
        });

        //7小时半内结束游戏 不然不会结算地图经验
        BaseUtil.runLater(60 * 60 * 7 + 30, () => {
            EndGame(true);
        });

    }


    static 修复字体重叠() {
        if (!DzIsWindowActive()) {
            return
        }
        let windowWidth = DzGetWindowWidth();
        let windowHeight = DzGetWindowHeight();
        DzChangeWindowSize(80, 60);
        BaseUtil.runLater(0.01, () => {
            DzChangeWindowSize(windowWidth, windowHeight);
        });
    }

}