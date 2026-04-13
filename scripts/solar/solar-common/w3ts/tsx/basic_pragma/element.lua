local ____lualib = require("lualib_bundle")
local __TS__ArrayFlat = ____lualib.__TS__ArrayFlat
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__ObjectRest = ____lualib.__TS__ObjectRest
local __TS__Delete = ____lualib.__TS__Delete
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["11"] = 79,["12"] = 3,["13"] = 3,["14"] = 4,["15"] = 4,["16"] = 4,["17"] = 55,["18"] = 59,["19"] = 61,["20"] = 61,["21"] = 61,["22"] = 61,["24"] = 61,["25"] = 62,["26"] = 62,["27"] = 62,["28"] = 62,["29"] = 66,["30"] = 66,["32"] = 67,["34"] = 71,["35"] = 74,["36"] = 74,["38"] = 76,["39"] = 55,["40"] = 79,["41"] = 80,["43"] = 17,["44"] = 29,["45"] = 30,["46"] = 30,["47"] = 30,["48"] = 30,["49"] = 30,["50"] = 30,["51"] = 30,["52"] = 30,["53"] = 29,["54"] = 39,["55"] = 83,["56"] = 84,["57"] = 84,["58"] = 87,["59"] = 83});
local ____exports = {}
local createTextElement
local ____common = require("solar.solar-common.w3ts.tsx.basic_pragma.common")
local TEXT_ELEMENT = ____common.TEXT_ELEMENT
local ____arrays = require("solar.solar-common.w3ts.tsx.basic_pragma.utils.arrays")
local compact = ____arrays.compact
local getLength = ____arrays.getLength
function ____exports.createElement(self, ____type, config, ...)
    local children = {...}
    local ____TS__ObjectAssign_result_0 = __TS__ObjectAssign({}, config)
    local key = ____TS__ObjectAssign_result_0.key
    if key == nil then
        key = nil
    end
    local props = __TS__ObjectRest(____TS__ObjectAssign_result_0, {key = true})
    local flattenedChildren = ____exports.processChildren(
        nil,
        children and getLength(nil, children) > 0 and children or ({})
    )
    if #flattenedChildren > 0 then
        props.children = flattenedChildren
    else
        __TS__Delete(props, "children")
    end
    local vnode = {type = ____type, props = props}
    if key ~= nil then
        vnode.key = key
    end
    return vnode
end
function createTextElement(self, value)
    return ____exports.createElement(nil, TEXT_ELEMENT, {nodeValue = value})
end
____exports.isChild = function(____, obj) return type(obj) == "table" and obj ~= nil and obj.type ~= nil and obj.props ~= nil or type(obj) == "boolean" or type(obj) == "string" end
____exports.processChildren = function(____, children) return __TS__ArrayMap(
    __TS__ArrayFilter(
        compact(
            nil,
            __TS__ArrayFlat(compact(nil, children))
        ),
        function(____, c) return type(c) ~= "boolean" and (type(c) == "string" or not not c.type) end
    ),
    function(____, c) return type(c) == "string" and createTextElement(nil, c) or c end
) end
local EMPTY_OBJECT = {}
____exports.Fragment = function(____, ____bindingPattern0)
    local children
    children = ____bindingPattern0.children
    return children or nil
end
return ____exports
