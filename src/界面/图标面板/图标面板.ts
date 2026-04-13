import {Frame} from "@/frame"
import InputUtil from "@/InputUtil";
import KeyCode from "@/KeyCode";
import BaseUtil from "@/BaseUtil";
import ActorTypeUtil from "@/actor/util/ActorTypeUtil";
import UnitUtil from "@/UnitUtil";
import PlayerUtil from "@/PlayerUtil";
import Actor from "@/Actor";
import ActorBuffUtil from "@/ActorBuffUtil";
import FramePoint from "@/FramePoint";
import ActorFrameUtil from "@/ActorFrameUtil";

DzLoadToc('UI\\ui_icon_toc.toc')


/**
 * 对图标面板的图标数据进行显示
 */
export default class 图标面板 {//存档界面

    static data: {
        /**分类目录信息*/
        name: string,
        /**分类目录包含的子项列表*/
        items: (Actor | AppActorType)[]
    }[] = [];

    /** 主英雄的演员 在图标面板中显示 */
    static showActorClasss = ["吞噬", "宝物"]
    /** 所有注册的演员类型 在图标面板中显示 */
    static uiShowTypes = ["图标面板", "通用图标面板", "存档商城", "羁绊"]
    static UICdYsbl: {//基础设置
        UITexture1: string,
        UITexture2: string,
        UITexture3: string,
        UITexture4: string,
        UIcdanys1: string,
        UIcdanys2: string,
        UI_cdl_bk: string,
        UI_cdl_bl: string,
        UI_yyk_tb: string,
        UI_cdan_fdf: string,
        UI_cdts_fdf: string,
        UIdhl_tb0: string,
        UIdhl_tb1: string,
        Tips_xq_qz: string,
        fontStr: string,
        UIcdlls: number,
        UIcdlhs: number,
        UIdhls: number,
    } = {
        UITexture1: "ui_icon_pane_texture\\UI_cdk_1.tga",//大背景图片
        UITexture2: "ui_icon_pane_texture\\UI_cdk_2.tga",//右侧存档大背景
        UITexture3: "ui_icon_pane_texture\\UI_cdk_3.tga",//右侧存档栏背景
        UITexture4: "ui_icon_pane_texture\\ui_icon_blank.tga",//右侧存档换页栏背景
        UIcdanys1: "FBtn_Cd",//显示按钮样式
        UIcdanys2: "FBtndh_cd",//导航栏按钮样式
        UI_cdl_bk: "ReplaceableTextures\\CommandButtons\\BTNHumanArtilleryUpOne.blp",//存档栏边框图片
        UI_cdl_bl: "ui_icon_pane_texture\\ui_icon_blank.tga",//存档栏初始图片
        UI_yyk_tb: "ui_icon_pane_texture\\ui_icon_yytp.tga",//阴影框阴影图片
        UI_cdan_fdf: "UI_cdan",//存档道具按钮Fdf样式
        UI_cdts_fdf: "UI_cdBK",//存档道具提示Fdf样式
        UIdhl_tb0: "ui_icon_pane_texture\\UI_cdk_4.tga",//导航栏未选中图标-图片
        UIdhl_tb1: "ui_icon_pane_texture\\UI_cdk_5.tga",//导航栏选中图标-图片
        Tips_xq_qz: "|cffff9900需要：|r",//道具需求前缀
        fontStr: "fonts\\font.ttf",//道具需求前缀
        UIcdlls: 9,//存档位列数
        UIcdlhs: 6,//存档位行数
        UIdhls: 11,//导航栏最大数量
    }

    static UI_CDdz_XSAn_bt: number = 0//显示存档界面按钮
    static UI_CDdz_DKZxs_bt: boolean = false//存档界面是否显示
    static UI_CDdz_DKZ_ba: number[] = []//存档界面
    static UI_CDdz_dhn_ba: number[] = []//导航栏图标
    static UI_CDdz_yxhy_an//右下换页栏UI
    static UI_CDdz_cdl_ba_1: number[] = []//存档栏UI边框
    static UI_CDdz_cdl_ba_2: number[] = []//存档栏UI显示图片
    static UI_CDdz_cdl_ba_3: number[] = []//存档栏阴影框
    static UI_CDdz_cdl_text: number[] = []//存档栏道具名字显示text
    static UI_CDdz_tip: number[] = []//道具提示框tip-UI
    //===============================================
    static dzUI: { [key: string]: number } = {}
    private static dzCd_pageMax = 图标面板.UICdYsbl.UIcdlls * 图标面板.UICdYsbl.UIcdlhs//最大背包数
    private static dzCd_DhdqIdx = 0//导航栏当前选择btn
    private static dzCd_Dhys = 0//导航栏当前页数
    private static dzCd_DjdqIdx = 0//道具栏当前页数
    private static uiBoxLastCurr: number = 0//当前导航图片frame
    static UI_IconName: number = 0;


