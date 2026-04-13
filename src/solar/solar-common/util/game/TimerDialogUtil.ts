import BaseUtil from "@/BaseUtil";

export default class TimerDialogUtil {

    private static _sl_cache: { [hid: string]: timerdialog } = {};

    /**
     * 倒计时 计时器窗口
     * @param title
     * @param timeout
     * @param periodic 目前只能传false
     */
    static show(title: string, timeout: number, periodic: boolean = false): timerdialog {
        let timer = CreateTimer();
        let timerDialog = CreateTimerDialog(timer);
        TimerDialogSetTitle(timerDialog, title)
        TimerDialogDisplay(timerDialog, true);
        TimerDialogUtil._sl_cache["_t" + GetHandleId(timer)] = timerDialog
        TimerStart(timer, timeout, periodic, null);
        BaseUtil.runLater(timeout, () => {
            DestroyTimerDialog(timerDialog);
            DestroyTimer(timer)
        })
        return timerDialog;
    }


}