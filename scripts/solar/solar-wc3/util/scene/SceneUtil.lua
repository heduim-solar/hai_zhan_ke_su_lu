local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 1,["8"] = 1,["9"] = 2,["10"] = 2,["11"] = 3,["12"] = 3,["13"] = 4,["14"] = 4,["15"] = 5,["16"] = 5,["17"] = 14,["18"] = 14,["19"] = 14,["21"] = 14,["22"] = 26,["23"] = 26,["24"] = 26,["26"] = 27,["27"] = 28,["28"] = 29,["30"] = 32,["31"] = 33,["32"] = 34,["33"] = 35,["35"] = 37,["36"] = 38,["37"] = 39,["39"] = 43,["40"] = 44,["41"] = 45,["42"] = 46,["43"] = 47,["45"] = 48,["46"] = 49,["48"] = 51,["49"] = 51,["50"] = 51,["51"] = 51,["52"] = 51,["53"] = 51,["54"] = 51,["55"] = 51,["60"] = 62,["61"] = 62,["62"] = 62,["63"] = 62,["64"] = 62,["65"] = 62,["66"] = 62,["67"] = 62,["68"] = 62,["69"] = 62,["70"] = 72,["71"] = 26,["72"] = 82,["74"] = 86,["75"] = 86,["76"] = 87,["77"] = 88,["78"] = 90,["79"] = 91,["80"] = 86,["84"] = 95,["85"] = 95,["86"] = 96,["87"] = 97,["88"] = 99,["89"] = 100,["90"] = 95,["93"] = 82,["94"] = 107,["95"] = 108,["96"] = 109,["97"] = 110,["98"] = 111,["100"] = 113,["101"] = 114,["102"] = 115,["105"] = 118,["106"] = 107,["107"] = 121,["108"] = 121,["109"] = 121,["111"] = 122,["112"] = 123,["115"] = 126,["117"] = 127,["118"] = 128,["120"] = 130,["121"] = 131,["122"] = 132,["123"] = 133,["124"] = 134,["125"] = 135,["126"] = 136,["129"] = 139,["130"] = 139,["131"] = 139,["132"] = 139,["133"] = 139,["134"] = 139,["135"] = 139,["136"] = 139,["140"] = 121,["141"] = 150,["142"] = 151,["143"] = 152,["146"] = 155,["148"] = 156,["149"] = 157,["151"] = 159,["152"] = 160,["153"] = 161,["154"] = 162,["155"] = 163,["156"] = 164,["157"] = 165,["159"] = 167,["161"] = 170,["162"] = 171,["166"] = 150,["167"] = 176,["168"] = 176,["169"] = 176,["171"] = 177,["172"] = 178,["175"] = 181,["177"] = 182,["178"] = 183,["180"] = 185,["181"] = 186,["182"] = 188,["183"] = 188,["184"] = 188,["185"] = 188,["186"] = 188,["187"] = 188,["188"] = 189,["189"] = 189,["190"] = 189,["191"] = 189,["192"] = 189,["193"] = 189,["194"] = 190,["195"] = 190,["196"] = 190,["197"] = 190,["198"] = 190,["199"] = 190,["200"] = 191,["201"] = 192,["202"] = 192,["203"] = 192,["204"] = 192,["205"] = 192,["206"] = 192,["207"] = 193,["208"] = 193,["209"] = 193,["210"] = 193,["211"] = 193,["212"] = 193,["213"] = 194,["214"] = 194,["215"] = 194,["216"] = 194,["217"] = 194,["218"] = 194,["223"] = 176,["224"] = 200,["225"] = 201,["226"] = 202,["227"] = 203,["228"] = 204,["229"] = 205,["230"] = 207,["231"] = 208,["232"] = 209,["233"] = 210,["236"] = 213,["237"] = 214,["238"] = 215,["239"] = 216,["242"] = 219,["243"] = 220,["244"] = 221,["245"] = 222,["246"] = 223,["249"] = 227,["251"] = 228,["252"] = 229,["254"] = 231,["255"] = 232,["256"] = 233,["257"] = 234,["258"] = 235,["259"] = 236,["260"] = 237,["261"] = 238,["262"] = 239,["263"] = 239,["264"] = 239,["265"] = 239,["266"] = 240,["267"] = 240,["268"] = 240,["269"] = 240,["270"] = 240,["271"] = 240,["272"] = 241,["273"] = 243,["274"] = 245,["276"] = 249,["277"] = 250,["278"] = 251,["279"] = 252,["280"] = 253,["281"] = 254,["282"] = 255,["283"] = 255,["284"] = 255,["285"] = 255,["286"] = 255,["287"] = 255,["288"] = 255,["289"] = 255,["291"] = 257,["292"] = 257,["293"] = 257,["294"] = 257,["295"] = 257,["296"] = 257,["297"] = 257,["298"] = 257,["299"] = 258,["300"] = 259,["301"] = 259,["302"] = 259,["303"] = 259,["306"] = 262,["307"] = 263,["312"] = 200,["313"] = 272,["314"] = 273,["315"] = 274,["316"] = 275,["317"] = 277,["318"] = 278,["319"] = 279,["320"] = 280,["323"] = 283,["324"] = 284,["325"] = 286,["328"] = 289,["330"] = 290,["331"] = 291,["333"] = 293,["334"] = 294,["335"] = 295,["336"] = 296,["337"] = 296,["338"] = 296,["339"] = 296,["340"] = 296,["341"] = 296,["342"] = 296,["343"] = 298,["344"] = 299,["348"] = 302,["349"] = 272,["350"] = 15,["351"] = 16});
local ____exports = {}
local ____CsvUtil = require("solar.solar-common.util.text.CsvUtil")
local CsvUtil = ____CsvUtil.default
local ____TerrainUtil = require("solar.solar-wc3.util.scene.TerrainUtil")
local TerrainUtil = ____TerrainUtil.default
local ____ObjectDataUtil = require("solar.solar-common.util.object.ObjectDataUtil")
local ObjectDataUtil = ____ObjectDataUtil.default
local ____Cache = require("solar.solar-common.tool.Cache")
local Cache = ____Cache.default
local ____VmUtil = require("solar.solar-common.util.lang.VmUtil")
local VmUtil = ____VmUtil.default
____exports.default = __TS__Class()
local SceneUtil = ____exports.default
SceneUtil.name = "SceneUtil"
function SceneUtil.prototype.____constructor(self)
end
function SceneUtil.loadScene(self, scenePath, toCenterX, toCenterY, isFull)
    if isFull == nil then
        isFull = false
    end
    if not VmUtil:hasResource(scenePath .. "\\info.csv") then
        log.errorWithTraceBack("场景不存在:" .. scenePath)
        return nil
    end
    ____exports.default._sl_ground_tiles_id = ____exports.default:_sl_loadScene_ground_tiles_id(scenePath .. "\\ground_tiles_id.csv")
    ____exports.default:_sl_loadScene_terrain_tile(scenePath .. "\\terrain_tile.csv", toCenterX, toCenterY, isFull)
    if isFull then
        ____exports.default:_sl_loadScene_terrain_cliff(scenePath .. "\\terrain_cliff.csv", toCenterX, toCenterY)
    end
    ____exports.default:_sl_loadScene_terrain_route(scenePath .. "\\terrain_route.csv", toCenterX, toCenterY, isFull)
    ____exports.default:_sl_loadScene_dood(scenePath .. "\\dood.csv", toCenterX, toCenterY)
    local units = ____exports.default:_sl_loadScene_terrain_unit(scenePath .. "\\terrain_unit.csv", toCenterX, toCenterY)
    --- 封装 SceneData
    local rectCsvDatas = CsvUtil:parse(scenePath .. "\\rect.csv")
    local infoCsvData = CsvUtil:parse(scenePath .. "\\info.csv")[1]
    local rects = {}
    if rectCsvDatas then
        for ____, rectCsvData in ipairs(rectCsvDatas) do
            do
                if not (rectCsvData and rectCsvData.name) then
                    goto __continue7
                end
                rects[rectCsvData.name] = {
                    index = tonumber(rectCsvData.index),
                    name = rectCsvData.name,
                    x = tonumber(rectCsvData.x) + toCenterX,
                    y = tonumber(rectCsvData.y) + toCenterY,
                    width = tonumber(rectCsvData.width),
                    height = tonumber(rectCsvData.height)
                }
            end
            ::__continue7::
        end
    end
    local sceneData = {
        rects = rects,
        units = units,
        width = tonumber(infoCsvData.width),
        height = tonumber(infoCsvData.height),
        minX = toCenterX + tonumber(infoCsvData.minX),
        maxX = toCenterX + tonumber(infoCsvData.maxX),
        minY = toCenterY + tonumber(infoCsvData.minY),
        maxY = toCenterY + tonumber(infoCsvData.maxY)
    }
    return sceneData
