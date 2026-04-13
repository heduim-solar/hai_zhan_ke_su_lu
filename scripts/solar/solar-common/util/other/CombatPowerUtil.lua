local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 7,["11"] = 7,["12"] = 7,["14"] = 7,["15"] = 14,["16"] = 15,["17"] = 16,["18"] = 17,["19"] = 17,["20"] = 17,["21"] = 17,["22"] = 17,["23"] = 18,["24"] = 19,["25"] = 19,["26"] = 19,["27"] = 19,["28"] = 20,["31"] = 23,["34"] = 26,["35"] = 19,["36"] = 19,["37"] = 28,["38"] = 14,["39"] = 34,["40"] = 35,["41"] = 37,["42"] = 40,["43"] = 41,["44"] = 42,["45"] = 43,["46"] = 44,["48"] = 46,["49"] = 47,["50"] = 48,["51"] = 49,["52"] = 50,["53"] = 51,["55"] = 53,["56"] = 34});
local ____exports = {}
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
____exports.default = __TS__Class()
local CombatPowerUtil = ____exports.default
CombatPowerUtil.name = "CombatPowerUtil"
function CombatPowerUtil.prototype.____constructor(self)
end
function CombatPowerUtil.getPlayerCombatPower(self, playerIndex)
    local cp = 0
    GroupClear(_tempGroup)
    GroupEnumUnitsOfPlayer(
        _tempGroup,
        Player(playerIndex),
        nil
    )
    local assistant = db:getPlayerSolarData(Player(playerIndex)).assistant
    GroupUtil["for"](
        GroupUtil,
        _tempGroup,
        function(____, u)
            if assistant == u then
                return
            end
            if UnitStateUtil:getDamageMax(u) <= 1 then
                return
            end
            cp = cp + ____exports.default:getUnitCombatPower(u)
        end
    )
    return cp
end
function CombatPowerUtil.getUnitCombatPower(self, u)
    local cp = 0
    cp = cp + UnitStateUtil:getMaxLife(u) / 10
    local aspd = UnitStateUtil:getAttackSpeed(u)
    local dc = UnitStateUtil:getDamageCool(u)
    local dmgMax = UnitStateUtil:getDamageMax(u)
    if aspd > 0 and dc > 0 and dmgMax > 0 then
        cp = cp + dmgMax * (aspd / dc)
    end
    cp = cp + UnitStateUtil:getArmor(u) * 10
    cp = cp + UnitStateUtil:getMoveSpeed(u)
    if IsUnitType(u, UNIT_TYPE_HERO) then
        cp = cp + GetHeroStr(u, true)
        cp = cp + GetHeroAgi(u, true)
        cp = cp + GetHeroInt(u, true)
    end
    return math.floor(cp)
end
return ____exports
