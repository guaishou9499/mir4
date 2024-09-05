--定义一个定时器
local timer = {
    --存储已注册定时器的table
    _list = {},
    --存储当前定时器id
    _id = 0,
}

--每帧调用的函数，检查定时器
function timer.update()
    for i,v in pairs(timer._list) do
        if v.t <= os.time() then
            v.func(v.data)
            timer._list[i] = nil
        end
    end
end

--注册定时器函数
function timer.reg(delay, func, data)
    timer._id = timer._id + 1
    timer._list[timer._id] = {t = os.time() + delay, func = func, data = data}
    return timer._id
end

--删除指定id的定时器
function timer.del(id)
    timer._list[id] = nil
end

return timer

---------------------------------------------------------------------
local timer = require("timer")

function a(arg)
    print("*********", arg)
end

timer.reg(10, a, "hello")
timer.reg(20, a, "world")

for k,v in pairs(timer._list) do
    print (k,v)
end


local sum = 0
for i = 1, 20 do
    for j = 1, 20000 do
        for k = 1, 20000 do
            sum = sum + k
        end
    end
    print("循环进行中", sum )
    timer.update()
end

for k,v in pairs(timer._list) do
    print (k,v)
end