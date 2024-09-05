print("开始测试...")

function a()
    error("测试error",1)
end

function b()
    print("运行功能b")
end

assert(false,"任务出错")
b()
a()

