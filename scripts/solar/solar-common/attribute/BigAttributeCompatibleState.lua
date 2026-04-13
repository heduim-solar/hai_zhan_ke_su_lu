local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 6,["17"] = 6,["18"] = 7,["19"] = 7,["35"] = 28,["36"] = 29,["37"] = 30,["38"] = 30,["39"] = 30,["41"] = 34,["42"] = 35,["45"] = 38,["46"] = 39,["47"] = 40,["48"] = 41,["49"] = 33,["50"] = 47,["51"] = 49,["52"] = 50,["53"] = 51,["54"] = 51,["55"] = 51,["56"] = 51,["57"] = 51,["58"] = 53,["59"] = 55,["60"] = 56,["62"] = 50,["63"] = 60,["64"] = 61,["65"] = 62,["66"] = 62,["67"] = 62,["68"] = 62,["69"] = 62,["70"] = 64,["71"] = 61,["72"] = 67,["73"] = 68,["74"] = 69,["75"] = 69,["76"] = 69,["77"] = 69,["78"] = 69,["79"] = 71,["80"] = 74,["81"] = 75,["83"] = 68,["84"] = 80,["85"] = 81,["86"] = 82,["87"] = 82,["88"] = 83,["89"] = 84,["91"] = 86,["92"] = 81,["93"] = 88,["94"] = 89,["95"] = 90,["96"] = 90,["97"] = 91,["98"] = 92,["100"] = 94,["101"] = 89,["102"] = 96,["103"] = 97,["104"] = 98,["105"] = 98,["106"] = 99,["107"] = 100,["109"] = 102,["110"] = 97,["111"] = 47,["112"] = 110,["113"] = 112,["114"] = 113,["115"] = 115,["116"] = 116,["117"] = 116,["118"] = 116,["119"] = 116,["120"] = 116,["121"] = 117,["122"] = 118,["123"] = 119,["124"] = 119,["125"] = 119,["126"] = 119,["127"] = 119,["128"] = 120,["130"] = 122,["132"] = 113,["133"] = 126,["134"] = 127,["135"] = 129,["136"] = 130,["137"] = 130,["138"] = 131,["139"] = 132,["140"] = 133,["141"] = 134,["143"] = 136,["145"] = 143,["146"] = 144,["147"] = 145,["148"] = 146,["149"] = 147,["150"] = 148,["151"] = 149,["152"] = 150,["154"] = 152,["155"] = 153,["156"] = 155,["157"] = 155,["158"] = 157,["159"] = 158,["160"] = 159,["161"] = 160,["163"] = 162,["165"] = 164,["166"] = 166,["167"] = 168,["168"] = 169,["170"] = 173,["171"] = 174,["172"] = 175,["173"] = 175,["174"] = 176,["175"] = 177,["176"] = 178,["177"] = 179,["178"] = 180,["179"] = 181,["180"] = 182,["182"] = 184,["184"] = 186,["186"] = 188,["187"] = 189,["188"] = 190,["189"] = 191,["190"] = 192,["192"] = 194,["194"] = 196,["195"] = 127,["196"] = 110,["197"] = 204,["198"] = 206,["199"] = 207,["200"] = 209,["201"] = 210,["202"] = 212,["203"] = 213,["204"] = 213,["205"] = 213,["206"] = 213,["207"] = 214,["208"] = 215,["209"] = 216,["210"] = 217,["211"] = 217,["212"] = 217,["213"] = 217,["214"] = 218,["215"] = 219,["217"] = 207,["218"] = 224,["219"] = 225,["220"] = 227,["221"] = 228,["222"] = 228,["223"] = 230,["224"] = 231,["225"] = 231,["227"] = 234,["228"] = 225,["229"] = 237,["230"] = 238,["232"] = 239,["233"] = 239,["234"] = 240,["235"] = 240,["236"] = 240,["237"] = 240,["238"] = 240,["239"] = 240,["240"] = 240,["241"] = 241,["242"] = 241,["243"] = 241,["244"] = 241,["245"] = 241,["246"] = 241,["247"] = 241,["248"] = 239,["251"] = 244,["252"] = 244,["253"] = 244,["254"] = 245,["255"] = 246,["256"] = 247,["257"] = 248,["258"] = 249,["261"] = 252,["262"] = 253,["263"] = 255,["264"] = 256,["265"] = 257,["266"] = 244,["267"] = 244,["268"] = 259,["269"] = 259,["270"] = 259,["271"] = 260,["272"] = 261,["273"] = 262,["274"] = 263,["275"] = 264,["278"] = 267,["279"] = 268,["280"] = 270,["281"] = 271,["282"] = 272,["283"] = 259,["284"] = 259,["285"] = 204});
local ____exports = {}
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____UnitUtil = require("solar.solar-common.util.unit.UnitUtil")
local UnitUtil = ____UnitUtil.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____NativeFrameUtil = require("solar.solar-common.util.frame.NativeFrameUtil")
local NativeFrameUtil = ____NativeFrameUtil.default
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
--- PS: 此类使用局限性很大。 对魔兽不熟悉的作者请不要使用此类制作大数值，以免被无穷的各种问题折磨。
-- 
-- 模拟属性(支持大数值)
-- 
-- 此状态下各种属性均使用自定义变量存储。所有修改属性的 均使用代码来修改 通过原生物品属性书 或等级升级奖励的属性值将不可用
-- 
-- 通过自定义实数number类型 存储数值
-- 
-- 在魔兽原本的设置属性和获取属性  走自定义属性值
-- 
-- 如果超过上限 则底层设置到限制值 属性值走自定义变量存储  显示时需自行需自行用UI显示这些大值
-- 
-- 注意：在大数值模式下一些方法计算并不严谨和准确 如果对数值扣的很细很准 请不要做大数值！
-- （在大属性模式下 不能斤斤计较）
-- link solar_attribute.d.ts ArmorReducesDamageFactor
local BaseAttributeMax = 10000000
local AgiDefenseBase = S2R(_g_objs.misc.Misc.AgiDefenseBase)
____exports.default = __TS__Class()
local BigAttributeCompatibleState = ____exports.default
BigAttributeCompatibleState.name = "BigAttributeCompatibleState"
function BigAttributeCompatibleState.prototype.____constructor(self)
    if SingletonUtil:notFirstTime(____exports.default) then
        print("不能重复new BigAttributeCompatibleState()")
        return
    end
    isBigAttributeMode = true
    self:playerAttributeCompatible()
    self:unitAttributeCompatible()
    self:heroAttributeCompatible()
