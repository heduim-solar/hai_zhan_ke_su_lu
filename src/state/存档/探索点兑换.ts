import ActorTypeUtil from "@/ActorTypeUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import PlatUtil from "@/PlatUtil";
import ArchiveUtil from "@/ArchiveUtil";
import 图标面板 from "../../界面/图标面板/图标面板";
import MapMathUtil from "../../util/MapMathUtil";
import PlayerUtil from "@/PlayerUtil";

export default class 探索点兑换 {


    constructor() {

        // let tsdcfg: { [tsdid: string]: number } = ArchiveUtil.get(GetLocalPlayer(), "tsdcfg");
        // print_r(tsdcfg)
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.base_describe = actorType.describe;
            if (actorType.兑换需要探索点 && actorType.兑换需要探索点 > 0) {
                let tscfgVal = ArchiveUtil.get(GetLocalPlayer(), actorType.requireKey);
                if (tscfgVal && tscfgVal > 0) {
                    actorType.level = tscfgVal;
                }
                actorType.onLocalClick = (actor, btn, x, y, actorType) => {
                    if (btn == 1) {
                        if (探索点兑换.检查积分是否足够(actorType.兑换需要探索点 * ((actorType.level || 0) + 1))) {
                            actorType.level = (actorType.level || 0) + 1;
                            MouseFrameUtil.showSuccessText("增加等级到:" + actorType.level + " 剩余可用:" + 探索点兑换.获取剩余可用探索点())
                        } else {
                            MouseFrameUtil.showFailText("可用探索点不足!剩余可用:" + 探索点兑换.获取剩余可用探索点())
                        }
                    } else {
                        if (actorType.level == null || actorType.level <= 0) {
                            MouseFrameUtil.showFailText("已经是0级了!")
                        } else {
                            actorType.level--;
                            MouseFrameUtil.showSuccessText("降低等级到:" + actorType.level + " 剩余可用:" + 探索点兑换.获取剩余可用探索点())
                        }
                    }
                    探索点兑换.保存兑换配置()
                    探索点兑换.刷新探索扩展提示()
                }

            }
        }, "探索点兑换");
        let appActorType = ActorTypeUtil.getActorType("探索积分");
        appActorType.onLocalClick = (actor, btn, x, y, actorType) => {
            if (btn == 1) {
                探索点兑换.保存兑换配置()
                MouseFrameUtil.showSuccessText("保存成功!")
            } else {
                ActorTypeUtil.forAllActorTypes(actorType => {
                    actorType.level = 0;
                }, "探索点兑换");
                探索点兑换.保存兑换配置()
                MouseFrameUtil.showSuccessText("清空成功!")
            }


        }
        探索点兑换.刷新探索扩展提示()
        this.基础其他杂项();
    }

    基础其他杂项() {
        //校验是否刷档了
        if (!探索点兑换.检查积分是否足够(-1)) {
            PlayerUtil.message("存档校验出错!请退出游戏！或使用空存档继续游玩!输入'-清空存档'可以清空存档")
            ArchiveUtil.playerDatas["P" + GetPlayerId(GetLocalPlayer())] = {};
            return
        }

    }


    static 保存兑换配置() {
        //探索点配置
        // let tsdcfg: { [tsdid: string]: number } = {}
        ActorTypeUtil.forAllActorTypes(actorType => {
            if (actorType.兑换需要探索点 && actorType.兑换需要探索点 > 0 && actorType.level && actorType.level >= 0) {
                let dt: t_兑换初始属性存档 = actorType;
                let baseVar = ArchiveUtil.get(GetLocalPlayer(), dt.requireKey);
                if (baseVar == null || baseVar != actorType.level) {
                    ArchiveUtil.set(GetLocalPlayer(), dt.requireKey, actorType.level);
                }
            }
        }, "探索点兑换");
        探索点兑换.刷新探索扩展提示()
    }

    static 刷新探索扩展提示() {
        ActorTypeUtil.forAllActorTypes(actorType => {
            if (actorType.兑换需要探索点 && actorType.兑换需要探索点 > 0) {
                let base_describe: string = actorType.base_describe;
                base_describe = base_describe + "|n需要探索积分:|cffff0000" + (actorType.兑换需要探索点 * ((actorType.level || 0) + 1)) + "|r|n";
                actorType.describe = base_describe;
                if (actorType.level && actorType.level > 0) {
                    actorType.uiEnable = true;
                    actorType.describe = "当前等级:|cff00ff00" + actorType.level + "|r|n" + base_describe
                } else {
                    actorType.uiEnable = false;
                }
            }
        }, "探索点兑换");

        let appActorType = ActorTypeUtil.getActorType("探索积分");
        let base_describe: string = appActorType.base_describe;
        let storeInt = PlatUtil.getStoreInt(GetLocalPlayer(), "Itsjf") || 0;
        if (storeInt > 0) {
            appActorType.uiEnable = true;
        }
        appActorType.describe = "总计数量:|cff00ff00" + storeInt + "|r|n"
            + "剩余可用数量:|cff00ff00" + 探索点兑换.获取剩余可用探索点() + "|r|n" + base_describe + "|n修改后下一局开始生效!";
        图标面板.刷新图标数据();
    }

    static 获取剩余可用探索点(): number {
        let 已经使用的积分数量 = 0;
        ActorTypeUtil.forAllActorTypes(actorType => {
            if (actorType.兑换需要探索点 && actorType.兑换需要探索点 > 0 && actorType.level && actorType.level > 0) {
                已经使用的积分数量 = 已经使用的积分数量 + MapMathUtil.获得当前等级需要的总资源(actorType.兑换需要探索点, actorType.level);
            }
        }, "探索点兑换");

        let storeInt = PlatUtil.getStoreInt(GetLocalPlayer(), "Itsjf");

        return storeInt - 已经使用的积分数量;
    }

    static 检查积分是否足够(needJfAddon: number): boolean {
        let 已经使用的积分数量 = needJfAddon;
        ActorTypeUtil.forAllActorTypes(actorType => {
            if (actorType.兑换需要探索点 && actorType.兑换需要探索点 > 0 && actorType.level && actorType.level > 0) {
                已经使用的积分数量 = 已经使用的积分数量 + MapMathUtil.获得当前等级需要的总资源(actorType.兑换需要探索点, actorType.level);
            }
        }, "探索点兑换");

        let storeInt = PlatUtil.getStoreInt(GetLocalPlayer(), "Itsjf");

        return storeInt >= 已经使用的积分数量;
    }

}