end
function SceneUtil.setSceneBounds(self, sceneData)
    do
        local ty = sceneData.minY
        while ty <= sceneData.maxY do
            SetTerrainPathable(sceneData.minX, ty, PATHING_TYPE_WALKABILITY, false)
            SetTerrainPathable(sceneData.minX, ty, PATHING_TYPE_FLYABILITY, false)
            SetTerrainPathable(sceneData.maxX, ty, PATHING_TYPE_WALKABILITY, false)
            SetTerrainPathable(sceneData.maxX, ty, PATHING_TYPE_FLYABILITY, false)
            ty = ty + 32
        end
    end
    do
        local tx = sceneData.minX
        while tx <= sceneData.maxX do
            SetTerrainPathable(tx, sceneData.minY, PATHING_TYPE_WALKABILITY, false)
            SetTerrainPathable(tx, sceneData.minY, PATHING_TYPE_FLYABILITY, false)
            SetTerrainPathable(tx, sceneData.maxY, PATHING_TYPE_WALKABILITY, false)
            SetTerrainPathable(tx, sceneData.maxY, PATHING_TYPE_FLYABILITY, false)
            tx = tx + 32
        end
    end
end
function SceneUtil._sl_loadScene_ground_tiles_id(self, ground_tiles_idPath)
    local ground_tiles_id = CsvUtil:parse(ground_tiles_idPath)
    local indexId = {}
    if not ground_tiles_id then
        return indexId
    end
    for ____, datum in ipairs(ground_tiles_id) do
        if datum.index and datum.id then
            indexId[datum.index] = datum.id
        end
    end
    return indexId
