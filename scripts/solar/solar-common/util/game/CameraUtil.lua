local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 3,["11"] = 3,["12"] = 5,["13"] = 5,["14"] = 5,["16"] = 5,["17"] = 13,["18"] = 13,["19"] = 13,["21"] = 13,["22"] = 13,["24"] = 14,["25"] = 15,["26"] = 16,["28"] = 18,["29"] = 13,["30"] = 36,["31"] = 36,["32"] = 36,["34"] = 37,["35"] = 38,["36"] = 39,["38"] = 42,["39"] = 43,["40"] = 44,["41"] = 45,["42"] = 46,["43"] = 47,["44"] = 48,["45"] = 50,["46"] = 52,["47"] = 53,["48"] = 54,["49"] = 56,["50"] = 57,["51"] = 58,["52"] = 59,["53"] = 60,["54"] = 36,["55"] = 91,["56"] = 92,["57"] = 93,["58"] = 94,["61"] = 97,["63"] = 91,["64"] = 105,["65"] = 105,["66"] = 105,["68"] = 106,["69"] = 107,["70"] = 108,["73"] = 111,["75"] = 105,["76"] = 121,["77"] = 121,["78"] = 121,["80"] = 121,["81"] = 121,["83"] = 122,["84"] = 123,["85"] = 123,["86"] = 123,["87"] = 123,["88"] = 123,["90"] = 121,["91"] = 132,["92"] = 133,["93"] = 134,["94"] = 135,["95"] = 136,["96"] = 137,["97"] = 137,["98"] = 137,["99"] = 137,["100"] = 137,["101"] = 137,["102"] = 137,["103"] = 137,["104"] = 137,["105"] = 137,["106"] = 139,["107"] = 140,["108"] = 140,["109"] = 140,["110"] = 141,["111"] = 142,["112"] = 142,["114"] = 140,["115"] = 140,["117"] = 132,["118"] = 154,["119"] = 154,["120"] = 154,["122"] = 154,["123"] = 154,["125"] = 155,["126"] = 156,["127"] = 157,["128"] = 158,["129"] = 160,["130"] = 161,["131"] = 162,["132"] = 163,["133"] = 164,["134"] = 165,["135"] = 166,["136"] = 167,["137"] = 168,["138"] = 169,["139"] = 170,["140"] = 171,["141"] = 171,["142"] = 171,["143"] = 171,["144"] = 171,["145"] = 171,["146"] = 171,["147"] = 173,["148"] = 173,["149"] = 173,["150"] = 174,["151"] = 175,["152"] = 175,["154"] = 173,["155"] = 173,["156"] = 177,["157"] = 154});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____EmbedJapiUtil = require("solar.solar-common.util.system.EmbedJapiUtil")
local EmbedJapiUtil = ____EmbedJapiUtil.default
local ____InputUtil = require("solar.solar-common.util.system.InputUtil")
local InputUtil = ____InputUtil.default
____exports.default = __TS__Class()
local CameraUtil = ____exports.default
CameraUtil.name = "CameraUtil"
function CameraUtil.prototype.____constructor(self)
end
function CameraUtil.getWordCoordinates(self, x, y)
    if x == nil then
        x = InputUtil:getMouseSceneX()
    end
    if y == nil then
        y = InputUtil:getMouseSceneY()
    end
    if isEmbedJapi then
        local wx, wy = screen_to_world(x, 0.6 - y)
        return {x = wx, y = wy}
    end
    return nil
