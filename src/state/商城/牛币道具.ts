import BaseUtil from "@/BaseUtil";
import PlayerUtil from "@/PlayerUtil";
import HeroUtil from "@/HeroUtil";
import TextTagUtil from "@/TextTagUtil";
import PlatUtil from "@/PlatUtil";
import ActorTypeUtil from "@/ActorTypeUtil";
import UnitUtil from "@/UnitUtil";
import UnitStateUtil from "@/UnitStateUtil";
import 主炮存档ABC from "../存档/主炮存档ABC";
import ActorUtil from "@/ActorUtil";
import TextUtil from "@/TextUtil";

export default class 牛币道具 {


    constructor() {
        ActorTypeUtil.forAllActorTypes(actorType => {
            actorType.onCreated = (actor) => {
                actor.set("uiShowType", "宝物");
                actor.set("tag", "进化继承");
            }
        }, "商城");

        //每分钟+30全属性，游戏时间到达10分钟时，增加10%当前全属性。 WZWD	 	稳扎稳打
        PlayerUtil.forUsers(player => {
            if (PlatUtil.hasMallItem(player, "WZWD")) {
                BaseUtil.onTimer(60, (count) => {
                    let hero = PlayerUtil.getHero(player);
                    if (count == 10) {
                        HeroUtil.addHeroPropertyP(hero, false, 0.1);
                        TextTagUtil.textSuccess("稳扎稳打+10%全属性", hero);
                    } else {
                        HeroUtil.addHeroProperty(hero, 30);
                        TextTagUtil.textSuccess("稳扎稳打+30全属性", hero);
                    }
                    return true;
                });
            }
        });

        //KZML "开局获得持续3分钟的300航速 KZML	商城	通用商品	开足马力
        // 航速+5%"
        let actorType = ActorTypeUtil.getActorType("KZML");
        actorType.attribute = {move_speed: 300}
        actorType.dur = 180
        //YLBD 屹立不倒 "首次被BOSS攻击获得5秒无敌，这个效果有300秒冷却。
        // 护甲+10"
        actorType = ActorTypeUtil.getActorType("YLBD");
        actorType.attribute = {def: 10}
        actorType.onUnitDamaged = (actor, damageSource, event) => {
            if (UnitUtil.isHero(damageSource)) {
                actor.ifReady(300, () => {
                    UnitStateUtil.addInvulnerableIfNot(actor.unit, 5);
                    TextTagUtil.textSuccess("屹立不倒-无敌5秒", actor.unit);
                });
            }
        }
        //HLQK	商城	通用商品	火力全开	牛币	给buff	${id}	8800	其它	按时间消耗		无	否	"杀敌攻击+1
        // 攻击加成+10%"
        actorType = ActorTypeUtil.getActorType("HLQK");
        actorType.attribute = {attack_p: 0.1, add_attack_on_kill: 1}


        //YGXW	商城	通用商品	阳光希望 "存档掉落率+5%
        // 全属性加成+50%
        // 每激活一张设计图，初始属性+1"
        actorType = ActorTypeUtil.getActorType("YGXW");
        actorType.attribute = {存档掉率: 0.05, full_property_p: 0.5}
        actorType.onCreated = (actor) => {
            actor.set("uiShowType", "宝物");
            actor.set("tag", "进化继承");
            actorType.attribute.full_property = 主炮存档ABC.获取激活的存档设计图数量(actor.unitOwner, false);
            actor.setDescribe(actor.actorType.describe + "|n|cff00ff00当前加属性:" + actorType.attribute.full_property);
        }
        // CSZDCZ	商城	通用商品	传说中的船长	牛币	给buff	${id}	29800	其它	按时间消耗		无	否	"三维强化+100%
        // 每拥有一门主炮，这个数值提提升20%"
        // 传说中的船长
        actorType = ActorTypeUtil.getActorType("CSZDCZ");
        actorType.attribute = {full_property_p: 1}
        actorType.onUnitActorsChange = (actor) => {

            let zpCount = ActorUtil.getUnitAllActorListByClass(actor.unit, "主炮")?.length || 0;
            actor.attribute = {full_property_p: 1 + (zpCount * 0.2)}
            actor.setDescribe(actor.actorType.describe + "|n|cff00ff00当前加全属性:" + TextUtil.toPercentage(actorType.attribute.full_property_p));
        }


    }


}