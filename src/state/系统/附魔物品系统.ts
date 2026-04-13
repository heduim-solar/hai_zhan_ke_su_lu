import MapUtil from "../../util/MapUtil";
import 演员NPC创建 from "../物品/演员NPC创建";
import {d_附魔物品} from "../../xlsx/装备/附魔物品";
import ArrayUtil from "@/ArrayUtil";
import BaseUtil from "@/BaseUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import ActorItem from "@/ActorItem";
import ActorItemUtil from "@/ActorItemUtil";
import MouseFrameUtil from "@/MouseFrameUtil";
import AttributeUtil from "@/AttributeUtil";

export default class 附魔物品系统 {


    /**
     * 海上奇珍商店新增特效附魔，会出现以下物品    "规则
     * （点击之后再点击装备类物品，可以进行附魔）"
     *
     * "海上奇珍商店（第二行的4个位置），
     * 每波刷新一次（新敌人出现同时刷新）且需要提示玩家。按照品级出现概率，
     * 品级分为12345（60%出1级20%概率出2级 15%概率出3级4%概率出4级 1%概率出5级，
     * 每波出现1级的概率-4%，后面的概率+1%）
     * 抽取式购买，买了就没"
     *
     * 以下道具都是购买之后点击对目标道具附魔的，在描述上介绍给玩家
     *
     * 所有附魔统一提示：被附魔的道具参与合成后附魔会消失！请慎重考虑
     *
     * "附魔的属性用浅绿色字体显示在装备栏下方
     * 附魔：
     * 属性XXX"    再次附魔直接顶替之前附魔
     */
    constructor() {
        //普通模式不开放
        if (MapUtil.getRealNanduLevel() < 10) {
            return
        }
        附魔物品系统.初始化附魔物品效果();
        BaseUtil.runLater(2, () => {
            附魔物品系统.update(true)

        })

        //
        se.on("敌人波数改变", (lv) => {

            附魔物品系统.update(true);

        });


    }

    static 初始化附魔物品效果() {
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.name = "附魔物品:" + actorType.name;
            actorType.onCreated = (actor) => {
                actor.setExtDescribe("|cffcccccc附魔提示 ", "对物品使用可把此物品所带的效果附加到指定物品上! 一个物品只能附魔一次!且吞噬时附魔效果会丢失！")
            }
            actorType.onBuy = (actor, buyingUnit) => {
                // 附魔物品系统.update(false);
            }
            actorType.onAction = (actor, x, y, targetUnit) => {
                let actorItem: ActorItem = actor as ActorItem;
                let targetItem = GetSpellTargetItem();
                let targetActorItem = ActorItemUtil.getActorItem(targetItem);
                if (targetActorItem == null) {
                    actorItem.addUses(1)
                    MouseFrameUtil.showFailText("请选择一个物品!", 1, actor.unitOwner)
                    return
                }
                if (targetActorItem.附魔物品) {
                    actorItem.addUses(1)
                    MouseFrameUtil.showFailText("你已经附魔过此物品了!" + targetActorItem.附魔物品, 1, actor.unitOwner)
                    return
                }
                if (targetActorItem.get("class") == "附魔物品") {
                    actorItem.addUses(1)
                    MouseFrameUtil.showFailText("不能附魔此附魔类型物品!", 1, actor.unitOwner)
                    return
                }


                //将演员物品 作为 演员buff 添加给单位
                if (actor.attribute) {
                    if (targetActorItem.attribute == null) {
                        targetActorItem.attribute = {}
                    }

                    AttributeUtil.add(targetActorItem.attribute, actor.attribute)
                }
                //销毁
                actorItem.destroy();
                targetActorItem.附魔物品 = actorItem.actorTypeId;
                targetActorItem.setExtDescribe("|cff00ff00附魔|r ", actorItem.actorTypeId + "|n" + actorItem.actorType.describe)
                MouseFrameUtil.showSuccessText("附魔成功!" + targetActorItem.附魔物品, 1, actor.unitOwner)


            }


        }, "附魔物品")

    }


    static lastSellItem = null;

    static update(addNew = true) {
        let newSellItem: string = ArrayUtil.randomElement(d_附魔物品).id;
        for (let actorUnit of 演员NPC创建.深海奇珍演员单位列表) {
            if (附魔物品系统.lastSellItem != null) {
                actorUnit.removeSellItem(附魔物品系统.lastSellItem)
            }
            if (addNew) {
                actorUnit.addSellItem(newSellItem)
            }
        }
        if (addNew) {
            print("附魔物品系统 newSellItem=" + newSellItem)
        }
        附魔物品系统.lastSellItem = newSellItem;

    }


}





