local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 4,["9"] = 4,["10"] = 4,["12"] = 4,["13"] = 17,["14"] = 17,["15"] = 17,["17"] = 17,["18"] = 17,["20"] = 17,["21"] = 17,["23"] = 17,["24"] = 17,["26"] = 17,["27"] = 17,["29"] = 18,["30"] = 19,["31"] = 19,["32"] = 19,["33"] = 19,["34"] = 19,["35"] = 19,["36"] = 19,["37"] = 20,["38"] = 20,["39"] = 20,["40"] = 20,["41"] = 20,["42"] = 20,["43"] = 21,["44"] = 22,["45"] = 23,["46"] = 24,["47"] = 25,["48"] = 26,["50"] = 28,["51"] = 17,["52"] = 31,["53"] = 31,["54"] = 31,["56"] = 31,["57"] = 31,["59"] = 32,["60"] = 32,["61"] = 32,["62"] = 32,["63"] = 32,["64"] = 32,["65"] = 32,["66"] = 32,["67"] = 32,["68"] = 31,["69"] = 42,["70"] = 42,["71"] = 42,["73"] = 42,["74"] = 42,["76"] = 43,["77"] = 43,["78"] = 43,["79"] = 43,["80"] = 43,["81"] = 43,["82"] = 43,["83"] = 43,["84"] = 43,["85"] = 42,["86"] = 53,["87"] = 53,["88"] = 53,["90"] = 53,["91"] = 53,["93"] = 54,["94"] = 54,["95"] = 54,["96"] = 54,["97"] = 54,["98"] = 54,["99"] = 54,["100"] = 54,["101"] = 54,["102"] = 53,["103"] = 64,["104"] = 64,["105"] = 64,["107"] = 64,["108"] = 64,["110"] = 65,["111"] = 65,["112"] = 65,["113"] = 65,["114"] = 65,["115"] = 65,["116"] = 65,["117"] = 65,["118"] = 65,["119"] = 64,["120"] = 68,["121"] = 68,["122"] = 68,["124"] = 68,["125"] = 68,["127"] = 69,["128"] = 69,["129"] = 69,["130"] = 69,["131"] = 69,["132"] = 69,["133"] = 69,["134"] = 69,["135"] = 69,["136"] = 68,["137"] = 72,["138"] = 72,["139"] = 72,["141"] = 72,["142"] = 72,["144"] = 73,["145"] = 73,["146"] = 73,["147"] = 73,["148"] = 73,["149"] = 73,["150"] = 73,["151"] = 73,["152"] = 73,["153"] = 72,["154"] = 76,["155"] = 76,["156"] = 76,["158"] = 76,["159"] = 76,["161"] = 77,["162"] = 77,["163"] = 77,["164"] = 77,["165"] = 77,["166"] = 77,["167"] = 77,["168"] = 77,["169"] = 77,["170"] = 76,["171"] = 84,["172"] = 85,["173"] = 85,["174"] = 85,["175"] = 85,["176"] = 85,["177"] = 84});
local ____exports = {}
local ____RandomUtil = require("solar.solar-common.util.math.RandomUtil")
local RandomUtil = ____RandomUtil.default
____exports.default = __TS__Class()
local TextTagUtil = ____exports.default
TextTagUtil.name = "TextTagUtil"
function TextTagUtil.prototype.____constructor(self)
end
function TextTagUtil.text(text, unit, fontSize, lifespan, red, green, blue)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    if red == nil then
        red = 255
    end
    if green == nil then
        green = 255
    end
    if blue == nil then
        blue = 255
    end
    local textTagHandle = CreateTextTag()
    SetTextTagColor(
        textTagHandle,
        red,
        green,
        blue,
        255
    )
    SetTextTagPos(
        textTagHandle,
        GetUnitX(unit) - fontSize * 8,
        GetUnitY(unit),
        150
    )
    fontSize = fontSize * 0.0023
    SetTextTagText(textTagHandle, text, fontSize)
    SetTextTagVelocity(textTagHandle, 0, 0.04)
    SetTextTagPermanent(textTagHandle, false)
    if lifespan > 0 then
        SetTextTagLifespan(textTagHandle, lifespan)
    end
    return textTagHandle
end
function TextTagUtil.textInfo(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        200,
        200,
        200
    )
end
function TextTagUtil.textWarn(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        255,
        0,
        0
    )
end
function TextTagUtil.textSuccess(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        50,
        255,
        50
    )
end
function TextTagUtil.textFail(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        255,
        0,
        0
    )
end
function TextTagUtil.textGold(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        255,
        208,
        76
    )
end
function TextTagUtil.textLumber(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        77,
        208,
        108
    )
end
function TextTagUtil.textExp(text, unit, fontSize, lifespan)
    if fontSize == nil then
        fontSize = 12
    end
    if lifespan == nil then
        lifespan = 2
    end
    return ____exports.default.text(
        text,
        unit,
        fontSize,
        lifespan,
        53,
        149,
        196
    )
end
function TextTagUtil.setRandomVelocity(texttag)
    SetTextTagVelocity(
        texttag,
        RandomUtil.nextLocalReal(-0.1, 0.1),
        RandomUtil.nextLocalReal(0.01, 0.1)
    )
end
return ____exports
