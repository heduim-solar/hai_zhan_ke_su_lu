local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ArrayIndexOf = ____lualib.__TS__ArrayIndexOf
local __TS__ArraySplice = ____lualib.__TS__ArraySplice
local __TS__ArrayForEach = ____lualib.__TS__ArrayForEach
local __TS__Delete = ____lualib.__TS__Delete
local __TS__ClassExtends = ____lualib.__TS__ClassExtends
local __TS__FunctionBind = ____lualib.__TS__FunctionBind
local __TS__ParseInt = ____lualib.__TS__ParseInt
local __TS__ObjectKeys = ____lualib.__TS__ObjectKeys
local __TS__ArrayMap = ____lualib.__TS__ArrayMap
local __TS__ArrayConcat = ____lualib.__TS__ArrayConcat
local __TS__ArrayFind = ____lualib.__TS__ArrayFind
local __TS__New = ____lualib.__TS__New
local __TS__ArraySlice = ____lualib.__TS__ArraySlice
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["19"] = 1,["20"] = 2,["21"] = 1,["22"] = 5,["23"] = 7,["24"] = 9,["26"] = 14,["27"] = 14,["28"] = 14,["29"] = 22,["30"] = 16,["31"] = 18,["32"] = 23,["33"] = 22,["34"] = 31,["35"] = 32,["36"] = 33,["37"] = 34,["38"] = 35,["39"] = 36,["42"] = 40,["43"] = 40,["44"] = 40,["45"] = 40,["46"] = 41,["47"] = 42,["50"] = 46,["51"] = 46,["53"] = 48,["54"] = 48,["55"] = 48,["56"] = 48,["58"] = 51,["62"] = 31,["63"] = 62,["64"] = 63,["65"] = 64,["66"] = 65,["67"] = 66,["68"] = 68,["70"] = 64,["71"] = 71,["72"] = 62,["73"] = 79,["74"] = 80,["75"] = 81,["76"] = 82,["77"] = 83,["79"] = 81,["80"] = 86,["81"] = 79,["82"] = 94,["83"] = 95,["84"] = 96,["85"] = 97,["86"] = 96,["87"] = 99,["88"] = 94,["90"] = 108,["91"] = 108,["92"] = 108,["94"] = 113,["95"] = 118,["96"] = 127,["97"] = 130,["98"] = 130,["99"] = 130,["100"] = 129,["101"] = 138,["102"] = 139,["103"] = 139,["104"] = 141,["105"] = 142,["106"] = 143,["107"] = 144,["109"] = 146,["110"] = 141,["111"] = 138,["112"] = 155,["113"] = 156,["114"] = 157,["115"] = 158,["117"] = 161,["120"] = 165,["121"] = 165,["122"] = 168,["123"] = 168,["124"] = 168,["125"] = 168,["126"] = 155,["127"] = 175,["128"] = 176,["129"] = 177,["130"] = 178,["131"] = 178,["132"] = 178,["133"] = 178,["134"] = 175,["135"] = 186,["136"] = 187,["137"] = 188,["140"] = 192,["141"] = 193,["142"] = 194,["143"] = 196,["144"] = 197,["146"] = 201,["147"] = 201,["148"] = 201,["149"] = 201,["151"] = 186,["153"] = 234,["154"] = 234,["155"] = 234,["156"] = 283,["157"] = 279,["158"] = 284,["159"] = 285,["160"] = 283,["161"] = 239,["162"] = 240,["163"] = 240,["164"] = 240,["165"] = 242,["166"] = 242,["167"] = 242,["168"] = 263,["169"] = 242,["170"] = 263,["171"] = 246,["172"] = 247,["173"] = 248,["174"] = 246,["175"] = 251,["176"] = 252,["177"] = 253,["178"] = 254,["180"] = 251,["181"] = 244,["182"] = 268,["183"] = 239,["186"] = 298,["187"] = 298,["188"] = 298,["189"] = 396,["190"] = 396,["191"] = 396,["193"] = 304,["194"] = 306,["195"] = 321,["196"] = 331,["197"] = 397,["198"] = 397,["199"] = 397,["200"] = 398,["201"] = 399,["202"] = 396,["203"] = 407,["204"] = 408,["205"] = 407,["206"] = 423,["207"] = 424,["208"] = 425,["210"] = 428,["211"] = 429,["212"] = 431,["213"] = 433,["214"] = 435,["215"] = 436,["216"] = 437,["218"] = 439,["219"] = 440,["221"] = 431,["223"] = 445,["224"] = 445,["225"] = 423,["226"] = 452,["227"] = 452,["228"] = 452,["229"] = 538,["230"] = 465,["231"] = 470,["232"] = 475,["233"] = 480,["234"] = 485,["235"] = 490,["236"] = 498,["237"] = 499,["238"] = 499,["239"] = 499,["240"] = 501,["241"] = 505,["242"] = 506,["243"] = 507,["244"] = 508,["245"] = 508,["246"] = 508,["247"] = 509,["248"] = 508,["249"] = 508,["251"] = 499,["252"] = 499,["253"] = 498,["254"] = 523,["255"] = 528,["256"] = 536,["257"] = 924,["258"] = 925,["259"] = 928,["260"] = 929,["261"] = 930,["262"] = 931,["263"] = 932,["267"] = 937,["269"] = 939,["270"] = 939,["271"] = 939,["272"] = 941,["273"] = 941,["274"] = 942,["275"] = 942,["276"] = 942,["277"] = 941,["278"] = 941,["279"] = 944,["280"] = 946,["281"] = 948,["282"] = 949,["283"] = 950,["285"] = 953,["286"] = 954,["287"] = 955,["291"] = 939,["294"] = 962,["295"] = 963,["296"] = 963,["297"] = 964,["298"] = 965,["299"] = 968,["300"] = 969,["301"] = 970,["304"] = 924,["305"] = 539,["306"] = 540,["307"] = 540,["308"] = 540,["309"] = 541,["310"] = 540,["311"] = 540,["313"] = 538,["314"] = 549,["315"] = 550,["316"] = 550,["317"] = 550,["318"] = 551,["319"] = 550,["320"] = 550,["321"] = 554,["322"] = 554,["323"] = 554,["324"] = 555,["325"] = 554,["326"] = 554,["327"] = 549,["328"] = 564,["329"] = 565,["330"] = 565,["331"] = 565,["332"] = 565,["333"] = 564,["334"] = 573,["335"] = 574,["338"] = 578,["339"] = 578,["340"] = 579,["341"] = 580,["342"] = 583,["343"] = 584,["344"] = 584,["346"] = 588,["347"] = 590,["348"] = 591,["349"] = 588,["350"] = 594,["351"] = 573,["352"] = 602,["353"] = 603,["354"] = 604,["355"] = 605,["357"] = 608,["360"] = 612,["361"] = 613,["362"] = 614,["364"] = 618,["365"] = 619,["366"] = 619,["368"] = 623,["369"] = 624,["370"] = 625,["371"] = 625,["372"] = 625,["373"] = 626,["374"] = 627,["375"] = 628,["377"] = 625,["378"] = 625,["380"] = 634,["381"] = 635,["382"] = 636,["383"] = 602,["384"] = 644,["385"] = 645,["388"] = 649,["391"] = 653,["392"] = 653,["393"] = 656,["394"] = 656,["395"] = 656,["396"] = 657,["397"] = 656,["398"] = 656,["399"] = 661,["400"] = 661,["401"] = 661,["402"] = 662,["403"] = 663,["404"] = 664,["405"] = 665,["406"] = 666,["407"] = 667,["411"] = 661,["412"] = 661,["413"] = 644,["414"] = 679,["415"] = 680,["418"] = 684,["419"] = 685,["420"] = 687,["421"] = 687,["422"] = 687,["423"] = 688,["424"] = 689,["425"] = 690,["426"] = 691,["427"] = 692,["428"] = 693,["432"] = 687,["433"] = 687,["434"] = 699,["435"] = 701,["436"] = 702,["437"] = 703,["439"] = 707,["440"] = 707,["441"] = 707,["442"] = 708,["443"] = 707,["444"] = 707,["446"] = 679,["447"] = 718,["448"] = 719,["449"] = 720,["450"] = 722,["451"] = 722,["452"] = 722,["454"] = 724,["455"] = 724,["456"] = 725,["457"] = 726,["458"] = 728,["460"] = 732,["461"] = 732,["462"] = 733,["463"] = 733,["464"] = 733,["465"] = 732,["466"] = 732,["468"] = 736,["469"] = 736,["470"] = 736,["472"] = 737,["473"] = 738,["477"] = 736,["480"] = 744,["483"] = 722,["484"] = 722,["485"] = 718,["486"] = 753,["487"] = 754,["488"] = 757,["489"] = 758,["490"] = 760,["491"] = 768,["492"] = 768,["493"] = 768,["494"] = 769,["495"] = 771,["497"] = 774,["498"] = 775,["501"] = 779,["502"] = 780,["503"] = 781,["504"] = 781,["505"] = 781,["506"] = 783,["507"] = 783,["508"] = 783,["509"] = 784,["510"] = 785,["511"] = 787,["512"] = 788,["513"] = 792,["514"] = 793,["515"] = 794,["518"] = 799,["519"] = 800,["521"] = 802,["522"] = 803,["524"] = 806,["525"] = 807,["526"] = 809,["527"] = 810,["529"] = 814,["531"] = 819,["532"] = 819,["533"] = 822,["535"] = 783,["536"] = 783,["537"] = 768,["538"] = 768,["539"] = 829,["541"] = 830,["542"] = 831,["544"] = 834,["545"] = 835,["546"] = 836,["547"] = 837,["552"] = 840,["553"] = 753,["554"] = 851,["555"] = 852,["556"] = 853,["557"] = 854,["558"] = 851,["559"] = 862,["560"] = 863,["563"] = 867,["565"] = 870,["566"] = 870,["568"] = 871,["569"] = 874,["570"] = 876,["571"] = 879,["572"] = 880,["574"] = 883,["575"] = 884,["577"] = 888,["578"] = 889,["581"] = 895,["584"] = 870,["587"] = 899,["588"] = 899,["589"] = 899,["590"] = 900,["591"] = 901,["592"] = 902,["593"] = 903,["594"] = 903,["595"] = 903,["596"] = 903,["597"] = 903,["598"] = 899,["599"] = 899,["600"] = 862,["601"] = 980,["602"] = 982,["603"] = 983,["605"] = 986,["606"] = 988,["608"] = 992,["609"] = 992,["610"] = 992,["611"] = 993,["612"] = 992,["613"] = 992,["615"] = 980,["616"] = 454});
local ____exports = {}
local function NOW(self)
    return ____exports.default.WorldTime