end
function CameraUtil.getScreenCoordinates(self, x, y, z)
    if z == nil then
        z = 150
    end
    if world_to_screen then
        local sx, sy, ss = world_to_screen(x, y, z)
        return {x = sx, y = 0.6 - sy, z = ss}
    end
    local y1 = GetCameraEyePositionY()
    local x1 = GetCameraEyePositionX()
    local z1 = GetCameraEyePositionZ()
    local w = (DzGetWindowWidth() - 20) / 2
    local h = DzGetWindowHeight() - 20
    local a = GetCameraField(ConvertCameraField(3)) * 180 / 3.141592653589793
    local b = 360 - GetCameraField(ConvertCameraField(2)) * 180 / 3.141592653589793
    y = y + z * (y - y1) / z1
    local sy = 0.3 * (y - y1 - z1 / math.tan(b + a / 2)) * math.sin(b + a / 2) / (z1 * math.sin(a / 2) * (math.sin(b) + math.cos(b) * (y - y1) / z1))
    sy = (sy - 0.3) * 1.66 + 0.3
    local sx = 0.4 * (x - x1) / w / (1 + 1 / ((y - y1) * (z1 / (y - y1) * math.tan(b) + 1) / (y - y1 - z1 / math.tan(b + a / 2)) - 1))
    local c = 235
    local d = 56 * c - 10500
    local sx1 = 0.03 * (w + b * c - d) / h
    sx = (sx + sx1) * 0.4 / sx1
    return {x = sx, y = sy}
end
function CameraUtil.setCameraHeight(self, height, whichPlayer)
    if whichPlayer then
        if GetLocalPlayer() == whichPlayer then
            SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, height, 0)
        end
    else
        SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, height, 0)
    end
end
function CameraUtil.moveCamera2xy(self, x, y, whichPlayer, duration)
    if duration == nil then
        duration = 0
    end
    if whichPlayer then
        if GetLocalPlayer() == whichPlayer then
            PanCameraToTimed(x, y, duration)
        end
    else
        PanCameraToTimed(x, y, duration)
    end
end
function CameraUtil.moveCamera2unit(self, unit, whichPlayer, duration)
    if whichPlayer == nil then
        whichPlayer = GetOwningPlayer(unit)
    end
    if duration == nil then
        duration = 0
    end
    if GetLocalPlayer() == whichPlayer then
        PanCameraToTimed(
            GetUnitX(unit),
            GetUnitY(unit),
            duration
        )
    end
end
function CameraUtil.setCameraBoundsByRect(self, r, mapMapPath)
    local minX = GetRectMinX(r)
    local minY = GetRectMinY(r)
    local maxY = GetRectMaxY(r)
    local maxX = GetRectMaxX(r)
    SetCameraBounds(
        minX,
        minY,
        minX,
        maxY,
        maxX,
        maxY,
        maxX,
        minY
    )
    if mapMapPath then
        BaseUtil.runLater(
            0.1,
            function()
                DzSetWar3MapMap(mapMapPath)
                if DzUpdateMinimap ~= nil then
                    DzUpdateMinimap()
                end
            end
        )
    end
end
function CameraUtil.setMapBlpRectByCameraBounds(self, fullMapPath, size)
    if fullMapPath == nil then
        fullMapPath = "war3mapMap.blp"
    end
    if size == nil then
        size = 256
    end
    local minX = GetCameraBoundMinX() - 512
    local maxX = GetCameraBoundMaxX() + 512
    local minY = GetCameraBoundMinY() - 256
    local maxY = GetCameraBoundMaxY() + 256
    local worldBounds = GetWorldBounds()
    local worldMinX = GetRectMinX(worldBounds) - 512
    local worldMaxX = GetRectMaxX(worldBounds) + 512
    local worldMinY = GetRectMinY(worldBounds) - 256
    local worldMaxY = GetRectMaxY(worldBounds) + 256
    local worldWidth = worldMaxX - worldMinX
    local worldHeight = worldMaxY - worldMinY
    local left = (minX - worldMinX) / worldWidth * size
    local top = (worldMaxY - maxY) / worldHeight * size
    local right = (worldWidth - math.abs(worldMaxX - maxX)) / worldWidth * size
    local bottom = (worldHeight - math.abs(minY - worldMinY)) / worldHeight * size
    local blpRectPath = EmbedJapiUtil:blpRect(
        fullMapPath,
        left,
        top,
        right,
        bottom
    )
    BaseUtil.runLater(
        0.1,
        function()
            DzSetWar3MapMap(blpRectPath)
            if DzUpdateMinimap ~= nil then
                DzUpdateMinimap()
            end
        end
    )
    return blpRectPath
end
return ____exports
