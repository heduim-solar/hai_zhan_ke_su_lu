import BaseUtil from "@/BaseUtil";
import ForceUtil from "@/ForceUtil";
import PlatUtil from "@/PlatUtil";
import ArchiveUtil from "@/ArchiveUtil";
import TextUtil from "@/TextUtil";

export default class 开局刷新平台房间栏位信息 {
    static cfg = {
        // h1: "Ijifen"
    }


    constructor() {

        BaseUtil.runLater(5, () => {
            ForceUtil.forUserForce(player => {
                开局刷新平台房间栏位信息.refresh(player);
            })
        });
    }

    static refresh(p: player) {
        let archive = ArchiveUtil.getAllArchive(p);
        //
        let _mel = (archive._mel || 0)
        if (_mel > 0) {
            DzAPI_Map_StoreInteger(p, "endless_level", _mel)
        }


        //通关次数
        PlatUtil.setStat(p, "h1", tostring(PlatUtil.getStoreInt(p, "znjifen") || 0))//总伤害
        //最高通关难度
        PlatUtil.setStat(p, "h2", tostring(archive.maxn || 0))//
        //最高战力
        PlatUtil.setStat(p, "h3", TextUtil.toCnUnit(archive.maxzl || 0))//

    }


}