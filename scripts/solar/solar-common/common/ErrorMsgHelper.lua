local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__StringReplace = ____lualib.__TS__StringReplace
local __TS__StringSplit = ____lualib.__TS__StringSplit
local __TS__New = ____lualib.__TS__New
local __TS__SetDescriptor = ____lualib.__TS__SetDescriptor
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["10"] = 1,["11"] = 1,["12"] = 1,["13"] = 31,["14"] = 28,["15"] = 32,["16"] = 33,["17"] = 34,["18"] = 35,["19"] = 36,["20"] = 37,["22"] = 39,["23"] = 40,["25"] = 42,["26"] = 31,["27"] = 6,["28"] = 7,["29"] = 8,["31"] = 10,["33"] = 11,["34"] = 11,["35"] = 12,["36"] = 12,["37"] = 12,["38"] = 12,["39"] = 12,["40"] = 12,["41"] = 11,["44"] = 14,["45"] = 14,["46"] = 14,["47"] = 15,["48"] = 16,["50"] = 18,["51"] = 18,["52"] = 18,["53"] = 18,["54"] = 18,["55"] = 18,["56"] = 18,["58"] = 14,["59"] = 14,["60"] = 21,["61"] = 6,["62"] = 45,["63"] = 46,["64"] = 47,["65"] = 48,["67"] = 50,["68"] = 51,["69"] = 52,["70"] = 53,["71"] = 54,["72"] = 55,["74"] = 57,["75"] = 58,["76"] = 59,["77"] = 60,["78"] = 61,["79"] = 62,["80"] = 63,["81"] = 64,["82"] = 65,["83"] = 66,["84"] = 67,["85"] = 68,["86"] = 69,["87"] = 70,["88"] = 71,["89"] = 72,["90"] = 73,["91"] = 74,["92"] = 75,["93"] = 76,["94"] = 77,["95"] = 78,["96"] = 79,["97"] = 80,["98"] = 81,["99"] = 82,["100"] = 83,["101"] = 84,["102"] = 85,["103"] = 86,["104"] = 87,["105"] = 88,["106"] = 89,["107"] = 90,["108"] = 91,["109"] = 92,["110"] = 93,["111"] = 94,["112"] = 95,["113"] = 96,["114"] = 97,["115"] = 98,["116"] = 99,["117"] = 100,["118"] = 101,["119"] = 102,["120"] = 103,["121"] = 104,["122"] = 105,["123"] = 106,["124"] = 107,["125"] = 108,["126"] = 109,["127"] = 110,["129"] = 112,["130"] = 113,["131"] = 114,["132"] = 115,["133"] = 116,["134"] = 117,["135"] = 118,["136"] = 119,["137"] = 120,["139"] = 122,["140"] = 123,["142"] = 125,["143"] = 45,["144"] = 129,["145"] = 130,["146"] = 131,["147"] = 132,["149"] = 134,["150"] = 135,["151"] = 136,["153"] = 137,["154"] = 144,["156"] = 146,["157"] = 147,["158"] = 148,["159"] = 149,["160"] = 150,["161"] = 151,["162"] = 152,["163"] = 153,["164"] = 158,["168"] = 160,["169"] = 161,["170"] = 129,["171"] = 177,["172"] = 178,["173"] = 178,["174"] = 178,["175"] = 178,["176"] = 178,["177"] = 179,["178"] = 177,["179"] = 182,["180"] = 182,["181"] = 182,["183"] = 183,["184"] = 184,["185"] = 186,["186"] = 187,["187"] = 188,["188"] = 189,["189"] = 190,["191"] = 192,["192"] = 193,["194"] = 197,["195"] = 198,["196"] = 199,["197"] = 200,["198"] = 201,["199"] = 202,["201"] = 204,["202"] = 205,["203"] = 206,["205"] = 210,["206"] = 211,["207"] = 211,["208"] = 211,["209"] = 211,["210"] = 211,["211"] = 211,["212"] = 211,["213"] = 212,["214"] = 212,["215"] = 212,["216"] = 212,["217"] = 212,["218"] = 212,["219"] = 212,["220"] = 213,["221"] = 214,["222"] = 215,["223"] = 216,["224"] = 216,["225"] = 216,["226"] = 216,["227"] = 216,["228"] = 216,["229"] = 216,["232"] = 219,["233"] = 220,["234"] = 220,["235"] = 220,["236"] = 220,["237"] = 220,["238"] = 220,["239"] = 220,["240"] = 221,["241"] = 221,["242"] = 221,["243"] = 221,["244"] = 221,["245"] = 221,["246"] = 221,["250"] = 225,["251"] = 225,["253"] = 225,["255"] = 182,["256"] = 2,["261"] = 166,["269"] = 170,["277"] = 174});
local ____exports = {}
____exports.default = __TS__Class()
local ErrorMsgHelper = ____exports.default
ErrorMsgHelper.name = "ErrorMsgHelper"
function ErrorMsgHelper.prototype.____constructor(self, msg, traceback)
    self._repairSuggestions = ""
    ____exports.default:init0()
    self._msg = tostring(msg)
    self._traceback = tostring(traceback)
    if isDebug then
        self.cnMsg = self:translateMsg()
        self.cnTraceback = self:translateTraceback()
    else
        self.cnMsg = self._msg
        self.cnTraceback = self._traceback
    end
    ____exports.default.lastError = self
