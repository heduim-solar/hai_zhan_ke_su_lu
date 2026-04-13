local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 12,["28"] = 12,["29"] = 12,["31"] = 18,["32"] = 19,["33"] = 20,["34"] = 21,["35"] = 21,["36"] = 21,["37"] = 22,["38"] = 23,["39"] = 24,["41"] = 26,["43"] = 28,["44"] = 29,["46"] = 31,["47"] = 31,["48"] = 31,["49"] = 31,["50"] = 31,["51"] = 31,["52"] = 21,["53"] = 21,["54"] = 21,["56"] = 18,["58"] = 42,["59"] = 43,["60"] = 44,["61"] = 46,["62"] = 47,["63"] = 48,["64"] = 49,["65"] = 50,["66"] = 51,["69"] = 54,["70"] = 54,["71"] = 54,["72"] = 54,["73"] = 55,["74"] = 56,["75"] = 57,["76"] = 58,["77"] = 57,["78"] = 60,["79"] = 61,["80"] = 62,["81"] = 62,["82"] = 63,["83"] = 63,["84"] = 64,["85"] = 65,["86"] = 66,["87"] = 61,["88"] = 68,["89"] = 69,["90"] = 70,["91"] = 71,["92"] = 72,["93"] = 72,["94"] = 72,["95"] = 73,["96"] = 72,["97"] = 72,["98"] = 69,["101"] = 46,["102"] = 15});
local ____exports = {}
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = require("state.刷怪系统.达尔文进化基础刷怪")
local _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.default
local ____SolarDamageState = require("solar.solar-common.attribute.SolarDamageState")
local SolarDamageState = ____SolarDamageState.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____CoolDown = require("solar.solar-common.tool.CoolDown")
local CoolDown = ____CoolDown.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TipFrameUtil = require("solar.solar-common.util.frame.TipFrameUtil")
local TipFrameUtil = ____TipFrameUtil.default
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____MathUtil = require("solar.solar-common.util.math.MathUtil")
local MathUtil = ____MathUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
____exports.default = __TS__Class()
local _____51FB_6740_4E2D_5FC3_6C61_67D3_6E90_63D0_524D_5237_6700_7EC8boss = ____exports.default
_____51FB_6740_4E2D_5FC3_6C61_67D3_6E90_63D0_524D_5237_6700_7EC8boss.name = "击杀中心污染源提前刷最终boss"
function _____51FB_6740_4E2D_5FC3_6C61_67D3_6E90_63D0_524D_5237_6700_7EC8boss.prototype.____constructor(self)
    se:onUnitDeath(function(e)
        if e.trigUnitTypeIdStr == "A45g" then
            _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A:stop()
            BaseUtil.runLater(
                1,
                function(count, maxCount)
                    if count == maxCount then
                        if settings.gameDifficulty <= 3 then
                            gv.enemyLevel = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.wave_level_max - 4
                        else
                            gv.enemyLevel = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.wave_level_max - 1
                        end
                        _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.creeperLevel = gv.enemyLevel
                        _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A["刷下一波怪"](_____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A, gv.enemyLevel)
                    end
                    TipFrameUtil:showWarnText(
                        "最终BOSS:" .. tostring(maxCount - count),
                        FramePoint.center,
                        1,
                        0.026
                    )
                end,
                3
            )
        end
    end)
    --- 建筑物，每次至多受到5%的伤害。不会受到魔法伤害。每秒回血2%，击杀后终止一切阶段直接刷新当前难度下的最终BOSS。
    local coolDown = __TS__New(CoolDown, 60)
    local coolDown2 = __TS__New(CoolDown, 30)
    local coolDown3 = __TS__New(CoolDown, 15)
    SolarDamageState:addEventHandlerLast(function(____, event)
        if id2string(GetUnitTypeId(event.unit0)) == "A45g" then
            if MathUtil.distanceBetweenUnits(event.unit0, event.unit1) > 800 then
                event.resultDamage = 0
                EXSetEventDamage(0)
                event.consumed = true
                return
            end
            event.resultDamage = math.min(
                event.resultDamage,
                UnitStateUtil:getMaxLife(event.unit0) * 0.05
            )
            local unitLifeP = UnitStateUtil:getUnitLifeP(event.unit0)
            if unitLifeP < 0.1 then
                coolDown3:ifReady(function()
                    UnitStateUtil:addInvulnerableIfNot(event.unit0, 5)
                end)
            elseif unitLifeP < 0.5 then
                coolDown2:ifReady(function()
                    local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_0, ____creeper_min_1 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "creeper_min"
                    ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_0[____creeper_min_1] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_0[____creeper_min_1] + 10
                    local ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_2, ____create_creeper_pers_3 = _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config, "create_creeper_pers"
                    ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_2[____create_creeper_pers_3] = ____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A_config_2[____create_creeper_pers_3] + 5
                    PlayerUtil:message(((("|cffff0000当前刷怪速率:最低" .. tostring(_____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.creeper_min)) .. "+") .. tostring(_____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A.config.create_creeper_pers)) .. "/s")
                    TextTagUtil.textWarn("无敌保护!5s", event.unit0)
                    UnitStateUtil:addInvulnerableIfNot(event.unit0, 5)
                end)
            elseif unitLifeP < 0.8 then
                coolDown:ifReady(function()
                    TextTagUtil.textWarn("竟敢伤我！召唤大波小怪。。。", event.unit0)
                    UnitStateUtil:addInvulnerableIfNot(event.unit0, 3)
                    _____8FBE_5C14_6587_8FDB_5316_57FA_7840_5237_602A:createCurrentCreeper(
                        150,
                        function(____, unit)
                            UnitStateUtil:orderAttackTarget(unit, event.unit1)
                        end
                    )
                end)
            end
        end
    end)
end
return ____exports
