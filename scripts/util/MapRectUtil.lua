local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 6,["18"] = 6,["19"] = 7,["20"] = 7,["21"] = 8,["22"] = 8,["23"] = 9,["24"] = 9,["25"] = 10,["26"] = 10,["27"] = 11,["28"] = 11,["29"] = 12,["30"] = 12,["31"] = 13,["32"] = 13,["33"] = 14,["34"] = 14,["35"] = 15,["36"] = 15,["37"] = 16,["38"] = 16,["39"] = 17,["40"] = 17,["41"] = 18,["42"] = 18,["43"] = 19,["44"] = 19,["45"] = 20,["46"] = 20,["47"] = 21,["48"] = 21,["49"] = 22,["50"] = 22,["51"] = 23,["52"] = 23,["53"] = 24,["54"] = 24,["55"] = 25,["56"] = 25,["57"] = 26,["58"] = 26,["59"] = 27,["60"] = 27,["61"] = 28,["62"] = 28,["63"] = 29,["64"] = 29,["65"] = 30,["66"] = 30,["67"] = 32,["68"] = 32,["69"] = 32,["71"] = 32,["72"] = 99,["73"] = 100,["74"] = 99,["75"] = 103,["76"] = 104,["77"] = 104,["78"] = 104,["79"] = 105,["80"] = 104,["81"] = 104,["82"] = 103,["83"] = 109,["84"] = 110,["85"] = 110,["86"] = 110,["87"] = 113,["88"] = 114,["89"] = 115,["90"] = 116,["91"] = 117,["93"] = 119,["94"] = 120,["96"] = 124,["97"] = 125,["98"] = 110,["99"] = 110,["100"] = 109,["101"] = 133,["102"] = 134,["103"] = 135,["104"] = 136,["105"] = 137,["106"] = 138,["107"] = 139,["108"] = 139,["109"] = 139,["110"] = 139,["111"] = 139,["112"] = 139,["113"] = 139,["114"] = 139,["115"] = 139,["116"] = 139,["117"] = 141,["118"] = 142,["119"] = 142,["120"] = 142,["121"] = 143,["122"] = 142,["123"] = 142,["125"] = 133,["126"] = 33,["127"] = 35,["128"] = 35,["129"] = 35,["130"] = 35,["131"] = 35,["132"] = 35,["133"] = 35,["134"] = 35,["135"] = 35,["136"] = 35,["137"] = 35,["138"] = 35,["139"] = 35,["140"] = 35,["141"] = 35,["142"] = 35,["143"] = 35,["144"] = 35,["145"] = 35,["146"] = 35,["147"] = 35,["148"] = 35,["149"] = 35,["150"] = 35,["151"] = 35,["152"] = 35,["153"] = 35,["154"] = 35,["155"] = 69,["156"] = 69,["157"] = 69,["158"] = 69,["159"] = 69,["160"] = 69,["161"] = 69,["162"] = 69,["163"] = 69,["164"] = 69,["165"] = 69,["166"] = 69,["167"] = 69,["168"] = 69,["169"] = 69,["170"] = 69,["171"] = 69,["172"] = 69,["173"] = 69,["174"] = 69,["175"] = 69,["176"] = 69,["177"] = 69,["178"] = 69,["179"] = 69,["180"] = 69,["181"] = 69,["182"] = 69});
local ____exports = {}
local ____l__57FA_7840_533A_57DF = require("_sl_editor.l_基础区域")
local ____l__57FA_7840_533A_57DF = ____l__57FA_7840_533A_57DF["l_基础区域"]
local ____l__5730_5F6211 = require("_sl_editor.l_地形11")
local ____l__5730_5F6211 = ____l__5730_5F6211["l_地形11"]
local ____l__5730_5F6212 = require("_sl_editor.l_地形12")
local ____l__5730_5F6212 = ____l__5730_5F6212["l_地形12"]
local ____l__5730_5F6213 = require("_sl_editor.l_地形13")
local ____l__5730_5F6213 = ____l__5730_5F6213["l_地形13"]
local ____l__5730_5F6214 = require("_sl_editor.l_地形14")
local ____l__5730_5F6214 = ____l__5730_5F6214["l_地形14"]
local ____l__5730_5F6215 = require("_sl_editor.l_地形15")
local ____l__5730_5F6215 = ____l__5730_5F6215["l_地形15"]
local ____l__5730_5F6216 = require("_sl_editor.l_地形16")
local ____l__5730_5F6216 = ____l__5730_5F6216["l_地形16"]
local ____l__5730_5F6218 = require("_sl_editor.l_地形18")
local ____l__5730_5F6218 = ____l__5730_5F6218["l_地形18"]
local ____l__5730_5F6217 = require("_sl_editor.l_地形17")
local ____l__5730_5F6217 = ____l__5730_5F6217["l_地形17"]
local ____l__5730_5F6225 = require("_sl_editor.l_地形25")
local ____l__5730_5F6225 = ____l__5730_5F6225["l_地形25"]
local ____l__5730_5F6221 = require("_sl_editor.l_地形21")
local ____l__5730_5F6221 = ____l__5730_5F6221["l_地形21"]
local ____l__5730_5F6222 = require("_sl_editor.l_地形22")
local ____l__5730_5F6222 = ____l__5730_5F6222["l_地形22"]
local ____l__5730_5F6223 = require("_sl_editor.l_地形23")
local ____l__5730_5F6223 = ____l__5730_5F6223["l_地形23"]
local ____l__5730_5F6224 = require("_sl_editor.l_地形24")
local ____l__5730_5F6224 = ____l__5730_5F6224["l_地形24"]
local ____l__5730_5F6231 = require("_sl_editor.l_地形31")
local ____l__5730_5F6231 = ____l__5730_5F6231["l_地形31"]
local ____l__5730_5F6235 = require("_sl_editor.l_地形35")
local ____l__5730_5F6235 = ____l__5730_5F6235["l_地形35"]
local ____l__5730_5F6232 = require("_sl_editor.l_地形32")
local ____l__5730_5F6232 = ____l__5730_5F6232["l_地形32"]
local ____l__5730_5F6233 = require("_sl_editor.l_地形33")
local ____l__5730_5F6233 = ____l__5730_5F6233["l_地形33"]
local ____l__5730_5F6234 = require("_sl_editor.l_地形34")
local ____l__5730_5F6234 = ____l__5730_5F6234["l_地形34"]
local ____l__5730_5F6241 = require("_sl_editor.l_地形41")
local ____l__5730_5F6241 = ____l__5730_5F6241["l_地形41"]
local ____l__5730_5F6242 = require("_sl_editor.l_地形42")
local ____l__5730_5F6242 = ____l__5730_5F6242["l_地形42"]
local ____l__5730_5F6243 = require("_sl_editor.l_地形43")
local ____l__5730_5F6243 = ____l__5730_5F6243["l_地形43"]
local ____l__5730_5F6244 = require("_sl_editor.l_地形44")
local ____l__5730_5F6244 = ____l__5730_5F6244["l_地形44"]
local ____l__5730_5F6251 = require("_sl_editor.l_地形51")
local ____l__5730_5F6251 = ____l__5730_5F6251["l_地形51"]
local ____l__5730_5F6255 = require("_sl_editor.l_地形55")
local ____l__5730_5F6255 = ____l__5730_5F6255["l_地形55"]
local ____l__5730_5F6256 = require("_sl_editor.l_地形56")
local ____l__5730_5F6256 = ____l__5730_5F6256["l_地形56"]
local ____CameraUtil = require("solar.solar-common.util.game.CameraUtil")
local CameraUtil = ____CameraUtil.default
local ____RectUtil = require("solar.solar-common.util.game.RectUtil")
local RectUtil = ____RectUtil.default
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
____exports.default = __TS__Class()
local MapRectUtil = ____exports.default
MapRectUtil.name = "MapRectUtil"
function MapRectUtil.prototype.____constructor(self)
end
function MapRectUtil.getLine(self, index)
    return ____exports.default.rectLines[index + 1]