    public static NewUIName(): string {
        图标面板.UI_IconName++
        return "UIico" + I2S(图标面板.UI_IconName)
    }

    constructor() {
        图标面板.UIcdbtn()//存档显示按钮
        图标面板.UIcddjm()//存档界面创建
    }

    static refreshData() {
        图标面板.data = [];
        /** 主控英雄单位的演员数据 */
        let hero = selection();
        if (GetOwningPlayer(hero) != GetLocalPlayer() || !UnitUtil.isHero(hero)) {
            hero = PlayerUtil.getHero(GetLocalPlayer());
        }
        if (IsHandle(hero)) {
            ActorBuffUtil.forUnitActorBuffs(hero, (actor) => {
                if (!图标面板.showActorClasss.includes(actor.get("class"))) {
                    return
                }
                let directory = 图标面板.data.find(it => {
                    if (it.name == actor.get("class")) {
                        return it;
                    }
                });
                if (directory == null) {
                    directory = {
                        name: actor.get("class"),
                        items: []
                    }
                    图标面板.data.push(directory)
                }
                directory.items.push(actor);
            });
        }
        /** 演员类型 */
        ActorTypeUtil.forAllActorTypes(actorType => {
            if (!图标面板.uiShowTypes.includes(actorType.uiShowType)) {
                return
            }
            if (actorType.hide == true && actorType.uiEnable != true) {
                return;
            }
            let directory = 图标面板.data.find(it => {
                if (it.name == actorType.class) {
                    return it;
                }
            });
            if (directory == null) {
                directory = {
                    name: actorType.class,
                    items: []
                }
                图标面板.data.push(directory)
            }
            directory.items.push(actorType)
        });
    }


    static UIcdbtn() {//存档显示按钮
        图标面板.UI_CDdz_XSAn_bt = DzCreateFrameByTagName("GLUETEXTBUTTON", 图标面板.NewUIName(), DzGetGameUI(), 图标面板.UICdYsbl.UIcdanys1, 0)
        DzFrameSetPoint(图标面板.UI_CDdz_XSAn_bt, FramePoint.topLeft, DzGetGameUI(), FramePoint.topLeft, 0.046, -0.026)
        DzFrameSetSize(图标面板.UI_CDdz_XSAn_bt, 0.040, 0.040)
        DzFrameSetScriptByCode(图标面板.UI_CDdz_XSAn_bt, 1, () => {//鼠标点击
            图标面板.UI_CDdz_DKZxs_bt = !图标面板.UI_CDdz_DKZxs_bt
            DzFrameShow(图标面板.UI_CDdz_DKZ_ba[0], 图标面板.UI_CDdz_DKZxs_bt);
            if (图标面板.UI_CDdz_DKZxs_bt) {
                BaseUtil.runLater(0.01, () => {
                    图标面板.RefreshOne()//刷新导航栏和存档栏
                })
                se.emit("打开UI", 图标面板.name)
            }

        }, false)
        //
        InputUtil.onKeyPressed(KeyCode.VK_F4, () => {
            图标面板.UI_CDdz_DKZxs_bt = !图标面板.UI_CDdz_DKZxs_bt
            DzFrameShow(图标面板.UI_CDdz_DKZ_ba[0], 图标面板.UI_CDdz_DKZxs_bt);
            if (图标面板.UI_CDdz_DKZxs_bt) {
                BaseUtil.runLater(0.01, () => {
                    图标面板.RefreshOne()//刷新导航栏和存档栏
                })
                se.emit("打开UI", 图标面板.name)
            }
        });
        InputUtil.onKeyPressed(KeyCode.VK_ESCAPE, () => {
            图标面板.UI_CDdz_DKZxs_bt = false
            DzFrameShow(图标面板.UI_CDdz_DKZ_ba[0], 图标面板.UI_CDdz_DKZxs_bt);
        })
        se.on("打开UI", id => {
            if (id != 图标面板.name && 图标面板.UI_CDdz_DKZxs_bt) {//打开其他UI时关闭此UI
                图标面板.UI_CDdz_DKZxs_bt = false
                DzFrameShow(图标面板.UI_CDdz_DKZ_ba[0], 图标面板.UI_CDdz_DKZxs_bt);
            }
        });
        se.on("刷新图标面板", () => {
            图标面板.刷新图标数据();
        });

    }


