local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 4,["7"] = 4,["8"] = 5,["9"] = 5,["10"] = 8,["11"] = 8,["12"] = 8,["14"] = 8,["15"] = 11,["16"] = 11,["17"] = 11,["19"] = 12,["20"] = 13,["21"] = 13,["22"] = 13,["23"] = 13,["24"] = 13,["25"] = 14,["27"] = 16,["28"] = 17,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 11,["35"] = 22,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 24,["42"] = 25,["43"] = 26,["44"] = 27,["45"] = 28,["46"] = 29,["47"] = 29,["48"] = 29,["49"] = 29,["50"] = 29,["51"] = 29,["52"] = 29,["54"] = 31,["56"] = 33,["57"] = 33,["58"] = 33,["59"] = 33,["60"] = 34,["61"] = 34,["62"] = 34,["63"] = 34,["64"] = 35,["65"] = 35,["66"] = 35,["67"] = 35,["68"] = 35,["69"] = 36,["70"] = 37,["71"] = 38,["72"] = 39,["73"] = 40,["74"] = 40,["75"] = 40,["76"] = 40,["77"] = 40,["79"] = 33,["80"] = 33,["81"] = 26,["82"] = 44,["83"] = 45,["84"] = 46,["87"] = 49,["88"] = 50,["89"] = 50,["90"] = 50,["91"] = 51,["92"] = 52,["93"] = 53,["94"] = 54,["96"] = 56,["97"] = 50,["98"] = 50,["99"] = 22});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____GroupUtil = require("solar.solar-common.util.unit.GroupUtil")
local GroupUtil = ____GroupUtil.default
____exports.default = __TS__Class()
local UnitRegenLifeUtil = ____exports.default
UnitRegenLifeUtil.name = "UnitRegenLifeUtil"
function UnitRegenLifeUtil.prototype.____constructor(self)
end
function UnitRegenLifeUtil.regenUnitLife(self, whichUnit, value, effectArt)
    if effectArt == nil then
        effectArt = "Abilities\\Spells\\Human\\HolyBolt\\HolyBoltSpecialArt.mdx"
    end
    if effectArt ~= nil then
        local effectHandle = AddSpecialEffect(
            effectArt,
            GetUnitX(whichUnit),
            GetUnitY(whichUnit)
        )
        DestroyEffect(effectHandle)
    end
    local life = GetUnitState(whichUnit, UNIT_STATE_LIFE)
    local maxLife = GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE)
    SetUnitState(
        whichUnit,
        UNIT_STATE_LIFE,
        math.min(life + value, maxLife)
    )
end
function UnitRegenLifeUtil.regenAllyUnitsLife(self, whichUnit, value, isPercentage, range, casterArt, effectArt, duration, interval)
    local effectHandle = AddSpecialEffect(
        casterArt or "",
        GetUnitX(whichUnit),
        GetUnitY(whichUnit)
    )
    DestroyEffect(effectHandle)
    local groupHandle = CreateGroup()
    local function regenFunc(self)
        GroupClear(groupHandle)
        if range then
            GroupEnumUnitsInRange(
                groupHandle,
                GetUnitX(whichUnit),
                GetUnitY(whichUnit),
                range,
                nil
            )
        else
            GroupEnumUnitsInRect(groupHandle, bj_mapInitialPlayableArea, nil)
        end
        GroupUtil["for"](
            GroupUtil,
            groupHandle,
            function(____, unitHandle)
                if IsUnitAlly(
                    unitHandle,
                    GetOwningPlayer(whichUnit)
                ) and IsUnitAliveBJ(unitHandle) then
                    local effectHandle = AddSpecialEffect(
                        effectArt or "",
                        GetUnitX(unitHandle),
                        GetUnitY(unitHandle)
                    )
                    DestroyEffect(effectHandle)
                    local maxLife = GetUnitState(unitHandle, UNIT_STATE_MAX_LIFE)
                    local life = GetUnitState(unitHandle, UNIT_STATE_LIFE)
                    local addLife = isPercentage and maxLife * value or value
                    SetUnitState(
                        unitHandle,
                        UNIT_STATE_LIFE,
                        math.min(life + addLife, maxLife)
                    )
                end
            end
        )
    end
    regenFunc(nil)
    if not duration or duration <= 0 then
        DestroyGroup(groupHandle)
        return
    end
    local timeout = interval or 1
    BaseUtil.onTimer(
        timeout,
        function(____, count)
            regenFunc(nil)
            if timeout * count >= duration then
                DestroyGroup(groupHandle)
                return false
            end
            return true
        end
    )
end
return ____exports
