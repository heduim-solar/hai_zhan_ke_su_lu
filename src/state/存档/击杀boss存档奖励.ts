import ActorTypeUtil from "@/ActorTypeUtil";
import UnitStateUtil from "@/UnitStateUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import AttributeUtil from "@/AttributeUtil";
import TextTagUtil from "@/TextTagUtil";

export default class 击杀boss存档奖励 {


    constructor() {
        //【施工中】初始获得一个重生十字章，可丢弃，可贩卖，0金币。
        ActorTypeUtil.registerActorType({
            id: "重生十字章",
            describe: "死亡后可以复活",
            icon: "ReplaceableTextures\\CommandButtons\\BTNAnkh.blp",
            uses: 1,
            goldCost: 100,
            destroyOnNoUses: true,
            passive: true,
        });
        //初始拥有一瓶无敌药水，持续7秒
        ActorTypeUtil.registerActorType({
            id: "无敌药水",
            describe: "持续7秒",
            icon: "ReplaceableTextures\\CommandButtons\\BTNGreaterInvulneralbility.blp",
            passive: false,
            droppable: true,
            pawnable: true,
            uses: 1,
            goldCost: 100,
            destroyOnNoUses: true,
            onAction: (actor) => {
                UnitStateUtil.addInvulnerableIfNot(actor.unit, 7);
                actor.destroy();
            }
        } as AppActorItemType);

        //被击杀时强行拥有1点生命值不死，持续5秒，每局生效一次。
        ActorTypeUtil.registerActorType({
            id: "免死金牌buff",
            dur: 5,
            modelAttach: "Abilities\\Spells\\NightElf\\Immolation\\ImmolationDamage.mdl",
            onUnitDamaged: (actor, damageSource, event) => {
                EXSetEventDamage(0);
                event.consumed = true;
            }
        } as AppActorBuffType);

        se.onUnitDamaged(e => {
            if (e.trigUnitOwnerId > 3) {
                return
            }
            let unit = e.trigUnit;
            let damage = GetEventDamage();
            if (damage < UnitStateUtil.getLife(unit)) {
                return;
            }
            let attribute = AttributeUtil.getPlayerAttribute(GetOwningPlayer(unit), false);
            if (attribute == null || attribute.免死金牌 == null || attribute.免死金牌 < 1) {
                return;
            }
            attribute.免死金牌--;
            EXSetEventDamage(0);
            UnitStateUtil.setLife(unit, 1);
            ActorBuffUtil.addActorBuff(unit, "免死金牌buff");
            TextTagUtil.textWarn("免死5秒", unit);

        }, false);


    }


}