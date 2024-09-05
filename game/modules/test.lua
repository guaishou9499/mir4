-------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
-- @author:   zengluolu
-- @email:    1819@qq.com
-- @date:     2023-10-15
-- @module:   test
-- @describe: 测试模块
-- @version:  v1.0
--

-------------------------------------------------------------------------------------
--
local test = {
    VERSION = '202015.1',
    AUTHOR_NOTE = "-[test module - 202015.1]-",
    MODULE_NAME = '测试模块',
    -- 设置脚本版本
    SCRIPT_UPDATE = 'v1.0.0',
}

-- 自身模块
local this = test
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
---@type test_ent
local test_ent = import('game/entities/test_ent')

---@type equip_ent
local equip_ent = import('game/entities/equip_ent')
local example = import('example/example')
---@type skill_ent
local skill_ent = import('game/entities/skill_ent')
---@type hunt_ent
local hunt_ent = import('game/entities/hunt_ent')
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
---@type gather_ent
local gather_ent = import('game/entities/gather_ent')
---@type actor_res
local actor_res = import('game/resources/actor_res')
---@type switch_ent
local switch_ent = import('game/entities/switch_ent')



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
test.poll_functions = {}

------------------------------------------------------------------------------------
-- 预载函数(重载脚本时)
test.super_preload = function()

end

-------------------------------------------------------------------------------------
-- 预载处理
test.preload = function()


end

-------------------------------------------------------------------------------------
-- 轮循功能入口
test.looping = function()


end

-------------------------------------------------------------------------------------
-- 功能入口函数
test.entry = function()
    local ret_b = false

    -- 加载前延迟

    while decider.is_working()
    do
        -- 执行轮循任务
        test.looping()
        local str = string.format('{ map_id = %s, map_name = \'%s\', pos = { x = %s, y = %s, z = %s } },', actor_unit.map_id(), actor_unit.map_name(), local_player:cx(), local_player:cy(), local_player:cz())
        xxmsg(str)
      --  equip_ent.build_equip_2('迷离弓')
      --  example:test_skill_unit()
        decider.sleep(100)


        return
    end
    return ret_b
end

-------------------------------------------------------------------------------------
-- 模块超时处理
test.on_timeout = function()

end



-------------------------------------------------------------------------------------
-- 卸载处理
test.unload = function()
    --xxmsg('test.unload')
end

-------------------------------------------------------------------------------------
-- 效验登陆异常
test.check_login_error = function()

end

-------------------------------------------------------------------------------------
-- 实例化新对象

function test.__tostring()
    return this.MODULE_NAME
end

test.__index = test

function test:new(args)
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
    return setmetatable(new, test)
end

-------------------------------------------------------------------------------------
-- 返回对象
return test:new()

-------------------------------------------------------------------------------------