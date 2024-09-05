-------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
-- @author:   zengluolu
-- @email:    1819@qq.com
-- @date:     2023-10-15
-- @module:   hunt
-- @describe: 测试模块
-- @version:  v1.0
--

-------------------------------------------------------------------------------------
--
local hunt = {
    VERSION = '202015.1',
    AUTHOR_NOTE = "-[hunt module - 202015.1]-",
    MODULE_NAME = '挂机模块',
    -- 设置脚本版本
    SCRIPT_UPDATE = 'v1.0.0',
}

-- 自身模块
local this = hunt
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
local local_player = local_player
---@type login_res
local login_res = import('game/resources/login_res')
---@type stone_ent
local stone_ent = import('game/entities/stone_ent')
---@type hunt_ent
local hunt_ent = import('game/entities/hunt_ent')

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
---@type gift_ent
local gift_ent = import('game/entities/gift_ent')
---@type actor_res
local actor_res = import('game/resources/actor_res')
---@type switch_ent
local switch_ent = import('game/entities/switch_ent')
---@type transfer_ent
local transfer_ent = import('game/entities/transfer_ent')
---@type revive_ent
local revive_ent = import('game/entities/revive_ent')


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

        return switch_ent.switch_hunt()
                and not switch_ent.main_task()
                and not switch_ent.secret_fb()
                and not switch_ent.side_task()
                and not switch_ent.mf_fb()
                and not switch_ent.gather()
                and not switch_ent.switch_relation()
    end,
    -- [其它] 功能函数条件(可选)
    is_execute = function()
        return true
    end,
}

-- 轮循函数列表
hunt.poll_functions = {}

------------------------------------------------------------------------------------
-- 预载函数(重载脚本时)
hunt.super_preload = function()

end

-------------------------------------------------------------------------------------
-- 预载处理
hunt.preload = function()


end

-------------------------------------------------------------------------------------
-- 轮循功能入口
hunt.looping = function()

    if not game_unit.is_sleep_mode() then
        training_ent.wi_auto_training()
        stone_ent.wi_set_magic_stone()
        skill_ent.wi_auto_skill()
        pet_ent.wi_auto_pet()
        mail_ent.wi_get_mail()
        item_ent.wi_use_unsealing_box()
        item_ent.wi_use_fashion_item()
        item_ent.wi_sell_item()
        item_ent.wi_auto_use_item()
        item_ent.wi_use_zhaohuan_item()
        gift_ent.wi_daily_work()
        gift_ent.wi_sign()
        gift_ent.wi_achievement()
        equip_ent.wi_auto_equip()

        weiye_ent.wi_auto_great()
        transfer_ent.do_transfer_ent_for_warehouse()
    end
    shop_ent.wi_auto_buy_item()
    item_ent.wi_set_quick_slot()
    revive_ent.revive_player()
    map_ent.escape_for_recovery()
end

-------------------------------------------------------------------------------------
-- 功能入口函数
hunt.entry = function()
    local ret_b = false

    -- 加载前延迟


    local map_info = {}
    while decider.is_working()
    do
        if local_player:level() >= 40 then
            if game_unit.is_sleep_mode() then
                game_unit.leave_sleep_mode()
                decider.sleep(1000)
            end
        else
            if local_player:auto_type() ~= 2 then
                if game_unit.is_sleep_mode() then
                    game_unit.leave_sleep_mode()
                    decider.sleep(1000)
                end
            end
        end

        -- 执行轮循任务
        hunt.looping()

        if local_player:level() >= 40 then
            local map_info_list = {
                { x = -17205, y = -25744, z = 4885, map_id = 102003010, map_name = '沃玛森林', },
                { map_id = 200022031.0, map_name = '【精英】半兽人遗迹2层', x = 14872.12890625, y = -2745.5153808594, z = 3065.2116699219 },
                { map_id = 200022031.0, map_name = '【精英】半兽人遗迹2层', x = 2452.1396484375, y = 9581.462890625, z = 3823.2080078125 },
                { map_id = 200022031.0, map_name = '【精英】半兽人遗迹2层', x = 10810.767578125, y = 5399.1025390625, z = 3180.8608398438 },
                { map_id = 200022031.0, map_name = '【精英】半兽人遗迹2层', x = 1491.0848388672, y = -3004.2260742188, z = 1938.4365234375 },
                { map_id = 200022031.0, map_name = '【精英】半兽人遗迹2层', x = -12922.65234375, y = 4313.9228515625, z = 1525.6773681641 },
                { map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', x = 4000.23046875, y = -8931.3720703125, z = 6386.2387695312 },
                { map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', x = 21374.142578125, y = -5769.900390625, z = 4337.0107421875 },
                { map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', x = 8637.7392578125, y = 12989.58203125, z = 4341.4130859375 },
                { map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', x = 5594.6811523438, y = -2450.630859375, z = 4914.599609375 },
                { map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', x = -5209.447265625, y = 9824.0458984375, z = 3062.3962402344 },
                { map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', x = -14970.708007812, y = 8358.095703125, z = 2634.7958984375 },
                { map_id = 200022030.0, map_name = '【精英】半兽人遗迹1层', x = -6544.1494140625, y = -1972.8826904297, z = 3353.8168945312 },
            }

            if table.is_empty(map_info) then
                map_info = map_info_list[math.random(1, #map_info_list)]
            else
                hunt_ent.move_hunt_pos_up_level(map_info)
            end
        else
            local map_info_list = {


                { map_id = 200022021.0, map_name = '【精英】半兽古墓2层', x = 18508.974609375, y = 9010.9140625, z = 1925.5073242188  },
                { map_id = 200022021.0, map_name = '【精英】半兽古墓2层',  x = 16187.958007812, y = 285.6044921875, z = 1501.5961914062  },
                { map_id = 200022021.0, map_name = '【精英】半兽古墓2层',  x = 6931.0654296875, y = 2533.5864257812, z = 986.64306640625  },
                { map_id = 200022021.0, map_name = '【精英】半兽古墓2层',  x = 3922.9226074219, y = -6418.1518554688, z = 580.36651611328  },
                { map_id = 200022021.0, map_name = '【精英】半兽古墓2层',x = -7767.375, y = -6337.2504882812, z = 1449.0540771484  },
                { map_id = 200022021.0, map_name = '【精英】半兽古墓2层', x = -9391.4384765625, y = 1572.9051513672, z = 2263.3557128906  },
                { map_id = 200022021.0, map_name = '【精英】半兽古墓2层',x = -18097.115234375, y = 5654.2958984375, z = 1455.33203125 },
            }

            if table.is_empty(map_info) then
                map_info = map_info_list[math.random(1, #map_info_list)]
            else
                hunt_ent.move_hunt_pos_up_level(map_info)
            end
        end

        decider.sleep(100)
    end
    return ret_b
end

-------------------------------------------------------------------------------------
-- 模块超时处理
hunt.on_timeout = function()

end



-------------------------------------------------------------------------------------
-- 卸载处理
hunt.unload = function()
    --xxmsg('hunt.unload')
end

-------------------------------------------------------------------------------------
-- 效验登陆异常
hunt.check_login_error = function()

end

-------------------------------------------------------------------------------------
-- 实例化新对象

function hunt.__tostring()
    return this.MODULE_NAME
end

hunt.__index = hunt

function hunt:new(args)
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
    return setmetatable(new, hunt)
end

-------------------------------------------------------------------------------------
-- 返回对象
return hunt:new()

-------------------------------------------------------------------------------------