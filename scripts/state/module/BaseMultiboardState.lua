local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 2,["8"] = 2,["9"] = 3,["10"] = 3,["11"] = 4,["12"] = 4,["13"] = 5,["14"] = 5,["15"] = 6,["16"] = 6,["17"] = 7,["18"] = 7,["19"] = 8,["20"] = 8,["21"] = 9,["22"] = 9,["23"] = 10,["24"] = 10,["25"] = 11,["26"] = 11,["27"] = 25,["28"] = 25,["29"] = 25,["31"] = 50,["32"] = 50,["33"] = 50,["34"] = 51,["35"] = 52,["36"] = 53,["37"] = 54,["38"] = 50,["39"] = 50,["40"] = 49,["41"] = 60,["42"] = 61,["43"] = 62,["44"] = 63,["45"] = 64,["46"] = 63,["47"] = 60,["48"] = 69,["49"] = 70,["50"] = 71,["51"] = 70,["52"] = 69,["53"] = 76,["54"] = 77,["55"] = 78,["56"] = 79,["57"] = 80,["58"] = 81,["59"] = 83,["60"] = 84,["61"] = 84,["62"] = 84,["63"] = 84,["65"] = 79,["66"] = 76,["67"] = 91,["68"] = 92,["69"] = 93,["70"] = 94,["72"] = 96,["73"] = 97,["75"] = 100,["76"] = 102,["77"] = 102,["78"] = 102,["79"] = 102,["80"] = 104,["81"] = 105,["82"] = 105,["83"] = 105,["84"] = 106,["85"] = 105,["86"] = 105,["87"] = 109,["88"] = 110,["89"] = 111,["90"] = 111,["91"] = 111,["92"] = 111,["93"] = 111,["94"] = 111,["95"] = 111,["96"] = 116,["97"] = 117,["98"] = 118,["99"] = 119,["100"] = 120,["101"] = 121,["102"] = 122,["104"] = 124,["105"] = 125,["106"] = 126,["107"] = 127,["109"] = 129,["110"] = 130,["111"] = 131,["112"] = 132,["114"] = 134,["115"] = 135,["116"] = 136,["117"] = 137,["118"] = 138,["119"] = 139,["120"] = 140,["122"] = 142,["123"] = 143,["124"] = 144,["125"] = 145,["127"] = 148,["129"] = 149,["130"] = 149,["131"] = 150,["132"] = 150,["133"] = 150,["134"] = 150,["135"] = 150,["136"] = 150,["137"] = 150,["138"] = 150,["139"] = 150,["140"] = 149,["143"] = 152,["144"] = 154,["145"] = 154,["146"] = 154,["147"] = 155,["148"] = 154,["149"] = 154,["150"] = 154,["151"] = 91,["152"] = 160,["153"] = 161,["154"] = 162,["155"] = 163,["156"] = 160,["157"] = 166,["158"] = 168,["159"] = 169,["160"] = 170,["161"] = 171,["162"] = 172,["164"] = 174,["165"] = 175,["166"] = 176,["167"] = 177,["169"] = 179,["171"] = 181,["172"] = 182,["174"] = 184,["176"] = 187,["177"] = 188,["179"] = 191,["180"] = 194,["181"] = 195,["182"] = 195,["183"] = 195,["184"] = 195,["185"] = 196,["186"] = 197,["187"] = 198,["188"] = 199,["189"] = 200,["190"] = 201,["191"] = 202,["192"] = 203,["193"] = 204,["194"] = 205,["195"] = 206,["199"] = 211,["200"] = 213,["201"] = 214,["202"] = 215,["203"] = 216,["204"] = 216,["205"] = 216,["206"] = 216,["207"] = 216,["208"] = 216,["210"] = 218,["211"] = 219,["212"] = 220,["213"] = 220,["214"] = 220,["215"] = 220,["216"] = 220,["217"] = 220,["219"] = 222,["220"] = 223,["221"] = 224,["222"] = 225,["224"] = 227,["225"] = 228,["226"] = 228,["227"] = 228,["228"] = 228,["229"] = 228,["230"] = 228,["231"] = 229,["232"] = 230,["234"] = 233,["235"] = 234,["236"] = 235,["237"] = 236,["238"] = 237,["239"] = 238,["240"] = 238,["242"] = 240,["243"] = 240,["244"] = 240,["245"] = 240,["246"] = 240,["247"] = 240,["249"] = 242,["250"] = 243,["251"] = 244,["252"] = 244,["253"] = 244,["254"] = 244,["255"] = 244,["256"] = 244,["258"] = 196,["259"] = 166,["260"] = 30,["261"] = 30,["262"] = 30,["263"] = 30,["264"] = 30,["265"] = 30,["266"] = 30,["267"] = 30,["268"] = 30,["269"] = 30,["270"] = 43,["271"] = 43,["272"] = 43,["273"] = 43,["274"] = 43,["275"] = 43,["276"] = 43,["277"] = 43,["278"] = 43,["279"] = 43,["280"] = 46});
local ____exports = {}
local ____trigger = require("solar.solar-common.w3ts.handles.trigger")
local Trigger = ____trigger.Trigger
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ForceUtil = require("solar.solar-common.util.game.ForceUtil")
local ForceUtil = ____ForceUtil.default
local ____player = require("solar.solar-common.w3ts.handles.player")
local MapPlayer = ____player.MapPlayer
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____CombatPowerUtil = require("solar.solar-common.util.other.CombatPowerUtil")
local CombatPowerUtil = ____CombatPowerUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ActorUtil = require("solar.solar-common.actor.util.ActorUtil")
local ActorUtil = ____ActorUtil.default
local ____MultiboardUtil = require("solar.solar-common.util.game.MultiboardUtil")
local MultiboardUtil = ____MultiboardUtil.default
____exports.default = __TS__Class()
local BaseMultiboardState = ____exports.default
BaseMultiboardState.name = "BaseMultiboardState"
function BaseMultiboardState.prototype.____constructor(self)
    BaseUtil.runLater(
        3,
        function()
            self:initVars()
            self:init()
            self:initTimerEventTrigger()
            self:initKillCountTrigger()
        end
    )
