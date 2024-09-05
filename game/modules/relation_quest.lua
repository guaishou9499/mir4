-------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
-- @author:   zengluolu
-- @email:    1819@qq.com
-- @date:     2023-10-15
-- @module:   relation_quest
-- @describe: 测试模块
-- @version:  v1.0
--

-------------------------------------------------------------------------------------
--
local relation_quest = {
    VERSION = '202015.1',
    AUTHOR_NOTE = "-[relation_quest module - 202015.1]-",
    MODULE_NAME = '奇缘模块',
    -- 设置脚本版本
    SCRIPT_UPDATE = 'v1.0.0',
}

-- 自身模块
local this = relation_quest
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
---@type revive_ent
local revive_ent = import('game/entities/revive_ent')
---@type map_res
local map_res = import('game/resources/map_res')
---@type relation_ent
local relation_ent = import('game/entities/relation_ent')
---@type switch_ent
local switch_ent = import('game/entities/switch_ent')


-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
-- 运行前置条件
this.eval_ifs = {
    -- [启用] 游戏状态列表
    yes_game_state = {login_res.STATUS_IN_GAME,login_res.STATUS_LOADING_MAP },
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
        return  switch_ent.switch_relation()
                and not switch_ent.side_task()
                and not switch_ent.mf_fb()
                and not switch_ent.secret_fb()
    end,
    -- [其它] 功能函数条件(可选)
    is_execute = function()
        return true
    end,
}

-- 轮循函数列表
relation_quest.poll_functions = {}

------------------------------------------------------------------------------------
-- 预载函数(重载脚本时)
relation_quest.super_preload = function()

end

-------------------------------------------------------------------------------------
-- 预载处理
relation_quest.preload = function()


end

-------------------------------------------------------------------------------------
-- 轮循功能入口
relation_quest.looping = function()

    revive_ent.revive_player()
end
-------------------------------------------------------------------------------------
-- 功能入口函数
relation_quest.entry = function()
    local ret_b = false

    -- 加载前延迟

    while decider.is_working()
    do
        -- 执行轮循任务
        relation_quest.looping()
        local relation_res_info = relation_ent.quest_list
        for name, v in pairs(relation_res_info) do
            relation_ent.auto_relation(name)
        end
        decider.sleep(100)
    end
    return ret_b
end

-------------------------------------------------------------------------------------
-- 模块超时处理
relation_quest.on_timeout = function()

end



-------------------------------------------------------------------------------------
-- 卸载处理
relation_quest.unload = function()
    --xxmsg('relation_quest.unload')
end

-------------------------------------------------------------------------------------
-- 效验登陆异常
relation_quest.check_login_error = function()

end

-------------------------------------------------------------------------------------
-- 实例化新对象

function relation_quest.__tostring()
    return this.MODULE_NAME
end

relation_quest.__index = relation_quest

function relation_quest:new(args)
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
    return setmetatable(new, relation_quest)
end

-------------------------------------------------------------------------------------
-- 返回对象
return relation_quest:new()

-------------------------------------------------------------------------------------