import 附魔物品 from "xlsx/装备/附魔物品";
import 污染的航海器 from "xlsx/装备/污染的航海器";
import 平台论坛点赞相关奖励 from "xlsx/存档/平台论坛点赞相关奖励";
import 神话权柄累计解锁 from "xlsx/存档/神话权柄累计解锁";
import 地图等级奖励 from "xlsx/存档/地图等级奖励";
import 属性面板ui显示 from "xlsx/系统/属性面板ui显示";
import 历史中的战舰碎片 from "xlsx/存档/历史中的战舰碎片";
import 深海奇珍物品 from "xlsx/装备/深海奇珍物品";
import 深度海域怪 from "xlsx/单位/深度海域怪";
import 核心部件 from "xlsx/装备/核心部件";
import 野怪 from "xlsx/单位/野怪";
import 基础宝宝助手 from "xlsx/基础宝宝助手";
import 基础船长演员物品 from "xlsx/装备/基础船长演员物品";
import 进攻怪boss from "xlsx/单位/进攻怪boss";
import 海上奇珍售卖物品 from "xlsx/装备/海上奇珍售卖物品";
import 进攻怪演员 from "xlsx/单位/进攻怪演员";
import 船长之心技能 from "xlsx/技能/船长之心技能";
import 进攻怪boss主炮 from "xlsx/单位/进攻怪boss主炮";
import 扩展主炮 from "xlsx/技能/扩展主炮";
import 进攻怪加强buff from "xlsx/技能/进攻怪加强buff";

import 擂台单位挑战NPC from "xlsx/单位/擂台单位挑战NPC";
import 擂台挑战怪 from "xlsx/单位/擂台挑战怪";
import 陆上生物单位演员 from "xlsx/单位/陆上生物单位演员";
import 船长演员物品 from "xlsx/装备/船长演员物品";
import 海上奇珍物品 from "xlsx/装备/海上奇珍物品";
import 演员物品售卖NPC from "xlsx/单位/演员物品售卖NPC";
import 副炮演员物品 from "xlsx/装备/副炮演员物品";
import 属性书 from "xlsx/单位/属性书";
import 物品合成 from "xlsx/系统/物品合成";
import 船基本技能 from "xlsx/技能/船基本技能";
import 修理工 from "xlsx/装备/修理工";
import 模拟传送 from "xlsx/技能/模拟传送";
import 炮弹 from "xlsx/装备/炮弹";
import 桅杆 from "xlsx/装备/桅杆";
import 船头 from "xlsx/装备/船头";
import 甲板 from "xlsx/装备/甲板";
import 马达 from "xlsx/装备/马达";
import 船帆 from "xlsx/装备/船帆";
import 船身 from "xlsx/装备/船身";
import 船长 from "xlsx/装备/船长";
import 船主炮 from "xlsx/技能/船主炮";
import 基础 from "xlsx/系统/基础";


export default function StateConfigInit() {


    基础();
    船主炮();
    船长();
    船身();
    船帆();
    马达();
    甲板();
    船头();
    桅杆();
    炮弹();
    模拟传送();
    修理工();
    船基本技能();
    物品合成();
    属性书();
    副炮演员物品();
    演员物品售卖NPC();
    海上奇珍物品();
    船长演员物品();
    陆上生物单位演员();
    擂台挑战怪();
    擂台单位挑战NPC();
    进攻怪boss();
    进攻怪加强buff();
    扩展主炮();
    进攻怪boss主炮();
    船长之心技能();
    进攻怪演员();
    海上奇珍售卖物品();
    基础船长演员物品();
    基础宝宝助手();
    //存档
    // 主炮存档A();
    // 主炮存档B();
    // 主炮存档C();
    // 通关奖励();
    // 击杀BOSS装备存档();
    //商城
    // 商城();
    // 地图等级奖励();

    野怪();
    核心部件();
    深度海域怪();
    深海奇珍物品();
    // 深度海域存档();
    // 兑换初始属性存档();
    // 历史中的战舰碎片();
    属性面板ui显示();

    // 神话权柄累计解锁();
    // 平台论坛点赞相关奖励();
    污染的航海器();
    附魔物品();
}