local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 4,["13"] = 4,["14"] = 5,["15"] = 5,["16"] = 21,["17"] = 22,["18"] = 22,["19"] = 22,["20"] = 33,["21"] = 33,["22"] = 33,["24"] = 26,["25"] = 27,["26"] = 28,["27"] = 31,["28"] = 34,["29"] = 34,["30"] = 34,["31"] = 34,["32"] = 48,["33"] = 48,["34"] = 48,["35"] = 48,["36"] = 48,["37"] = 48,["38"] = 49,["39"] = 48,["40"] = 48,["41"] = 33,["42"] = 62,["43"] = 63,["44"] = 64,["45"] = 65,["46"] = 66,["47"] = 67,["49"] = 62,["50"] = 76,["51"] = 79,["54"] = 82,["57"] = 85,["59"] = 86,["60"] = 86,["61"] = 87,["62"] = 90,["63"] = 92,["64"] = 93,["65"] = 94,["66"] = 86,["69"] = 76,["70"] = 98,["71"] = 99,["72"] = 100,["75"] = 103,["76"] = 104,["77"] = 104,["78"] = 105,["79"] = 106,["80"] = 107,["81"] = 108,["83"] = 110,["85"] = 112,["86"] = 113,["88"] = 115,["89"] = 116,["91"] = 118,["93"] = 121,["94"] = 124,["95"] = 126,["97"] = 129,["98"] = 131,["99"] = 131,["100"] = 132,["101"] = 133,["104"] = 138,["105"] = 98,["106"] = 141,["107"] = 142,["108"] = 143,["110"] = 144,["114"] = 150,["115"] = 151,["116"] = 152,["117"] = 153,["118"] = 154,["119"] = 156,["125"] = 161,["126"] = 162,["127"] = 163,["128"] = 164,["129"] = 165,["130"] = 166,["134"] = 141,["135"] = 172,["136"] = 173,["137"] = 175,["139"] = 177,["140"] = 177,["141"] = 178,["142"] = 179,["143"] = 180,["144"] = 181,["145"] = 182,["146"] = 183,["147"] = 183,["148"] = 183,["149"] = 183,["150"] = 183,["151"] = 188,["156"] = 191,["157"] = 192,["158"] = 193,["159"] = 194,["160"] = 195,["163"] = 198,["164"] = 198,["165"] = 198,["166"] = 198,["167"] = 198,["168"] = 198,["169"] = 198,["170"] = 205,["171"] = 206,["172"] = 207,["173"] = 208,["174"] = 209,["177"] = 213,["178"] = 213,["179"] = 213,["180"] = 213,["181"] = 213,["182"] = 213,["183"] = 213,["184"] = 220,["185"] = 221,["186"] = 222,["187"] = 223,["188"] = 224,["191"] = 228,["192"] = 228,["193"] = 228,["194"] = 228,["195"] = 228,["196"] = 228,["197"] = 228,["198"] = 235,["199"] = 236,["200"] = 237,["201"] = 238,["202"] = 239,["205"] = 243,["206"] = 243,["207"] = 243,["208"] = 243,["209"] = 243,["210"] = 243,["211"] = 243,["212"] = 250,["213"] = 251,["214"] = 252,["215"] = 253,["216"] = 254,["219"] = 258,["220"] = 258,["221"] = 177,["224"] = 261,["225"] = 172,["226"] = 24});
local ____exports = {}
local React = require("solar.solar-common.w3ts.tsx.index")
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local ____TextUtil = require("solar.solar-common.util.text.TextUtil")
local TextUtil = ____TextUtil.default
local ____AttributeUtil = require("solar.solar-common.util.system.AttributeUtil")
local AttributeUtil = ____AttributeUtil.default
local ____SelectUtil = require("solar.solar-common.util.unit.SelectUtil")
local SelectUtil = ____SelectUtil.default
DzLoadToc("UI\\UiProperty.toc")
____exports.default = __TS__Class()
local UiProperty = ____exports.default
UiProperty.name = "UiProperty"
function UiProperty.prototype.____constructor(self, container)
    if container == nil then
        container = DzGetGameUI()
    end
    self.root = __TS__New(Frame)
    self.background = __TS__New(Frame)
    self.btn_switch = __TS__New(Frame)
    self._frameDics = {}
    React.render(
        self:render(),
        container
    )
    DzTriggerRegisterKeyEventByCode(
        nil,
        9,
        1,
        false,
        function()
            self:onClick()
        end
    )
end
function UiProperty.prototype.onClick(self)
    local triggerPlayer = DzGetTriggerKeyPlayer()
    if GetLocalPlayer() == triggerPlayer then
        self.background:setVisible(not self.background.visible)
        local hero = SelectUtil.getAnHero(GetPlayerId(GetLocalPlayer()))
        self:updateUIWithUnitPropertyChanged(hero)
    end
