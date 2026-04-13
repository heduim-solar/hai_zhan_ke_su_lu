import * as React from "@/tsx";
import {Easing, Tween} from "@/lib/tween";
import SyncUtil from '@/SyncUtil';
import {Frame} from '@/frame';

let bgRef = {
    current: 0 //这个属性用来保存tsx创建的Frame的引用
};
let kaiGuan = {
    current: 0 //这个属性用来保存tsx创建的Frame的引用
};

function App() {
    let child = [];
    for (let i = 1; i < 5; i++) {
        for (let j = 1; j < 4; j++) {
            let name = "[" + i + "," + j + "]"
            let ref = {current: 0}
            let x = 0.06 * i;
            let y = 0.06 * j;
            const coords = {x, y}
            const tween = new Tween({x, y, a: 255}) // 创建一个新的tween，修改“coords”。
                .to({x: 0, y: 0, a: 0}, 500) //在500毫秒内移动到（300,200）。
                .easing(Easing.Quadratic.Out) // 使用缓和功能使动画平滑。
                .onUpdate((temp) => {
                    DzFrameSetAlpha(ref.current, temp.a)
                    DzFrameSetPoint(ref.current, FRAMEPOINT_BOTTOMLEFT, bgRef.current, FRAMEPOINT_BOTTOMLEFT, temp.x, temp.y)
                });
            const tween2 = new Tween({x: 0, y: 0, a: 0}) // 创建一个新的tween，修改“coords”。
                .to({x, y, a: 255}, 500) //在500毫秒内移动到（300,200）。
                .easing(Easing.Quadratic.In) // 使用缓和功能使动画平滑。
                .onUpdate((temp) => {
                    DzFrameSetAlpha(ref.current, temp.a)
                    DzFrameSetPoint(ref.current, FRAMEPOINT_BOTTOMLEFT, bgRef.current, FRAMEPOINT_BOTTOMLEFT, temp.x, temp.y)
                });
            //tween执行完就执行tween2
            tween.chain(tween2);


            child.push(<text
                background-image="ReplaceableTextures\Selection\SelectionCircleSmall.blp"
                position={coords}
                textAlignment={2}
                text={name}
                ref={ref}
                onClick={() => {
                    tween.start()
                    DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0,
                        60, '来自React tsx代码的onClick事件child=' + name)
                }}
            />)
        }
    }

    child.push(<gluetextbutton
        background-image="ReplaceableTextures\Selection\SelectionCircleSmall.blp"
        position={{x: 0.06 * 5, y: 0.06 * 4}}
        text="显示开关"
        showRefOnClick={kaiGuan}
        onMouseEnter={() => DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0,
            60, '鼠标进来了')}
    />)

    //onSyncData 可拿到同步的地方去
    // SyncUtil.onSyncData("gui_test", p => {
    //     DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0,
    //         20, '接收到数据同步！触发的玩家为:' + GetPlayerName(p))
    // })
    child.push(<gluetextbutton
        background-image="ReplaceableTextures\Selection\SelectionCircleSmall.blp"
        position={{x: 0.06 * 5, y: 0.06 * 3}}
        text="同步数据"
        onClick={() => {
            SyncUtil.syncData("gui_test")
        }}
    />)

    // //注意要同步创建此frame 才能使用同步方法
    // child.push(<gluetextbutton
    //     background-image="ReplaceableTextures\Selection\SelectionCircleSmall.blp"
    //     position={{x: 0.06 * 5, y: 0.06 * 2}}
    //     text="同步事件"
    //     onClickSync={() => {
    //         DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0,
    //             20, '按钮被点击！触发的玩家为:' + GetPlayerName(DzGetTriggerUIEventPlayer()))
    //     }}
    // />)


    return (<backdrop
        position={{x: 0.3, y: 0.2}}
        size={{width: 0.4, height: 0.3}}
        texture="ReplaceableTextures\CommandButtons\BTNSelectHeroOn.blp"
        ref={bgRef}>
        {child}
        <button
            inherits="ScoreScreenTabButtonTemplate"
            position={{x: 0.4, y: 0.3}}
            size={{width: 0.08, height: 0.08}}
            visible={false}
            hideParentOnClick={true}
            ref={kaiGuan}>
            <backdrop
                position="parent"
                texture="ReplaceableTextures\CommandButtons\BTNSelectHeroOn.blp"
            />
        </button>
    </backdrop>)
};

export default class Gui {
    constructor() {

        React.render(<App/>, DzGetGameUI());
        DisplayTimedTextToPlayer(GetLocalPlayer(), 0, 0,
            60, '按钮的Frame=' + bgRef.current)
        print("按钮的Frame=" + bgRef.current)
        let frameGui = new Frame(bgRef.current);
        frameGui.setScale(1.2)
    }
}