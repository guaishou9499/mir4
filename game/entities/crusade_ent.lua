------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
--- @author:   zengluolu
--- @email:    1819@qq.com
--- @date:     2023-10-16
--- @module:   crusade_ent
--- @describe: 讨伐模块
--- @version:  v1.0
------------------------------------------------------------------------------------
local VERSION = '20231016' -- version history at end of file
local AUTHOR_NOTE = '-[20231016]-'
-- 模块定义
---@class crusade_ent
local crusade_ent = {
    -- 模块版本 (主版本.次版本.修订版本)
    VERSION = VERSION,
    -- 作者备注 (更新日期 - 更新内容简述)
    AUTHOR_NOTE = AUTHOR_NOTE,
    -- 模块名称
    MODULE_NAME = 'crusade_ent module',
    -- 只读模式
    READ_ONLY = false,
    -- 普通攻击远程五个连打是否开启
    NORMAL_CHANGE_GROUP_AGGRESSION = false,
}

-- 实例对象
local this = crusade_ent
-- 日志模块
local trace = trace
-- 决策模块
local decider = decider
local mail_unit = mail_unit
local main_ctx = main_ctx
local local_player = local_player
local team_unit = team_unit
local actor_unit = actor_unit
local main_unit = main_unit
local ui_unit = ui_unit
---@type quest_res
local quest_res = import('game/resources/quest_res')
---@type switch_ent
local switch_ent = import('game/entities/switch_ent')
---@type hunt_ent
local hunt_ent = import('game/entities/hunt_ent')
---@type quest_ent
local quest_ent = import('game/entities/quest_ent')
---@type actor_ent
local actor_ent = import('game/entities/actor_ent')


------------------------------------------------------------------------------------
-- [事件] 预载函数(重载脚本)
------------------------------------------------------------------------------------
function crusade_ent.super_preload()
    this.NORMAL_CHANGE_GROUP_AGGRESSION = false
end

-- 是否可以进入讨伐
function crusade_ent.check_condition()

    if local_player:level() < 40 then
        return false
    end
    if actor_unit.char_combat_power() < 20000 then
        return false
    end
    -- 首领 0x65  普通：0x66
    if team_unit.can_taofa_ticket(0x66) and '地牢' ~= actor_unit.map_name() then
        return true
    end
    return false
end

-- 讨伐进入
function crusade_ent.fight()

    if this.check_condition() then
        team_unit.update_team_list(0x66)
        decider.sleep(2000)

        -- 地牢ID0x65 双门迷宫ID0x66   黑血僧将 0xC9
        team_unit.create_taofa(0x66, 0x65)
        decider.sleep(1000)
        team_unit.start_taofa(0x65)
    end

    if '地牢' ~= actor_unit.map_name() then
        return false
    end
    this.use_group_aggression()
    this.finish_end()
end

-- 战斗开启群体攻击
function crusade_ent.use_group_aggression()

    if local_player:auto_type() ~= 2 then
        actor_unit.set_auto_type(2)
        decider.sleep(1000)
    end

    while this.NORMAL_CHANGE_GROUP_AGGRESSION == false and decider.is_working() do
        trace.output('[地牢] 自动打怪中')
        if local_player:auto_type() == 2 then
            hunt_ent.normal_kill_near_5mon()
            quest_ent.skip_game()
            return true
        end
        decider.sleep(1000)
    end
end

-- 结束后模拟退出按键
function crusade_ent.finish_end()
    while '地牢' == actor_unit.map_name() and decider.is_working() do
        quest_ent.skip_game()
        if local_player:auto_type() ~= 2 then
            actor_unit.set_auto_type(2)
            hunt_ent.normal_kill_near_5mon()
        end

        if ui_unit.get_parent_widget('Popup_Dungeon_Reward_C', true) ~= 0 then
            team_unit.finish_taofa(0x66)
            this.NORMAL_CHANGE_GROUP_AGGRESSION = false
            return true
        end
        trace.output('[地牢] 等待退出')
        decider.sleep(1000)
    end
end


------------------------------------------------------------------------------------
-- [内部] 将对象转换为字符串
--
-- @local
-- @treturn      string                     模块名称
------------------------------------------------------------------------------------
function crusade_ent.__tostring()
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
function crusade_ent.__newindex(t, k, v)
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
crusade_ent.__index = crusade_ent

------------------------------------------------------------------------------------
-- [构造] 创建一个新的实例
--
-- @local
-- @tparam       table     args             可选参数，用于初始化新实例
-- @treturn      table                      新创建的实例
------------------------------------------------------------------------------------
function crusade_ent:new(args)
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
    return setmetatable(new, crusade_ent)
end

-------------------------------------------------------------------------------------
-- 返回实例对象
-------------------------------------------------------------------------------------
return crusade_ent:new()

-------------------------------------------------------------------------------------
