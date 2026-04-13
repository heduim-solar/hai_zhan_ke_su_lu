local ____lualib = require("lualib_bundle")
local __TS__Class = ____lualib.__TS__Class
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["6"] = 1,["7"] = 1,["8"] = 2,["9"] = 2,["10"] = 4,["11"] = 4,["12"] = 4,["14"] = 4,["15"] = 11,["16"] = 13,["17"] = 13,["18"] = 13,["19"] = 14,["20"] = 15,["23"] = 19,["24"] = 20,["25"] = 20,["26"] = 20,["27"] = 20,["28"] = 21,["29"] = 20,["30"] = 20,["31"] = 23,["32"] = 24,["34"] = 25,["35"] = 25,["36"] = 26,["37"] = 26,["38"] = 26,["39"] = 26,["40"] = 27,["41"] = 25,["44"] = 29,["45"] = 30,["46"] = 30,["47"] = 30,["48"] = 30,["49"] = 32,["50"] = 32,["51"] = 32,["52"] = 32,["53"] = 32,["54"] = 32,["55"] = 32,["56"] = 33,["57"] = 34,["58"] = 35,["59"] = 36,["60"] = 37,["61"] = 38,["62"] = 13,["63"] = 13,["64"] = 11});
local ____exports = {}
local ____FramePoint = require("solar.solar-common.constant.FramePoint")
local FramePoint = ____FramePoint.default
local ____SingletonUtil = require("solar.solar-common.util.lang.SingletonUtil")
local SingletonUtil = ____SingletonUtil.default
____exports.default = __TS__Class()
local ModelFrameUtil = ____exports.default
ModelFrameUtil.name = "ModelFrameUtil"
function ModelFrameUtil.prototype.____constructor(self)
end
function ModelFrameUtil.initModel2BackDrop(self)
    SingletonUtil:executeOnce(
        "_sl_:ModelFrameUtil:initModel2BackDrop",
        function()
            if not isEmbedJapi then
                print("非内置环境不能加载model2黑底背景!")
                return
            end
            local modelByteDatas = "4d444c585645525304{6}2003{4}4d4f444c7401{4}4a75737420416e6f74686572204d6f64656c{644}4d79643dafdd0bbdc89a2cbd{8}b8c4193dec61023d{8}96{6}5345515384{6}5374616e64{150}4d01{4}3505{36}4d79643dafdd0bbdc89a2cbd{8}b8c4193dec61023d{8}4d544c533{7}3{7}e703{5}1{6}4c41595301{6}1c{14}71{14}ffffffff{12}803f544558530c01{12}54657874757265735c426c61636b33322e626c7{489}47454f533c01{4}3c01{4}5652545804{6}9a9999b1cdccccb{5}fac3aca32a3d{12}fac3ada32a3d6488633d{4}fac310281bb06488633d{4}fac34e524d5304{26}803f{20}803f{20}803f{20}803f5054595001{7}4{6}50434e5401{7}6{6}5056545806{7}3{7}100030001000200474e445804{14}4d54474301{7}1{6}4d41545301{38}76348e3d9a9999b1cdccccb{5}fac3ada32a3d6488633d{4}fac301{6}76348e3d9a9999b1cdccccb{5}fac3ada32a3d6488633d{4}fac35556415301{6}5556425304{18}803f{12}803f{12}803f{12}803f424f4e4568{6}6{7}44656661756c7420426f6e65{144}ffffffff0001{12}ffffffff504956540c{30}"
            local temp = string.gsub(
                modelByteDatas,
                "%{(%d+)%}",
                function(len)
                    return string.rep("0", len)
                end
            )
            modelByteDatas = temp
            local s = {}
            do
                local i = 1
                while i <= #modelByteDatas do
                    local byte = string.format(
                        "%d",
                        "0x" .. string.sub(modelByteDatas, i, i + 1)
                    )
                    s[#s + 1] = string.char(byte)
                    i = i + 2
                end
            end
            local storm = require("jass.storm")
            storm.save(
                "ui\\_model_back.mdx",
                table.concat(s)
            )
            local frame = DzCreateFrameByTagName(
                "SPRITE",
                "_sl_ModelFrameUtil_initModel2BackDrop",
                FrameGetParent(DzFrameGetPortrait()),
                "",
                0
            )
            DzFrameSetModel(frame, "ui\\_model_back.mdx", 0, 0)
            DzFrameSetAbsolutePoint(frame, FramePoint.bottomLeft, 0, 0)
            DzFrameSetSize(frame, 0.8, 0.6)
            FrameSetModelScale(frame, 20, 10.8, 1)
            FrameSetAlpha(frame, 4)
            print("加载model2黑底背景!")
        end
    )
end
return ____exports
