local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 2,["13"] = 2,["14"] = 3,["15"] = 3,["16"] = 4,["17"] = 4,["18"] = 5,["19"] = 5,["20"] = 7,["21"] = 7,["22"] = 14,["23"] = 14,["24"] = 14,["25"] = 14,["26"] = 21,["27"] = 14,["28"] = 19,["29"] = 24,["30"] = 25,["31"] = 26,["32"] = 28,["34"] = 30,["35"] = 32,["37"] = 34,["38"] = 35,["41"] = 39,["42"] = 40,["44"] = 43,["45"] = 43,["46"] = 43,["47"] = 43,["48"] = 43,["49"] = 43,["50"] = 43,["51"] = 45,["52"] = 46,["53"] = 47,["54"] = 49,["56"] = 50,["57"] = 50,["58"] = 51,["59"] = 53,["60"] = 54,["61"] = 54,["62"] = 54,["63"] = 54,["66"] = 50,["70"] = 21,["71"] = 68,["72"] = 14,["73"] = 70,["77"] = 73,["78"] = 154,["79"] = 74,["81"] = 75,["82"] = 75,["84"] = 76,["85"] = 76,["89"] = 78,["91"] = 79,["92"] = 80,["94"] = 82,["95"] = 84,["96"] = 84,["101"] = 87,["103"] = 88,["106"] = 90,["108"] = 91,["109"] = 91,["110"] = 91,["111"] = 91,["112"] = 91,["113"] = 91,["114"] = 91,["117"] = 94,["119"] = 95,["120"] = 95,["121"] = 95,["122"] = 95,["123"] = 95,["124"] = 95,["125"] = 95,["128"] = 98,["130"] = 99,["131"] = 99,["132"] = 99,["133"] = 99,["134"] = 99,["135"] = 99,["136"] = 99,["139"] = 102,["141"] = 103,["142"] = 103,["143"] = 103,["144"] = 103,["145"] = 103,["146"] = 103,["147"] = 103,["150"] = 106,["152"] = 107,["153"] = 107,["157"] = 109,["159"] = 110,["162"] = 112,["164"] = 113,["165"] = 113,["166"] = 113,["167"] = 113,["168"] = 114,["169"] = 114,["170"] = 114,["171"] = 114,["172"] = 115,["175"] = 117,["177"] = 118,["178"] = 119,["181"] = 121,["183"] = 122,["184"] = 123,["187"] = 126,["189"] = 127,["192"] = 129,["194"] = 130,["197"] = 132,["199"] = 133,["202"] = 135,["204"] = 136,["207"] = 138,["209"] = 139,["212"] = 141,["214"] = 142,["217"] = 144,["219"] = 145,["222"] = 147,["224"] = 148,["227"] = 150,["229"] = 151,["232"] = 153,["234"] = 154,["235"] = 155,["236"] = 156,["240"] = 159,["242"] = 160,["243"] = 161,["244"] = 162,["249"] = 68,["250"] = 169,["251"] = 14,["252"] = 169,["253"] = 173,["254"] = 14,["255"] = 175,["256"] = 173,["257"] = 178,["258"] = 178,["259"] = 178,["261"] = 179,["262"] = 180,["264"] = 14,["265"] = 178,["266"] = 188,["267"] = 188,["268"] = 189,["271"] = 192,["272"] = 193,["275"] = 197,["276"] = 198,["277"] = 199,["278"] = 200,["279"] = 201,["280"] = 201,["283"] = 188,["284"] = 210,["285"] = 211,["286"] = 212,["287"] = 213,["288"] = 214,["291"] = 217,["292"] = 210,["293"] = 224,["294"] = 225,["296"] = 226,["297"] = 226,["298"] = 227,["299"] = 228,["300"] = 229,["301"] = 230,["303"] = 226,["306"] = 233,["307"] = 224,["308"] = 236,["309"] = 236,["310"] = 236,["312"] = 237,["313"] = 236,["314"] = 244,["315"] = 244,["316"] = 245,["317"] = 246,["318"] = 247,["319"] = 248,["320"] = 249,["323"] = 252,["327"] = 244,["328"] = 264,["329"] = 265,["330"] = 266,["331"] = 264,["332"] = 274,["333"] = 275,["334"] = 275,["335"] = 276,["338"] = 279,["339"] = 280,["340"] = 280,["341"] = 281,["342"] = 282,["345"] = 285,["346"] = 274,["347"] = 293,["348"] = 294,["349"] = 294,["350"] = 295,["351"] = 296,["353"] = 298,["354"] = 299,["355"] = 299,["356"] = 300,["357"] = 301,["360"] = 293,["361"] = 306,["362"] = 307,["363"] = 14,["364"] = 309,["365"] = 310,["367"] = 313,["368"] = 314,["370"] = 306,["371"] = 16,["376"] = 65});
local ____exports = {}
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____ActorTypeShopUtil = require("solar.solar-common.actor.util.ActorTypeShopUtil")
local ActorTypeShopUtil = ____ActorTypeShopUtil.default
local ____UnitStateUtil = require("solar.solar-common.util.unit.UnitStateUtil")
local UnitStateUtil = ____UnitStateUtil.default
____exports.default = __TS__Class()
local ActorUnit = ____exports.default
ActorUnit.name = "ActorUnit"
__TS__ClassExtends(ActorUnit, Actor)
function ActorUnit.prototype.____constructor(self, actorTypeId, player, x, y)
    Actor.prototype.____constructor(self, actorTypeId)
    self.sellItemAbilityList = {}
    local templateType = self:getTemplateType()
    ObjectTemplateUtil:_sl_init()
    if ObjectTemplateUtil.templateInfo[templateType] == nil then
        self.unitTypeID = templateType
    else
        self.unitTypeID = ObjectTemplateUtil:borrowTemplate(templateType)
        ObjectTemplateUtil:returnTemplate(templateType, self.unitTypeID)
    end
    if self.unitTypeID == nil or #self.unitTypeID ~= 4 then
        log.errorWithTraceBack((("物编模板id获取失败:" .. tostring(templateType)) .. " -> ") .. tostring(self.unitTypeID))
        return
    end
    if self.actorType.sellItems and #self.actorType.sellItems > 0 and self.actorType.onUnitInterval == nil then
        ActorTypeShopUtil:autoDisableSellingAbilityOnNoStoreTarget(actorTypeId)
    end
    self.unit = CreateUnit(
        player,
        self.unitTypeID,
        x,
        y,
        270
    )
    DataBase:getUnitSolarData(self.unit)._SL_solarActorUnit = self
    self:_sl_init()
    self:update()
    if IsHeroUnitId(GetUnitTypeId(self.unit)) and FrameSetOriginButtonTexture and GetLocalPlayer() == player then
        do
            local i = 5
            while i >= 0 do
                local heroBarButton = DzFrameGetHeroBarButton(i)
                if FrameIsShow(heroBarButton) then
                    FrameSetOriginButtonTexture(
                        heroBarButton,
                        self:getIcon()
                    )
                    break
                end
                i = i - 1
            end
        end
    end
