local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 11,["7"] = 11,["8"] = 12,["9"] = 12,["10"] = 18,["11"] = 18,["12"] = 18,["14"] = 18,["15"] = 21,["16"] = 22,["17"] = 21,["18"] = 31,["19"] = 33,["20"] = 34,["21"] = 35,["22"] = 31,["23"] = 38,["24"] = 39,["25"] = 40,["26"] = 41,["27"] = 42,["28"] = 43,["29"] = 44,["30"] = 45,["31"] = 46,["32"] = 47,["33"] = 48,["34"] = 50,["35"] = 51,["36"] = 52,["37"] = 53,["38"] = 54,["39"] = 55,["40"] = 56,["41"] = 57,["42"] = 58,["43"] = 59,["44"] = 59,["45"] = 59,["46"] = 59,["47"] = 59,["48"] = 59,["51"] = 62,["52"] = 63,["53"] = 64,["54"] = 65,["55"] = 65,["56"] = 65,["57"] = 65,["58"] = 65,["59"] = 65,["62"] = 68,["63"] = 69,["64"] = 70,["65"] = 70,["66"] = 70,["67"] = 70,["68"] = 70,["69"] = 71,["70"] = 72,["72"] = 74,["73"] = 74,["74"] = 74,["75"] = 74,["76"] = 74,["77"] = 74,["82"] = 79,["83"] = 79,["84"] = 79,["85"] = 79,["86"] = 79,["87"] = 79,["89"] = 38,["90"] = 95,["91"] = 95,["92"] = 95,["94"] = 95,["95"] = 95,["97"] = 95,["98"] = 95,["100"] = 96,["101"] = 96,["103"] = 96,["104"] = 96,["106"] = 97,["107"] = 98,["108"] = 99,["109"] = 100,["110"] = 101,["111"] = 102,["112"] = 103,["113"] = 104,["114"] = 105,["115"] = 106,["116"] = 95,["117"] = 119,["118"] = 119,["119"] = 119,["121"] = 119,["122"] = 119,["124"] = 119,["125"] = 119,["127"] = 120,["128"] = 120,["130"] = 120,["131"] = 120,["133"] = 121,["134"] = 122,["135"] = 123,["138"] = 126,["139"] = 127,["140"] = 128,["141"] = 129,["142"] = 130,["143"] = 131,["144"] = 132,["145"] = 119});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local GuardUtil = ____exports.default
GuardUtil.name = "GuardUtil"
function GuardUtil.prototype.____constructor(self)
end
function GuardUtil._sl_IsUnitIdle(self, u)
    return OrderId2String(GetUnitCurrentOrder(u)) == nil
end
function GuardUtil.removeGuard(self, pet)
    local tm = DataBase:getUnitSolarData(pet).Timer
    db:clearDataByHandle("Timer", tm)
    DestroyTimer(tm)
end
function GuardUtil._sl_SetGuardTimer()
    local tm = GetExpiredTimer()
    local appData = db:getDataByHandle("Timer", tm)
    local pet = appData.Pet
    local captain = appData.Captain
    local x = GetUnitX(captain) - GetUnitX(pet)
    local y = GetUnitY(captain) - GetUnitY(pet)
    local d = x * x + y * y
    local v
    local a
    local e = nil
    local p = appData.Percent
    v = appData.GuardRanger
    if UnitStateUtil:isAlive(pet) and UnitStateUtil:isAlive(captain) then
        if d < v * v then
            if ____exports.default:_sl_IsUnitIdle(pet) and GetRandomInt(0, 100) < p then
                x = GetUnitX(captain)
                y = GetUnitY(captain)
                d = GetRandomReal(0, v)
                a = GetRandomReal(0, 360)
                IssuePointOrder(
                    pet,
                    "patrol",
                    x + d * CosBJ(a),
                    y + d * SinBJ(a)
                )
            end
        else
            v = appData.ReturnRanger
            if d < v * v then
                if ____exports.default:_sl_IsUnitIdle(pet) then
                    IssuePointOrder(
                        pet,
                        "patrol",
                        GetUnitX(captain),
                        GetUnitY(captain)
                    )
                end
            else
                v = appData.OutRanger
                if d ~= 0 and d > v * v then
                    SetUnitPosition(
                        pet,
                        GetUnitX(captain),
                        GetUnitY(captain)
                    )
                    e = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", captain, "chest")
                    DestroyEffect(e)
                else
                    IssuePointOrder(
                        pet,
                        "move",
                        GetUnitX(captain),
                        GetUnitY(captain)
                    )
                end
            end
        end
    else
        IssuePointOrder(
            pet,
            "attack",
            GetUnitX(captain),
            GetUnitY(captain)
        )
    end
end
function GuardUtil.setGuard(self, pet, captain, timeout, guardRanger, returnRanger, outRanger, percent)
    if timeout == nil then
        timeout = 2
    end
    if guardRanger == nil then
        guardRanger = 800
    end
    if returnRanger == nil then
        returnRanger = 1200
    end
    if outRanger == nil then
        outRanger = 1500
    end
    if percent == nil then
        percent = 75
    end
    local tm = CreateTimer()
    DataBase:getUnitSolarData(pet).Timer = tm
    local appData = db:getDataByHandle("Timer", tm)
    appData.Pet = pet
    appData.Captain = captain
    appData.Percent = percent
    appData.GuardRanger = guardRanger
    appData.ReturnRanger = returnRanger
    appData.OutRanger = outRanger
    TimerStart(tm, timeout, true, ____exports.default._sl_SetGuardTimer)
end
function GuardUtil.resetGuard(self, pet, captain, timeout, guardRanger, returnRanger, outRanger, percent)
    if timeout == nil then
        timeout = 2
    end
    if guardRanger == nil then
        guardRanger = 800
    end
    if returnRanger == nil then
        returnRanger = 1200
    end
    if outRanger == nil then
        outRanger = 1500
    end
    if percent == nil then
        percent = 75
    end
    local tm = DataBase:getUnitSolarData(pet).Timer
    if not IsHandle(tm) then
        log.errorWithTraceBack("该佣兵没有已经存在的佣兵跟随系统！请先使用setGuard创建跟随系统")
        return
    end
    local appData = db:getDataByHandle("Timer", tm)
    appData.Pet = pet
    appData.Captain = captain
    appData.Percent = percent
    appData.GuardRanger = guardRanger
    appData.ReturnRanger = returnRanger
    appData.OutRanger = outRanger
end
return ____exports
