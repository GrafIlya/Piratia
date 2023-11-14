--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 

    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口
    local EntryName = "Announcement"
    SetMapEntryEventName( entry, EntryName )
    
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    Notice("Announcement: In the depths of Abaddon 8 \"["..posx..","..posy.."]\" opens the portal that leads to Abaddon 9!") --通知本组服务器的所有玩家

end

function after_destroy_entry_hell2(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    --Notice("Announcement: Challenge for today has ended.") 

end

function after_player_login_hell2(entry, player_name)

end

--用于检测进入条件
--返回值：0，不满足进入条件。1，成功进入。
function check_can_enter_hell2( role, copy_mgr )

	local i=0

	for i=5,8,1 do

		if CRY[i] == 0 then

			SystemNotice(role,"The power of Darkness has sealed the gateway. It will be impossible for you to pass.")

			return 0
		end
	end

	return 1


end

function begin_enter_hell2(role, copy_mgr) 
    
		SystemNotice(role,"An unknown gravity pulls you towards the endless darkness. A darker Abaddon awaits you.")

		MoveCity(role, "Abaddon 2")
	

end 