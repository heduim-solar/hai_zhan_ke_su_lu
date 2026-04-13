local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 3,["9"] = 3,["10"] = 6,["11"] = 8,["12"] = 9,["13"] = 10,["14"] = 11,["15"] = 8,["16"] = 14,["17"] = 15,["18"] = 16,["19"] = 17,["20"] = 14,["21"] = 21,["22"] = 23,["23"] = 23,["24"] = 23,["25"] = 46,["26"] = 46,["27"] = 46,["29"] = 46,["30"] = 46,["32"] = 46,["33"] = 46,["35"] = 46,["36"] = 46,["38"] = 43,["39"] = 47,["40"] = 48,["41"] = 49,["42"] = 50,["43"] = 50,["44"] = 50,["45"] = 50,["46"] = 50,["47"] = 50,["48"] = 50,["49"] = 52,["50"] = 53,["51"] = 56,["52"] = 57,["53"] = 57,["54"] = 57,["55"] = 58,["56"] = 59,["57"] = 59,["58"] = 59,["59"] = 59,["61"] = 57,["62"] = 57,["63"] = 62,["64"] = 63,["65"] = 46,["66"] = 66,["67"] = 67,["70"] = 70,["71"] = 71,["72"] = 72,["73"] = 66,["74"] = 78,["75"] = 78,["76"] = 78,["78"] = 79,["79"] = 79,["80"] = 79,["81"] = 79,["82"] = 79,["83"] = 79,["84"] = 79,["85"] = 80,["86"] = 81,["87"] = 82,["89"] = 84,["90"] = 78,["91"] = 87,["92"] = 88,["95"] = 91,["96"] = 92,["97"] = 87,["98"] = 95,["99"] = 96,["102"] = 99,["103"] = 100,["104"] = 95,["105"] = 103,["106"] = 104,["107"] = 105,["109"] = 107,["110"] = 103,["111"] = 110,["112"] = 111,["113"] = 110,["114"] = 114,["115"] = 115,["116"] = 114,["117"] = 118,["118"] = 119,["121"] = 122,["122"] = 123,["123"] = 124,["124"] = 124,["125"] = 124,["126"] = 124,["127"] = 124,["128"] = 125,["129"] = 118,["130"] = 129,["131"] = 130,["132"] = 129,["133"] = 133,["134"] = 134,["135"] = 133,["136"] = 137,["137"] = 138,["138"] = 139,["139"] = 137,["140"] = 142,["141"] = 143,["142"] = 144,["143"] = 142,["144"] = 147,["145"] = 148,["148"] = 151,["149"] = 152,["150"] = 153,["151"] = 153,["152"] = 153,["153"] = 153,["154"] = 153,["155"] = 154,["156"] = 147,["157"] = 157,["158"] = 158,["159"] = 159,["160"] = 157,["161"] = 162,["162"] = 163,["165"] = 166,["166"] = 167,["167"] = 169,["169"] = 171,["170"] = 162,["171"] = 179,["172"] = 180,["173"] = 181,["176"] = 184,["177"] = 179,["178"] = 187,["179"] = 188,["180"] = 187,["181"] = 191,["182"] = 192,["183"] = 191,["184"] = 195,["185"] = 195,["186"] = 195,["188"] = 196,["189"] = 197,["190"] = 197,["191"] = 197,["192"] = 198,["193"] = 199,["194"] = 197,["195"] = 197,["197"] = 202,["198"] = 203,["200"] = 195,["201"] = 27,["202"] = 28});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____Flag = require("solar.solar-wc3.browser.Flag")
local Flag = ____Flag.default
local storm = require("jass.storm")
local function converScreenPosition(x, y)
    x = x / 1920 * 0.8
    y = (1080 - y) / 1080 * 0.6
    return {x, y}
end
local function converScreenSize(width, height)
    width = width / 1920 * 0.8
    height = height / 1080 * 0.6
    return {width, height}