end
function SceneUtil._sl_loadScene_terrain_tile(self, csvPath, toCenterX, toCenterY, loadCliff)
    if loadCliff == nil then
        loadCliff = false
    end
    local terrain_tile = CsvUtil:parse(csvPath)
    if not terrain_tile then
        return
    end
    for ____, datum in ipairs(terrain_tile) do
        do
            if not datum.x then
                goto __continue22
            end
            local x = toCenterX + tonumber(datum.x)
            local y = toCenterY + tonumber(datum.y)
            if loadCliff then
                local height = tonumber(datum.height)
                local cLayer = tonumber(datum.cLayer)
                if height ~= 0 or cLayer ~= 0 then
                    TerrainUtil:raiseTerrainTile(x, y, height + cLayer * 128)
                end
            end
            SetTerrainType(
                x,
                y,
                FourCC(____exports.default._sl_ground_tiles_id[datum.tex]),
                -1,
                1,
                0
            )
        end
        ::__continue22::
    end
end
function SceneUtil._sl_loadScene_terrain_cliff(self, csvPath, toCenterX, toCenterY)
    local csvDatas = CsvUtil:parse(csvPath)
    if not csvDatas then
        return
    end
    for ____, datum in ipairs(csvDatas) do
        do
            if not datum.x then
                goto __continue29
            end
            local x = toCenterX + tonumber(datum.x)
            local y = toCenterY + tonumber(datum.y)
            local z = toCenterY + tonumber(datum.z)
            local modelPath = nil
            if datum.type == "R" then
                modelPath = ("Cliffs\\CliffTrans" .. tostring(datum.name)) .. "0.mdx"
                x = x + 128
            else
                modelPath = ("Cliffs\\Cliffs" .. tostring(datum.name)) .. "0.mdx"
            end
            local effect = AddSpecialEffect(modelPath, x, y)
            EXSetEffectZ(effect, z)
        end
        ::__continue29::
    end
end
function SceneUtil._sl_loadScene_terrain_route(self, terrain_route, toCenterX, toCenterY, isFull)
    if isFull == nil then
        isFull = false
    end
    local csvDatas = CsvUtil:parse(terrain_route)
    if not csvDatas then
        return
    end
    for ____, datum in ipairs(csvDatas) do
        do
            if not datum.x then
                goto __continue36
            end
            local x = toCenterX + tonumber(datum.x)
            local y = toCenterY + tonumber(datum.y)
            SetTerrainPathable(
                x,
                y,
                PATHING_TYPE_WALKABILITY,
                tonumber(datum.unWalk) == 0
            )
            SetTerrainPathable(
                x,
                y,
                PATHING_TYPE_FLYABILITY,
                tonumber(datum.unFly) == 0
            )
            SetTerrainPathable(
                x,
                y,
                PATHING_TYPE_BUILDABILITY,
                tonumber(datum.unBuild) == 0
            )
            if isFull then
                SetTerrainPathable(
                    x,
                    y,
                    PATHING_TYPE_BLIGHTPATHING,
                    tonumber(datum.blight) == 1
                )
                SetTerrainPathable(
                    x,
                    y,
                    PATHING_TYPE_FLOATABILITY,
                    tonumber(datum.unWater) == 0
                )
                SetTerrainPathable(
                    x,
                    y,
                    PATHING_TYPE_AMPHIBIOUSPATHING,
                    tonumber(datum.unWater) == 0
                )
            end
        end
        ::__continue36::
    end
