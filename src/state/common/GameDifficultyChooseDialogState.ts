//#sl-final
import {DialogButton} from '@/dialog';
import BaseUtil from "@/BaseUtil";
import GameUtil from "@/GameUtil";
import DialogUtil from "@/DialogUtil";
import MapModel from "../../MapModel";
import ArchiveUtil from "@/ArchiveUtil";
import PlayerUtil from "@/PlayerUtil";
import PlatUtil from "@/PlatUtil";
import 达尔文进化基础刷怪 from "../刷怪系统/达尔文进化基础刷怪";

export default class GameDifficultyChooseDialogState {

    static config: {
        hasEndlessMode: boolean,
        AddPlayerTechId?: string
        chooseTimerLimit: number
    } = {
        hasEndlessMode: false,
        chooseTimerLimit: 30
    }


    constructor() {
        let ms: string[] = [MapModel.模式1_普通模式]
        if (PlatUtil.getStoreInt(PlayerUtil.firstOfUsers(), "znjifen") > 8 || isDebug) {
            ms.push(MapModel.模式2_寄生模式)
        }
        if (PlatUtil.getStoreInt(PlayerUtil.firstOfUsers(), "znjifen") > 18 || isDebug) {
            ms.push(MapModel.模式3_献祭模式)
        }
        if (PlatUtil.getStoreInt(PlayerUtil.firstOfUsers(), "znjifen") > 28 || isDebug) {
            ms.push(MapModel.模式4_真实难度)
        }
        ms.push(MapModel.模式0_教学模式)
        DialogUtil.showWithTimeLimit(0, "选择模式", 20, (id, str) => {
            settings.gameMode = str;
            if (id > 1) {
                gv.bossAbilityLimit = 9;
            }
            GameDifficultyChooseDialogState.action()
        }, ...ms)
        //, MapModel.模式3_献祭模式


    }

    static action(this: void) {

        let dialog = DialogCreate();
        DialogSetMessage(dialog, "难度选择");
        let tl = BaseUtil.onTimer(1, c => {
            if (c > GameDifficultyChooseDialogState.config.chooseTimerLimit) {
                GameUtil.defeats("未在指定时间选择难度!")
                return false;
            }
            DialogSetMessage(dialog, "难度选择 （|cffff0000剩余" + (30 - c) + "|r）");
            return true;
        });
        se.on("选择难度", l => {
            tl.destroy();
        })
        for (let i = 1; i <= 9; i++) {
            let button = DialogAddButton(dialog, "难度" + i + "", 0);
            DialogButton.fromHandle(button).solarData.GameDifficulty = i
            DialogButton.fromHandle(button).solarData.isEndlessMode = false
            if (ArchiveUtil.get(PlayerUtil.firstOfUsers(), "n" + i) == null && isDebug == false) {
                break;
            }
        }
        if (GameDifficultyChooseDialogState.config.hasEndlessMode) {
            let button = DialogAddButton(dialog, "无尽模式", 0);
            DialogButton.fromHandle(button).solarData.GameDifficulty = 4
            DialogButton.fromHandle(button).solarData.isEndlessMode = true
        }
        DialogDisplay(Player(0), dialog, true);
        // onclick Trigger
        let ydl_trigger = CreateTrigger();
        TriggerRegisterDialogEvent(ydl_trigger, dialog);
        TriggerAddAction(ydl_trigger, GameDifficultyChooseDialogState.on_dialog_click);

    }


    /*
     */
    static valueCoefficients = [1, 1.5, 2.5, 4, 6, 10, 20, 40, 80];

    static on_dialog_click(this: void): void {
        let button = GetClickedButton();
        let gameDifficultyTemp = DialogButton.fromHandle(button).solarData.GameDifficulty
        let isEndlessModeTemp: boolean = DialogButton.fromHandle(button).solarData.isEndlessMode
        if (gameDifficultyTemp) {
            settings.gameDifficulty = gameDifficultyTemp;
            settings.valueCoefficient = GameDifficultyChooseDialogState.valueCoefficients[gameDifficultyTemp - 1];
            if (settings.gameDifficulty > 4) {
                达尔文进化基础刷怪.config.creeper_max = 600;
            }
            if (settings.gameMode == MapModel.模式2_寄生模式) {
                达尔文进化基础刷怪.config.creeper_max = 700;
                settings.valueCoefficient = GameDifficultyChooseDialogState.valueCoefficients[8];
                settings.valueCoefficient = math.floor(settings.valueCoefficient * (1.2 ** settings.gameDifficulty));
            } else if (settings.gameMode == MapModel.模式3_献祭模式) {
                达尔文进化基础刷怪.config.creeper_max = 800;
                settings.valueCoefficient = GameDifficultyChooseDialogState.valueCoefficients[8];
                settings.valueCoefficient = math.floor(settings.valueCoefficient * (1.3 ** (settings.gameDifficulty + 9)));
            } else if (settings.gameMode == MapModel.模式4_真实难度) {
                达尔文进化基础刷怪.config.creeper_max = 800;
                settings.valueCoefficient = GameDifficultyChooseDialogState.valueCoefficients[8];
                settings.valueCoefficient = math.floor(settings.valueCoefficient * (1.4 ** (settings.gameDifficulty + 18)));
            } else if (settings.gameMode == MapModel.模式0_教学模式) {
                达尔文进化基础刷怪.config.creeper_min = 10;
                达尔文进化基础刷怪.config.creeper_max = 50;
                达尔文进化基础刷怪.config.create_creeper_pers = 1;
                settings.valueCoefficient = 1;
                BaseUtil.runLater(60 * 60 * 7, () => {
                    GameUtil.defeats();
                    EndGame(true);
                });
                PlayerUtil.message("|cffff0000你选择了教学模式：此模式用于上手学习此游戏各游戏玩法和机制，不会掉落存档！", 30)
            }
            print("难度系数=" + settings.valueCoefficient)
            se.emit("选择难度", settings.gameDifficulty)
        }
        if (isEndlessModeTemp) {
            settings.isEndlessMode = isEndlessModeTemp;
        }
        DisplayTimedTextToForce(GetPlayersAll(), 15.00, "|CFFFF0000选择的难度 ： 难度" + settings.gameDifficulty);

        if (GameDifficultyChooseDialogState.config.AddPlayerTechId && GameDifficultyChooseDialogState.config.AddPlayerTechId.length > 3) {
            let techLv = settings.gameDifficulty - 1
            techLv = techLv * techLv
            AddPlayerTechResearched(Player(11), FourCC(GameDifficultyChooseDialogState.config.AddPlayerTechId), techLv);
            AddPlayerTechResearched(Player(12), FourCC(GameDifficultyChooseDialogState.config.AddPlayerTechId), techLv);
        }

        if (gv.bossAbilityLimit <= 1) {
            gv.bossAbilityLimit = Math.ceil(settings.gameDifficulty / 3)
        }
    }


}