end
InitHtml5Plugin(Flag.ENGINE_DISABLE_GPU)
____exports.default = __TS__Class()
local WebView = ____exports.default
WebView.name = "WebView"
function WebView.prototype.____constructor(self, x, y, w, h)
    if x == nil then
        x = 0
    end
    if y == nil then
        y = 0
    end
    if w == nil then
        w = 1920
    end
    if h == nil then
        h = 1080
    end
    self.toTopTempFrame = 0
    self._name = "_VIEW_" .. tostring(____exports.default._index)
    self.parent_id = GetGlueUI()
    ____exports.default._index = ____exports.default._index + 1
    self._id = CreateFrameByTagName(
        "BACKDROP",
        self._name,
        self.parent_id,
        "",
        0
    )
    self:setSize(w, h)
    self:setPosition(x, y)
    self:setNormalImage()
    BaseUtil.runLater(
        0.01,
        function()
            if self._id and self.parent_id ~= GetGameUI() then
                FrameSetParent(
                    self._id,
                    GetGameUI()
                )
            end
        end
    )
    ____exports.default.viewMap[self._id] = self
    webView = self
end
function WebView.prototype.destroy(self)
    if self._id == nil then
        return
    end
    ____exports.default.viewMap[self._id] = nil
    DestroyFrame(self._id)
    self._id = nil
end
function WebView.prototype.toTop(self, destroyOldFrame)
    if destroyOldFrame == nil then
        destroyOldFrame = false
    end
    local newToTopTempFrame = CreateFrameByTagName(
        "BACKDROP",
        self._name .. tostring(self.toTopTempFrame),
        GetGameUI(),
        "",
        0
    )
    FrameSetParent(self._id, newToTopTempFrame)
    if self.toTopTempFrame ~= 0 and destroyOldFrame then
        DestroyFrame(self.toTopTempFrame)
    end
    self.toTopTempFrame = newToTopTempFrame
end
function WebView.prototype.show(self)
    if self.is_show then
        return
    end
    self.is_show = true
    FrameShow(self._id, true)
end
function WebView.prototype.hide(self)
    if self.is_show == false then
        return
    end
    self.is_show = false
    FrameShow(self._id, false)
end
function WebView.prototype.setAlpha(self, value)
    if value <= 1 then
        value = value * 255
    end
    FrameSetAlpha(self._id, value)
end
function WebView.prototype.getAlpha(self)
    return FrameGetAlpha(self._id)
end
function WebView.prototype.getPosition(self)
    return {self.x, self.y}
end
function WebView.prototype.setPosition(self, x, y)
    if self._id == nil or self._id == 0 then
        return
    end
    self.x = x
    self.y = y
    x, y = table.unpack(
        converScreenPosition(x, y),
        1,
        2
    )
    FrameSetAbsolutePoint(self._id, 0, x, y)
end
function WebView.prototype.getWidth(self)
    return FrameGetWidth(self._id) / 0.8 * 1920
end
function WebView.prototype.getHeight(self)
    return FrameGetHeight(self._id) / 0.6 * 1080
end
function WebView.prototype.setWidth(self, width)
    self.w = width
    FrameSetWidth(self._id, width / 1920 * 0.8)
end
function WebView.prototype.setHeight(self, height)
    self.h = height
    FrameSetHeight(self._id, height / 1080 * 0.6)
end
function WebView.prototype.setSize(self, width, height)
    if self._id == nil or self._id == 0 then
        return
    end
    self.w = width
    self.h = height
    width, height = table.unpack(
        converScreenSize(width, height),
        1,
        2
    )
    FrameSetSize(self._id, width, height)
end
function WebView.prototype.setLevel(self, level)
    self.level = level
    FrameSetLevel(self._id, level)
end
function WebView.prototype.setNormalImage(self, image_path, flag)
    if self._id == nil or self._id == 0 then
        return
    end
    self.normal_image = image_path
    if image_path == "" then
        image_path = "UI\\Widgets\\EscMenu\\Human\\blank-background.blp"
    end
    FrameSetTexture(self._id, image_path, flag or 0)
end
function WebView.prototype.loadUrl(self, url, view_config)
    if url == nil then
        log.errorWithTraceBack("你传的url为空！")
        return
    end
    FrameSetUrl(self._id, url, view_config or 0)
end
function WebView.prototype.loadHtmlFile(self, filePath, view_config)
    self:loadUrl("http://localhost/" .. filePath, view_config)
end
function WebView.prototype.setFocus(self, bool)
    webEngine.handle = self._id
end
function WebView.prototype.showDevtool(self, delay)
    if delay == nil then
        delay = 0
    end
    if delay > 0 then
        BaseUtil.runLater(
            delay,
            function()
                webEngine.handle = self._id
                webEngine.debugger = true
            end
        )
    else
        webEngine.handle = self._id
        webEngine.debugger = true
    end
end
WebView._index = 0
WebView.viewMap = {}
return ____exports
