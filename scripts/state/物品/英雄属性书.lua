local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 6,["15"] = 6,["16"] = 6,["18"] = 18,["19"] = 19,["20"] = 20,["21"] = 21,["24"] = 24,["25"] = 25,["26"] = 26,["28"] = 28,["29"] = 29,["32"] = 33,["33"] = 34,["34"] = 35,["35"] = 36,["36"] = 36,["37"] = 36,["38"] = 36,["39"] = 36,["40"] = 38,["41"] = 39,["42"] = 39,["43"] = 39,["44"] = 39,["45"] = 39,["46"] = 40,["47"] = 41,["49"] = 43,["51"] = 18,["52"] = 17,["53"] = 14});
local ____exports = {}
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local _____82F1_96C4_5C5E_6027_4E66 = ____exports.default
_____82F1_96C4_5C5E_6027_4E66.name = "英雄属性书"
function _____82F1_96C4_5C5E_6027_4E66.prototype.____constructor(self)
    se:onUnitPickupItem(function(e)
        local itemIdStr = e.manipulatedItemTypeIdStr
        local cData = ____exports.default.config[itemIdStr]
        if not cData then
            return
        end
        local hero = e.trigUnit
        if not HeroUtil:isHero(hero) then
            hero = SelectUtil.getAnHero(e.trigUnitOwnerId)
        end
        if not IsHandle(hero) then
            PlayerUtil:text(e.trigUnitOwner, "没有找到英雄!")
            return
        end
        if cData.type == "HP" then
            UnitStateUtil:addMaxLifeAndLife(hero, cData.val)
        elseif cData.type == "LV" then
            SetHeroLevel(
                hero,
                GetHeroLevel(hero) + cData.val,
                true
            )
        elseif cData.type == "EXP" then
            SetHeroXP(
                hero,
                GetHeroXP(hero) + cData.val,
                true
            )
        elseif cData.type == "FULLP" then
            HeroUtil:addHeroProperty(hero, cData.val, cData.val, cData.val)
        else
            HeroUtil:addHeroPropertyByKey(hero, cData.type, cData.val)
        end
    end)
end
_____82F1_96C4_5C5E_6027_4E66.config = {}
return ____exports
