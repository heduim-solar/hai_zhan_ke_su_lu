-- 此lua脚本为太阳引导程序 即第一个被执行的lua
package.path = "scripts\\?.lua;lua\\?.lua;" .. package.path
-- 环境初始化
-- require("jass.runtime").sleep = true

-- require("jass.runtime").console = true
-- require("base")

--local cj = require("jass.common")
--cj.DisplayTimedTextToPlayer(cj.Player(0),0,0,60,"solar_boot!")

-- 获取环境信息
local bj_questSecretSound = require("jass.globals").bj_questSecretSound
local isInitBlizzard = bj_questSecretSound ~= nil and bj_questSecretSound ~= 0;

-- 初始化脚本环境
local GlobalVars = require("solar.solar-wc3.common.GlobalVars").default
local ErrorMsgHelper = require("solar.solar-common.common.ErrorMsgHelper").default

-- 加载APP
if isInitBlizzard then
    GlobalVars:initOnMain()

    xpcall(function()
        require 'App'
    end, ErrorMsgHelper.error_handle)

    -- 延迟执行 以显示完整的报错信息 (当地图加载就报错的时候可使用此方法获得完整报错堆栈信息)
    --local cj = require("jass.common")
    --cj.TimerStart(cj.CreateTimer(),0.01,false,function()
    --    require 'App'
    --end)
else
    pcall(function()
        require("solar.solar-wc3.browser.EmbedBrowser")
        require "LoadingCallback"
    end)
    --
    local code = require("jass.code")
    local old_main = code.main
    code.main = function()
        old_main()
        GlobalVars:initOnMain()
        require("App")
    end
end



