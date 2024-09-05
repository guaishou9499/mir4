---@class actor_re
local actor_re = {}
local this = actor_re
------------------------------------------------------------------------------------
this.npc_list = {
    ['雪兰'] = { id = 0x29B92AF2, x = 1812+math.random(1,5)+math.random(), y = 249+math.random(1,5)+math.random(), z = 1040+math.random(1,5)+math.random(), map_id = 101005020 },
    ['杨振方'] = { id = 0x88BC, x = -4369+math.random(1,5)+math.random(), y = -8380+math.random(1,5)+math.random(), z = 584+math.random(1,5)+math.random(), map_id = 101001010 },
    ['徐文锦'] = { id = 0x2B82FE0A, x = 2018+math.random(1,5)+math.random(), y = -8373+math.random(1,5)+math.random(), z = 584+math.random(1,5)+math.random(), map_id = 101001010 },
    ['在元'] = { id = 0xDAC, x = -2861+math.random(1,5)+math.random(), y = 16455+math.random(1,5)+math.random(), z = 2776+math.random(1,5)+math.random(), map_id = 101003010 },
    ['木山'] = { id = 0x2B82FE09, x = -202+math.random(1,5)+math.random(), y = 17564+math.random(1,5)+math.random(), z = 2807+math.random(1,5)+math.random(), map_id = 101003010 },
    ['秋药东'] = { id = 0x29B92AEE, x = -16534+math.random(1,5)+math.random(), y = 10784+math.random(1,5)+math.random(), z = 992+math.random(1,5)+math.random(), map_id = 200022021 },
    ['丹里世允'] = { id = 0x88BF, x = 10163+math.random(1,5)+math.random(), y = -5447+math.random(1,5)+math.random(), z = 639+math.random(1,5)+math.random(), map_id = 103003010 },
    ['陈良宇'] = { id = 0x2B82F63A, x = -5890+math.random(1,5)+math.random(), y = 9930+math.random(1,5)+math.random(), z = -535+math.random(1,5)+math.random(), map_id = 103003010 },
    ['墨宪'] = { id = 0x2B82FE0D, x = -2303+math.random(1,5)+math.random(), y = 7597+math.random(1,5)+math.random(), z = -567+math.random(1,5)+math.random(), map_id = 103003010 },
    ['大夫'] = { id = 0x35F1382C, x = 11060+math.random(1,5)+math.random(), y = 12752+math.random(1,5)+math.random(), z = 95+math.random(1,5)+math.random(), map_id = 201400001 },
}
------------------------------------------------------------------------------------
function actor_re.__tostring()
    return "mir4 pet package"
end

actor_re.__index = actor_re

function actor_re:new(args)
    local new = {}
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    return setmetatable(new, actor_re)
end

return actor_re:new()
