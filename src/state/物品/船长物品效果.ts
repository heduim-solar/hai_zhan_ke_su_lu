import TextTagUtil from "@/TextTagUtil";
import UnitRewardUtil from "@/UnitRewardUtil";
import MapUtil from "../../util/MapUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import 主炮基础事件 from "../主炮/主炮基础事件";

export default class 船长物品效果 {


    constructor() {

        //基础船长 加钱效果
        // se.onUnitDamaged(e => {
        //     let damageSource = e.damageSource;
        //     if (!IsHandle(damageSource)) {
        //         return
        //     }
        //     let give_money: number = MapUtil.getUnitBounty(e.trigUnit)
        //     if (give_money == null) {
        //         return;
        //     }
        //     //每次造成伤害，可获得目标5%原本赏金的金币。
        //     let add = (ItemUtil.getItemCountOfTypeFromUnit(damageSource, "a41s") * 5);
        //     add += (ItemUtil.getItemCountOfTypeFromUnit(damageSource, "a41t") * 8);
        //     //每次造成伤害，可获得目标5%原本赏金的金币。
        //     let sjw = (ItemUtil.getItemCountOfTypeFromUnit(damageSource, "a41u") * 0.1);
        //     sjw += (ItemUtil.getItemCountOfTypeFromUnit(damageSource, "a41v") * 0.2);
        //     sjw += (ItemUtil.getItemCountOfTypeFromUnit(damageSource, "娜米") * 0.4);
        //     sjw += (ItemUtil.getItemCountOfTypeFromUnit(damageSource, "猫·娜米") * 0.8);
        //     if (add > 0 || sjw > 0) {
        //         let realAddGold = UnitRewardUtil.addGoldWithEarnGoldP(damageSource, Math.floor(give_money * sjw)) + add
        //         if (realAddGold != 0) {
        //             let textTagHandle = TextTagUtil.textGold("+" + realAddGold, e.trigUnit)
        //             SetTextTagVelocity(textTagHandle, 0.04, 0);
        //         }
        //     }
        // });


        let actorType: AppActorType = null;
        //one case
        actorType = ActorTypeUtil.getActorType("赏金王");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.projectileModelScale = 0.3;
            attackController.onHitTarget = projectile => {
                let realAddGold = UnitRewardUtil.addGoldWithEarnGoldP(projectile.source, 3)
                if (realAddGold != 0) {
                    let textTagHandle = TextTagUtil.textGold("+" + realAddGold, projectile.target)
                    SetTextTagVelocity(textTagHandle, 0.04, 0);
                }
            }
        }
        //one case
        actorType = ActorTypeUtil.getActorType("强盗王");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.projectileModelScale = 0.4;
            attackController.onHitTarget = projectile => {
                let realAddGold = UnitRewardUtil.addGoldWithEarnGoldP(projectile.source, 5)
                if (realAddGold != 0) {
                    let textTagHandle = TextTagUtil.textGold("+" + realAddGold, projectile.target)
                    SetTextTagVelocity(textTagHandle, 0.04, 0);
                }
            }
        }
        //one case
        actorType = ActorTypeUtil.getActorType("山贼王");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.projectileModelScale = 0.6;
            attackController.onHitTarget = projectile => {
                let give_money: number = MapUtil.getUnitBounty(projectile.target)
                if (give_money == null) {
                    return;
                }
                let realAddGold = UnitRewardUtil.addGoldWithEarnGoldP(projectile.source, 8 + (give_money * 0.1))
                if (realAddGold != 0) {
                    let textTagHandle = TextTagUtil.textGold("+" + realAddGold, projectile.target)
                    SetTextTagVelocity(textTagHandle, 0.04, 0);
                }
            }
        }
        //one case
        actorType = ActorTypeUtil.getActorType("海贼王");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.projectileModelScale = 0.8;
            attackController.onHitTarget = projectile => {
                let give_money: number = MapUtil.getUnitBounty(projectile.target)
                if (give_money == null) {
                    return;
                }
                let realAddGold = UnitRewardUtil.addGoldWithEarnGoldP(projectile.source, 10 + (give_money * 0.2))
                if (realAddGold != 0) {
                    let textTagHandle = TextTagUtil.textGold("+" + realAddGold, projectile.target)
                    SetTextTagVelocity(textTagHandle, 0.04, 0);
                }
            }
        }
        //one case
        actorType = ActorTypeUtil.getActorType("娜米");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.projectileModelScale = 1;
            attackController.onHitTarget = projectile => {
                let give_money: number = MapUtil.getUnitBounty(projectile.target)
                if (give_money == null) {
                    return;
                }
                let realAddGold = UnitRewardUtil.addGoldWithEarnGoldP(projectile.source, 15 + (give_money * 0.4))
                if (realAddGold != 0) {
                    let textTagHandle = TextTagUtil.textGold("+" + realAddGold, projectile.target)
                    SetTextTagVelocity(textTagHandle, 0.04, 0);
                }
            }
        }
        //one case
        actorType = ActorTypeUtil.getActorType("猫·娜米");
        actorType.onUnitChange = (actor, unit) => {
            let attackController = 主炮基础事件.onUnitChange(actor, unit);
            if (attackController == null) {
                return
            }
            attackController.projectileModelScale = 1.2;
            attackController.onHitTarget = projectile => {
                let give_money: number = MapUtil.getUnitBounty(projectile.target)
                if (give_money == null) {
                    return;
                }
                let realAddGold = UnitRewardUtil.addGoldWithEarnGoldP(projectile.source, 20 + (give_money * 0.8))
                if (realAddGold != 0) {
                    let textTagHandle = TextTagUtil.textGold("+" + realAddGold, projectile.target)
                    SetTextTagVelocity(textTagHandle, 0.04, 0);
                }
            }
        }


    }


}