end
function BigAttributeCompatibleState.prototype.heroAttributeCompatible(self)
    local oldSetHeroStr = SetHeroStr
    _G.SetHeroStr = function(whichHero, newStr, permanent)
        oldSetHeroStr(
            whichHero,
            math.min(newStr, BaseAttributeMax),
            permanent
        )
        AttributeUtil:getUnitAttribute(whichHero, true)._SL_BA_str = newStr
        if StrHpBonus > 0 and newStr > BaseAttributeMax then
            UnitUtil.setExtraHp(whichHero, (newStr - BaseAttributeMax) * StrHpBonus, "_SL_SetHeroStr")
        end
    end
    local oldSetHeroAgi = SetHeroAgi
    _G.SetHeroAgi = function(whichHero, newAgi, permanent)
        oldSetHeroAgi(
            whichHero,
            math.min(newAgi, BaseAttributeMax),
            permanent
        )
        AttributeUtil:getUnitAttribute(whichHero, true)._SL_BA_agi = newAgi
    end
    local oldSetHeroInt = SetHeroInt
    _G.SetHeroInt = function(whichHero, newInt, permanent)
        oldSetHeroInt(
            whichHero,
            math.min(newInt, BaseAttributeMax),
            permanent
        )
        AttributeUtil:getUnitAttribute(whichHero, true)._SL_BA_int = newInt
        if IntManaBonus > 0 and newInt > BaseAttributeMax then
            UnitUtil.setExtraMana(whichHero, (newInt - BaseAttributeMax) * IntManaBonus, "_SL_SetHeroInt")
        end
    end
    local oldGetHeroStr = GetHeroStr
    _G.GetHeroStr = function(whichHero, includeBonuses)
        local ____opt_0 = AttributeUtil:getUnitAttribute(whichHero)
        local val = ____opt_0 and ____opt_0._SL_BA_str or oldGetHeroStr(whichHero, false)
        if includeBonuses then
            val = val + UnitUtil.getExtraStr(whichHero)
        end
        return val
    end
    local oldGetHeroAgi = GetHeroAgi
    _G.GetHeroAgi = function(whichHero, includeBonuses)
        local ____opt_2 = AttributeUtil:getUnitAttribute(whichHero)
        local val = ____opt_2 and ____opt_2._SL_BA_agi or oldGetHeroAgi(whichHero, false)
        if includeBonuses then
            val = val + UnitUtil.getExtraAgi(whichHero)
        end
        return val
    end
    local oldGetHeroInt = GetHeroInt
    _G.GetHeroInt = function(whichHero, includeBonuses)
        local ____opt_4 = AttributeUtil:getUnitAttribute(whichHero)
        local val = ____opt_4 and ____opt_4._SL_BA_int or oldGetHeroInt(whichHero, false)
        if includeBonuses then
            val = val + UnitUtil.getExtraInt(whichHero)
        end
        return val
    end
