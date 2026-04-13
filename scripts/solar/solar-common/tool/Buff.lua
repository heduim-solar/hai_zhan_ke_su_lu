local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__ObjectAssign = ____lualib.__TS__ObjectAssign
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["9"] = 1,["10"] = 1,["11"] = 2,["12"] = 2,["13"] = 3,["14"] = 3,["28"] = 21,["29"] = 26,["30"] = 26,["31"] = 26,["32"] = 66,["33"] = 28,["34"] = 28,["35"] = 28,["36"] = 32,["37"] = 33,["38"] = 34,["39"] = 41,["40"] = 42,["41"] = 45,["42"] = 49,["43"] = 54,["44"] = 55,["45"] = 67,["46"] = 68,["47"] = 69,["48"] = 70,["49"] = 71,["51"] = 73,["52"] = 74,["53"] = 75,["54"] = 77,["55"] = 78,["56"] = 79,["57"] = 79,["58"] = 79,["59"] = 80,["60"] = 79,["61"] = 79,["62"] = 79,["63"] = 82,["64"] = 83,["65"] = 84,["66"] = 84,["67"] = 84,["68"] = 85,["69"] = 84,["70"] = 84,["71"] = 84,["73"] = 90,["74"] = 91,["75"] = 92,["77"] = 94,["78"] = 96,["79"] = 98,["80"] = 99,["82"] = 102,["83"] = 102,["86"] = 103,["87"] = 103,["89"] = 103,["91"] = 105,["92"] = 106,["94"] = 108,["95"] = 66,["96"] = 168,["97"] = 169,["98"] = 168,["99"] = 173,["100"] = 174,["101"] = 173,["102"] = 177,["103"] = 178,["104"] = 177,["105"] = 182,["106"] = 183,["107"] = 182,["108"] = 186,["109"] = 187,["110"] = 186,["111"] = 193,["112"] = 194,["113"] = 193,["114"] = 200,["115"] = 201,["116"] = 200,["117"] = 207,["118"] = 208,["119"] = 207,["120"] = 211,["121"] = 212,["122"] = 211,["123"] = 215,["124"] = 216,["125"] = 215,["126"] = 220,["127"] = 222,["129"] = 223,["130"] = 223,["132"] = 223,["134"] = 225,["135"] = 226,["136"] = 227,["137"] = 228,["138"] = 229,["141"] = 233,["142"] = 234,["144"] = 236,["145"] = 220,["146"] = 239,["147"] = 239,["148"] = 239,["150"] = 240,["151"] = 241,["153"] = 243,["154"] = 239,["155"] = 250,["156"] = 251,["157"] = 251,["158"] = 251,["159"] = 253,["160"] = 254,["161"] = 251,["162"] = 251,["163"] = 250,["164"] = 261,["165"] = 263,["168"] = 266,["169"] = 267,["170"] = 268,["174"] = 273,["175"] = 274,["177"] = 276,["178"] = 277,["180"] = 280,["181"] = 281,["182"] = 282,["184"] = 284,["186"] = 284,["188"] = 285,["189"] = 286,["190"] = 261,["196"] = 112,["198"] = 115,["199"] = 116,["209"] = 120,["211"] = 123,["212"] = 124,["213"] = 125,["215"] = 127,["216"] = 127,["218"] = 127,["220"] = 129,["221"] = 130,["223"] = 132,["233"] = 137,["235"] = 144,["236"] = 145,["237"] = 146,["238"] = 148,["239"] = 149,["240"] = 150,["241"] = 151,["242"] = 151,["243"] = 151,["244"] = 152,["245"] = 151,["246"] = 151,["247"] = 151,["249"] = 156,["250"] = 157,["251"] = 158,["252"] = 159,["253"] = 160,["254"] = 161,["260"] = 293,["261"] = 294,["262"] = 295});
local ____exports = {}
local ____BaseUtil = require("solar.solar-common.util.BaseUtil")
local BaseUtil = ____BaseUtil.default
local ____DataBase = require("solar.solar-common.common.DataBase")
local DataBase = ____DataBase.default
local ____STimer = require("solar.solar-common.tool.STimer")
local STimer = ____STimer.default
--- 一个buff 有buff的BuffType的类型
-- 
-- buff会经过4个生命周期
--    onCreated 创建buff
--    onUpdate buff更新时 默认为每0.1秒调此方法
--    onInterval 间隔到期
--    onDestroy  buff结束销毁时
-- 
--    比如 一个 给敌人施加一个每秒造成10点伤害 持续3秒的buff
--    即 parent = 受到伤害的单位
--    caster = 发出这个buff的来源单位
-- 
--    每1秒会回调 onInterval 方法
local index = 0
____exports.default = __TS__Class()
local Buff = ____exports.default
Buff.name = "Buff"
function Buff.prototype.____constructor(self, buffType, parent, caster, initBuff)
    local ____index_4 = index
    index = ____index_4 + 1
    self.uuid = "sb" .. tostring(____index_4)
    self._intervalMS = 0
    self.durMS = 0
    self.ability = nil
    self._stackCount = 1
    self._sl_last_stackCount = 0
    self.caster = nil
    self._SL_interval = 0
    self.sTimer = nil
    self.lastUpdateTime = time
    self.buffType = buffType
    self.parent = parent
    self.caster = caster
    if buffType.attribute then
        self.attribute = __TS__ObjectAssign({}, buffType.attribute)
    end
    self._intervalMS = math.floor((buffType.interval or 0) * 1000)
    self.durMS = math.floor((buffType.dur or 0) * 1000)
    self.ubertip = buffType.ubertip
    if buffType.interval and buffType.interval > 0 then
        self.sTimer = __TS__New(STimer)
        self.sTimer:start(
            buffType.interval,
            function()
                self:update()
            end,
            true
        )
    elseif buffType.dur and buffType.dur > 0 then
        self.sTimer = __TS__New(STimer)
        self.sTimer:start(
            1,
            function()
                self:update()
            end,
            true
        )
    end
    local solarData = DataBase:getUnitSolarData(parent)
    if not solarData._SL_solarBuffSet then
        solarData._SL_solarBuffSet = {}
    end
    solarData._SL_solarBuffSet[buffType.id] = self
    self:refresh()
    if buffType.targetArt ~= nil and #buffType.targetArt > 1 then
        self._SL_targetattachEffect = AddSpecialEffectTarget(buffType.targetArt, parent, buffType.targetAttach)
    end
    if initBuff ~= nil then
        initBuff(nil, self)
    end
    local ____this_3
    ____this_3 = buffType
    local ____opt_2 = ____this_3.onCreated
    if ____opt_2 ~= nil then
        ____opt_2(____this_3, self)
    end
    for ____, anyBuffCreatedListener in ipairs(____exports.default._sl_anyBuffCreatedListeners) do
        anyBuffCreatedListener(nil, self)
    end
    self.stackCount = 1
