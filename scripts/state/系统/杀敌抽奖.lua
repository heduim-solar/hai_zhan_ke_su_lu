local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["20"] = 8,["21"] = 8,["22"] = 9,["23"] = 9,["24"] = 10,["25"] = 10,["26"] = 11,["27"] = 11,["28"] = 12,["29"] = 12,["30"] = 22,["31"] = 22,["32"] = 22,["52"] = 47,["53"] = 48,["54"] = 49,["55"] = 50,["56"] = 52,["57"] = 53,["58"] = 50,["59"] = 56,["60"] = 58,["61"] = 59,["62"] = 56,["63"] = 61,["64"] = 62,["67"] = 65,["70"] = 68,["71"] = 69,["72"] = 70,["73"] = 70,["74"] = 70,["75"] = 71,["76"] = 72,["77"] = 73,["79"] = 70,["80"] = 70,["81"] = 70,["82"] = 70,["83"] = 61,["84"] = 25,["85"] = 101,["86"] = 102,["89"] = 105,["90"] = 106,["93"] = 109,["94"] = 110,["97"] = 116,["98"] = 117,["99"] = 118,["100"] = 119,["101"] = 120,["102"] = 120,["103"] = 120,["104"] = 120,["105"] = 120,["108"] = 123,["109"] = 124,["110"] = 125,["111"] = 125,["112"] = 126,["113"] = 127,["114"] = 125,["115"] = 125,["116"] = 125,["117"] = 130,["118"] = 131,["119"] = 132,["120"] = 133,["121"] = 134,["122"] = 135,["123"] = 137,["124"] = 138,["125"] = 139,["126"] = 139,["127"] = 139,["128"] = 139,["129"] = 139,["130"] = 140,["131"] = 141,["132"] = 142,["133"] = 143,["134"] = 144,["135"] = 146,["136"] = 147,["137"] = 148,["138"] = 148,["139"] = 148,["140"] = 148,["141"] = 148,["142"] = 149,["143"] = 150,["144"] = 151,["145"] = 152,["146"] = 153,["147"] = 154,["148"] = 155,["149"] = 156,["150"] = 157,["151"] = 158,["152"] = 159,["153"] = 160,["154"] = 161,["155"] = 161,["156"] = 161,["157"] = 161,["158"] = 161,["159"] = 161,["160"] = 161,["161"] = 162,["162"] = 163,["163"] = 164,["164"] = 164,["165"] = 164,["166"] = 164,["167"] = 164,["168"] = 164,["169"] = 164,["170"] = 165,["171"] = 166,["172"] = 167,["173"] = 167,["174"] = 167,["175"] = 167,["176"] = 167,["177"] = 167,["178"] = 167,["179"] = 168,["180"] = 169,["181"] = 170,["182"] = 170,["183"] = 170,["184"] = 170,["185"] = 171,["186"] = 172,["187"] = 173,["188"] = 173,["189"] = 173,["190"] = 173,["191"] = 174,["192"] = 175,["193"] = 177,["194"] = 178,["195"] = 179,["196"] = 180,["197"] = 180,["198"] = 180,["199"] = 180,["200"] = 180,["201"] = 181,["202"] = 182,["203"] = 183,["204"] = 184,["206"] = 186,["207"] = 187,["208"] = 188,["209"] = 189,["210"] = 190,["211"] = 190,["212"] = 190,["213"] = 190,["214"] = 190,["215"] = 191,["216"] = 192,["217"] = 193,["218"] = 194,["219"] = 195,["221"] = 197,["223"] = 101,["224"] = 81,["225"] = 81,["226"] = 81,["227"] = 81,["228"] = 81,["229"] = 81,["230"] = 81,["231"] = 81,["232"] = 81,["233"] = 81,["234"] = 81,["235"] = 81,["236"] = 81,["237"] = 81,["238"] = 81,["239"] = 81,["240"] = 81,["241"] = 81,["242"] = 81});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____MouseFrameUtil = require("solar.solar-common.util.frame.MouseFrameUtil")
local MouseFrameUtil = ____MouseFrameUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
local ____AsyncUtil = require("solar.solar-common.util.net.AsyncUtil")
local AsyncUtil = ____AsyncUtil.default
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
local ____DateUtil = require("solar.solar-common.util.lang.DateUtil")
local DateUtil = ____DateUtil.default
local ____MapUtil = require("util.MapUtil")
local MapUtil = ____MapUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local _____6740_654C_62BD_5956 = ____exports.default
_____6740_654C_62BD_5956.name = "杀敌抽奖"
function _____6740_654C_62BD_5956.prototype.____constructor(self)
    --- 消耗50/100/150/200/250/300……杀敌数进行抽奖。奖励如下。
    -- 1、100经验 10%
    -- 2、100~300杀敌数 10%
    -- 3、船长（高级）-海贼王（2%）
    -- 4、20~50永久航速 10%
    -- 5、胶胶果实x1 10%
    -- 6、胶胶果实x5 2%
    -- 7、当前10%全属性 2%
    -- 8、当前10%力量 5%
    -- 9、当前10%敏捷 5%
    -- 10、当前10%智力 5%
    -- 11、当前10%攻击力 5%
    -- 12、当前10%生命值 5%
    -- 13、500~20000金币 2%
    -- 14、当前10%护甲 5%
    -- 15、500~1000杀敌数 2%
    -- 16、  风平浪静10%（无事发生）
    -- 17、   100点全属性 10%
    local actorType = ActorTypeUtil:getActorType("杀敌抽奖")
    local as = ActorTypeShopUtil:warpActorItem2SellingAbility("杀敌抽奖")
    as.tooltipLabel3 = "100杀敌数"
    as.onCreated = function(____, actor)
        actor:set("tooltipLabel3", nil)
        actor.extDescribeLast1 = "|cffcccccc右键点击可以10连抽"
    end
    actorType.onBuy = function(____, actor, buyingUnit)
        actor:destroy()
        ____exports.default["抽奖"](____exports.default, buyingUnit)
    end
    as.onClick = function(____, actor, btn, triggerPlayer, actorType)
        if btn == 1 then
            return
        end
        if actor:isDisable() then
            return
        end
        actor:setDisable(true)
        local hero = PlayerUtil:getHero(triggerPlayer)
        BaseUtil.runLater(
            0.2,
            function(count, maxCount)
                ____exports.default["抽奖"](____exports.default, hero)
                if count == maxCount then
                    actor:setDisable(false)
                end
            end,
            10,
            true
        )
    end
