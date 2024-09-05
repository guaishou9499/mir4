------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
--- @author:   zengluolu
--- @email:    1819@qq.com
--- @date:     2023-10-16
--- @module:   relation_ent
--- @describe: 通用模块
--- @version:  v1.0
------------------------------------------------------------------------------------
local VERSION = '20231016' -- version history at end of file
local AUTHOR_NOTE = '-[20231016]-'
-- 模块定义
---@class relation_ent
local relation_ent = {
    -- 模块版本 (主版本.次版本.修订版本)
    VERSION = VERSION,
    -- 作者备注 (更新日期 - 更新内容简述)
    AUTHOR_NOTE = AUTHOR_NOTE,
    -- 模块名称
    MODULE_NAME = 'relation_ent module',
    -- 只读模式
    READ_ONLY = false,
}

-- 实例对象
local this = relation_ent
-- 日志模块
local trace = trace
-- 决策模块
local decider = decider
local map_unit = map_unit
local actor_unit = actor_unit
local local_player = local_player
local func = func

local relation_unit = relation_unit
local quest_unit = quest_unit
local game_unit = game_unit
local ui_unit = ui_unit
local item_unit = item_unit
---@type map_ent
local map_ent = import('game/entities/map_ent')
---@type quest_ent
local quest_ent = import('game/entities/quest_ent')
---@type hunt_ent
local hunt_ent = import('game/entities/hunt_ent')
---@type shop_ent
local shop_ent = import('game/entities/shop_ent')
---@type item_ent
local item_ent = import('game/entities/item_ent')


------------------------------------------------------------------------------------
-- [事件] 预载函数(重载脚本)
------------------------------------------------------------------------------------
function relation_ent.super_preload()

end

-- 判断是否有可执行的奇缘
relation_ent.switch_relation = function()
    local relation_res_info = this.quest_list
    for k, v in pairs(relation_res_info) do
        local main_id = v.main_id
        if not relation_unit.reward_is_receive(main_id) then
            return true
        end
    end
    return false
end

-- 奇缘任务列表
relation_ent.quest_list = {
    ['血光半兽人角'] = {
        -- 任务ID
        main_id = 0xC3B4,
        -- 前置任务
        unlock_quest = '狂人的痕迹',
        -- 瞬移位置
        [3] = { cx = 21548.669921875, cy = -27210.3046875, cz = 1385.3947753906 },
        -- 是否战斗
        [7] = { fight = true }
    },

    ['太初贤者'] = {
        main_id = 0xC418,
        [9] = {
            cx = 16985, cy = -18503, cz = 3099
        },

    },
    ['俏丽的莫夜师妹'] = {
        main_id = 0x00C47C,
        unlock_quest = '宝物的气息',
        -- 前置方法
        [1] = { func = function()
            shop_ent.buy_item('花酒', 1, 1, 1)
        end },
        [5] = { fight = true },
    },

    ['半兽人的珍珠'] = {
        main_id = 0xC4E0,
        unlock_quest = '为了大义',
        -- 特殊执行方法
        [5] = { func2 = function()
            relation_ent.do_bsrdzz_5()
        end },
    },
}

-- 通过奇缘名字执行奇缘
relation_ent.auto_relation = function(name)
    local ret = false
    -- 取资源对象
    local relation_res_info = this.quest_list[name]

    local main_id = relation_res_info.main_id

    local relation_obj = relation_unit:new()
    while decider.is_working() do
        if local_player:hp() == 0 then
            break
        end
        -- 检测任务奖历是否已领
        if relation_unit.reward_is_receive(main_id) then
            ret = true
            break
        end
        -- 奇缘ID取进度序号
        local do_idx = relation_unit.get_under_way_idx(main_id)

        -- 是否完成当前任务任务
        if relation_unit.relation_is_over(main_id) then
            -- 领取奇缘任务奖历
            relation_unit.get_relation_reward(main_id)
            ret = true
            break
        end

        trace.output('奇缘:' .. name .. ' do_idx=' .. do_idx)

        if do_idx > 0 then
            -- 奇缘ID奇缘序号 取奇缘指针
            local relation_ptr = relation_unit.get_relation_ptr_byid(main_id, do_idx)
            if relation_ptr == 0 then
                break
            end
            if relation_obj:init(relation_ptr) then
                -- 处理奇缘
                this.do_relation(relation_obj, relation_res_info)
            end
        else
            -- 解锁奇缘
            trace.output('去处理' .. relation_res_info.unlock_quest)
        end
        decider.sleep(3000)
    end
    relation_obj:delete()
    return ret
end

-- 特殊任务5 俏丽的莫夜师妹
relation_ent.do_bsrdzz_5 = function()

    while decider.is_working()
    do
        if relation_unit.get_under_way_idx(0xC4E0) ~= 5 then
            break
        end

        local sys_id = item_ent.get_item_sys_id_by_name_and_num2('水中洞穴地图')

        if sys_id ~= 0 then
            item_unit.use_item(sys_id, 1)
            decider.sleep(1000)
        else
            local item_info = item_ent.get_item_info_by_name('【秋药东】的杂物箱')
            if not table.is_empty(item_info) and item_info.num >= 10 then
                item_unit.use_item(item_info.sys_id, item_info.num)
            else
                shop_ent.buy_item('【秋药东】的杂物箱', 10, 10, 1)
            end
        end
        decider.sleep(1000)
    end
end