end
function ErrorMsgHelper.init0(self)
    if not isDebug or ____exports.default.justInvoke then
        return true
    end
    local trigger = CreateTrigger()
    do
        local i = 0
        while i < bj_MAX_PLAYER_SLOTS do
            TriggerRegisterPlayerChatEvent(
                trigger,
                Player(i),
                "se",
                true
            )
            i = i + 1
        end
    end
    TriggerAddAction(
        trigger,
        function()
            if ____exports.default.lastError then
                ____exports.default.printErrorMsgHelper(____exports.default.lastError, false)
            else
                DisplayTimedTextToPlayer(
                    GetLocalPlayer(),
                    0,
                    0,
                    60,
                    "没有最近的错误消息！"
                )
            end
        end
    )
    return true
end
function ErrorMsgHelper.prototype.translateMsg(self)
    local newMsg = tostring(self._msg)
    if not newMsg or not #newMsg or #newMsg == 0 then
        return newMsg
    end
    local cn = nil
    local onlyCn = false
    if (string.find(newMsg, "invalid key to 'next'", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "invalid key to 'next'", "'next'键无效")
        self._repairSuggestions = "请检查是否存在对象遍历中先进行置空操作，再进行了增加新元素的操作！"
        onlyCn = true
    end
    if (string.find(newMsg, "attempt to index a number value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to index a number value", "不能从数字类型获取属性")
        self._repairSuggestions = "请检查变量读取正确或存入了正确的值！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to index a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to index a nil value", "不能从空值中获取属性")
        self._repairSuggestions = "请在获取属性前加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to call a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to call a nil value", "不能调用空值函数")
        self._repairSuggestions = "请在要调用的函数前加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to compare number with nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to compare number with nil", "不能用空值与数字比较大小")
        self._repairSuggestions = "请在判断中加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to compare table with nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to compare table with nil", "不能用空值与对象比较大小")
        self._repairSuggestions = "请检查判断中的值是否为数字！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to compare nil with number", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to compare nil with number", "不能用空值与数字比较大小")
        self._repairSuggestions = "请在判断中加上对空值判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to concatenate a nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to concatenate a nil", "不能连接一个空值")
        self._repairSuggestions = "请在使用的变量前加上对空值的判断！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform arithmetic on a nil value", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform arithmetic on a nil value", "不能对空值进行算术运算")
        self._repairSuggestions = "请在算术运算前面加上对空值或赋予初始值进行运算！"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform 'n%0'", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform 'n%0'", "不能对0取余数")
        self._repairSuggestions = "请修改余数不能为0"
        onlyCn = true
    elseif (string.find(newMsg, "Call jass function crash.", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "Call jass function crash.", "调用底层Jass函数异常")
        self._repairSuggestions = "请检查函数的所有参数是否正确！(如参数是否为空值、是否存在此物编、数值是否超过最大边界、参数类型是否正确)"
        onlyCn = true
    elseif (string.find(newMsg, "table index is nil", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "table index is nil", "访问表的索引是空")
        self._repairSuggestions = "请检查访问表的索引"
        onlyCn = true
    elseif (string.find(newMsg, "stack overflow", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "stack overflow", "栈溢出")
        self._repairSuggestions = "请检查访问表的索引"
        onlyCn = true
    elseif (string.find(newMsg, "attempt to perform", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "attempt to perform", "不能执行")
        self._repairSuggestions = "请检查算法是否存在0或null！请赋值初始值！"
    elseif (string.find(newMsg, "(data string too short)", nil, true) or 0) - 1 >= 0 then
        cn = __TS__StringReplace(newMsg, "(data string too short)", "字符串数据长度太短")
        self._repairSuggestions = "请检查字符串数据是否为空值或长度过短"
    end
    if cn and #cn and #cn > 0 then
        cn = __TS__StringReplace(cn, " (local ", " (局部变量 ")
        cn = __TS__StringReplace(cn, " (field ", " (属性 ")
        cn = __TS__StringReplace(cn, " (global ", " (全局变量 ")
        cn = __TS__StringReplace(cn, "bad argument", "参数错误")
        cn = __TS__StringReplace(cn, " (value expected)", " (允许值)")
        cn = __TS__StringReplace(cn, "bad argument #", "错误的参数 #")
        cn = __TS__StringReplace(cn, "<unknown>", "<未知>")
        newMsg = (newMsg .. "\r\n") .. cn
    end
    if onlyCn then
        return cn
    end
    return newMsg
end
function ErrorMsgHelper.prototype.translateTraceback(self)
    local newMsg = self.traceback
    if not newMsg or not #newMsg or #newMsg == 0 then
        return newMsg
    end
    local strings = __TS__StringSplit(newMsg, "\n")
    local cnMsg = ""
    for ____, line in ipairs(strings) do
        do
            if (string.find(line, "solar\\common\\", nil, true) or 0) - 1 >= 0 or (string.find(line, "lualib_bundle.lua:", nil, true) or 0) - 1 >= 0 or (string.find(line, "solar\\", nil, true) or 0) - 1 >= 0 or (string.find(line, "\\_sl_egp\\", nil, true) or 0) - 1 >= 0 or (string.find(line, "[C]:", nil, true) or 0) - 1 >= 0 or (string.find(line, "[string \"fix_closure\"]:", nil, true) or 0) - 1 >= 0 then
                goto __continue33
            end
            line = __TS__StringReplace(line, "[C]: in upvalue ", "在上值底层C代码: ")
            line = __TS__StringReplace(line, " in ", " 在 ")
            line = __TS__StringReplace(line, " local ", " 局部变量 ")
            line = __TS__StringReplace(line, " global ", " 全局变量 ")
            line = __TS__StringReplace(line, " method ", " 方法 ")
            line = __TS__StringReplace(line, " function ", " 函数 ")
            line = __TS__StringReplace(line, " upvalue ", " 上值 ")
            line = __TS__StringReplace(line, "(...tail calls...)", "(...尾调用...)")
            cnMsg = (cnMsg .. line) .. "\r\n"
        end
        ::__continue33::
    end
    cnMsg = __TS__StringReplace(cnMsg, "stack traceback:", "函数堆栈:")
    return cnMsg
end
function ErrorMsgHelper.error_handle(msg)
    local errorMsgHelper = __TS__New(
        ____exports.default,
        msg,
        debug.traceback()
    )
    ____exports.default.printErrorMsgHelper(errorMsgHelper)
end
function ErrorMsgHelper.printErrorMsgHelper(errorMsgHelper, translate)
    if translate == nil then
        translate = true
    end
    local title = "------------------太阳RPG异常报告S---------------------"
    local ____end = "------------------太阳RPG异常报告E---------------------"
    local newMsg
    local tb
    if translate then
        newMsg = errorMsgHelper.cnMsg
        tb = errorMsgHelper.cnTraceback
    else
        newMsg = errorMsgHelper.msg
        tb = errorMsgHelper.traceback
    end
    print(title)
    print(newMsg .. "\n")
    print(tb)
    if translate then
        local baseTb = "\n\n-------------------原始堆栈--------------------\n\n" .. errorMsgHelper.traceback
        print(baseTb)
    end
    print(____end)
    if #errorMsgHelper.repairSuggestions > 0 then
        print(errorMsgHelper.repairSuggestions)
    end
    if DisplayTimedTextToPlayer then
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            title
        )
        DisplayTimedTextToPlayer(
            GetLocalPlayer(),
            0,
            0,
            60,
            newMsg
        )
        local tbLines = __TS__StringSplit(tb, "\n")
        for ____, dz in ipairs(tbLines) do
            if dz and #dz > 0 then
                DisplayTimedTextToPlayer(
                    GetLocalPlayer(),
                    0,
                    0,
                    60,
                    dz
                )
            end
        end
        if #errorMsgHelper.repairSuggestions > 0 then
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                ____end
            )
            DisplayTimedTextToPlayer(
                GetLocalPlayer(),
                0,
                0,
                60,
                errorMsgHelper.repairSuggestions
            )
        end
    end
    local ____this_1
    ____this_1 = ____exports.default
    local ____opt_0 = ____this_1.onError
    if ____opt_0 ~= nil then
        ____opt_0(____this_1, errorMsgHelper)
    end
end
ErrorMsgHelper.justInvoke = false
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "msg",
    {get = function(self)
        return self._msg
    end},
    true
)
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "traceback",
    {get = function(self)
        return self._traceback
    end},
    true
)
__TS__SetDescriptor(
    ErrorMsgHelper.prototype,
    "repairSuggestions",
    {get = function(self)
        return self._repairSuggestions
    end},
    true
)
return ____exports
