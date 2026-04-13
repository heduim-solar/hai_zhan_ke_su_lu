local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__Number = ____lualib.__TS__Number
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 3,["11"] = 3,["12"] = 8,["13"] = 9,["14"] = 8,["15"] = 16,["16"] = 17,["17"] = 18,["18"] = 19,["19"] = 16,["20"] = 26,["21"] = 27,["22"] = 28,["23"] = 29,["24"] = 30,["25"] = 30,["26"] = 30,["28"] = 30,["29"] = 26,["30"] = 38,["31"] = 39,["32"] = 40,["33"] = 41,["34"] = 41,["35"] = 41,["36"] = 41,["37"] = 41,["38"] = 38,["39"] = 59,["40"] = 59,["41"] = 59,["43"] = 59,["44"] = 59,["46"] = 60,["47"] = 61,["48"] = 61,["49"] = 61,["50"] = 61,["51"] = 61,["53"] = 63,["54"] = 64,["55"] = 64,["56"] = 64,["57"] = 64,["58"] = 64,["60"] = 66,["61"] = 67,["62"] = 67,["63"] = 67,["64"] = 67,["65"] = 67,["67"] = 59,["68"] = 89,["69"] = 89,["70"] = 89,["72"] = 89,["73"] = 89,["75"] = 90,["76"] = 91,["77"] = 91,["78"] = 91,["79"] = 91,["80"] = 91,["82"] = 93,["83"] = 94,["84"] = 94,["85"] = 94,["86"] = 94,["87"] = 94,["89"] = 96,["90"] = 97,["91"] = 97,["92"] = 97,["93"] = 97,["94"] = 97,["96"] = 89,["97"] = 109,["98"] = 110,["99"] = 111,["100"] = 112,["101"] = 109,["102"] = 121,["103"] = 123,["104"] = 124,["105"] = 124,["106"] = 124,["107"] = 124,["108"] = 124,["109"] = 125,["110"] = 126,["111"] = 126,["112"] = 126,["113"] = 126,["114"] = 126,["115"] = 127,["116"] = 128,["117"] = 128,["118"] = 128,["119"] = 128,["120"] = 128,["122"] = 121,["123"] = 137,["124"] = 138,["125"] = 138,["126"] = 138,["127"] = 138,["128"] = 138,["129"] = 137,["130"] = 146,["131"] = 147,["132"] = 147,["133"] = 147,["134"] = 147,["135"] = 147,["136"] = 146,["137"] = 155,["138"] = 156,["139"] = 156,["140"] = 156,["141"] = 156,["142"] = 156,["143"] = 155,["144"] = 163,["145"] = 163,["146"] = 163,["148"] = 164,["149"] = 165,["150"] = 166,["151"] = 167,["152"] = 168,["153"] = 169,["154"] = 170,["156"] = 172,["157"] = 163,["158"] = 179,["159"] = 180,["160"] = 181,["161"] = 182,["162"] = 179,["163"] = 189,["164"] = 190,["165"] = 191,["166"] = 192,["167"] = 193,["168"] = 194,["169"] = 195,["170"] = 196,["172"] = 198,["173"] = 189,["174"] = 206,["175"] = 206,["176"] = 206,["178"] = 207,["179"] = 208,["180"] = 209,["181"] = 210,["182"] = 206,["183"] = 220,["184"] = 220,["185"] = 220,["187"] = 220,["188"] = 220,["190"] = 220,["191"] = 220,["193"] = 221,["194"] = 222,["195"] = 223,["197"] = 225,["198"] = 226,["200"] = 228,["201"] = 229,["203"] = 231,["204"] = 220});
local ____exports = {}
____exports.default = __TS__Class()
local HeroUtil = ____exports.default
HeroUtil.name = "HeroUtil"
function HeroUtil.prototype.____constructor(self)
end
function HeroUtil.isHero(self, handle)
    return IsHeroUnitId(GetUnitTypeId(handle))
end
function HeroUtil.getHeroPrimary(self, handle)
    local objIdStr = id2string(GetUnitTypeId(handle))
    local obj = _g_objs.unit[objIdStr]
    return obj.Primary
end
function HeroUtil.getHeroPrimaryPlus(self, handle)
    local objIdStr = id2string(GetUnitTypeId(handle))
    local obj = _g_objs.unit[objIdStr]
    local primaryPlus = obj[obj.Primary .. "plus"]
    local ____primaryPlus_0 = primaryPlus
    if ____primaryPlus_0 == nil then
        ____primaryPlus_0 = "0"
    end
    return __TS__Number(____primaryPlus_0)
end
function HeroUtil.getHeroPlus(self, handle)
    local objIdStr = id2string(GetUnitTypeId(handle))
    local obj = _g_objs.unit[objIdStr]
    return {
        __TS__Number(obj.STRplus),
        __TS__Number(obj.AGIplus),
        __TS__Number(obj.INTplus)
    }
