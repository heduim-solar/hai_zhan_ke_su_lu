import BaseUtil from "@/BaseUtil";
import PlayerUtil from "@/PlayerUtil";
import PlatUtil from "@/PlatUtil";

export default class 海域工具 {


    static 增加玩家探索积分(addNum: number) {
        // let data: t_深度海域存档 = XlsxDataUtil.getDataById("探索积分");
        // MapUtil.addUsersArchive(addNum, data.requireKey, data.name)

        PlayerUtil.forUsers(player => {
            let flag = PlatUtil.addStoreInt(player, "Itsjf", addNum);
            if (flag == false) {
                PlayerUtil.message("|cffffff00【存档规则提示】每局探索积分最多300！每天探索积分最多3000。超过会保存失败！", 10, player)
            }

        });
        PlayerUtil.message("|cff00ff00【存档】获得探索积分+" + addNum)
    }


    static 提示聊天信息(...msgs: string[]) {

        for (let i = 0; i < msgs.length; i++) {
            let msg = msgs[i];
            BaseUtil.runLater(i + 1, () => {
                PlayerUtil.message(msg, 20)
            })

        }

    }


}