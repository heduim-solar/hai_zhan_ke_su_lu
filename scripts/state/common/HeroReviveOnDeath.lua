local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 4,["11"] = 4,["12"] = 5,["13"] = 5,["14"] = 6,["15"] = 6,["16"] = 7,["17"] = 7,["18"] = 8,["19"] = 8,["20"] = 9,["21"] = 9,["22"] = 10,["23"] = 10,["24"] = 12,["25"] = 12,["26"] = 12,["28"] = 17,["29"] = 18,["30"] = 20,["31"] = 21,["32"] = 21,["33"] = 21,["34"] = 21,["35"] = 22,["36"] = 23,["37"] = 23,["38"] = 23,["39"] = 23,["40"] = 23,["41"] = 23,["42"] = 24,["43"] = 25,["44"] = 26,["45"] = 27,["48"] = 32,["49"] = 32,["50"] = 32,["51"] = 33,["52"] = 36,["53"] = 37,["54"] = 40,["55"] = 41,["56"] = 42,["57"] = 43,["58"] = 44,["59"] = 45,["60"] = 46,["61"] = 47,["62"] = 48,["64"] = 51,["65"] = 52,["67"] = 54,["68"] = 56,["70"] = 59,["71"] = 59,["72"] = 59,["73"] = 59,["74"] = 60,["75"] = 60,["76"] = 60,["77"] = 61,["78"] = 62,["80"] = 64,["81"] = 64,["82"] = 64,["83"] = 64,["84"] = 64,["85"] = 64,["86"] = 66,["87"] = 67,["88"] = 68,["89"] = 70,["90"] = 60,["91"] = 60,["93"] = 32,["94"] = 32,["96"] = 17,["97"] = 15});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____TimerDialogUtil = require("solar.solar-common.util.game.TimerDialogUtil")
local TimerDialogUtil = ____TimerDialogUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____l__8D77_59CB_70B9 = require("_sl_editor.l_起始点")
local ____l__8D77_59CB_70B9 = ____l__8D77_59CB_70B9["l_起始点"]
local ____ActorItemUtil = require("solar.solar-common.actor.util.ActorItemUtil")
local ActorItemUtil = ____ActorItemUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
____exports.default = __TS__Class()
local HeroReviveOnDeath = ____exports.default
HeroReviveOnDeath.name = "HeroReviveOnDeath"
function HeroReviveOnDeath.prototype.____constructor(self)
    se:onUnitDeath(function(e)
        if e.trigUnitOwnerId < 4 and e.isHeroUnitTrig then
            local hero = e.trigUnit
            local playerAttribute = AttributeUtil:getPlayerAttribute(
                GetOwningPlayer(hero),
                false
            )
            if playerAttribute and playerAttribute["死亡后立刻复活"] and playerAttribute["死亡后立刻复活"] > 0 then
                ReviveHero(
                    hero,
                    GetUnitX(hero),
                    GetUnitY(hero),
                    true
                )
                SetUnitLifePercentBJ(hero, 100)
                SetUnitManaPercentBJ(hero, 100)
                playerAttribute["死亡后立刻复活"] = playerAttribute["死亡后立刻复活"] - 1
                TextTagUtil.textWarn("消耗一次死亡后立刻复活", hero)
                return
            end
            BaseUtil.runLater(
                0.11,
                function()
                    if not UnitAlive(hero) and not IsUnitType(hero, UNIT_TYPE_STRUCTURE) then
                        local time = 1 + GetHeroLevel(hero)
                        if ActorUtil:isUnitHasActor(hero, "鲁灰") or ActorUtil:isUnitHasActor(hero, "尼卡·鲁灰") then
                            time = 3
                        elseif ActorItemUtil:isUnitHasActorItem(hero, "胶胶果实") then
                            time = 5
                            local actorItem = ActorItemUtil:getUnitActorItem(hero, "胶胶果实")
                            actorItem:addUses(-1)
                        elseif ActorItemUtil:isUnitHasActorItem(hero, "重生十字章") then
                            time = 1
                            local actorItem = ActorItemUtil:getUnitActorItem(hero, "重生十字章")
                            actorItem:addUses(-1)
                        end
                        if ActorUtil:isUnitHasActor(hero, "神之号主炮") then
                            local ____ = time * 2 + 10
                        end
                        if gv["深度海域层数"] and gv["深度海域层数"] > 0 and time > 5 then
                            time = time + 10
                        end
                        TimerDialogUtil:show(
                            GetUnitName(hero),
                            time
                        )
                        BaseUtil.runLater(
                            time,
                            function()
                                if gv["深度海域层数"] == nil or gv["深度海域层数"] == 0 then
                                    UnitUtil.transfer(hero, ____l__8D77_59CB_70B9[1].x, ____l__8D77_59CB_70B9[1].y)
                                end
                                ReviveHero(
                                    hero,
                                    GetUnitX(hero),
                                    GetUnitY(hero),
                                    true
                                )
                                SetUnitLifePercentBJ(hero, 100)
                                SetUnitManaPercentBJ(hero, 100)
                                BJDebugMsg(tostring(GetUnitName(hero)) .. "复活了!")
                                UnitStateUtil:addInvulnerableIfNot(hero, 3)
                            end
                        )
                    end
                end
            )
        end
    end)
end
return ____exports
