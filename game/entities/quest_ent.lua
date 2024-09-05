------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
--- @author:   zengluolu
--- @email:    1819@qq.com
--- @date:     2023-10-16
--- @module:   quest_ent
--- @describe: 通用模块
--- @version:  v1.0
------------------------------------------------------------------------------------
local VERSION = '20231016' -- version history at end of file
local AUTHOR_NOTE = '-[20231016]-'
-- 模块定义
---@class quest_ent
local quest_ent = {
    -- 模块版本 (主版本.次版本.修订版本)
    VERSION = VERSION,
    -- 作者备注 (更新日期 - 更新内容简述)
    AUTHOR_NOTE = AUTHOR_NOTE,
    -- 模块名称
    MODULE_NAME = 'quest_ent module',
    -- 只读模式
    READ_ONLY = false,
    idx12 = 0,
}

-- 实例对象
local this = quest_ent
-- 日志模块
local trace = trace
-- 决策模块
local decider = decider
local func = func
local quest_unit = quest_unit
local actor_unit = actor_unit
local ui_unit = ui_unit
local game_unit = game_unit
local local_player = local_player
local quest_ctx = quest_ctx
---@type gather_ent
local gather_ent = import('game/entities/gather_ent')
---@type map_ent
local map_ent = import('game/entities/map_ent')
---@type actor_ent
local actor_ent = import('game/entities/actor_ent')
---@type skill_ent
local skill_ent = import('game/entities/skill_ent')
---@type training_ent
local training_ent = import('game/entities/training_ent')
---@type equip_ent
local equip_ent = import('game/entities/equip_ent')
---@type quest_res
local quest_res = import('game/resources/quest_res')
---@type revive_ent
local revive_ent = import('game/entities/revive_ent')
---@type hunt_ent
local hunt_ent = import('game/entities/hunt_ent')
---@type map_res
local map_res = import('game/resources/map_res')

---@type actor_res
local actor_res = import('game/resources/actor_res')

local main_ctx = main_ctx

------------------------------------------------------------------------------------
-- [事件] 预载函数(重载脚本)
------------------------------------------------------------------------------------
function quest_ent.super_preload()
    this.wi_auto_main_quest = decider.run_interval_wrapper('开启自动主线', this.auto_main_quest, 1000 * 5)
    this.wi_auto_side_quest = decider.run_interval_wrapper('开启自动支线', this.auto_side_quest, 1000 * 5)
end