end
function Buff.prototype.refresh(self)
    self.creationTime = time
end
function Buff.prototype.getCaster(self)
    return self.caster
end
function Buff.prototype.setCaster(self, value)
    self.caster = value
end
function Buff.prototype.getParent(self)
    return self.parent
end
function Buff.prototype.setParent(self, parent)
    self.parent = parent
end
function Buff.prototype.getCreationTime(self)
    return self.creationTime
end
function Buff.prototype.getDieTime(self)
    return self.creationTime + self.durMS
end
function Buff.prototype.getRemainingTime(self)
    return self.creationTime + self.durMS - time
end
function Buff.prototype.getName(self)
    return self.buffType.name
end
function Buff.prototype.getUbertip(self)
    return self.ubertip
end
function Buff.prototype.update(self)
    local tpf = time - self.lastUpdateTime
    local ____this_6
    ____this_6 = self.buffType
    local ____opt_5 = ____this_6.onUpdate
    if ____opt_5 ~= nil then
        ____opt_5(____this_6, self, tpf)
    end
    self._SL_interval = self._SL_interval + tpf
    if self._intervalMS > 0 and self._SL_interval >= self._intervalMS then
        self._SL_interval = 0
        if self.buffType.onInterval then
            self.buffType:onInterval(self)
        end
    end
    if self.durMS > 0 and self:getRemainingTime() <= 0 then
        self:destroy()
    end
    self.lastUpdateTime = time
