import * as React from "@/w3ts/tsx";
import {Frame} from "@/frame";
import TextUtil from "@/TextUtil";
import AttributeUtil from "@/AttributeUtil";
import SelectUtil from "@/SelectUtil";


type PropertyFrameDic = {
    bd_back: Frame,
    txt_property1: Frame,
    txt_property2: Frame,
}
type PropertyKeyInfo = {
    key: keyof AppAttribute,
    Name: string,
    showPercentage?: boolean,
    childKey?: string,
    add_show_num?: number,
}

DzLoadToc('UI\\UiProperty.toc')
export default class UiProperty {

    static config: PropertyKeyInfo[] = [];

    root = new Frame();
    background = new Frame();
    btn_switch = new Frame();

    //  每一行属性
    private _frameDics: PropertyFrameDic[] = [];

    constructor(container = DzGetGameUI()) {
        React.render(this.render(), container);

        // //	注册显示游戏菜单事件
        // EventUtil.on("EVENT_SHOW_UI", () => {
        //     this.btn_switch.setVisible(true);
        // });
        // //  注册玩家属性变化事件
        // EventUtil.on("EVENT_UNIT_CUSTOM_STATE_CHANGED", (whichUnit: unit) => {
        //     if (!this.background.visible) return;
        //     this.updateUIWithUnitPropertyChanged(whichUnit);
        // })


        //  注册Tab键事件
        DzTriggerRegisterKeyEventByCode(null, 9, 1, false, () => {
            this.onClick();
        });


        // //  注册计时器事件
        // let trigger = new Trigger();
        // trigger.registerTimerEvent(1.0, true);
        // trigger.addAction(() => {
        //     let hero: unit = SelectUtil.getAnHero(GetPlayerId(GetLocalPlayer()));
        //     this.updateUIWithUnitPropertyChanged(hero);
        // });
    }

    onClick() {
        let triggerPlayer: player = DzGetTriggerKeyPlayer();
        if (GetLocalPlayer() == triggerPlayer) {
            this.background.setVisible(!this.background.visible);
            let hero: unit = SelectUtil.getAnHero(GetPlayerId(GetLocalPlayer()));
            this.updateUIWithUnitPropertyChanged(hero);
        }
    }

    /**
     * @brief 随着玩家属性的改变而刷新UI
     * @param whichUnit
     * @returns
     */
    public updateUIWithUnitPropertyChanged(whichUnit: unit) {

        //  检测是不是英雄单位
        if (!IsHandle(whichUnit) || !IsHeroUnitId(GetUnitTypeId(whichUnit))) return;

        //  检测是不是本地玩家
        if (GetLocalPlayer() != GetOwningPlayer(whichUnit)) return;

        //  刷新UI
        let count: number = Math.ceil(UiProperty.config.length / 2.0);
        for (let index: number = 0; index < count; index++) {
            let cfData1 = UiProperty.config[2 * index];
            // print("key="+cfData1.Name)
            // print("key1="+cfData1.key)
            let cfData2 = UiProperty.config[2 * index + 1];
            // print("key2="+cfData2.Name)
            let frameDic = this._frameDics[index];
            UiProperty.updatePropertyUI(whichUnit, frameDic.txt_property1, cfData1);
            UiProperty.updatePropertyUI(whichUnit, frameDic.txt_property2, cfData2);
        }
    }

    public static updatePropertyUI(whichUnit: unit, textFrame: Frame, data: PropertyKeyInfo) {
        if (!data) {
            textFrame.setText("");
            return;
        }
        let text: string = '';
        let unitProperty = AttributeUtil.getUnitAttribute(whichUnit)?.[data.key] as any;
        let propertyValue: number;
        if (data.childKey) {
            let property = unitProperty || {};
            propertyValue = property[data.childKey] || 0;
        } else {
            propertyValue = unitProperty || 0;
        }
        if (data.add_show_num) {
            propertyValue = propertyValue + data.add_show_num;
        }
        if (data.showPercentage) {
            text = '|CFF00FF80' + TextUtil.toPercentage(propertyValue, 0);
        } else {
            text = '|CFF00FF80' + propertyValue;
        }
        //addons 技能急速
        if (data.key == "ability_speed") {
            //计算 冷却缩减 =  技能急速 / (1+技能急速)
            // print("propertyValue=" + propertyValue)
            let cool_p = propertyValue / (100 + propertyValue);
            // print("cool_p=" + cool_p)
            text = text + " | " + TextUtil.toPercentage(cool_p, 2);
        }
        //addons 技能急速
        if (data.key == "damage_reduction") {
            //计算 冷却缩减 =  技能急速 / (1+技能急速)
            let drul = AttributeUtil.getUnitAttribute(whichUnit)?.damage_reduction_upper_limit
            if (drul) {
                text = text + " | " + TextUtil.toPercentage(drul as number);
            }
        }


        textFrame.setText(text);
    }

