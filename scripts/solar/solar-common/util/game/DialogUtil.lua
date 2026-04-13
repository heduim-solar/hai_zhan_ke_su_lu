local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 14,["16"] = 14,["17"] = 15,["18"] = 16,["20"] = 17,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 20,["25"] = 21,["26"] = 22,["27"] = 17,["30"] = 26,["31"] = 26,["32"] = 26,["33"] = 26,["34"] = 26,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 30,["39"] = 30,["40"] = 31,["41"] = 32,["42"] = 33,["43"] = 30,["44"] = 30,["45"] = 35,["46"] = 14,["47"] = 47,["48"] = 47,["49"] = 48,["50"] = 49,["51"] = 50,["52"] = 50,["53"] = 50,["54"] = 51,["55"] = 52,["56"] = 53,["58"] = 55,["59"] = 55,["60"] = 55,["61"] = 55,["62"] = 56,["63"] = 50,["64"] = 50,["66"] = 58,["67"] = 58,["68"] = 59,["69"] = 60,["70"] = 61,["71"] = 62,["72"] = 63,["73"] = 58,["76"] = 67,["77"] = 67,["78"] = 67,["79"] = 67,["80"] = 67,["81"] = 69,["82"] = 70,["83"] = 71,["84"] = 71,["85"] = 71,["86"] = 72,["87"] = 73,["88"] = 74,["89"] = 75,["90"] = 71,["91"] = 71,["92"] = 77,["93"] = 47});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local DialogUtil = ____exports.default
DialogUtil.name = "DialogUtil"
function DialogUtil.prototype.____constructor(self)
end
function DialogUtil.show(self, playerId, title, onClickButtonCallBack, ...)
    local buttonTexts = {...}
    local dialog = DialogCreate()
    DialogSetMessage(dialog, title)
    do
        local i = 0
        while i < #buttonTexts do
            local buttonText = buttonTexts[i + 1]
            local button = DialogAddButton(dialog, buttonText, 0)
            local solarData = DataBase:getDialogButtonSolarData(button)
            solarData._sl_index = i
            solarData._sl_text = buttonText
            i = i + 1
        end
    end
    DialogDisplay(
        Player(playerId),
        dialog,
        true
    )
    local trigger = CreateTrigger()
    TriggerRegisterDialogEvent(trigger, dialog)
    TriggerAddAction(
        trigger,
        function()
            local button = GetClickedButton()
            local solarData = DataBase:getDialogButtonSolarData(button)
            onClickButtonCallBack(nil, solarData._sl_index, solarData._sl_text)
        end
    )
    return dialog
end
function DialogUtil.showWithTimeLimit(self, playerId, title, lifeTime, onClickButtonCallBack, ...)
    local buttonTexts = {...}
    local dialog = DialogCreate()
    DialogSetMessage(dialog, title)
    local tl = BaseUtil.onTimer(
        1,
        function(____, c)
            if c > lifeTime then
                onClickButtonCallBack(nil, 0, buttonTexts[1])
                return false
            end
            DialogSetMessage(
                dialog,
                ((title .. " （|cffff0000剩余") .. tostring(lifeTime - c)) .. "|r）"
            )
            return true
        end
    )
    do
        local i = 0
        while i < #buttonTexts do
            local buttonText = buttonTexts[i + 1]
            local button = DialogAddButton(dialog, buttonText, 0)
            local solarData = DataBase:getDialogButtonSolarData(button)
            solarData._sl_index = i
            solarData._sl_text = buttonText
            i = i + 1
        end
    end
    DialogDisplay(
        Player(playerId),
        dialog,
        true
    )
    local trigger = CreateTrigger()
    TriggerRegisterDialogEvent(trigger, dialog)
    TriggerAddAction(
        trigger,
        function()
            local button = GetClickedButton()
            local solarData = DataBase:getDialogButtonSolarData(button)
            tl:destroy()
            onClickButtonCallBack(nil, solarData._sl_index, solarData._sl_text)
        end
    )
    return dialog
end
return ____exports
