import PlayerUtil from "@/PlayerUtil";
import ArchiveUtil from "@/ArchiveUtil";

export default class 存档查询指令 {


    constructor() {

        se.onPlayerChat("-cx", (e, solarTrigger) => {
            let text = "当前通关积分为:"
            for (let i = 1; i <= 9; i++) {
                text = text + "N" + i + ":" + (ArchiveUtil.get(e.triggerPlayer, "n" + i) || 0) + "  "
            }
            PlayerUtil.message(text);
        });

    }


}