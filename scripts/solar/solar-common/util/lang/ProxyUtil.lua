local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__Delete = ____lualib.__TS__Delete
local Map = ____lualib.Map
local __TS__New = ____lualib.__TS__New
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 10,["11"] = 10,["12"] = 10,["14"] = 10,["15"] = 19,["16"] = 20,["17"] = 21,["20"] = 24,["21"] = 24,["22"] = 19,["23"] = 34,["24"] = 35,["25"] = 36,["28"] = 39,["29"] = 39,["30"] = 34,["31"] = 48,["32"] = 49,["33"] = 50,["36"] = 53,["37"] = 54,["38"] = 54,["39"] = 55,["42"] = 58,["43"] = 59,["45"] = 61,["46"] = 54,["47"] = 48,["48"] = 66,["49"] = 67,["50"] = 68,["51"] = 69,["53"] = 71,["54"] = 71,["55"] = 71,["56"] = 71,["57"] = 71,["58"] = 78,["59"] = 79,["61"] = 81,["62"] = 81,["63"] = 81,["64"] = 82,["65"] = 83,["66"] = 84,["67"] = 85,["69"] = 87,["70"] = 88,["72"] = 90,["73"] = 81,["74"] = 92,["75"] = 93,["76"] = 94,["77"] = 95,["79"] = 97,["80"] = 98,["82"] = 100,["83"] = 81,["84"] = 102,["85"] = 103,["86"] = 104,["87"] = 103,["88"] = 81,["89"] = 108,["90"] = 109,["91"] = 110,["94"] = 112,["95"] = 112,["96"] = 113,["97"] = 114,["99"] = 112,["102"] = 81,["103"] = 81,["104"] = 81,["105"] = 120,["106"] = 121,["107"] = 66,["108"] = 12});
local ____exports = {}
____exports.default = __TS__Class()
local ProxyUtil = ____exports.default
ProxyUtil.name = "ProxyUtil"
function ProxyUtil.prototype.____constructor(self)
end
function ProxyUtil.addGetHandler(self, obj, handler)
    if targetLanguage ~= "lua" then
        print("暂未实现")
        return
    end
    local ____table_getHandlers_0 = ____exports.default:getObjProxy(obj).getHandlers
    ____table_getHandlers_0[#____table_getHandlers_0 + 1] = handler
end
function ProxyUtil.addSetHandler(self, obj, handler)
    if targetLanguage ~= "lua" then
        print("暂未实现")
        return
    end
    local ____table_setHandlers_1 = ____exports.default:getObjProxy(obj).setHandlers
    ____table_setHandlers_1[#____table_setHandlers_1 + 1] = handler
end
function ProxyUtil.addValueChangeListener(self, obj, key, handler)
    if targetLanguage ~= "lua" then
        print("暂未实现")
        return
    end
    local lastVal = obj[key]
    local ____table_setHandlers_2 = ____exports.default:getObjProxy(obj).setHandlers
    ____table_setHandlers_2[#____table_setHandlers_2 + 1] = function(____, obj, key2, val)
        if key ~= key2 then
            return
        end
        if val ~= lastVal then
            handler(nil, lastVal, val)
        end
        lastVal = val
    end
end
function ProxyUtil.getObjProxy(self, obj)
    local objProxy = ____exports.default.objProxys:get(obj)
    if objProxy ~= nil then
        return objProxy
    end
    objProxy = {
        vals = __TS__ObjectAssign({}, obj),
        getHandlers = {},
        setHandlers = {}
    }
    for objKey in pairs(obj) do
        __TS__Delete(obj, objKey)
    end
    setmetatable(
        obj,
        {
            __index = function(_, k)
                local result = nil
                for ____, handler in ipairs(objProxy.getHandlers) do
                    result = handler(nil, _, k)
                end
                if result ~= nil then
                    return result
                end
                return objProxy.vals[k]
            end,
            __newindex = function(_, k, v)
                local result = nil
                for ____, handler in ipairs(objProxy.setHandlers) do
                    result = handler(nil, _, k, v)
                end
                if result == nil then
                    result = v
                end
                objProxy.vals[k] = result
            end,
            __pairs = function()
                return function(_, k)
                    return next(objProxy.vals, k)
                end
            end,
            __len = function()
                if objProxy.vals[1] == nil then
                    return 0
                end
                do
                    local i = 2
                    while i < 1000000 do
                        if objProxy.vals[i] == nil then
                            return i
                        end
                        i = i + 1
                    end
                end
            end
        }
    )
    ____exports.default.objProxys:set(obj, objProxy)
    return objProxy
end
ProxyUtil.objProxys = __TS__New(Map)
return ____exports
