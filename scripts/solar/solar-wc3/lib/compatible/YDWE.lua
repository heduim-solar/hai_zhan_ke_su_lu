local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 6,["9"] = 6,["10"] = 6,["12"] = 6,["13"] = 9,["14"] = 11,["15"] = 12,["16"] = 12,["17"] = 12,["18"] = 12,["19"] = 11,["20"] = 17,["21"] = 18,["22"] = 17,["23"] = 23,["24"] = 24,["25"] = 23,["26"] = 28,["27"] = 29,["28"] = 29,["29"] = 29,["30"] = 29,["31"] = 29,["32"] = 28,["33"] = 32,["34"] = 33,["35"] = 33,["36"] = 33,["37"] = 33,["38"] = 32,["39"] = 38,["40"] = 40,["41"] = 40,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 40,["46"] = 38,["47"] = 44,["48"] = 45,["49"] = 45,["50"] = 45,["51"] = 45,["52"] = 46,["53"] = 46,["54"] = 46,["55"] = 46,["56"] = 44,["57"] = 49,["58"] = 50,["59"] = 50,["60"] = 50,["61"] = 51,["62"] = 52,["64"] = 50,["65"] = 50,["66"] = 49,["67"] = 58,["68"] = 59,["69"] = 59,["70"] = 59,["71"] = 60,["72"] = 61,["74"] = 59,["75"] = 59,["76"] = 58,["77"] = 68,["78"] = 70,["79"] = 70,["80"] = 70,["81"] = 73,["82"] = 74,["83"] = 75,["84"] = 76,["85"] = 77,["86"] = 79,["87"] = 80,["88"] = 81,["89"] = 83,["90"] = 84,["91"] = 85,["92"] = 86,["93"] = 87,["94"] = 87,["95"] = 87,["96"] = 87,["97"] = 87,["98"] = 87,["101"] = 91,["102"] = 92,["103"] = 93,["104"] = 94,["105"] = 94,["106"] = 94,["107"] = 94,["108"] = 94,["109"] = 94,["112"] = 97,["113"] = 98,["114"] = 99,["115"] = 99,["116"] = 99,["117"] = 99,["118"] = 99,["119"] = 100,["120"] = 101,["122"] = 103,["123"] = 103,["124"] = 103,["125"] = 103,["126"] = 103,["127"] = 103,["132"] = 109,["133"] = 109,["134"] = 109,["135"] = 109,["136"] = 109,["137"] = 109,["138"] = 110,["140"] = 114,["141"] = 70,["142"] = 70,["143"] = 68,["144"] = 120,["145"] = 122,["146"] = 120,["147"] = 126,["148"] = 128,["149"] = 128,["150"] = 128,["151"] = 128,["152"] = 128,["153"] = 126,["154"] = 133,["155"] = 135,["156"] = 135,["157"] = 135,["158"] = 135,["159"] = 135,["160"] = 135,["161"] = 133,["162"] = 9});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local YDWE = ____exports.default
YDWE.name = "YDWE"
function YDWE.prototype.____constructor(self)
end
function YDWE._sl_init(self)
    _G.YDWEAngleBetweenUnits = function(fromUnit, toUnit)
        return bj_RADTODEG * Atan2(
            GetUnitY(toUnit) - GetUnitY(fromUnit),
            GetUnitX(toUnit) - GetUnitX(fromUnit)
        )
    end
    _G.YDWEDistanceBetweenUnits = function(a, b)
        return SquareRoot((GetUnitX(a) - GetUnitX(b)) * (GetUnitX(a) - GetUnitX(b)) + (GetUnitY(a) - GetUnitY(b)) * (GetUnitY(a) - GetUnitY(b)))
    end
    _G.YDWESetEventDamage = function(amount)
        return EXSetEventDamage(amount)
    end
    _G.YDWESetUnitAbilityState = function(u, abilcode, state_type, value)
        return EXSetAbilityState(
            EXGetUnitAbility(u, abilcode),
            state_type,
            value
        )
    end
    _G.YDWEGetUnitAbilityState = function(u, abilcode, state_type)
        return EXGetAbilityState(
            EXGetUnitAbility(u, abilcode),
            state_type
        )
    end
    _G.YDWESetUnitAbilityDataReal = function(u, abilcode, level, data_type, value)
        return EXSetAbilityDataReal(
            EXGetUnitAbility(u, abilcode),
            level,
            data_type,
            value
        )
    end
    _G.YDWEFlyEnable = function(u)
        UnitAddAbility(
            u,
            FourCC("Amrf")
        )
        UnitRemoveAbility(
            u,
            FourCC("Amrf")
        )
    end
    _G.YDWETimerRemoveUnit = function(time, u)
        BaseUtil.runLater(
            time,
            function()
                if IsHandle(u) then
                    RemoveUnit(u)
                end
            end
        )
    end
    _G.YDWETimerDestroyEffect = function(time, e)
        BaseUtil.runLater(
            time,
            function()
                if IsHandle(e) then
                    DestroyEffect(e)
                end
            end
        )
    end
    _G.YDWESetGuard = function(pet, captain, timeout, guardRanger, returnRanger, outRanger, percent)
        BaseUtil.onTimer(
            timeout,
            function()
                local p = percent
                local x = GetUnitX(captain) - GetUnitX(pet)
                local y = GetUnitY(captain) - GetUnitY(pet)
                local d = x * x + y * y
                local v = guardRanger
                if UnitAlive(pet) and UnitAlive(captain) then
                    if d < v * v then
                        if OrderId2String(GetUnitCurrentOrder(pet)) == nil and GetRandomInt(0, 100) < p then
                            local x = GetUnitX(captain)
                            local y = GetUnitY(captain)
                            d = GetRandomReal(0, v)
                            local a = GetRandomReal(0, 360)
                            IssuePointOrder(
                                pet,
                                "patrol",
                                x + d * CosBJ(a),
                                y + d * SinBJ(a)
                            )
                        end
                    else
                        v = returnRanger
                        if d < v * v then
                            if OrderId2String(GetUnitCurrentOrder(pet)) == nil then
                                IssuePointOrder(
                                    pet,
                                    "patrol",
                                    GetUnitX(captain),
                                    GetUnitY(captain)
                                )
                            end
                        else
                            v = outRanger
                            if d ~= 0 and d > v * v then
                                SetUnitPosition(
                                    pet,
                                    GetUnitX(captain),
                                    GetUnitY(captain)
                                )
                                local e = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", captain, "chest")
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
                    return false
                end
                return true
            end
        )
    end
    _G.YDWEGetItemDataString = function(ItemTypeId, Type)
        return EXGetItemDataString(ItemTypeId, Type)
    end
    _G.YDWEGetUnitAbilityDataString = function(u, abilcode, level, data_type)
        return EXGetAbilityDataString(
            EXGetUnitAbility(u, abilcode),
            level,
            data_type
        )
    end
    _G.YDWESetUnitAbilityDataString = function(u, abilcode, level, data_type, value)
        EXSetAbilityDataString(
            EXGetUnitAbility(u, abilcode),
            level,
            data_type,
            value
        )
    end
end
return ____exports
