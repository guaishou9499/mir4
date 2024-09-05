-------------------------------------------------------------------------------------
-- -*- coding: utf-8 -*-
--
-- @author:   core
-- @email:    88888@qq.com 
-- @date:     2021-07-05
-- @module:   example
-- @describe: 示例代码模块
-- @version:  v1.0
--
	-- 购买时空商店物品(ID 可以截取封包获得。。封包解析出来第二个就是ID)
	--shop_unit.buy_shikong_item(id, num)
	-- item_unit.make_item(make_id, num) --制造物品
	-- 合成物品（四个一合的比如精灵，魔石）
	--item_unit.compose(item1_sysid, item2_sysid, item3_sys_id, item4_sysid)
	
	--xxmsg(item_unit.compose(0x88348A431240003, 0x88348A431240003,0x88348A431240003,0x88348A431240003))
	
	-- 召唤物品 nId  精灵 = 0， 武功 =1， 神龙材料 =5 ,  type = 0 1次，  =1 10次
	--item_unit.call_item(nid, type)

--[[	
		guild_unit.set_mode(模式, 战力)  -- 1自动 0审  战力0是默认5000
		guild_unit.create(local_player:name()) -- 创建
		guile_unit.refresh()  -- 刷新信息
		sleep(2500)
		guild_unit.guild_is_full() --自己帮会是否已满 用这前要先刷新帮会信息
		
-- 从上往下1-5
		for i = 1, 5 do 
			local num = mail_unit.get_mail_num_byidx(i)
			xxmsg(string.format('序号：%u    数量：%u', i, num))
			if num > 0 then 
				-- 阅读并领取
				mail_unit.read_mail(i)
				sleep(2000)
				-- 删除邮件
				mail_unit.del_mail(i)
				sleep(1000)
			end

		end
--]]
local VERSION = '20210705' -- version history at end of file
local AUTHOR_NOTE = "-[20210705]-"

---@class example_bak
local example = {  
	VERSION      = VERSION,
	AUTHOR_NOTE  = AUTHOR_NOTE,
}

local this = example

local config_client = import('base/config')

-- test_guild_skill_unit ()
function example:test_guild_skill_unit()
	-- 查询技能信息
	guild_skill_unit.query_skill_info(0x18A89)
	sleep(2000)
	local list = guild_skill_unit.skill_list()
	local guild_skill_obj = guild_skill_unit:new()

	local obj = guild_skill_unit.get_guild_devinfo_data(0x18A89)
	if guild_skill_obj:init(obj) then 
		xxmsg(string.format('obj:%16X   id:%08X    level:%04u    cur_exp:%u    up_level_exp:%u    can_up_level:%-6s   升级剩余时间（= 0 没有在升级中）:%u----升级需要时间:%u      name:%s',
			obj,
			guild_skill_obj:id(),
			guild_skill_obj:level(),
			guild_skill_obj:cur_exp(),
			guild_skill_obj:up_level_exp(),
			guild_skill_obj:can_up_level(),           -- 是否可以升级
			guild_skill_obj:up_level_remain_time(), -- 升级剩余时间 （= 0 没有在升级中）
			guild_skill_obj:up_level_time(),         -- 升级需要时间
			guild_skill_obj:name()
		))

	end
	guild_skill_obj:delete()

	-- 升级门派
	-- guild_skill_unit.up_skill(0x18A91)

	-- 关闭升级门派窗口
	if ui_unit.get_parent_widget('Popup_GuildDevInfo_C' , true) ~= 0 then 
		main_ctx:do_skey(0x1B)
	end
end
------------------------------------------------------------------------------------
-- test_make_res_unit ()
-- item_unit.make_item(make_id, num) --制造物品
function example:test_make_res_unit()

	local make_res_obj = make_res_unit:new()
	local list = make_res_unit.list()
	for i = 1, #list do 
		local obj = list[i]
		if make_res_obj:init(obj) then 
			xxmsg(string.format('--%16X   id:0x%08X   make_id:0x%08X   make_pos_type:%08X  name: %s',
			obj,
			make_res_obj:id(),
			make_res_obj:make_id(),
			make_res_obj:make_pos_type(),    -- 随身制作装备为0x7D0   随身制作材料为0x7D1    青龙装备13EC(所有NPC制作 类装备只有青龙在制)（其他在NPC的制作的材料 可以取封包第二个就是ID手动作成资源）
			make_res_obj:name()
		))

		end

	end


