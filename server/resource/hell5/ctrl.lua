--此文件中，凡是可能被多次执行的函数，函数名都要加上地图名前缀

function config(map)
    MapCanSavePos(map, 0) --设置地图是否保存角色位置（地图，坐标，方向），此设置影响该地图的所有副本
    MapCanPK(map, 1) --设置地图是否可以PK，此设置影响该地图的所有副本
    MapCopyNum(map, 1) --设置地图的副本数目，如果不调用该语句，则使用默认值1
    MapCopyStartType(map, 1) --设置地图立即开始
    SingleMapCopyPlyNum(map, 300)   --设置一个副本的玩家数
    MapCanTeam(map , 1)
    MapType ( map , 4 )
end


function get_map_entry_pos_hell5()   --设置入口的位置的坐标（坐标（米））

	local POS_X=55
	local POS_Y=33
	return POS_X , POS_Y

end

function init_entry(map)
    SetMapEntryMapName(map, "hell4") --设置入口的位置（地图名，坐标（米））
    SetMapEntryTime(map, "2007/1/20/0/30", "1/0/0", "0/2/0", "0/2/30") --设置入口的时间，地图对象，首次开启时间（年/月/日/时/分），以后再次开启的间隔（日/时/分，全０表示只有首次开启），每次开启到入口消失的间隔（日/时/分，全０表示永不消失），每次开启到地图关闭的间隔（日/时/分，全０表示永不关闭）。。

end

function after_enter_hell5( role , map_copy )

local cha_name=GetChaDefaultName(role)

	SystemNotice ( role, "<"..cha_name..">Come and join me. I'm hoping to see what a human can grow to become!" ) 

end

function before_leave_hell5 ( role )

end

function map_copy_first_run_hell5( map_copy )



end

function map_copy_run_hell5( map_copy )

--特殊技能发动开始

	local hp = GetChaAttr( AZRAEL[19] , ATTR_HP ) 
	local mxhp = GetChaAttr( AZRAEL[19] , ATTR_MXHP )
	local percent = hp/mxhp
	if percent < 0.9 and SPECIALSKILL[19]==0 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	979, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme: Supreme lord of Illusion, awaken!")
	end

	if percent < 0.8 and SPECIALSKILL[19]==1 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	980, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme:  Flames of the Abyss Demon, burn anew!")
	end
	if percent < 0.7 and SPECIALSKILL[19]==2 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	981, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme: Evil Beast! Rip them to shreds!")
	end
	if percent < 0.6 and SPECIALSKILL[19]==3 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	982, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme: Supremo shield! Guard me from these puny humans!")
	end
	if percent < 0.5 and SPECIALSKILL[19]==4 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	983, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme: Phoenix! Bring your flame of death to these ignorant mortal!")
	end
	if percent < 0.4 and SPECIALSKILL[19]==5 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	984, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme: Despair of the deep, show your power once more!")
	end
	if percent < 0.3 and SPECIALSKILL[19]==6 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	985, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme:  Drakan! Leave the hell of death and listen to my summon!")
	end
	if percent < 0.2 and SPECIALSKILL[19]==7 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	986, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme: Tidal! Get rid of these rubbishs!")
	end
	if percent < 0.1 and SPECIALSKILL[19]==8 then
		local x, y = GetChaPos( AZRAEL[19] )
		CreateCha(	987, x, y, 295, 3600)
		SPECIALSKILL[19] = SPECIALSKILL[19] + 1
		MapCopyNotice ( map_copy ,"Abyss Supreme: My loyal servant! The top warrior of the Abyss! Spread your wings and bring death among the mortals!")
	end

--特殊技能发动结束


	if CheckMonsterDead ( AZRAEL[19] ) == 1 then
		
		if CRY[19]==0 then
			local Notice_all = "Abyss Supreme: Imbecile mortal! Killing me does not change anything! There will always be greed, despair and misery! I will be back one day! Haha!"
			Notice ( Notice_all )
			CRY[19]=1
			BOSSXYSJ[988] = 4	
			BOSSSJSJ[988] = 4	
			BOSSTJSJ[988] = 4	
			BOSSXZSJ[988] = 4	
			BOSSAYSJ[988] = 4
		end
	end

	if CRY[19]==1  then
		
		if HELLCLOSETIME==300 then
	
			MapCopyNotice ( map ,"Goddess: I cannot believe that you made it so far. When I left this world, much anguish amassed and turned into a evil clone of myself, which brought much misery upon humankind. I await a day whereby somebody can remove this clone from the world and get rid of all suffering!")
			MapCopyNotice ( map ,"Goddess: I can finally leave here. Thank you. I will watch over you and we will meet again one day. Grow stronger!")
			MapCopyNotice ( map ,"Goddess: Adventurer, as my mortal body disappear, this place will collapse. Leave while you can!")
			HELLCLOSETIME = HELLCLOSETIME - 240
		end

		local closetime = HELLCLOSETIME
		for i = 1 , MAXNOTICE , 1 do
			if closetime == NOTICETIME[i] then
				local Notice_all = "Warning! Collapse of Eternal Abaddon left "..closetime.." sec(s)! All adventurer prepare to hide"
				MapCopyNotice ( map_copy , Notice_all )
			end
		end
		HELLCLOSETIME = HELLCLOSETIME-1

		if HELLCLOSETIME == 0 then

			HELLCLOSETIME = 300
			CRY[19]=0
			SPECIALSKILL[19] = 0
			CloseMapEntry ( "hell5" )
			CloseMapCopy ( "hell5" )
		end

	end


end

--每5秒执行一次的
function map_run_hell5( map )


end

--地图关闭时执行
function map_copy_close_hell5 ( map_copy )

			HELLCLOSETIME = 300
			CRY[19]=0
			SPECIALSKILL[19] = 0

end
		
--地图开关判断——————————————————————————————————————————

function can_open_entry_hell5( map ) 

--	local time = GetTickCount ( ) 
	local Now_Week = GetNowWeek()
	if Now_Week >5 and Now_Week < 7 then
		return 1
	end

	if Now_Week == 0 then
		return 1
	end
		return 0
end 