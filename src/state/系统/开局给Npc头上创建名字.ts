//#sl-final
import BaseUtil from "@/BaseUtil";
import SelectUtil from "@/SelectUtil";
import ActorUnitUtil from "@/ActorUnitUtil";

export default class 开局给Npc头上创建名字 {

    static cfg = {}

    static npcAbilityIds = ["Aneu", "Apit", "Asid", "Avul"]


    constructor() {

        BaseUtil.runLater(1.1, () => {

            SelectUtil.forAllAliveUnits(unit => {
                for (let npcAbilityId of 开局给Npc头上创建名字.npcAbilityIds) {
                    if (GetUnitAbilityLevel(unit, npcAbilityId) > 0 && GetPlayerId(GetOwningPlayer(unit)) >= 4) {
                        开局给Npc头上创建名字.createTextTagForNpc(unit)
                        return
                    }
                }
            });
            se.onUnitEnterMapRect(e => {
                let unit = e.trigUnit;
                for (let npcAbilityId of 开局给Npc头上创建名字.npcAbilityIds) {
                    if (GetUnitAbilityLevel(unit, npcAbilityId) > 0 && GetPlayerId(GetOwningPlayer(unit)) >= 4) {
                        开局给Npc头上创建名字.createTextTagForNpc(unit)
                        return
                    }
                }
            })
        });


    }

    static createTextTagForNpc(npc: unit) {
        let textTagHandle = CreateTextTag();
        SetTextTagColor(textTagHandle, 255, 208, 80, 255);
        let fontSize = 10 * 0.0023;
        let text = GetUnitName(npc) || "";
        ActorUnitUtil.ifHasActorUnit(npc, (actor) => {
            text = actor.getName();
            return
        })
        SetTextTagText(textTagHandle, text, fontSize);
        SetTextTagPos(textTagHandle, GetUnitX(npc) - (text.length / 2 * 15), GetUnitY(npc), 220);
        SetTextTagPermanent(textTagHandle, true);

        //
        return textTagHandle
    }


}