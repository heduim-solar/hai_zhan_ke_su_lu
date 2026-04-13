local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 10,["24"] = 10,["25"] = 11,["26"] = 11,["27"] = 12,["28"] = 12,["29"] = 13,["30"] = 13,["31"] = 14,["32"] = 14,["33"] = 15,["34"] = 15,["35"] = 16,["36"] = 16,["37"] = 17,["38"] = 17,["39"] = 18,["40"] = 18,["41"] = 19,["42"] = 19,["43"] = 20,["44"] = 20,["45"] = 21,["46"] = 21,["47"] = 26,["48"] = 26,["49"] = 26,["51"] = 26,["52"] = 30,["53"] = 30,["54"] = 30,["56"] = 31,["57"] = 32,["58"] = 33,["59"] = 36,["60"] = 37,["62"] = 38,["63"] = 38,["64"] = 39,["65"] = 40,["66"] = 41,["67"] = 42,["68"] = 43,["69"] = 44,["71"] = 46,["74"] = 38,["77"] = 51,["78"] = 52,["79"] = 52,["81"] = 53,["82"] = 53,["84"] = 55,["85"] = 57,["86"] = 61,["87"] = 62,["88"] = 30,["89"] = 65,["91"] = 66,["92"] = 66,["93"] = 67,["94"] = 68,["96"] = 66,["99"] = 65,["100"] = 73,["102"] = 74,["103"] = 74,["104"] = 75,["105"] = 76,["107"] = 74,["110"] = 73,["111"] = 82,["112"] = 83,["113"] = 84,["114"] = 85,["115"] = 86,["118"] = 89,["119"] = 91,["120"] = 92,["121"] = 93,["122"] = 93,["123"] = 93,["124"] = 93,["125"] = 94,["126"] = 95,["127"] = 95,["128"] = 95,["129"] = 95,["130"] = 95,["131"] = 95,["132"] = 95,["133"] = 95,["134"] = 96,["135"] = 97,["136"] = 97,["137"] = 97,["138"] = 97,["139"] = 97,["140"] = 97,["141"] = 97,["142"] = 97,["144"] = 93,["145"] = 93,["146"] = 93,["147"] = 93,["149"] = 101,["150"] = 101,["151"] = 101,["152"] = 101,["153"] = 101,["154"] = 101,["155"] = 101,["156"] = 101,["158"] = 82,["159"] = 107,["160"] = 107,["161"] = 107,["163"] = 107,["164"] = 107,["166"] = 111,["167"] = 112,["168"] = 113,["171"] = 116,["172"] = 116,["173"] = 116,["174"] = 116,["175"] = 116,["176"] = 116,["177"] = 116,["178"] = 118,["179"] = 119,["180"] = 120,["182"] = 122,["183"] = 123,["184"] = 123,["185"] = 123,["186"] = 124,["187"] = 125,["188"] = 126,["189"] = 127,["190"] = 128,["194"] = 123,["195"] = 123,["196"] = 123,["197"] = 133,["198"] = 133,["199"] = 133,["200"] = 134,["201"] = 133,["202"] = 133,["203"] = 133,["204"] = 136,["205"] = 136,["206"] = 136,["207"] = 137,["210"] = 140,["211"] = 141,["212"] = 141,["213"] = 141,["214"] = 141,["215"] = 142,["216"] = 142,["217"] = 142,["218"] = 142,["219"] = 143,["220"] = 143,["221"] = 143,["222"] = 143,["223"] = 144,["224"] = 145,["225"] = 146,["228"] = 149,["229"] = 149,["230"] = 149,["231"] = 150,["232"] = 149,["233"] = 149,["234"] = 136,["235"] = 136,["236"] = 155,["237"] = 156,["238"] = 157,["239"] = 157,["241"] = 158,["242"] = 159,["243"] = 161,["244"] = 163,["245"] = 163,["246"] = 163,["247"] = 163,["248"] = 164,["249"] = 169,["250"] = 169,["251"] = 169,["252"] = 169,["253"] = 169,["254"] = 170,["255"] = 171,["256"] = 174,["257"] = 174,["258"] = 174,["259"] = 174,["260"] = 176,["261"] = 177,["262"] = 178,["263"] = 179,["264"] = 180,["265"] = 181,["267"] = 186,["268"] = 187,["269"] = 188,["271"] = 191,["272"] = 192,["273"] = 193,["275"] = 197,["276"] = 197,["277"] = 197,["278"] = 197,["279"] = 197,["280"] = 197,["281"] = 197,["282"] = 197,["283"] = 197,["284"] = 198,["285"] = 202,["286"] = 204,["287"] = 107,["288"] = 27,["289"] = 28});
local ____exports = {}
local ____PlayerUtil = require("solar.solar-common.util.game.PlayerUtil")
local PlayerUtil = ____PlayerUtil.default
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local _____8239_4E3B_70AE = require("xlsx.技能.船主炮")
local ____d__8239_4E3B_70AE = _____8239_4E3B_70AE["d_船主炮"]
local _____73A9_5BB6_82F1_96C4_8239 = require("xlsx.单位.玩家英雄船")
local ____d__73A9_5BB6_82F1_96C4_8239 = _____73A9_5BB6_82F1_96C4_8239["d_玩家英雄船"]
local _____8239_57FA_672C_6280_80FD = require("xlsx.技能.船基本技能")
local ____d__8239_57FA_672C_6280_80FD = _____8239_57FA_672C_6280_80FD["d_船基本技能"]
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____HeroUtil = require("solar.solar-common.util.unit.HeroUtil")
local HeroUtil = ____HeroUtil.default
local ____TextTagUtil = require("solar.solar-common.util.text.TextTagUtil")
local TextTagUtil = ____TextTagUtil.default
local ____ItemUtil = require("solar.solar-common.util.game.ItemUtil")
local ItemUtil = ____ItemUtil.default
local ____DialogUtil = require("solar.solar-common.util.game.DialogUtil")
local DialogUtil = ____DialogUtil.default
local ____XlsxDataUtil = require("solar.solar-common.util.system.XlsxDataUtil")
local XlsxDataUtil = ____XlsxDataUtil.default
local ____ActorAbilityUtil = require("solar.solar-common.actor.util.ActorAbilityUtil")
local ActorAbilityUtil = ____ActorAbilityUtil.default
local _____4F20_9001 = require("xlsx.技能.传送")
local ____d__4F20_9001 = _____4F20_9001["d_传送"]
local ____ActorBuffUtil = require("solar.solar-common.actor.util.ActorBuffUtil")
local ActorBuffUtil = ____ActorBuffUtil.default
local ____PlayerAttributeState = require("solar.solar-common.attribute.PlayerAttributeState")
local PlayerAttributeState = ____PlayerAttributeState.default
local ____PlatUtil = require("solar.solar-common.util.game.PlatUtil")
local PlatUtil = ____PlatUtil.default
local _____9B54_6539_9053_5177 = require("state.商城.魔改道具")
local _____9B54_6539_9053_5177 = _____9B54_6539_9053_5177.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local MapHeroUtil = ____exports.default
MapHeroUtil.name = "MapHeroUtil"
function MapHeroUtil.prototype.____constructor(self)
end
MapHeroUtil["cshyx_初始化英雄"] = function(self, anHero, addJiNeng)
    if addJiNeng == nil then
        addJiNeng = true
    end
    local player = GetOwningPlayer(anHero)
    PlayerUtil:setHero(player, anHero)
    UnitStateUtil:enableFlyHeight(anHero)
    local idStr = id2string(GetUnitTypeId(anHero))
    local index = 0
    do
        local i = 0
        while i < #____d__73A9_5BB6_82F1_96C4_8239 do
            if ____d__73A9_5BB6_82F1_96C4_8239[i + 1].id == idStr then
                __TS__New(ActorAbility, ____d__8239_4E3B_70AE[i + 1].id, anHero, ____exports.default.zhuPaoStartPos)
                print((("为" .. GetUnitName(anHero)) .. "添加主炮技能:") .. ____d__8239_4E3B_70AE[i + 1].id)
                if addJiNeng then
                    __TS__New(ActorAbility, ____d__8239_57FA_672C_6280_80FD[i + 1].id, anHero, ____exports.default.jiNengStartPos)
                    print((("为" .. GetUnitName(anHero)) .. "添加技能:") .. ____d__8239_57FA_672C_6280_80FD[i + 1].id)
                end
                index = i
                break
            end
            i = i + 1
        end
    end
    UnitSetUsesAltIcon(anHero, true)
    if DzWidgetSetMinimapIconEnable ~= nil then
        DzWidgetSetMinimapIconEnable(anHero, true)
    end
    if DzWidgetSetMinimapIcon ~= nil then
        DzWidgetSetMinimapIcon(anHero, "进攻怪图标\\船.blp")
    end
    _____9B54_6539_9053_5177["船只魔改道具奖励"](_____9B54_6539_9053_5177, index, anHero)
    UnitStateUtil:addInvulnerableIfNot(anHero, 2)
    UnitAddAbility(anHero, ____d__4F20_9001[1].id)
    SelectUnitForPlayerSingle(anHero, player)
