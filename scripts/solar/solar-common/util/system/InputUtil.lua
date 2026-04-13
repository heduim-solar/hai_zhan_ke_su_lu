local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 4,["10"] = 4,["11"] = 5,["12"] = 5,["13"] = 7,["14"] = 7,["15"] = 7,["17"] = 7,["18"] = 16,["19"] = 17,["20"] = 17,["21"] = 17,["22"] = 18,["23"] = 19,["24"] = 19,["25"] = 19,["26"] = 19,["27"] = 19,["28"] = 19,["29"] = 20,["30"] = 21,["32"] = 19,["33"] = 19,["34"] = 24,["35"] = 17,["36"] = 17,["37"] = 26,["38"] = 16,["39"] = 34,["40"] = 35,["41"] = 35,["42"] = 35,["43"] = 36,["44"] = 37,["45"] = 37,["46"] = 37,["47"] = 37,["48"] = 37,["49"] = 37,["50"] = 38,["51"] = 39,["53"] = 37,["54"] = 37,["55"] = 42,["56"] = 35,["57"] = 35,["58"] = 44,["59"] = 34,["60"] = 52,["61"] = 53,["62"] = 53,["63"] = 53,["64"] = 54,["65"] = 55,["66"] = 55,["67"] = 55,["68"] = 55,["69"] = 55,["70"] = 55,["71"] = 56,["72"] = 57,["74"] = 55,["75"] = 55,["76"] = 60,["77"] = 53,["78"] = 53,["79"] = 62,["80"] = 52,["81"] = 70,["82"] = 71,["83"] = 71,["84"] = 71,["85"] = 72,["86"] = 73,["87"] = 73,["88"] = 73,["89"] = 73,["90"] = 73,["91"] = 73,["92"] = 74,["93"] = 75,["95"] = 73,["96"] = 73,["97"] = 78,["98"] = 71,["99"] = 71,["100"] = 80,["101"] = 70,["102"] = 87,["103"] = 88,["104"] = 88,["105"] = 88,["106"] = 89,["107"] = 90,["108"] = 90,["109"] = 90,["110"] = 90,["111"] = 90,["112"] = 90,["113"] = 91,["114"] = 92,["116"] = 90,["117"] = 90,["118"] = 95,["119"] = 88,["120"] = 88,["121"] = 97,["122"] = 87,["123"] = 104,["124"] = 105,["125"] = 105,["126"] = 105,["127"] = 106,["128"] = 107,["129"] = 107,["130"] = 107,["131"] = 107,["132"] = 107,["133"] = 107,["134"] = 108,["135"] = 109,["137"] = 107,["138"] = 107,["139"] = 112,["140"] = 105,["141"] = 105,["142"] = 114,["143"] = 104,["144"] = 124,["145"] = 124,["146"] = 124,["148"] = 124,["149"] = 124,["151"] = 125,["152"] = 125,["153"] = 125,["154"] = 126,["155"] = 126,["156"] = 126,["157"] = 127,["158"] = 128,["159"] = 128,["160"] = 128,["161"] = 128,["162"] = 129,["164"] = 130,["165"] = 130,["167"] = 130,["170"] = 128,["171"] = 128,["172"] = 133,["173"] = 126,["174"] = 126,["175"] = 135,["176"] = 125,["177"] = 125,["178"] = 137,["179"] = 124,["180"] = 145,["181"] = 146,["182"] = 147,["183"] = 148,["185"] = 145,["186"] = 156,["187"] = 157,["188"] = 158,["189"] = 156,["190"] = 164,["191"] = 165,["192"] = 166,["193"] = 164,["194"] = 172,["195"] = 173,["196"] = 174,["197"] = 172,["198"] = 182,["199"] = 183,["202"] = 187,["203"] = 188,["204"] = 187,["205"] = 190,["206"] = 191,["207"] = 190,["208"] = 193,["209"] = 182,["210"] = 8,["211"] = 9,["212"] = 180});
local ____exports = {}
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____AsyncUtil = require("solar.solar-common.util.net.AsyncUtil")
local AsyncUtil = ____AsyncUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
____exports.default = __TS__Class()
local InputUtil = ____exports.default
InputUtil.name = "InputUtil"
function InputUtil.prototype.____constructor(self)
end
function InputUtil.onKeyPressed(self, key, actionFunc)
    local callbacks = ____exports.default.cache:get(
        "onKeyPressed:" .. tostring(key),
        function()
            local cbs = {}
            DzTriggerRegisterKeyEventByCode(
                nil,
                key,
                1,
                false,
                function()
                    for ____, cb in ipairs(cbs) do
                        cb()
                    end
                end
            )
            return cbs
        end
    )
    callbacks[#callbacks + 1] = actionFunc
end
function InputUtil.onKeyReleased(self, key, actionFunc)
    local callbacks = ____exports.default.cache:get(
        "onKeyReleased:" .. tostring(key),
        function()
            local cbs = {}
            DzTriggerRegisterKeyEventByCode(
                nil,
                key,
                0,
                false,
                function()
                    for ____, cb in ipairs(cbs) do
                        cb()
                    end
                end
            )
            return cbs
        end
    )
    callbacks[#callbacks + 1] = actionFunc
end
function InputUtil.onMouseLeftButtonPressed(self, actionFunc)
    local callbacks = ____exports.default.cache:get(
        "onMouseLeftButtonPressed",
        function()
            local cbs = {}
            DzTriggerRegisterMouseEventByCode(
                nil,
                1,
                1,
                false,
                function()
                    for ____, cb in ipairs(cbs) do
                        cb()
                    end
                end
            )
            return cbs
        end
    )
    callbacks[#callbacks + 1] = actionFunc
end
function InputUtil.onMouseLeftButtonReleased(self, actionFunc)
    local callbacks = ____exports.default.cache:get(
        "onMouseLeftButtonReleased",
        function()
            local cbs = {}
            DzTriggerRegisterMouseEventByCode(
                nil,
                1,
                0,
                false,
                function()
                    for ____, cb in ipairs(cbs) do
                        cb()
                    end
                end
            )
            return cbs
        end
    )
    callbacks[#callbacks + 1] = actionFunc
end
function InputUtil.onMouseRightButtonPressed(self, actionFunc)
    local callbacks = ____exports.default.cache:get(
        "onMouseRightButtonPressed",
        function()
            local cbs = {}
            DzTriggerRegisterMouseEventByCode(
                nil,
                2,
                1,
                false,
                function()
                    for ____, cb in ipairs(cbs) do
                        cb()
                    end
                end
            )
            return cbs
        end
    )
    callbacks[#callbacks + 1] = actionFunc
end
function InputUtil.onMouseRightButtonReleased(self, actionFunc)
    local callbacks = ____exports.default.cache:get(
        "onMouseRightButtonReleased",
        function()
            local cbs = {}
            DzTriggerRegisterMouseEventByCode(
                nil,
                2,
                0,
                false,
                function()
                    for ____, cb in ipairs(cbs) do
                        cb()
                    end
                end
            )
            return cbs
        end
    )
    callbacks[#callbacks + 1] = actionFunc
end
function InputUtil.onMouseMoveEvent(self, actionFunc, key, delay)
    if key == nil then
        key = "slmm" .. tostring(AsyncUtil:getUUIDAsync())
    end
    if delay == nil then
        delay = 0.1
    end
    BaseUtil.runLater(
        delay,
        function()
            local callbacks = ____exports.default.cache:get(
                "onMouseMoveEvent",
                function()
                    local cbs = {}
                    DzTriggerRegisterMouseMoveEventByCode(
                        nil,
                        false,
                        function()
                            for key in pairs(cbs) do
                                local ____this_1
                                ____this_1 = cbs
                                local ____opt_0 = ____this_1[key]
                                if ____opt_0 ~= nil then
                                    ____opt_0(____this_1)
                                end
                            end
                        end
                    )
                    return cbs
                end
            )
            callbacks[key] = actionFunc
        end
    )
    return key
end
function InputUtil.removeMouseMoveEvent(self, key)
    local callbacks = ____exports.default.cache:get("onMouseMoveEvent")
    if callbacks then
        callbacks[key] = nil
    end
end
function InputUtil.isMouseRightButtonDown(self)
    ____exports.default:_sl_init_isMouseLeftButtonDown()
    return ____exports.default._sl_isMouseLeftButtonDown
end
function InputUtil.getMouseSceneX(self)
    local sceneX = DzGetMouseXRelative() / DzGetClientWidth() * 0.8
    return sceneX
end
function InputUtil.getMouseSceneY(self)
    local sceneY = DzGetMouseYRelative() / DzGetClientHeight() * 0.6
    return 0.6 - sceneY
end
function InputUtil._sl_init_isMouseLeftButtonDown(self)
    if ____exports.default._sl_init_isMouseLeftButtonDown_flag then
        return
    end
    ____exports.default:onMouseLeftButtonPressed(function()
        ____exports.default._sl_isMouseLeftButtonDown = true
    end)
    ____exports.default:onMouseLeftButtonReleased(function()
        ____exports.default._sl_isMouseLeftButtonDown = false
    end)
    ____exports.default._sl_init_isMouseLeftButtonDown_flag = true
end
InputUtil.cache = __TS__New(Cache)
InputUtil._sl_isMouseLeftButtonDown = false
InputUtil._sl_init_isMouseLeftButtonDown_flag = false
return ____exports
