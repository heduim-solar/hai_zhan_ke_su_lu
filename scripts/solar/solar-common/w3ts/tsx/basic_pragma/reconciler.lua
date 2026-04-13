local ____lualib = require("lualib_bundle")
local WeakMap = ____lualib.WeakMap
local __TS__New = ____lualib.__TS__New
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayFilter = ____lualib.__TS__ArrayFilter
local __TS__Class = ____lualib.__TS__Class
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local Set = ____lualib.Set
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__Iterator = ____lualib.__TS__Iterator
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["15"] = 133,["16"] = 3,["17"] = 3,["18"] = 5,["19"] = 5,["20"] = 5,["21"] = 6,["22"] = 6,["23"] = 6,["24"] = 7,["25"] = 7,["26"] = 51,["29"] = 127,["30"] = 128,["33"] = 57,["34"] = 60,["35"] = 60,["37"] = 63,["38"] = 64,["39"] = 66,["40"] = 67,["41"] = 68,["42"] = 70,["43"] = 71,["44"] = 72,["46"] = 76,["47"] = 80,["48"] = 82,["49"] = 88,["50"] = 94,["51"] = 95,["54"] = 100,["55"] = 101,["56"] = 102,["59"] = 98,["65"] = 105,["66"] = 109,["67"] = 115,["69"] = 122,["70"] = 123,["77"] = 56,["80"] = 51,["81"] = 133,["82"] = 134,["83"] = 134,["85"] = 136,["86"] = 137,["87"] = 138,["88"] = 138,["92"] = 140,["93"] = 140,["96"] = 143,["97"] = 147,["98"] = 147,["100"] = 149,["101"] = 150,["102"] = 151,["103"] = 152,["104"] = 153,["106"] = 155,["107"] = 155,["108"] = 156,["109"] = 157,["110"] = 158,["111"] = 163,["112"] = 163,["114"] = 155,["117"] = 165,["119"] = 168,["120"] = 172,["121"] = 172,["122"] = 172,["123"] = 174,["124"] = 175,["125"] = 175,["127"] = 177,["128"] = 182,["129"] = 183,["130"] = 183,["131"] = 183,["132"] = 183,["133"] = 186,["134"] = 192,["135"] = 193,["137"] = 196,["138"] = 197,["141"] = 202,["144"] = 200,["150"] = 205,["151"] = 205,["152"] = 205,["154"] = 205,["155"] = 206,["156"] = 208,["157"] = 208,["158"] = 208,["159"] = 208,["160"] = 208,["161"] = 208,["162"] = 208,["163"] = 215,["166"] = 230,["167"] = 234,["168"] = 234,["169"] = 234,["170"] = 235,["171"] = 236,["172"] = 237,["173"] = 238,["174"] = 240,["176"] = 244,["177"] = 245,["178"] = 246,["179"] = 247,["181"] = 253,["182"] = 253,["183"] = 253,["184"] = 257,["185"] = 258,["186"] = 257,["187"] = 253,["188"] = 261,["191"] = 265,["192"] = 266,["193"] = 267,["195"] = 9,["196"] = 11,["197"] = 9,["198"] = 15,["199"] = 9,["200"] = 9,["201"] = 33,["202"] = 35,["203"] = 36,["204"] = 37,["205"] = 38,["206"] = 35,["207"] = 219,["208"] = 225,["209"] = 226,["210"] = 226,["212"] = 227,["214"] = 225,["215"] = 270,["216"] = 275,["217"] = 276,["218"] = 277,["219"] = 278,["220"] = 276,["221"] = 281,["222"] = 281,["223"] = 281,["224"] = 284,["225"] = 284,["226"] = 282,["227"] = 284,["228"] = 287,["229"] = 288,["230"] = 289,["231"] = 290,["232"] = 290,["234"] = 287,["238"] = 293,["239"] = 294,["243"] = 300,["244"] = 301,["245"] = 302,["246"] = 300,["247"] = 305,["248"] = 306,["249"] = 306,["251"] = 307,["252"] = 305,["253"] = 310});
local ____exports = {}
local cleanupFrames, reconcileChildren, instantiate, createPublicInstance, functionalComponentClasses, isClass
local ____adapter = require("solar.solar-common.w3ts.tsx.basic_pragma.adapter")
local adapter = ____adapter.adapter
local ____element = require("solar.solar-common.w3ts.tsx.basic_pragma.element")
local isChild = ____element.isChild
local processChildren = ____element.processChildren
local ____common = require("solar.solar-common.w3ts.tsx.basic_pragma.common")
local isLua = ____common.isLua
local TEXT_ELEMENT = ____common.TEXT_ELEMENT
local ____arrays = require("solar.solar-common.w3ts.tsx.basic_pragma.utils.arrays")
local compact = ____arrays.compact
function ____exports.reconcile(parentFrame, instance, vnode)
    do
        local function ____catch(err)
            print(err)
            return true, nil
        end
        local ____try, ____hasReturned, ____returnValue = pcall(function()
            if not instance then
                if not vnode then
                    return true, nil
                end
                return true, instantiate(vnode, parentFrame)
            elseif not vnode then
                cleanupFrames(instance)
                return true, nil
            elseif instance.vnode.type ~= vnode.type then
                local newInstance = instantiate(vnode, parentFrame)
                cleanupFrames(instance)
                return true, newInstance
            else
                local instanceOfSameType = instance
                if type(vnode.type) == "string" then
                    adapter:updateFrameProperties(instance.hostFrame, instance.vnode.props, vnode.props)
                    instanceOfSameType.childInstances = reconcileChildren(instanceOfSameType, vnode)
                elseif instanceOfSameType.component then
                    instanceOfSameType.component.props = vnode.props
                    do
                        local function ____catch(err)
                            print(err)
                            cleanupFrames(instance)
                            error(err, 0)
                        end
                        local ____try, ____hasReturned = pcall(function()
                            ____exports.hooks.beforeRender(instanceOfSameType.component)
                        end)
                        if not ____try then
                            ____catch(____hasReturned)
                        end
                    end
                    local rendered = instanceOfSameType.component:render(vnode.props)
                    local children = isChild(nil, rendered) and (rendered and ({rendered}) or ({})) or rendered
                    instanceOfSameType.childInstances = reconcileChildren(instanceOfSameType, vnode, children)
                end
                instanceOfSameType.vnode = vnode
                return true, instanceOfSameType
            end
        end)
        if not ____try then
            ____hasReturned, ____returnValue = ____catch(____hasReturned)
        end
        if ____hasReturned then
            return ____returnValue
        end
    end
