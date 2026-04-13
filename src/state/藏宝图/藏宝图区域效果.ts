import TextTagUtil from "@/TextTagUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import ActorBuffUtil from "@/ActorBuffUtil";
import ActorUtil from "@/ActorUtil";

export default class 藏宝图区域效果 {

    constructor() {
        const 藏宝图区域降低移速 = "藏宝图区域降低移速"
        ActorTypeUtil.registerActorType({
            id: 藏宝图区域降低移速,
            name: "降低100%移速",
            describe: "藏宝图区域降低移速100%移速",
            icon: "ReplaceableTextures\\CommandButtons\\BTNFrostBolt.blp",
            model: "Abilities\\Spells\\Other\\FrostBolt\\FrostBoltMissile.mdx",
            attribute: {move_speed: -1000}
        });

        se.onEnterRect(gg_rct_left_top, e => {
            let idStr = e.trigUnitTypeIdStr;
            //水手号不受影响
            if (ActorUtil.isUnitHasActor(e.trigUnit, "水手号") || ActorUtil.isUnitHasActor(e.trigUnit, "水手号·改") ||
                ActorUtil.isUnitHasActor(e.trigUnit, "水手号基础技能") || ActorUtil.isUnitHasActor(e.trigUnit, "水手号·改基础技能")
            ) {
                return
            }
            if (e.trigUnitOwnerId < 6) {
                TextTagUtil.text("受到强烈冰冻,移速降低100%", e.trigUnit, 18, 3, 255, 0, 0)
                ActorBuffUtil.addActorBuff(e.trigUnit, 藏宝图区域降低移速)
            }
        });
        se.onLeaveRect(gg_rct_left_top, e => {
            let trigUnit = e.trigUnit;
            if (e.trigUnitOwnerId < 6) {
                ActorBuffUtil.clearUnitActorBuff(trigUnit, 藏宝图区域降低移速)
            }
        });


    }

}