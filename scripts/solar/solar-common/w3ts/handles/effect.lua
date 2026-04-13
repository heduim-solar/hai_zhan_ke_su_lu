local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 3,["10"] = 3,["11"] = 6,["12"] = 6,["13"] = 6,["14"] = 6,["15"] = 24,["16"] = 25,["17"] = 6,["18"] = 27,["19"] = 6,["20"] = 28,["21"] = 28,["22"] = 28,["23"] = 29,["24"] = 6,["25"] = 30,["26"] = 30,["27"] = 30,["29"] = 24,["30"] = 154,["31"] = 155,["32"] = 154,["33"] = 161,["34"] = 162,["35"] = 161,["36"] = 337,["37"] = 338,["38"] = 339,["39"] = 340,["40"] = 337,["41"] = 346,["42"] = 347,["43"] = 348,["44"] = 349,["46"] = 351,["47"] = 352,["49"] = 354,["50"] = 346,["51"] = 360,["52"] = 361,["53"] = 362,["54"] = 360,["55"] = 368,["56"] = 369,["57"] = 368,["58"] = 375,["59"] = 376,["60"] = 377,["61"] = 375,["62"] = 383,["63"] = 384,["64"] = 383,["65"] = 390,["66"] = 391,["67"] = 392,["68"] = 393,["69"] = 394,["70"] = 395,["71"] = 390,["72"] = 401,["73"] = 402,["74"] = 401,["75"] = 405,["76"] = 406,["77"] = 405,["83"] = 12,["84"] = 13,["86"] = 15,["88"] = 18,["89"] = 19,["99"] = 177,["100"] = 178,["101"] = 179,["103"] = 181,["105"] = 168,["106"] = 169,["107"] = 170,["117"] = 198,["118"] = 199,["119"] = 200,["121"] = 202,["123"] = 187,["124"] = 188,["125"] = 189,["127"] = 191,["137"] = 217,["138"] = 218,["139"] = 219,["141"] = 221,["143"] = 208,["144"] = 209,["145"] = 210,["155"] = 236,["157"] = 227,["158"] = 228,["159"] = 229,["169"] = 251,["170"] = 252,["171"] = 253,["173"] = 255,["175"] = 242,["176"] = 243,["177"] = 244,["187"] = 270,["189"] = 261,["190"] = 262,["191"] = 263,["201"] = 285,["203"] = 276,["204"] = 277,["205"] = 278,["215"] = 301,["217"] = 291,["218"] = 292,["219"] = 293,["220"] = 294,["230"] = 316,["232"] = 307,["233"] = 308,["234"] = 309,["244"] = 331,["246"] = 322,["247"] = 323,["248"] = 324});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.Effect = __TS__Class()
local Effect = ____exports.Effect
Effect.name = "Effect"
__TS__ClassExtends(Effect, Handle)
function Effect.prototype.____constructor(self, modelName, a, b)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    elseif type(a) == "number" and type(b) == "number" then
        Handle.prototype.____constructor(
            self,
            AddSpecialEffect(modelName, a, b)
        )
    elseif type(a) ~= "number" and type(b) == "string" then
        Handle.prototype.____constructor(
            self,
            AddSpecialEffectTarget(modelName, a.handle, b)
        )
    end
end
function Effect.createEffect(self, modelName, x, y)
    return __TS__New(____exports.Effect, modelName, x, y)
end
function Effect.createEffectTarget(self, modelName, a, b)
    return __TS__New(____exports.Effect, modelName, a, b)
end
function Effect.prototype.setEffectXY(self, x, y)
    EXSetEffectXY(self.handle, x, y)
    self.data.x = x
    self.data.y = y
end
function Effect.prototype.getEffectXY(self)
    local xy = {x = self.data.x, y = self.data.y}
    if not xy.x then
        xy.x = EXGetEffectX(self.handle)
    end
    if not xy.y then
        xy.y = EXGetEffectY(self.handle)
    end
    return xy
end
function Effect.prototype.setBindEffect(self, han, node)
    BindEffect(han, node, self.handle)
    self.data.binding = han
end
function Effect.prototype.getBindEffect(self)
    return self.data.binding
end
function Effect.prototype.unBindEffect(self)
    UnBindEffect(self.handle)
    self.data.binding = nil
end
function Effect.prototype.setEffectAnimation(self, aon)
    EXSetEffectAnimation(self.handle, aon)
end
function Effect.prototype.reset(self)
    EXEffectMatReset(self.handle)
    self.data.size = 1
    self.data.rotateX = 0
    self.data.rotateY = 0
    self.data.rotateZ = 0
end
function Effect.prototype.destroy(self)
    DestroyEffect(self.handle)
end
function Effect.fromHandle(self, handle)
    return self:getObject(handle)
end
__TS__SetDescriptor(
    Effect.prototype,
    "data",
    {
        get = function(self)
            if not self._data then
                self._data = {}
            end
            return self._data
        end,
        set = function(self, value)
            self._data = value
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectSize",
    {
        get = function(self)
            local size = self.data.size
            if not size then
                size = EXGetEffectSize(self.handle)
            end
            return size
        end,
        set = function(self, size)
            EXSetEffectSize(self.handle, size)
            self.data.size = size
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectPariticleSize",
    {
        get = function(self)
            local size = self.data.Parsize
            if not size then
                size = 0
            end
            return size
        end,
        set = function(self, size)
            if SetPariticle2Size then
                SetPariticle2Size(self.handle, size)
            end
            self.data.Parsize = size
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectZ",
    {
        get = function(self)
            local z = self.data.z
            if not z then
                z = EXGetEffectZ(self.handle)
            end
            return z
        end,
        set = function(self, Z)
            EXSetEffectZ(self.handle, Z)
            self.data.z = Z
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectSpeed",
    {
        get = function(self)
            return self.data.Speed
        end,
        set = function(self, Speed)
            EXSetEffectSpeed(self.handle, Speed)
            self.data.Speed = Speed
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectColor",
    {
        get = function(self)
            local Color = self.data.color
            if not Color then
                Color = EXGetEffectColor(self.handle)
            end
            return Color
        end,
        set = function(self, Color)
            EXSetEffectColor(self.handle, Color)
            self.data.color = Color
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectFogVisible",
    {
        get = function(self)
            return self.data.fogvisible
        end,
        set = function(self, fogvisible)
            EXSetEffectFogVisible(self.handle, fogvisible)
            self.data.fogvisible = fogvisible
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectVisible",
    {
        get = function(self)
            return self.data.visible
        end,
        set = function(self, visible)
            EXSetEffectVisible(self.handle, visible)
            self.data.visible = visible
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectRotateZ",
    {
        get = function(self)
            return self.data.rotateZ
        end,
        set = function(self, z)
            self:reset()
            EXEffectMatRotateZ(self.handle, z)
            self.data.rotateZ = z
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectRotateX",
    {
        get = function(self)
            return self.data.rotateX
        end,
        set = function(self, x)
            EXEffectMatRotateX(self.handle, x)
            self.data.rotateX = x
        end
    },
    true
)
__TS__SetDescriptor(
    Effect.prototype,
    "effectRotateY",
    {
        get = function(self)
            return self.data.rotateY
        end,
        set = function(self, y)
            EXEffectMatRotateY(self.handle, y)
            self.data.rotateY = y
        end
    },
    true
)
return ____exports
