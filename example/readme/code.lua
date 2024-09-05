local VERSION = '202302'
local AUTHOR_NOTE = '-[202302]-'

---@class code_readme @模板
local code = {
    VERSION = VERSION,
    AUTHOR_NOTE = AUTHOR_NOTE,
}

----------------------------属性-----------------------------------------
code.field = 'field'
----------------------------方法-----------------------------------------
---通过角色名字分类获取obj、info(...) 弃用 怀疑与科技冲突
function code:get_by_name(name, type, ...)
    local ret_t = {}
    local arg = { ... }

    local list = actor_unit.list(type)
    local obj = actor_unit:new()

    for i = 1, #list do
        local o = list[i]
        if obj:init(o) then
            if obj:name() == name then
                ret_t.obj = o
                for j = 1, #arg do
                    ret_t[arg[j]] = obj[arg[j]](obj)
                end
                break
            end
        end
    end

    obj:delete()

    return ret_t
end

function code:get_by_name_ex(name, type, ...)
    local ret_t = {}
    local arg = { ... }

    local list = actor_unit.list(type)

    for i = 1, #list do
        local o = list[i]
        if actor_ctx:init(o) then
            if actor_ctx:name() == name then
                ret_t.obj = o
                for j = 1, #arg do
                    ret_t[arg[j]] = actor_ctx[arg[j]](actor_ctx)
                end
                break
            end
        end
    end

    return ret_t
end

---根据类型和过滤条件，返回指定的属性值
---@param n_type number @类型
---@param filter function @过滤条件
---@return table @返回列表
function code:actor_get(n_type, filter, ...)
    local ret_t = {}
    local arg = { ... }

    local list = actor_unit.list(n_type)
    --local obj = actor_unit:new()

    for i = 1, #list do
        local o = list[i]
        --if obj:init(o) then
        if actor_ctx:init(o) then
            if type(filter) == 'function' and filter() or filter == nil then
                ret_t.obj = o
                for j = 1, #arg do
                    ret_t[arg[j]] = actor_ctx[arg[j]](actor_ctx)
                end
                break
            end
        end
    end

    --obj:delete()

    return ret_t
end

----------------------------对象-----------------------------------------

function code.__tostring()
    return "mir4 code package"
end

code.__index = code

function code:new(args)
    local new = {}

    if args then
        for key, val in pairs(args) do
            new[key] = val
        end
    end

    return setmetatable(new, code)
end

return code:new()