end
function ActorUnit.prototype._sl_rawset(self, key, value)
    Actor.prototype._sl_rawset(self, key, value)
    if not IsHandle(self.unit) then
        return
    end
    repeat
        local ____switch13 = key
        local sellItems, abilities
        local ____cond13 = ____switch13 == "name"
        if ____cond13 then
            if SetUnitName ~= nil then
                SetUnitName(self.unit, value)
            end
            if SetUnitProperName ~= nil then
                SetUnitProperName(self.unit, value)
            end
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "model"
        if ____cond13 then
            if SetUnitModel then
                SetUnitModel(self.unit, value)
            else
                DzSetUnitModel(self.unit, value)
                if SetUnitPortrait ~= nil then
                    SetUnitPortrait(self.unit, value)
                end
            end
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "modelScale"
        if ____cond13 then
            SetUnitScale(self.unit, value, value, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "colorR"
        if ____cond13 then
            SetUnitVertexColor(
                self.unit,
                value or 255,
                self:get("colorG", 255),
                self:get("colorB", 255),
                self:get("alpha", 255)
            )
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "colorG"
        if ____cond13 then
            SetUnitVertexColor(
                self.unit,
                self:get("colorR", 255),
                value or 255,
                self:get("colorB", 255),
                self:get("alpha", 255)
            )
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "colorB"
        if ____cond13 then
            SetUnitVertexColor(
                self.unit,
                self:get("colorR", 255),
                self:get("colorG", 255),
                value or 255,
                self:get("alpha", 255)
            )
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "alpha"
        if ____cond13 then
            SetUnitVertexColor(
                self.unit,
                self:get("colorR", 255),
                self:get("colorG", 255),
                self:get("colorB", 255),
                value or 255
            )
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "missileModel"
        if ____cond13 then
            if SetUnitMissileModel ~= nil then
                SetUnitMissileModel(self.unit, value)
            end
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "moveType"
        if ____cond13 then
            UnitStateUtil:setMoveType(self.unit, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "flyHeight"
        if ____cond13 then
            UnitAddAbility(
                self.unit,
                FourCC("Amrf")
            )
            UnitRemoveAbility(
                self.unit,
                FourCC("Amrf")
            )
            SetUnitFlyHeight(self.unit, value, 0)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "maxLife"
        if ____cond13 then
            SetUnitState(self.unit, UNIT_STATE_MAX_LIFE, value)
            SetUnitState(self.unit, UNIT_STATE_LIFE, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "maxMana"
        if ____cond13 then
            SetUnitState(self.unit, UNIT_STATE_MAX_MANA, value)
            SetUnitState(self.unit, UNIT_STATE_MANA, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "acquireRange"
        if ____cond13 then
            SetUnitAcquireRange(self.unit, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "range"
        if ____cond13 then
            SetUnitState(self.unit, UnitStateDamageRange, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "damage"
        if ____cond13 then
            SetUnitState(self.unit, UnitStateDamageBase, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "damageCd"
        if ____cond13 then
            SetUnitState(self.unit, UnitStateDamageCool, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "strength"
        if ____cond13 then
            SetHeroStr(self.unit, value, true)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "agility"
        if ____cond13 then
            SetHeroAgi(self.unit, value, true)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "intelligence"
        if ____cond13 then
            SetHeroInt(self.unit, value, true)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "def"
        if ____cond13 then
            SetUnitState(self.unit, UnitStateArmor, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "moveSpeed"
        if ____cond13 then
            SetUnitMoveSpeed(self.unit, value)
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "sellItems"
        if ____cond13 then
            sellItems = value
            if sellItems and #sellItems > 0 then
                self:addSellItem(table.unpack(sellItems))
            end
            break
        end
        ____cond13 = ____cond13 or ____switch13 == "abilities"
        if ____cond13 then
            abilities = value
            if abilities and #abilities > 0 then
                self:addAbility(table.unpack(abilities))
            end
            break
        end
    until true
end
function ActorUnit.prototype.get(self, key, defaultValue)
    return Actor.prototype.get(self, key, defaultValue)
end
function ActorUnit.prototype.setXY(self, x, y)
    Actor.prototype.setXY(self, x, y)
    SetUnitPosition(self.unit, x, y)
end
function ActorUnit.prototype.getRootFrameControl(self, createDefault)
    if createDefault == nil then
        createDefault = true
    end
    if createDefault and self._sl_rootFrameControl == nil then
        ____exports.default._sl_hasFrameActorUnits[self.uuid] = self
    end
    return Actor.prototype.getRootFrameControl(self, createDefault)
end
function ActorUnit.prototype.addSellItem(self, ...)
    local sellItems = {...}
    if sellItems == nil or #sellItems == 0 then
        return
    end
    if #sellItems > 12 then
        log.errorWithTraceBack((self:getName() .. ":sellItems售卖物品超过12个。") .. tostring(#sellItems))
        return
    end
    for ____, sellItemId in ipairs(sellItems) do
        if not self:hasSellItem(sellItemId) then
            local sellingAbilityTypeId = ActorTypeShopUtil:warpActorItem2SellingAbility(sellItemId).id
            local actorAbility = self:addActorAbility(sellingAbilityTypeId)
            local ____self_sellItemAbilityList_8 = self.sellItemAbilityList
            ____self_sellItemAbilityList_8[#____self_sellItemAbilityList_8 + 1] = actorAbility
        end
    end
end
function ActorUnit.prototype.hasSellItem(self, sellItemId)
    local sellingAbilityTypeId = ActorTypeShopUtil:warpActorItem2SellingAbility(sellItemId).id
    for ____, sellItemAbility in ipairs(self.sellItemAbilityList) do
        if sellItemAbility.actorType.id == sellingAbilityTypeId then
            return true
        end
    end
    return false
end
function ActorUnit.prototype.removeSellItem(self, sellItemId)
    local sellingAbilityTypeId = ActorTypeShopUtil:warpActorItem2SellingAbility(sellItemId).id
    do
        local i = 0
        while i < #self.sellItemAbilityList do
            local sellItemAbility = self.sellItemAbilityList[i + 1]
            if sellItemAbility.actorType.id == sellingAbilityTypeId then
                sellItemAbility:destroy()
                self.sellItemAbilityList = __TS__ArraySplice(self.sellItemAbilityList, i, 1)
            end
            i = i + 1
        end
    end
    return false
end
function ActorUnit.prototype.applyTimedLife(self, duration, buffid)
    if buffid == nil then
        buffid = "BHwe"
    end
    UnitApplyTimedLife(self.unit, buffid, duration)
end
function ActorUnit.prototype.addAbility(self, ...)
    local abilities = {...}
    if abilities and #abilities > 0 then
        for ____, ability in ipairs(abilities) do
            if DataBase:getSolarActorType(ability) ~= nil then
                if self:getActorAbility(ability) == nil then
                    self:addActorAbility(ability)
                end
            else
                UnitAddAbility(self.unit, ability)
            end
        end
    end
end
function ActorUnit.prototype.addActorAbility(self, actorAbilityTypeId, posNum)
    local actorAbility = __TS__New(ActorAbility, actorAbilityTypeId, self.unit, posNum)
    return actorAbility
end
function ActorUnit.prototype.getActorAbility(self, actorTypeId)
    local ____opt_9 = DataBase:getUnitSolarData(self.unit, false)
    local abilityTemplate = ____opt_9 and ____opt_9._SL_abilityTemplate
    if abilityTemplate == nil then
        return
    end
    for abilityTemplateKey in pairs(abilityTemplate) do
        local ____opt_11 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
        local actor = ____opt_11 and ____opt_11._SL_solarActorAbility
        if actor ~= nil and actor.actorTypeId == actorTypeId then
            return actor
        end
    end
    return nil
end
function ActorUnit.prototype.destroyAllActorAbility(self)
    local ____opt_13 = DataBase:getUnitSolarData(self.unit, false)
    local abilityTemplate = ____opt_13 and ____opt_13._SL_abilityTemplate
    if abilityTemplate == nil then
        return nil
    end
    for abilityTemplateKey in pairs(abilityTemplate) do
        local ____opt_15 = DataBase:getAbilityTypeSolarData(abilityTemplate[abilityTemplateKey], false)
        local actor = ____opt_15 and ____opt_15._SL_solarActorAbility
        if actor ~= nil then
            actor:destroy()
        end
    end
end
function ActorUnit.prototype.destroy(self)
    local unit = self.unit
    Actor.prototype.destroy(self)
    if self._sl_RootFrame ~= nil then
        deleteKey(____exports.default._sl_hasFrameActorUnits, self.uuid)
    end
    if IsHandle(unit) then
        RemoveUnit(unit)
    end
end
ActorUnit._sl_hasFrameActorUnits = {}
__TS__SetDescriptor(
    ActorUnit.prototype,
    "actorType",
    {get = function(self)
        return self._actorType
    end},
    true
)
return ____exports
