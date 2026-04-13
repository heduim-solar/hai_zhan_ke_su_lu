local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIncludes = ____lualib.__TS__ArrayIncludes
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__InstanceOf = ____lualib.__TS__InstanceOf
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 5,["14"] = 5,["15"] = 5,["16"] = 5,["17"] = 5,["18"] = 5,["19"] = 5,["20"] = 5,["21"] = 5,["22"] = 5,["23"] = 5,["24"] = 5,["25"] = 5,["26"] = 5,["27"] = 5,["28"] = 5,["29"] = 5,["30"] = 5,["31"] = 5,["32"] = 5,["33"] = 5,["34"] = 5,["35"] = 5,["36"] = 5,["37"] = 5,["38"] = 5,["39"] = 5,["40"] = 5,["41"] = 33,["42"] = 38,["43"] = 41,["44"] = 47,["45"] = 47,["46"] = 47,["48"] = 47,["49"] = 50,["50"] = 51,["51"] = 52,["52"] = 50,["53"] = 56,["54"] = 57,["55"] = 58,["57"] = 70,["58"] = 61,["59"] = 62,["60"] = 63,["61"] = 63,["62"] = 63,["64"] = 64,["65"] = 65,["66"] = 66,["67"] = 67,["68"] = 68,["69"] = 68,["70"] = 68,["72"] = 69,["73"] = 71,["74"] = 72,["77"] = 76,["78"] = 77,["80"] = 79,["81"] = 80,["82"] = 81,["83"] = 82,["85"] = 84,["87"] = 86,["88"] = 88,["89"] = 89,["91"] = 91,["92"] = 92,["94"] = 96,["95"] = 97,["96"] = 98,["97"] = 99,["98"] = 100,["99"] = 101,["100"] = 102,["101"] = 103,["102"] = 104,["105"] = 109,["106"] = 111,["107"] = 111,["108"] = 111,["110"] = 111,["111"] = 112,["112"] = 115,["113"] = 116,["114"] = 116,["115"] = 116,["116"] = 116,["117"] = 116,["118"] = 116,["119"] = 116,["121"] = 128,["123"] = 132,["124"] = 133,["125"] = 133,["126"] = 133,["127"] = 133,["128"] = 134,["129"] = 135,["130"] = 135,["131"] = 135,["132"] = 135,["133"] = 135,["134"] = 135,["135"] = 135,["136"] = 135,["137"] = 139,["138"] = 140,["140"] = 143,["141"] = 143,["143"] = 144,["144"] = 145,["145"] = 146,["147"] = 148,["148"] = 56});
local ____exports = {}
local ____FrameDefault = require("solar.solar-common.w3ts.tsx.FrameDefault")
local frameDefaults = ____FrameDefault.frameDefaults
local ____frame = require("solar.solar-common.w3ts.handles.frame")
local Frame = ____frame.Frame
local typeNames = {
    "backdrop",
    "button",
    "chatdisplay",
    "checkbox",
    "frame",
    "control",
    "dialog",
    "editbox",
    "gluebutton",
    "gluecheckbox",
    "glueeditbox",
    "gluepopupmenu",
    "gluetextbutton",
    "highlight",
    "listbox",
    "menu",
    "model",
    "popupmenu",
    "scrollbar",
    "slashchatbox",
    "slider",
    "sprite",
    "text",
    "textarea",
    "textbutton",
    "timertext"
}
local simpleTypeNames = {"simple-button", "simple-checkbox", "simple-statusbar"}
local frameDefaultsNameIndex = 1
____exports.data = {}
____exports.default = __TS__Class()
local CreateFrameUtil = ____exports.default
CreateFrameUtil.name = "CreateFrameUtil"
function CreateFrameUtil.prototype.____constructor(self)
end
function CreateFrameUtil.nextFrameName()
    frameDefaultsNameIndex = frameDefaultsNameIndex + 1
    return (tostring(frameDefaults.name) .. "") .. tostring(frameDefaultsNameIndex)
end
function CreateFrameUtil.createFrame(jsxType, parentFrame, props)
    if not parentFrame then
        error("expected parent frame for " .. jsxType, 0)
    end
    local ____props_0 = props
    local id = ____props_0.id
    local name = ____props_0.name
    local priority = ____props_0.priority
    if priority == nil then
        priority = frameDefaults.priority
    end
    local inherits = ____props_0.inherits
    local isSimple = ____props_0.isSimple
    local position = ____props_0.position
    local size = ____props_0.size
    local context = ____props_0.context
    if context == nil then
        context = frameDefaults.context
    end
    local ref = ____props_0.ref
    if not name or #name < 1 then
        name = ____exports.default.nextFrameName()
    else
    end
    if not id then
        id = inherits
    end
    if id and #id > 0 then
        if not ref then
            ref = {current = 0}
            props.ref = ref
        end
        ____exports.data[id] = props
    end
    local typeName = props.typeName
    if typeName == nil and __TS__ArrayIncludes(typeNames, jsxType) then
        typeName = string.upper(jsxType)
    end
    if typeName == nil and __TS__ArrayIncludes(simpleTypeNames, jsxType) then
        typeName = string.upper(__TS__StringReplace(jsxType, "-", ""))
    end
    if typeName == nil then
        if jsxType == "root" then
            return DzGetGameUI()
        elseif jsxType == "container" or jsxType == "div" then
            typeName = "FRAME"
        elseif jsxType == "simple-container" then
            typeName = "SIMPLEFRAME"
        elseif jsxType == "img" then
            typeName = "BACKDROP"
        end
    end
    local frame
    local ____isSimple_1 = isSimple
    if ____isSimple_1 == nil then
        ____isSimple_1 = jsxType == "simple-frame"
    end
    if ____isSimple_1 then
        frame = DzCreateSimpleFrame(name, parentFrame, context)
    elseif typeName then
        frame = DzCreateFrameByTagName(
            typeName,
            name,
            parentFrame,
            inherits or "",
            context
        )
    else
        frame = DzCreateFrame(name, parentFrame, context)
    end
    if not position and not size then
        DzFrameSetAllPoints(
            frame,
            DzFrameGetParent(frame)
        )
    elseif not position then
        DzFrameSetPoint(
            frame,
            6,
            DzFrameGetParent(frame),
            6,
            0,
            0
        )
    elseif not size then
        DzFrameSetSize(frame, frameDefaults.size.width, frameDefaults.size.height)
    end
    if ref then
        ref.current = frame
    end
    if __TS__InstanceOf(ref, Frame) then
        ref.type = typeName
        ref.props = props
    end
    return frame
end
return ____exports
