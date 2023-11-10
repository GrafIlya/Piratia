--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,1) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 

    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口
    local EntryName = "Abaddon Eternal"
    SetMapEntryEventName( entry, EntryName )
    
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    Notice("Announcement: In the depths of Abaddon 18\"["..posx..","..posy.."]\" is accumulating a form of energy and energy of evil keeps welling out from it!") --通知本组服务器的所有玩家

end

function after_destroy_entry_hell5(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    --Notice("Announcement: Challenge for today has ended.") 

end

function after_player_login_hell5(entry, player_name)

end

--用于检测进入条件
--返回值：0，不满足进入条件。1，成功进入。
function check_can_enter_hell5( role, copy_mgr )

	if CRY[18]==0 then

		SystemNotice(role,"Power of Darkness sealed the entrance to Eternity. It will not open no matter how hard you try.")
		return 0

	end

	return 1

end

function begin_enter_hell5(role, copy_mgr) 
    

		SystemNotice(role,"A strong force pulls you towards the endless darkness. When you open your eyes, you see before you a familiar world.")

		MoveCity(role, "Abaddon 5")
	

end 