end
local SEQ_SYSTEM = 1
local SEQ_ENTITY = 1
local SEQ_COMPONENT = 1
--- Utility class for asynchronous access to a list
____exports.Iterator = __TS__Class()
local Iterator = ____exports.Iterator
Iterator.name = "Iterator"
function Iterator.prototype.____constructor(self, next)
    self["end"] = false
    self.cache = {}
    self.next = next
end
function Iterator.prototype.each(self, cb)
    local index = 0
    while true do
        local value
        if #self.cache <= index then
            if self["end"] then
                break
            end
            local ____self_next_1 = self.next
            local ____index_0 = index
            index = ____index_0 + 1
            value = ____self_next_1(self, ____index_0)
            if value == nil then
                self["end"] = true
                break
            end
            local ____self_cache_2 = self.cache
            ____self_cache_2[#____self_cache_2 + 1] = value
        else
            local ____self_cache_4 = self.cache
            local ____index_3 = index
            index = ____index_3 + 1
            value = ____self_cache_4[____index_3 + 1]
        end
        if cb(nil, value) == false then
            break
        end
    end
end
function Iterator.prototype.find(self, test)
    local out = nil
    self:each(function(____, item)
        if test(nil, item) then
            out = item
            return false
        end
    end)
    return out
end
function Iterator.prototype.filter(self, test)
    local list = {}
    self:each(function(____, item)
        if test(nil, item) then
            list[#list + 1] = item
        end
    end)
    return list
end
function Iterator.prototype.map(self, cb)
    local list = {}
    self:each(function(____, item)
        list[#list + 1] = cb(nil, item)
    end)
    return list
end
--- Representation of an entity in ECS
____exports.Entity = __TS__Class()
local Entity = ____exports.Entity
Entity.name = "Entity"
function Entity.prototype.____constructor(self)
    self.subscriptions = {}
    self.components = {}
    self.active = true
    local ____SEQ_ENTITY_5 = SEQ_ENTITY
    SEQ_ENTITY = ____SEQ_ENTITY_5 + 1
    self.id = ____SEQ_ENTITY_5
end
function Entity.prototype.subscribe(self, handler)
    local ____self_subscriptions_6 = self.subscriptions
    ____self_subscriptions_6[#____self_subscriptions_6 + 1] = handler
    return function()
        local idx = __TS__ArrayIndexOf(self.subscriptions, handler)
        if idx >= 0 then
            __TS__ArraySplice(self.subscriptions, idx, 1)
        end
        return self
    end
end
function Entity.prototype.add(self, component)
    local ____type = component.type
    if not self.components[____type] then
        self.components[____type] = {}
    end
    if __TS__ArrayIndexOf(self.components[____type], component) >= 0 then
        return
    end
    local ____self_components_____type_7 = self.components[____type]
    ____self_components_____type_7[#____self_components_____type_7 + 1] = component
    __TS__ArrayForEach(
        self.subscriptions,
        function(____, cb) return cb(nil, self, component, nil) end
    )
end
function Entity.prototype.set(self, component)
    local ____type = component.type
    self.components[____type] = {component}
    __TS__ArrayForEach(
        self.subscriptions,
        function(____, cb) return cb(nil, self, component, nil) end
    )
end
function Entity.prototype.remove(self, component)
    local ____type = component.type
    if not self.components[____type] then
        return
    end
    local idx = __TS__ArrayIndexOf(self.components[____type], component)
    if idx >= 0 then
        __TS__ArraySplice(self.components[____type], idx, 1)
        if #self.components[____type] < 1 then
            __TS__Delete(self.components, ____type)
        end
        __TS__ArrayForEach(
            self.subscriptions,
            function(____, cb) return cb(nil, self, nil, component) end
        )
    end
end
--- Representation of a component in ECS
____exports.Component = __TS__Class()
local Component = ____exports.Component
Component.name = "Component"
function Component.prototype.____constructor(self, ____type, data)
    self.attr = {}
    self.type = ____type
    self.data = data
end
function Component.register(self)
    local ____SEQ_COMPONENT_8 = SEQ_COMPONENT
    SEQ_COMPONENT = ____SEQ_COMPONENT_8 + 1
    local typeID = ____SEQ_COMPONENT_8
    local ComponentImpl = __TS__Class()
    ComponentImpl.name = "ComponentImpl"
    __TS__ClassExtends(ComponentImpl, ____exports.Component)
    function ComponentImpl.prototype.____constructor(self, data)
        ComponentImpl.____super.prototype.____constructor(self, typeID, data)
    end
    function ComponentImpl.allFrom(self, entity)
        local components = entity.components[typeID]
        return components or ({})
    end
    function ComponentImpl.oneFrom(self, entity)
        local components = ComponentImpl:allFrom(entity)
        if components and #components > 0 then
            return components[1]
        end
    end
    ComponentImpl.type = typeID
    return ComponentImpl
end
--- Represents the logic that transforms component data of an entity from its current state to its next state. A system
-- runs on entities that have a specific set of component types.
____exports.System = __TS__Class()
local System = ____exports.System
System.name = "System"
function System.prototype.____constructor(self, componentTypes, frequence)
    if frequence == nil then
        frequence = 0
    end
    self.componentTypes = {}
    self.callbacks = {}
    self.world = nil
    self.trigger = nil
    local ____SEQ_SYSTEM_9 = SEQ_SYSTEM
    SEQ_SYSTEM = ____SEQ_SYSTEM_9 + 1
    self.id = ____SEQ_SYSTEM_9
    self.componentTypes = componentTypes
    self.frequence = frequence
end
function System.prototype.query(self, componentTypes)
    return self.world:query(componentTypes)
end
function System.prototype.listenTo(self, event, callback, once)
    if not (rawget(self.callbacks, event) ~= nil) then
        self.callbacks[event] = {}
    end
    if once then
        local tmp = __TS__FunctionBind(callback, self)
        callback = function(____, data, entities)
            tmp(nil, data, entities)
            local idx = __TS__ArrayIndexOf(self.callbacks[event], callback)
            if idx >= 0 then
                __TS__ArraySplice(self.callbacks[event], idx, 1)
            end
            if #self.callbacks[event] == 0 then
                __TS__Delete(self.callbacks, event)
            end
        end
    end
    local ____self_callbacks_event_10 = self.callbacks[event]
    ____self_callbacks_event_10[#____self_callbacks_event_10 + 1] = callback
end
____exports.default = __TS__Class()
local ECS = ____exports.default
ECS.name = "ECS"
function ECS.prototype.____constructor(self, systems)
    self.systems = {}
    self.entities = {}
    self.entitySystems = {}
    self.entitySystemLastUpdate = {}
    self.entitySystemLastUpdateGame = {}
    self.entitySubscription = {}
    self.systemTrigger = function(____, event, data)
        __TS__ArrayForEach(
            self.systems,
            function(____, system)
                local callbacks = system.callbacks
                if rawget(callbacks, event) ~= nil and #callbacks[event] > 0 then
                    self:inject(system)
                    local entitiesIterator = self:query(system.componentTypes)
                    __TS__ArrayForEach(
                        callbacks[event],
                        function(____, callback)
                            callback(nil, data, entitiesIterator)
                        end
                    )
                end
            end
        )
    end
    self.timeScale = 1
    self.lastUpdate = NOW(nil)
    self.gameTime = 0
    self.indexEntitySystem = function(____, entity, system)
        local idx = __TS__ArrayIndexOf(self.entitySystems[entity.id], system)
        if __TS__ArrayIndexOf(self.systems, system) < 0 then
            if idx >= 0 then
                __TS__ArraySplice(self.entitySystems[entity.id], idx, 1)
                __TS__Delete(self.entitySystemLastUpdate[entity.id], system.id)
                __TS__Delete(self.entitySystemLastUpdateGame[entity.id], system.id)
            end
            return
        end
        local systemComponentTypes = system.componentTypes
        do
            local a = 0
            local l = #systemComponentTypes
            while a < l do
                local entityComponentIDs = __TS__ArrayConcat(
                    {-1},
                    __TS__ArrayMap(
                        __TS__ObjectKeys(entity.components),
                        function(____, v) return __TS__ParseInt(v, 10) end
                    )
                )
                if __TS__ArrayIndexOf(entityComponentIDs, systemComponentTypes[a + 1]) < 0 then
                    if idx >= 0 then
                        if system.exit then
                            self:inject(system)
                            system:exit(entity)
                        end
                        __TS__ArraySplice(self.entitySystems[entity.id], idx, 1)
                        __TS__Delete(self.entitySystemLastUpdate[entity.id], system.id)
                        __TS__Delete(self.entitySystemLastUpdateGame[entity.id], system.id)
                    end
                    return
                end
                a = a + 1
            end
        end
        if idx < 0 then
            local ____self_entitySystems_entity_id_11 = self.entitySystems[entity.id]
            ____self_entitySystems_entity_id_11[#____self_entitySystems_entity_id_11 + 1] = system
            self.entitySystemLastUpdate[entity.id][system.id] = NOW(nil)
            self.entitySystemLastUpdateGame[entity.id][system.id] = self.gameTime
            if system.enter then
                self:inject(system)
                system:enter(entity)
            end
        end
    end
    if systems then
        __TS__ArrayForEach(
            systems,
            function(____, system)
                self:addSystem(system)
            end
        )
    end
end
function ECS.prototype.destroy(self)
    __TS__ArrayForEach(
        self.entities,
        function(____, entity)
            self:removeEntity(entity)
        end
    )
    __TS__ArrayForEach(
        self.systems,
        function(____, system)
            self:removeSystem(system)
        end
    )
end
function ECS.prototype.getEntity(self, id)
    return __TS__ArrayFind(
        self.entities,
        function(____, entity) return entity.id == id end
    )
end
function ECS.prototype.addEntity(self, entity)
    if not entity or __TS__ArrayIndexOf(self.entities, entity) >= 0 then
        return
    end
    local ____self_entities_12 = self.entities
    ____self_entities_12[#____self_entities_12 + 1] = entity
    self.entitySystemLastUpdate[entity.id] = {}
    self.entitySystemLastUpdateGame[entity.id] = {}
    if self.entitySubscription[entity.id] then
        local ____self_13 = self.entitySubscription
        ____self_13[entity.id](____self_13)
    end
    self.entitySubscription[entity.id] = entity:subscribe(function(____, entity, added, removed)
        self:onEntityUpdate(entity, added, removed)
        self:indexEntity(entity)
    end)
    self:indexEntity(entity)
end
function ECS.prototype.removeEntity(self, idOrInstance)
    local entity = idOrInstance
    if type(idOrInstance) == "number" then
        entity = self:getEntity(idOrInstance)
    end
    if not entity then
        return
    end
    local idx = __TS__ArrayIndexOf(self.entities, entity)
    if idx >= 0 then
        __TS__ArraySplice(self.entities, idx, 1)
    end
    if self.entitySubscription[entity.id] then
        local ____self_14 = self.entitySubscription
        ____self_14[entity.id](____self_14)
    end
    local systems = self.entitySystems[entity.id]
    if systems then
        __TS__ArrayForEach(
            systems,
            function(____, system)
                if system.exit then
                    self:inject(system)
                    system:exit(entity)
                end
            end
        )
    end
    __TS__Delete(self.entitySystems, entity.id)
    __TS__Delete(self.entitySystemLastUpdate, entity.id)
    __TS__Delete(self.entitySystemLastUpdateGame, entity.id)
end
function ECS.prototype.addSystem(self, system)
    if not system then
        return
    end
    if __TS__ArrayIndexOf(self.systems, system) >= 0 then
        return
    end
    local ____self_systems_15 = self.systems
    ____self_systems_15[#____self_systems_15 + 1] = system
    __TS__ArrayForEach(
        self.entities,
        function(____, entity)
            self:indexEntity(entity, system)
        end
    )
    __TS__ArrayForEach(
        self.entities,
        function(____, entity)
            if entity.active then
                local systems = self.entitySystems[entity.id]
                if systems and __TS__ArrayIndexOf(systems, system) >= 0 then
                    if system.enter then
                        self:inject(system)
                        system:enter(entity)
                    end
                end
            end
        end
    )
end
function ECS.prototype.removeSystem(self, system)
    if not system then
        return
    end
    local idx = __TS__ArrayIndexOf(self.systems, system)
    if idx >= 0 then
        __TS__ArrayForEach(
            self.entities,
            function(____, entity)
                if entity.active then
                    local systems = self.entitySystems[entity.id]
                    if systems and __TS__ArrayIndexOf(systems, system) >= 0 then
                        if system.exit then
                            self:inject(system)
                            system:exit(entity)
                        end
                    end
                end
            end
        )
        __TS__ArraySplice(self.systems, idx, 1)
        if system.world == self then
            system.world = nil
            system.trigger = nil
        end
        __TS__ArrayForEach(
            self.entities,
            function(____, entity)
                self:indexEntity(entity, system)
            end
        )
    end
end
function ECS.prototype.query(self, componentTypes)
    local index = 0
    local listAll = __TS__ArrayIndexOf(componentTypes, -1) >= 0
    return __TS__New(
        ____exports.Iterator,
        function()
            do
                local l = #self.entities
                while index < l do
                    local entity = self.entities[index + 1]
                    if listAll then
                        return entity
                    end
                    local entityComponentIDs = __TS__ArrayConcat(
                        {-1},
                        __TS__ArrayMap(
                            __TS__ObjectKeys(entity.components),
                            function(____, v) return __TS__ParseInt(v, 10) end
                        )
                    )
                    do
                        local a = 0
                        local j = #componentTypes
                        while a < j do
                            do
                                if __TS__ArrayIndexOf(entityComponentIDs, componentTypes[a + 1]) < 0 then
                                    goto __continue107
                                end
                            end
                            ::__continue107::
                            a = a + 1
                        end
                    end
                    return entity
                end
            end
        end
    )
end
function ECS.prototype.update(self)
    local now = NOW(nil)
    self.gameTime = self.gameTime + (now - self.lastUpdate) * self.timeScale
    self.lastUpdate = now
    local toCallAfterUpdateAll = {}
    __TS__ArrayForEach(
        self.entities,
        function(____, entity)
            if not entity.active then
                return self:removeEntity(entity)
            end
            local systems = self.entitySystems[entity.id]
            if not systems then
                return
            end
            local entityLastUpdates = self.entitySystemLastUpdate[entity.id]
            local entityLastUpdatesGame = self.entitySystemLastUpdateGame[entity.id]
            local elapsed
            local elapsedScaled
            local interval
            __TS__ArrayForEach(
                systems,
                function(____, system)
                    if system.update then
                        self:inject(system)
                        elapsed = now - entityLastUpdates[system.id]
                        elapsedScaled = self.gameTime - entityLastUpdatesGame[system.id]
                        if system.frequence > 0 then
                            interval = system.frequence
                            if elapsed < interval then
                                return
                            end
                            entityLastUpdates[system.id] = now - elapsed % interval
                            entityLastUpdatesGame[system.id] = self.gameTime
                        else
                            entityLastUpdates[system.id] = now
                            entityLastUpdatesGame[system.id] = self.gameTime
                        end
                        local id = "_" .. tostring(system.id)
                        if not toCallAfterUpdateAll[id] then
                            if system.beforeUpdateAll then
                                system:beforeUpdateAll(self.gameTime)
                            end
                            toCallAfterUpdateAll[id] = {system = system, entities = {}}
                        end
                        local ____toCallAfterUpdateAll_id_entities_16 = toCallAfterUpdateAll[id].entities
                        ____toCallAfterUpdateAll_id_entities_16[#____toCallAfterUpdateAll_id_entities_16 + 1] = entity
                        system:update(self.gameTime, elapsedScaled, entity)
                    end
                end
            )
        end
    )
    for attr in pairs(toCallAfterUpdateAll) do
        do
            if not (rawget(toCallAfterUpdateAll, attr) ~= nil) then
                goto __continue120
            end
            local system = toCallAfterUpdateAll[attr].system
            if system.afterUpdateAll then
                self:inject(system)
                system:afterUpdateAll(self.gameTime, toCallAfterUpdateAll[attr].entities)
            end
        end
        ::__continue120::
    end
    toCallAfterUpdateAll = {}
end
function ECS.prototype.inject(self, system)
    system.world = self
    system.trigger = self.systemTrigger
    return system
end
function ECS.prototype.onEntityUpdate(self, entity, added, removed)
    if not self.entitySystems[entity.id] then
        return
    end
    local toNotify = __TS__ArraySlice(self.entitySystems[entity.id], 0)
    do
        local idx = #toNotify - 1
        while idx >= 0 do
            do
                local system = toNotify[idx + 1]
                if system.change then
                    local systemComponentTypes = system.componentTypes
                    if systemComponentTypes:indexOf(-1) >= 0 then
                        goto __continue128
                    end
                    if added and systemComponentTypes:indexOf(added.type) >= 0 then
                        goto __continue128
                    end
                    if removed and systemComponentTypes:indexOf(removed.type) >= 0 then
                        goto __continue128
                    end
                end
                __TS__ArraySplice(toNotify, idx, 1)
            end
            ::__continue128::
            idx = idx - 1
        end
    end
    __TS__ArrayForEach(
        toNotify,
        function(____, system)
            system = self:inject(system)
            local systemComponentTypes = system.componentTypes
            local all = systemComponentTypes:indexOf(-1) >= 0
            system:change(
                entity,
                all and added or (added and systemComponentTypes:indexOf(added.type) >= 0 and added or nil),
                all and removed or (removed and systemComponentTypes:indexOf(removed.type) >= 0 and removed or nil)
            )
        end
    )
end
function ECS.prototype.indexEntity(self, entity, system)
    if not self.entitySystems[entity.id] then
        self.entitySystems[entity.id] = {}
    end
    if system then
        self:indexEntitySystem(entity, system)
    else
        __TS__ArrayForEach(
            self.systems,
            function(____, system)
                self:indexEntitySystem(entity, system)
            end
        )
    end
end
ECS.WorldTime = 0
ECS.System = ____exports.System
ECS.Entity = ____exports.Entity
ECS.Component = ____exports.Component
return ____exports