end
function BigAttributeCompatibleState.prototype.unitAttributeCompatible(self)
    local oldSetUnitState = SetUnitState
    _G.SetUnitState = function(whichUnit, whichUnitState, newVal)
        if whichUnitState == UnitStateDamageBase then
            oldSetUnitState(
                whichUnit,
                whichUnitState,
                math.min(newVal, BaseAttributeMax)
            )
            AttributeUtil:getUnitAttribute(whichUnit, true)._SL_BA_damage_base = newVal
        elseif whichUnitState == UnitStateArmor then
            oldSetUnitState(
                whichUnit,
                whichUnitState,
                math.min(newVal, BaseAttributeMax)
            )
            AttributeUtil:getUnitAttribute(whichUnit, true)._SL_BA_armor = newVal
        else
            oldSetUnitState(whichUnit, whichUnitState, newVal)
        end
    end
    local oldGetUnitState = GetUnitState
    _G.GetUnitState = function(whichUnit, whichUnitState)
        if whichUnitState == UnitStateDamageBase then
            local ____opt_6 = AttributeUtil:getUnitAttribute(whichUnit)
            local val = ____opt_6 and ____opt_6._SL_BA_damage_base
            if val == nil then
                local ba = oldGetUnitState(whichUnit, whichUnitState)
                if UnitStateUtil:isAlive(whichUnit) then
                    AttributeUtil:getUnitAttribute(whichUnit, true)._SL_BA_damage_base = ba
                end
                return ba
            end
            return val
        elseif whichUnitState == UnitStateDamageBonus then
            local val = UnitUtil.getExtraAttack(whichUnit)
            if HeroUtil:isHero(whichUnit) then
                local primaryAndBonusValue = HeroUtil:getHeroPrimaryValue(whichUnit, true)
                local primaryValue = HeroUtil:getHeroPrimaryValue(whichUnit, false)
                local primaryBonusValue = primaryAndBonusValue - primaryValue
                val = val + primaryBonusValue * PrimaryAttackBonus
            end
            return val
        elseif whichUnitState == UnitStateArmor then
            local ____opt_8 = AttributeUtil:getUnitAttribute(whichUnit)
            local val = ____opt_8 and ____opt_8._SL_BA_armor
            if val == nil then
                local ba = oldGetUnitState(whichUnit, whichUnitState)
                if UnitStateUtil:isAlive(whichUnit) then
                    AttributeUtil:getUnitAttribute(whichUnit, true)._SL_BA_armor = ba - UnitUtil.getExtraDef(whichUnit)
                end
                return ba
            end
            val = val + UnitUtil.getExtraDef(whichUnit)
            if HeroUtil:isHero(whichUnit) and AgiDefenseBonus > 0 then
                local primaryAndBonusValue = GetHeroAgi(whichUnit, true)
                val = val + primaryAndBonusValue * AgiDefenseBonus
            end
            return val
        elseif whichUnitState == UnitStateDamageMix or whichUnitState == UnitStateDamageMax then
            local ____opt_10 = AttributeUtil:getUnitAttribute(whichUnit)
            local val = ____opt_10 and ____opt_10._SL_BA_damage_base
            if val == nil then
                local ba = oldGetUnitState(whichUnit, UnitStateDamageBase)
                if UnitStateUtil:isAlive(whichUnit) then
                    if HeroUtil:isHero(whichUnit) then
                        local primaryAndBonusValue = HeroUtil:getHeroPrimaryValue(whichUnit, true)
                        val = val + primaryAndBonusValue * PrimaryAttackBonus
                        ba = ba - val
                    end
                    AttributeUtil:getUnitAttribute(whichUnit, true)._SL_BA_damage_base = ba
                end
                return ba
            end
            local extVal = UnitUtil.getExtraAttack(whichUnit)
            val = val + extVal
            if HeroUtil:isHero(whichUnit) then
                local primaryAndBonusValue = HeroUtil:getHeroPrimaryValue(whichUnit, true)
                val = val + primaryAndBonusValue * PrimaryAttackBonus
            end
            return val
        end
        return oldGetUnitState(whichUnit, whichUnitState)
    end
