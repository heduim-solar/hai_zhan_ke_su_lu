import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "../主炮/主炮基础事件";
import ActorBuffUtil from "@/ActorBuffUtil";

export default class 船长小丑 {


    constructor() {
        /**
         * 敏捷+6000
         * 射程：600
         * 伤害：攻击力x0.2
         * 射速：0.1
         * 特殊：该副炮造成伤害时削弱目标2点护甲，持续5秒，刷新叠加，最多200层。
         */
        ActorTypeUtil.registerActorType({
            id: "小丑Buff",
            name: "小丑-护甲",
            describe: "削弱目标护甲",
            attribute: {def: -1},
            icon: "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
            dur: 5,
            levelMax: 200,
            levelDurMode: false
        } as AppActorBuffType);
        //one case
        let actorType = ActorTypeUtil.getActorType("小丑");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                ActorBuffUtil.addActorBuff(projectile.target, "小丑Buff")
            }
        }
        /**
         * 敏捷+8000
         * 射程：600
         * 伤害：攻击力x0.2
         * 射速：0.1
         * 特殊：该副炮造成伤害时削弱目标3点护甲，持续5秒，刷新叠加，最多200层。
         */
        ActorTypeUtil.registerActorType({
            id: "小丑皇Buff",
            name: "小丑皇-护甲",
            describe: "削弱目标护甲",
            attribute: {def: -1},
            icon: "ReplaceableTextures\\CommandButtons\\BTNDeathCoil.blp",
            dur: 5,
            levelMax: 100,
            levelDurMode: false
        } as AppActorBuffType);
        //one case
        actorType = ActorTypeUtil.getActorType("小丑皇");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.onHitTarget = projectile => {
                ActorBuffUtil.addActorBuff(projectile.target, "小丑皇Buff")
            }
        }
    }


}