end
_____6740_654C_62BD_5956["抽奖"] = function(self, buyingUnit)
    if not IsHandle(buyingUnit) then
        return
    end
    local player = GetOwningPlayer(buyingUnit)
    if not IsHandle(player) then
        return
    end
    local unit = PlayerUtil:getHero(player)
    if unit == nil then
        return
    end
    local pData = DataBase:getPlayerSolarData(player, false)
    local needKillCount = (pData and pData["杀敌抽奖次数"] or 1) * 100
    needKillCount = math.min(needKillCount, 1000)
    if pData == nil or pData.killCount == nil or pData.killCount < needKillCount then
        MouseFrameUtil:showTipText(
            "|cffff0000杀敌数不足!需要:" .. tostring(needKillCount),
            1,
            player
        )
        return
    end
    pData.killCount = pData.killCount - needKillCount
    pData["杀敌抽奖次数"] = (pData["杀敌抽奖次数"] or 1) + 1
    AsyncUtil:run(
        function()
            local nextText = math.min((pData and pData["杀敌抽奖次数"] or 1) * 100, 1000)
            ActorTypeShopUtil:warpActorItem2SellingAbility("杀敌抽奖").tooltipLabel3 = tostring(nextText) .. "杀敌数"
        end,
        player
    )
    local randomKey = RandomUtil.getRandomKeyByWeight(____exports.default.qzxs)
    local hero = unit
    if randomKey == 1 then
        AddHeroXP(hero, 100, true)
        MouseFrameUtil:showTipText("|cff00ff00获得100经验", 1, player)
    elseif randomKey == 2 then
        local ak = GetRandomInt(1, 3) * 100
        pData.killCount = pData.killCount + ak
        MouseFrameUtil:showTipText(
            ("|cff00ff00获得" .. tostring(ak)) .. "杀敌数",
            1,
            player
        )
    elseif randomKey == 3 then
        local actorItem = MapUtil:addActorItemForUnit("海贼王", hero)
        actorItem:set("goldCost", 1000)
        MouseFrameUtil:showTipText("|cff00ff00获得船长-海贼王杀敌数", 1, player)
    elseif randomKey == 4 then
        local ak = GetRandomInt(2, 5) * 10
        UnitStateUtil:addMoveSpeed(hero, ak)
        MouseFrameUtil:showTipText(
            ("|cff00ff00获得" .. tostring(ak)) .. "永久航速",
            1,
            player
        )
    elseif randomKey == 5 then
        local actorItem = MapUtil:addActorItemForUnit("胶胶果实", hero)
        actorItem:set("goldCost", 100)
        MouseFrameUtil:showTipText("|cff00ff00获得胶胶果实x1", 1, player)
    elseif randomKey == 6 then
        local actorItem = MapUtil:addActorItemForUnit("胶胶果实", hero, 5)
        actorItem:set("goldCost", 100)
        MouseFrameUtil:showTipText("|cff00ff00获得胶胶果实x5", 1, player)
    elseif randomKey == 7 then
        HeroUtil:addHeroPropertyP(hero, false, 0.1)
        MouseFrameUtil:showTipText("|cff00ff00获得当前10%全属性", 1, player)
    elseif randomKey == 8 then
        HeroUtil:addHeroPropertyP(
            hero,
            false,
            0.1,
            0,
            0
        )
        MouseFrameUtil:showTipText("|cff00ff00获得当前10%力量", 1, player)
    elseif randomKey == 9 then
        HeroUtil:addHeroPropertyP(
            hero,
            false,
            0,
            0.1,
            0
        )
        MouseFrameUtil:showTipText("|cff00ff00获得当前10%敏捷", 1, player)
    elseif randomKey == 10 then
        HeroUtil:addHeroPropertyP(
            hero,
            false,
            0,
            0,
            0.1
        )
        MouseFrameUtil:showTipText("|cff00ff00获得当前10%智力", 1, player)
    elseif randomKey == 11 then
        UnitStateUtil:addDamageBase(
            hero,
            UnitStateUtil:getDamageMax(hero) * 0.1
        )
        MouseFrameUtil:showTipText("|cff00ff00获得当前10%攻击力", 1, player)
    elseif randomKey == 12 then
        UnitStateUtil:addMaxLifeAndLife(
            hero,
            UnitStateUtil:getMaxLife(hero) * 0.1
        )
        MouseFrameUtil:showTipText("|cff00ff00获得当前10%生命值", 1, player)
    elseif randomKey == 13 then
        local minutes = DateUtil:getGameMinutes()
        local ak = GetRandomInt(5, minutes * 5) * 100
        PlayerUtil:addGoldState(player, ak)
        MouseFrameUtil:showTipText(
            ("|cff00ff00获得" .. tostring(ak)) .. "金币",
            1,
            player
        )
    elseif randomKey == 14 then
        local av = UnitStateUtil:getArmor(hero) * 0.1
        if av > 0 then
            UnitStateUtil:addArmor(hero, av)
        end
        MouseFrameUtil:showTipText("|cff00ff00获得当前10%护甲", 1, player)
    elseif randomKey == 15 then
        local ak = GetRandomInt(5, 10) * 100
        pData.killCount = pData.killCount + ak
        MouseFrameUtil:showTipText(
            ("|cff00ff00获得" .. tostring(ak)) .. "杀敌数",
            1,
            player
        )
    elseif randomKey == 16 then
        MouseFrameUtil:showTipText("|cff0000ff风平浪静", 1, player)
    elseif randomKey == 17 then
        HeroUtil:addHeroProperty(hero, 100)
        MouseFrameUtil:showTipText("|cff00ff00获得100点全属性", 1, player)
    else
        MouseFrameUtil:showTipText("|cff0000ff无事发生", 1, player)
    end
end
_____6740_654C_62BD_5956.qzxs = {
    [1] = 0.1,
    [2] = 0.1,
    [3] = 0.02,
    [4] = 0.1,
    [5] = 0.1,
    [6] = 0.02,
    [7] = 0.01,
    [8] = 0.01,
    [9] = 0.01,
    [10] = 0.01,
    [11] = 0.01,
    [12] = 0.01,
    [13] = 0.02,
    [14] = 0.05,
    [15] = 0.02,
    [16] = 0.1,
    [17] = 0.1
}
return ____exports
