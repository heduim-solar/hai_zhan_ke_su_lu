local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__ObjectDefineProperty = ____lualib.__TS__ObjectDefineProperty
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 4,["10"] = 4,["11"] = 8,["12"] = 8,["13"] = 11,["14"] = 11,["15"] = 11,["16"] = 11,["18"] = 14,["19"] = 11,["21"] = 11,["22"] = 17,["23"] = 17,["24"] = 17,["26"] = 13,["27"] = 59,["28"] = 60,["29"] = 59,["30"] = 87,["31"] = 88,["32"] = 87,["33"] = 94,["34"] = 95,["35"] = 94,["36"] = 101,["37"] = 102,["38"] = 101,["39"] = 108,["40"] = 109,["41"] = 108,["42"] = 115,["43"] = 116,["44"] = 115,["45"] = 122,["46"] = 123,["47"] = 122,["48"] = 130,["50"] = 132,["51"] = 132,["52"] = 133,["53"] = 133,["54"] = 133,["55"] = 133,["56"] = 133,["57"] = 133,["58"] = 132,["61"] = 130,["62"] = 144,["63"] = 145,["64"] = 144,["65"] = 151,["66"] = 152,["67"] = 151,["68"] = 158,["69"] = 159,["70"] = 158,["71"] = 165,["72"] = 166,["73"] = 167,["74"] = 168,["75"] = 165,["76"] = 174,["77"] = 175,["78"] = 176,["79"] = 177,["80"] = 174,["81"] = 183,["82"] = 184,["83"] = 183,["84"] = 191,["85"] = 192,["86"] = 191,["87"] = 198,["88"] = 199,["89"] = 198,["90"] = 205,["91"] = 206,["92"] = 205,["93"] = 212,["94"] = 213,["95"] = 212,["96"] = 219,["97"] = 220,["98"] = 219,["99"] = 226,["100"] = 227,["101"] = 226,["102"] = 233,["104"] = 234,["105"] = 234,["106"] = 235,["107"] = 235,["108"] = 235,["109"] = 235,["110"] = 235,["111"] = 235,["112"] = 234,["115"] = 233,["116"] = 242,["117"] = 243,["118"] = 242,["119"] = 249,["121"] = 250,["122"] = 250,["123"] = 251,["124"] = 251,["125"] = 251,["126"] = 251,["127"] = 251,["128"] = 250,["131"] = 249,["132"] = 266,["133"] = 267,["134"] = 267,["135"] = 267,["136"] = 267,["137"] = 267,["138"] = 267,["139"] = 267,["140"] = 266,["141"] = 277,["142"] = 278,["143"] = 277,["144"] = 286,["145"] = 287,["146"] = 286,["147"] = 295,["148"] = 296,["149"] = 295,["150"] = 302,["151"] = 303,["152"] = 302,["153"] = 309,["154"] = 310,["155"] = 309,["156"] = 316,["157"] = 317,["158"] = 316,["159"] = 323,["160"] = 324,["161"] = 323,["162"] = 330,["163"] = 331,["164"] = 331,["165"] = 331,["166"] = 331,["167"] = 331,["168"] = 331,["169"] = 331,["170"] = 330,["171"] = 341,["172"] = 342,["173"] = 341,["174"] = 348,["175"] = 349,["176"] = 348,["177"] = 355,["178"] = 356,["179"] = 355,["180"] = 362,["181"] = 363,["182"] = 362,["183"] = 369,["184"] = 370,["185"] = 369,["186"] = 376,["187"] = 377,["188"] = 376,["189"] = 387,["190"] = 388,["191"] = 387,["192"] = 394,["193"] = 395,["194"] = 394,["200"] = 33,["202"] = 21,["203"] = 22,["204"] = 23,["206"] = 25,["216"] = 37,["224"] = 41,["231"] = 45,["240"] = 53,["242"] = 48,["243"] = 49});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
local ____TriggerUtil = require("solar.solar-common.util.system.TriggerUtil")
local TriggerUtil = ____TriggerUtil.default
____exports.Trigger = __TS__Class()
local Trigger = ____exports.Trigger
Trigger.name = "Trigger"
__TS__ClassExtends(Trigger, Handle)
function Trigger.prototype.____constructor(self)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateTrigger()
        )
    end
