import MapModel from "../../MapModel";
import SolarDamageState from "@/SolarDamageState";
import BaseUtil from "@/BaseUtil";
import MapUtil from "../../util/MapUtil";

export default class 敌人难度效果 {

    static 减伤: number = 1;
    static baseJianShang: number = 1;


    constructor() {
        if (settings.gameMode == MapModel.模式1_普通模式) {
            return
        }
        let nanduLevel = MapUtil.getRealNanduLevel();
        if (settings.gameMode == MapModel.模式2_寄生模式) {
            nanduLevel = 1.2 ** nanduLevel;
        } else if (settings.gameMode == MapModel.模式3_献祭模式) {
            nanduLevel = 1.3 ** nanduLevel;
        } else if (settings.gameMode == MapModel.模式4_真实难度) {
            nanduLevel = 1.4 ** nanduLevel;
        }
        敌人难度效果.baseJianShang = 1 - (nanduLevel / (nanduLevel + 20));
        //
        print(nanduLevel + "基础减伤=" + 敌人难度效果.baseJianShang)
        //打印数值
        敌人难度效果.updateJS(32)
        敌人难度效果.updateJS(1)


        BaseUtil.onTimer(10, count => {
            //1-25
            let realLevel = gv.enemyLevel;
            if (gv.深度海域层数 && gv.深度海域层数 > 0) {
                realLevel = gv.深度海域层数 + 16
            }
            敌人难度效果.updateJS(realLevel)
            //

            return true;
        })


        SolarDamageState.addEventHandlerLast(event => {
            if (GetPlayerId(GetOwningPlayer(event.unit0)) > 5) {
                event.resultDamage *= 敌人难度效果.减伤;
            }
        });


    }

    static updateJS(realLevel: number) {
        let realLevelXS = realLevel / (realLevel + 10);
        敌人难度效果.减伤 = 敌人难度效果.baseJianShang * (1 - realLevelXS);


        print("Lv." + realLevel + "当前敌人减伤:" + 敌人难度效果.减伤)
    }


}