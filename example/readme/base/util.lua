--替换原xxmsg函数功能
--old_xxmsg = xxmsg
--xxmsg = function(msg, who)
--    local who = who or "con"
--    if who == "con" then
--        return xxmsg_con(msg)
--    else
--        return xxmsg_ctx(msg)
--    end
--end

--打印信息到控制窗口
function xxmsg_ctx(msg)
    if game_unit.game_status() ~= 400 then
        return main_ctx:set_action(msg)
    end
    local race = local_player:race()
    --xxmsg('race '..race)
    local id_role_show = 1
    local sjob = race .. '>' .. id_role_show
    if race == 0xC then
        sjob = '战>' .. id_role_show
    end
    if race == 0x15 or race == 22 then
        sjob = '法>' .. id_role_show
    end
    if race == 0x1F or race == 32 then
        sjob = '道>' .. id_role_show
    end
    --['..sjob..']
    main_ctx:set_action(os.date("%H") .. '-' .. os.date("%M") .. ':' .. msg)
end

--打印信息到调试窗口
function xxmsg_con(msg, ctx, what)

    --if game_unit.game_status() ~= 400 then
    --    return old_xxmsg(msg)
    --end

    local race = local_player:race()
    --xxmsg('race '..race)
    local id_role_show = 1
    local sjob = race .. '>' .. id_role_show
    if race == 0xC then
        sjob = '战>' .. id_role_show
    end
    if race == 0x15 or race == 22 then
        sjob = '法>' .. id_role_show
    end
    if race == 0x1F or race == 32 then
        sjob = '道>' .. id_role_show
    end

    local what = what or 2
    local debugInfo = debug.getinfo(what)
    if debugInfo ~= nil and not table_is_empty(debugInfo) then
        ctx = ctx or (debugInfo.source or '') .. ' - ' .. (debugInfo.currentline or '') .. ' - ' .. (debugInfo.name or '')
    else
        ctx = 'no context'
    end

    xxmsg(local_player:name() .. ' - ' .. msg .. ' - ' .. "[" .. ctx .. "] ")
end

--- @param t table
function print_table (t)
    local print_r_cache = {}
    local function sub_print_r(t, indent)
        if (print_r_cache[tostring(t)]) then
            xxmsg(indent .. "*" .. tostring(t))
        else
            print_r_cache[tostring(t)] = true
            if (type(t) == "table") then
                for pos, val in pairs(t) do
                    if (type(val) == "table") then
                        xxmsg(indent .. "[" .. pos .. "] => " .. tostring(t) .. " {")
                        sub_print_r(val, indent .. string.rep(" ", string.len(pos) + 8))
                        xxmsg(indent .. string.rep(" ", string.len(pos) + 6) .. "}")
                    elseif (type(val) == "string") then
                        xxmsg(indent .. "[" .. pos .. '] => "' .. val .. '"')
                    else
                        xxmsg(indent .. "[" .. pos .. "] => " .. tostring(val))
                    end
                end
            else
                xxmsg(indent .. tostring(t))
            end
        end
    end
    if (type(t) == "table") then
        --xxmsg(tostring(t) .. " {")
        --util.print_msgMsg(type(t))
        --在控制台中筛选会影响显示效果
        xxmsg(tostring(t) .. " {")
        sub_print_r(t, "  ")
        xxmsg("}")
    else
        sub_print_r(t, "  ")
    end
    --util.print_msgMsg("======")
end



---------------------------------------------------------------------------------
