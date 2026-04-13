local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__StringTrim = ____lualib.__TS__StringTrim
local __TS__StringSubstring = ____lualib.__TS__StringSubstring
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 5,["10"] = 5,["11"] = 5,["13"] = 5,["14"] = 11,["15"] = 12,["16"] = 13,["18"] = 16,["19"] = 17,["20"] = 18,["22"] = 19,["23"] = 20,["25"] = 22,["26"] = 23,["27"] = 24,["32"] = 27,["33"] = 11,["34"] = 35,["35"] = 36,["36"] = 37,["37"] = 35,["38"] = 44,["39"] = 45,["40"] = 44,["41"] = 52,["42"] = 53,["43"] = 52,["44"] = 60,["45"] = 61,["46"] = 60,["47"] = 68,["48"] = 69,["49"] = 68,["50"] = 76,["51"] = 77,["52"] = 76,["53"] = 84,["54"] = 85,["55"] = 84,["56"] = 92,["57"] = 93,["58"] = 92,["59"] = 100,["60"] = 101,["61"] = 100,["62"] = 108,["63"] = 109,["64"] = 108,["65"] = 116,["66"] = 117,["67"] = 116,["68"] = 125,["69"] = 126,["70"] = 125,["71"] = 134,["72"] = 135,["73"] = 136,["74"] = 134,["75"] = 144,["76"] = 145,["77"] = 144,["78"] = 152,["79"] = 153,["80"] = 152,["81"] = 161,["82"] = 162,["83"] = 163,["84"] = 161,["85"] = 171,["86"] = 172,["87"] = 173,["88"] = 171,["89"] = 180,["90"] = 181,["91"] = 182,["92"] = 183,["93"] = 183,["94"] = 183,["95"] = 183,["96"] = 180,["97"] = 191,["98"] = 192,["99"] = 191,["100"] = 199,["101"] = 200,["102"] = 199,["103"] = 207,["104"] = 208,["105"] = 207,["106"] = 216,["107"] = 217,["108"] = 218,["109"] = 219,["110"] = 220,["112"] = 222,["113"] = 216,["114"] = 230,["115"] = 231,["116"] = 232,["118"] = 234,["119"] = 235,["120"] = 236,["121"] = 237,["123"] = 239,["124"] = 240,["125"] = 241,["126"] = 242,["128"] = 244,["129"] = 245,["130"] = 246,["132"] = 248,["133"] = 230});
local ____exports = {}
____exports.default = __TS__Class()
local ObjectDataUtil = ____exports.default
ObjectDataUtil.name = "ObjectDataUtil"
function ObjectDataUtil.prototype.____constructor(self)
end
function ObjectDataUtil.idsStr2idsArray(self, idsStr)
    if idsStr == nil or #idsStr < 4 then
        return {}
    end
    local result = {}
    local idsTemp = __TS__StringSplit(idsStr, ",")
    for ____, id in ipairs(idsTemp) do
        do
            if id == nil then
                goto __continue5
            end
            id = __TS__StringTrim(id)
            if #id == 4 then
                result[#result + 1] = id
            end
        end
        ::__continue5::
    end
    return result
end
function ObjectDataUtil.getUnitResearches(self, objIdStr)
    local idsStr = ____exports.default:getUnitDataString(objIdStr, "Researches")
    return ____exports.default:idsStr2idsArray(idsStr)
end
function ObjectDataUtil.getUnitGoldCost(self, objIdStr)
    return ____exports.default:getUnitDataNumber(objIdStr, "goldcost")
end
function ObjectDataUtil.getUnitHP(self, objIdStr)
    return ____exports.default:getUnitDataNumber(objIdStr, "HP")
end
function ObjectDataUtil.getUnitDef(self, objIdStr)
    return ____exports.default:getUnitDataNumber(objIdStr, "def")
end
function ObjectDataUtil.getUnitDmgplus1(self, objIdStr)
    return ____exports.default:getUnitDataNumber(objIdStr, "dmgplus1")
end
function ObjectDataUtil.getUnitName(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Name")
end
function ObjectDataUtil.getUpgradeName(self, objIdStr)
    return ____exports.default:getUpgradeDataString(objIdStr, "Name")
end
function ObjectDataUtil.getUnitTip(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Tip")
end
function ObjectDataUtil.getUnitArt(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Art")
end
function ObjectDataUtil.getUnitFile(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "file")
end
function ObjectDataUtil.getUnitUbertip(self, objIdStr)
    return ____exports.default:getUnitDataString(objIdStr, "Ubertip")
end
function ObjectDataUtil.getUnitDataNumber(self, objIdStr, property)
    return tonumber(____exports.default:getUnitDataString(objIdStr, property))
end
function ObjectDataUtil.getUnitDataString(self, objIdStr, property)
    local obj = _g_objs.unit[objIdStr]
    return obj and obj[property]
end
function ObjectDataUtil.getItemDataNumber(self, objIdStr, property)
    return tonumber(____exports.default:getItemDataString(objIdStr, property))
end
function ObjectDataUtil.getItemAbilList(self, objIdStr)
    return ____exports.default:getItemDataString(objIdStr, "abilList")
end
function ObjectDataUtil.getItemDataString(self, objIdStr, property)
    local obj = _g_objs.item[objIdStr]
    return obj[tostring(property) .. "1"] or obj[property]
end
function ObjectDataUtil.getUpgradeDataString(self, objIdStr, property)
    local obj = _g_objs.upgrade[objIdStr]
    return obj[tostring(property) .. "1"] or obj[property]
end
function ObjectDataUtil.getAbilityBtnXY(self, objIdStr)
    local xyStr = ____exports.default:getAbilityDataString(objIdStr, "Buttonpos")
    local xyStrs = __TS__StringSplit(xyStr, ",")
    return {
        x = tonumber(xyStrs[1]),
        y = tonumber(xyStrs[2])
    }
end
function ObjectDataUtil.getAbilityDataNumber(self, objIdStr, property)
    return tonumber(____exports.default:getAbilityDataString(objIdStr, property))
end
function ObjectDataUtil.getAbilityName(self, objIdStr)
    return ____exports.default:getAbilityDataString(objIdStr, "Name")
end
function ObjectDataUtil.getAbilityArt(self, objIdStr)
    return ____exports.default:getAbilityDataString(objIdStr, "Art")
end
function ObjectDataUtil.getAbilityDataString(self, objIdStr, property)
    local obj = _g_objs.ability[objIdStr]
    if obj == nil then
        log.errorWithTraceBack("没有发现技能物编:" .. tostring(objIdStr))
        return nil
    end
    return obj[tostring(property) .. "1"] or obj[property]
end
function ObjectDataUtil.getStandardModelPath(self, path)
    if not path then
        return ""
    end
    local lenght = #path
    if lenght < 4 then
        path = path .. ".mdx"
        return path
    end
    local hsw = string.lower(__TS__StringSubstring(path, lenght - 4))
    if hsw == ".mdl" then
        path = __TS__StringSubstring(path, 0, lenght - 4) .. ".mdx"
        return path
    end
    if hsw ~= ".mdx" then
        path = path .. ".mdx"
        return path
    end
    return path
end
return ____exports
