local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 1,["10"] = 1,["11"] = 4,["12"] = 5,["13"] = 4,["14"] = 9,["15"] = 10,["16"] = 9,["17"] = 14,["18"] = 15,["19"] = 14,["20"] = 19,["21"] = 20,["22"] = 19,["23"] = 24,["24"] = 25,["25"] = 24,["26"] = 29,["27"] = 30,["28"] = 29,["29"] = 34,["30"] = 35,["31"] = 34,["32"] = 39,["33"] = 40,["34"] = 39,["35"] = 44,["36"] = 45,["37"] = 44,["38"] = 49,["39"] = 50,["40"] = 49,["41"] = 54,["42"] = 55,["43"] = 54,["44"] = 59,["45"] = 60,["46"] = 59,["47"] = 64,["48"] = 65,["49"] = 64,["50"] = 69,["51"] = 70,["52"] = 69,["53"] = 74,["54"] = 75,["55"] = 74,["56"] = 79,["57"] = 80,["58"] = 79,["59"] = 84,["60"] = 85,["61"] = 84,["62"] = 89,["63"] = 90,["64"] = 89,["65"] = 94,["66"] = 95,["67"] = 94,["68"] = 99,["69"] = 100,["70"] = 99,["71"] = 104,["72"] = 105,["73"] = 104,["74"] = 108,["75"] = 109,["76"] = 108,["77"] = 112,["78"] = 113,["79"] = 112,["80"] = 118,["81"] = 119,["82"] = 118,["83"] = 122,["84"] = 123,["85"] = 122,["86"] = 126,["87"] = 127,["88"] = 126,["89"] = 131,["90"] = 132,["91"] = 133,["92"] = 134,["93"] = 135,["94"] = 136,["95"] = 137,["97"] = 139,["98"] = 131,["99"] = 143,["100"] = 144,["101"] = 145,["102"] = 146,["103"] = 147,["104"] = 148,["105"] = 149,["107"] = 151,["108"] = 143,["109"] = 157,["110"] = 158,["111"] = 157});
local ____exports = {}
____exports.default = __TS__Class()
local NativeFrameUtil = ____exports.default
NativeFrameUtil.name = "NativeFrameUtil"
function NativeFrameUtil.prototype.____constructor(self)
end
function NativeFrameUtil.getGoldText(self)
    return DzSimpleFontStringFindByName("ResourceBarGoldText", 0)
end
function NativeFrameUtil.getLumberText(self)
    return DzSimpleFontStringFindByName("ResourceBarLumberText", 0)
end
function NativeFrameUtil.getSupplyText(self)
    return DzSimpleFontStringFindByName("ResourceBarSupplyText", 0)
end
function NativeFrameUtil.getItemName(self)
    return DzSimpleFontStringFindByName("SimpleItemNameValue", 3)
end
function NativeFrameUtil.getItemTips(self)
    return DzSimpleFontStringFindByName("SimpleItemDescriptionValue", 3)
end
function NativeFrameUtil.getUnitStatePanel(self)
    return DzSimpleFrameFindByName("SimpleInfoPanelIconDamage", 0)
end
function NativeFrameUtil.getHeroStatePanel(self)
    return DzSimpleFrameFindByName("SimpleInfoPanelIconHeroText", 6)
end
function NativeFrameUtil.getHeroPanel(self)
    return DzSimpleFrameFindByName("SimpleInfoPanelIconHero", 6)
end
function NativeFrameUtil.getUnitName(self)
    return DzSimpleFontStringFindByName("SimpleNameValue", 0)
end
function NativeFrameUtil.getUnitClass(self)
    return DzSimpleFontStringFindByName("SimpleClassValue", 0)
end
function NativeFrameUtil.getUnitAttackIcon(self, index)
    return DzSimpleTextureFindByName("InfoPanelIconBackdrop", index)
end
function NativeFrameUtil.getUnitAttackLabel(self, index)
    return DzSimpleFontStringFindByName("InfoPanelIconLabel", index)
end
function NativeFrameUtil.getUnitAttackValue(self, index)
    return DzSimpleFontStringFindByName("InfoPanelIconValue", index)
end
function NativeFrameUtil.getUnitArmorIcon(self)
    return DzSimpleTextureFindByName("InfoPanelIconBackdrop", 2)
end
function NativeFrameUtil.getUnitArmorLabel(self)
    return DzSimpleFontStringFindByName("InfoPanelIconLabel", 2)
end
function NativeFrameUtil.getUnitArmorValue(self)
    return DzSimpleFontStringFindByName("InfoPanelIconValue", 2)
end
function NativeFrameUtil.getUnitAttack2Icon(self)
    return DzSimpleTextureFindByName("InfoPanelIconBackdrop", 5)
end
function NativeFrameUtil.getHeroPanelIcon(self)
    return DzSimpleTextureFindByName("InfoPanelIconHeroIcon", 6)
end
function NativeFrameUtil.getProgressBar(self)
    return DzSimpleFrameFindByName("SimpleProgressIndicator", 0)
end
function NativeFrameUtil.getHeroLevelBar(self)
    return DzSimpleFrameFindByName("SimpleHeroLevelBar", 0)
end
function NativeFrameUtil.getHeroStrValue(self)
    return DzSimpleFontStringFindByName("InfoPanelIconHeroStrengthValue", 6)
end
function NativeFrameUtil.getHeroAgiValue(self)
    return DzSimpleFontStringFindByName("InfoPanelIconHeroAgilityValue", 6)
end
function NativeFrameUtil.getHeroIntValue(self)
    return DzSimpleFontStringFindByName("InfoPanelIconHeroIntellectValue", 6)
end
function NativeFrameUtil.getHeroStrLabel(self)
    return DzSimpleFontStringFindByName("InfoPanelIconHeroStrengthLabel", 6)
end
function NativeFrameUtil.getHeroAgiLabel(self)
    return DzSimpleFontStringFindByName("InfoPanelIconHeroAgilityLabel", 6)
end
function NativeFrameUtil.getHeroIntLabel(self)
    return DzSimpleFontStringFindByName("InfoPanelIconHeroIntellectLabel", 6)
end
function NativeFrameUtil.getHeroStateLabel(self, index)
    if index == 1 then
        return ____exports.default:getHeroStrLabel()
    elseif index == 2 then
        return ____exports.default:getHeroAgiLabel()
    elseif index == 3 then
        return ____exports.default:getHeroIntLabel()
    end
    return 0
end
function NativeFrameUtil.getHeroStateValue(self, index)
    if index == 1 then
        return ____exports.default:getHeroStrValue()
    elseif index == 2 then
        return ____exports.default:getHeroAgiValue()
    elseif index == 3 then
        return ____exports.default:getHeroIntValue()
    end
    return 0
end
function NativeFrameUtil.getUnitDetail(self)
    return DzSimpleFrameFindByName("SimpleInfoPanelUnitDetail", 0)
end
return ____exports
