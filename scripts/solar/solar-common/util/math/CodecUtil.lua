local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 2,["7"] = 2,["8"] = 2,["10"] = 2,["11"] = 9,["12"] = 10,["13"] = 11,["14"] = 12,["15"] = 9,["16"] = 19,["17"] = 20,["18"] = 21,["19"] = 22,["20"] = 22,["21"] = 22,["22"] = 22,["23"] = 19,["24"] = 28,["25"] = 29,["26"] = 30,["27"] = 31,["28"] = 28,["29"] = 37,["30"] = 38,["31"] = 39,["32"] = 40,["33"] = 37,["34"] = 46,["35"] = 47,["36"] = 48,["37"] = 46});
local ____exports = {}
____exports.default = __TS__Class()
local CodecUtil = ____exports.default
CodecUtil.name = "CodecUtil"
function CodecUtil.prototype.____constructor(self)
end
function CodecUtil.saesEncode(self, content, password)
    require("solar_aes")
    local fun = _G.saesEncode
    return ____exports.default:sBase64Encode(fun(content, password))
end
function CodecUtil.saesDecode(self, ciphertext, password)
    require("solar_aes")
    local fun = _G.saesDecode
    return fun(
        ____exports.default:sBase64Decode(ciphertext),
        password
    )
end
function CodecUtil.sBase64Encode(self, content)
    local base64 = require("base64")
    local fun = base64.encode
    return fun(content)
end
function CodecUtil.sBase64Decode(self, ciphertext)
    local base64 = require("base64")
    local fun = base64.decode
    return fun(ciphertext)
end
function CodecUtil.md5hex(self, content)
    local md5 = require("md5")
    return md5.sumhexa(content)
end
return ____exports
