------------------------------------------------------------
-- NPCScript02.lua Created by BT 2004.12.29.
--
-- L.38 -> Line 38
------------------------------------------------------------
-- L.20   [ 杀怪任务：白银武将的请托 ]
-- L.289  [ RandMapList ] L.245 [ 白银 ] L.362 [ 沙岚 ] L.422 [ 雷霆 ] L.482 [ 冰狼 ] L.542 [ 岛屿 ] L.612 [ 通用 ]
-- L.682  [ 小山车的妻子 ]
--
--
--
--
--
--
--
--
--
--
------------------------------------------------------------
-- 杀怪任务：白银武将的请托
------------------------------------------------------------

print( "Loading NPCScript02.lua" )


------------------------------------------------------------
-- 通用传送脚本
------------------------------------------------------------

function GoToWhere()

	--取消传送返回选择传送地点的对话内容和页面编号
	local ReSelectTalk = "I need to reconsider..."
	local ReSelectPage = 1

	--取消传送和退出传送的对话和页面编号
	local CancelSelectTalk = "Forget it...I will stay here"
	local CancelSelectPage = 2

	--地图名称信息
	local CurMapName1 = "garner"
	local CurMapName2 = "magicsea"
	local CurMapName3 = "eastgoaf"
	local CurMapName4 = "lonetower"
	local CurMapName5 = "darkblue"

	--白银之城坐标
	local GoTo01X = 2231
	local GoTo01Y = 2788
	local GoTo01M = CurMapName1

	--沙岚之城坐标
	local GoTo02X = 890
	local GoTo02Y = 3575
	local GoTo02M = CurMapName2

	--雷霆堡坐标
	local GoTo03X = 735
	local GoTo03Y = 1590
	local GoTo03M = CurMapName1

	--冰狼堡坐标
	local GoTo04X = 1318
	local GoTo04Y = 510
	local GoTo04M = CurMapName5

	--卡尔加德坐标
	local GoTo05X = 633
	local GoTo05Y = 2100
	local GoTo05M = CurMapName1

	--赖安森林坐标
	local GoTo06X = 1007
	local GoTo06Y = 2966
	local GoTo06M = CurMapName1

	--岛屿3号坐标
	local GoTo07X = 1507
	local GoTo07Y = 2039
	local GoTo07M = CurMapName1

	--岛屿8号坐标
	local GoTo08X = 1711
	local GoTo08Y = 3448
	local GoTo08M = CurMapName1

	--岛屿2号坐标
	local GoTo09X = 2501
	local GoTo09Y = 2997
	local GoTo09M = CurMapName1

	--岛屿5号坐标
	local GoTo10X = 3197
	local GoTo10Y = 1254
	local GoTo10M = CurMapName1

	Talk( 1, "Jovial: Hi! I am the Teleporter! How may I help you?" )
	Text( 1, "Go to Shaitan City!", JumpPage, 5 )
	--Text( 1, "Go to Thundoria Castle!", JumpPage, 6 )
	Text( 1, "Go to Icicle City!", JumpPage, 7 )
	Text( 1, "Record Spawn point", JumpPage, 24 )
	--Text( 1, "Go to Forsanken City!", JumpPage, 8 )
	--Text( 1, "I want to roam the islands!", JumpPage, 3 )

	Talk( 2, "Remember to look for me if you need teleportation services", CloseTalk )

