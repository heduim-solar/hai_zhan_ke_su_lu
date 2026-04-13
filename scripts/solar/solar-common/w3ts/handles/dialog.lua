local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 7,["14"] = 7,["15"] = 7,["16"] = 7,["17"] = 9,["18"] = 9,["19"] = 9,["21"] = 9,["22"] = 9,["24"] = 9,["25"] = 9,["27"] = 10,["28"] = 7,["29"] = 12,["30"] = 7,["31"] = 13,["32"] = 13,["33"] = 13,["35"] = 7,["36"] = 15,["37"] = 15,["38"] = 15,["40"] = 9,["41"] = 27,["42"] = 28,["43"] = 27,["49"] = 20,["51"] = 23,["52"] = 24,["57"] = 32,["58"] = 32,["59"] = 32,["60"] = 32,["62"] = 35,["63"] = 35,["64"] = 35,["66"] = 35,["68"] = 32,["69"] = 34,["70"] = 45,["71"] = 45,["72"] = 45,["74"] = 45,["75"] = 45,["77"] = 45,["78"] = 45,["80"] = 46,["81"] = 46,["82"] = 46,["83"] = 46,["84"] = 46,["85"] = 46,["86"] = 46,["87"] = 46,["88"] = 45,["89"] = 52,["90"] = 53,["91"] = 52,["92"] = 59,["93"] = 60,["94"] = 59,["95"] = 66,["96"] = 67,["97"] = 66,["98"] = 73,["99"] = 74,["100"] = 73,["101"] = 80,["102"] = 81,["103"] = 80});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.DialogButton = __TS__Class()
local DialogButton = ____exports.DialogButton
DialogButton.name = "DialogButton"
__TS__ClassExtends(DialogButton, Handle)
function DialogButton.prototype.____constructor(self, whichDialog, text, hotkey, quit, score)
    if hotkey == nil then
        hotkey = 0
    end
    if quit == nil then
        quit = false
    end
    if score == nil then
        score = false
    end
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    elseif not quit then
        Handle.prototype.____constructor(
            self,
            DialogAddButton(whichDialog.handle, text, hotkey)
        )
    else
        Handle.prototype.____constructor(
            self,
            DialogAddQuitButton(whichDialog.handle, score, text, hotkey)
        )
    end
end
function DialogButton.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    DialogButton.prototype,
    "solarData",
    {
        get = function(self)
            return DataBase:getDialogButtonSolarData(self.handle)
        end,
        set = function(self, obj)
            DataBase:setDataByHandle("+dlb", self.handle, obj)
        end
    },
    true
)
____exports.Dialog = __TS__Class()
local Dialog = ____exports.Dialog
Dialog.name = "Dialog"
__TS__ClassExtends(Dialog, Handle)
function Dialog.prototype.____constructor(self)
    local ____Handle_initFromHandle_result_0
    if Handle:initFromHandle() then
        ____Handle_initFromHandle_result_0 = nil
    else
        ____Handle_initFromHandle_result_0 = DialogCreate()
    end
    Handle.prototype.____constructor(self, ____Handle_initFromHandle_result_0)
end
function Dialog.prototype.addButton(self, text, hotkey, quit, score)
    if hotkey == nil then
        hotkey = 0
    end
    if quit == nil then
        quit = false
    end
    if score == nil then
        score = false
    end
    return __TS__New(
        ____exports.DialogButton,
        self,
        text,
        hotkey,
        quit,
        score
    )
end
function Dialog.prototype.clear(self)
    DialogClear(self.handle)
end
function Dialog.prototype.destroy(self)
    DialogDestroy(self.handle)
end
function Dialog.prototype.display(self, whichPlayer, flag)
    DialogDisplay(whichPlayer.handle, self.handle, flag)
end
function Dialog.prototype.setMessage(self, whichMessage)
    DialogSetMessage(self.handle, whichMessage)
end
function Dialog.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
