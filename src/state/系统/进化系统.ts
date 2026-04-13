import DataBase from "@/DataBase";
import {d_玩家英雄船} from "../../xlsx/单位/玩家英雄船";
import ArrayUtil from "@/ArrayUtil";
import RandomUtil from "@/RandomUtil";
import SelectUtil from "@/SelectUtil";
import PlayerUtil from "@/PlayerUtil";
import MapHeroUtil from "../../util/MapHeroUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";

declare global {
    interface AppPlayerData {
        jhcs_进化次数?: number
        gbjh_关闭进化?: boolean
        正在进化?: boolean

    }
}

export default class 进化系统 {

    static d_随机出现英雄: t_玩家英雄船[] = null;
    static d_随机出现英雄权重1 = {};
    static d_随机出现英雄权重2 = {};
    static d_随机出现英雄权重3 = {};
    static d_随机出现英雄权重4 = {};

    constructor() {
        //
        进化系统.d_随机出现英雄 = ArrayUtil.selectByWhere(d_玩家英雄船, "ly_来源", "随机出现");
        for (let d随机出现英雄Element of 进化系统.d_随机出现英雄) {
            if (d随机出现英雄Element.index > 55) {
                break
            }
            进化系统.d_随机出现英雄权重1[d随机出现英雄Element.id] = d随机出现英雄Element.sjcxgl_随机出现概率 || 1;
        }
        进化系统.d_随机出现英雄权重2 = {...进化系统.d_随机出现英雄权重1}
        进化系统.d_随机出现英雄权重3 = {...进化系统.d_随机出现英雄权重1}
        进化系统.d_随机出现英雄权重4 = {...进化系统.d_随机出现英雄权重1}
        //
        se.onHeroLevelUp(e => {
            if (e.trigUnitOwnerId > 3) {
                return;
            }

            let playerData = DataBase.getPlayerSolarData(e.trigUnitOwner, true);
            if (playerData.正在进化) {
                return;
            }
            let unitOwner = e.trigUnitOwner;

            if (ActorAbilityUtil.getUnitActorAbilityListSize(e.trigUnit, "主炮") >= 4) {
                return
            }
            playerData.jhcs_进化次数 = (playerData.jhcs_进化次数 || 0) + 1;
            进化系统.do进化(unitOwner, playerData.jhcs_进化次数);

            // else if (playerData.gbjh_关闭进化 != true) {
            //     let killingUnitOwner = unitOwner
            //     let oldHero = SelectUtil.getAnHero(GetPlayerId(killingUnitOwner))
            //     if (ActorAbilityUtil.getUnitActorAbilityListSize(oldHero, "主炮") >= 4) {
            //         playerData.正在进化 = false;
            //         return
            //     }
            //     playerData.jhcs_进化次数++;
            //     DialogUtil.show(GetPlayerId(unitOwner), "是否进化?", (i, t) => {
            //         if (i == 0) {
            //             进化系统.do进化(killingUnitOwner, playerData.jhcs_进化次数);
            //         } else if (i == 1) {
            //             playerData.gbjh_关闭进化 = true
            //         }
            //     }, "我要进化", "不需要进化(后续不再提示进化)")
            // }
        });
    }

    static do进化(player: player, lv: number) {
        let playerId = GetPlayerId(player);
        let oldHero = SelectUtil.getAnHero(playerId)
        if (ActorAbilityUtil.getUnitActorAbilityListSize(oldHero, "主炮") >= 4) {
            PlayerUtil.message("你的英雄已经拥有4个主炮了！无法进化!", 10, player)
            return
        }
        let keyW = 进化系统.d_随机出现英雄权重1;
        if (playerId == 1) {
            keyW = 进化系统.d_随机出现英雄权重2;
        } else if (playerId == 2) {
            keyW = 进化系统.d_随机出现英雄权重3;
        } else if (playerId == 3) {
            keyW = 进化系统.d_随机出现英雄权重4;
        }


        let randomHeroId = RandomUtil.getRandomKeyByWeight(keyW);
        if (randomHeroId == null) {
            PlayerUtil.message("无可用英雄进化了！", 10, player)
            return
        }
        deleteKey(keyW, randomHeroId);
        MapHeroUtil.do进化ByType(player, lv, randomHeroId)
    }


}