    render() {
        let items = this.getItems();
        return (<div
            size={{width: 0.001, height: 0.001}}
            visible={true}
            ref={this.root}>
            <backdrop
                id="bd_property"
                inherits="Backdrop"
                position={{x: 0.26, y: 0.168}}
                size={{width: 0.24, height: 0.37}}
                visible={false}
                ref={this.background}
                texture={"Property\\bg_property.tga"}
            >
                {items}
            </backdrop>
            <button
                id="btn_switch"
                inherits="Button"
                position={{x: 0.005, y: 0.480}}
                size={{width: 0.03, height: 0.04}}
                visible={false}
                ref={this.btn_switch}
                background-image={"menu\\anniu15.tga"}
                onClick={() => this.onClick()}
            >
            </button>
        </div>);
    }

    getItems() {
        let items = [];

        let count: number = Math.ceil(UiProperty.config.length / 2.0);

        for (let index: number = 0; index < count; index++) {
            let x: number = 0.0065;
            let y: number = 0.33 - index * 0.0160;
            let texture: string = (1 == (index & 1)) ? 'Property\\property2.tga' : 'Property\\property1.tga';
            let text1: string = UiProperty.config[2 * index] ? UiProperty.config[2 * index].Name : '';
            let text2: string = UiProperty.config[2 * index + 1] ? UiProperty.config[2 * index + 1].Name : '';
            let frameDic: PropertyFrameDic = {
                bd_back: new Frame(),
                txt_property1: new Frame(),
                txt_property2: new Frame(),
            }
            items.push(<backdrop
                id="bd_item_back"
                inherits="Backdrop"
                position={{x: x, y: y}}
                size={{width: 0.24, height: 0.0120}}
                visible={true}
                texture={texture}
                ref={frameDic.bd_back}
            >
                <text
                    position={{
                        point: FRAMEPOINT_LEFT,
                        relative: 'parent',
                        relativePoint: FRAMEPOINT_LEFT,
                        x: 0,
                        y: 0.0000,
                    }}
                    size={{width: 0.1384, height: 0.00}}
                    text={text1}
                    textAlignment={TEXTALIGN_LEFT}
                    textColor={0xFF8000}
                    font={{fileName: "ZITI.TTF", height: 0.008, flags: 0}}
                >
                </text>
                <text
                    position={{
                        point: FRAMEPOINT_LEFT,
                        relative: 'parent',
                        relativePoint: FRAMEPOINT_LEFT,
                        x: 0.08,
                        y: 0.0000,
                    }}
                    size={{width: 0.1384, height: 0.00}}
                    ref={frameDic.txt_property1}
                    textAlignment={TEXTALIGN_LEFT}
                    textColor={0xFF8000}
                    font={{fileName: "ZITI.TTF", height: 0.008, flags: 0}}
                >
                </text>
                <text
                    position={{
                        point: FRAMEPOINT_LEFT,
                        relative: 'parent',
                        relativePoint: FRAMEPOINT_LEFT,
                        x: 0.12,
                        y: 0.0000,
                    }}
                    size={{width: 0.1384, height: 0.00}}
                    text={text2}
                    textAlignment={TEXTALIGN_LEFT}
                    textColor={0xFF8000}
                    font={{fileName: "ZITI.TTF", height: 0.008, flags: 0}}
                >
                </text>
                <text
                    position={{
                        point: FRAMEPOINT_LEFT,
                        relative: 'parent',
                        relativePoint: FRAMEPOINT_LEFT,
                        x: 0.2,
                        y: 0.0000,
                    }}
                    size={{width: 0.1384, height: 0.00}}
                    ref={frameDic.txt_property2}
                    textAlignment={TEXTALIGN_LEFT}
                    textColor={0xFF8000}
                    font={{fileName: "ZITI.TTF", height: 0.008, flags: 0}}
                >
                </text>
            </backdrop>)
            this._frameDics.push(frameDic);
        }

        return items;
    }
}