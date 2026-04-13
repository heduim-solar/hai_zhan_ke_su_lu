local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["7"] = 3,["8"] = 3,["9"] = 5,["10"] = 6,["11"] = 6,["12"] = 7,["13"] = 7,["14"] = 8,["15"] = 8,["16"] = 9,["17"] = 9,["18"] = 12,["19"] = 12,["20"] = 12,["21"] = 12,["22"] = 14,["23"] = 15,["24"] = 12,["26"] = 12,["27"] = 18,["28"] = 18,["29"] = 18,["30"] = 18,["31"] = 18,["32"] = 18,["33"] = 18,["34"] = 18,["35"] = 18,["36"] = 18,["37"] = 18,["38"] = 18,["39"] = 18,["40"] = 18,["41"] = 18,["43"] = 14,["44"] = 22,["45"] = 23,["46"] = 22,["47"] = 26,["48"] = 27,["49"] = 26,["50"] = 30,["51"] = 31,["52"] = 31,["53"] = 31,["54"] = 31,["55"] = 31,["56"] = 31,["57"] = 31,["58"] = 30,["59"] = 34,["60"] = 35,["61"] = 34,["62"] = 38,["63"] = 39,["64"] = 38,["65"] = 42,["66"] = 43,["67"] = 42,["68"] = 46,["69"] = 47,["70"] = 46,["71"] = 50,["72"] = 51,["73"] = 50,["74"] = 54,["75"] = 55,["76"] = 54});
local ____exports = {}
local ____handle = require("solar.solar-common.w3ts.handles.handle")
local Handle = ____handle.Handle
____exports.ImageType = ImageType or ({})
____exports.ImageType.Selection = 1
____exports.ImageType[____exports.ImageType.Selection] = "Selection"
____exports.ImageType.Indicator = 2
____exports.ImageType[____exports.ImageType.Indicator] = "Indicator"
____exports.ImageType.OcclusionMask = 3
____exports.ImageType[____exports.ImageType.OcclusionMask] = "OcclusionMask"
____exports.ImageType.Ubersplat = 4
____exports.ImageType[____exports.ImageType.Ubersplat] = "Ubersplat"
____exports.Image = __TS__Class()
local Image = ____exports.Image
Image.name = "Image"
__TS__ClassExtends(Image, Handle)
function Image.prototype.____constructor(self, file, sizeX, sizeY, sizeZ, posX, posY, posZ, originX, originY, originZ, imageType)
    if Handle:initFromHandle() then
        Handle.prototype.____constructor(self)
    else
        Handle.prototype.____constructor(
            self,
            CreateImage(
                file,
                sizeX,
                sizeY,
                sizeZ,
                posX,
                posY,
                posZ,
                originX,
                originY,
                originZ,
                imageType
            )
        )
    end
end
function Image.prototype.destroy(self)
    DestroyImage(self.handle)
end
function Image.prototype.setAboveWater(self, flag, useWaterAlpha)
    SetImageAboveWater(self.handle, flag, useWaterAlpha)
end
function Image.prototype.setColor(self, red, green, blue, alpha)
    SetImageColor(
        self.handle,
        red,
        green,
        blue,
        alpha
    )
end
function Image.prototype.setConstantHeight(self, flag, height)
    SetImageConstantHeight(self.handle, flag, height)
end
function Image.prototype.setPosition(self, x, y, z)
    SetImagePosition(self.handle, x, y, z)
end
function Image.prototype.setRender(self, flag)
    SetImageRenderAlways(self.handle, flag)
end
function Image.prototype.setType(self, imageType)
    SetImageType(self.handle, imageType)
end
function Image.prototype.show(self, flag)
    ShowImage(self.handle, flag)
end
function Image.fromHandle(self, handle)
    return self:getObject(handle)
end
return ____exports
