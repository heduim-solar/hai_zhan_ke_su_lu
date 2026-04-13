import ActorItemUtil from "@/ActorItemUtil";

export default class 秒杀守护者 {


    constructor() {


        se.onUnitTypeDeath(e => {

            let number = GetRandomInt(0, 100);

            if (number < 20) {

                ActorItemUtil.createActorItem("改造设计图", e.trigUnitX, e.trigUnitY)

            } else if (number < 40) {
                ActorItemUtil.createActorItem("天工图", e.trigUnitX, e.trigUnitY)
            }


        }, "a44n");


    }


}