------------------------------------------------------------------------------------
-- [行为] 做主线
------------------------------------------------------------------------------------
function quest_ent.do_main_task()

    -- 主线任务名称
    local main_task_name = quest_unit.get_main_quest_name()
    -- 主线任务序号
    local main_task_idx = quest_unit.get_main_quest_idx()

    -- 主线任务类型
    local main_quest_type = quest_unit.main_quest_type()
    local cx, cy, cz = quest_unit.main_quest_tx(), quest_unit.main_quest_ty(), quest_unit.main_quest_tz()
    local map_id = quest_unit.main_quest_map_id()
    quest_ent.skip_game()
    local str = string.format('[主线-%s] %s', main_task_idx, main_task_name, main_quest_type)
    -- 追踪痕迹 23 海岸悬崖 到银杏谷
    -- 芊菲的下落 14 银杏谷 到虫洞
    -- 寻求灵药 9 虫洞 到 银杏谷
    if '漆黑的密道' == main_task_name and main_task_idx == 0 then
        decider.sleep(5000)
        map_ent.auto_move_to(30851, 72267, 9071, nil)
        str = string.format('[主线-%s] %s 完成', main_task_idx, main_task_name, main_quest_type)
        trace.output(str)
        decider.sleep(5000)


    elseif '危险的救援计划' == main_task_name and main_task_idx == 8 then
        main_ctx:post_key(65, 1)
        decider.sleep(1000)
        main_ctx:post_key(65, 0)
    elseif '追踪痕迹' == main_task_name and main_task_idx == 11 then
        skill_ent.up_skill(true)
    elseif '黑暗之影' == main_task_name and main_task_idx == 7 then
        training_ent.physical(true)
    elseif '寻求灵药' == main_task_name and main_task_idx == 6 then
        training_ent.force()
    elseif '寻求灵药' == main_task_name and main_task_idx == 8 then
        equip_ent.build_equip_1('丝绸衣上衣')
        equip_ent.auto_use_equip()

    elseif '绑架的背后' == main_task_name and main_task_idx == 8 then
        equip_ent.auto_equip()
    elseif '绑架的背后' == main_task_name and main_task_idx == 6 then
        gather_ent.gather_mod('银杏谷', 1, '采矿')
    elseif '比奇城风云' == main_task_name and main_task_idx == 21 then
        equip_ent.auto_equip()
    elseif '江湖缘分' == main_task_name and main_task_idx == 23 then
        training_ent.auto_training()
        main_ctx:do_skey(0x1B)
        decider.sleep(1000)
        main_ctx:do_skey(0x1B)
    elseif '隐士谷的隐藏高手' == main_task_name and main_task_idx == 10 then
        training_ent.auto_training()
    elseif main_task_name == '绑架的背后' and main_task_idx == 11 then
        if quest_unit.is_in_monster_smite() then
            if not quest_unit.super_man then
                quest_unit.super_man = true
                actor_unit.enable_super_man(true)--开启或关闭剧情中无敌
                decider.sleep(1000)
            end
            if local_player:auto_type() ~= 2 then
                actor_unit.set_auto_type(2)
                decider.sleep(1000)
            end
        else
            if quest_unit.super_man then
                quest_unit.super_man = false
                actor_unit.enable_super_man(false)--开启或关闭剧情中无敌
                decider.sleep(1000)
            end
            if not quest_unit.main_is_auto() then
                quest_ent.wi_auto_main_quest()
            end
        end
    else
        if '江湖缘分' == main_task_name and main_task_idx == 24 then
            main_ctx:do_skey(0x1B)
            decider.sleep(1000)
            main_ctx:do_skey(0x1B)
        end
        map_ent.teleport_map(map_id)
        if quest_unit.main_is_auto() then
            -- 如果当前地图与主线地图不一样
            if quest_unit.is_in_monster_smite() then
                if not quest_unit.super_man then
                    quest_unit.super_man = true
                    actor_unit.enable_super_man(true)--开启或关闭剧情中无敌
                    decider.sleep(1000)
                end
            else
                if quest_unit.super_man then
                    quest_unit.super_man = false
                    actor_unit.enable_super_man(false)--开启或关闭剧情中无敌
                    decider.sleep(1000)
                end
            end
            local gather_task = true
            if main_task_name == '半兽古墓' and main_task_idx == 2 then
                gather_task = false
            end

            if quest_unit.main_quest_type() > 10 and gather_task then
                if map_id == actor_unit.map_id() then
                    if local_player:status() ~= 4 and local_player:status() ~= 14 then
                        local can_gather = false
                        if '师父的决断' == main_task_name and main_task_idx == 4 then
                            can_gather = true
                        elseif '寻找龙身' == main_task_name and main_task_idx == 6 then
                            can_gather = true
                        elseif '寻找龙身' == main_task_name and main_task_idx == 11 then
                            can_gather = true
                        elseif '寻找龙身' == main_task_name and main_task_idx == 21 then
                            can_gather = true
                        elseif '芊菲的下落Ⅰ' == main_task_name and main_task_idx == 10 then
                            can_gather = true
                        elseif '牛魔神殿的怪事' == main_task_name and main_task_idx == 17 then
                            can_gather = true
                        elseif '寻求灵药' == main_task_name and main_task_idx == 21 then
                            can_gather = false
                        else
                            can_gather = true
                        end

                        local gather_info = actor_ent.get_gather_info_by_res_id(quest_unit.main_quest_type(), can_gather)
                        if not table.is_empty(gather_info) then
                            local dist = 300
                            if func.is_rang_by_point(local_player:cx(), local_player:cy(), gather_info.cx, gather_info.cy, dist) then
                                actor_unit.gather_ex(gather_info.sys_id)
                                decider.sleep(1000)
                            else
                                map_ent.auto_move(nil, gather_info.cx, gather_info.cy, gather_info.cz, str, dist)
                            end
                        else
                            str = string.format('[主线-%s] %s 无法获取采集物信息..', main_task_idx, main_task_name)
                        end
                    else
                        str = string.format('[主线-%s] %s 采集中..', main_task_idx, main_task_name)
                    end
                else
                    str = string.format('[主线-%s] %s 类型%s 移到到任务地图', main_task_idx, main_task_name, main_quest_type)
                end
            else
                if local_player:auto_type() == 2 then
                    if not game_unit.is_sleep_mode() then
                        game_unit.enter_sleep_mode()
                        decider.sleep(1000)
                    end
                    --if not string.find(actor_unit.map_name(),'牛魔神殿') then
                    --    hunt_ent.normal_kill_near_5mon()
                    --end
                end
            end
            if '寻求灵药' == main_task_name and main_task_idx == 22 and map_id == actor_unit.map_id() then
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), 27926, -31653, 300) and math.abs(local_player:cz() - 3895) < 200 then
                    map_ent.fast_move(22123, -26774, 1332)
                    for i = 1, 10 do
                        if func.is_rang_by_point(local_player:cx(), local_player:cy(), 27926, -31653, 300) then
                            break
                        end
                        decider.sleep(1000)
                    end
                end
            end

            if '追踪痕迹' == main_task_name and main_task_idx == 23 then
                if actor_unit.map_id() == 100002020 and func.is_rang_by_point(local_player:cx(), local_player:cy(), 6881, 11379, 300) then
                    local move = true
                    for i = 1, 10 do
                        if actor_unit.map_id() == map_res.GET_MAP_ID['银杏谷'] then
                            move = false
                            break
                        end
                        decider.sleep(1000)
                    end
                    if move then
                        game_unit.wait_to_map()
                        decider.sleep(2000)
                    end
                end

            elseif '芊菲的下落' == main_task_name and main_task_idx == 14 then
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), -6129.6000976562, -4847.798828125, 300) then
                    local move = true
                    for i = 1, 10 do
                        if actor_unit.map_id() == map_res.GET_MAP_ID['虫洞'] then
                            move = false
                            break
                        end
                        decider.sleep(1000)
                    end
                    if move then
                        game_unit.wait_to_map()
                        decider.sleep(2000)
                    end
                end
            elseif '寻求灵药' == main_task_name and main_task_idx == 9 then
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), -276, 5908, 300) then
                    local move = true
                    for i = 1, 10 do
                        if actor_unit.map_id() == map_res.GET_MAP_ID['银杏谷'] then
                            move = false
                            break
                        end
                        decider.sleep(1000)
                    end
                    if move then
                        game_unit.wait_to_map()
                        decider.sleep(2000)
                    end

                end
            elseif '寻求灵药' == main_task_name and main_task_idx == 25 then
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), -6129.6000976562, -4847.798828125, 300) then
                    local move = true
                    for i = 1, 10 do
                        if actor_unit.map_id() == map_res.GET_MAP_ID['虫洞'] then
                            move = false
                            break
                        end
                        decider.sleep(1000)
                    end
                    if move then
                        game_unit.wait_to_map()
                        decider.sleep(2000)
                    end
                end
            elseif '逃离银杏谷' == main_task_name and main_task_idx == 1 then
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), -276, 5908, 300) then
                    local move = true
                    for i = 1, 10 do
                        if actor_unit.map_id() == map_res.GET_MAP_ID['银杏谷'] then
                            move = false
                            break
                        end
                        decider.sleep(1000)
                    end
                    if move then
                        game_unit.wait_to_map()
                        decider.sleep(2000)
                    end
                end
            elseif '逃离银杏谷' == main_task_name and main_task_idx == 12 then
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), -17030, -19311, 300) then
                    local move = true
                    for i = 1, 10 do
                        if actor_unit.map_id() == map_res.GET_MAP_ID['比奇城'] then
                            move = false
                            break
                        end
                        decider.sleep(1000)
                    end
                    if move then
                        game_unit.wait_to_map()
                        decider.sleep(2000)
                    end
                end
            end
            if map_ent.move_lag(100) and 2 == local_player:status() then
                quest_ent.wi_auto_main_quest()
            end
        else

            quest_ent.wi_auto_main_quest()
            decider.sleep(1000)

        end
    end
    trace.output(str)