end
function cleanupFrames(instance)
    if instance.component then
        ____exports.hooks.beforeUnmount(instance.component)
    end
    if instance.childInstances then
        for ____, child in ipairs(instance.childInstances) do
            if child ~= nil then
                cleanupFrames(child)
            end
        end
    end
    if instance.hostFrame then
        adapter:cleanupFrame(instance.hostFrame)
    end
end
function reconcileChildren(instance, vnode, children)
    if children == nil then
        children = vnode.props.children
    end
    local hostFrame = instance.hostFrame
    local childInstances = instance.childInstances
    local nextChildElements = processChildren(nil, children or ({}))
    local newChildInstances = {}
    local count = math.max(#childInstances, #nextChildElements)
    do
        local i = 0
        while i < count do
            local childInstance = childInstances[i + 1]
            local childElement = nextChildElements[i + 1]
            local newChildInstance = ____exports.reconcile(hostFrame, childInstance, childElement)
            if newChildInstance ~= nil then
                newChildInstances[#newChildInstances + 1] = newChildInstance
            end
            i = i + 1
        end
    end
    return newChildInstances
end
function instantiate(vnode, parentFrame)
    local ____vnode_0 = vnode
    local ____type = ____vnode_0.type
    local props = ____vnode_0.props
    if type(____type) == "string" then
        if ____type == TEXT_ELEMENT then
            error("Cannot create inline text, yet", 0)
        end
        local frame = adapter:createFrame(____type, parentFrame, props)
        local childElements = processChildren(nil, props.children or ({}))
        local childInstances = __TS__ArrayMap(
            childElements,
            function(____, child) return instantiate(child, frame) end
        )
        local instance = {hostFrame = frame, vnode = vnode, childInstances = childInstances}
        adapter:updateFrameProperties(frame, {}, props)
        return instance
    else
        local instance = {vnode = vnode}
        instance.component = createPublicInstance(vnode, instance)
        do
            local function ____catch(err)
                print(err)
            end
            local ____try, ____hasReturned = pcall(function()
                ____exports.hooks.beforeRender(instance.component)
            end)
            if not ____try then
                ____catch(____hasReturned)
            end
        end
        local ____temp_1 = instance.component:render(props)
        if ____temp_1 == nil then
            ____temp_1 = {}
        end
        local rendered = ____temp_1
        local childElements = isChild(nil, rendered) and ({rendered}) or rendered
        instance.childInstances = __TS__ArrayMap(
            __TS__ArrayFilter(
                compact(nil, childElements),
                function(____, child) return type(child) == "table" end
            ),
            function(____, child) return instantiate(child, parentFrame) end
        )
        return instance
    end
end
function createPublicInstance(vnode, internalInstance)
    local ____vnode_2 = vnode
    local ComponentType = ____vnode_2.type
    local props = ____vnode_2.props
    local constructor
    if type(ComponentType) == "string" then
        error("Tried createPublicInstance() with string", 0)
    elseif isClass(ComponentType) then
        constructor = ComponentType
    else
        local renderFunc = ComponentType
        local existingClass = functionalComponentClasses:get(renderFunc)
        if existingClass then
            constructor = existingClass
        else
            local ____class_3 = __TS__Class()
            ____class_3.name = ____class_3.name
            __TS__ClassExtends(____class_3, ____exports.ClassComponent)
            function ____class_3.prototype.render(self, props)
                return renderFunc(props)
            end
            constructor = ____class_3
            functionalComponentClasses:set(renderFunc, constructor)
        end
    end
    local publicInstance = __TS__New(constructor, props)
    publicInstance.instance = internalInstance
    return publicInstance
end
____exports.hooks = {
    beforeRender = function(instance)
    end,
    beforeUnmount = function(instance)
    end
}
local containerMap = __TS__New(WeakMap)
function ____exports.render(vnode, container)
    local prevInstance = containerMap:get(container) or nil
    local nextInstance = ____exports.reconcile(container, prevInstance, vnode)
    containerMap:set(containerMap, nextInstance)
end
functionalComponentClasses = __TS__New(WeakMap)
isClass = function(constructor)
    if isLua then
        return type(constructor) ~= "function"
    else
        return constructor.prototype ~= nil
    end
end
local instanceMap = __TS__New(WeakMap)
local scheduledUpdates = __TS__New(Set)
local function scheduleUpdate(instance)
    scheduledUpdates:add(instance)
    adapter:scheduleUpdate()
end
____exports.ClassComponent = __TS__Class()
local ClassComponent = ____exports.ClassComponent
ClassComponent.name = "ClassComponent"
function ClassComponent.prototype.____constructor(self, props)
    self.props = props
    self.state = {}
end
function ClassComponent.prototype.setState(self, partialState)
    self.state = __TS__ObjectAssign({}, self.state, partialState)
    local instance = instanceMap:get(self)
    if instance then
        scheduleUpdate(instance)
    end
end
__TS__SetDescriptor(
    ClassComponent.prototype,
    "instance",
    {set = function(self, instance)
        instanceMap:set(self, instance)
    end},
    true
)
local function updateInstance(internalInstance)
    local vnode = internalInstance.vnode
    ____exports.reconcile(nil, internalInstance, vnode)
end
____exports.flushUpdates = function()
    for ____, instance in __TS__Iterator(scheduledUpdates:values()) do
        updateInstance(instance)
    end
    scheduledUpdates:clear()
end
____exports.test = {functionalComponentClasses = functionalComponentClasses}
return ____exports