end
function MapHeroUtil.getHeroZhuPaoActorId(self, heroTypeIdStr)
    do
        local i = 0
        while i < #____d__73A9_5BB6_82F1_96C4_8239 do
            if ____d__73A9_5BB6_82F1_96C4_8239[i + 1].id == heroTypeIdStr then
                return ____d__8239_4E3B_70AE[i + 1].id
            end
            i = i + 1
        end
    end
end
function MapHeroUtil.getHeroJiNengActorId(self, heroTypeIdStr)
    do
        local i = 0
        while i < #____d__73A9_5BB6_82F1_96C4_8239 do
            if ____d__73A9_5BB6_82F1_96C4_8239[i + 1].id == heroTypeIdStr then
                return ____d__8239_57FA_672C_6280_80FD[i + 1].id
            end
            i = i + 1
        end
    end
end
MapHeroUtil["do进化ByType"] = function(self, player, lv, newHeroId)
    local oldHero = SelectUtil.getAnHero(GetPlayerId(player))
    local _____4E3B_70AE_6570_91CF = ActorAbilityUtil:getUnitActorAbilityListSize(oldHero, "主炮")
    if _____4E3B_70AE_6570_91CF >= 4 then
        PlayerUtil:text(player, "你的英雄已经拥有4个主炮了！无法进化!")
        return
    end
    local playerData = DataBase:getPlayerSolarData(player, true)
    if playerData["jhcs_进化次数"] and playerData["jhcs_进化次数"] >= 3 then
        local heroData = XlsxDataUtil:getDataById(newHeroId)
        DialogUtil:show(
            GetPlayerId(player),
            "是否保留当前主炮|n(拥有4门主炮后则停止进化)|n" .. heroData.Name,
            function(____, i, t)
                if i == 0 then
                    ____exports.default["do进化ByTypeAndKeepAbility"](
                        ____exports.default,
                        player,
                        lv,
                        newHeroId,
                        true,
                        false
                    )
                elseif i == 1 then
                    ____exports.default["do进化ByTypeAndKeepAbility"](
                        ____exports.default,
                        player,
                        lv,
                        newHeroId,
                        false,
                        false
                    )
                end
            end,
            "是",
            "否"
        )
    else
        ____exports.default["do进化ByTypeAndKeepAbility"](
            ____exports.default,
            player,
            lv,
            newHeroId,
            false,
            false
        )
    end