end
function BaseMultiboardState.prototype.initTimerEventTrigger(self)
    local trigger = __TS__New(Trigger)
    trigger:registerTimerEvent(5, true)
    trigger:addAction(function()
        self:refreshCombatPower()
    end)
end
function BaseMultiboardState.prototype.refreshCombatPower(self)
    ForceUtil.forUserForce(function(____, player)
        MapPlayer:fromHandle(player).solarData.combatPower = CombatPowerUtil:getPlayerCombatPower(GetPlayerId(player))
    end)
end
function BaseMultiboardState.prototype.initKillCountTrigger(self)
    local trigger = __TS__New(Trigger)
    trigger:registerAnyUnitDeathEvent()
    trigger:addAction(function()
        local player = GetOwningPlayer(GetKillingUnit())
        if IsHandle(player) and GetOwningPlayer(GetTriggerUnit()) ~= player then
            local solarData = db:getPlayerSolarData(player)
            local ____solarData_3 = solarData
            local ____temp_2 = (solarData.killCount or 0) + 1
            local ____opt_0 = AttributeUtil:getUnitAttribute(GetKillingUnit())
            ____solarData_3.killCount = ____temp_2 + math.floor(____opt_0 and ____opt_0.earn_kill_count_p or 0)
        end
    end)
end
function BaseMultiboardState.prototype.initVars(self)
    local widthConfig = ____exports.default.widthConfig
    if ____exports.default.config.showPlayerHeroName then
        widthConfig[1] = widthConfig[1] + 0.03
    end
    if ____exports.default.config.showPlayerHeroLevel then
        widthConfig[1] = widthConfig[1] + 0.01
    end
    ____exports.default.multiboard = CreateMultiboard()
    MultiboardSetRowCount(
        ____exports.default.multiboard,
        ForceUtil.getUserCount() + ____exports.default.config.headRowCount
    )
    MultiboardSetColumnCount(____exports.default.multiboard, 7)
    MultiboardUtil:forMultiboardItems(
        ____exports.default.multiboard,
        function(____, item, row, column)
            MultiboardSetItemWidth(item, widthConfig[column + 1])
        end
    )
    MultiboardMinimize(____exports.default.multiboard, false)
    MultiboardSetItemsStyle(____exports.default.multiboard, true, false)
    MultiboardSetTitleTextColor(
        ____exports.default.multiboard,
        0,
        204,
        51,
        255
    )
    local col = 0
    MultiboardUtil:setItemValue(____exports.default.multiboard, 0, col, "玩家名")
    MultiboardUtil:setItemWidth(____exports.default.multiboard, 0, col, widthConfig[1])
    if ____exports.default.config.showGold then
        col = col + 1
        MultiboardUtil:setItemValue(____exports.default.multiboard, 0, col, "黄金")
        MultiboardUtil:setItemWidth(____exports.default.multiboard, 0, col, widthConfig[2])
    end
    if ____exports.default.config.showLumber then
        col = col + 1
        MultiboardUtil:setItemValue(____exports.default.multiboard, 0, col, "木材")
        MultiboardUtil:setItemWidth(____exports.default.multiboard, 0, col, widthConfig[3])
    end
    if ____exports.default.config.showCombatPower then
        col = col + 1
        MultiboardUtil:setItemValue(____exports.default.multiboard, 0, col, "战力")
        MultiboardUtil:setItemWidth(____exports.default.multiboard, 0, col, widthConfig[4])
    end
    col = col + 1
    MultiboardUtil:setItemValue(____exports.default.multiboard, 0, col, "杀敌")
    MultiboardUtil:setItemWidth(____exports.default.multiboard, 0, col, widthConfig[5])
    if ____exports.default.config.showSwallowCount then
        col = col + 1
        MultiboardUtil:setItemValue(____exports.default.multiboard, 0, col, "吞噬")
        MultiboardUtil:setItemWidth(____exports.default.multiboard, 0, col, widthConfig[6])
    end
    if ____exports.default.config.showEndlessLevel then
        col = col + 1
        MultiboardUtil:setItemValue(____exports.default.multiboard, 0, col, "无尽等级")
        MultiboardUtil:setItemWidth(____exports.default.multiboard, 0, col, widthConfig[7])
    end
    MultiboardSetColumnCount(____exports.default.multiboard, col + 1)
    do
        local i = 0
        while i <= col do
            MultiboardUtil:setItemColor(
                ____exports.default.multiboard,
                0,
                i,
                0,
                204,
                51,
                255
            )
            i = i + 1
        end
    end
    MultiboardDisplay(____exports.default.multiboard, true)
    BaseUtil.runLater(
        3,
        function()
            MultiboardDisplay(____exports.default.multiboard, true)
        end,
        10
    )
