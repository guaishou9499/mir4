
------------------------------------------------------------------------------------
---@class dungeon_re
local dungeon_re = {}
local this = dungeon_re
this.mf_list = {-- -1534.9700927734【1层】白银之屋Ⅱ【1层】训练之屋Ⅰ
    ['【1层】经验之屋Ⅲ'] = {
        { x = 69809+math.random(1,5)+math.random(), y = 4748+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300110 }, -- 经验之屋III
        { x = 72273+math.random(1,5)+math.random(), y = 5242+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300110 }, -- 经验之屋III
        { x = 70966+math.random(1,5)+math.random(), y = 6997+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300110 }, -- 经验之屋III
        { x = 78195+math.random(1,5)+math.random(), y = 4882+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300110 }, -- 经验之屋III
        { x = 79688+math.random(1,5)+math.random(), y = 7612+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300110 }, -- 经验之屋III
        { x = 81144+math.random(1,5)+math.random(), y = 5086+math.random(1,5)+math.random(), z = -1548+math.random(), map_id = 201300110 }, -- 经验之屋III
        { x = 86699+math.random(1,5)+math.random(), y = 4988+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300110 }, -- 经验之屋III
        { x = 89336+math.random(1,5)+math.random(), y = 5588+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300110 }, -- 经验之屋III
        { x = 88388+math.random(1,5)+math.random(), y = 7254+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300110 }, -- 经验之屋III
    },

    ['【1层】训练之屋Ⅱ'] = {
        { x = 69693+math.random(1,5)+math.random(), y = 4741+math.random(1,5)+math.random(), z = -1541+math.random(), map_id = 201300134 }, -- 训练之屋II
        { x = 70642+math.random(1,5)+math.random(), y = 7604+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300134 }, -- 训练之屋II
        { x = 78248+math.random(1,5)+math.random(), y = 4797+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300134 }, -- 训练之屋II
        { x = 79103+math.random(1,5)+math.random(), y = 7447+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300134 }, -- 训练之屋II
        { x = 80758+math.random(1,5)+math.random(), y = 5437+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300134 }, -- 训练之屋II
        { x = 86610+math.random(1,5)+math.random(), y = 4726+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300134 }, -- 训练之屋II
        { x = 87612+math.random(1,5)+math.random(), y = 7552+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300134 }, -- 训练之屋II
        { x = 89247+math.random(1,5)+math.random(), y = 5596+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300134 }, -- 训练之屋II
    },

   ['【1层】经验之屋Ⅱ'] = {
        { x = 78396+math.random(1,5)+math.random(), y = 5109+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
        { x = 79676+math.random(1,5)+math.random(), y = 7602+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
        { x = 80844+math.random(1,5)+math.random(), y = 5347+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
        { x = 86813+math.random(1,5)+math.random(), y = 5032+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
        { x = 89236+math.random(1,5)+math.random(), y = 4842+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
        { x = 87974+math.random(1,5)+math.random(), y = 7380+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
        { x = 70074+math.random(1,5)+math.random(), y = 5006+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
        { x = 72370+math.random(1,5)+math.random(), y = 4967+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
        { x = 71339+math.random(1,5)+math.random(), y = 7510+math.random(1,5)+math.random(), z = -1534+math.random(), map_id = 201300109 }, -- 经验之屋II
   },

    ['【1层】训练之屋Ⅰ'] = {
        { x = 69531+math.random(1,5)+math.random(), y = 4890+math.random(1,5)+math.random(), z = -1541, map_id = 201300133 }, -- 训练之屋I
        { x = 70926+math.random(1,5)+math.random(), y = 7378+math.random(1,5)+math.random(), z = -1534, map_id = 201300133 }, -- 训练之屋I
        { x = 72298+math.random(1,5)+math.random(), y = 5193+math.random(1,5)+math.random(), z = -1534, map_id = 201300133 }, -- 训练之屋I
        { x = 78241+math.random(1,5)+math.random(), y = 5009+math.random(1,5)+math.random(), z = -1534, map_id = 201300133 }, -- 训练之屋I
        { x = 81005+math.random(1,5)+math.random(), y = 5382+math.random(1,5)+math.random(), z = -1534, map_id = 201300133 }, -- 训练之屋I
        { x = 79623+math.random(1,5)+math.random(), y = 6882+math.random(1,5)+math.random(), z = -1534, map_id = 201300133 }, -- 训练之屋I
        { x = 86524+math.random(1,5)+math.random(), y = 5127+math.random(1,5)+math.random(), z = -1534, map_id = 201300133 }, -- 训练之屋I
        { x = 89081+math.random(1,5)+math.random(), y = 5396+math.random(1,5)+math.random(), z = -1534, map_id = 201300133 }, -- 训练之屋I
        { x = 87829+math.random(1,5)+math.random(), y = 6888+math.random(1,5)+math.random(), z = -1534, map_id = 201300133 }, -- 训练之屋I
    },

    ['【1层】经验之屋Ⅰ'] = {
        { x = 69743+math.random(1,5)+math.random(), y = 4831+math.random(1,5)+math.random(), z = -1534, map_id = 201300108 }, -- 经验之屋I
        { x = 72495+math.random(1,5)+math.random(), y = 5224+math.random(1,5)+math.random(), z = -1534, map_id = 201300108 }, -- 经验之屋I
        { x = 71489+math.random(1,5)+math.random(), y = 7293+math.random(1,5)+math.random(), z = -1534, map_id = 201300108 }, -- 经验之屋I
        { x = 78178+math.random(1,5)+math.random(), y = 4761+math.random(1,5)+math.random(), z = -1534, map_id = 201300108 }, -- 经验之屋I
        { x = 80920+math.random(1,5)+math.random(), y = 5488+math.random(1,5)+math.random(), z = -1534, map_id = 201300108 }, -- 经验之屋I
        { x = 79451+math.random(1,5)+math.random(), y = 7039+math.random(1,5)+math.random(), z = -1534, map_id = 201300108 }, -- 经验之屋I
        { x = 86482+math.random(1,5)+math.random(), y = 4744+math.random(1,5)+math.random(), z = -1541, map_id = 201300108 }, -- 经验之屋I
        { x = 89127+math.random(1,5)+math.random(), y = 5487+math.random(1,5)+math.random(), z = -1534, map_id = 201300108 }, -- 经验之屋I
        { x = 87701+math.random(1,5)+math.random(), y = 7507+math.random(1,5)+math.random(), z = -1534, map_id = 201300108 }, -- 经验之屋I
    }

}
------------------------------------------------------------------------------------
this.mj_list ={
    { x = 3394, y = -2871, z = 35, map_id = 201400001 }, --秘境峰
    { x = 541, y = -8591, z = 66, map_id = 201400001 }, --秘境峰
    { x = -11592, y = -3296, z = 15, map_id = 201400001 }, --秘境峰
    { x = -15946, y = 3172, z = 73, map_id = 201400001 }, --秘境峰
    { x = -9783, y = 7447, z = 161, map_id = 201400001 }, --秘境峰
    { x = 747, y = 8173, z = 12, map_id = 201400001 }, --秘境峰
    { x = -9965, y = 11442, z = 34, map_id = 201400001 }, --秘境峰
    { x = -14366, y = -2402, z = -46, map_id = 201400001 }, --秘境峰
}


------------------------------------------------------------------------------------
function dungeon_re.__tostring()
    return "mir4 ride package"
end

dungeon_re.__index = dungeon_re

function dungeon_re:new(args)
    local new = {}
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    return setmetatable(new, dungeon_re)
end

return dungeon_re:new()