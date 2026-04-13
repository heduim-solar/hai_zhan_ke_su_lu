local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 11,["21"] = 11,["22"] = 11,["23"] = 11,["24"] = 24,["25"] = 11,["26"] = 26,["27"] = 27,["30"] = 31,["31"] = 32,["32"] = 33,["33"] = 34,["34"] = 34,["35"] = 34,["36"] = 34,["37"] = 35,["39"] = 37,["41"] = 40,["42"] = 41,["43"] = 43,["44"] = 44,["45"] = 24,["46"] = 48,["47"] = 11,["48"] = 50,["49"] = 51,["53"] = 54,["54"] = 55,["56"] = 56,["59"] = 58,["61"] = 59,["64"] = 61,["66"] = 62,["69"] = 64,["71"] = 65,["72"] = 66,["74"] = 68,["75"] = 68,["76"] = 69,["77"] = 70,["82"] = 74,["84"] = 75,["87"] = 77,["89"] = 80,["90"] = 81,["91"] = 82,["92"] = 83,["93"] = 84,["97"] = 87,["99"] = 88,["100"] = 88,["101"] = 88,["102"] = 88,["103"] = 88,["106"] = 90,["108"] = 91,["109"] = 91,["110"] = 91,["111"] = 91,["112"] = 91,["113"] = 91,["116"] = 93,["118"] = 94,["121"] = 96,["123"] = 97,["126"] = 99,["128"] = 100,["129"] = 101,["130"] = 102,["132"] = 104,["136"] = 107,["138"] = 108,["141"] = 110,["143"] = 111,["144"] = 112,["147"] = 114,["149"] = 115,["152"] = 117,["154"] = 118,["158"] = 48,["159"] = 123,["160"] = 11,["161"] = 123,["162"] = 134,["163"] = 135,["164"] = 134,["165"] = 139,["166"] = 140,["167"] = 139,["168"] = 144,["169"] = 11,["170"] = 146,["171"] = 144,["172"] = 153,["173"] = 154,["174"] = 155,["177"] = 158,["178"] = 159,["179"] = 160,["180"] = 153,["181"] = 164,["182"] = 165,["183"] = 166,["184"] = 167,["185"] = 167,["186"] = 167,["187"] = 167,["188"] = 167,["189"] = 168,["190"] = 164,["191"] = 171,["192"] = 172,["193"] = 173,["194"] = 174,["195"] = 176,["198"] = 171,["199"] = 185,["200"] = 186,["201"] = 187,["203"] = 189,["204"] = 185,["205"] = 195,["206"] = 196,["207"] = 195,["208"] = 203,["209"] = 204,["210"] = 203,["211"] = 211,["212"] = 212,["213"] = 212,["214"] = 212,["215"] = 212,["216"] = 212,["217"] = 211,["218"] = 219,["219"] = 220,["220"] = 220,["221"] = 220,["222"] = 220,["223"] = 219,["224"] = 227,["225"] = 228,["226"] = 227,["227"] = 232,["228"] = 233,["231"] = 11,["232"] = 237,["233"] = 238,["236"] = 241,["237"] = 243,["238"] = 244,["239"] = 244,["240"] = 244,["241"] = 245,["242"] = 246,["243"] = 246,["244"] = 246,["245"] = 246,["247"] = 248,["248"] = 249,["249"] = 249,["250"] = 249,["251"] = 249,["253"] = 251,["254"] = 244,["255"] = 244,["257"] = 232,["258"] = 256,["259"] = 257,["262"] = 11,["263"] = 256,["264"] = 264,["265"] = 265,["266"] = 11,["267"] = 264,["272"] = 131});
local ____exports = {}
local ____Actor = require("solar.solar-common.actor.Actor")
local Actor = ____Actor.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
local ____AbilityUtil = require("solar.solar-common.util.ability.AbilityUtil")
local AbilityUtil = ____AbilityUtil.default
local ____AbilityButtonUtil = require("solar.solar-common.util.ability.AbilityButtonUtil")
local AbilityButtonUtil = ____AbilityButtonUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorAbility = ____exports.default
ActorAbility.name = "ActorAbility"
__TS__ClassExtends(ActorAbility, Actor)
function ActorAbility.prototype.____constructor(self, actorTypeId, unit, startPosNum)
    Actor.prototype.____constructor(self, actorTypeId)
    self.startPosNum = startPosNum
    if unit == nil then
        return
    end
    if startPosNum ~= nil then
        self.posNum = ObjectTemplateUtil:getUnitAbilityTemplateNextNumber(unit, startPosNum)
    elseif self:get("y") ~= nil then
        local basePos = AbilityButtonUtil:getNumberByPos(
            self:get("x", 0),
            self:get("y")
        )
        self.posNum = ObjectTemplateUtil:getUnitAbilityTemplateNextNumber(unit, basePos)
    else
        self.posNum = ObjectTemplateUtil:getUnitAbilityTemplateNextNumber(unit, 1)
    end
    self.unit = unit
    self:addUnitAbilityTemplate(self.posNum)
    self:_sl_init()
    self:update()
