local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["8"] = 1,["9"] = 1,["10"] = 2,["11"] = 2,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 5,["17"] = 5,["18"] = 6,["19"] = 6,["20"] = 14,["21"] = 14,["22"] = 14,["23"] = 14,["24"] = 18,["25"] = 18,["26"] = 18,["28"] = 18,["29"] = 18,["31"] = 14,["32"] = 21,["33"] = 22,["34"] = 23,["36"] = 25,["37"] = 26,["38"] = 27,["39"] = 28,["40"] = 29,["42"] = 31,["43"] = 32,["44"] = 34,["45"] = 36,["47"] = 38,["48"] = 39,["49"] = 40,["50"] = 18,["51"] = 51,["52"] = 14,["54"] = 53,["55"] = 79,["56"] = 54,["60"] = 56,["62"] = 57,["65"] = 59,["67"] = 60,["70"] = 62,["72"] = 63,["75"] = 65,["77"] = 66,["80"] = 68,["82"] = 69,["85"] = 71,["87"] = 72,["90"] = 74,["92"] = 76,["93"] = 76,["97"] = 78,["99"] = 79,["100"] = 79,["101"] = 79,["102"] = 79,["103"] = 79,["104"] = 81,["105"] = 81,["109"] = 83,["111"] = 84,["112"] = 84,["113"] = 84,["114"] = 84,["115"] = 84,["116"] = 86,["117"] = 86,["121"] = 88,["123"] = 89,["124"] = 89,["125"] = 89,["126"] = 89,["127"] = 89,["128"] = 91,["129"] = 91,["133"] = 93,["135"] = 94,["136"] = 95,["138"] = 97,["139"] = 97,["140"] = 98,["141"] = 99,["146"] = 103,["148"] = 104,["152"] = 51,["153"] = 110,["154"] = 14,["155"] = 110,["156"] = 118,["157"] = 119,["158"] = 120,["160"] = 14,["162"] = 118,["163"] = 130,["164"] = 131,["165"] = 130,["166"] = 138,["167"] = 139,["168"] = 138,["169"] = 147,["170"] = 148,["171"] = 148,["172"] = 148,["173"] = 148,["174"] = 149,["175"] = 150,["176"] = 147,["177"] = 158,["178"] = 159,["179"] = 160,["180"] = 161,["182"] = 158,["183"] = 170,["184"] = 171,["185"] = 171,["186"] = 171,["187"] = 171,["188"] = 170,["189"] = 175,["190"] = 176,["191"] = 177,["192"] = 178,["193"] = 175,["194"] = 182,["195"] = 183,["198"] = 186,["199"] = 14,["200"] = 189,["201"] = 192,["202"] = 193,["205"] = 196,["206"] = 182,["207"] = 202,["208"] = 203,["209"] = 204,["210"] = 204,["211"] = 204,["212"] = 204,["213"] = 204,["214"] = 206,["215"] = 206,["216"] = 206,["217"] = 208,["218"] = 209,["222"] = 212,["223"] = 212,["224"] = 213,["225"] = 214,["226"] = 215,["227"] = 216,["229"] = 218,["230"] = 219,["231"] = 220,["232"] = 221,["233"] = 222,["236"] = 212,["239"] = 227,["240"] = 228,["241"] = 206,["242"] = 206,["243"] = 202,["244"] = 233,["245"] = 14,["246"] = 235,["247"] = 237,["248"] = 237,["249"] = 237,["250"] = 238,["251"] = 239,["253"] = 237,["254"] = 237,["256"] = 233,["257"] = 246,["258"] = 247,["259"] = 14,["260"] = 249,["261"] = 250,["263"] = 252,["264"] = 253,["265"] = 254,["267"] = 246,["272"] = 48});
local ____exports = {}
local ____ActorAbility = require("solar.solar-common.actor.ActorAbility")
local ActorAbility = ____ActorAbility.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____ObjectTemplateUtil = require("solar.solar-common.util.object.ObjectTemplateUtil")
local ObjectTemplateUtil = ____ObjectTemplateUtil.default
local ____ColorUtil = require("solar.solar-common.util.lang.ColorUtil")
local ColorUtil = ____ColorUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
____exports.default = __TS__Class()
local ActorItem = ____exports.default
ActorItem.name = "ActorItem"
__TS__ClassExtends(ActorItem, ActorAbility)
function ActorItem.prototype.____constructor(self, actorTypeId, x, y)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    ActorAbility.prototype.____constructor(self, actorTypeId)
    local templateType = self:getTemplateType()
    if templateType == nil then
        templateType = "主动物品"
    end
    self.itemId = ObjectTemplateUtil:borrowTemplate(templateType)
    self.templateId = self.itemId
    self.abilityId = ObjectDataUtil:getItemAbilList(self.itemId)
    if self.abilityId ~= nil and #self.abilityId ~= 4 then
        self.abilityId = nil
    end
    self.item = CreateItem(self.itemId, x, y)
    DataBase:getItemSolarData(self.item, true)._SL_solarActorItem = self
    if self.abilityId ~= nil then
        DataBase:getAbilityTypeSolarData(self.abilityId, true)._SL_solarActorAbility = self
    end
    self:set("templateType", templateType)
    self:_sl_init()
    self:update()
