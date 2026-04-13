local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 20,["12"] = 21,["15"] = 24,["16"] = 26,["17"] = 28,["18"] = 29,["19"] = 30,["20"] = 31,["21"] = 32,["22"] = 34,["23"] = 34,["24"] = 34,["25"] = 34,["26"] = 34,["27"] = 34,["30"] = 37,["31"] = 38,["32"] = 20,["33"] = 42,["34"] = 43,["35"] = 45,["36"] = 46,["37"] = 47,["39"] = 49,["41"] = 42,["42"] = 54,["43"] = 55,["44"] = 55,["45"] = 55,["46"] = 55,["47"] = 56,["48"] = 56,["49"] = 56,["50"] = 56,["51"] = 56,["53"] = 58,["54"] = 54,["55"] = 62,["56"] = 63,["57"] = 64,["58"] = 65,["59"] = 66,["60"] = 66,["61"] = 66,["62"] = 66,["63"] = 66,["64"] = 67,["66"] = 69,["67"] = 62,["68"] = 72,["69"] = 73,["70"] = 74,["71"] = 75,["72"] = 76,["73"] = 77,["74"] = 78,["75"] = 72,["76"] = 82,["77"] = 83,["78"] = 85,["79"] = 86,["80"] = 87,["82"] = 89,["83"] = 90,["84"] = 91,["85"] = 92,["87"] = 95,["88"] = 96,["89"] = 82,["90"] = 4,["91"] = 6,["92"] = 7,["93"] = 8,["94"] = 10,["95"] = 11,["96"] = 12});
local ____exports = {}
____exports.default = __TS__Class()
local TriggerUtil = ____exports.default
TriggerUtil.name = "TriggerUtil"
function TriggerUtil.prototype.____constructor(self)
end
function TriggerUtil.SystemAnyUnitDamagedRegistTrigger(trg)
    if trg == nil then
        return
    end
    if ____exports.default.DamageEventNumber == 0 then
        ____exports.default.AnyUnitDamagedFilterCondition = Condition(____exports.default.AnyUnitDamagedFilter)
        ____exports.default.DamageEventTrigger = CreateTrigger()
        TriggerAddAction(____exports.default.DamageEventTrigger, ____exports.default.AnyUnitDamagedTriggerAction)
        ____exports.default.AnyUnitDamagedEnumUnit()
        ____exports.default.AnyUnitDamagedRegistTriggerUnitEnter()
        if ____exports.default.DAMAGE_EVENT_SWAP_ENABLE then
            TimerStart(
                CreateTimer(),
                ____exports.default.DAMAGE_EVENT_SWAP_TIMEOUT,
                true,
                ____exports.default.SyStemAnyUnitDamagedSwap
            )
        end
    end
    ____exports.default.DamageEventQueue[____exports.default.DamageEventNumber + 1] = trg
    ____exports.default.DamageEventNumber = ____exports.default.DamageEventNumber + 1
end
function TriggerUtil.AnyUnitDamagedTriggerAction()
    local i = 0
    while i < ____exports.default.DamageEventNumber do
        if ____exports.default.DamageEventQueue[i + 1] ~= nil and IsTriggerEnabled(____exports.default.DamageEventQueue[i + 1]) and TriggerEvaluate(____exports.default.DamageEventQueue[i + 1]) then
            TriggerExecute(____exports.default.DamageEventQueue[i + 1])
        end
        i = i + 1
    end
end
function TriggerUtil.AnyUnitDamagedFilter()
    if GetUnitAbilityLevel(
        GetFilterUnit(),
        FourCC("Aloc")
    ) <= 0 then
        TriggerRegisterUnitEvent(
            ____exports.default.DamageEventTrigger,
            GetFilterUnit(),
            EVENT_UNIT_DAMAGED
        )
    end
    return false
end
function TriggerUtil.AnyUnitDamagedEnumUnit()
    local g = CreateGroup()
    local i = 0
    while i < 16 do
        GroupEnumUnitsOfPlayer(
            g,
            Player(i),
            ____exports.default.AnyUnitDamagedFilterCondition
        )
        i = i + 1
    end
    DestroyGroup(g)
end
function TriggerUtil.AnyUnitDamagedRegistTriggerUnitEnter()
    local t = CreateTrigger()
    local r = CreateRegion()
    local world = GetWorldBounds()
    RegionAddRect(r, world)
    TriggerRegisterEnterRegion(t, r, ____exports.default.AnyUnitDamagedFilterCondition)
    RemoveRect(world)
end
function TriggerUtil.SyStemAnyUnitDamagedSwap()
    local isEnabled = IsTriggerEnabled(____exports.default.DamageEventTrigger)
    DisableTrigger(____exports.default.DamageEventTrigger)
    if ____exports.default.DamageEventTriggerToDestory ~= nil then
        DestroyTrigger(____exports.default.DamageEventTriggerToDestory)
    end
    ____exports.default.DamageEventTriggerToDestory = ____exports.default.DamageEventTrigger
    ____exports.default.DamageEventTrigger = CreateTrigger()
    if not isEnabled then
        DisableTrigger(____exports.default.DamageEventTrigger)
    end
    TriggerAddAction(____exports.default.DamageEventTrigger, ____exports.default.AnyUnitDamagedTriggerAction)
    ____exports.default.AnyUnitDamagedEnumUnit()
end
TriggerUtil.DamageEventTrigger = nil
TriggerUtil.DAMAGE_EVENT_SWAP_TIMEOUT = 60
TriggerUtil.DAMAGE_EVENT_SWAP_ENABLE = true
TriggerUtil.DamageEventTriggerToDestory = nil
TriggerUtil.DamageEventQueue = {}
TriggerUtil.DamageEventNumber = 0
TriggerUtil.AnyUnitDamagedFilterCondition = nil
return ____exports
