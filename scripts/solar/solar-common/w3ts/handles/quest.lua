local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 3,["11"] = 5,["12"] = 5,["13"] = 5,["14"] = 5,["15"] = 7,["16"] = 8,["17"] = 5,["19"] = 5,["20"] = 11,["21"] = 11,["22"] = 11,["24"] = 7,["25"] = 18,["26"] = 19,["27"] = 18,["33"] = 26,["35"] = 32,["36"] = 33,["41"] = 37,["42"] = 37,["43"] = 37,["44"] = 37,["46"] = 40,["47"] = 40,["48"] = 40,["50"] = 40,["52"] = 37,["53"] = 39,["54"] = 113,["55"] = 114,["56"] = 116,["57"] = 118,["58"] = 113,["59"] = 121,["60"] = 122,["61"] = 121,["62"] = 125,["63"] = 126,["64"] = 125,["65"] = 129,["66"] = 130,["67"] = 129,["68"] = 133,["69"] = 134,["70"] = 133,["71"] = 137,["72"] = 138,["73"] = 137,["74"] = 141,["75"] = 142,["76"] = 141,["77"] = 145,["78"] = 146,["79"] = 145,["85"] = 47,["87"] = 53,["88"] = 54,["98"] = 61,["100"] = 67,["101"] = 68,["111"] = 75,["113"] = 81,["114"] = 82,["124"] = 89,["126"] = 95,["127"] = 96,["137"] = 103,["139"] = 109,["140"] = 110});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.QuestItem = __TS__Class()
local QuestItem = ____exports.QuestItem
QuestItem.name = "QuestItem"
__TS__ClassExtends(QuestItem, Handle)
function QuestItem.prototype.____constructor(self, whichQuest)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            QuestCreateItem(whichQuest.handle)
        )
    end
end
function QuestItem.prototype.setDescription(self, description)
    QuestItemSetDescription(self.handle, description)
end
__TS__SetDescriptor(
    QuestItem.prototype,
    "completed",
    {
        get = function(self)
            return IsQuestItemCompleted(self.handle)
        end,
        set = function(self, completed)
            QuestItemSetCompleted(self.handle, completed)
        end
    },
    true
)
____exports.Quest = __TS__Class()
local Quest = ____exports.Quest
Quest.name = "Quest"
__TS__ClassExtends(Quest, Handle)
function Quest.prototype.____constructor(self)
    local ____Handle_initFromHandle_result_0
    if Handle:initFromHandle() then
        ____Handle_initFromHandle_result_0 = nil
    else
        ____Handle_initFromHandle_result_0 = CreateQuest()
    end
    Handle.prototype.____constructor(self, ____Handle_initFromHandle_result_0)
end
function Quest.prototype.addItem(self, description)
    local questItem = __TS__New(____exports.QuestItem, self)
    questItem:setDescription(description)
    return questItem
end
function Quest.prototype.destroy(self)
    DestroyQuest(self.handle)
end
function Quest.prototype.setDescription(self, description)
    QuestSetDescription(self.handle, description)
end
function Quest.prototype.setIcon(self, iconPath)
    QuestSetIconPath(self.handle, iconPath)
end
function Quest.prototype.setTitle(self, title)
    QuestSetTitle(self.handle, title)
end
function Quest.flashQuestDialogButton(self)
    FlashQuestDialogButton()
end
function Quest.forceQuestDialogUpdate(self)
    ForceQuestDialogUpdate()
end
function Quest.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    Quest.prototype,
    "completed",
    {
        get = function(self)
            return IsQuestCompleted(self.handle)
        end,
        set = function(self, completed)
            QuestSetCompleted(self.handle, completed)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "discovered",
    {
        get = function(self)
            return IsQuestDiscovered(self.handle)
        end,
        set = function(self, discovered)
            QuestSetDiscovered(self.handle, discovered)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "enabled",
    {
        get = function(self)
            return IsQuestEnabled(self.handle)
        end,
        set = function(self, enabled)
            QuestSetEnabled(self.handle, enabled)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "failed",
    {
        get = function(self)
            return IsQuestFailed(self.handle)
        end,
        set = function(self, failed)
            QuestSetFailed(self.handle, failed)
        end
    },
    true
)
__TS__SetDescriptor(
    Quest.prototype,
    "required",
    {
        get = function(self)
            return IsQuestRequired(self.handle)
        end,
        set = function(self, required)
            QuestSetRequired(self.handle, required)
        end
    },
    true
)
return ____exports