end
-------------------------------------------------------------------------------------
-- test_role_unit
function example:test_role_unit()
	local role_list = role_unit.list()
	xxmsg(#role_list)	
	local role_obj = role_unit:new()	
	for i = 1, #role_list
	do
		local obj = role_list[i]
		if role_obj:init(obj) then
			xxmsg( string.format('%X \t%X \t%04u \t%04u \t%s', 
			obj, 	
			role_obj:id(),
			role_obj:level(),
			role_obj:race(),
			role_obj:name()			
			) 
			)
		end
	end	

	role_obj:delete()	

end
--taofa_type  = 首领 0x65  普通：0x66  taofa_id = 地牢ID 0x65 双门迷宫ID 0x66   黑血僧将 0xC9
function example:遍历讨伐(taofa_type,taofa_id)
	-- 静态函数
	-- 刷新讨伐队伍（taofa_type  = 首领 0x65  普通：0x66）
	-- team_unit.update_team_list(taofa_type)
	-- 是否有讨伐门票 （taofa_type  = 首领 0x65  普通：0x66）
	-- team_unit.can_taofa_ticket(taofa_type)
	-- 申请进入讨伐队伍 
	-- team_unit.join_team(team_id, taofa_type, taofa_id)
	-- 队长开始讨伐
	-- team_unit.start_taofa(taofa_id)
	-- 讨伐完成退出
	-- team_unit.finish_taofa(taofa_type)
	-- 创建讨伐队伍
	-- team_unit.create_taofa(taofa_type, taofa_id)
	-- 取队伍列表
	-- team_unit.party_list(taofa_type, taofa_id)

	-- 动态函数
	-- 队伍ID
	-- team_obj:party_id()
	-- 队伍类型
	-- team_obj：party_tyep()
	-- 讨伐Id
	-- team_obj:taofa_id()
	-- 所需要战力
	-- team_obj:have_combat_power()

	--（taofa_type  = 首领 0x65  普通：0x66）
	team_unit.update_team_list(taofa_type)-- 刷新讨伐队伍（taofa_type  = 首领 0x65  普通：0x66）
	sleep(2000)
	-- 地牢ID 0x65 双门迷宫ID 0x66   黑血僧将 0xC9
	local party_list = team_unit.party_list(taofa_type,taofa_id)
	local team_obj = team_unit:new()
	xxmsg(#party_list)
	for i = 1, #party_list do 
	 	local obj = party_list[i]
	 	if team_obj:init(obj) then 
	 		xxmsg(string.format('obj:%16X  队伍ID:%s  队伍类型:%08X  taofa_id:%08X  所需要战力:%s',
	 		obj,
	 		team_obj:party_id(),
	 		team_obj:party_type(),
	 		team_obj:taofa_id(),
	 		team_obj:have_combat_power()
		
	 	))

	 	end
	end
end
function example:遍历玩家2(dis)
	-- 周边玩家
	local actor_list = actor_unit.list(1)
	--xxmsg(string.format('玩家数量： %u', #actor_list))	
	--红名状态  actor_obj:red_name_status()     大于2 红名
	local actor_obj = actor_unit:new()	
	for i = 1, #actor_list
	do
		local obj = actor_list[i]
		if actor_obj:init(obj) and   actor_obj:dist() < dis then--actor_obj:cx() ~= 0 and
			xxmsg( string.format('--%X %s  0x%X\t %s %-6s  %u  \t%u/%u \t%u/%u \t%f,%f,%f  %f', 
			obj, 
			actor_obj:cls_name(), 
			actor_obj:sys_id(),
			actor_obj:name(),			
			actor_obj:dead(),
			actor_obj:level(),			
			actor_obj:hp(),
			actor_obj:max_hp(),
			actor_obj:mp(),
			actor_obj:max_mp(),				
			actor_obj:cx(),
			actor_obj:cy(),
			actor_obj:cz(),
			actor_obj:dist()			
			) 
			)
		end
	end		
	actor_obj:delete()
end
function example:遍历玩家(v)
	local v_ = 1
	if v ~= nil then
		v_ = v
	end
	--红名状态  actor_obj:red_name_status()     大于2 红名
	local actor_list = actor_unit.list(v_)
	local actor_obj = actor_unit:new()	
	for i = 1, #actor_list
	do
		local obj = actor_list[i]
		if actor_obj:init(obj) and  actor_obj:cx() ~= 0  then-- and  gather_ex.是否需过滤的坐标(actor_obj:cx(),actor_obj:cy(),actor_obj:cz(),actor_unit.map_id())
			xxmsg( string.format('%X %s  %s \t %s %-6s  %u  \t%u/%u \t%u/%u \t%f %f %f  %f', 
			obj, 
			actor_obj:cls_name(), 
			actor_obj:sys_id(),
			actor_obj:name(),			
			actor_obj:dead(),
			actor_obj:level(),			
			actor_obj:hp(),
			actor_obj:max_hp(),
			actor_obj:mp(),
			actor_obj:max_mp(),				
			actor_obj:cx(),
			actor_obj:cy(),
			actor_obj:cz(),
			actor_obj:dist()			
			) 
			)
		end
	end	
	actor_obj:delete()
end
-------------------------------------------------------------------------------------
-- test_actor_unit
function example:test_actor_unit()
	-- 物资读取
	for i = 0, 32 
	do
		local value = actor_unit.get_cost_data(i)
		if value ~= 0 then
			xxmsg(
				string.format('%08X  %u', i, value)		
			)
		end
	end

	-- 周边玩家
	--红名状态  actor_obj:red_name_status()     大于2 红名
	local actor_list = actor_unit.list(1)
	xxmsg(string.format('玩家数量： %u', #actor_list))	
	local actor_obj = actor_unit:new()	
	for i = 1, #actor_list
	do
		local obj = actor_list[i]
		if actor_obj:init(obj) and  actor_obj:cx() ~= 0 then
			xxmsg( string.format('%X %s  %X\t%s %-6s  %u  \t%u/%u \t%u/%u \t%f %f %f  %f', 
			obj, 
			actor_obj:cls_name(), 
			actor_obj:sys_id(),
			actor_obj:name(),			
			actor_obj:dead(),
			actor_obj:level(),			
			actor_obj:hp(),
			actor_obj:max_hp(),
			actor_obj:mp(),
			actor_obj:max_mp(),				
			actor_obj:cx(),
			actor_obj:cy(),
			actor_obj:cz(),
			actor_obj:dist()			
			) 
			)
		end
	end	

	-- 周边NPC
	local actor_list = actor_unit.list(2)
	xxmsg(string.format('NPC数量 %u', #actor_list))
	for i = 1, #actor_list
	do
		local obj = actor_list[i]

		if actor_obj:init(obj) then
			xxmsg( string.format('%X  %X  %s \t%s  %u  \t%f %f %f  %f', 
			obj, 
			actor_obj:res_id(),
			actor_obj:cls_name(), 
			actor_obj:name(),			
			actor_obj:level(),		
			actor_obj:cx(),
			actor_obj:cy(),
			actor_obj:cz(),
			actor_obj:dist()			
			) 
			)
		end
	end	

	-- 周边怪物
	local actor_list = actor_unit.list(3)
	xxmsg(string.format('怪物数量 %u', #actor_list))
	for i = 1, #actor_list
	do
		local obj = actor_list[i]
		if actor_obj:init(obj)  then --and  actor_obj:cx() ~= 0
			xxmsg( string.format('%X %s \t%s %-6s  %u \t%u/%u \t%u/%u \t%f %f %f  %f', 
			obj, 
			actor_obj:cls_name(), 
			actor_obj:name(),			
			actor_obj:dead(),
			actor_obj:level(),
			actor_obj:hp(),
			actor_obj:max_hp(),
			actor_obj:mp(),
			actor_obj:max_mp(),				
			actor_obj:cx(),
			actor_obj:cy(),
			actor_obj:cz(),
			actor_obj:dist()			
			) 
			)
		end
	end	

	-- 采集物品
	local actor_obj = actor_unit:new()
	local actor_list = actor_unit.list(4)
	xxmsg(string.format('矿产数量 %u', #actor_list))	
	for i = 1, #actor_list
	do
		local obj = actor_list[i]
		if actor_obj:init(obj) and  actor_obj:cx() ~= 0 then
			xxmsg( string.format('%X   %X   %s  %04u    %-6s  %-6s  %08X  %08X----%08X   %08X   %02X   %02X   %02X   %02X   %02X   %04X   %04X   %-16s   [%0.2f, %0.2f, %0.2f]   %0.2f --%s', 
			obj, 
			actor_obj:cls_id(),
			actor_obj:cls_name(), 
			actor_obj:gather_item_life(), -- 可采数（大）
			true,
			actor_obj:can_gather(),		  -- 可采集（true）
			actor_obj:gather_player_id(),
			actor_obj:sys_id(),     	  -- 采集时用到的Id (小)
			actor_obj:res_id(),   				
			actor_obj:mine_status(),
			mem_unit.rm_byte(mem_unit.rm_dword64(obj + 0x478) + 0x10),
			mem_unit.rm_byte(mem_unit.rm_dword64(obj + 0x478) + 0x11),
			mem_unit.rm_byte( obj + 0x434 ),
			mem_unit.rm_byte(obj+0x435),
			mem_unit.rm_dword(obj+0x4B8),
			mem_unit.rm_dword(obj+0x438),				
			mem_unit.rm_dword(mem_unit.rm_dword64(obj + 0x10) + 0x38),
			actor_obj:name(),
			actor_obj:cx(),
			actor_obj:cy(),
			actor_obj:cz(),
			actor_obj:dist(),
			actor_obj:has_gather_item_cd()
			) 
			)
		end
	end	
	actor_obj:delete()	

end

-------------------------------------------------------------------------------------
-- test_item_unit
--item_obj:is_bind() --false 可以交易
function example:test_item_unit(itemType)
	if itemType == nil then
		itemType = -1
	end
	local item_list = item_unit.list(itemType)
	xxmsg(#item_list)	
	local item_obj = item_unit:new()	
	for i = 1, #item_list
	do
		local obj = item_list[i]
		if item_obj:init(obj) and item_obj:num() >= 0 then
			xxmsg( string.format('obj:%X sys_id:0x%X quality:%s \t id:0x%08X \t num:%04u \t equip_type:%u  %u  %04u   %-6s\t name:%s  job:%s 是否绑定:%s', 
			obj, 
			item_obj:sys_id(),
			item_obj:quality(),		
			item_obj:id(),
			item_obj:num(),
			item_obj:equip_type(),
			item_obj:equip_enhanced_level(),
			item_obj:equip_combat_power(),
			item_obj:equip_is_use(),
			item_obj:name()	,
			item_obj:equip_job()	,
			item_obj:is_bind()
			) 
			)
		end
	end	

	item_obj:delete()	
end

-------------------------------------------------------------------------------------
-- test_quest_unit ()
function example:test_quest_unit(quest_type)
	local quest_obj = quest_unit:new()
	-- -1 所有任务（不包阔委托），0当前任务，1可接任务 2 委托任务
	local list = quest_unit.list(quest_type)
	xxmsg(string.format('任务总数：%u', #list))

	for i = 1, #list
	do 
		local obj = list[i]
		if quest_obj:init(obj) then 
			xxmsg(string.format('[%16X] ID[%08X] TYPE[%u] DAILYNUM[%u] STATUS[%u] COMBATPOWER[%u]  TRATYPE[%u] TAR[%u-%u] POS[%0.1f-%0.1f-%0.1f] ISOVER[%-6s]  ISFINISH[%-6s]  MAP[%08X-%-20s] NAME[%s]',
			obj,
			quest_obj:id(),
			quest_obj:type(),
			quest_obj:daily_num(),
			quest_obj:status(),
			quest_obj:combat_power(),
			quest_obj:tar_type(),
			quest_obj:tar_num(),
			quest_obj:tar_max_num(),
			quest_obj:tx(),
			quest_obj:ty(),
			quest_obj:tz(),
			quest_obj:is_over(), 
			quest_obj:is_finish(),
			quest_obj:map_id(),
			quest_obj:map_name(),
			 quest_obj:name()
			))
		end

	end
	quest_obj:delete()

	-- 接受任务 
	--quest_unit.accept(quest_id)
	-- 提交任务
	-- quest_unit.up(quest_id))

	-- 主线读取
	-- 主线任务ID 
	-- xxmsg(quest_unit.get_main_quest_id())
	-- 主线任务名称
	-- xxmsg(quest_unit.get_main_quest_name())
	-- 主线任务序号
	-- xxmsg(quest_unit.get_main_quest_idx())
	-- 自动主线
	-- quest_unit.auto_main_quest()

	-- 任务是否是自动
	-- xxmsg(quest_unit.quest_is_auto(questid))
	-- 开启自动任务(1 开0关)
	-- xxmsg(quest_unit.auto(questid, 1))
	-- 任务是否完结（指的是任务列表里完成了）
	-- quest_unit.has_quest_over(questid)
	-- 当前任务是否完成
	-- quest_unit.quest_is_finish(questid)
	-- 任务Id取任务指针(该指针可以直接用作上面的初使化)
	-- quest_unit.get_quest_byid(questid)

end


-------------------------------------------------------------------------------------
-- test_skill_unit ()
-------------------------------------------------------------------------------------
function example:test_skill_unit(sType)
	local skill_obj = skill_unit:new()
	-- 类型 - 1所有技能，0 已学技能
	local list = skill_unit.list(sType)
	xxmsg(string.format('技能数量：%u', #list))
	
	for i = 1, #list
	do 
		local obj = list[i]
		
		if skill_obj:init(obj) then 
			xxmsg(string.format('--[%16X] ID[0x%08X] LEVEL[%u] STUDY[%u] ACTIONNUM[%u]  FIRSTACTION[0x%08X]  NAME[%s] 学习[%s]',
				obj,
				skill_obj:id(),
				skill_obj:level(),
				skill_obj:study_level(),
				skill_obj:action_num(),
            	skill_obj:get_action_byidx(0),
				skill_obj:name(),
				skill_unit.get_study_skill_obj_byid(skill_obj:id())
			))

		end
	end


	skill_obj:delete()

	-- 学习技能
	--skill_unit.study(id)
	-- 升级技能
	-- skill_unit.up(id)

end
function example:遍历魔石()
-- 嵌套魔石 (序号从0开始)
--item_unit.inlay_magic_stone(item_sys_id, idx)
-- 取解锁魔石 孔槽数量
-- item_unit.get_magic_stone_unlocal_slot_num()
-- 取已嵌套魔石 数量
-- item_unit.get_magic_stone_num()
-- 序号取嵌套魔石 ID(0 1 2 3 4 5)
-- item_unit.get_magic_stone_byidx(0-?)
	for i = 0,item_unit.get_magic_stone_unlocal_slot_num() - 1 do
		xxmsg(i..' '..item_unit.get_magic_stone_byidx(i))
	end

end


-------------------------------------------------------------------------------------
-- test_team_unit ()
-------------------------------------------------------------------------------------
function example:test_team_unit()
	local team_obj = team_unit:new()
	local list = team_unit.list()
	xxmsg(#list)
	for i = 1, #list
	do 
		local obj = list[i]
		if team_obj:init(obj) then 
			xxmsg(string.format('[%16X]  ID[%08X] RACE[%u] LEVEL[%u] COMBATPOWER[%u] HP[%u - %u] POS[%0.1f - %0.1f - %0.1f]  ISLEADER[%-6s] MAP[%08X - %s] NAME[%s]',
				obj,
				team_obj:id(),
				team_obj:race(),
				team_obj:level(),
				team_obj:combat_power(),
				team_obj:hp(),
				team_obj:max_hp(),
				team_obj:cx(),
				team_obj:cy(),
				team_obj:cz(),
				team_obj:is_leader(),
				team_obj:map_id(),
				team_obj:map_name(),
				team_obj:name()
		))

		end
	end

	-- 邀请组队
	-- team_unit.invite(player_id)
	-- 接受组队
	-- team_unit.accept(team_id, invite_player_id)
	-- 离开队伍
	-- team_unit.leave()
	-- 解散队伍
	-- team_unit.disband()

	-- 取队伍id
	-- team_unit.team_id()
	-- 是否有组队
	-- team_unit.has_team()
	-- 取队伍人数（包括自己）
	-- team_unit.member_num()
	-- 自己是否为队长
	-- team_unit.hero_is_leader()

		
	team_obj:delete()

end

-------------------------------------------------------------------------------------
-- test_pet_unit ()
-------------------------------------------------------------------------------------
function example:test_pet_unit()
	local pet_obj = pet_unit:new()
	local item_obj = item_unit:new()
	
	local list = pet_unit.list()
	xxmsg('精灵数量：'..#list)
	for i = 1, #list 
	do 	
		local obj = list[i]
		if pet_obj:init(obj) then 
			xxmsg(string.format('[%16X] ID[%08x] ISUNLOCK[%-6s] CANSUMMON[%-6s] NAME[%s]',
				obj,
				pet_obj:id(),
				pet_obj:is_unlock(),    -- 是否解锁
				pet_obj:can_summon(),	-- 是否可召唤
				pet_obj:name()
			))
			
			-- 授予宝物
			local item_list = pet_obj:pet_item_list()
			--xxmsg("授予宝物数:"..#item_list)
			
			for j = 1, #item_list do 
				local obj = item_list[j]
				if item_obj:init(obj) then
					xxmsg( string.format('%16X  %16X  %s  %s', 
					obj, 
					item_obj:sys_id(),
					item_obj:quality(),		
					item_obj:name()			
					) 
					)
				end
				
			end

		end

	end
	
	xxmsg('------------------------------------出战精灵-----------------------------------------')
	for i = 0, 4
	do 
		local obj = pet_unit.get_warpet_obj_byidx(i)
		xxmsg(obj)
		if pet_obj:init(obj) then 
			xxmsg(string.format('[%16X] POS[%u] ID[%08X]  NAME[%s]',
				obj,
				i,
				pet_obj:id(),
				pet_obj:name()
			))
			
			-- 授予宝物
			local item_list = pet_obj:pet_item_list()
			xxmsg("授予宝物数:"..#item_list)
			
			for j = 1, #item_list do 
				local obj = item_list[j]
				if item_obj:init(obj) then
					xxmsg( string.format('%X  %X  %s  %s', 
					obj, 
					item_obj:sys_id(),
					item_obj:quality(),		
					item_obj:name()			
					) 
					)
				end
				
			end
		end
	end

	pet_obj:delete()
	item_obj:delete()
	-- 召唤精灵
	-- pet_unit.summon_pet(id)
	-- 出战精灵(pos 为出战槽pos  0-4)
	-- pet_unit.go_war_pet(id, pos)
	-- 取消出战(pos 为出战槽pos  0-4)
	-- pet_unit.cancel_war_pet(id, pos)
	-- 取出战精灵ID
	-- pie_unit.get_warpet_id_byidx(pos)
	-- 宝物授予
	--pet_unit.grant_item(精灵ID, 物品sysID, pos) -- pos 0开始
	--pet_unit.grant_item(0x2bd, 0xA9A3640312A0002, 1)

end

-------------------------------------------------------------------------------------
-- test_map_unit ()
-------------------------------------------------------------------------------------
function example:test_map_unit()
	local map_obj = map_unit:new()
	-- map_unit.list(map_id) 0 当前地图
	local list = map_unit.list(0)
	for i = 1, #list
	do 
		local obj = list[i]
		if map_obj:init(obj) then 
			xxmsg(string.format('%X  传送ID:%X sys_id:%X  map_name:%s  %0.1f,%0.1f,%0.1f',
				obj,
				map_obj:id(),  -- 传送ID，，和环境里的Id不同
				map_obj:sys_id(), -- 对话Id
				map_obj:name(),
				map_obj:cx(),
				map_obj:cy(),
				map_obj:cz()
		))
		end
	end

	xxmsg('-----------------------------可瞬移地图-------------------------------')
	local teleport_map_num = map_unit.teleport_map_num()
	for i = 0, teleport_map_num - 1
	do 
		xxmsg(string.format('%X   %X   %s',
			map_unit.get_teleport_mapid(i),
			map_unit.get_teleport_id(i),
			map_unit.get_teleport_name(i)

		))
	end



	-- 使用瞬移卷传到NPC
	-- map_unit.teleport(id,false)
	-- 使用瞬移卷传到地图
	-- map_unit.teleport(id,true)
	-- 地图Id取瞬移Id
	-- map_unit.get_teleport_id_by_map_id(map_id)


	map_obj:delete()
end

-------------------------------------------------------------------------------------
-- test_force_unit ()
-------------------------------------------------------------------------------------
function example:test_force_unit()
	-- 内功
	local num = force_unit.get_inner_skill_num()
	for i = 0, num -1
	do 
		local skillid = force_unit.get_inner_skill_id(i)
		xxmsg(string.format('%X   %X  %-6s  %-6s  %s  主等级 %s',
			force_unit.get_inner_skill_obj(i),
			force_unit.get_inner_skill_id(i),
			force_unit.inner_skill_is_study(i),
			force_unit.inner_skill_can_study(i),
			force_unit.get_inner_skill_name(i),
			force_unit.get_inner_level(0xFA1)
		))
		for iii = 0,3 do
			local 当前等级 = force_unit.get_force_child_level(skillid, iii)
			xxmsg('主等级:'..force_unit.get_inner_level(skillid)..' 当前等级:'..当前等级..' 是否可升级:'..string.format('%s',force_unit.force_can_update(skillid, iii)))
		end
	end
	-- 解锁内功
	--force_unit.unlock_inner_skill(id)
	-- 修练内功(序号是几项属性从上往下 0 开始)
	--force_unit.train_inner_skill(id, idx)
	--内功主等级
	 xxmsg(force_unit.get_inner_level(0xFA1))
	 -- 是否答到升级条件（ID   序号  0 - 3）
	 xxmsg(force_unit.force_can_update(0xFA1, 1))
	-- 是否答到升级条件（ID   序号  0 - 3）
	 xxmsg(force_unit.get_force_child_level(0xFA1, 3))
	--force_unit.inner_update(id)  内功升阶
	--force_unit.mastery_update()  体质升阶
	 -- 取体质主等级
	 xxmsg(force_unit.get_mastery_main_level())
end

-------------------------------------------------------------------------------------
-- test_shop_unit ()
-------------------------------------------------------------------------------------
function example:test_shop_unit()
	local shop_obj = shop_unit.new()
	local list = shop_unit.list()
	xxmsg(#list)
	for i = 1, #list
	do
		local obj = list[i]
		if shop_obj:init(obj) then 
			xxmsg(string.format('%X  %X %u %u %s',
				obj,
				shop_obj:id(),
				shop_obj:price(),
				shop_obj:limit_buy_num(),
				shop_obj:name()
			))

		end


	end
	shop_obj:delete()
--shop_unit.sell_item(item_id, 数量)

end
-------------------------------------------------------------------------------------
-- test_relation_unit()
-------------------------------------------------------------------------------------
function example:test_relation_unit()
	local relation_obj = relation_unit:new()
	local list = relation_unit.list()
	xxmsg('奇缘数量：'..#list)

	for i = 1, #list
	do 
		local obj = list[i]
		if relation_obj:init(obj) then 
			xxmsg(string.format('%X   %08X - %08X   %03u  %-6s   %08X - %-16s  %0.1f - %0.1f - %0.1f   %-24s   %24s   %s',
				obj,
				relation_obj:id(),
				relation_obj:sub_id(),
				relation_obj:idx(),
				relation_obj:is_kill_monster(),
				relation_obj:map_id(),
				relation_obj:map_name(),
				relation_obj:tx(),
				relation_obj:ty(),
				relation_obj:tz(),
				relation_obj:main_name(),
				relation_obj:name(),
				relation_obj:desc()
	
		))

		end

	end

end

-------------------------------------------------------------------------------------
-- test_great_unit ()
-------------------------------------------------------------------------------------
function example:test_great_unit()
	local great_obj = great_unit:new()
	local list = great_unit.list()
	for i = 1, #list
	do
		local obj = list[i]
		if great_obj:init(obj) then 
			xxmsg(string.format('obj:%X id:%X - sub_id:%X  level:%u  tar_num:%u  tar_build_num:%u  can_update:%-6s  name:%s 正在升级:%-6s 升级完成:%-6s',
			obj,
			great_obj:id(),
			great_obj:sub_id(),
			great_obj:level(),
			great_obj:tar_num(),
			great_obj:tar_build_num(),
			great_obj:can_update(),
			great_obj:name(),
			great_obj:is_updating(),
			great_obj:is_finish_update()
			))


			local tar_num = great_obj:tar_num()
			for i = 0, tar_num - 1
			do 
				xxmsg(string.format(' 成就目标:%u tar_id:%X  tar_is_finish:%s tar_name:%s',
				i,
				great_obj:tar_id(i),
				great_obj:tar_is_finish(i),
				great_obj:tar_name(i)
				))
			end

			
			local tar_build_num = great_obj:tar_build_num()
			for i = 0, tar_build_num - 1
			do 
				xxmsg(string.format(' 建筑目标:%u tar_build_id:%X - tar_build_main_id:%X  tar_build_need_level:%u  build_meet_requirements:%s  tar_build_name:%s',
				i,
				great_obj:tar_build_id(i),
				great_obj:tar_build_main_id(i),
				great_obj:tar_build_need_level(i),
				great_obj:build_meet_requirements(i),
				great_obj:tar_build_name(i)
				))
			end

		end

	end
	great_obj:delete()
end

function example:读取交易行出售信息()
	auction_unit.refresh_sell_item()
	sleep(2000)
	--xxmsg(auction_unit.get_auction_sell_num())
	for i = 0,auction_unit.get_auction_sell_num() - 1 do
		local name = auction_unit.get_sell_item_name(i)
		local id = auction_unit.get_sell_id(i)
		local num = auction_unit.get_item_num(i)
		local status = auction_unit.get_item_sell_status(i)
		local 总价 = auction_unit.get_sell_price(i)
		local 结算 = auction_unit.get_result_price(i)
		xxmsg('名:'..name..' id:'..id..' 数:'..num..' 状态:'..status ..' 总价:'..总价..' 结算:'..结算)
		
	end
end
-------------------------------------------------------------------------------------
-- test_guild_unit ()
-------------------------------------------------------------------------------------
function example:test_guild_unit()
	local guild_obj = guild_unit:new()
	local list = guild_unit.guild_list()
	for i = 1, #list
	do
		local obj = list[i]
		if guild_obj:init(obj) then 
			xxmsg(string.format('%X  %X  %u  %u - %u  %u  %-6s  %s',
				obj,
				guild_obj:id(),
				guild_obj:mode(),
				guild_obj:member_num(),
				guild_obj:max_member_num(),
				guild_obj:need_combat_power(),
				guild_obj:is_full(),
				guild_obj:name()
		))

		end
	end
	guild_obj:delete()
--guild_unit.guild_support()
 --guild_unit.guild_assist(0x18a89)
end
-- test_all
function example:test_all()
	--this:test_loadfile()
	--this:test_redis()
	--this:test_json_unit()
	--this:test_pet_unit()
	--this:test_skill_unit()
	--this:test_state_unit()
	--this:test_misc()
	--this:test_item_unit()
	--this:test_cha_unit()
	--this:test_ui_unit()
	--this:test_config_unit()
	--this:test_golbal_var()
	--this:test_find_monster()
	
end
function example:遍历黑铁(sTime)
	local actor_list = actor_unit.list(4)
	local actor_obj = actor_unit:new()	
	local nMapId = actor_unit.map_id()
	for i = 1, #actor_list
	do
		if not decider.is_working() then
			break
		end
		local obj = actor_list[i]
		if actor_obj:init(obj) and  string.find(actor_obj:name(),'黑铁_') ~= nil and actor_obj:cx() ~= 0  then
			local doGaPos = true
			--过滤 黑铁怪物的坐标
			local ret_RR = gather_ex.ActiorBlackFe_List() --黑铁怪物的坐标
			if not table_is_empty(ret_RR) then
				for ii = 1,#ret_RR do
					if math.floor(ret_RR[ii][1]) == math.floor(actor_obj:cx()) and math.floor(ret_RR[ii][2]) == math.floor(actor_obj:cy()) then
						doGaPos = false
						--xxmsg('读取到怪物黑铁')
						break
					end
				end
			end
			--过滤 手动添加的 坐标 gather_ex.NotDoGather
			if not table_is_empty(gather_ex.NotDoGather) then
				for ii = 1,#gather_ex.NotDoGather do
					local cix = math.floor(gather_ex.NotDoGather[ii][1])
					local ciy = math.floor(gather_ex.NotDoGather[ii][2])
					--local ciz = math.floor(gather_ex.NotDoGather[ii][3])
					local cmapid = math.floor(gather_ex.NotDoGather[ii][4])
					if cix == math.floor(actor_obj:cx()) and ciy == math.floor(actor_obj:cy()) and cmapid == nMapId then
						--xxmsg('')
						doGaPos = false
						break
					end
				end
			end
			if example.notDoGatherPos == nil then
				example.notDoGatherPos = {}
			end
			if actor_obj:can_gather() and actor_obj:gather_player_id() == 0 and doGaPos then
--[[				xxmsg( string.format('obj:%X [cls_id]%X [cls_name]%s [name]%s [can_gather]%s\t[gather_player_id]%X\t[sys_id]%08X [res_id]%08X\t %f,%f,%f    [dist]%f', 
				obj, 
				actor_obj:cls_id(),
				actor_obj:cls_name(), 
				actor_obj:name(),
				actor_obj:can_gather(),
				actor_obj:gather_player_id(),
				actor_obj:sys_id(),     -- 采集时用到的Id
				actor_obj:res_id(),   				
				actor_obj:cx(),
				actor_obj:cy(),
				actor_obj:cz(),
				actor_obj:dist()
				) 
				)--]]
				local yesFast = true
				for iii = 1,#example.notDoGatherPos do
					local xi = example.notDoGatherPos[iii][1]
					local yi = example.notDoGatherPos[iii][2]
					local zi = example.notDoGatherPos[iii][3]
					if xi == cx and yi == cy and zi == cz then
						yesFast = false
						break
					end
				end
				if yesFast then
					if not local_player:dead() then
						ShowMsg('瞬移遍历黑铁中-'..i)
						actor_unit.fast_move(actor_obj:cx(), actor_obj:cy(), actor_obj:cz())
						table.insert(example.notDoGatherPos,{actor_obj:cx(), actor_obj:cy(), actor_obj:cz()})	
						sleep(sTime*1000)
						if local_player:dead() then 
							xxmsg('{'..actor_obj:cx()..','..actor_obj:cy()..','..actor_obj:cz()..'},')
							break
						end
					end
				end
			end
		end
	end	
	if not local_player:dead() then
		ShowMsg('瞬移遍历黑铁完成')
	end
	actor_obj:delete()			
end
function example:遍历怪物()
	local T = {}
	while decider.is_working() do
		local actor_obj = actor_unit:new()
		local actor_list = actor_unit.list(3)
		local c = 0
		local actor_obj = actor_unit:new()	
		if #T > 0 then
		--	xxmsg('共有'..#T..'个')
		end
		for i = 1, #actor_list
		do
			local obj = actor_list[i]
			if actor_obj:init(obj) and  actor_obj:cx() ~= 0 then
				--if string.find(actor_obj:name(),'真气') ~= nil or string.find(actor_obj:name(),'野草') ~= nil or string.find(actor_obj:name(),'矿石') ~= nil then
					local yesInsert = true
					for ii = 1,#T do
						if T[ii].obj == obj and T[ii].sys_id == actor_obj:sys_id() then
							yesInsert = false
							break
						end
					end
					
					if yesInsert then
						local ret = {}
						ret.obj = obj
						ret.name = actor_obj:name()
						ret.sys_id = actor_obj:sys_id()
						ret.cx = actor_obj:cx()
						ret.cy = actor_obj:cy()
						ret.cz = actor_obj:cz()
						ret.dist = actor_obj:dist()
						ret.level = actor_obj:level()
						table.insert(T,ret)
					end
				--end
			end
		end	
		actor_obj:delete()
	end
	xxmsg('共有'..#T..'个')
	for i = 1,#T do
		xxmsg( string.format('obj:%s name:%s sys_id:%s  POS:%s,%s,%s dis:%s lv:%s ', 
			T[i].obj, 
			T[i].name,
			T[i].sys_id, 
			T[i].cx,     	  -- 采集时用到的Id
			T[i].cy,   				
			T[i].cz,
			T[i].dist,
			T[i].level)
		)
	end
end
function example:遍历黑铁3(是否可采,count)
	local T = {}
	while decider.is_working() do
		local actor_obj = actor_unit:new()
		local actor_list = actor_unit.list(4)
		local c = 0
		local actor_obj = actor_unit:new()	
		if #T > 0 then
		--	xxmsg('共有'..#T..'个')
		end
		for i = 1, #actor_list
		do
			local obj = actor_list[i]
			if actor_obj:init(obj) and  actor_obj:cx() ~= 0 and string.find(actor_obj:name(),'黑铁_') ~= nil then
				local yesInsert = true
				for ii = 1,#T do
					if T[ii].obj == obj and T[ii].sys_id == actor_obj:sys_id() then
						yesInsert = false
						break
					end
				end
				if 是否可采 ~= nil then
					if actor_obj:can_gather() ~= 是否可采 then
						yesInsert = false
					end
				end
					
				if yesInsert then
					local ret = {}
					ret.obj = obj
					ret.name = actor_obj:name()
					ret.gather_player_id = actor_obj:gather_player_id()
					ret.sys_id = actor_obj:sys_id()
					ret.res_id = actor_obj:res_id()
					ret.gather_item_life = actor_obj:gather_item_life()
					ret.gather_item_maxlife = actor_obj:gather_item_maxlife()
					ret.can_gather = actor_obj:can_gather()
					ret.cx = actor_obj:cx()
					ret.cy = actor_obj:cy()
					ret.cz = actor_obj:cz()
					ret.dist = actor_obj:dist()
					ret.playNums = gather_ex.GetPlayerNumsByXY_R(actor_obj:cx(),actor_obj:cy(),500)
					ret.isWhite = gather_ex.IsWhitePlayGatherByPos(actor_obj:sys_id())
					ret.whitePlayNum = gather_ex.GetPlayerNumsByXY_R_White(actor_obj:cx(),actor_obj:cy(),500)
					local player_obj = actor.get_player_obj(actor_obj:gather_player_id())
					ret.playlv = player_obj.level
					ret.playname = player_obj.name
					table.insert(T,ret)
				end
			end
		end	
		actor_obj:delete()
		if count == 1 then
			break
		end
	end
	xxmsg('共有'..#T..'个')
	for i = 1,#T do
		xxmsg( string.format('obj:%s name:%s sys_id:%s  gather_item_life:%s gather_item_maxlife:%s gather_player_id:%s 是否可采%s  POS:%s,%s,%s dis:%s 人数:%s 白名单:%s 是否白名单:%s 等级:%s 名:%s', 
			T[i].obj, 
			T[i].name,
			T[i].sys_id, 
			T[i].gather_item_life, -- 可采数
			T[i].gather_item_maxlife,
			T[i].gather_player_id,		  -- 可采集
			T[i].can_gather,
			T[i].cx,     	  -- 采集时用到的Id
			T[i].cy,   				
			T[i].cz,
			T[i].dist,
			T[i].playNums,
			T[i].whitePlayNum,
			T[i].isWhite,
			T[i].playlv,
			T[i].playname)
		)
	end
end
function example:遍历黑铁2(dist)
-- 采集物品
	local actor_obj = actor_unit:new()
	local actor_list = actor_unit.list(4)
	local c = 0
	local actor_obj = actor_unit:new()	
	for i = 1, #actor_list
	do
		local obj = actor_list[i]
		if actor_obj:init(obj) and  actor_obj:cx() ~= 0 and actor_obj:dist() < dist and string.find(actor_obj:name(),'黑铁_') ~= nil then
			c = c + 1
			xxmsg( string.format('%X   %X   %s  %04u    %-6s  是否可采%-6s  %08X  %08X----%08X   %08X   %02X   %02X   %02X   %02X   %02X   %04X   %04X   %-16s   [%0.2f, %0.2f, %0.2f]   %0.2f', 
			obj, 
			actor_obj:cls_id(),
			actor_obj:cls_name(), 
			actor_obj:gather_item_life(), -- 可采数
			actor_obj:can_moveto(),
			actor_obj:can_gather(),		  -- 可采集
			actor_obj:gather_player_id(),
			actor_obj:sys_id(),     	  -- 采集时用到的Id
			actor_obj:res_id(),   				
			actor_obj:mine_status(),
			mem_unit.rm_byte(mem_unit.rm_dword64(obj + 0x478) + 0x10),
			mem_unit.rm_byte(mem_unit.rm_dword64(obj + 0x478) + 0x11),
			mem_unit.rm_byte( obj + 0x434 ),
			mem_unit.rm_byte(obj+0x435),
			mem_unit.rm_dword(obj+0x4B8),
			mem_unit.rm_dword(obj+0x438),				
			mem_unit.rm_dword(mem_unit.rm_dword64(obj + 0x10) + 0x38),
			actor_obj:name(),
			actor_obj:cx(),
			actor_obj:cy(),
			actor_obj:cz(),
			actor_obj:dist()
			) 
			)
		end
	end	
	xxmsg(string.format('矿产数量 %u', c))	
	actor_obj:delete()
end
function example:test_blackFe_info(canGather)
	-- 采集物品
	if test_pos_ADD == nil then
		test_pos_ADD = {}
	end
	local actor_list = actor_unit.list(4)
	--xxmsg(string.format('黑铁数量 %u', #actor_list))	
	local actor_obj = actor_unit:new()	
	for i = 1, #actor_list
	do
		local obj = actor_list[i]
		local R = false
		local canGa = actor_obj:can_gather()
		
		if canGather then
			if actor_obj:gather_player_id() == 0 and canGa == canGather then
				R = true
			end
		else
			R = true
		end
		if actor_obj:init(obj) and  actor_obj:cx() ~= 0 and string.find(actor_obj:name(),'黑铁_') and R then
			--table.insert(test_pos_ADD,{})
			xxmsg( string.format('%X  %X   %s  %s  %s\t%X\t%08X %08X\t %f,%f,%f-dis:%f', 
			obj, 
			actor_obj:cls_id(),
			actor_obj:cls_name(), 
			actor_obj:name(),
			canGa,
			actor_obj:gather_player_id(),
			actor_obj:sys_id(),     -- 采集时用到的Id
			actor_obj:res_id(),   				
			actor_obj:cx(),
			actor_obj:cy(),
			actor_obj:cz(),
			actor_obj:dist()
			) 
			)
		end
	end	
end
-------------------------------------------------------------------------------------
-- 实例化新对象

function example.__tostring()
    return "mir4 example package"
 end

example.__index = example

function example:new(args)
   local new = { }

   if args then
      for key, val in pairs(args) do
         new[key] = val
      end
   end

   -- 设置元表
   return setmetatable(new, example)
end

-------------------------------------------------------------------------------------
-- 返回对象
return example:new()

-------------------------------------------------------------------------------------