end
function Trigger.prototype.addAction(self, actionFunc)
    return TriggerAddAction(self.handle, actionFunc)
end
function Trigger.prototype.addCondition(self, condition)
    return TriggerAddCondition(self.handle, condition)
end
function Trigger.prototype.destroy(self)
    DestroyTrigger(self.handle)
end
function Trigger.prototype.eval(self)
    return TriggerEvaluate(self.handle)
end
function Trigger.prototype.exec(self)
    return TriggerExecute(self.handle)
end
function Trigger.prototype.registerAnyUnitDamagedEvent(self)
    TriggerUtil.SystemAnyUnitDamagedRegistTrigger(self.handle)
end
function Trigger.prototype.registerAnyUnitDeathEvent(self)
    self:registerAnyUnitEvent(EVENT_PLAYER_UNIT_DEATH)
end
function Trigger.prototype.registerAnyUnitEvent(self, whichPlayerUnitEvent)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerUnitEvent(
                self.handle,
                Player(i),
                whichPlayerUnitEvent,
                nil
            )
            i = i + 1
        end
    end
end
function Trigger.prototype.registerDeathEvent(self, whichWidget)
    return TriggerRegisterDeathEvent(self.handle, whichWidget.handle)
end
function Trigger.prototype.registerDialogButtonEvent(self, whichButton)
    return TriggerRegisterDialogButtonEvent(self.handle, whichButton.handle)
end
function Trigger.prototype.registerDialogEvent(self, whichDialog)
    return TriggerRegisterDialogEvent(self.handle, whichDialog.handle)
end
function Trigger.prototype.registerEnterRect(self, whichRect)
    local rectRegion = CreateRegion()
    RegionAddRect(rectRegion, whichRect)
    return TriggerRegisterEnterRegion(self.handle, rectRegion, nil)
end
function Trigger.prototype.registerLeaveRect(self, whichRect)
    local rectRegion = CreateRegion()
    RegionAddRect(rectRegion, whichRect)
    return TriggerRegisterLeaveRegion(self.handle, rectRegion, nil)
end
function Trigger.prototype.registerEnterRegion(self, whichRegion, filter)
    return TriggerRegisterEnterRegion(self.handle, whichRegion, filter)
end
function Trigger.prototype.registerFilterUnitEvent(self, whichUnit, whichEvent, filter)
    return TriggerRegisterFilterUnitEvent(self.handle, whichUnit, whichEvent, filter)
end
function Trigger.prototype.registerGameEvent(self, whichGameEvent)
    return TriggerRegisterGameEvent(self.handle, whichGameEvent)
end
function Trigger.prototype.registerGameStateEvent(self, whichState, opcode, limitval)
    return TriggerRegisterGameStateEvent(self.handle, whichState, opcode, limitval)
end
function Trigger.prototype.registerLeaveRegion(self, whichRegion, filter)
    return TriggerRegisterLeaveRegion(self.handle, whichRegion, filter)
end
function Trigger.prototype.registerPlayerAllianceChange(self, whichPlayer, whichAlliance)
    return TriggerRegisterPlayerAllianceChange(self.handle, whichPlayer.handle, whichAlliance)
end
function Trigger.prototype.registerPlayerChatEvent(self, whichPlayer, chatMessageToDetect, exactMatchOnly)
    return TriggerRegisterPlayerChatEvent(self.handle, whichPlayer.handle, chatMessageToDetect, exactMatchOnly)
end
function Trigger.prototype.registerAnyPlayerChatEvent(self, chatMessageToDetect, exactMatchOnly)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerChatEvent(
                self.handle,
                Player(i),
                chatMessageToDetect,
                exactMatchOnly
            )
            i = i + 1
        end
    end
end
function Trigger.prototype.registerPlayerEvent(self, whichPlayer, whichPlayerEvent)
    return TriggerRegisterPlayerEvent(self.handle, whichPlayer.handle, whichPlayerEvent)
