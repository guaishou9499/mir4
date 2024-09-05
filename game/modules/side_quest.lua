-------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
-- @author:   zengluolu
-- @email:    1819@qq.com
-- @date:     2023-10-15
-- @module:   side_quest
-- @describe: 测试模块
-- @version:  v1.0
--

-------------------------------------------------------------------------------------
--
local side_quest = {
    VERSION = '202015.1',
    AUTHOR_NOTE = "-[side_quest module - 202015.1]-",
    MODULE_NAME = '支线模块',
    -- 设置脚本版本
    SCRIPT_UPDATE = 'v1.0.0',
}

-- 自身模块
local this = side_quest
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
local quest_unit = quest_unit
local local_player = local_player
local setmetatable = setmetatable
local pairs = pairs
local import = import
---@type login_res
local login_res = import('game/resources/login_res')
---@type transfer_ent
local transfer_ent = import('game/entities/transfer_ent')
---@type side_quest_ent
local side_quest_ent = import('game/entities/side_quest_ent')

---@type equip_ent
local equip_ent = import('game/entities/equip_ent')
local example = import('example/example')
---@type skill_ent
local skill_ent = import('game/entities/skill_ent')
---@type quest_ent
local quest_ent = import('game/entities/quest_ent')
---@type training_ent
local training_ent = import('game/entities/training_ent')
---@type item_res
local item_res = import('game/resources/item_res')
---@type item_ent
local item_ent = import('game/entities/item_ent')
---@type gift_ent
local gift_ent = import('game/entities/gift_ent')
---@type stone_ent
local stone_ent = import('game/entities/stone_ent')
---@type quest_res
local quest_res = import('game/resources/quest_res')
---@type pet_ent
local pet_ent = import('game/entities/pet_ent')
---@type mail_ent
local mail_ent = import('game/entities/mail_ent')
---@type shop_ent
local shop_ent = import('game/entities/shop_ent')
---@type weiye_ent
local weiye_ent = import('game/entities/weiye_ent')
---@type switch_ent
local switch_ent = import('game/entities/switch_ent')
---@type revive_ent
local revive_ent = import('game/entities/revive_ent')
---@type map_ent
local map_ent = import('game/entities/map_ent')

-------------------------------------------------------------------------------------

-------------------------------------------------------------------------------------
-- 运行前置条件
this.eval_ifs = {
    -- [启用] 游戏状态列表
    yes_game_state = { login_res.STATUS_IN_GAME, login_res.STATUS_LOADING_MAP },
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
        return switch_ent.side_task()
                and not switch_ent.mf_fb()
                and not switch_ent.secret_fb()
    end,
    -- [其它] 功能函数条件(可选)
    is_execute = function()
        return true
    end,
}

-- 轮循函数列表
side_quest.poll_functions = {}

------------------------------------------------------------------------------------
-- 预载函数(重载脚本时)
side_quest.super_preload = function()

end

-------------------------------------------------------------------------------------
-- 预载处理
side_quest.preload = function()


end

-------------------------------------------------------------------------------------
-- 轮循功能入口
side_quest.looping = function()
    if not game_unit.is_sleep_mode() then
        -- 内功
        training_ent.wi_auto_training()
        -- 魔石
        stone_ent.wi_set_magic_stone()
        -- 技能
        skill_ent.wi_auto_skill()
        -- 宠物
        pet_ent.wi_auto_pet()
        -- 邮件
        mail_ent.wi_get_mail()
        -- 封印
        item_ent.wi_use_unsealing_box()
        -- 时装
        item_ent.wi_use_fashion_item()
        -- 出售
        item_ent.wi_sell_item()
        -- 使用
        item_ent.wi_auto_use_item()
        -- 召唤券
        item_ent.wi_use_zhaohuan_item()
        -- 课题
        gift_ent.wi_daily_work()
        -- 签到
        gift_ent.wi_sign()
        -- 成就
        gift_ent.wi_achievement()
        -- 装备
        equip_ent.wi_auto_equip()
        -- 伟业
        weiye_ent.wi_auto_great()
    end

    shop_ent.wi_auto_buy_item()
    item_ent.wi_set_quick_slot()
    revive_ent.revive_player()
    map_ent.escape_for_recovery()
end
-------------------------------------------------------------------------------------
-- 功能入口函数
side_quest.entry = function()
    local ret_b = false

    -- 加载前延迟

    -- local side_quest_name_list = quest_res.get_side_name_list()

    while decider.is_working()
    do
        if local_player:status() ~= 14 and local_player:auto_type() ~= 2 then
            if game_unit.is_sleep_mode() then
                game_unit.leave_sleep_mode()
                decider.sleep(1000)
            end
        end

        -- 执行轮循任务
        side_quest.looping()



        -- 清理当前任务
        quest_ent.new_clean_task()
        -- 接支线任务
        quest_ent.new_acc_task()
        -- 接委托
        quest_ent.new_acc_entrust_task()
        -- 做支线任务
        quest_ent.new_do_task()
        --    quest_ent.do_side_task(side_quest_name_list)
        decider.sleep(100)

    end
    return ret_b
end

-------------------------------------------------------------------------------------
-- 模块超时处理
side_quest.on_timeout = function()

end



-------------------------------------------------------------------------------------
-- 卸载处理
side_quest.unload = function()
    --xxmsg('side_quest.unload')
end

-------------------------------------------------------------------------------------
-- 效验登陆异常
side_quest.check_login_error = function()

end

-------------------------------------------------------------------------------------
-- 实例化新对象

function side_quest.__tostring()
    return this.MODULE_NAME
end

side_quest.__index = side_quest

function side_quest:new(args)
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
    return setmetatable(new, side_quest)
end

-------------------------------------------------------------------------------------
-- 返回对象
return side_quest:new()

-------------------------------------------------------------------------------------