    static UIcddjm() {//存档大界面
        let obj = 图标面板.UICdYsbl
        //存档界面主
        图标面板.UI_CDdz_DKZ_ba[0] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), DzGetGameUI(), "template", 0)
        DzFrameSetPoint(图标面板.UI_CDdz_DKZ_ba[0], FramePoint.topLeft, DzGetGameUI(), FramePoint.topLeft, 0.09, -0.06)
        DzFrameSetTexture(图标面板.UI_CDdz_DKZ_ba[0], obj.UITexture1, 0)
        DzFrameSetSize(图标面板.UI_CDdz_DKZ_ba[0], 0.485, 0.37)
        DzFrameShow(图标面板.UI_CDdz_DKZ_ba[0], 图标面板.UI_CDdz_DKZxs_bt);
        //左侧导航栏框
        图标面板.UI_CDdz_DKZ_ba[1] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), 图标面板.UI_CDdz_DKZ_ba[0], "template", 0)
        DzFrameSetPoint(图标面板.UI_CDdz_DKZ_ba[1], 3, 图标面板.UI_CDdz_DKZ_ba[0], 3, 0.005, 0)
        DzFrameSetTexture(图标面板.UI_CDdz_DKZ_ba[1], obj.UITexture1, 0)
        DzFrameSetSize(图标面板.UI_CDdz_DKZ_ba[1], 0.06, 0.36)
        //右侧大的背景框
        图标面板.UI_CDdz_DKZ_ba[4] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), 图标面板.UI_CDdz_DKZ_ba[0], "template", 0)
        DzFrameSetPoint(图标面板.UI_CDdz_DKZ_ba[4], FramePoint.topRight, 图标面板.UI_CDdz_DKZ_ba[0], FramePoint.topRight, -0.005, -0.005)
        DzFrameSetTexture(图标面板.UI_CDdz_DKZ_ba[4], obj.UITexture2, 0)
        DzFrameSetSize(图标面板.UI_CDdz_DKZ_ba[4], 0.41, 0.36)
        //右上侧存档栏
        图标面板.UI_CDdz_DKZ_ba[2] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), 图标面板.UI_CDdz_DKZ_ba[4], "template", 0)
        DzFrameSetPoint(图标面板.UI_CDdz_DKZ_ba[2], 2, 图标面板.UI_CDdz_DKZ_ba[4], 2, 0, 0)
        DzFrameSetTexture(图标面板.UI_CDdz_DKZ_ba[2], obj.UITexture3, 0)
        DzFrameSetSize(图标面板.UI_CDdz_DKZ_ba[2], 0.41, 0.33)
        //右下侧换页栏
        图标面板.UI_CDdz_DKZ_ba[3] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), 图标面板.UI_CDdz_DKZ_ba[2], "template", 0)
        DzFrameSetPoint(图标面板.UI_CDdz_DKZ_ba[3], 0, 图标面板.UI_CDdz_DKZ_ba[2], 6, 0, 0)
        DzFrameSetTexture(图标面板.UI_CDdz_DKZ_ba[3], obj.UITexture4, 0)
        DzFrameSetSize(图标面板.UI_CDdz_DKZ_ba[3], 0.41, 0.03)
        图标面板.ZC_cddhlan()//左侧导航栏按钮
        图标面板.ZC_cdyxcdl()//右上存档栏
        图标面板.ZC_cdyxhyl()//右下换页栏
        图标面板.ZC_cdcdtsk()//道具提示框tip
    }

    static ZC_cddhlan() {//左侧导航栏按钮
        let obj = 图标面板.UICdYsbl
        let kd = 0.06
        let gd = 0.30 / obj.UIdhls
        for (let index = 0; index < obj.UIdhls; index++) {
            //图标创建
            图标面板.UI_CDdz_dhn_ba[index] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), 图标面板.UI_CDdz_DKZ_ba[1], "template", 0)
            DzFrameSetPoint(图标面板.UI_CDdz_dhn_ba[index], 1, 图标面板.UI_CDdz_DKZ_ba[1], 1, 0, index * -gd)
            DzFrameSetTexture(图标面板.UI_CDdz_dhn_ba[index], obj.UIdhl_tb0, 0)
            DzFrameSetSize(图标面板.UI_CDdz_dhn_ba[index], kd, gd - 0.002)
            DzFrameShow(图标面板.UI_CDdz_dhn_ba[index], false)
        }
    }

    static ZC_cdyxhyl() {//右下换页栏
        //中部页显示
        图标面板.UI_CDdz_yxhy_an = DzCreateFrameByTagName("TEXT", 图标面板.NewUIName(), 图标面板.UI_CDdz_DKZ_ba[3], "template", 0)
        DzFrameSetPoint(图标面板.UI_CDdz_yxhy_an, 4, 图标面板.UI_CDdz_DKZ_ba[3], 4, 0, 0)
        DzFrameSetFont(图标面板.UI_CDdz_yxhy_an, 图标面板.UICdYsbl.fontStr, 0.014, 0)
        DzFrameSetText(图标面板.UI_CDdz_yxhy_an, "1/1")
    }

    static ZC_cdyxcdl() {//右上存档栏
        let obj = 图标面板.UICdYsbl
        let ui = 图标面板.UI_CDdz_DKZ_ba[2]
        let width = 0.040
        let heigh = 0.040
        for (let index = 0; index < 图标面板.dzCd_pageMax; index++) {
            let x = 0.01 + (index % obj.UIcdlls) * width * 1.1
            let y = -0.01 + R2I(index / obj.UIcdlls) * -heigh * 1.3
            //存档边框
            图标面板.UI_CDdz_cdl_ba_1[index] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), ui, "template", 0)
            DzFrameSetPoint(图标面板.UI_CDdz_cdl_ba_1[index], 0, ui, 0, x, y)
            DzFrameSetSize(图标面板.UI_CDdz_cdl_ba_1[index], width, heigh)
            DzFrameSetTexture(图标面板.UI_CDdz_cdl_ba_1[index], obj.UI_cdl_bk, 0)
            DzFrameShow(图标面板.UI_CDdz_cdl_ba_1[index], false)
            //存档图片
            图标面板.UI_CDdz_cdl_ba_2[index] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), 图标面板.UI_CDdz_cdl_ba_1[index], "template", 0)
            DzFrameSetPoint(图标面板.UI_CDdz_cdl_ba_2[index], 4, 图标面板.UI_CDdz_cdl_ba_1[index], 4, 0, 0)
            DzFrameSetTexture(图标面板.UI_CDdz_cdl_ba_2[index], obj.UI_cdl_bl, 0)
            DzFrameSetSize(图标面板.UI_CDdz_cdl_ba_2[index], width, heigh)
            //阴影框
            图标面板.UI_CDdz_cdl_ba_3[index] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), 图标面板.UI_CDdz_cdl_ba_1[index], "template", 0)
            DzFrameSetPoint(图标面板.UI_CDdz_cdl_ba_3[index], 4, 图标面板.UI_CDdz_cdl_ba_1[index], 4, 0, 0)
            DzFrameSetTexture(图标面板.UI_CDdz_cdl_ba_3[index], obj.UI_yyk_tb, 0)
            DzFrameSetSize(图标面板.UI_CDdz_cdl_ba_3[index], width, heigh)
            //UI下部提示txt
            图标面板.UI_CDdz_cdl_text[index] = DzCreateFrameByTagName("TEXT", 图标面板.NewUIName(), 图标面板.UI_CDdz_cdl_ba_2[index], "template", 0)
            DzFrameSetPoint(图标面板.UI_CDdz_cdl_text[index], 1, 图标面板.UI_CDdz_cdl_ba_2[index], 7, 0, -0.001)
            DzFrameSetFont(图标面板.UI_CDdz_cdl_text[index], 图标面板.UICdYsbl.fontStr, 0.008, 0)
            DzFrameSetText(图标面板.UI_CDdz_cdl_text[index], "")
        }
    }

    static ZC_cdcdtsk() {//道具提示框tip
        //提示边框
        图标面板.UI_CDdz_tip[0] = DzCreateFrameByTagName("BACKDROP", 图标面板.NewUIName(), DzGetGameUI(), 图标面板.UICdYsbl.UI_cdts_fdf, 0)
        //提示-名称
        图标面板.UI_CDdz_tip[1] = DzCreateFrameByTagName("TEXT", 图标面板.NewUIName(), 图标面板.UI_CDdz_tip[0], "template", 0)
        DzFrameSetSize(图标面板.UI_CDdz_tip[1], 0.16, 0.00)
        DzFrameSetFont(图标面板.UI_CDdz_tip[1], 图标面板.UICdYsbl.fontStr, 0.016, 0)
        //提示-需求
        图标面板.UI_CDdz_tip[2] = DzCreateFrameByTagName("TEXT", 图标面板.NewUIName(), 图标面板.UI_CDdz_tip[0], "template", 0)
        DzFrameSetSize(图标面板.UI_CDdz_tip[2], 0.16, 0.00)
        DzFrameSetFont(图标面板.UI_CDdz_tip[2], 图标面板.UICdYsbl.fontStr, 0.014, 0)
        //提示-说明
        图标面板.UI_CDdz_tip[3] = DzCreateFrameByTagName("TEXT", 图标面板.NewUIName(), 图标面板.UI_CDdz_tip[0], "template", 0)
        DzFrameSetSize(图标面板.UI_CDdz_tip[3], 0.16, 0.00)
        DzFrameSetFont(图标面板.UI_CDdz_tip[3], 图标面板.UICdYsbl.fontStr, 0.012, 0)
        //自适应
        DzFrameSetPoint(图标面板.UI_CDdz_tip[0], 0, 图标面板.UI_CDdz_tip[1], 0, -0.005, 0.006)
        DzFrameSetPoint(图标面板.UI_CDdz_tip[0], 8, 图标面板.UI_CDdz_tip[3], 8, 0.005, -0.005)
        DzFrameSetPoint(图标面板.UI_CDdz_tip[2], 0, 图标面板.UI_CDdz_tip[1], 6, 0, -0.002)
        DzFrameSetPoint(图标面板.UI_CDdz_tip[3], 0, 图标面板.UI_CDdz_tip[2], 6, 0, -0.002)
        DzFrameShow(图标面板.UI_CDdz_tip[0], false)
    }

    /**
     * 刷新导航frame和存档frame刷新
     */
    static RefreshOne(): void {
        图标面板.refreshData();//准备数据
        图标面板.Init_dhcj();//导航栏刷新
        图标面板.刷新图标数据();//道具栏刷新
        图标面板.Refresh_LeftNavPan();//导航栏换页
        图标面板.Refresh_RightDJPan();//道具栏换页
    }

    static Init_dhcj(): void {//导航栏刷新
        let obj = 图标面板.UICdYsbl
        for (let i = 0; i < obj.UIdhls; i++) {//创建导航栏frame
            let key = "fenLei:" + i;
            let frame = 图标面板.dzUI[key];
            if (frame == null || frame == 0) {
                let kd = 0.06
                let gd = 0.36 / obj.UIdhls
                let fontSize = 0.011
                frame = DzCreateFrameByTagName("TEXTBUTTON", 图标面板.NewUIName(), 图标面板.UI_CDdz_dhn_ba[i], obj.UIcdanys2, 0)
                DzFrameSetPoint(frame, 4, 图标面板.UI_CDdz_dhn_ba[i], 4, 0, 0)
                DzFrameSetSize(frame, kd, gd)
                DzFrameSetFont(frame, 图标面板.UICdYsbl.fontStr, fontSize, 0)
                Frame.fromHandle(frame).solarData.Zui = 图标面板.UI_CDdz_dhn_ba[i]//设置导航按钮对应的图片Frame
                图标面板.dzUI[key] = frame;
                //设置到左边分类列表力
                let fenLeiBTN = Frame.fromHandle(frame);
                let index = i;
                fenLeiBTN.setOnClick(() => {
                    let uiid = DzGetTriggerUIEventFrame()
                    DzFrameSetTexture(图标面板.uiBoxLastCurr, obj.UIdhl_tb0, 0)
                    图标面板.uiBoxLastCurr = Frame.fromHandle(uiid).solarData.Zui
                    DzFrameSetTexture(图标面板.uiBoxLastCurr, obj.UIdhl_tb1, 0)
                    图标面板.dzCd_DhdqIdx = index
                    图标面板.dzCd_DjdqIdx = 0
                    图标面板.Refresh2_1()
                });
                if (i == 0) {
                    图标面板.uiBoxLastCurr = 图标面板.UI_CDdz_dhn_ba[0]//初始图片
                    DzFrameSetTexture(图标面板.UI_CDdz_dhn_ba[0], obj.UIdhl_tb1, 0)
                }
            }
        }

        for (let in1 = 0; in1 < obj.UIdhls; in1++) {//先隐藏导航按钮
            let key = "fenLei:" + in1;
            let frame = 图标面板.dzUI[key];
            DzFrameShow(Frame.fromHandle(frame).solarData.Zui, false)//设置导航栏图片隐藏
        }
        //fenLeiIndex当前导航栏页数
        let startDjdqIdx = R2I(图标面板.dzCd_Dhys) * obj.UIdhls;
        // let startIndex = startDjdqIdx+obj.UIdhls;
        //刷新导航栏
        let index2 = startDjdqIdx
        for (let index1 = 0; index1 < obj.UIdhls && index1 < 图标面板.data.length - startDjdqIdx; index1++) {
            let fenLei = 图标面板.data[index2];
            let key = "fenLei:" + index1;
            let frame = 图标面板.dzUI[key];
            DzFrameSetText(frame, fenLei.name)//显示导航栏名字
            DzFrameShow(Frame.fromHandle(frame).solarData.Zui, true)//设置导航栏图片显示
            index2++
        }
    }

    static Refresh_DHXZ(fenLeiIndex: number): void {//导航栏选中
        let obj = 图标面板.UICdYsbl
        let key = "fenLei:" + fenLeiIndex;
        let uiid = 图标面板.dzUI[key];
        DzFrameSetTexture(图标面板.uiBoxLastCurr, obj.UIdhl_tb0, 0)
        图标面板.uiBoxLastCurr = Frame.fromHandle(uiid).solarData.Zui
        DzFrameSetTexture(图标面板.uiBoxLastCurr, obj.UIdhl_tb1, 0)
        图标面板.dzCd_DhdqIdx = fenLeiIndex//导航栏当前选中按钮
        图标面板.Refresh2_1()
    }

    static 刷新图标数据(): void {//道具栏刷新
        let obj = 图标面板.UICdYsbl
        for (let i = 0; i < 图标面板.dzCd_pageMax; i++) {//创建道具栏frame
            let key = "daoju:" + i;
            let frame = 图标面板.dzUI[key];
            if (frame == null || frame == 0) {
                let width = 0.040
                let heigh = 0.040
                frame = DzCreateFrameByTagName("TEXTBUTTON", 图标面板.NewUIName(), 图标面板.UI_CDdz_cdl_ba_1[i], obj.UI_cdan_fdf, 0)
                DzFrameSetPoint(frame, 4, 图标面板.UI_CDdz_cdl_ba_1[i], 4, 0, 0)
                DzFrameSetSize(frame, width, heigh)
                let index = i;
                图标面板.dzUI[key] = frame;
                //设置到左边分类列表力
                let fenLeiBTN = Frame.fromHandle(frame);
                fenLeiBTN.setOnClick(() => {
                    let xlz = index + 图标面板.dzCd_DjdqIdx * 图标面板.dzCd_pageMax//获取时第几个按钮
                    let dyzs = 图标面板.dzCd_DhdqIdx + 图标面板.dzCd_Dhys * obj.UIdhls//获取是第几个导航栏下的道具
                    let fenLei = 图标面板.data[dyzs];
                    let item = fenLei.items[xlz];
                    if (item instanceof Actor) {
                        (item as Actor).localClick(1, InputUtil.getMouseSceneX(), InputUtil.getMouseSceneY());
                    } else {
                        ActorFrameUtil.localClickActorType(item, 1, InputUtil.getMouseSceneX(), InputUtil.getMouseSceneY())
                    }
                });
                fenLeiBTN.addOnMouseRightUp(() => {
                    let xlz = index + 图标面板.dzCd_DjdqIdx * 图标面板.dzCd_pageMax//获取时第几个按钮
                    let dyzs = 图标面板.dzCd_DhdqIdx + 图标面板.dzCd_Dhys * obj.UIdhls//获取是第几个导航栏下的道具
                    let fenLei = 图标面板.data[dyzs];
                    let item = fenLei.items[xlz];
                    if (item instanceof Actor) {
                        (item as Actor).localClick(2, InputUtil.getMouseSceneX(), InputUtil.getMouseSceneY());
                    } else {
                        ActorFrameUtil.localClickActorType(item, 2, InputUtil.getMouseSceneX(), InputUtil.getMouseSceneY())
                    }
                });
                fenLeiBTN.setOnMouseEnter(() => {//鼠标进入
                    let xlz = index + 图标面板.dzCd_DjdqIdx * 图标面板.dzCd_pageMax//获取时第几个按钮
                    let uiid = DzGetTriggerUIEventFrame()//鼠标进入的frame
                    let dyzs = 图标面板.dzCd_DhdqIdx + 图标面板.dzCd_Dhys * obj.UIdhls//获取是第几个导航栏下的道具
                    let fenLei = 图标面板.data[dyzs];
                    let item = fenLei.items[xlz];
                    let name = item instanceof Actor ? item.getName() : item.name;
                    DzFrameSetText(图标面板.UI_CDdz_tip[1], name)//道具名称
                    if ((item instanceof Actor ? item.get("uiEnable", true) : item.uiEnable) == true) {
                        DzFrameSetText(图标面板.UI_CDdz_tip[2], "")//道具需求
                    } else {
                        let requiredTip = item instanceof Actor ? item.get("requiredTip") : item.requiredTip;
                        DzFrameSetText(图标面板.UI_CDdz_tip[2], 图标面板.UICdYsbl.Tips_xq_qz + tostring(requiredTip || name))//道具需求
                    }
                    let describe = item instanceof Actor ? item.getDescribe(true) : item.describe;
                    DzFrameSetText(图标面板.UI_CDdz_tip[3], describe)//道具说明

                    DzFrameSetPoint(图标面板.UI_CDdz_tip[1], 3, uiid, 5, 0.005, -0.005)
                    DzFrameShow(图标面板.UI_CDdz_tip[0], true)
                })
                fenLeiBTN.setOnMouseLeave(() => {//鼠标离开
                    DzFrameShow(图标面板.UI_CDdz_tip[0], false)
                })

            }

        }
        图标面板.Refresh2_1()

    }

    private static Refresh2_1(): void {//刷新界面
        let obj = 图标面板.UICdYsbl
        let dqs = 图标面板.dzCd_DhdqIdx + 图标面板.dzCd_Dhys * obj.UIdhls
        let fenLei = 图标面板.data[dqs];
        if (!fenLei) {
            return
        }
        let startIndex = fenLei.items.length - 图标面板.dzCd_DjdqIdx * 图标面板.dzCd_pageMax//
        for (let index = 0; index < 图标面板.dzCd_pageMax; index++) {//先全部隐藏图标frame
            DzFrameShow(图标面板.UI_CDdz_cdl_ba_1[index], false)//隐藏图片边框
            DzFrameSetAlpha(图标面板.UI_CDdz_cdl_ba_2[index], 1)//修改图片透明度
            DzFrameSetAlpha(图标面板.UI_CDdz_cdl_ba_3[index], 1)//修改阴影图片透明度
            DzFrameSetAlpha(图标面板.UI_CDdz_cdl_text[index], 200)//修改道具Name透明度
        }
        let SFindex = 图标面板.dzCd_DjdqIdx * 图标面板.dzCd_pageMax
        for (let i = 0; i < startIndex && i < 图标面板.dzCd_pageMax; i++) {
            let item = fenLei.items[SFindex];
            DzFrameShow(图标面板.UI_CDdz_cdl_ba_1[i], true)//隐藏图片边框
            let icon = item instanceof Actor ? item.getIcon() : item.icon;
            DzFrameSetTexture(图标面板.UI_CDdz_cdl_ba_2[i], icon, 0)//修改图片图标
            let name = item instanceof Actor ? item.getName() : item.name;

            if (name && name.length > 21) {
                let sName = string.sub(name, 0, 18) + "..."
                DzFrameSetText(图标面板.UI_CDdz_cdl_text[i], sName)//修改名称显示
            } else {
                DzFrameSetText(图标面板.UI_CDdz_cdl_text[i], name)//修改名称显示
            }
            let uiEnable = item instanceof Actor ? item.get("uiEnable", true) : item.uiEnable;
            if (uiEnable == true) {//显示激活
                DzFrameSetAlpha(图标面板.UI_CDdz_cdl_ba_2[i], 255)
                DzFrameSetAlpha(图标面板.UI_CDdz_cdl_ba_3[i], 1)
                DzFrameSetAlpha(图标面板.UI_CDdz_cdl_text[i], 255)
            } else {
                DzFrameSetAlpha(图标面板.UI_CDdz_cdl_ba_2[i], 200)
                DzFrameSetAlpha(图标面板.UI_CDdz_cdl_ba_3[i], 155)
                DzFrameSetAlpha(图标面板.UI_CDdz_cdl_text[i], 230)
            }
            SFindex++
        }
        DzFrameSetText(图标面板.UI_CDdz_yxhy_an, I2S(图标面板.dzCd_DjdqIdx + 1) + "/" + Math.ceil(fenLei.items.length / 图标面板.dzCd_pageMax))//页数显示

    }

    static Refresh_LeftNavPan(): void {//导航换页
        let obj = 图标面板.UICdYsbl
        for (let i = 0; i < 2; i++) {
            let key = "fenLeiHY:" + i;
            let frame = 图标面板.dzUI[key];
            if (frame == null || frame == 0) {
                frame = DzCreateFrameByTagName("GLUETEXTBUTTON", 图标面板.NewUIName(), 图标面板.UI_CDdz_DKZ_ba[1], "CDbtn_dhhy_" + i, 0)
                图标面板.dzUI[key] = frame;
                let fenLeiHYBTN = Frame.fromHandle(frame);
                let index = i
                fenLeiHYBTN.setOnClick(() => {//上换页按钮
                    if (图标面板.data.length > obj.UIdhls) {
                        if (index == 0) {
                            if (图标面板.dzCd_Dhys < R2I(图标面板.data.length / obj.UIdhls)) {
                                图标面板.dzCd_Dhys++
                            } else {
                                图标面板.dzCd_Dhys = 0
                            }
                        }
                        if (index == 1) {
                            if (图标面板.dzCd_Dhys < 1) {
                                图标面板.dzCd_Dhys = R2I(图标面板.data.length / obj.UIdhls)
                            } else {
                                图标面板.dzCd_Dhys--
                            }
                        }
                        图标面板.dzCd_DjdqIdx = 0
                        图标面板.Init_dhcj();
                        图标面板.Refresh_DHXZ(0);
                    }
                });
                DzFrameSetPoint(frame, 7, 图标面板.UI_CDdz_DKZ_ba[1], 7, 0, i * 0.021)
                DzFrameSetSize(frame, 0.06, 0.02)
            }
        }
    }

    static Refresh_RightDJPan(): void {//道具栏换页
        let obj = 图标面板.UICdYsbl
        for (let i = 0; i < 2; i++) {
            let key = "daojuHY:" + i;
            let frame = 图标面板.dzUI[key];
            if (frame == null || frame == 0) {
                frame = DzCreateFrameByTagName("TEXTBUTTON", 图标面板.NewUIName(), 图标面板.UI_CDdz_DKZ_ba[3], "CDbtn_hy_" + i, 0)
                DzFrameSetPoint(frame, 4, 图标面板.UI_CDdz_DKZ_ba[3], 4, -0.024 + i * 0.048, 0.0)
                DzFrameSetSize(frame, 0.02, 0.02)
                图标面板.dzUI[key] = frame;
                let daojuHYBTN = Frame.fromHandle(frame);
                let index_zsz = i
                daojuHYBTN.setOnClick(() => {
                    let dataDirectory = 图标面板.data[图标面板.dzCd_DhdqIdx + 图标面板.dzCd_Dhys * obj.UIdhls]
                    if (!dataDirectory) {
                        return
                    }
                    let djs = dataDirectory.items.length
                    if (djs > 图标面板.dzCd_pageMax) {//判断道具数是否大于道具格子
                        if (index_zsz == 0) {
                            if (图标面板.dzCd_DjdqIdx < 1) {
                                图标面板.dzCd_DjdqIdx = 0
                            } else {
                                图标面板.dzCd_DjdqIdx--
                            }
                        }
                        if (index_zsz == 1) {
                            if (图标面板.dzCd_DjdqIdx < R2I(djs / 图标面板.dzCd_pageMax)) {
                                图标面板.dzCd_DjdqIdx++
                            } else {
                                图标面板.dzCd_DjdqIdx = R2I(djs / 图标面板.dzCd_pageMax)
                            }
                        }
                        图标面板.Refresh2_1()
                    }
                });
            }
        }
    }

}