--	Talk( 3, "Want to teleports to which island?" )
--	Text( 3, "Island No. 1", JumpPage, 9 )
--	Text( 3, "Island No. 2", JumpPage, 10 )
--	Text( 3, "Island No. 3", JumpPage, 11 )
--	Text( 3, "Island No. 4", JumpPage, 12 )
--	Text( 3, "Island No. 5", JumpPage, 13 )
--	Text( 3, "Anyone please", JumpPage, 14 )

	
	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 2, JumpPage, 23 )
	Talk( 4, "Teleports to Argent City? No problem! Please pay 500G. Free for players Lv 10 and below!" )
	Text( 4, "Teleport",MultiTrigger, GetMultiTrigger(), 2 ) 
	Text( 4, CancelSelectTalk, JumpPage , CancelSelectPage )


	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2,  GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 2, JumpPage, 23 )
	Talk( 5, "I just love Shaitan City! Please pay 500G! Players Lv 10 and below free of charge!" )
	Text( 5, "Teleport",MultiTrigger, GetMultiTrigger(), 2)
	Text( 5, CancelSelectTalk, JumpPage , CancelSelectPage )


	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo03X, GoTo03Y, GoTo03M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2,  GoTo, GoTo03X, GoTo03Y, GoTo03M )
	TriggerFailure( 2, JumpPage, 23 )
	Talk( 6, "Teleports to Thundoria Castle? No problem! Please pay 500G! Players Lv 10 and below free!" )
	Text( 6, "Teleport",MultiTrigger, GetMultiTrigger(), 2 )
	Text( 6, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerFailure( 2, JumpPage, 23 )
	Talk( 7, "Teleport to Icicle City? No problem! Please pay 500G! Players Lv 10 and below free!" )
	Text( 7, "Teleport",MultiTrigger, GetMultiTrigger(), 2)
	Text( 7, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo05X, GoTo05Y, GoTo05M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2, GoTo, GoTo05X, GoTo05Y, GoTo05M )
	TriggerFailure( 2, JumpPage, 23 )
	Talk( 8, "Teleports to Chaldea Haven? No problem! Please pay 500G! Players Lv 10 and below free!" )
	Text( 8, "Teleport",MultiTrigger, GetMultiTrigger(), 2)
	Text( 8, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, LvCheck, "<", 11 )
	TriggerAction( 1, GoTo, GoTo06X, GoTo06Y, GoTo06M )
	TriggerCondition( 2, HasMoney, 500 )
	TriggerAction( 2, TakeMoney, 500 )
	TriggerAction( 2, GoTo, GoTo06X, GoTo06Y, GoTo06M )
	TriggerFailure( 2, JumpPage, 23 )
	Talk( 9, "Teleport to Andes Forest Haven? No problem! Please pay 500G! Players Lv 10 and below free!" )
	Text( 9, "Teleport",MultiTrigger, GetMultiTrigger(), 2)
	Text( 9, CancelSelectTalk, JumpPage , CancelSelectPage )

--	Talk( 10, "I heard that those islands are beautiful, enjoy!" )
--	Text( 10, "Teleporting...Free of charge temporary", GoTo, GoTo07X, GoTo07Y, GoTo07M )
--	Text( 10, CancelSelectTalk, JumpPage , CancelSelectPage )
--
--	Talk( 11, "I heard that those islands are beautiful, enjoy!" )
--	Text( 11, "Teleporting...Free of charge temporary", GoTo, GoTo08X, GoTo08Y, GoTo08M )
--	Text( 11, CancelSelectTalk, JumpPage , CancelSelectPage )
--
--	Talk( 12, "I heard that those islands are beautiful, enjoy!" )
--	Text( 12, "Teleporting...Free of charge temporary", GoTo, GoTo09X, GoTo09Y, GoTo09M )
--	Text( 12, CancelSelectTalk, JumpPage , CancelSelectPage )
----
--	Talk( 13, "I heard that those islands are beautiful, enjoy!" )
--	Text( 13, "Teleporting...Free of charge temporary", GoTo, GoTo10X, GoTo10Y, GoTo10M )
--	Text( 13, CancelSelectTalk, JumpPage , CancelSelectPage )
--
--	InitFuncList()
--
--	AddFuncList( GoTo, GoTo06X, GoTo06Y, GoTo06M )
--	AddFuncList( GoTo, GoTo07X, GoTo07Y, GoTo07M )
--	AddFuncList( GoTo, GoTo08X, GoTo08Y, GoTo08M )
--	AddFuncList( GoTo, GoTo09X, GoTo09Y, GoTo09M )
--	AddFuncList( GoTo, GoTo10X, GoTo10Y, GoTo10M )
--
--	Talk( 14, "Teleports to any island? I will send you to anyplace then." )
--	Text( 14, "Teleporting...Free of charge temporary", RandFunction, GetFuncList(), GetNumFunc() )
--	Text( 14, CancelSelectTalk, JumpPage , CancelSelectPage )
--

	Talk( 18, "May: Hi! I am the Teleporter! How may I help you?" )
	Text( 18, "Go to Argent City!", JumpPage, 4 )
	--Text( 18, "Go to Thundoria Castle!", JumpPage, 6 )
	Text( 18, "Go to Icicle City!", JumpPage, 7 )
	Text( 18, "Record Spawn point", JumpPage, 25 )
	--Text( 18, "Go to Forsanken City!", JumpPage, 8 )
	--Text( 18, "I want to roam the islands!", JumpPage, 3 )

	Talk( 19, "Sarah: Hi! I am Thundoria Teleporter. Where do you wish to go?" )
	Text( 19, "Go to Argent City!", JumpPage, 4 )
	Text( 19, "Go to Shaitan City!", JumpPage, 5 )
	Text( 19, "Go to Icicle City!", JumpPage, 7 )
	Text( 19, "Record Spawn point", JumpPage, 26 )

	Talk( 20, "Helen: Hi! I am Icicle Teleporter. Where are you headed?" )
	Text( 20, "Go to Argent City!", JumpPage, 4 )
	Text( 20, "Go to Shaitan City!", JumpPage, 5 )
	Text( 20, "Record Spawn point", JumpPage, 27 )


	--Talk( 21, "Mabel: Hi, I am the teleporter. Do you need any help?" )
	--Text( 21, "Go to Argent City!", JumpPage, 4 )
	--Text( 21, "Go to Shaitan City!", JumpPage, 5 )
	--Text( 21, "Go to Icicle City!", JumpPage, 7 )
	--Text( 21, "Record Spawn point", JumpPage, 31 )

	--Talk( 22, "Wendy: Hi! I am the teleporter of Andes Forest Haven. Where do you wish to go?" )
	--Text( 22, "Go to Argent City!", JumpPage, 4 )
	--Text( 22, "Go to Shaitan City!", JumpPage, 5 )
	--Text( 22, "Go to Icicle City!", JumpPage, 7 )
	--Text( 22, "Record Spawn point", JumpPage, 32 )

	Talk( 23, "Sorry! You do not have enough gold to teleport." )

	Talk( 24, "Jovial: Record in Argent City? Is that correct?" )
	Text( 24, "Yes. Please record.", SetSpawnPos, "Argent City" )
	Text( 24, "No, thank you",CloseTalk )

	Talk( 25, "May: Record in Shaitan? Is that right?" )
	Text( 25, "Yes. Please record.", SetSpawnPos, "Shaitan City" )
	Text( 25, "No, thank you",CloseTalk )

	Talk( 26, "Sarah: Record in Thundoria? Is that correct?" )
	Text( 26, "Yes. Please record.", SetSpawnPos, "Thundoria Castle" )
	Text( 26, "No, thank you",CloseTalk )

	Talk( 27, "Helen: Record spawn point in Icicle Castle?" )
	Text( 27, "Yes. Please record.", SetSpawnPos, "Icicle Castle" )
	Text( 27, "No, thank you",CloseTalk )

	Talk( 28, "Arena Administrator: Hi, I am the PK island Arena Administrator. Where do you wish to go?" )
	Text( 28, "Return to city!", JumpPage, 29 )
	Text( 28, "No, thank you",CloseTalk )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	--TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerAction( 1, SetPkState, 0 )
	TriggerAction( 1, MoveCity, "" )
	TriggerFailure( 1, JumpPage, 30 )
	Talk( 29, "You wish to return to town? There is a 2000G penalty for cowards who escaped. Do you still wish to return?" )
	Text( 29, "Yes. I will pay 2000G. Let me go",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 29, "No, thank you" )

	Talk( 30, "Want to escape but no gold? Sorry, if you do not pay 2000G, you will have to fight till the end." )

	Talk( 31, "Mabel: Record at Chaldea Haven? Is that correct?" )
	Text( 31, "Yes. Please record.", SetSpawnPos, "Chaldea Haven" )
	Text( 31, "No, thank you",CloseTalk )

	Talk( 32, "Wendy: Want to record at Andes Forest Haven? Is that correct?" )
	Text( 32, "Yes. Please record.", SetSpawnPos, "Andes Forest Haven" )
	Text( 32, "No, thank you",CloseTalk )



	InitTrigger()

	TriggerCondition( 1, IsMapNpc, "garner", 0 )
	TriggerAction( 1, JumpPage, 1 )

	TriggerCondition( 2, IsMapNpc, "magicsea", 0 )
	TriggerAction( 2, JumpPage, 18 )

	TriggerCondition( 3, IsMapNpc, "garner", 43 )
	TriggerAction( 3, JumpPage, 19 )

	TriggerCondition( 4, IsMapNpc, "darkblue", 12 )
	TriggerAction( 4, JumpPage, 20 )

	TriggerCondition( 5, IsMapNpc, "darkblue", 15 )
	TriggerAction( 5, JumpPage, 28 )

	--TriggerCondition( 6, IsMapNpc, "garner", 55 )
	--TriggerAction( 6, JumpPage, 21 )

	--TriggerCondition( 7, IsMapNpc, "garner", 56 )
	--TriggerAction( 7, JumpPage, 22 )

	--TriggerCondition( 9, IsMapNpc, "Ascaron", 8 )
	--TriggerAction( 9, JumpPage, 22 )

	--TriggerCondition( 10, IsMapNpc, "Ascaron", 9 )
	--TriggerAction( 10, JumpPage, 22 )

	--TriggerCondition( 11, IsMapNpc, "Ascaron", 27 )
	--TriggerAction( 11, JumpPage, 21 )

	Start( GetMultiTrigger(), 5 )

end




------------------------------------------------------------
-- 补给站传送脚本
------------------------------------------------------------

function transmittal()

	--取消传送返回选择传送地点的对话内容和页面编号
	--local ReSelectTalk = "I need to reconsider..."
	--local ReSelectPage = 1

	--取消传送和退出传送的对话和页面编号
	local CancelSelectTalk = "Forget it...I will stay here"
	local CancelSelectPage = 27

	--地图名称信息
	local CurMapName1 = "garner"
	local CurMapName2 = "magicsea"
	local CurMapName3 = "eastgoaf"
	local CurMapName4 = "lonetower"
	local CurMapName5 = "darkblue"

	--废矿补给站
	local GoTo01X = 1903
	local GoTo01Y = 2807
	local GoTo01M = CurMapName1

	--古里咯利补给站
	local GoTo02X = 1517
	local GoTo02Y = 3091
	local GoTo02M = CurMapName1

	--瓦尔诺补给站
	local GoTo03X = 1120
	local GoTo03Y = 2773
	local GoTo03M = CurMapName1

	--温那补给站
	local GoTo04X = 535
	local GoTo04Y = 2433
	local GoTo04M = CurMapName1

	--卡尔加德坐标
	local GoTo05X = 633
	local GoTo05Y = 2100
	local GoTo05M = CurMapName1

	--赖安森林坐标
	local GoTo06X = 1007
	local GoTo06Y = 2966
	local GoTo06M = CurMapName1

	--沙泉补给站
	local GoTo07X = 787
	local GoTo07Y = 3121
	local GoTo07M = CurMapName2

	--巴布补给站
	local GoTo08X = 1214
	local GoTo08Y = 3203
	local GoTo08M = CurMapName2

	--冰都补给站
	local GoTo09X = 807
	local GoTo09Y = 360
	local GoTo09M = CurMapName5

	--阿兰比斯补给站
	local GoTo10X = 1050
	local GoTo10Y = 656
	local GoTo10M = CurMapName5

	--骷髅营地补给站
	local GoTo11X = 2146
	local GoTo11Y = 542
	local GoTo11M = CurMapName5

	--冰极补给站
	local GoTo12X = 2681
	local GoTo12Y = 647
	local GoTo12M = CurMapName5

	Talk( 1, "Meiya: Hi! I am the Teleporter. How can I help you?" )
	Text( 1, "Go to Rockery Haven!", JumpPage, 14 )
	Text( 1, "Record Spawn point", JumpPage, 25 )		--废矿补给站
	
	Talk( 2, "Felicia: Hi! I am Teleporter Felicia! How can I help you?" )
	Text( 2, "Go to Abandon Mine Haven!", JumpPage, 13 )
	Text( 2, "Go to Andes Forest Haven!", JumpPage, 18 )
	Text( 2, "Record Spawn point", JumpPage, 25 )		--古里咯利补给站

	Talk( 3, "Wendy: Hi! I am the teleporter! Can I help you?" )
	Text( 3, "Go to Valhalla Haven!", JumpPage, 15 )
	Text( 3, "Go to Rockery Haven!", JumpPage, 14 )
	Text( 3, "Record Spawn point", JumpPage, 25 )		--赖安森林补给站

	Talk( 4, "Elizabeth: Hi! I am the Teleporter! How may I help you?" )
	Text( 4, "Go to Solace Haven!", JumpPage, 16 )
	Text( 4, "Go to Andes Forest Haven!", JumpPage, 18 )
	Text( 4, "Record Spawn point", JumpPage, 25 )		--瓦尔诺补给站

	Talk( 5, "Meila: Hi! I am the Teleporter. How can I help you?" )
	Text( 5, "Go to Chaldea Haven!", JumpPage, 17 )
	Text( 5, "Go to Valhalla Haven!", JumpPage, 15 )
	Text( 5, "Record Spawn point", JumpPage, 25 )		--温拿补给站

	Talk( 6, "Mabel: Hi! I am Island Teleporter Mabel. Anything I can help you with?" )
	Text( 6, "Go to Solace Haven!", JumpPage, 16 )
	Text( 6, "Record Spawn point", JumpPage, 25 )		--卡尔加德补给站

	Talk( 7, "Aina: Hi! I am the Teleporter! How may I help you?" )
	Text( 7, "Go to Babul Haven!", JumpPage, 20 )
	Text( 7, "Record Spawn point", JumpPage, 25 )		--沙泉补给站

	Talk( 8, "Berlin: Hi! I am Teleporter Berlin. How can I help you?" )
	Text( 8, "Go to Oasis Haven!", JumpPage, 19 )
	Text( 8, "Record Spawn point", JumpPage, 25 )		--巴布补给站

	Talk( 9, "Lily: Hi! I am Teleporter Lily. How can I help you?" )
	Text( 9, "Go to Atlantis Haven!", JumpPage, 22 )
	Text( 9, "Record Spawn point", JumpPage, 25 )		--冰都补给站

	Talk( 10, "Sofia: Hi, I am the teleporter. Do you need any help?" )
	Text( 10, "Go to Skeleton Haven!", JumpPage, 23 )
	Text( 10, "Go to Icicle Haven!", JumpPage, 21 )
	Text( 10, "Record Spawn point", JumpPage, 25 )		--阿兰比斯补给站

	Talk( 11, "Mina: Hi, I am the teleporter. Do you need any help?" )
	Text( 11, "Go to Icespire Haven!", JumpPage, 24 )
	Text( 11, "Go to Atlantis Haven!", JumpPage, 22 )
	Text( 11, "Record Spawn point", JumpPage, 25 )		--骷髅营地补给站

	Talk( 12, "Artemis: Hi! I am the Teleporter! How may I help you?" )
	Text( 12, "Go to Skeleton Haven!", JumpPage, 23 )
	Text( 12, "Record Spawn point", JumpPage, 25 )		--冰极补给站
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 13, "Teleport to Abandon Mine Haven? No problem! Please pay 200G!" )
	Text( 13, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 13, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 14, "Teleport to Rockery Haven? No problem! Please pay 200G!" )
	Text( 14, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 14, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo03X, GoTo03Y, GoTo03M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 15, "Teleports to Valhalla Haven? No problem! Please pay 200G. Thanks!" )
	Text( 15, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 15, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 16, "Teleport to Solace Haven? No problem! Please pay 200G!" )
	Text( 16, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 16, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo05X, GoTo05Y, GoTo05M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 17, "Teleports to Chaldea Haven? No problem! Please pay 200G! Thank you!" )
	Text( 17, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 17, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo06X, GoTo06Y, GoTo06M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 18, "Teleport to Andes Forest Haven? No problem! Please pay 200G!" )
	Text( 18, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 18, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo07X, GoTo07Y, GoTo07M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 19, "Teleports to Oasis Haven? No problem! Please pay 200G. Thanks!" )
	Text( 19, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 19, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo08X, GoTo08Y, GoTo08M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 20, "Teleports to Babul Haven? No problem! Please pay 200G!" )
	Text( 20, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 20, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo09X, GoTo09Y, GoTo09M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 21, "Teleports to Icicle Haven? No problem! Please pay 200G. Thanks!" )
	Text( 21, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 21, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo10X, GoTo10Y, GoTo10M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 22, "Teleport to Atlantis Haven? No problem! Please pay 200G!" )
	Text( 22, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 22, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo11X, GoTo11Y, GoTo11M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 23, "Teleports to Skeleton Haven? No problem! Please pay 200G. Thanks!" )
	Text( 23, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 23, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 200 )
	TriggerAction( 1, TakeMoney, 200 )
	TriggerAction( 1, GoTo, GoTo12X, GoTo12Y, GoTo12M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 24, "Teleports to Icespire Haven? No problem! Please pay 200G. Thanks!" )
	Text( 24, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 24, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, IsMapNpc, "garner", 96 )
	TriggerAction( 1, SetSpawnPos, "Abandon Mine Haven")
	TriggerCondition( 2, IsMapNpc, "garner", 94 )
	TriggerAction( 2, SetSpawnPos, "Rockery Haven")
	TriggerCondition( 3, IsMapNpc, "garner", 95 )
	TriggerAction( 3, SetSpawnPos, "Valhalla Haven")
	TriggerCondition( 4, IsMapNpc, "garner", 97 )
	TriggerAction( 4, SetSpawnPos, "Solace Haven")
	TriggerCondition( 5, IsMapNpc, "garner", 55 )
	TriggerAction( 5, SetSpawnPos, "Chaldea Haven")
	TriggerCondition( 6, IsMapNpc, "garner", 56 )
	TriggerAction( 6, SetSpawnPos, "Andes Forest Haven")
	TriggerCondition( 7, IsMapNpc, "magicsea", 50 )
	TriggerAction( 7, SetSpawnPos, "Oasis Haven")
	TriggerCondition( 8, IsMapNpc, "magicsea", 46 )
	TriggerAction( 8, SetSpawnPos, "Babul Haven")
	TriggerCondition( 9, IsMapNpc, "darkblue", 56 )
	TriggerAction( 9, SetSpawnPos, "Icicle Haven")
	TriggerCondition( 10, IsMapNpc, "darkblue", 42 )
	TriggerAction( 10, SetSpawnPos, "Atlantis Haven")
	TriggerCondition( 11, IsMapNpc, "darkblue", 46 )
	TriggerAction( 11, SetSpawnPos, "Skeleton Haven")
	TriggerCondition( 12, IsMapNpc, "darkblue", 51 )
	TriggerAction( 12, SetSpawnPos, "Icespire Haven")
	TriggerFailure( 12, JumpPage, 28 )
	Talk( 25, "Do you wish to record here?" )
	Text( 25, "Yes. Please record.", MultiTrigger, GetMultiTrigger(), 12 )
	Text( 25, "No, thank you",CloseTalk )

	Talk( 26, "Sorry! You do not have enough gold to teleport." )

	Talk( 27, "Remember to look for me if you need teleportation services", CloseTalk )

	Talk( 28, "Error, unable to record, Call Robin", CloseTalk )
	
	InitTrigger()
	TriggerCondition( 1, IsMapNpc, "garner", 96 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, IsMapNpc, "garner", 94 )
	TriggerAction( 2, JumpPage, 2 )
	TriggerCondition( 3, IsMapNpc, "garner", 95 )
	TriggerAction( 3, JumpPage, 4 )
	TriggerCondition( 4, IsMapNpc, "garner", 97 )
	TriggerAction( 4, JumpPage, 5 )
	TriggerCondition( 5, IsMapNpc, "garner", 55 )
	TriggerAction( 5, JumpPage, 6 )
	TriggerCondition( 6, IsMapNpc, "garner", 56 )
	TriggerAction( 6, JumpPage, 3 )
	TriggerCondition( 7, IsMapNpc, "magicsea", 50 )
	TriggerAction( 7, JumpPage, 7 )
	TriggerCondition( 8, IsMapNpc, "magicsea", 46 )
	TriggerAction( 8, JumpPage, 8 )
	TriggerCondition( 9, IsMapNpc, "darkblue", 56 )
	TriggerAction( 9, JumpPage, 9 )
	TriggerCondition( 10, IsMapNpc, "darkblue", 42 )
	TriggerAction( 10, JumpPage, 10 )
	TriggerCondition( 11, IsMapNpc, "darkblue", 46 )
	TriggerAction( 11, JumpPage, 11 )
	TriggerCondition( 12, IsMapNpc, "darkblue", 51 )
	TriggerAction( 12, JumpPage, 12 )
	Start( GetMultiTrigger(), 12 )

