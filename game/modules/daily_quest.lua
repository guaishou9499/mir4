-------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
-- @author:   zengluolu
-- @email:    1819@qq.com
-- @date:     2023-10-15
-- @module:   daily_quest
-- @describe: 测试模块
-- @version:  v1.0
--

-------------------------------------------------------------------------------------
--
local daily_quest = {
    VERSION = '202015.1',
    AUTHOR_NOTE = "-[daily_quest module - 202015.1]-",
    MODULE_NAME = '重复任务',
    -- 设置脚本版本
    SCRIPT_UPDATE = 'v1.0.0',
}

-- 自身模块
local this = daily_quest
-- 配置模块
local settings = settings
-- 日志模块
local trace = trace
local common = common
-- 决策模块
local decider = decider
-- 优化列表
local game_unit = game_unit
local main_ctx = main_ctx
local login_unit = login_unit
local setmetatable = setmetatable
local pairs = pairs
local import = import
---@type login_res
local login_res = import('game/resources/login_res')
---@type transfer_ent
local transfer_ent = import('game/entities/transfer_ent')
---@type daily_quest_ent
local daily_quest_ent = import('game/entities/daily_quest_ent')

---@type equip_ent
local equip_ent = import('game/entities/equip_ent')
local example = import('example/example')
---@type skill_ent
local skill_ent = import('game/entities/skill_ent')
---@type shop_ent
local shop_ent = import('game/entities/shop_ent')
---@type training_ent
local training_ent = import('game/entities/training_ent')
---@type item_res
local item_res = import('game/resources/item_res')
---@type item_ent
local item_ent = import('game/entities/item_ent')
---@type map_ent
local map_ent = import('game/entities/map_ent')
---@type quest_ent
local quest_ent = import('game/entities/quest_ent')
---@type map_res
local map_res = import('game/resources/map_res')
---@type pet_ent
local pet_ent = import('game/entities/pet_ent')
---@type mail_ent
local mail_ent = import('game/entities/mail_ent')
---@type weiye_ent
local weiye_ent = import('game/entities/weiye_ent')
---@type quest_res
local quest_res = import('game/resources/quest_res')


-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
-- 运行前置条件
this.eval_ifs = {
    -- [启用] 游戏状态列表
    yes_game_state = { },
    -- [禁用] 游戏状态列表
    not_game_state = {  },
    -- [启用] 配置开关列表
    yes_config = {  },
    -- [禁用] 配置开关列表
    not_config = {},
    -- [时间] 模块超时设置(可选)
    time_out = 0,
    -- [其它] 特殊情况才用(可选)
    is_working = function()
        return true
    end,
    -- [其它] 功能函数条件(可选)
    is_execute = function()
        return true
    end,
}

-- 轮循函数列表
daily_quest.poll_functions = {}

------------------------------------------------------------------------------------
-- 预载函数(重载脚本时)
daily_quest.super_preload = function()

end

-------------------------------------------------------------------------------------
-- 预载处理
daily_quest.preload = function()


end

-------------------------------------------------------------------------------------
-- 轮循功能入口
daily_quest.looping = function()


end

-------------------------------------------------------------------------------------
-- 功能入口函数
daily_quest.entry = function()
    local ret_b = false

    -- 加载前延迟

    while decider.is_working()
    do
        -- 执行轮循任务
        daily_quest.looping()

        decider.sleep(1000)
    end
    return ret_b
end

-------------------------------------------------------------------------------------
-- 模块超时处理
daily_quest.on_timeout = function()

end



-------------------------------------------------------------------------------------
-- 卸载处理
daily_quest.unload = function()
    --xxmsg('daily_quest.unload')
end

-------------------------------------------------------------------------------------
-- 效验登陆异常
daily_quest.check_login_error = function()

end

-------------------------------------------------------------------------------------
-- 实例化新对象

function daily_quest.__tostring()
    return this.MODULE_NAME
end

daily_quest.__index = daily_quest

function daily_quest:new(args)
    local new = { }

    -- 预载函数(重载脚本时)
    if this.super_preload then
        this.super_preload()
    end

    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end

    -- 设置元表
    return setmetatable(new, daily_quest)
end

-------------------------------------------------------------------------------------
-- 返回对象
return daily_quest:new()

-------------------------------------------------------------------------------------