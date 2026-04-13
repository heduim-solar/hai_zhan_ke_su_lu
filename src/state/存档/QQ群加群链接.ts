import ActorTypeUtil from "@/ActorTypeUtil";

export default class QQ群加群链接 {


    constructor() {
        let actorType = ActorTypeUtil.getActorType("QQ群礼包");
        actorType.onLocalClick = (actor, btn, x, y, actorType) => {
            DzOpenQQGroupUrl?.("http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=jqSXkSAwMyhguQzXX1jUt4AdFPgHUENa&authKey=rK0O3GuqOibzMhlLJzLTT2QcQNv6%2FIHu7BQlUx4HgMXRDRvdS6wteaqXhAnkH1aM&noverify=0&group_code=782345607")

        }

    }


}