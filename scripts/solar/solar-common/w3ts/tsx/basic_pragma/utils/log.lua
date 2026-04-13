local ____lualib = require("lualib_bundle")
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayEvery = ____lualib.__TS__ArrayEvery
local __TS__StringSlice = ____lualib.__TS__StringSlice
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectEntries = ____lualib.__TS__ObjectEntries
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["13"] = 1,["14"] = 1,["15"] = 3,["16"] = 4,["17"] = 5,["18"] = 6,["19"] = 9,["20"] = 10,["21"] = 10,["23"] = 13,["24"] = 14,["25"] = 14,["26"] = 14,["27"] = 9,["28"] = 22,["29"] = 23,["30"] = 24,["31"] = 24,["32"] = 24,["33"] = 24,["34"] = 24,["35"] = 22,["36"] = 28,["37"] = 28,["38"] = 28,["40"] = 28,["41"] = 28,["43"] = 29,["44"] = 29,["46"] = 30,["47"] = 30,["49"] = 31,["50"] = 32,["52"] = 33,["53"] = 34,["55"] = 35,["56"] = 35,["58"] = 37,["59"] = 39,["60"] = 42,["61"] = 43,["63"] = 45,["64"] = 45,["65"] = 46,["66"] = 50,["67"] = 50,["69"] = 45,["72"] = 52,["73"] = 53,["74"] = 54,["75"] = 54,["78"] = 57,["79"] = 57,["80"] = 57,["81"] = 59,["82"] = 59,["83"] = 59,["84"] = 61,["85"] = 62,["86"] = 62,["87"] = 59,["88"] = 59,["89"] = 59,["90"] = 57,["91"] = 66,["92"] = 66,["93"] = 66,["94"] = 57,["95"] = 57,["96"] = 57,["97"] = 57,["99"] = 75,["100"] = 76,["101"] = 77,["102"] = 80,["103"] = 81,["105"] = 82,["106"] = 82,["107"] = 83,["108"] = 85,["109"] = 91,["110"] = 92,["112"] = 82,["115"] = 95,["116"] = 96,["117"] = 97,["118"] = 98,["122"] = 102,["123"] = 102,["124"] = 102,["125"] = 104,["126"] = 104,["127"] = 104,["128"] = 105,["129"] = 105,["130"] = 105,["131"] = 105,["132"] = 105,["133"] = 106,["134"] = 107,["135"] = 108,["136"] = 108,["137"] = 108,["138"] = 104,["139"] = 104,["140"] = 104,["141"] = 102,["142"] = 114,["143"] = 114,["144"] = 114,["145"] = 102,["146"] = 102,["147"] = 102,["148"] = 102,["150"] = 118,["151"] = 120,["152"] = 121,["153"] = 28,["154"] = 125,["155"] = 125,["156"] = 126,["157"] = 126,["158"] = 126,["159"] = 126,["160"] = 126,["161"] = 126,["162"] = 126,["163"] = 126,["164"] = 126,["165"] = 126,["166"] = 126,["167"] = 126,["168"] = 126,["169"] = 125});
local ____exports = {}
local ____colorize = require("solar.solar-common.w3ts.tsx.basic_pragma.utils.colorize")
local colorize = ____colorize.colorize
local MAX_WIDTH = 78
local TRAILING_COMMA = false
local INDENT = "  "
local INDENT_WIDTH = #INDENT
local function isArray(____, v)
    if type(v) ~= "table" then
        return false
    end
    return __TS__ArrayEvery(
        __TS__ObjectKeys(v),
        function(____, v, index) return __TS__ParseInt(v) == index + 1 or __TS__ParseInt(v) == index end
    ) and (v[0] ~= nil or v[1] ~= nil)
end
local function userdataType(____, userdata)
    local typeString = tostring(userdata)
    return __TS__StringSlice(
        typeString,
        0,
        (string.find(typeString, ":", nil, true) or 0) - 1
    )
