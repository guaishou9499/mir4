local VERSION = "2023/2/13"
local AUTHOR_NOTE = "Administrator"

---@class test @test
local test = {
    VERSION = VERSION,
    AUTHOR_NOTE = AUTHOR_NOTE,
}

local this = test
----------------------------属性-----------------------------------------
-------------------------------------------------------------------------
local show_unit = function(obj)
    if obj == local_player then
        return print_table(getmetatable(obj))
    end
    for k, v in pairs(obj) do
        xxmsg(k .. ' ' .. tostring(v))
    end
end

local login = function()
    local login = import("game/entities/login")
    login.in_game()
end

local move = function()
    local move = import("game/entities/move")
    --actor_unit.move_to(6753, 38, 469, actor_unit.map_id())
    --move.move_to(-3481.9692382812,-7991.83984375,3746.1799316406,101003010.0)
    --sleep(10000)
    --move.fast_move(-4481.9692382812,-17991.83984375,3746.1799316406,101003010.0)
    move.move_to(-4268.08, -8358.53, 618.89, 101001010)

end

local shop = function()
    local shop = import("game/entities/shop")
    shop.buy_item("瞬移卷轴", 1)
end

local do_quest = function()
    local quest = import("game/entities/quest")
    quest.do_quest_by_name("丹鹰的护卫部队")
end

local pet = function()
    local pet = import("game/entities/pet")
    pet.set_pet()
end

local item = function()
    local item = import("game/entities/item")
    --item.open_reward_box()
end

local quest = function()
    local quest_module = import("game/entities/quest")
    local quest = import("game/entities/side_quest")
    --quest.set_quick_slot()
    --local task_info = quest.get_cur_side_quest_info()
    --example:test_quest_unit(1)
    --example:test_actor_unit()
    --quest.do_side_task(2)
    quest.back_to_ground()
    --quest.set_idle_state()
    --quest.gather_best_in_side_quest("矿石",task_info)
    --example:test_quest_unit(2)
    --local infos = quest.get_quest_info("", 2, 0, "name")
    --print_t(infos)
    --local info = quest_module.get_delegate_quest_info()
    --print_t(info)
    --quest.do_delegate_quest()
    --quest.do_delegate_quest_by_name("厌烦的传闻")
    --example:test_actor_unit()
end

local actor = function()
    local actor = import("game/entities/actor")
    --actor.get_revival_exp()
    xxmsg("免费" .. revival_unit.get_free_reviva_num())
    xxmsg("数量" .. revival_unit.get_exp_num())
    xxmsg("经验" .. revival_unit.get_exp(1))
end

local config = function()
    local config = import("game/entities/config")
    if config.connect_redis() then
        local list = { 1, 2, 3, { 4, 5 }, 6 }
        config.set_data_by_path("aa", list)
    end
end

local relation = function()
    --example.test_relation_unit()
    xxmsg("=="..relation_unit.get_under_way_idx(0xC418))
    xxmsg("=="..relation_unit.get_under_way_idx(0xD228))
end

local equip = function()
    local equip = import("game/entities/equip")
    equip.up_equip()
end
----------------------------方法-----------------------------------------
--调试函数
this.test = function()
    --equip()
    --relation()
    --example:test_actor_unit(4)
    --config()
    --actor()
    --example:test_quest_unit(1)
    --example:test_actor_unit()
    --actor_unit.set_auto_type(-1)
    --item()
    --show_unit(actor_unit)
    --print_t(item_unit)
    --move()
    --example.test_item_unit()
    --shop()
    --do_quest()
    --pet()
    --main_ctx:do_skey(0x20)
    --sleep(3000)
    --actor_unit.move_to(2938, 10640, 584.618164, 101001010)
    --sleep(2000)
    --main_ctx:do_skey(0x20)
    sleep(100000)

end


----------------------------对象-----------------------------------------

function test.__tostring()
    return "mir4 test package"
end

test.__index = test

function test:new(args)
    local new = {}

    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end

    return setmetatable(new, test)
end

return test:new()