end

--点击自动主线
function quest_ent.auto_main_quest()
    quest_unit.auto_main_quest()
end

--点击自动支线线
function quest_ent.auto_side_quest(task_id, on)
    quest_unit.auto(task_id, on)
end
---跳过游戏场景
function quest_ent.skip_game()
    if ui_unit.get_parent_widget('Sequence_Skip_C', true) ~= 0 then
        -- 剧情
        decider.sleep(1000)
        this.skip_seq()
    elseif ui_unit.get_parent_widget('New_NPC_C', true) ~= 0 then
        --NPC对话
        decider.sleep(1000)
        this.skip_npc_talk()

    elseif ui_unit.get_parent_widget('Tutorial_Guid_C', true) ~= 0 then
        -- 教学
        decider.sleep(1000)
        this.skip_tutorial()
    elseif ui_unit.get_parent_widget('PlayMovieWidget_C', true) ~= 0 then
        --电影播放
        decider.sleep(1000)
        this.skip_movie()
    end
end

------------------------------------------------------------------------------------
---跳过教学
function quest_ent.skip_tutorial()
    local ret = false
    while decider.is_working() do
        if ui_unit.get_parent_widget('Tutorial_Guid_C', true) == 0 then
            break
        else
            game_unit.end_tutorial()
            ret = true
        end
        decider.sleep(500)
    end
    return ret