end
function Trigger.prototype.registerAnyPlayerEvent(self, whichPlayerEvent)
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerEvent(
                self.handle,
                Player(i),
                whichPlayerEvent
            )
            i = i + 1
        end
    end
end
function Trigger.prototype.registerPlayerStateEvent(self, whichPlayer, whichState, opcode, limitval)
    return TriggerRegisterPlayerStateEvent(
        self.handle,
        whichPlayer.handle,
        whichState,
        opcode,
        limitval
    )
end
function Trigger.prototype.registerPlayerUnitEvent(self, whichPlayer, whichPlayerUnitEvent, filter)
    return TriggerRegisterPlayerUnitEvent(self.handle, whichPlayer.handle, whichPlayerUnitEvent, filter)
end
function Trigger.prototype.registerTimerEvent(self, timeout, periodic)
    return TriggerRegisterTimerEvent(self.handle, timeout, periodic)
end
function Trigger.prototype.registerTimerExpireEvent(self, t)
    return TriggerRegisterTimerExpireEvent(self.handle, t)
end
function Trigger.prototype.registerTrackableHitEvent(self, whichTrackable)
    return TriggerRegisterTrackableHitEvent(self.handle, whichTrackable)
end
function Trigger.prototype.registerTrackableTrackEvent(self, whichTrackable)
    return TriggerRegisterTrackableTrackEvent(self.handle, whichTrackable)
end
function Trigger.prototype.registerUnitEvent(self, whichUnit, whichEvent)
    return TriggerRegisterUnitEvent(self.handle, whichUnit.handle, whichEvent)
end
function Trigger.prototype.registerUnitInRage(self, whichUnit, range, filter)
    return TriggerRegisterUnitInRange(self.handle, whichUnit, range, filter)
end
function Trigger.prototype.registerUnitStateEvent(self, whichUnit, whichState, opcode, limitval)
    return TriggerRegisterUnitStateEvent(
        self.handle,
        whichUnit.handle,
        whichState,
        opcode,
        limitval
    )
end
function Trigger.prototype.registerVariableEvent(self, varName, opcode, limitval)
    return TriggerRegisterVariableEvent(self.handle, varName, opcode, limitval)
end
function Trigger.prototype.removeAction(self, whichAction)
    return TriggerRemoveAction(self.handle, whichAction)
end
function Trigger.prototype.removeActions(self)
    return TriggerClearActions(self.handle)
end
function Trigger.prototype.removeCondition(self, whichCondition)
    return TriggerRemoveCondition(self.handle, whichCondition)
end
function Trigger.prototype.removeConditions(self)
    return TriggerClearConditions(self.handle)
end
function Trigger.prototype.reset(self)
    ResetTrigger(self.handle)
end
function Trigger.fromEvent(self)
    return self:fromHandle(GetTriggeringTrigger())
end
function Trigger.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    Trigger.prototype,
    "enabled",
    {
        get = function(self)
            return IsTriggerEnabled(self.handle)
        end,
        set = function(self, flag)
            if flag then
                EnableTrigger(self.handle)
            else
                DisableTrigger(self.handle)
            end
        end
    },
    true
)
__TS__SetDescriptor(
    Trigger.prototype,
    "evalCount",
    {get = function(self)
        return GetTriggerEvalCount(self.handle)
    end},
    true
)
__TS__ObjectDefineProperty(
    Trigger,
    "eventId",
    {get = function(self)
        return GetTriggerEventId()
    end}
)
__TS__SetDescriptor(
    Trigger.prototype,
    "execCount",
    {get = function(self)
        return GetTriggerExecCount(self.handle)
    end},
    true
)
__TS__SetDescriptor(
    Trigger.prototype,
    "waitOnSleeps",
    {
        get = function(self)
            return IsTriggerWaitOnSleeps(self.handle)
        end,
        set = function(self, flag)
            TriggerWaitOnSleeps(self.handle, flag)
        end
    },
    true
)
return ____exports