end
function HeroUtil.addHeroProperty(self, handle, addStr, addAgi, addInt)
    if addAgi == nil then
        addAgi = addStr
    end
    if addInt == nil then
        addInt = addStr
    end
    if addStr ~= 0 then
        SetHeroStr(
            handle,
            GetHeroStr(handle, false) + addStr,
            true
        )
    end
    if addAgi ~= 0 then
        SetHeroAgi(
            handle,
            GetHeroAgi(handle, false) + addAgi,
            true
        )
    end
    if addInt ~= 0 then
        SetHeroInt(
            handle,
            GetHeroInt(handle, false) + addInt,
            true
        )
    end
end
function HeroUtil.addHeroPropertyP(self, handle, includeBonuses, addStrP, addAgiP, addIntP)
    if addAgiP == nil then
        addAgiP = addStrP
    end
    if addIntP == nil then
        addIntP = addStrP
    end
    if addStrP ~= 0 then
        SetHeroStr(
            handle,
            GetHeroStr(handle, includeBonuses) * (1 + addStrP),
            true
        )
    end
    if addAgiP ~= 0 then
        SetHeroAgi(
            handle,
            GetHeroAgi(handle, includeBonuses) * (1 + addAgiP),
            true
        )
    end
    if addIntP ~= 0 then
        SetHeroInt(
            handle,
            GetHeroInt(handle, includeBonuses) * (1 + addIntP),
            true
        )
    end
end
function HeroUtil.setHeroProperty(self, handle, newStr, newAgi, newInt)
    SetHeroStr(handle, newStr, true)
    SetHeroAgi(handle, newAgi, true)
    SetHeroInt(handle, newInt, true)
end
function HeroUtil.addHeroPropertyByKey(self, handle, key, addVal)
    if key == "STR" then
        SetHeroStr(
            handle,
            GetHeroStr(handle, false) + addVal,
            true
        )
    elseif key == "AGI" then
        SetHeroAgi(
            handle,
            GetHeroAgi(handle, false) + addVal,
            true
        )
    elseif key == "INT" then
        SetHeroInt(
            handle,
            GetHeroInt(handle, false) + addVal,
            true
        )
    end
end
function HeroUtil.addStr(self, handle, addVal)
    SetHeroStr(
        handle,
        GetHeroStr(handle, false) + addVal,
        true
    )
end
function HeroUtil.addAgi(self, handle, addVal)
    SetHeroAgi(
        handle,
        GetHeroAgi(handle, false) + addVal,
        true
    )
end
function HeroUtil.addInt(self, handle, addVal)
    SetHeroInt(
        handle,
        GetHeroInt(handle, false) + addVal,
        true
    )
end
function HeroUtil.getHeroPrimaryValue(self, handle, includeBonuses)
    if includeBonuses == nil then
        includeBonuses = true
    end
    local Primary = ____exports.default:getHeroPrimary(handle)
    if Primary == "STR" then
        return GetHeroStr(handle, includeBonuses)
    elseif Primary == "AGI" then
        return GetHeroAgi(handle, includeBonuses)
    elseif Primary == "INT" then
        return GetHeroInt(handle, includeBonuses)
    end
    return 0
end
function HeroUtil.addHeroPrimary(self, handle, addVal)
    local Primary = ____exports.default:getHeroPrimary(handle)
    ____exports.default:addHeroPropertyByKey(handle, Primary, addVal)
    return 0
end
function HeroUtil.getHeroPrimaryBonusValue(self, handle)
    local Primary = ____exports.default:getHeroPrimary(handle)
    if Primary == "STR" then
        return GetHeroStr(handle, true) - GetHeroStr(handle, false)
    elseif Primary == "AGI" then
        return GetHeroAgi(handle, true) - GetHeroAgi(handle, false)
    elseif Primary == "INT" then
        return GetHeroInt(handle, true) - GetHeroInt(handle, false)
    end
    return 0
end
function HeroUtil.getFullProperty(self, handle, includeBonuses)
    if includeBonuses == nil then
        includeBonuses = true
    end
    local fullProperty = GetHeroStr(handle, includeBonuses)
    fullProperty = fullProperty + GetHeroAgi(handle, includeBonuses)
    fullProperty = fullProperty + GetHeroInt(handle, includeBonuses)
    return fullProperty
end
function HeroUtil.getPropertyWithScale(self, handle, strScale, agiScale, intScale)
    if strScale == nil then
        strScale = 0
    end
    if agiScale == nil then
        agiScale = 0
    end
    if intScale == nil then
        intScale = 0
    end
    local fullProperty = 0
    if strScale ~= 0 then
        fullProperty = fullProperty + GetHeroStr(handle, true) * strScale
    end
    if agiScale ~= 0 then
        fullProperty = fullProperty + GetHeroAgi(handle, true) * agiScale
    end
    if intScale ~= 0 then
        fullProperty = fullProperty + GetHeroInt(handle, true) * intScale
    end
    return fullProperty
end
return ____exports