end

------------------------------------------------------------------------------------
---跳过npc对话
function quest_ent.skip_npc_talk()
    local ret = false
    while decider.is_working() do
        if ui_unit.get_parent_widget('New_NPC_C', true) == 0 then
            break
        else
            game_unit.next_dialg()
            ret = true
        end
        decider.sleep(500)
    end
    return ret
end

------------------------------------------------------------------------------------
---跳过剧情
function quest_ent.skip_seq()
    local ret = false
    while decider.is_working() do
        if ui_unit.get_parent_widget('Sequence_Skip_C', true) == 0 then
            break
        else
            game_unit.skip_seq()
            ret = true
        end
        decider.sleep(500)
    end
    return ret
end

------------------------------------------------------------------------------------
---跳过电影播放
function quest_ent.skip_movie()
    local ret = false
    while decider.is_working() do
        if ui_unit.get_parent_widget('PlayMovieWidget_C', true) == 0 then
            break
        else
            game_unit.skip_movie()
            ret = true
        end
        decider.sleep(500)
    end
    return ret
end





-- 清理当前任务
function quest_ent.new_clean_task()
    local task_list = quest_res.get_side_task_list()
    local list = quest_unit.list(0)
    for i = 1, #list do
        local obj = list[i]
        if quest_ctx:init(obj) then
            if quest_ctx:is_finish() then
                local completed = true
                local task_name = quest_ctx:name()
                for j = 1, #task_list do
                    if task_list[j].name == task_name then
                        if task_list[j].task_type2 == '特殊' then
                            local move_cx = task_list[j].move_pos.cx
                            local move_cy = task_list[j].move_pos.cy
                            local move_cz = task_list[j].move_pos.cz
                            local gather_cx = task_list[j].gather_pos.cx
                            local gather_cy = task_list[j].gather_pos.cy
                            local gather_cz = task_list[j].gather_pos.cz
                            if func.is_rang_by_point(local_player:cx(), local_player:cy(), gather_cx, gather_cy, 200) then
                                map_ent.fast_move(move_cx, move_cy, move_cz)
                                decider.sleep(1000)
                                if func.is_rang_by_point(local_player:cx(), local_player:cy(), gather_cx, gather_cy, 200) then
                                    completed = false
                                end
                            end
                        end
                        break
                    end
                end
                if completed then
                    quest_unit.completed(quest_ctx:id())
                    decider.sleep(1000)
                end
            else
                local del = true
                local task_name = quest_ctx:name()
                local map_name = quest_ctx:map_name()
                for j = 1, #task_list do
                    if task_list[j].name == task_name then
                        if task_list[j].map_name and task_list[j].map_name == map_name then
                            del = false
                        elseif not task_list[j].map_name then
                            del = false
                        end
                    end
                end
                if del then
                    quest_unit.delete(quest_ctx:id())
                    decider.sleep(1000)
                end
            end
        end
    end
