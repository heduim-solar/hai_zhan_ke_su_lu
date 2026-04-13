local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 3,["9"] = 3,["10"] = 3,["12"] = 3,["13"] = 13,["14"] = 13,["15"] = 13,["17"] = 14,["18"] = 14,["19"] = 14,["20"] = 15,["21"] = 15,["23"] = 15,["24"] = 15,["26"] = 15,["27"] = 14,["28"] = 14,["29"] = 13,["30"] = 24,["31"] = 25,["33"] = 26,["34"] = 26,["35"] = 27,["36"] = 28,["37"] = 29,["38"] = 30,["40"] = 26,["44"] = 24,["45"] = 41,["46"] = 42,["47"] = 41,["48"] = 49,["49"] = 50,["50"] = 49,["51"] = 4,["52"] = 6});
local ____exports = {}
local ____ListFileUtil = require("solar.solar-common.util.game.ListFileUtil")
local ListFileUtil = ____ListFileUtil.default
____exports.default = __TS__Class()
local XlsxDataUtil = ____exports.default
XlsxDataUtil.name = "XlsxDataUtil"
function XlsxDataUtil.prototype.____constructor(self)
end
function XlsxDataUtil.registerDataByXlsxDir(self, xlsxDirPath)
    if xlsxDirPath == nil then
        xlsxDirPath = "scripts\\xlsx"
    end
    ListFileUtil:requireDir(
        xlsxDirPath,
        function(____, luaPath, requireResult)
            local ____exports_default_3 = ____exports.default
            local ____exports_default_registerData_4 = ____exports.default.registerData
            local ____opt_result_2
            if requireResult ~= nil then
                ____opt_result_2 = requireResult.data
            end
            ____exports_default_registerData_4(____exports_default_3, ____opt_result_2)
        end
    )
end
function XlsxDataUtil.registerData(self, data)
    if data then
        do
            local i = 0
            while i < #data do
                local datum = data[i + 1]
                if datum and datum.id then
                    ____exports.default.idObjMap[datum.id] = datum
                    ____exports.default.idIndexMap[datum.id] = i
                end
                i = i + 1
            end
        end
    end
end
function XlsxDataUtil.getDataById(self, id)
    return ____exports.default.idObjMap[id]
end
function XlsxDataUtil.getDataIndexById(self, id)
    return ____exports.default.idIndexMap[id]
end
XlsxDataUtil.idObjMap = {}
XlsxDataUtil.idIndexMap = {}
return ____exports