end
MapHeroUtil["do进化ByTypeAndKeepAbility"] = function(self, player, lv, newHeroId, keepZhuPao, keepJineng)
    if keepZhuPao == nil then
        keepZhuPao = false
    end
    if keepJineng == nil then
        keepJineng = false
    end
    local oldHero = SelectUtil.getAnHero(GetPlayerId(player))
    if keepZhuPao and ActorAbilityUtil:getUnitActorAbilityListSize(oldHero, "主炮") >= 4 then
        PlayerUtil:text(player, "你的英雄已经拥有4个主炮了！无法进化!")
        return
    end
    local newHero = CreateUnit(
        GetOwningPlayer(oldHero),
        FourCC(newHeroId),
        GetUnitX(oldHero),
        GetUnitY(oldHero),
        GetUnitFacing(oldHero)
    )
    if keepJineng then
        local jiNengActorId = ____exports.default:getHeroJiNengActorId(id2string(GetUnitTypeId(oldHero)))
        __TS__New(ActorAbility, jiNengActorId, newHero, ____exports.default.jiNengStartPos)
    end
    local actorId = ____exports.default:getHeroZhuPaoActorId(id2string(GetUnitTypeId(oldHero)))
    ActorAbilityUtil:forUnitActorAbilityList(
        oldHero,
        function(____, actor)
            if keepZhuPao or actor.actorType.id ~= actorId then
                local actorAbility = __TS__New(ActorAbility, actor.actorType.id, newHero, ____exports.default.zhuPaoStartPos)
                if actor.extData then
                    for extDataKey in pairs(actor.extData) do
                        actorAbility.extData[extDataKey] = actor.extData[extDataKey]
                    end
                end
            end
        end,
        "主炮"
    )
    ActorAbilityUtil:forUnitActorAbilityList(
        oldHero,
        function(____, actor)
            __TS__New(ActorAbility, actor.actorType.id, newHero, 6)
        end,
        "船长之心"
    )
    ActorBuffUtil:forUnitActorBuffs(
        oldHero,
        function(____, actor)
            if actor:get("tag") ~= "进化继承" then
                return
            end
            local actorBuff = ActorBuffUtil:addActorBuff(newHero, actor.actorType.id)
            actorBuff:set(
                "class",
                actor:get("class")
            )
            actorBuff:set(
                "tag",
                actor:get("tag")
            )
            actorBuff:set(
                "uiShowType",
                actor:get("uiShowType")
            )
            if actor.extData then
                for extDataKey in pairs(actor.extData) do
                    actorBuff.extData[extDataKey] = actor.extData[extDataKey]
                end
            end
            BaseUtil.runLater(
                0.2,
                function()
                    actorBuff.level = actor.level
                end
            )
        end
    )
    local solarData = DataBase:getUnitSolarData(oldHero, false)
    local actor = solarData and solarData._SL_solarActorUnit
    if actor ~= nil then
        actor:destroy()
    end
    ActorAbilityUtil:destroyUnitAllActorAbility(oldHero)
    ActorBuffUtil:clearUnitActorBuffs(oldHero)
    se:emit("属性刷新")
    local playerData = DataBase:getPlayerSolarData(
        GetOwningPlayer(oldHero),
        true
    )
    playerData["正在进化"] = true
    AddHeroXP(
        newHero,
        GetHeroXP(oldHero),
        true
    )
    playerData["正在进化"] = false
    ItemUtil:transferItems(oldHero, newHero)
    HeroUtil:addHeroProperty(
        newHero,
        HeroUtil:getFullProperty(oldHero, false) / 3
    )
    HeroUtil:setHeroProperty(oldHero, 1, 1, 1)
    se:emit("属性刷新")
    local damageBase = UnitStateUtil:getDamageBase(oldHero) - HeroUtil:getHeroPrimaryValue(oldHero)
    if damageBase > 0 then
        UnitStateUtil:addDamageBase(newHero, damageBase)
        print("继承白字攻击力+" .. tostring(damageBase))
    end
    if PlatUtil:hasMallItem(player, "HYBZ") then
        HeroUtil:addHeroPropertyP(newHero, false, 0.05)
        TextTagUtil.textSuccess("海域霸主+全属性5%", newHero)
    end
    if PlatUtil:hasMallItem(player, "SCJF016") then
        HeroUtil:addHeroProperty(newHero, 10)
        TextTagUtil.textSuccess("循序渐进+全属性10", newHero)
    end
    TextTagUtil.text(
        "进化!",
        newHero,
        20,
        3,
        255,
        0,
        0
    )
    ____exports.default["cshyx_初始化英雄"](____exports.default, newHero, not keepJineng)
    RemoveUnit(oldHero)
    PlayerAttributeState:refresh()
end
MapHeroUtil.jiNengStartPos = 5
MapHeroUtil.zhuPaoStartPos = 9
return ____exports