end

-- 接支线任务
function quest_ent.new_acc_task()
    local task_list = quest_res.get_side_task_list()
    if #quest_unit.list(0) >= 10 then
        return false
    end
    local list = quest_unit.list(1)
    for i = 1, #list do
        local obj = list[i]
        if quest_ctx:init(obj) then
            if #quest_unit.list(0) >= 10 then
                break
            end
            local read_task = false
            local task_name = quest_ctx:name()
            local task_id = quest_ctx:id()
            local task_type = ''
            local map_name = quest_ctx:map_name()
            for j = 1, #task_list do
                if task_list[j].name == task_name and map_name == task_list[j].map_name then
                    task_type = task_list[j].task_type
                    read_task = true
                    break
                end
            end
            if read_task and quest_ctx:is_over() then
                read_task = false
            end
            if read_task and quest_ctx:is_finish() then
                read_task = false
            end
            if read_task and quest_ctx:daily_num() ~= 0 then
                read_task = false
            end

            if read_task and task_type == '委托' then
                read_task = false
            end
            if read_task then
                quest_unit.accept(task_id)
                decider.sleep(2000)
            end
        end
    end
end


-- 接支线任务
function quest_ent.new_acc_entrust_task()
    local task_list = quest_res.get_side_task_list()
    if #quest_unit.list(0) >= 10 then
        return false
    end
    local list = quest_unit.list(2)
    for i = 1, #list do
        local obj = list[i]
        if quest_ctx:init(obj) then
            if #quest_unit.list(0) >= 10 then
                break
            end
            local read_task = false
            local task_name = quest_ctx:name()
            local task_id = quest_ctx:id()
            local is_over = quest_ctx:is_over()
            local is_finish = quest_ctx:is_finish()
            local task_map_name = quest_ctx:map_name()
            local map_name = ''
            local task_type = ''
            for j = 1, #task_list do
                if task_list[j].name == task_name then
                    map_name = task_list[j].map_name
                    task_type = task_list[j].task_type
                    read_task = true
                    break
                end
            end
            if read_task and is_over then
                read_task = false
            end
            if read_task and is_finish then
                read_task = false
            end
            if read_task and task_map_name ~= map_name then
                read_task = false
            end
            -- 判断委托任务数量
            local have_entrust_task = quest_ent.new_have_entrust_task()
            if have_entrust_task then
                break
            end
            if read_task then
                quest_unit.accept(task_id)
                decider.sleep(2000)
            end
        end
    end
end

-- 判断当前任务中是否有委托任务
function quest_ent.new_have_entrust_task()
    local have_entrust_task = false
    local list = quest_unit.list(0)
    for i = 1, #list do
        local obj = list[i]
        if quest_ctx:init(obj) then
            if quest_unit.get_quest_type(quest_ctx:id()) == 6 then
                have_entrust_task = true
                break
            end
        end
    end
    return have_entrust_task
end