end
function MapRectUtil.getRect(self, index)
    return ____exports.default.cache:get(
        "getRect:" .. tostring(index),
        function()
            return RectUtil.createRectByVecs(table.unpack(____exports.default.rectLines[index + 1]))
        end
    )
end
function MapRectUtil.setMapRect(self, index)
    BaseUtil.runLater(
        0.01,
        function()
            local r = nil
            local mapMapPath = nil
            if index == 0 then
                r = RectUtil.createRectByVecs({x = -5496 + 128, y = -6081 + 256}, {x = 5369 - 128, y = 5392 - 256})
                mapMapPath = "区域小地图\\主图.blp"
            else
                r = ____exports.default:getRect(index)
                mapMapPath = ____exports.default.lineMapMap[____exports.default.rectLines[index + 1]]
            end
            print("mapMapPath=" .. tostring(mapMapPath))
            CameraUtil:setCameraBoundsByRect(r, mapMapPath)
        end
    )
end
function MapRectUtil.setCameraBounds(self, index, mapMapPath)
    local r = RectUtil.createRectByVecs(table.unpack(____exports.default.rectLines[index + 1]))
    local minX = GetRectMinX(r) + 512 * 2
    local minY = GetRectMinY(r) + 256 * 2
    local maxY = GetRectMaxY(r) - 256 * 2
    local maxX = GetRectMaxX(r) - 512 * 2
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
            end
        )
    end