end
function ActorItem.prototype._sl_rawset(self, key, value)
    ActorAbility.prototype._sl_rawset(self, key, value)
    repeat
        local ____switch7 = key
        local colorIntByRGB, colorIntByRGB2, colorIntByRGB3
        local ____cond7 = ____switch7 == "id"
        if ____cond7 then
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "name"
        if ____cond7 then
            EXSetItemDataString(self.itemId, 4, value)
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "describe"
        if ____cond7 then
            EXSetItemDataString(self.itemId, 3, value)
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "hide"
        if ____cond7 then
            SetItemVisible(self.item, not value)
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "pawnable"
        if ____cond7 then
            SetItemPawnable(self.item, value)
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "droppable"
        if ____cond7 then
            SetItemDroppable(self.item, value)
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "uses"
        if ____cond7 then
            SetItemCharges(self.item, value)
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "model"
        if ____cond7 then
            if SetUnitModel ~= nil then
                SetUnitModel(self.item, value)
            end
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "colorR"
        if ____cond7 then
            colorIntByRGB = ColorUtil:getColorIntByRGB(
                value or 255,
                self:get("colorG", 255),
                self:get("colorB", 255)
            )
            if EXSetItemColor ~= nil then
                EXSetItemColor(self.item, colorIntByRGB)
            end
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "colorG"
        if ____cond7 then
            colorIntByRGB2 = ColorUtil:getColorIntByRGB(
                self:get("colorR", 255),
                value or 255,
                self:get("colorB", 255)
            )
            if EXSetItemColor ~= nil then
                EXSetItemColor(self.item, colorIntByRGB2)
            end
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "colorB"
        if ____cond7 then
            colorIntByRGB3 = ColorUtil:getColorIntByRGB(
                self:get("colorR", 255),
                self:get("colorG", 255),
                value or 255
            )
            if EXSetItemColor ~= nil then
                EXSetItemColor(self.item, colorIntByRGB3)
            end
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "disable"
        if ____cond7 then
            if self:get("disable") then
                self:getRootFrameControl():getDisableFrame().visible = true
            else
                local ____opt_8 = self:getRootFrameControl(false)
                local disableFrame = ____opt_8 and ____opt_8:getDisableFrame(false)
                if disableFrame then
                    disableFrame.visible = false
                end
            end
            break
        end
        ____cond7 = ____cond7 or ____switch7 == "icon"
        if ____cond7 then
            self:refreshIcon()
            break
        end
    until true
end
function ActorItem.prototype.get(self, key, defaultValue)
    return ActorAbility.prototype.get(self, key, defaultValue)
end
function ActorItem.prototype.getAbility(self)
    if GetItemAbility then
        return GetItemAbility(self.item, 0)
    else
        return ActorAbility.prototype.getAbility(self)
    end
end
function ActorItem.prototype.setPawnable(self, pawnable)
    self:set("pawnable", pawnable)
end
function ActorItem.prototype.setDroppable(self, droppable)
    self:set("droppable", droppable)
end
function ActorItem.prototype.addUses(self, add)
    local newUses = math.max(
        GetItemCharges(self.item),
        1
    ) + add
    self:setUses(newUses)
    return newUses
end
function ActorItem.prototype.setUses(self, newUses)
    self:set("uses", newUses)
    if newUses <= 0 and self:get("destroyOnNoUses") == true then
        self:destroy()
    end
end
function ActorItem.prototype.getUses(self)
    return math.max(
        GetItemCharges(self.item),
        1
    )
end
function ActorItem.prototype.setXY(self, x, y)
    self:set("x", x)
    self:set("y", y)
    SetItemPosition(self.item, x, y)
end
function ActorItem.prototype.update(self)
    if self._sl_isDestroyed then
        return
    end
    self.updating = true
    ActorAbility.prototype.update(self)
    if self.unit ~= nil then
        if selection() == self.unit then
            SelectUnit(self.unit, true)
        end
    end
    self.updating = false
end
function ActorItem.prototype.refreshIcon(self)
    self.updating = true
    EXSetItemDataString(
        self.itemId,
        1,
        self:get("icon")
    )
    BaseUtil.runLater(
        0.01,
        function()
            if self.unit == nil then
                self.updating = false
                return
            end
            do
                local i = 0
                while i < 6 do
                    if UnitItemInSlot(self.unit, i) == self.item then
                        local tempSlot = 5
                        if i == 5 then
                            tempSlot = 4
                        end
                        local tempSlotItem = UnitItemInSlot(self.unit, tempSlot)
                        UnitDropItemSlot(self.unit, self.item, tempSlot)
                        UnitDropItemSlot(self.unit, self.item, i)
                        UnitDropItemSlot(self.unit, tempSlotItem, tempSlot)
                        self.updating = false
                        return
                    end
                    i = i + 1
                end
            end
            self.unit = nil
            self.updating = false
        end
    )
end
function ActorItem.prototype.action(self, x, y, targetUnit)
    ActorAbility.prototype.action(self, x, y, targetUnit)
    if self:get("destroyOnNoUses") == true then
        BaseUtil.runLater(
            0.05,
            function()
                if IsHandle(self.item) then
                    self:setUses(GetItemCharges(self.item))
                end
            end
        )
    end
end
function ActorItem.prototype.destroy(self)
    local item = self.item
    ActorAbility.prototype.destroy(self)
    if self.abilityId ~= nil then
        DataBase:getAbilityTypeSolarData(self.abilityId, true)._SL_solarActorAbility = nil
    end
    self.item = nil
    if IsHandle(item) then
        RemoveItem(item)
    end
end
__TS__SetDescriptor(
    ActorItem.prototype,
    "actorType",
    {get = function(self)
        return self._actorType
    end},
    true
)
return ____exports
