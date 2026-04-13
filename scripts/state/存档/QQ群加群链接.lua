local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 7,["13"] = 8,["14"] = 9,["15"] = 9,["17"] = 8,["18"] = 6});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
____exports.default = __TS__Class()
local ____QQ_7FA4_52A0_7FA4_94FE_63A5 = ____exports.default
____QQ_7FA4_52A0_7FA4_94FE_63A5.name = "QQ群加群链接"
function ____QQ_7FA4_52A0_7FA4_94FE_63A5.prototype.____constructor(self)
    local actorType = ActorTypeUtil:getActorType("QQ群礼包")
    actorType.onLocalClick = function(____, actor, btn, x, y, actorType)
        if DzOpenQQGroupUrl ~= nil then
            DzOpenQQGroupUrl("http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=jqSXkSAwMyhguQzXX1jUt4AdFPgHUENa&authKey=rK0O3GuqOibzMhlLJzLTT2QcQNv6%2FIHu7BQlUx4HgMXRDRvdS6wteaqXhAnkH1aM&noverify=0&group_code=782345607")
        end
    end
end
return ____exports
