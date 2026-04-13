local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 7,["7"] = 7,["8"] = 8,["9"] = 8,["10"] = 9,["11"] = 9,["12"] = 10,["13"] = 10,["14"] = 11,["15"] = 11,["16"] = 12,["17"] = 12,["18"] = 23,["19"] = 23,["20"] = 23,["21"] = 35,["22"] = 35,["23"] = 35,["25"] = 36,["26"] = 37,["27"] = 38,["28"] = 39,["31"] = 43,["32"] = 44,["33"] = 45,["34"] = 46,["35"] = 47,["36"] = 48,["37"] = 49,["38"] = 50,["39"] = 52,["40"] = 52,["41"] = 52,["42"] = 54,["43"] = 56,["44"] = 57,["46"] = 52,["47"] = 52,["49"] = 62,["50"] = 62,["51"] = 62,["52"] = 64,["53"] = 65,["54"] = 67,["57"] = 70,["58"] = 62,["59"] = 62,["60"] = 43,["61"] = 74,["62"] = 75,["63"] = 76,["66"] = 81,["67"] = 82,["68"] = 82,["69"] = 82,["70"] = 83,["71"] = 84,["72"] = 82,["73"] = 82,["74"] = 74,["75"] = 88,["76"] = 89,["77"] = 89,["78"] = 89,["79"] = 90,["80"] = 90,["81"] = 90,["82"] = 91,["83"] = 92,["84"] = 92,["85"] = 92,["86"] = 93,["87"] = 92,["88"] = 92,["89"] = 92,["90"] = 95,["91"] = 95,["92"] = 95,["93"] = 95,["94"] = 95,["95"] = 95,["96"] = 95,["98"] = 98,["99"] = 98,["100"] = 98,["101"] = 98,["102"] = 98,["103"] = 98,["104"] = 98,["106"] = 90,["107"] = 90,["108"] = 90,["109"] = 90,["110"] = 89,["111"] = 89,["113"] = 35,["114"] = 114,["115"] = 116,["116"] = 117,["117"] = 118,["118"] = 120,["119"] = 121,["120"] = 122,["121"] = 123,["122"] = 124,["126"] = 128,["128"] = 130,["130"] = 132,["131"] = 133,["132"] = 134,["133"] = 136,["134"] = 136,["135"] = 136,["136"] = 138,["137"] = 139,["138"] = 140,["139"] = 136,["140"] = 136,["141"] = 117,["142"] = 144,["143"] = 145,["144"] = 146,["145"] = 147,["146"] = 147,["147"] = 148,["148"] = 149,["150"] = 151,["151"] = 152,["153"] = 154,["155"] = 145,["156"] = 114,["157"] = 25});
local ____exports = {}
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____UnitDeathTimeUtil = require("solar.solar-common.util.unit.UnitDeathTimeUtil")
local UnitDeathTimeUtil = ____UnitDeathTimeUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____ItemUtil = require("solar.solar-common.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
____exports.default = __TS__Class()
local SolarDataClearState = ____exports.default
SolarDataClearState.name = "SolarDataClearState"
function SolarDataClearState.prototype.____constructor(self, delay)
    if delay == nil then
        delay = ____exports.default.config.delay
    end
    ____exports.default.config.delay = delay
    handleReuseMinTime = math.min(delay, ____exports.default.config.heroDealy) - 1
    if handleReuseMinTime < 8 then
        log.errorWithTraceBack("清理的延迟不得小于8秒")
        return
    end
    se:onUnitDeath(function(e)
        local whichUnit = e.trigUnit
        handle_ref(whichUnit)
        UnitDeathTimeUtil:setDeathTime(whichUnit, _g_time)
        local rDelay = ____exports.default.config.delay
        if e.isHeroUnitTrig then
            rDelay = ____exports.default.config.heroDealy
        elseif ____exports.default.config.removeUnitDelay > 1 then
            BaseUtil.runLater(
                ____exports.default.config.removeUnitDelay,
                function()
                    if not UnitStateUtil:isAlive(whichUnit) then
                        UnitDeathTimeUtil:clearDeathTime(whichUnit)
                        RemoveUnit(whichUnit)
                    end
                end
            )
        end
        BaseUtil.runLater(
            rDelay,
            function()
                if not UnitStateUtil:isAlive(whichUnit) then
                    if not UnitDeathTimeUtil:hasDeathTime(whichUnit) or UnitDeathTimeUtil:isTimeOfDeathExceeded(whichUnit, rDelay - 0.001) then
                        DataBase:clearUnitSolarData(whichUnit)
                    end
                end
                handle_unref(whichUnit)
            end
        )
    end)
    se:onUnitPawnItem(function(e)
        local item = GetSoldItem()
        if not IsHandle(item) then
            return
        end
        handle_ref(item)
        BaseUtil.runLater(
            ____exports.default.config.removeUnitDelay,
            function()
                handle_unref(item)
                RemoveItem(item)
            end
        )
    end)
    if ____exports.default.config.openClearCmd then
        se:playerChat(
            "-c",
            function()
                BaseUtil.runLater(
                    1,
                    function(count, maxCount)
                        if count == maxCount then
                            ItemUtil:forItemsInRect(
                                GetPlayableMapRect(),
                                function(item)
                                    RemoveItem(item)
                                end,
                                false
                            )
                            DisplayTimedTextToPlayer(
                                GetLocalPlayer(),
                                0,
                                0,
                                10,
                                "|cffff0000【系统提示】清理地面物品完毕!"
                            )
                        else
                            DisplayTimedTextToPlayer(
                                GetLocalPlayer(),
                                0,
                                0,
                                10,
                                "|cffff0000【系统提示】清理地面物品倒计时:" .. tostring(maxCount - count)
                            )
                        end
                    end,
                    6,
                    true
                )
            end
        )
    end
end
function SolarDataClearState._sl_hookClearHandle(self)
    local jassRemoveUnit = RemoveUnit
    _G.RemoveUnit = function(whichUnit)
        if IsHandle(whichUnit) then
            local actorList = ActorUtil:getUnitAllActorList(whichUnit)
            if actorList ~= nil and #actorList > 0 then
                for ____, actor in ipairs(actorList) do
                    if actor ~= nil then
                        actor:destroy(true)
                    end
                end
            end
            DataBase:clearUnitSolarData(whichUnit)
        else
            log.errorWithTraceBack("你正在删除一个空的单位handle！请使用IsHandle判断是否有值!")
        end
        handle_ref(whichUnit)
        UnitDeathTimeUtil:setDeathTime(whichUnit)
        jassRemoveUnit(whichUnit)
        BaseUtil.runLater(
            handleReuseMinTime + 2,
            function()
                DataBase:clearUnitSolarData(whichUnit)
                UnitDeathTimeUtil:clearDeathTime(whichUnit)
                handle_unref(whichUnit)
            end
        )
    end
    local jassRemoveItem = RemoveItem
    _G.RemoveItem = function(whichItem)
        if IsHandle(whichItem) then
            local ____opt_0 = DataBase:getItemSolarData(whichItem, false)
            local actor = ____opt_0 and ____opt_0._SL_solarActorItem
            if actor then
                actor:destroy(true)
            end
            DataBase:clearItemSolarData(whichItem)
            jassRemoveItem(whichItem)
        else
            log.errorWithTraceBack("你正在删除一个空的物品handle！请使用IsHandle判断是否有值!")
        end
    end
end
SolarDataClearState.config = {removeUnitDelay = 10, delay = 32, heroDealy = 200, openClearCmd = true}
return ____exports