end
____exports.termToString = function(____, v, color, level)
    if color == nil then
        color = true
    end
    if level == nil then
        level = 0
    end
    if type(v) == "string" then
        return color and colorize:string(("\"" .. v) .. "\"") or v
    end
    if type(v) == "number" then
        return color and colorize:number(v) or tostring(v)
    end
    if type(v) == "boolean" then
        return color and colorize:boolean(v) or tostring(v)
    end
    if type(v) == "function" then
        return color and colorize:number("<function>") or "<function>"
    end
    if v == nil then
        return color and colorize:boolean("null") or "null"
    end
    if isArray(nil, v) then
        local arr = v
        local tryingCompact = level + #arr * 3 + 2 < MAX_WIDTH
        local compact = "[" .. (#arr and " " or "")
        do
            local i = 0
            while i < #arr and tryingCompact do
                compact = compact .. ____exports.termToString(nil, arr[i + 1], color, level + 1) .. (i < #arr - 1 and ", " or "")
                if #compact > MAX_WIDTH then
                    tryingCompact = false
                end
                i = i + 1
            end
        end
        if tryingCompact then
            compact = compact .. (#arr and " " or "") .. "]"
            if #compact <= MAX_WIDTH then
                return compact
            end
        end
        return table.concat(
            {
                "[",
                table.concat(
                    __TS__ArrayMap(
                        arr,
                        function(____, element) return string.rep(
                            INDENT,
                            math.floor(level + 1)
                        ) .. ____exports.termToString(nil, element, color, level + 1) end
                    ),
                    ",\n"
                ) .. (TRAILING_COMMA and "," or ""),
                string.rep(
                    INDENT,
                    math.floor(level)
                ) .. "]"
            },
            "\n"
        )
    end
    if type(v) == "table" and v ~= nil then
        local entries = __TS__ObjectEntries(v)
        local tryingCompact = level * INDENT_WIDTH + #entries * 3 + 2 < MAX_WIDTH
        if tryingCompact then
            local compact = "{" .. (#entries > 0 and " " or "")
            do
                local i = 0
                while i < #entries and tryingCompact do
                    local key, value = table.unpack(entries[i + 1], 1, 2)
                    compact = compact .. ((tostring(key) .. ": ") .. ____exports.termToString(nil, value, color, level + 1)) .. (i < #entries - 1 and ", " or "")
                    if level * INDENT_WIDTH + #compact > MAX_WIDTH then
                        tryingCompact = false
                    end
                    i = i + 1
                end
            end
            if tryingCompact then
                compact = compact .. (#entries and " " or "") .. "}"
                if level * INDENT_WIDTH + #compact <= MAX_WIDTH then
                    return compact
                end
            end
        end
        return table.concat(
            {
                "{",
                table.concat(
                    __TS__ArrayMap(
                        entries,
                        function(____, ____bindingPattern0)
                            local value
                            local key
                            key = ____bindingPattern0[1]
                            value = ____bindingPattern0[2]
                            local prefix = tostring(key) .. ": "
                            return (string.rep(
                                INDENT,
                                math.floor(level + 1)
                            ) .. prefix) .. ____exports.termToString(nil, value, color, level + 1)
                        end
                    ),
                    ",\n"
                ) .. (TRAILING_COMMA and "," or ""),
                string.rep(
                    INDENT,
                    math.floor(level)
                ) .. "}"
            },
            "\n"
        )
    end
    local ____type = userdataType(nil, v)
    local str = ("<" .. ____type) .. ">"
    return color and colorize:handle(str) or str
end
____exports.log = function(____, ...)
    local args = {...}
    return __TS__ArrayForEach(
        __TS__StringSplit(
            table.concat(
                __TS__ArrayMap(
                    args,
                    function(____, v) return ____exports.termToString(nil, v) end
                ),
                " "
            ),
            "\n"
        ),
        function(____, line) return print(line) end
    )
end
return ____exports