function quest_ent.new_do_task()
    local task_idx = quest_ent.new_get_task_idx()
    if task_idx == 0 then
        return false
    end
    local task_res_info = quest_res.OTHER_QUEST[task_idx]
    local task_name = task_res_info.name
    local task_type2 = task_res_info.task_type2
    local map_name = task_res_info.map_name

    local task_info = quest_ent.get_task_info_by_name(task_name)
    if task_res_info.pos then
        task_info.map_name = task_res_info.pos.map_name
        task_info.map_id = task_res_info.pos.map_id
        task_info.tx = task_res_info.pos.x
        task_info.ty = task_res_info.pos.y
        task_info.tz = task_res_info.pos.z
    end
    if not table.is_empty(task_info) then
        if not task_info.is_finish then
            local str = '[' .. task_res_info.task_type .. ' - ' .. task_idx .. '] - 移动' .. task_name
            if task_type2 == '打怪' then
                local x, y, z = task_info.tx, task_info.ty, task_info.tz
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), x, y, 1000) then
                    hunt_ent.normal_kill_near_5mon()
                    str = '[' .. task_res_info.task_type .. ' - ' .. task_idx .. '] - ' .. task_name
                    trace.output(str)
                    if local_player:auto_type() ~= 2 then
                        actor_unit.set_auto_type(2)
                        decider.sleep(1000)
                    else
                        if not game_unit.is_sleep_mode() then
                            game_unit.enter_sleep_mode()
                            decider.sleep(1000)
                        end
                    end
                else
                    map_ent.auto_move(task_info.map_id, x, y, z, str)
                end
            elseif task_type2 == '采集' then
                str = '[' .. task_res_info.task_type .. ' - ' .. task_idx .. '] - ' .. task_name
                gather_ent.do_gather_type_task(task_name, map_name, task_type2, str)
            elseif task_type2 == '真气' then
                str = '[' .. task_res_info.task_type .. ' - ' .. task_idx .. '] - ' .. task_name
                gather_ent.do_gather_type_task(task_name, map_name, task_type2, str)
            elseif task_type2 == '采矿' then
                str = '[' .. task_res_info.task_type .. ' - ' .. task_idx .. '] - ' .. task_name
                gather_ent.do_gather_type_task(task_name, map_name, task_type2, str)
            elseif task_type2 == '宝箱' then
                str = '[' .. task_res_info.task_type .. ' - ' .. task_idx .. '] - ' .. task_name
                gather_ent.do_gather_type_task(task_name, map_name, task_type2, str)
            elseif task_type2 == '特殊' then
                local move_cx = task_res_info.move_pos.cx
                local move_cy = task_res_info.move_pos.cy
                local move_cz = task_res_info.move_pos.cz
                local gather_cx = task_res_info.gather_pos.cx
                local gather_cy = task_res_info.gather_pos.cy
                local gather_cz = task_res_info.gather_pos.cz
                if func.is_rang_by_point(local_player:cx(), local_player:cy(), gather_cx, gather_cy, 200) then
                    local res_id = task_info.entrust_gather_resid
                    local gather_info = actor_ent.get_gather_info_by_res_id(res_id, true)
                    if not table.is_empty(gather_info) then
                        if func.is_rang_by_point(local_player:cx(), local_player:cy(), gather_info.cx, gather_info.cy, 300) then
                            actor_unit.gather_ex(gather_info.sys_id)
                            decider.sleep(1000)
                        else
                            map_ent.auto_move(nil, gather_info.cx, gather_info.cy, gather_info.cz, str)
                        end
                    end
                else
                    if func.is_rang_by_point(local_player:cx(), local_player:cy(), move_cx, move_cy, 200) then
                        map_ent.fast_move(gather_cx, gather_cy, gather_cz)
                    else
                        map_ent.auto_move(task_info.map_id, move_cx, move_cy, move_cz, str, 300)
                    end
                end
            end
        end
    else
        xxmsg('任务信息为空')
    end
end


-- 清理当前任务
function quest_ent.new_get_task_idx()
    local task_list = quest_res.get_side_task_list()
    local cur_task_list = quest_ent.get_cur_task_list()
    local task_idx = 0
    for idx, task_info in pairs(task_list) do
        -- 任务名称
        local task_name = task_info.name
        local map_name = task_info.map_name
        if this.task_in_task_list(cur_task_list, task_name, map_name) then
            task_idx = idx
            break
        end
    end
    return task_idx
end

