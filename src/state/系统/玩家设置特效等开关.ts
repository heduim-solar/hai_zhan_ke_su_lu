import ActorTypeUtil from "@/ActorTypeUtil";
import BaseUtil from "@/BaseUtil";
import PlayerUtil from "@/PlayerUtil";
import AutoMissileAttackController from "@/AutoMissileAttackController";

export default class 玩家设置特效等开关 {


    constructor() {
        BaseUtil.runLater(3, () => {
            this.init();
        })
    }

    init() {

        let actorType = ActorTypeUtil.registerActorType({
            id: "_sl_:config:开关特效显示",
            class: "游戏设置",
            icon: "ReplaceableTextures\\CommandButtons\\BTNStarfall.blp",
            uiShowType: "通用图标面板",
            requiredTip: "点击打开特效显示!",
            name: "开关特效显示",
            uiEnable: true
        });
        actorType.onLocalClick = (actor, btn, x, y, actorType) => {
            if (settings.isEffectDisplay == null) {
                settings.isEffectDisplay = true;
            }
            settings.isEffectDisplay = !settings.isEffectDisplay;
            if (settings.isEffectDisplay) {
                PlayerUtil.message("|cffff0000显示特效");
                actorType.describe = "点击关闭特效显示!"
            } else {
                PlayerUtil.message("|cffff0000关闭特效")
                actorType.describe = "点击打开特效显示!"
            }
            actorType.uiEnable = settings.isEffectDisplay;
            se.emit("刷新图标面板")
        }

        //2
        actorType = ActorTypeUtil.registerActorType({
            id: "_sl_:config:开关射程最大限制",
            class: "游戏设置",
            icon: "ReplaceableTextures\\CommandButtons\\BTNCorpseExplode.blp",
            uiShowType: "通用图标面板",
            requiredTip: "点击启用射程最大限制!",
            name: "开关射程最大限制",
            uiEnable: true
        });
        actorType.onClick = (actor, btn) => {
            if (settings.射程最大限制 == null) {
                settings.射程最大限制 = true;
            }
            settings.射程最大限制 = !settings.射程最大限制;
            if (settings.射程最大限制) {
                PlayerUtil.message("|cffff0000启用射程最大限制(3000)");
                actorType.describe = "点击关闭射程最大限制!"
                AutoMissileAttackController.defaultRangeMaxLimit = 3000;
            } else {
                PlayerUtil.message("|cffff0000关闭射程最大限制")
                actorType.describe = "点击启用射程最大限制!"
                AutoMissileAttackController.defaultRangeMaxLimit = 500000;
            }
            actorType.uiEnable = settings.射程最大限制;
            se.emit("刷新图标面板")
        }


    }


}