end
MapRectUtil.cache = __TS__New(Cache)
MapRectUtil.rectLines = {
    ____l__57FA_7840_533A_57DF,
    ____l__5730_5F6211,
    ____l__5730_5F6212,
    ____l__5730_5F6213,
    ____l__5730_5F6222,
    ____l__5730_5F6255,
    ____l__5730_5F6251,
    ____l__5730_5F6214,
    ____l__5730_5F6215,
    ____l__5730_5F6216,
    ____l__5730_5F6217,
    ____l__5730_5F6218,
    ____l__5730_5F6221,
    ____l__5730_5F6223,
    ____l__5730_5F6224,
    ____l__5730_5F6225,
    ____l__5730_5F6231,
    ____l__5730_5F6232,
    ____l__5730_5F6233,
    ____l__5730_5F6234,
    ____l__5730_5F6235,
    ____l__5730_5F6241,
    ____l__5730_5F6242,
    ____l__5730_5F6243,
    ____l__5730_5F6244,
    ____l__5730_5F6256
}
MapRectUtil.lineMapMap = {
    [____l__57FA_7840_533A_57DF] = "区域小地图\\主图.blp",
    [____l__5730_5F6211] = "区域小地图\\1-1.blp",
    [____l__5730_5F6212] = "区域小地图\\1-2.blp",
    [____l__5730_5F6213] = "区域小地图\\1-3.blp",
    [____l__5730_5F6214] = "区域小地图\\1-4.blp",
    [____l__5730_5F6215] = "区域小地图\\1-5.blp",
    [____l__5730_5F6216] = "区域小地图\\1-6.blp",
    [____l__5730_5F6217] = "区域小地图\\1-7.blp",
    [____l__5730_5F6218] = "区域小地图\\1-8.blp",
    [____l__5730_5F6221] = "区域小地图\\2-1.blp",
    [____l__5730_5F6222] = "区域小地图\\2-2.blp",
    [____l__5730_5F6223] = "区域小地图\\2-3.blp",
    [____l__5730_5F6224] = "区域小地图\\2-4.blp",
    [____l__5730_5F6225] = "区域小地图\\2-5.blp",
    [____l__5730_5F6231] = "区域小地图\\3-1.blp",
    [____l__5730_5F6232] = "区域小地图\\3-2.blp",
    [____l__5730_5F6233] = "区域小地图\\3-3.blp",
    [____l__5730_5F6234] = "区域小地图\\3-4.blp",
    [____l__5730_5F6235] = "区域小地图\\3-5.blp",
    [____l__5730_5F6241] = "区域小地图\\4-1.blp",
    [____l__5730_5F6242] = "区域小地图\\4-2.blp",
    [____l__5730_5F6243] = "区域小地图\\4-3.blp",
    [____l__5730_5F6244] = "区域小地图\\4-4.blp",
    [____l__5730_5F6251] = "区域小地图\\4-5.blp",
    [____l__5730_5F6255] = "区域小地图\\5-1.blp",
    [____l__5730_5F6256] = "区域小地图\\5-2.blp"
}
return ____exports
