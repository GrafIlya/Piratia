--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀，如after_destroy_entry_testpk
--此文件每行最大字符个数为255，若有异议，请与程序探讨

function config_entry(entry) 
    SetMapEntryEntiID(entry, 2492,4) --设置地图入口实体的编号（该编号对应于characterinfo.txt的索引）

end 

function after_create_entry(entry) 
    local copy_mgr = GetMapEntryCopyObj(entry, 0) --创建副本管理对象，此函数在有显式入口的地图中必须调用，对于隐式入口的地图（如队伍挑战）无要调用该接口

    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    Notice("Announcement: Magical Ocean ["..posx..","..posy.."] emerges a portal to [Forsaken City].") --通知本组服务器的所有玩家

end

function after_destroy_entry_abandonedcity(entry)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) 
    Notice("Announcement: Magical Ocean ["..posx..","..posy.."] nearby has ceased. Remember to take note of the announcement!") 

end

function after_player_login_abandonedcity(entry, player_name)
    map_name, posx, posy, tmap_name = GetMapEntryPosInfo(entry) --取地图入口的位置信息（地图名，坐标，目标地图名）
    ChaNotice(player_name, "Announcement: Magical Ocean ["..posx..","..posy.."] emerges a portal to [Forsaken City].") --通知本组服务器的所有玩家

end

--用于检测进入条件
--返回值：0，不满足进入条件。1，成功进入。
function check_can_enter_abandonedcity(role, copy_mgr)

	local Cha = TurnToCha(role)
  
	if Lv(Cha) >=30 and Lv(Cha) <=45 then
	
		local Num
		Num = CheckBagItem(Cha, 1812)
        	
		if Num >= 1 then
			return 1
	
		else
			SystemNotice(role, "Does not possess Ancient Generator.Unable to pass through Portal to Forsaken City")
			return 0
		end
		
	else
		SystemNotice(role, "Characters need to be between Lv 30 to 45 to enter Forsaken City")
		return 0    
	end
end



function begin_enter_abandonedcity(role, copy_mgr) 

	local Cha = TurnToCha(role)	
	local Dbag = 0
	Dbag = DelBagItem(Cha, 1812, 1)

	if Dbag == 1 then
		SystemNotice(role,"Entering [Forsaken City]") 
		MoveCity(role, "Forsaken City")

	else
	
		SystemNotice(role, "Acquire Ancient Generator failed. Unable to pass through Portal to Forsaken City")
	end


end