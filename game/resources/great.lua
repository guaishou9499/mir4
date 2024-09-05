---@class great_re
local great_re = {}
local this = great_re

------------------------------------------------------------------------------------
this.great_list = { '矿山', '铁匠铺', '九头蛇的栖息地', '伟业之塔', '武魂之塔', '千年古树', '次元之门', '胜利之塔' }
------------------------------------------------------------------------------------
------------------------------------------------------------------------------------
function great_re.__tostring()
    return "mir4 pet package"
end

great_re.__index = great_re

function great_re:new(args)
    local new = {}
    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end
    return setmetatable(new, great_re)
end

return great_re:new()