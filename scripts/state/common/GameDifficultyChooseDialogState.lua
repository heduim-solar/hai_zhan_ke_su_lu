local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 12,["25"] = 12,["26"] = 12,["28"] = 25,["29"] = 26,["30"] = 26,["31"] = 26,["32"] = 26,["33"] = 27,["35"] = 29,["36"] = 29,["37"] = 29,["38"] = 29,["39"] = 30,["41"] = 32,["42"] = 32,["43"] = 32,["44"] = 32,["45"] = 33,["47"] = 35,["48"] = 36,["49"] = 36,["50"] = 36,["51"] = 36,["52"] = 36,["53"] = 37,["54"] = 38,["55"] = 39,["57"] = 41,["58"] = 36,["59"] = 36,["60"] = 36,["61"] = 24,["62"] = 48,["63"] = 50,["64"] = 51,["65"] = 52,["66"] = 52,["67"] = 52,["68"] = 53,["69"] = 54,["70"] = 55,["72"] = 57,["73"] = 57,["74"] = 57,["75"] = 57,["76"] = 58,["77"] = 52,["78"] = 52,["79"] = 60,["80"] = 60,["81"] = 60,["82"] = 61,["83"] = 60,["84"] = 60,["86"] = 63,["87"] = 63,["88"] = 64,["89"] = 64,["90"] = 64,["91"] = 64,["92"] = 64,["93"] = 65,["94"] = 66,["95"] = 67,["96"] = 67,["97"] = 67,["98"] = 67,["101"] = 63,["104"] = 71,["105"] = 72,["106"] = 73,["107"] = 74,["109"] = 76,["110"] = 76,["111"] = 76,["112"] = 76,["113"] = 76,["114"] = 78,["115"] = 79,["116"] = 80,["117"] = 48,["118"] = 89,["119"] = 90,["120"] = 91,["121"] = 92,["122"] = 93,["123"] = 94,["124"] = 95,["125"] = 96,["126"] = 97,["128"] = 99,["129"] = 100,["130"] = 101,["131"] = 102,["132"] = 103,["133"] = 104,["134"] = 105,["135"] = 106,["136"] = 107,["137"] = 108,["138"] = 109,["139"] = 110,["140"] = 111,["141"] = 112,["142"] = 113,["143"] = 114,["144"] = 115,["145"] = 116,["146"] = 116,["147"] = 116,["148"] = 117,["149"] = 118,["150"] = 116,["151"] = 116,["152"] = 120,["154"] = 122,["155"] = 123,["157"] = 125,["158"] = 126,["160"] = 128,["161"] = 128,["162"] = 128,["163"] = 128,["164"] = 128,["165"] = 130,["166"] = 131,["167"] = 132,["168"] = 133,["169"] = 133,["170"] = 133,["171"] = 133,["172"] = 133,["173"] = 134,["174"] = 134,["175"] = 134,["176"] = 134,["177"] = 134,["179"] = 137,["180"] = 138,["182"] = 89,["183"] = 18,["184"] = 87,["185"] = 87,["186"] = 87,["187"] = 87,["188"] = 87,["189"] = 87,["190"] = 87,["191"] = 87,["192"] = 87,["193"] = 87,["194"] = 87});
local ____exports = {}
local ____dialog = require("solar.solar-common.w3ts.handles.dialog")
local DialogButton = ____dialog.DialogButton
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____GameUtil = require("solar.solar-common.util.game.GameUtil")
local GameUtil = ____GameUtil.default
local ____DialogUtil = require("solar.solar-common.util.game.DialogUtil")
local DialogUtil = ____DialogUtil.default
local ____MapModel = require("MapModel")
local MapModel = ____MapModel.default
local ____ArchiveUtil = require("solar.solar-common.util.archive.ArchiveUtil")
local ArchiveUtil = ____ArchiveUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = require("state.刷怪系统.达尔文进化基础刷怪")
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.default
____exports.default = __TS__Class()
local GameDifficultyChooseDialogState = ____exports.default
GameDifficultyChooseDialogState.name = "GameDifficultyChooseDialogState"
function GameDifficultyChooseDialogState.prototype.____constructor(self)
    local ms = {MapModel["模式1_普通模式"]}
    if PlatUtil:getStoreInt(
        PlayerUtil:firstOfUsers(),
        "znjifen"
    ) > 8 or isDebug then
        ms[#ms + 1] = MapModel["模式2_寄生模式"]
    end
    if PlatUtil:getStoreInt(
        PlayerUtil:firstOfUsers(),
        "znjifen"
    ) > 18 or isDebug then
        ms[#ms + 1] = MapModel["模式3_献祭模式"]
    end
    if PlatUtil:getStoreInt(
        PlayerUtil:firstOfUsers(),
        "znjifen"
    ) > 28 or isDebug then
        ms[#ms + 1] = MapModel["模式4_真实难度"]
    end
    ms[#ms + 1] = MapModel["模式0_教学模式"]
    DialogUtil:showWithTimeLimit(
        0,
        "选择模式",
        20,
        function(____, id, str)
            settings.gameMode = str
            if id > 1 then
                gv.bossAbilityLimit = 9
            end
            ____exports.default.action()
        end,
        table.unpack(ms)
    )
end
function GameDifficultyChooseDialogState.action()
    local dialog = DialogCreate()
    DialogSetMessage(dialog, "难度选择")
    local tl = BaseUtil.onTimer(
        1,
        function(____, c)
            if c > ____exports.default.config.chooseTimerLimit then
                GameUtil:defeats("未在指定时间选择难度!")
                return false
            end
            DialogSetMessage(
                dialog,
                ("难度选择 （|cffff0000剩余" .. tostring(30 - c)) .. "|r）"
            )
            return true
        end
    )
    se:on(
        "选择难度",
        function(l)
            tl:destroy()
        end
    )
    do
        local i = 1
        while i <= 9 do
            local button = DialogAddButton(
                dialog,
                ("难度" .. tostring(i)) .. "",
                0
            )
            DialogButton:fromHandle(button).solarData.GameDifficulty = i
            DialogButton:fromHandle(button).solarData.isEndlessMode = false
            if ArchiveUtil:get(
                PlayerUtil:firstOfUsers(),
                "n" .. tostring(i)
            ) == nil and isDebug == false then
                break
            end
            i = i + 1
        end
    end
    if ____exports.default.config.hasEndlessMode then
        local button = DialogAddButton(dialog, "无尽模式", 0)
        DialogButton:fromHandle(button).solarData.GameDifficulty = 4
        DialogButton:fromHandle(button).solarData.isEndlessMode = true
    end
    DialogDisplay(
        Player(0),
        dialog,
        true
    )
    local ydl_trigger = CreateTrigger()
    TriggerRegisterDialogEvent(ydl_trigger, dialog)
    TriggerAddAction(ydl_trigger, ____exports.default.on_dialog_click)
end
function GameDifficultyChooseDialogState.on_dialog_click()
    local button = GetClickedButton()
    local gameDifficultyTemp = DialogButton:fromHandle(button).solarData.GameDifficulty
    local isEndlessModeTemp = DialogButton:fromHandle(button).solarData.isEndlessMode
    if gameDifficultyTemp then
        settings.gameDifficulty = gameDifficultyTemp
        settings.valueCoefficient = ____exports.default.valueCoefficients[gameDifficultyTemp]
        if settings.gameDifficulty > 4 then
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_max = 600
        end
        if settings.gameMode == MapModel["模式2_寄生模式"] then
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_max = 700
            settings.valueCoefficient = ____exports.default.valueCoefficients[9]
            settings.valueCoefficient = math.floor(settings.valueCoefficient * 1.2 ^ settings.gameDifficulty)
        elseif settings.gameMode == MapModel["模式3_献祭模式"] then
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_max = 800
            settings.valueCoefficient = ____exports.default.valueCoefficients[9]
            settings.valueCoefficient = math.floor(settings.valueCoefficient * 1.3 ^ (settings.gameDifficulty + 9))
        elseif settings.gameMode == MapModel["模式4_真实难度"] then
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_max = 800
            settings.valueCoefficient = ____exports.default.valueCoefficients[9]
            settings.valueCoefficient = math.floor(settings.valueCoefficient * 1.4 ^ (settings.gameDifficulty + 18))
        elseif settings.gameMode == MapModel["模式0_教学模式"] then
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_min = 10
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_max = 50
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.create_creeper_pers = 1
            settings.valueCoefficient = 1
            BaseUtil.runLater(
                60 * 60 * 7,
                function()
                    GameUtil:defeats()
                    EndGame(true)
                end
            )
            PlayerUtil:message("|cffff0000你选择了教学模式：此模式用于上手学习此游戏各游戏玩法和机制，不会掉落存档！", 30)
        end
        print("难度系数=" .. tostring(settings.valueCoefficient))
        se:emit("选择难度", settings.gameDifficulty)
    end
    if isEndlessModeTemp then
        settings.isEndlessMode = isEndlessModeTemp
    end
    DisplayTimedTextToForce(
        GetPlayersAll(),
        15,
        "|CFFFF0000选择的难度 ： 难度" .. tostring(settings.gameDifficulty)
    )
    if ____exports.default.config.AddPlayerTechId and #____exports.default.config.AddPlayerTechId > 3 then
        local techLv = settings.gameDifficulty - 1
        techLv = techLv * techLv
        AddPlayerTechResearched(
            Player(11),
            FourCC(____exports.default.config.AddPlayerTechId),
            techLv
        )
        AddPlayerTechResearched(
            Player(12),
            FourCC(____exports.default.config.AddPlayerTechId),
            techLv
        )
    end
    if gv.bossAbilityLimit <= 1 then
        gv.bossAbilityLimit = math.ceil(settings.gameDifficulty / 3)
    end
end
GameDifficultyChooseDialogState.config = {hasEndlessMode = false, chooseTimerLimit = 30}
GameDifficultyChooseDialogState.valueCoefficients = {
    1,
    1.5,
    2.5,
    4,
    6,
    10,
    20,
    40,
    80
}
return ____exports