end
function BaseMultiboardState.prototype.init(self)
    local trigger = __TS__New(Trigger)
    trigger:registerTimerEvent(1, true)
    trigger:addAction(self.refresh)
end
function BaseMultiboardState.prototype.refresh()
    local gameTime = BaseUtil.getGameTime()
    local title = (I2S(gameTime / 60) .. ":") .. I2S(gameTime % 60)
    if gv.enemyLevel then
        local level_str = ("波数" .. "：") .. tostring(gv.enemyLevel)
        title = (title .. "  ") .. level_str
    end
    if gv.enemyCount then
        local life_str = ("敌人" .. "：") .. tostring(gv.enemyCount or 0)
        if settings.enemyUpperLimit then
            life_str = (life_str .. "/") .. tostring(settings.enemyUpperLimit)
        end
        title = (title .. "  ") .. life_str
    end
    if settings.gameMode and #settings.gameMode > 0 then
        title = (((title .. "  ") .. settings.gameMode) .. "-N") .. tostring(settings.gameDifficulty)
    else
        title = (title .. "  N") .. tostring(settings.gameDifficulty)
    end
    if settings.isEndlessMode == true then
        title = title .. "(无尽)"
    end
    MultiboardSetTitleText(____exports.default.multiboard, title)
    local i = 0
    MultiboardSetRowCount(
        ____exports.default.multiboard,
        ForceUtil.getUserCount() + ____exports.default.config.headRowCount
    )
    ForceUtil.forUserForce(function(____, player)
        i = i + 1
        local row = i + ____exports.default.config.headRowCount - 1
        local col = 0
        local name = GetPlayerName(player)
        if ____exports.default.config.showPlayerHeroName then
            local hero = PlayerUtil:getHero(player)
            if IsHandle(hero) then
                name = ((name .. " (") .. tostring(GetUnitName(hero))) .. ")"
                if ____exports.default.config.showPlayerHeroLevel then
                    name = (name .. " Lv.") .. tostring(GetUnitLevel(hero))
                end
            end
        end
        MultiboardUtil:setItemValue(____exports.default.multiboard, row, col, name)
        local psd = db:getPlayerSolarData(player)
        if ____exports.default.config.showGold then
            col = col + 1
            MultiboardUtil:setItemValue(
                ____exports.default.multiboard,
                row,
                col,
                TextUtil:toCnUnit(GetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD))
            )
        end
        if ____exports.default.config.showLumber then
            col = col + 1
            MultiboardUtil:setItemValue(
                ____exports.default.multiboard,
                row,
                col,
                tostring(GetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER)) .. ""
            )
        end
        if ____exports.default.config.showCombatPower then
            col = col + 1
            local combatPowerStr = TextUtil:toCnUnit(psd.combatPower or 0)
            MultiboardUtil:setItemValue(____exports.default.multiboard, row, col, combatPowerStr)
        end
        col = col + 1
        MultiboardUtil:setItemValue(
            ____exports.default.multiboard,
            row,
            col,
            tostring(psd.killCount or 0)
        )
        if psd.killCount then
            PlayerUtil:setFoodUsed(player, psd.killCount)
        end
        if ____exports.default.config.showSwallowCount then
            col = col + 1
            local hero = PlayerUtil:getHero(player)
            local tssl = 0
            if IsHandle(hero) then
                local ____opt_4 = ActorUtil:getUnitAllActorListByClass(hero, "吞噬")
                tssl = ____opt_4 and #____opt_4 or 0
            end
            MultiboardUtil:setItemValue(
                ____exports.default.multiboard,
                row,
                col,
                tostring(tssl)
            )
        end
        if ____exports.default.config.showEndlessLevel then
            col = col + 1
            MultiboardUtil:setItemValue(
                ____exports.default.multiboard,
                row,
                col,
                tostring(DzAPI_Map_GetStoredInteger(player, "endless_level") or 0)
            )
        end
    end)
end
BaseMultiboardState.config = {
    headRowCount = 1,
    showPlayerHeroName = false,
    showPlayerHeroLevel = false,
    showGold = true,
    showLumber = false,
    showCombatPower = true,
    showSwallowCount = false,
    showEndlessLevel = false
}
BaseMultiboardState.widthConfig = {
    0.05,
    0.025,
    0.025,
    0.025,
    0.025,
    0.015,
    0.015,
    0.015
}
BaseMultiboardState.multiboard = nil
return ____exports
