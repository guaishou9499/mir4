local VERSION = '202302'
local AUTHOR_NOTE = '-[202302]-'

---@class template_beha @模板
local template = {
    VERSION        = VERSION,
    AUTHOR_NOTE    = AUTHOR_NOTE,
}

----------------------------属性-----------------------------------------
template.field = 'field'
----------------------------方法-----------------------------------------
---模板方法
---@param param string @参数
---@return boolean @返回结果
function template:method(param)
    return true
end
----------------------------对象-----------------------------------------

function template.__tostring()
    return "mir4 template package"
end

template.__index = template

function template:new(args)
    local new = {}

    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end

    return setmetatable(new, template)
end

return template:new()