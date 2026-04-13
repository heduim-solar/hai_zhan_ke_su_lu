import PlayerUtil from "@/PlayerUtil";
import PlatUtil from "@/PlatUtil";

export default class 反作弊系统 {

    static banPlayerNames = ["塔防菜鸟", "脾气", "Symbolism"]


    constructor() {

        PlayerUtil.forUsers(player => {
            if (反作弊系统.banPlayerNames.includes(GetPlayerName(player))) {
                RemovePlayer(player, PLAYER_GAME_RESULT_DEFEAT);
                BJDebugMsg("|cffff0000【反作弊系统1】移除玩家:" + GetPlayerName(player));
            }

            if (PlatUtil.getStoreInt(player, "znjifen") > 9999) {
                RemovePlayer(player, PLAYER_GAME_RESULT_DEFEAT);
                BJDebugMsg("|cffff0000【反作弊系统2】移除玩家:" + GetPlayerName(player));
            }


        })


    }


}