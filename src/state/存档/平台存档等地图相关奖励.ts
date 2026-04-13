//#sl-final
import ActorTypeUtil from "@/ActorTypeUtil";
import ForceUtil from "@/ForceUtil";
import PlatUtil from "@/PlatUtil";
import ArchiveUtil from "@/ArchiveUtil";
import LangUtil from "@/LangUtil";
import AttributeUtil from "@/AttributeUtil";
import PlayerUtil from "@/PlayerUtil";
import MapUtil from "../../util/MapUtil";

type 存档奖励礼包 = {
    id?: string
    name?: string
    requireKey?: string
    /** 公会情况 */
    requireVal?: string | number
    /** 数值大小 */
    requireValMin?: number
    rewardKey?: string
    rewardVal?: any
    requiredTip?: string
    数量叠加?: boolean | number | string | any
    //默认数量叠加得会显示到提示中
    显示数量?: boolean
    激活码?: string
    describe?: string
    icon?: string
    hide?: boolean
    uiShowType?: string
    [key: string]: any
}

export default class 平台存档等地图相关奖励 {


    static distributeRewards(datum: 存档奖励礼包) {
        if (!datum.id) {
            return
        }
        if (!datum.requireKey) {
            return;
        }
        ForceUtil.forUserForce(p => {
            let 发放数量 = 平台存档等地图相关奖励.判断是否符合此奖励(p, datum);
            if (发放数量 && 发放数量 > 0) {
                if (datum.requireVal && LangUtil.isNumber(datum.rewardVal) && 发放数量 < (datum.requireVal as number)) {
                    return
                }
                if (datum.requireValMin && 发放数量 < datum.requireValMin) {
                    return
                }
                平台存档等地图相关奖励.发放奖励(p, datum, 发放数量)
            }
        });
        if (datum.激活码 && datum.激活码.length > 0 && datum.requireKey && datum.requireKey.length > 0) {
            平台存档等地图相关奖励.注册激活码激活存档(datum.激活码, datum);
        }
    }

    static 注册激活码激活存档(激活码: string, datum: 存档奖励礼包) {
        //
        se.onPlayerChat(激活码, (e, c) => {
            let player = e.triggerPlayer;
            let oldVal = ArchiveUtil.get(player, datum.requireKey);
            if (oldVal && oldVal > 0) {
                //已经激活过了
                PlayerUtil.message("|cffff0000【已经激活过了】" + tostring(datum.name) + "!此激活码已被激活过了，无需重复激活!", 5, player)
                return
            }
            PlayerUtil.message("|cff00ff00【存档】激活" + tostring(datum.name) + "!后续自动激活，无需再输入此激活码!", 5, player)
            ArchiveUtil.set(player, datum.requireKey, 1);
            平台存档等地图相关奖励.发放奖励(player, datum, 1);

        })

    }


    static 判断是否符合此奖励(p: player, datum: 存档奖励礼包): number {
        if (datum.requireKey == "商城道具") {
            let mallItemCount = PlatUtil.getMallItemCount(p, datum.id);
            if (mallItemCount && mallItemCount > 0) {
                return mallItemCount;
            }
            if (MapUtil.是否开后门(p)) {
                return 1;
            }
            return PlatUtil.hasMallItem(p, datum.id) ? 1 : 0;
        } else if (datum.requireKey == "收藏过地图") {
            return PlatUtil.isCollect(p) ? 1 : 0;
        } else if (datum.requireKey == "累计获得赞数") {
            return PlatUtil.getForumDataTotalLikes(p) >= (datum.requireValMin || 1) ? PlatUtil.getForumDataTotalLikes(p) : 0;
        } else if (datum.requireKey == "总签到天数") {
            return PlatUtil.continuousCount(p) >= (datum.requireValMin || 1) ? PlatUtil.continuousCount(p) : 0
        } else if (datum.requireKey == "地图等级") {
            let mapLevel = PlatUtil.getMapLevel(p);
            return mapLevel >= (datum.requireValMin || 1) ? mapLevel : 0
        } else if (datum.requireKey == "测试福利") {
            return DzAPI_Map_GetStoredString(p, "maptest2020") != "1" ? 1 : 0
        } else if (datum.requireKey == "预约福利") {
            return DzAPI_Map_GetStoredString(p, "prebook2023") != "1" ? 1 : 0
        } else if (datum.requireKey == "公会名称") {
            let guildName = PlatUtil.getGuildName(p);
            if (guildName && guildName.indexOf(datum.requireVal as string) >= 0) {
                return 1
            } else {
                return 0
            }
        } else {
            //
            let archiveVal: number = PlatUtil.getStoreInt(p, datum.requireKey);
            if (archiveVal == null || archiveVal == 0) {//表示没有此存档不激活
                archiveVal = ArchiveUtil.get(p, datum.requireKey);
            }
            if (archiveVal && typeof archiveVal == "string" && tostring(archiveVal).length > 0) {
                return 1;
            }
            return archiveVal
        }
        return null;
    }

    static 发放奖励(p: player, datum: 存档奖励礼包, 发放数量: number) {

        let rewardVal = datum.rewardVal as any
        //计算发放真实数量 是否有最大 限制
        if (datum.数量叠加 == true || datum.数量叠加 == "无上限" || datum.数量叠加 == "数量消耗" || datum.数量叠加 == "地图等级"
            || (LangUtil.isNumber(datum.数量叠加) && datum.数量叠加 != 0)) {
            let maxLimit = 100000000;
            if (datum.数量叠加 == "地图等级") {
                maxLimit = PlatUtil.getMapLevel(p);
            } else if (LangUtil.isNumber(datum.数量叠加) && (datum.数量叠加 as number) > 1) {
                maxLimit = datum.数量叠加 as number;
            }
            if (LangUtil.isNumber(rewardVal)) {
                //复制一份 以避免直接改基础的类型数据
                rewardVal = rewardVal * math.min(发放数量, maxLimit);
            } else if (LangUtil.isObject(rewardVal)) {
                rewardVal = AttributeUtil.multiply(rewardVal, math.min(发放数量, maxLimit), {});
            }
            //
            if (datum.显示数量 != false) {
                let countInfo = "|cff00ff00当前数量:" + 发放数量
                if (发放数量 > maxLimit) {
                    countInfo += "(生效数量:" + maxLimit + ")";
                }
                ActorTypeUtil.setTypeDescribe(datum.id, countInfo + "|r|n" + datum.describe, p)
            }


        }

        //发放奖励
        if (datum.rewardKey && datum.rewardKey.length > 0) {
            se.emit("给与玩家奖励", {p: GetPlayerId(p), key: datum.rewardKey, val: rewardVal})
        } else if (rewardVal != null) {
            //不填的话则使用rewardVal值的key作为奖励key
            for (let rewardValKey in rewardVal) {
                se.emit("给与玩家奖励", {
                    p: GetPlayerId(p),
                    key: rewardValKey,
                    val: rewardVal[rewardValKey]
                })
            }
        }
        ActorTypeUtil.setUiEnable(datum.id, true, p)


    }


}