-- 执行奇缘任务
relation_ent.do_relation = function(relation_obj, relation_res_info)
    local map_id = relation_obj:map_id()
    local tx = relation_obj:tx()
    local ty = relation_obj:ty()
    local tz = relation_obj:tz()
    local id = relation_obj:id()
    local quest_idx = relation_obj:idx()
    while decider.is_working()
    do
        if local_player:hp() == 0 then
            break
        end
        local do_quest = true
        -- 进度 不相等退出
        if relation_unit.get_under_way_idx(id) ~= quest_idx then
            do_quest = false
            actor_unit.set_auto_type(0)
            if relation_res_info[quest_idx] and relation_res_info[quest_idx].cx then
                local move_cx, move_cy, move_cz = relation_res_info[quest_idx].cx, relation_res_info[quest_idx].cy, relation_res_info[quest_idx].cz
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), tx, ty, 300) then
                    map_ent.wi_fast_move(move_cx, move_cy, move_cz)
                end
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), move_cx, move_cy, 300) then
                    break
                end
            else
                break
            end
        end
        -- 子任务完成退出
        if relation_unit.relation_is_finish(id) then
            do_quest = false
            actor_unit.set_auto_type(0)
            if relation_res_info[quest_idx] and relation_res_info[quest_idx].cx then
                local move_cx, move_cy, move_cz = relation_res_info[quest_idx].cx, relation_res_info[quest_idx].cy, relation_res_info[quest_idx].cz
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), tx, ty, 300) then
                    map_ent.wi_fast_move(move_cx, move_cy, move_cz)
                end
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), move_cx, move_cy, 300) then
                    break
                end
            else
                break
            end
        end
        if do_quest then
            local str = string.format('移动奇缘：%s-线索%u', relation_obj:name(), quest_idx)
            if relation_res_info[quest_idx] and relation_res_info[quest_idx].func then
                relation_res_info[quest_idx].func()
            end
            if relation_res_info[quest_idx] and relation_res_info[quest_idx].func2 then
                relation_res_info[quest_idx].func2()
            else
                if actor_unit.map_id() == map_id then
                    if local_player:dist_xy(tx, ty) < 500 then
                        str = string.format('做奇缘：%s-线索%u', relation_obj:name(), quest_idx)
                        trace.output(str)
                        if relation_obj:is_kill_monster() or (relation_res_info[quest_idx] and relation_res_info[quest_idx].fight) then
                            if quest_unit.is_in_monster_smite() then
                                quest_ent.skip_game()
                            end
                            hunt_ent.normal_kill_near_5mon()
                            if local_player:auto_type() ~= 2 then
                                actor_unit.set_auto_type(2)
                            end
                            --在动画剧情场景
                        elseif quest_unit.is_in_monster_smite() then
                            quest_ent.skip_game()
                        else
                            -- 对话
                            relation_unit.relation_talk(id, quest_idx)
                            this.wait_open_dialogue()
                            if ui_unit.get_parent_widget('New_NPC_C', true) ~= 0 then
                                this.next_dialogue()
                            end
                        end
                    else
                        if relation_res_info[quest_idx] and relation_res_info[quest_idx].cx then
                            local move_cx, move_cy, move_cz = relation_res_info[quest_idx].cx, relation_res_info[quest_idx].cy, relation_res_info[quest_idx].cz
                            if func.is_rang_by_point(local_player:cx(), local_player:cy(), move_cx, move_cy, 300) then
                                map_ent.wi_fast_move(tx, ty, tz)
                            else
                                map_ent.auto_move(map_id, move_cx, move_cy, move_cz, str, 200)
                            end
                        else
                            map_ent.auto_move(map_id, tx, ty, tz, str, 100)
                        end
                    end
                else
                    map_ent.auto_move(map_id, tx, ty, tz, str, 100)
                end
            end
        end
        decider.sleep(2000)
    end

end

-- 等待出对话框
relation_ent.wait_open_dialogue = function()
    game_unit.leave_sleep_mode()
    local out_time = 0
    while decider.is_working()
    do
        if ui_unit.get_parent_widget('New_NPC_C', true) ~= 0 then
            break
        end

        if out_time > 10 then
            break
        end
        out_time = out_time + 1
        decider.sleep(1000)
    end
end

-- 对话。下一次操作
relation_ent.next_dialogue = function()
    game_unit.leave_sleep_mode()
    while decider.is_working()
    do
        if ui_unit.get_parent_widget('New_NPC_C', true) == 0 then
            break
        end
        trace.output('点击NPC对话下一步')
        game_unit.next_dialg()
        decider.sleep(800)
    end
end


------------------------------------------------------------------------------------
-- [内部] 将对象转换为字符串
--
-- @local
-- @treturn      string                     模块名称
------------------------------------------------------------------------------------
function relation_ent.__tostring()
    return this.MODULE_NAME
end

------------------------------------------------------------------------------------
-- [内部] 防止动态修改(this.READ_ONLY值控制)
--
-- @local
-- @tparam       table     t                被修改的表
-- @tparam       any       k                要修改的键
-- @tparam       any       v                要修改的值
------------------------------------------------------------------------------------
function relation_ent.__newindex(t, k, v)
    if this.READ_ONLY then
        error('attempt to modify read-only table')
        return
    end
    rawset(t, k, v)
end

------------------------------------------------------------------------------------
-- [内部] 设置item的__index元方法指向自身
--
-- @local
------------------------------------------------------------------------------------
relation_ent.__index = relation_ent

------------------------------------------------------------------------------------
-- [构造] 创建一个新的实例
--
-- @local
-- @tparam       table     args             可选参数，用于初始化新实例
-- @treturn      table                      新创建的实例
------------------------------------------------------------------------------------
function relation_ent:new(args)
    local new = {}
    -- 预载函数(重载脚本时)
    if this.super_preload then
        this.super_preload()
    end
    -- 将args中的键值对复制到新实例中
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    -- 设置元表
    return setmetatable(new, relation_ent)
end

-------------------------------------------------------------------------------------
-- 返回实例对象
-------------------------------------------------------------------------------------
return relation_ent:new()

-------------------------------------------------------------------------------------