end
function SceneUtil._sl_loadScene_dood(self, doodPath, toCenterX, toCenterY)
    local dood = CsvUtil:parse(doodPath)
    local cacheKey = (("dood:" .. tostring(toCenterX)) .. ":") .. tostring(toCenterY)
    local destCacheKey = (("dest:" .. tostring(toCenterX)) .. ":") .. tostring(toCenterY)
    local currentEffects = ____exports.default.cache:get(cacheKey)
    local currentDests = ____exports.default.cache:get(destCacheKey)
    if currentEffects ~= nil then
        for ____, currentEffect in ipairs(currentEffects) do
            EXSetEffectZ(currentEffect, -5000)
            DestroyEffect(currentEffect)
        end
    end
    if currentDests ~= nil then
        for ____, dest in ipairs(currentDests) do
            handle_unref(dest)
            RemoveDestructable(dest)
        end
    end
    currentEffects = {}
    currentDests = {}
    ____exports.default.cache:put(cacheKey, currentEffects)
    ____exports.default.cache:put(destCacheKey, currentDests)
    if not dood then
        return
    end
    for ____, datum in ipairs(dood) do
        do
            if not datum.x then
                goto __continue48
            end
            local typeId = datum.typeId
            local x = toCenterX + tonumber(datum.x)
            local y = toCenterY + tonumber(datum.y)
            local angle = tonumber(datum.angle)
            local obj = _g_objs.doodad[typeId]
            if obj then
                local modelPath = ObjectDataUtil:getStandardModelPath(obj.file)
                local effect = AddSpecialEffect(modelPath, x, y)
                EXSetEffectZ(
                    effect,
                    tonumber(datum.z)
                )
                EXEffectMatScale(
                    effect,
                    tonumber(datum.scaleX),
                    tonumber(datum.scaleY),
                    tonumber(datum.scaleZ)
                )
                EXEffectMatRotateZ(effect, angle)
                currentEffects[#currentEffects + 1] = effect
                goto __continue48
            end
            obj = _g_objs.destructable[typeId]
            if obj then
                local lifePerc = tonumber(datum.lifePerc)
                local v = tonumber(datum.v)
                local destHandle = nil
                if lifePerc == 0 then
                    destHandle = CreateDeadDestructable(
                        typeId,
                        x,
                        y,
                        angle,
                        1,
                        v
                    )
                else
                    destHandle = CreateDestructable(
                        typeId,
                        x,
                        y,
                        angle,
                        1,
                        v
                    )
                    if lifePerc ~= 100 then
                        SetDestructableLife(
                            destHandle,
                            GetDestructableMaxLife(destHandle) * lifePerc / 100
                        )
                    end
                end
                handle_ref(destHandle)
                currentDests[#currentDests + 1] = destHandle
            end
        end
        ::__continue48::
    end
end
function SceneUtil._sl_loadScene_terrain_unit(self, csvPath, toCenterX, toCenterY)
    local csvData = CsvUtil:parse(csvPath)
    local cacheKey = (("unit:" .. tostring(toCenterX)) .. ":") .. tostring(toCenterY)
    local currentHandle = ____exports.default.cache:get(cacheKey)
    if currentHandle ~= nil then
        for ____, h in ipairs(currentHandle) do
            handle_unref(h)
            RemoveUnit(h)
        end
    end
    currentHandle = {}
    ____exports.default.cache:put(cacheKey, currentHandle)
    if not csvData then
        return
    end
    for ____, datum in ipairs(csvData) do
        do
            if not datum.x then
                goto __continue61
            end
            local typeId = datum.typeId
            local x = toCenterX + tonumber(datum.x)
            local y = toCenterY + tonumber(datum.y)
            local uh = CreateUnit(
                Player(tonumber(datum.player)),
                typeId,
                x,
                y,
                tonumber(datum.angle)
            )
            handle_ref(uh)
            currentHandle[#currentHandle + 1] = uh
        end
        ::__continue61::
    end
    return currentHandle
end
SceneUtil._sl_ground_tiles_id = nil
SceneUtil.cache = __TS__New(Cache)
return ____exports
