PACKAGE = package
--- 获取一个table的正确长度
---@protected
---@param table table
---@return number
table.len = function(table)
    local len = 0
    for _, _ in pairs(table) do
        len = len + 1
    end
    return len
end
--- 打印对象table
---@param showDetail boolean
print_r = function(t, printMethod, showDetail)
    local print_r_cache = {}
    printMethod = printMethod or print
    if (showDetail == nil) then
        showDetail = true
    end
    local function sub_print_r(tt, indent)
        if (print_r_cache[tostring(tt)]) then
            printMethod(indent .. "*" .. tostring(tt))
        else
            print_r_cache[tostring(tt)] = true
            if (type(tt) == "table") then
                for pos, val in pairs(tt) do
                    if (type(pos) == "userdata") then
                        pos = "userdata"
                    end
                    pos = tostring(pos)
                    if (type(val) == "table") then
                        printMethod(indent .. "[" .. pos .. "](" .. table.len(val) .. ") => " .. tostring(tt) .. " {")
                        sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
                        printMethod(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
                    elseif (showDetail == true) then
                        if (type(val) == "string") then
                            printMethod(indent .. "[" .. tostring(pos) .. '] => <string>"' .. val .. '"')
                        else
                            printMethod(indent .. "[" .. tostring(pos) .. "] => " .. "<" .. type(val) .. ">" .. tostring(val))
                        end
                    end
                end
            else
                printMethod(indent .. "<" .. type(tt) .. ">" .. tostring(tt))
            end
        end
    end
    if (type(t) == "table") then
        printMethod(tostring(t) .. "(" .. table.len(t) .. ") {")
        sub_print_r(t, "  ")
        print("}")
    else
        sub_print_r(t, "  ")
    end
    print()
end


--
string.split = __TS__StringSplit
string.indexOf = string.find