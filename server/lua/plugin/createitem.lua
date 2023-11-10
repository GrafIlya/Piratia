print('Loading override.lua')

function Creat_ItemX(item, item_type, item_lv, item_event) --[[ for subhooks ]]
	return item, item_type, item_lv, item_event
end

function Creat_Item(item, item_type, item_lv, item_event)
	item_event = item_event 
	item_type = item_type 
	item_lv = item_lv 
	Reset_item_add()

	local i = 0
	local Num = 0

	item, item_type, item_lv, item_event = Creat_ItemX(item, item_type, item_lv, item_event)
	-- item attr begin:
	if item_event == NPC_SALE then				Npc_Sale( item_type, item_lv , item_event) 
												SetItemForgeParam_Npc_Sale(item, Num)
	elseif item_event == MONSTER_BAOLIAO then	Monster_Baoliao(item_type, item_lv , item_event)
												SetItemForgeParam_MonsterBaoliao(item, Num)
	elseif item_event == PLAYER_HECHENG then	Player_Hecheng(item_type, item_lv , item_event)
												SetItemForgeParam_PlayerHecheng(item, Num)
	elseif item_event == PLAYER_XSBOX then		Player_XSBox(item_type, item_lv , item_event)
												local Num = GetItemForgeParam(item, 1)
												local Part1 = GetNum_Part1(Num)
												local Part2 = GetNum_Part2(Num)
												local Part3 = GetNum_Part3(Num)
												local Part4 = GetNum_Part4(Num)
												local Part5 = GetNum_Part5(Num)
												local Part6 = GetNum_Part6(Num)
												local Part7 = GetNum_Part7(Num)
												if item_type == 1 then	Part1 = 1
																		Part2 = 1
																		Part3 = 1 end
												if item_type == 2 then	Part1 = 1
																		Part2 = 2
																		Part3 = 1 end
												if item_type == 3 then	Part1 = 1
																		Part2 = 2
																		Part3 = 1 end
												if item_type == 4 then	Part1 = 1
																		Part2 = 3
																		Part3 = 1 end
												if item_type == 7 then	Part1 = 1
																		Part2 = 8
																		Part3 = 1 end
												if item_type == 9 then	Part1 = 1
																		Part2 = 8
																		Part3 = 1 end
												Num = SetNum_Part3(Num, Part3)
												Num = SetNum_Part2(Num, Part2)
												Num = SetNum_Part1(Num, Part1)
												SetItemForgeParam(item, 1, Num)
	elseif item_event == PLAYER_CCFSBOXA then	Player_CCFSBoxA(item_type, item_lv , item_event)
	elseif item_event == PLAYER_CCFSBOXB then	Player_CCFSBoxB(item_type, item_lv , item_event)
	elseif item_event == PLAYER_CCFSBOXC then	Player_CCFSBoxC(item_type, item_lv , item_event)
	elseif item_event == PLAYER_CCFSBOXD then	Player_CCFSBoxD(item_type, item_lv , item_event)
	elseif item_event == PLAYER_CCFSBOXE then	Player_CCFSBoxE(item_type, item_lv , item_event)
	elseif item_event == PLAYER_CCFSBOXF then	Player_CCFSBoxF(item_type, item_lv , item_event)
	elseif item_event == PLAYER_CCFSBOXG then	Player_CCFSBoxG(item_type, item_lv , item_event)
	elseif item_event == PLAYER_CCFSBOXH then	Player_CCFSBoxH(item_type, item_lv , item_event)
	elseif item_event == PLAYER_CCFSBOXI then	Player_CCFSBoxI(item_type, item_lv , item_event)
	elseif item_event == PLAYER_ZSITEM then		Player_ZSitem(item_type, item_lv , item_event)
	elseif item_event == PLAYER_HSSR then		Player_HSSR(item_type, item_lv , item_event)
	elseif item_event == PLAYER_HSSRA then		Player_HSSRA(item_type, item_lv , item_event)
	elseif item_event >= QUEST_AWARD_1 then		Quest_Award(item_type, item_lv , item_event)
												SetItemForgeParam_QuestAward(item, Num, item_event)
	else										item_add.cnt = 0 
	end 
			
	return item_add.cnt,
	item_add.attr[1][1], item_add.attr[1][2],
	item_add.attr[2][1], item_add.attr[2][2], 
	item_add.attr[3][1], item_add.attr[3][2],
	item_add.attr[4][1], item_add.attr[4][2],
	item_add.attr[5][1], item_add.attr[5][2],
	item_add.attr[6][1], item_add.attr[6][2],
	item_add.attr[7][1], item_add.attr[7][2] 
end 