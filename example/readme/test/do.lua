last_did_time = {}
function do_delay(func, condition, delay, ...)
    local ret_b = false

    local args = { ... }
    if func == nil then
        return
    end

    local cond = true

    local type = type(condition)
    if "function" == type then
        cond = condition()
    elseif "string" == type then
        cond = load(condition)
    elseif "boolean" == type then
        cond = condition
    end

    local startTime = os.time()
    if cond then
        local func_name = tostring(func)

        last_did_time[func_name] = last_did_time[func_name] or 0
        if os.time() - last_did_time[func_name] >= delay then
            print("========")
            ret_b = func(table.unpack(args))
            last_did_time[func_name] = os.time()
        end
    end
    print("功能运行时长为:" .. os.time() - startTime)

    return ret_b
end

function a(loops)
    local sum = 0
    for i = 1, loops do
        for j = 1, 10000 do
            sum = sum + i * j
        end
    end
    print("over")
end

function b()
    local sum = 0
    for i = 1, 10000 do
        for j = 1, 10000 do
            sum = sum + i * j
        end
    end
end

function condition(bool)
    return bool
end


math.randomseed(os.time())
for i = 1, 5 do
    local multi = math.random(3)
    print(multi)
    b()
    do_delay(a, true, 5, 5000 * multi)
    --do_delay(b, true, 0)
end


for k, v in pairs(last_did_time) do
    print(k, v)
end