end



------------------------------------------------------------
-- 岛屿传送脚本
------------------------------------------------------------

function island()

	--取消传送返回选择传送地点的对话内容和页面编号
	--local ReSelectTalk = "I need to reconsider..."
	--local ReSelectPage = 1

	--取消传送和退出传送的对话和页面编号
	local CancelSelectTalk = "Forget it...I will stay here"
	local CancelSelectPage = 27

	--地图名称信息
	local CurMapName1 = "garner"
	local CurMapName2 = "magicsea"
	local CurMapName3 = "eastgoaf"
	local CurMapName4 = "lonetower"
	local CurMapName5 = "darkblue"

	--海风岛
	local GoTo01X = 3260
	local GoTo01Y = 3280
	local GoTo01M = CurMapName1

	--碎冰岛
	local GoTo02X = 2273
	local GoTo02Y = 1122
	local GoTo02M = CurMapName1

	--雪贼岛
	local GoTo03X = 3590
	local GoTo03Y = 755
	local GoTo03M = CurMapName1

	--冰雪岛
	local GoTo04X = 2376
	local GoTo04Y = 725
	local GoTo04M = CurMapName2

	--鸣沙岛
	local GoTo05X = 1730
	local GoTo05Y = 3775
	local GoTo05M = CurMapName2

	--真爱岛
	local GoTo06X = 2529
	local GoTo06Y = 2406
	local GoTo06M = CurMapName2

	--好运岛
	local GoTo07X = 1631
	local GoTo07Y = 1974
	local GoTo07M = CurMapName5

	--白银城
	local GoTo08X = 2231
	local GoTo08Y = 2788
	local GoTo08M = CurMapName1

	Talk( 1, "Silvius: Hi! I am Island Teleporter Silvius. Anything I can help you with?" )
	Text( 1, "Go to Zephyr Isle!", JumpPage, 14 )
	Text( 1, "Go to Glacier Isle!", JumpPage, 15 )
	Text( 1, "Go to Outlaw Isle!", JumpPage, 16 )
	Text( 1, "Go to Isle of Chill!", JumpPage, 17 )
	Text( 1, "Go to Canary Isle!", JumpPage, 18 )
	Text( 1, "Go to Cupid Isle!", JumpPage, 19 )
	Text( 1, "Go to Isle of Fortune!", JumpPage, 20 )
	Text( 1, "Record Spawn point", JumpPage, 25 )		--白银城
	
	Talk( 2, "Andrea: Hi! I am Island Teleporter Andrea. How can I help you?" )
	Text( 2, "Go to Argent City!", JumpPage, 21 )
	Text( 2, "Go to Glacier Isle!", JumpPage, 15 )
	Text( 2, "Go to Outlaw Isle!", JumpPage, 16 )
	Text( 2, "Go to Isle of Chill!", JumpPage, 17 )
	Text( 2, "Go to Canary Isle!", JumpPage, 18 )
	Text( 2, "Go to Cupid Isle!", JumpPage, 19 )
	Text( 2, "Go to Isle of Fortune!", JumpPage, 20 )
	Text( 2, "Record Spawn point", JumpPage, 25 )		--海风岛

	Talk( 3, "Arsene: Hi! I am the Island Teleporter. How can I help you?" )
	Text( 3, "Go to Argent City!", JumpPage, 21 )
	Text( 3, "Go to Zephyr Isle!", JumpPage, 14 )
	Text( 3, "Go to Outlaw Isle!", JumpPage, 16 )
	Text( 3, "Go to Isle of Chill!", JumpPage, 17 )
	Text( 3, "Go to Canary Isle!", JumpPage, 18 )
	Text( 3, "Go to Cupid Isle!", JumpPage, 19 )
	Text( 3, "Go to Isle of Fortune!", JumpPage, 20 )
	Text( 3, "Record Spawn point", JumpPage, 25 )	--碎冰岛

	Talk( 4, "Shayala: Hi! I am Island Teleporter Shayala. How can I help you?" )
	Text( 4, "Go to Argent City!", JumpPage, 21 )
	Text( 4, "Go to Zephyr Isle!", JumpPage, 14 )
	Text( 4, "Go to Glacier Isle!", JumpPage, 15 )
	Text( 4, "Go to Isle of Chill!", JumpPage, 17 )
	Text( 4, "Go to Canary Isle!", JumpPage, 18 )
	Text( 4, "Go to Cupid Isle!", JumpPage, 19 )
	Text( 4, "Go to Isle of Fortune!", JumpPage, 20 )
	Text( 4, "Record Spawn point", JumpPage, 25 )          ---雪贼岛

	Talk( 5, "Julie: Hi, I am the island teleporter! How can I help you?" )
	Text( 5, "Go to Argent City!", JumpPage, 21 )
	Text( 5, "Go to Zephyr Isle!", JumpPage, 14 )
	Text( 5, "Go to Glacier Isle!", JumpPage, 15 )
	Text( 5, "Go to Outlaw Isle!", JumpPage, 16 )
	Text( 5, "Go to Canary Isle!", JumpPage, 18 )
	Text( 5, "Go to Cupid Isle!", JumpPage, 19 )
	Text( 5, "Go to Isle of Fortune!", JumpPage, 20 )
	Text( 5, "Record Spawn point", JumpPage, 25 )          ---冰雪岛

	Talk( 6, "Winnie: Hi! I am the Island Teleporter. How can I help you?" )
	Text( 6, "Go to Argent City!", JumpPage, 21 )
	Text( 6, "Go to Zephyr Isle!", JumpPage, 14 )
	Text( 6, "Go to Glacier Isle!", JumpPage, 15 )
	Text( 6, "Go to Outlaw Isle!", JumpPage, 16 )
	Text( 6, "Go to Isle of Chill!", JumpPage, 17 )
	Text( 6, "Go to Cupid Isle!", JumpPage, 19 )
	Text( 6, "Go to Isle of Fortune!", JumpPage, 20 )
	Text( 6, "Record Spawn point", JumpPage, 25 )          ---鸣沙岛

	Talk( 7, "Wanda: Hi! I am Island Teleporter Wanda. How can I help you?" )
	Text( 7, "Go to Argent City!", JumpPage, 21 )
	Text( 7, "Go to Zephyr Isle!", JumpPage, 14 )
	Text( 7, "Go to Glacier Isle!", JumpPage, 15 )
	Text( 7, "Go to Outlaw Isle!", JumpPage, 16 )
	Text( 7, "Go to Isle of Chill!", JumpPage, 17 )
	Text( 7, "Go to Canary Isle!", JumpPage, 18 )
	Text( 7, "Go to Isle of Fortune!", JumpPage, 20 )
	Text( 7, "Record Spawn point", JumpPage, 25 )          ---真爱岛

	Talk( 8, "Juliet: Hi, I am the island teleporter! How can I help you?" )
	Text( 8, "Go to Argent City!", JumpPage, 21 )
	Text( 8, "Go to Zephyr Isle!", JumpPage, 14 )
	Text( 8, "Go to Glacier Isle!", JumpPage, 15 )
	Text( 8, "Go to Outlaw Isle!", JumpPage, 16 )
	Text( 8, "Go to Isle of Chill!", JumpPage, 17 )
	Text( 8, "Go to Canary Isle!", JumpPage, 18 )
	Text( 8, "Go to Cupid Isle!", JumpPage, 19 )
	Text( 8, "Record Spawn point", JumpPage, 25 )          ---好运岛

	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo01X, GoTo01Y, GoTo01M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 14, "Teleport to Zephyr Isle? No problem! Please pay 2000G!" )
	Text( 14, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 14, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo02X, GoTo02Y, GoTo02M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 15, "Teleport to Glacier Isle? No problem! Please pay 2000G!" )
	Text( 15, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 15, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo03X, GoTo03Y, GoTo03M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 16, "Teleport to Outlaw Isle? No problem! Please pay 2000G!" )
	Text( 16, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 16, CancelSelectTalk, JumpPage , CancelSelectPage )
	
	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo04X, GoTo04Y, GoTo04M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 17, "Teleports to Isle of Chill? No problem! Please pay 2000G!" )
	Text( 17, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 17, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo05X, GoTo05Y, GoTo05M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 18, "Teleport to Canary Isle? No problem! Please pay 2000G!" )
	Text( 18, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 18, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo06X, GoTo06Y, GoTo06M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 19, "Going to Cupid Isle? No problem! Please pay 2000G!" )
	Text( 19, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 19, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo07X, GoTo07Y, GoTo07M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 20, "Teleport to Isle of Fortune? No problem! Please pay 2000G!" )
	Text( 20, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 20, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, HasMoney, 2000 )
	TriggerAction( 1, TakeMoney, 2000 )
	TriggerAction( 1, GoTo, GoTo08X, GoTo08Y, GoTo08M )
	TriggerFailure( 1, JumpPage, 26 )
	Talk( 21, "Teleport to Argent City? No problem! Please pay 2000G!" )
	Text( 21, "Teleport",MultiTrigger, GetMultiTrigger(), 1 ) 
	Text( 21, CancelSelectTalk, JumpPage , CancelSelectPage )

	InitTrigger()
	TriggerCondition( 1, IsMapNpc, "garner", 123 )
	TriggerAction( 1, SetSpawnPos, "Argent City")
	TriggerCondition( 2, IsMapNpc, "garner", 124 )
	TriggerAction( 2, SetSpawnPos, "Zephyr Isle")
	TriggerCondition( 3, IsMapNpc, "garner", 125 )
	TriggerAction( 3, SetSpawnPos, "Glacier Isle")
	TriggerCondition( 4, IsMapNpc, "garner", 126 )
	TriggerAction( 4, SetSpawnPos, "Outlaw Isle")
	TriggerCondition( 5, IsMapNpc, "magicsea", 69 )
	TriggerAction( 5, SetSpawnPos, "Isle of Chill")
	TriggerCondition( 6, IsMapNpc, "magicsea", 70)
	TriggerAction( 6, SetSpawnPos, "Canary Isle")
	TriggerCondition( 7, IsMapNpc, "magicsea", 71 )
	TriggerAction( 7, SetSpawnPos, "Cupid Isle")
	TriggerCondition( 8, IsMapNpc, "darkblue", 65 )
	TriggerAction( 8, SetSpawnPos, "Isle of Fortune")
	TriggerFailure( 8, JumpPage, 28 )
	Talk( 25, "Do you wish to record here?" )
	Text( 25, "Yes. Please record.", MultiTrigger, GetMultiTrigger(), 8 )
	Text( 25, "No, thank you",CloseTalk )

	Talk( 26, "Sorry! You do not have enough gold to teleport." )

	Talk( 27, "Remember to look for me if you need teleportation services", CloseTalk )

	Talk( 28, "Error, unable to record, Call Robin", CloseTalk )

	InitTrigger()
	TriggerCondition( 1, IsMapNpc, "garner", 123 )
	TriggerAction( 1, JumpPage, 1 )
	TriggerCondition( 2, IsMapNpc, "garner", 124 )
	TriggerAction( 2, JumpPage, 2 )
	TriggerCondition( 3, IsMapNpc, "garner", 125 )
	TriggerAction( 3, JumpPage, 3 )
	TriggerCondition( 4, IsMapNpc, "garner", 126 )
	TriggerAction( 4, JumpPage, 4 )
	TriggerCondition( 5, IsMapNpc, "magicsea", 69 )
	TriggerAction( 5, JumpPage, 5)
	TriggerCondition( 6, IsMapNpc, "magicsea", 70)
	TriggerAction( 6, JumpPage, 6 )
	TriggerCondition( 7, IsMapNpc, "magicsea", 71 )
	TriggerAction( 7, JumpPage, 7)
	TriggerCondition( 8, IsMapNpc, "darkblue", 65 )
	TriggerAction( 8, JumpPage, 8 )
	Start( GetMultiTrigger(), 8 )
end