end
function UiProperty.prototype.updateUIWithUnitPropertyChanged(self, whichUnit)
    if not IsHandle(whichUnit) or not IsHeroUnitId(GetUnitTypeId(whichUnit)) then
        return
    end
    if GetLocalPlayer() ~= GetOwningPlayer(whichUnit) then
        return
    end
    local count = math.ceil(#____exports.default.config / 2)
    do
        local index = 0
        while index < count do
            local cfData1 = ____exports.default.config[2 * index + 1]
            local cfData2 = ____exports.default.config[2 * index + 1 + 1]
            local frameDic = self._frameDics[index + 1]
            ____exports.default:updatePropertyUI(whichUnit, frameDic.txt_property1, cfData1)
            ____exports.default:updatePropertyUI(whichUnit, frameDic.txt_property2, cfData2)
            index = index + 1
        end
    end
end
function UiProperty.updatePropertyUI(self, whichUnit, textFrame, data)
    if not data then
        textFrame:setText("")
        return
    end
    local text = ""
    local ____opt_0 = AttributeUtil:getUnitAttribute(whichUnit)
    local unitProperty = ____opt_0 and ____opt_0[data.key]
    local propertyValue
    if data.childKey then
        local property = unitProperty or ({})
        propertyValue = property[data.childKey] or 0
    else
        propertyValue = unitProperty or 0
    end
    if data.add_show_num then
        propertyValue = propertyValue + data.add_show_num
    end
    if data.showPercentage then
        text = "|CFF00FF80" .. TextUtil:toPercentage(propertyValue, 0)
    else
        text = "|CFF00FF80" .. tostring(propertyValue)
    end
    if data.key == "ability_speed" then
        local cool_p = propertyValue / (100 + propertyValue)
        text = (text .. " | ") .. TextUtil:toPercentage(cool_p, 2)
    end
    if data.key == "damage_reduction" then
        local ____opt_2 = AttributeUtil:getUnitAttribute(whichUnit)
        local drul = ____opt_2 and ____opt_2.damage_reduction_upper_limit
        if drul then
            text = (text .. " | ") .. TextUtil:toPercentage(drul)
        end
    end
    textFrame:setText(text)
end
function UiProperty.prototype.render(self)
    local items = self:getItems()
    return React:createElement(
        "div",
        {size = {width = 0.001, height = 0.001}, visible = true, ref = self.root},
        React:createElement("backdrop", {
            id = "bd_property",
            inherits = "Backdrop",
            position = {x = 0.26, y = 0.168},
            size = {width = 0.24, height = 0.37},
            visible = false,
            ref = self.background,
            texture = "Property\\bg_property.tga"
        }, items),
        React:createElement(
            "button",
            {
                id = "btn_switch",
                inherits = "Button",
                position = {x = 0.005, y = 0.48},
                size = {width = 0.03, height = 0.04},
                visible = false,
                ref = self.btn_switch,
                ["background-image"] = "menu\\anniu15.tga",
                onClick = function() return self:onClick() end
            }
        )
    )
end
function UiProperty.prototype.getItems(self)
    local items = {}
    local count = math.ceil(#____exports.default.config / 2)
    do
        local index = 0
        while index < count do
            local x = 0.0065
            local y = 0.33 - index * 0.016
            local texture = 1 == index & 1 and "Property\\property2.tga" or "Property\\property1.tga"
            local text1 = ____exports.default.config[2 * index + 1] and ____exports.default.config[2 * index + 1].Name or ""
            local text2 = ____exports.default.config[2 * index + 1 + 1] and ____exports.default.config[2 * index + 1 + 1].Name or ""
            local frameDic = {
                bd_back = __TS__New(Frame),
                txt_property1 = __TS__New(Frame),
                txt_property2 = __TS__New(Frame)
            }
            items[#items + 1] = React:createElement(
                "backdrop",
                {
                    id = "bd_item_back",
                    inherits = "Backdrop",
                    position = {x = x, y = y},
                    size = {width = 0.24, height = 0.012},
                    visible = true,
                    texture = texture,
                    ref = frameDic.bd_back
                },
                React:createElement("text", {
                    position = {
                        point = FRAMEPOINT_LEFT,
                        relative = "parent",
                        relativePoint = FRAMEPOINT_LEFT,
                        x = 0,
                        y = 0
                    },
                    size = {width = 0.1384, height = 0},
                    text = text1,
                    textAlignment = TEXTALIGN_LEFT,
                    textColor = 16744448,
                    font = {fileName = "ZITI.TTF", height = 0.008, flags = 0}
                }),
                React:createElement("text", {
                    position = {
                        point = FRAMEPOINT_LEFT,
                        relative = "parent",
                        relativePoint = FRAMEPOINT_LEFT,
                        x = 0.08,
                        y = 0
                    },
                    size = {width = 0.1384, height = 0},
                    ref = frameDic.txt_property1,
                    textAlignment = TEXTALIGN_LEFT,
                    textColor = 16744448,
                    font = {fileName = "ZITI.TTF", height = 0.008, flags = 0}
                }),
                React:createElement("text", {
                    position = {
                        point = FRAMEPOINT_LEFT,
                        relative = "parent",
                        relativePoint = FRAMEPOINT_LEFT,
                        x = 0.12,
                        y = 0
                    },
                    size = {width = 0.1384, height = 0},
                    text = text2,
                    textAlignment = TEXTALIGN_LEFT,
                    textColor = 16744448,
                    font = {fileName = "ZITI.TTF", height = 0.008, flags = 0}
                }),
                React:createElement("text", {
                    position = {
                        point = FRAMEPOINT_LEFT,
                        relative = "parent",
                        relativePoint = FRAMEPOINT_LEFT,
                        x = 0.2,
                        y = 0
                    },
                    size = {width = 0.1384, height = 0},
                    ref = frameDic.txt_property2,
                    textAlignment = TEXTALIGN_LEFT,
                    textColor = 16744448,
                    font = {fileName = "ZITI.TTF", height = 0.008, flags = 0}
                })
            )
            local ____self__frameDics_4 = self._frameDics
            ____self__frameDics_4[#____self__frameDics_4 + 1] = frameDic
            index = index + 1
        end
    end
    return items
end
UiProperty.config = {}
return ____exports
