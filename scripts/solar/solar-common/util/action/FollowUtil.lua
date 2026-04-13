local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 6,["11"] = 6,["12"] = 9,["13"] = 9,["14"] = 9,["16"] = 9,["17"] = 12,["18"] = 12,["19"] = 12,["21"] = 12,["22"] = 12,["24"] = 12,["25"] = 12,["27"] = 12,["28"] = 12,["30"] = 12,["31"] = 12,["33"] = 13,["34"] = 14,["35"] = 15,["36"] = 15,["37"] = 15,["38"] = 16,["39"] = 17,["40"] = 18,["41"] = 19,["42"] = 20,["43"] = 21,["44"] = 22,["45"] = 23,["46"] = 24,["47"] = 25,["48"] = 26,["49"] = 27,["50"] = 28,["51"] = 29,["52"] = 29,["53"] = 29,["54"] = 29,["55"] = 29,["56"] = 29,["59"] = 32,["60"] = 33,["61"] = 34,["62"] = 35,["63"] = 35,["64"] = 35,["65"] = 35,["66"] = 35,["67"] = 35,["70"] = 39,["71"] = 40,["72"] = 41,["73"] = 41,["74"] = 41,["75"] = 41,["76"] = 41,["77"] = 42,["78"] = 43,["80"] = 46,["81"] = 46,["82"] = 46,["83"] = 46,["84"] = 46,["85"] = 46,["90"] = 51,["91"] = 51,["92"] = 51,["93"] = 51,["94"] = 51,["95"] = 51,["96"] = 52,["97"] = 53,["98"] = 54,["100"] = 57,["101"] = 15,["102"] = 15,["103"] = 12});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____order = require("solar.solar-common.w3ts.globals.order")
local OrderId = ____order.OrderId
____exports.default = __TS__Class()
local FollowUtil = ____exports.default
FollowUtil.name = "FollowUtil"
function FollowUtil.prototype.____constructor(self)
end
function FollowUtil.follow(self, pet, captain, timeout, guardRanger, returnRanger, outRanger, probability)
    if timeout == nil then
        timeout = 1
    end
    if guardRanger == nil then
        guardRanger = 200
    end
    if returnRanger == nil then
        returnRanger = 300
    end
    if outRanger == nil then
        outRanger = 400
    end
    if probability == nil then
        probability = 1
    end
    handle_ref(pet)
    handle_ref(captain)
    BaseUtil.onTimer(
        timeout,
        function()
            local captainX = GetUnitX(captain)
            local captainY = GetUnitY(captain)
            local petX = GetUnitX(pet)
            local petY = GetUnitY(pet)
            local distance = MathUtil.distanceBetweenPoints(petX, petY, captainX, captainY)
            local range = guardRanger
            if IsUnitAliveBJ(pet) and UnitAlive(captain) then
                if distance < range then
                    if not OrderId2String(GetUnitCurrentOrder(pet)) and GetRandomReal(0, 1) < probability then
                        local randomDistance = GetRandomReal(0, distance)
                        local randomAngle = GetRandomReal(0, 360)
                        local x = GetUnitX(captain) + randomDistance * CosBJ(randomAngle)
                        local y = GetUnitY(captain) + randomDistance * SinBJ(randomAngle)
                        IssuePointOrder(
                            pet,
                            OrderId2String(OrderId.Patrol),
                            x,
                            y
                        )
                    end
                else
                    range = returnRanger
                    if distance < range then
                        if not OrderId2String(GetUnitCurrentOrder(pet)) then
                            IssuePointOrder(
                                pet,
                                OrderId2String(OrderId.Patrol),
                                GetUnitX(captain),
                                GetUnitY(captain)
                            )
                        end
                    else
                        range = outRanger
                        if distance ~= 0 and distance > range then
                            SetUnitPosition(
                                pet,
                                GetUnitX(captain),
                                GetUnitY(captain)
                            )
                            local effectHandle = AddSpecialEffectTarget("Abilities\\Spells\\Human\\MassTeleport\\MassTeleportTarget.mdl", captain, "chest")
                            DestroyEffect(effectHandle)
                        else
                            IssuePointOrder(
                                pet,
                                OrderId2String(OrderId.Move),
                                GetUnitX(captain),
                                GetUnitY(captain)
                            )
                        end
                    end
                end
            else
                IssuePointOrder(
                    pet,
                    OrderId2String(OrderId.Attack),
                    GetUnitX(captain),
                    GetUnitY(captain)
                )
                handle_unref(pet)
                handle_unref(captain)
                return false
            end
            return true
        end
    )
end
return ____exports
