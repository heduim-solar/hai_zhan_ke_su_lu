local ____lualib = require("lualib_bundle")
local __TS__SourceMapTraceBack = ____lualib.__TS__SourceMapTraceBack
__TS__SourceMapTraceBack(debug.getinfo(1).short_src, {["5"] = 3,["6"] = 3,["7"] = 4,["8"] = 4,["9"] = 53,["10"] = 54,["11"] = 54,["12"] = 54,["13"] = 54,["14"] = 54,["15"] = 54,["16"] = 54,["17"] = 54,["18"] = 54,["19"] = 54,["20"] = 53,["21"] = 67,["22"] = 71,["23"] = 73,["24"] = 74,["25"] = 75,["28"] = 78,["29"] = 78});
local ____exports = {}
local ____ActorTypeUtil = require("solar.solar-common.actor.util.ActorTypeUtil")
local ActorTypeUtil = ____ActorTypeUtil.default
local _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730 = require("state.unit.右键移动时闪现到目的地")
local _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730 = _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730.default
____exports.data = {{
    id = "宝宝助手",
    class = "宝宝助手",
    templateType = "宝宝助手",
    name = "|cffff0000宝宝助手",
    icon = "ReplaceableTextures\\CommandButtons\\BTNRavenForm.blp",
    ["#<%1%>#"] = "右键移动时闪现到目的地.cfg.push(\"宝宝助手\");",
    model = "units\\critters\\Vulture\\Vulture.mdx",
    moveSpeed = 522,
    moveType = "fly",
    flyHeight = 150
}}
____exports["d_基础宝宝助手"] = ____exports.data
function ____exports.default(self)
    for ____, datum in ipairs(____exports.data) do
        if datum.id then
            ActorTypeUtil:registerActorType(datum)
        end
    end
    local ____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730_cfg_0 = _____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730.cfg
    ____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730_cfg_0[#____53F3_952E_79FB_52A8_65F6_95EA_73B0_5230_76EE_7684_5730_cfg_0 + 1] = "宝宝助手"
end
return ____exports