function quest_ent.get_cur_task_list()
    local cur_task_list = {}
    local list = quest_unit.list(0)
    for _, obj in pairs(list) do
        if quest_ctx:init(obj) then
            local task_info = {
                obj = obj,
                id = quest_ctx:id(),
                type = quest_ctx:type(),
                daily_num = quest_ctx:daily_num(),
                status = quest_ctx:status(),
                combat_power = quest_ctx:combat_power(),
                tar_type = quest_ctx:tar_type(),
                tar_num = quest_ctx:tar_num(),
                tar_max_num = quest_ctx:tar_max_num(),
                tx = quest_ctx:tx(),
                ty = quest_ctx:ty(),
                tz = quest_ctx:tz(),
                is_over = quest_ctx:is_over(),
                is_finish = quest_ctx:is_finish(),
                map_id = quest_ctx:map_id(),
                map_name = quest_ctx:map_name(),
                name = quest_ctx:name(),
                entrust_gather_resid = quest_ctx:entrust_gather_resid()
            }
            table.insert(cur_task_list, task_info)
        end
    end
    return cur_task_list
end

function quest_ent.get_task_info_by_name(name)
    local cur_task_list = {}
    local list = quest_unit.list(0)
    for _, obj in pairs(list) do
        if quest_ctx:init(obj) then
            if quest_ctx:name() == name then
                cur_task_list = {
                    obj = obj,
                    id = quest_ctx:id(),
                    type = quest_ctx:type(),
                    daily_num = quest_ctx:daily_num(),
                    status = quest_ctx:status(),
                    combat_power = quest_ctx:combat_power(),
                    tar_type = quest_ctx:tar_type(),
                    tar_num = quest_ctx:tar_num(),
                    tar_max_num = quest_ctx:tar_max_num(),
                    tx = quest_ctx:tx(),
                    ty = quest_ctx:ty(),
                    tz = quest_ctx:tz(),
                    is_over = quest_ctx:is_over(),
                    is_finish = quest_ctx:is_finish(),
                    map_id = quest_ctx:map_id(),
                    map_name = quest_ctx:map_name(),
                    name = name,
                    entrust_gather_resid = quest_ctx:entrust_gather_resid()
                }
                break
            end
        end
    end
    return cur_task_list
end



--------------------------------------------------------------------------------
-- [判断] 任务是否在指定任务列表
--
-- @static
-- @tparam      table       task_list       包含任务信息的 table，必须包括：
-- @tparam[t]   string      name            任务名称
-- @tparam[t]   number      level           任务等级
-- @tparam      string      task_name       任务名称
-- @tparam      number      task_level      任务等级
-- @treturn     boolean
--------------------------------------------------------------------------------
function quest_ent.task_in_task_list(task_list, task_name, task_map_name)
    local ret_b = false
    for _, task_info in pairs(task_list) do
        if task_name == task_info.name then
            ret_b = true
            if task_map_name and task_map_name ~= task_info.map_name then
                ret_b = false
            end
            if ret_b then
                break
            end
        end
    end
    return ret_b
end









