old_xxmsg = xxmsg
--todo: local_player:name() 不能取得有效名字
xxmsg = function(msg)
    old_xxmsg("["..local_player:name().."] "..tostring(msg))
end