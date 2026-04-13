import DataBase from "@/common/DataBase";
import BaseUtil from "@/BaseUtil";

export default class DialogUtil {


    /**
     *
     * @param playerId 显示对话框的玩家
     * @param title 对话框标题
     * @param onClickButtonCallBack 点击对话框里的按钮时的回调
     * @param buttonTexts 按钮文字列表[]
     */
    static show(playerId: number, title: string, onClickButtonCallBack: (index: number, text: string) => void, ...buttonTexts: string[]): dialog {
        let dialog = DialogCreate();
        DialogSetMessage(dialog, title);
        for (let i = 0; i < buttonTexts.length; i++) {
            let buttonText = buttonTexts[i];
            let button = DialogAddButton(dialog, buttonText, 0);
            let solarData = DataBase.getDialogButtonSolarData(button);
            solarData._sl_index = i;
            solarData._sl_text = buttonText;
        }
        //

        DialogDisplay(Player(playerId), dialog, true);
        // onclick Trigger
        let trigger = CreateTrigger();
        TriggerRegisterDialogEvent(trigger, dialog);
        TriggerAddAction(trigger, () => {
            let button = GetClickedButton();
            let solarData = DataBase.getDialogButtonSolarData(button);
            onClickButtonCallBack(solarData._sl_index, solarData._sl_text)
        });
        return dialog;

    }

    /**
     *
     * @param playerId 显示对话框的玩家
     * @param title 对话框标题
     * @param lifeTime 最大点击时间限制 超过这个时间则默认选择第一个
     * @param onClickButtonCallBack 点击对话框里的按钮时的回调
     * @param buttonTexts 按钮文字列表[]
     */
    static showWithTimeLimit(playerId: number, title: string, lifeTime: number, onClickButtonCallBack: (index: number, text: string) => void, ...buttonTexts: string[]): dialog {
        let dialog = DialogCreate();
        DialogSetMessage(dialog, title);
        let tl = BaseUtil.onTimer(1, c => {
            if (c > lifeTime) {
                onClickButtonCallBack(0, buttonTexts[0])
                return false;
            }
            DialogSetMessage(dialog, title + " （|cffff0000剩余" + (lifeTime - c) + "|r）");
            return true;
        });
        for (let i = 0; i < buttonTexts.length; i++) {
            let buttonText = buttonTexts[i];
            let button = DialogAddButton(dialog, buttonText, 0);
            let solarData = DataBase.getDialogButtonSolarData(button);
            solarData._sl_index = i;
            solarData._sl_text = buttonText;
        }
        //

        DialogDisplay(Player(playerId), dialog, true);
        // onclick Trigger
        let trigger = CreateTrigger();
        TriggerRegisterDialogEvent(trigger, dialog);
        TriggerAddAction(trigger, () => {
            let button = GetClickedButton();
            let solarData = DataBase.getDialogButtonSolarData(button);
            tl.destroy();
            onClickButtonCallBack(solarData._sl_index, solarData._sl_text)
        });
        return dialog;


    }

}