-- 执行采集类的任务
function gather_ent.do_gather_type_task(task_name, map_name, gather_type, str)

    local res_id = actor_res.GATHER_RES[map_name][gather_type]
    local map_list = actor_res.GATHER_MAP_LIST[map_name]

    local break_func = function()
        local gather_info = gather_ent.get_gather_info_by_res_id(res_id)
        if not table.is_empty(gather_info) then
            return true
        end
        return false
    end
    while decider.is_working() do
        local task_info = quest_ent.get_task_info_by_name(task_name)
        if table.is_empty(task_info) or task_info.is_finish then
            break
        end
        local x, y, z = task_info.tx, task_info.ty, task_info.tz
        -- 移动到指定地图
        if map_name == actor_unit.map_name() then
            if local_player:status() == 14 then
                local my_gather_info = gather_ent.get_my_gather_info()
                local gather = true
                if type(res_id) == 'number' then
                    if my_gather_info.res_id ~= res_id then
                        gather = false
                    end
                elseif type(res_id) == 'table' then
                    if not res_id[my_gather_info.res_id] then
                        gather = false
                    end
                end
                if not gather then
                    map_ent.auto_move(map_name, x, y, z, str)
                else
                    if not game_unit.is_sleep_mode() then
                        game_unit.enter_sleep_mode()
                        decider.sleep(1000)
                    end
                end
                trace.output(str)
            else
                for i = 1, #map_list do
                    if break_func() then
                        break
                    end
                    local cx, cy, cz = map_list[i].pos.x, map_list[i].pos.y, map_list[i].pos.z
                    map_ent.auto_move(map_name, cx, cy, cz, str, nil, nil, break_func)
                    map_ent.auto_move_to(local_player:cx(), local_player:cy(), local_player:cz())
                end
                -- 移动到采集物附近采集
                local gather_info1 = actor_ent.get_near_gather_list_by_res_id(res_id)
                local gather_info = gather_ent.get_near_best_gather(gather_info1, gather_type)
                if not table.is_empty(gather_info) then
                    if func.is_rang_by_point(local_player:cx(), local_player:cy(), gather_info.cx, gather_info.cy, 300) then
                        actor_unit.gather_ex(gather_info.sys_id)
                        decider.sleep(1000)
                    else
                        map_ent.auto_move(nil, gather_info.cx, gather_info.cy, gather_info.cz, str)
                    end
                end
            end
        else
            map_ent.auto_move(map_name, x, y, z, str)
        end
        decider.sleep(100)
    end
end








-- 是否有可接的支线任务
function quest_ent.new_have_can_acc_task()
    local task_list = quest_res.get_side_task_list()
    if #quest_unit.list(0) >= 1 then
        return true
    end
    local list = quest_unit.list(1)
    for i = 1, #list do
        local obj = list[i]
        if quest_ctx:init(obj) then
            local read_task = false
            local task_name = quest_ctx:name()
            local map_name = quest_ctx:map_name()
            for j = 1, #task_list do
                if task_list[j].name == task_name and map_name == task_list[j].map_name then
                    read_task = true
                    break
                end
            end
            if read_task and quest_ctx:is_over() then
                read_task = false
            end
            if read_task and quest_ctx:is_finish() then
                read_task = false
            end
            if read_task and quest_ctx:daily_num() ~= 0 then
                read_task = false
            end

            if read_task then
                return true
            end
        end
    end
    return false
end


-- 接支线任务
function quest_ent.new_have_can_acc_entrust_task()
    local task_list = quest_res.get_side_task_list()
    if #quest_unit.list(0) >= 1 then
        return true
    end
    local list = quest_unit.list(2)
    for i = 1, #list do
        local obj = list[i]
        if quest_ctx:init(obj) then
            local read_task = false
            local task_name = quest_ctx:name()
            local map_name = ''
            for j = 1, #task_list do
                if task_list[j].name == task_name then
                    map_name = task_list[j].map_name
                    read_task = true
                    break
                end
            end
            if read_task and quest_ctx:is_over() then
                read_task = false
            end
            if read_task and quest_ctx:is_finish() then
                read_task = false
            end
            if read_task and quest_ctx:map_name() ~= map_name then
                read_task = false
            end
            if read_task then
                return true
            end
        end
    end
    return false
end





------------------------------------------------------------------------------------
-- [内部] 将对象转换为字符串
--
-- @local
-- @treturn      string                     模块名称
------------------------------------------------------------------------------------
function quest_ent.__tostring()
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
function quest_ent.__newindex(t, k, v)
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
quest_ent.__index = quest_ent

------------------------------------------------------------------------------------
-- [构造] 创建一个新的实例
--
-- @local
-- @tparam       table     args             可选参数，用于初始化新实例
-- @treturn      table                      新创建的实例
------------------------------------------------------------------------------------
function quest_ent:new(args)
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
    return setmetatable(new, quest_ent)
end

-------------------------------------------------------------------------------------
-- 返回实例对象
-------------------------------------------------------------------------------------
return quest_ent:new()

-------------------------------------------------------------------------------------