end
function Buff.prototype.getAttribute(self, createDefault)
    if createDefault == nil then
        createDefault = false
    end
    if not self.attribute and createDefault then
        self.attribute = {}
    end
    return self.attribute
end
function Buff.prototype.destroyLater(self, timeOut)
    BaseUtil.runLater(
        timeOut,
        function()
            self:update()
            self:destroy()
        end
    )
end
function Buff.prototype.destroy(self)
    if self._sl_isDestroyed then
        return
    end
    if self.buffType.onDestroy then
        local flag = self.buffType:onDestroy(self)
        if flag == false then
            return
        end
    end
    for ____, listener in ipairs(____exports.default._sl_anyBuffDestroyListeners) do
        listener(nil, self)
    end
    if self._SL_targetattachEffect then
        DestroyEffect(self._SL_targetattachEffect)
    end
    local solarData = DataBase:getUnitSolarData(self.parent, false)
    if solarData and solarData._SL_solarBuffSet then
        solarData._SL_solarBuffSet[self.buffType.id] = nil
    end
    local ____opt_9 = self.sTimer
    if ____opt_9 ~= nil then
        ____opt_9:destroy()
    end
    self.solarData = nil
    self._sl_isDestroyed = true
end
__TS__SetDescriptor(
    Buff.prototype,
    "solarData",
    {
        get = function(self)
            return DataBase:getSolarBuffSolarData(self.uuid)
        end,
        set = function(self, obj)
            DataBase:setSolarBuffSolarData(self.uuid, obj)
        end
    },
    true
)
__TS__SetDescriptor(
    Buff.prototype,
    "stackCount",
    {
        get = function(self)
            return self._stackCount
        end,
        set = function(self, value)
            self._stackCount = value
            local stackCountAdd = value - self._sl_last_stackCount
            local ____this_12
            ____this_12 = self.buffType
            local ____opt_11 = ____this_12.onStackCountChange
            if ____opt_11 ~= nil then
                ____opt_11(____this_12, self, stackCountAdd)
            end
            for ____, listener in ipairs(____exports.default._sl_anyBuffStackCountChangeListeners) do
                listener(nil, self, stackCountAdd)
            end
            self._sl_last_stackCount = value
        end
    },
    true
)
__TS__SetDescriptor(
    Buff.prototype,
    "intervalMS",
    {
        get = function(self)
            return self._intervalMS
        end,
        set = function(self, timeMS)
            timeMS = math.floor(timeMS / 10 + 0.5) * 10
            self._intervalMS = timeMS
            if timeMS > 0 then
                if self.sTimer == nil then
                    self.sTimer = __TS__New(STimer)
                    self.sTimer:start(
                        self._intervalMS / 1000,
                        function()
                            self:update()
                        end,
                        true
                    )
                end
                self.sTimer.timeout = self._intervalMS
                self.lastUpdateTime = -self._intervalMS
            elseif self.sTimer then
                log.errorWithTraceBack("buff间隔必须 > 0")
                self.sTimer:destroy()
                self.sTimer = nil
            end
        end
    },
    true
)
Buff._sl_anyBuffCreatedListeners = {}
Buff._sl_anyBuffStackCountChangeListeners = {}
Buff._sl_anyBuffDestroyListeners = {}
return ____exports
