import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import BaseUtil from "@/BaseUtil";
import TextTagUtil from "@/TextTagUtil";
import SelectUtil from "@/SelectUtil";
import VestAbilityUtil from "@/VestAbilityUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import ActorAbilityUtil from "@/ActorAbilityUtil";

export default class 船长之心技能 {


    constructor() {

        //给技能注册学习书物品
        ActorTypeUtil.forAllActorTypes(actorType => {
            ActorTypeUtil.registerActorType({
                id: actorType.id + "学习书",
                name: actorType.name,
                icon: actorType.icon,
                class: actorType.class + "学习书",
                describe: actorType.describe,
                model: "Objects\\InventoryItems\\tomeBrown\\tomeBrown.mdx",
                targetType: "无目标",
                passive: false,
                uses: 1,
                destroyOnNoUses: true,
                onAction: (actor) => {
                    ActorAbilityUtil.destroyUnitAllActorAbility(actor.unit, "船长之心")
                    ActorAbilityUtil.createActorAbility(actorType.id, actor.unit, 6)
                    actor.destroy()
                }
            } as AppActorItemType)


        }, "船长之心")

        //
        let actorType: AppActorType = null;
        actorType = ActorTypeUtil.getActorType("船长之心-无敌");
        actorType.onAction = (actor) => {
            if (!UnitStateUtil.isInvulnerable(actor.unit)) {
                UnitStateUtil.setInvulnerable(actor.unit, true)
                BaseUtil.runLater(2, () => {
                    UnitStateUtil.setInvulnerable(actor.unit, false)
                })
                TextTagUtil.textInfo("无敌", actor.unit)
            }
        }
        /**
         * 船长之心-变羊：将身边400范围的敌人变羊5秒，冷却15秒。
         */
        actorType = ActorTypeUtil.getActorType("船长之心-变羊");
        actorType.onAction = (actor) => {
            SelectUtil.forEnemyUnitsInRange(actor.unit, 400, unit => {
                VestAbilityUtil.polymorph(unit, 5)
            })
        }

        /**
         * 船长之心-酋长：全图友军攻击力+500%，持续10秒，冷却60秒。
         */
        ActorTypeUtil.registerActorType({
            id: "船长之心-酋长Buff",
            name: "酋长",
            icon: "ReplaceableTextures\\CommandButtons\\BTNBloodLustOn.blp",
            attribute: {
                attack_p: 5
            },
            dur: 10
        })

        actorType = ActorTypeUtil.getActorType("船长之心-酋长");
        actorType.onAction = (actor) => {
            SelectUtil.forAllEnemyUnits(unit => {
                ActorBuffUtil.addActorBuff(unit, "船长之心-酋长Buff")
            }, Player(11))
            TextTagUtil.textInfo("船长之心-酋长", actor.unit)
        }


    }


}