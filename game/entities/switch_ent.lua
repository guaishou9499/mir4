------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
--- @author:   zengluolu
--- @email:    1819@qq.com
--- @date:     2023-10-16
--- @module:   switch_ent
--- @describe: 通用模块
--- @version:  v1.0
------------------------------------------------------------------------------------
local VERSION = '20231016' -- version history at end of file
local AUTHOR_NOTE = '-[20231016]-'
-- 模块定义
---@class switch_ent
local switch_ent = {
    -- 模块版本 (主版本.次版本.修订版本)
    VERSION = VERSION,
    -- 作者备注 (更新日期 - 更新内容简述)
    AUTHOR_NOTE = AUTHOR_NOTE,
    -- 模块名称
    MODULE_NAME = 'switch_ent module',
    -- 只读模式
    READ_ONLY = false,
}

-- 实例对象
local this = switch_ent
-- 日志模块
local trace = trace
-- 决策模块
local decider = decider
local skill_unit = skill_unit
local local_player = local_player
local quest_unit = quest_unit
local actor_unit = actor_unit
---@type quest_ent
local quest_ent = import('game/entities/quest_ent')
---@type dungeon_ent
local dungeon_ent = import('game/entities/dungeon_ent')
---@type quest_res
local quest_res = import('game/resources/quest_res')
---@type gather_ent
local gather_ent = import('game/entities/gather_ent')
---@type secret_ent
local secret_ent = import('game/entities/secret_ent')
---@type transfer_ent
local transfer_ent = import('game/entities/transfer_ent')
---@type relation_ent
local relation_ent = import('game/entities/relation_ent')

------------------------------------------------------------------------------------
-- [事件] 预载函数(重载脚本)
------------------------------------------------------------------------------------
function switch_ent.super_preload()

end

-- 是否主线
function switch_ent.main_task()
    local idx1, idx2 = quest_res.get_main_task_idx()
    if idx1 < 11 then
        return true
    end
    if idx1 == 0 then
        return false
    end

    if idx1 == 29 and idx2 >= 9 then
        return false
    end
    if idx1 > 29 then
        return false
    end
    if idx1 == 29 and idx2 == 6 then
        if local_player:level() < 40 then
            return false
        end
    end
    if idx1 >= 23 then
        if local_player:level() < 40 then
            if actor_unit.char_combat_power() < 23000 then
                return false
            end
        end
    end
    return true
end

-- 是否支线
function switch_ent.side_task()
    local idx1, idx2 = quest_res.get_main_task_idx()
    if idx1 < 11 then
        return false
    end
    if quest_ent.new_have_can_acc_task() then
        return true
    end

    if quest_ent.new_have_can_acc_entrust_task() then
        return true
    end
    return false
end

-- 是否魔方
function switch_ent.mf_fb()

    local idx1, idx2 = quest_res.get_main_task_idx()
    if idx1 < 17 then
        return false
    end
    if idx1 == 17 and idx2 < 5 then
        return false
    end
    if local_player:level() >= 40 then
        return false
    end
    if local_player:level() < 28 then
        return false
    end
    if dungeon_ent.in_mf_map() then
        return true
    end
    if quest_unit.square_can_enter(0x65) then
        return true
    end

    return false
end

-- 是否秘境峰
function switch_ent.secret_fb()
    if local_player:level() >= 40 then
        return false
    end
    if local_player:level() < 32 then
        return false
    end
    if '秘境峰1层' == actor_unit.map_name() then
        return true
    end
    if secret_ent.check_qualification() then
        return true
    end

    return false
end


-- 是否切换采集
function switch_ent.gather()
    local idx1, idx2 = quest_res.get_main_task_idx()
    if idx1 == 29 and idx2 < 9 then
        return false
    end
    if idx1 < 29 then
        return false
    end
    if local_player:level() < 40 then
        return false
    end
    if transfer_ent.is_warehouse_player() then
        return false
    end
    return true
end

-- 是否切换挂机
function switch_ent.switch_hunt()
    if not transfer_ent.is_warehouse_player() then
        local idx1, idx2 = quest_res.get_main_task_idx()
        if local_player:level() >= 40 then
            if idx1 == 29 and idx2 >= 9 then
                return false
            end
            if local_player:level() >= 40 then
                return false
            end
            if idx1 == 29 and idx2 == 6 then
                if local_player:level() < 40 then
                    return true
                end
            end
        else
            if idx1 >= 23 then
                if actor_unit.char_combat_power() < 23000 then
                    return true
                end
            end
        end
    end
    return true
end


-- 是否切换奇缘
function switch_ent.switch_relation()
    -- 取消奇缘
    if true then
        return false
    end
    local idx1, idx2 = quest_res.get_main_task_idx()
    if idx1 < 20 then
        return false
    end
    if  idx1 == 20 and idx2 < 5 then
        return false
    end
    if not relation_ent.switch_relation() then
        return false
    end
    return true
end

-- 讨伐
function switch_ent.crusade()
    if '地牢' == actor_unit.map_name() then
        return true
    end
    local idx1,idx2 = quest_res.get_main_task_idx()
    if idx1 == 29 and idx2 < 9 then
        return false
    end
    if idx1 < 29 then
        return false
    end
    if local_player:level() < 40 then
        return false
    end
    if transfer_ent.is_warehouse_player() then
        return false
    end
    if actor_unit.char_combat_power() < 20000 then
        return false
    end
    if not team_unit.can_taofa_ticket(0x66) then
        return false
    end


    return true
end


------------------------------------------------------------------------------------
-- [内部] 将对象转换为字符串
--
-- @local
-- @treturn      string                     模块名称
------------------------------------------------------------------------------------
function switch_ent.__tostring()
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
function switch_ent.__newindex(t, k, v)
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
switch_ent.__index = switch_ent

------------------------------------------------------------------------------------
-- [构造] 创建一个新的实例
--
-- @local
-- @tparam       table     args             可选参数，用于初始化新实例
-- @treturn      table                      新创建的实例
------------------------------------------------------------------------------------
function switch_ent:new(args)
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
    return setmetatable(new, switch_ent)
end

-------------------------------------------------------------------------------------
-- 返回实例对象
-------------------------------------------------------------------------------------
return switch_ent:new()

-------------------------------------------------------------------------------------