end
function ActorAbility.prototype._sl_rawset(self, key, value)
    Actor.prototype._sl_rawset(self, key, value)
    local ability = self:getAbility()
    if ability == nil then
        return
    end
    repeat
        local ____switch9 = key
        local ____cond9 = ____switch9 == "id"
        if ____cond9 then
            EXSetAbilityDataString(ability, 1, ABILITY_DATA_NAME, self.uuid)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "name"
        if ____cond9 then
            EXSetAbilityDataString(ability, 1, ABILITY_DATA_TIP, value)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "icon"
        if ____cond9 then
            EXSetAbilityDataString(ability, 1, ABILITY_DATA_ART, value)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "disable"
        if ____cond9 then
            if self:get("disable") then
                self:getRootFrameControl():getDisableFrame().visible = true
            else
                local ____opt_0 = self:getRootFrameControl(false)
                local disableFrame = ____opt_0 and ____opt_0:getDisableFrame(false)
                if disableFrame then
                    disableFrame.visible = false
                end
            end
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "describe"
        if ____cond9 then
            EXSetAbilityDataString(ability, 1, ABILITY_DATA_UBERTIP, value)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "passive"
        if ____cond9 then
            if value == true then
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1)
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0)
            elseif self:get("targetType") ~= nil then
                AbilityUtil:setTargetType(ability, value)
            end
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "hide"
        if ____cond9 then
            SetPlayerAbilityAvailable(
                GetOwningPlayer(self.unit),
                self.abilityId,
                not value
            )
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "hotKey"
        if ____cond9 then
            EXSetAbilityDataInteger(
                ability,
                1,
                ABILITY_DATA_HOTKET,
                char2number(value) or 0
            )
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "range"
        if ____cond9 then
            EXSetAbilityDataReal(ability, 1, 107, value)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "area"
        if ____cond9 then
            EXSetAbilityDataReal(ability, 1, 106, value)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "targetType"
        if ____cond9 then
            if self:isPassive() then
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_C, 1)
                EXSetAbilityDataReal(ability, 1, ABILITY_DATA_DATA_B, 0)
            else
                AbilityUtil:setTargetType(ability, value)
            end
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "targetAllow"
        if ____cond9 then
            AbilityUtil:setTargetAllow(ability, value)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "dur"
        if ____cond9 then
            EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_DUR, value)
            EXSetAbilityDataInteger(ability, 1, ABILITY_DATA_HERODUR, value)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "manaCost"
        if ____cond9 then
            EXSetAbilityDataInteger(ability, 1, 104, value)
            break
        end
        ____cond9 = ____cond9 or ____switch9 == "maxCd"
        if ____cond9 then
            EXSetAbilityDataReal(ability, 1, ABILITY_DATA_COOL, value)
            break
        end
    until true
end
function ActorAbility.prototype.get(self, key, defaultValue)
    return Actor.prototype.get(self, key, defaultValue)
end
function ActorAbility.prototype.setPassive(self, passive)
    self:set("passive", passive)
end
function ActorAbility.prototype.isPassive(self)
    return self:get("passive", false)
end
function ActorAbility.prototype.setXY(self, x, y)
    Actor.prototype.setXY(self, x, y)
    self:setAbilityPos(AbilityButtonUtil:getNumberByPos(x, y))
end
function ActorAbility.prototype.setAbilityPos(self, pos)
    local ability = self:getAbility()
    if ability == nil then
        return
    end
    self:removeUnitAbilityTemplate()
    self:addUnitAbilityTemplate(pos)
    self:update()
end
function ActorAbility.prototype.addUnitAbilityTemplate(self, pos)
    self.abilityId = ObjectTemplateUtil:addUnitAbilityTemplate(self.unit, pos)
    self.templateId = self.abilityId
    SetPlayerAbilityAvailable(
        GetOwningPlayer(self.unit),
        self.abilityId,
        true
    )
    DataBase:getAbilityTypeSolarData(self.abilityId, true)._SL_solarActorAbility = self
end
function ActorAbility.prototype.removeUnitAbilityTemplate(self)
    if self.abilityId ~= nil then
        DataBase:getAbilityTypeSolarData(self.abilityId, true)._SL_solarActorAbility = nil
        if self.unit ~= nil then
            ObjectTemplateUtil:removeUnitAbilityTemplate(self.unit, self.abilityId)
        end
    end
end
function ActorAbility.prototype.getAbility(self)
    if self.abilityId ~= nil and self.unit ~= nil then
        return EXGetUnitAbility(self.unit, self.abilityId)
    end
    return nil
end
function ActorAbility.prototype.getMaxCd(self)
    return self:get("maxCd", 0)
end
function ActorAbility.prototype.setMaxCd(self, maxCd)
    self:set("maxCd", maxCd)
end
function ActorAbility.prototype.setCooldown(self, cd)
    EXSetAbilityState(
        self:getAbility(),
        1,
        cd
    )
end
function ActorAbility.prototype.getCooldown(self)
    return EXGetAbilityState(
        self:getAbility(),
        1
    )
end
function ActorAbility.prototype.setHotKey(self, hotKey)
    self:set("hotKey", hotKey)
end
function ActorAbility.prototype.update(self)
    if self._sl_isDestroyed then
        return
    end
    Actor.prototype.update(self)
    local ability = self:getAbility()
    if ability == nil then
        return
    end
    AbilityUtil:refreshAbility(self.unit, self.abilityId)
    if self:get("targetAllow") or self:get("targetType") then
        BaseUtil.runLater(
            0.01,
            function()
                if self:get("targetType") then
                    self:_sl_rawset(
                        "targetType",
                        self:get("targetType")
                    )
                end
                if self:get("targetAllow") then
                    self:_sl_rawset(
                        "targetAllow",
                        self:get("targetAllow")
                    )
                end
                AbilityUtil:refreshAbility(self.unit, self.abilityId)
            end
        )
    end
end
function ActorAbility.prototype.action(self, x, y, targetUnit)
    if self:isPassive() then
        return
    end
    Actor.prototype.action(self, x, y, targetUnit)
end
function ActorAbility.prototype.destroy(self)
    self:removeUnitAbilityTemplate()
    Actor.prototype.destroy(self)
end
__TS__SetDescriptor(
    ActorAbility.prototype,
    "actorType",
    {get = function(self)
        return self._actorType
    end},
    true
)
return ____exports