end
function BigAttributeCompatibleState.prototype.playerAttributeCompatible(self)
    local oldSetPlayerState = SetPlayerState
    _G.SetPlayerState = function(whichPlayer, whichPlayerState, value)
        local temp = math.min(value, 1000000)
        oldSetPlayerState(whichPlayer, whichPlayerState, temp)
        if whichPlayerState == PLAYER_STATE_RESOURCE_GOLD then
            DzFrameSetText(
                NativeFrameUtil:getGoldText(),
                TextUtil:toCnUnit(value)
            )
            AttributeUtil:getPlayerAttribute(whichPlayer, true)._SL_BA_gold = value
            AttributeUtil:getPlayerAttribute(whichPlayer, true)._SL_BA_gold_temp = temp
        elseif whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER then
            DzFrameSetText(
                NativeFrameUtil:getLumberText(),
                TextUtil:toCnUnit(value)
            )
            AttributeUtil:getPlayerAttribute(whichPlayer, true)._SL_BA_lumber = value
            AttributeUtil:getPlayerAttribute(whichPlayer, true)._SL_BA_lumber_temp = temp
        end
    end
    local oldGetPlayerState = GetPlayerState
    _G.GetPlayerState = function(whichPlayer, whichPlayerState)
        if whichPlayerState == PLAYER_STATE_RESOURCE_GOLD then
            local ____opt_12 = AttributeUtil:getPlayerAttribute(whichPlayer)
            return ____opt_12 and ____opt_12._SL_BA_gold or oldGetPlayerState(whichPlayer, whichPlayerState)
        elseif whichPlayerState == PLAYER_STATE_RESOURCE_LUMBER then
            local ____opt_14 = AttributeUtil:getPlayerAttribute(whichPlayer)
            return ____opt_14 and ____opt_14._SL_BA_lumber or oldGetPlayerState(whichPlayer, whichPlayerState)
        end
        return oldGetPlayerState(whichPlayer, whichPlayerState)
    end
    local goldTrigger = CreateTrigger()
    local lumberTrigger = CreateTrigger()
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerStateEvent(
                goldTrigger,
                Player(i),
                PLAYER_STATE_RESOURCE_GOLD,
                NOT_EQUAL,
                -1
            )
            TriggerRegisterPlayerStateEvent(
                lumberTrigger,
                Player(i),
                PLAYER_STATE_RESOURCE_LUMBER,
                NOT_EQUAL,
                -1
            )
            i = i + 1
        end
    end
    TriggerAddAction(
        goldTrigger,
        function()
            local player = GetTriggerPlayer()
            local playerAttribute = AttributeUtil:getPlayerAttribute(player, true)
            local nowTempGold = oldGetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD)
            if not playerAttribute._SL_BA_gold or not playerAttribute._SL_BA_gold_temp then
                playerAttribute._SL_BA_gold_temp = nowTempGold
                return
            end
            local add = nowTempGold - playerAttribute._SL_BA_gold_temp
            playerAttribute._SL_BA_gold = playerAttribute._SL_BA_gold + add
            DisableTrigger(GetTriggeringTrigger())
            SetPlayerState(player, PLAYER_STATE_RESOURCE_GOLD, playerAttribute._SL_BA_gold)
            EnableTrigger(GetTriggeringTrigger())
        end
    )
    TriggerAddAction(
        lumberTrigger,
        function()
            local player = GetTriggerPlayer()
            local playerAttribute = AttributeUtil:getPlayerAttribute(player, true)
            local nowTempGold = oldGetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER)
            if not playerAttribute._SL_BA_lumber or not playerAttribute._SL_BA_lumber_temp then
                playerAttribute._SL_BA_lumber_temp = nowTempGold
                return
            end
            local add = nowTempGold - playerAttribute._SL_BA_lumber_temp
            playerAttribute._SL_BA_lumber = playerAttribute._SL_BA_lumber + add
            DisableTrigger(GetTriggeringTrigger())
            SetPlayerState(player, PLAYER_STATE_RESOURCE_LUMBER, playerAttribute._SL_BA_lumber)
            EnableTrigger(GetTriggeringTrigger())
        end
    )
end
return ____exports
