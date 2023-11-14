-------------------------------------------------------------------
--									--
--									--
--NPCScript07.lua Created by knight.gong 2005.7.12.				--
--									--
--									--
--------------------------------------------------------------------------
print( "Loading MissionScript07.lua" )

 ---------------------------------------------宠宠总动员(1)

	DefineMission( 900, "Pet Event", 900)

	MisBeginTalk( "<t>Want a beautiful pet? Then you will have to take my test.<n><t>Go outside of town to kill 10 Fox Taoists and bring back the Exorcism Bell.<n><t>I will give you a chance to obtain a beautiful pet.")
	MisBeginCondition(LvCheck, ">", 59 )
	MisBeginCondition(HasItem, 0844, 1)
	MisBeginCondition(NoMission, 900)
	MisBeginAction(AddMission, 900)
	MisBeginAction(AddTrigger, 9001, TE_KILL, 748, 10 )
	MisCancelAction(ClearMission, 900)

	MisNeed(MIS_NEED_DESP, "Kill 10 Fox Taoist for the fortune teller")	
	MisNeed(MIS_NEED_KILL, 748, 10, 10, 10)
	 
	MisHelpTalk("<t>Go now! For the sake of a new pet!")	
	MisResultTalk("<t>You are quite fast!<n><t>If you are lucky, the chest will contain the pet you wanted")
	MisResultCondition(HasMission, 900)
	MisResultCondition(HasFlag, 900, 19 )
	MisResultCondition(HasItem,0844,1)
	MisResultAction(TakeItem, 0844,1)
	MisResultAction(ClearMission,900)
	MisResultAction(GiveItem, 1852, 1, 4)
	MisResultBagNeed(1)
		
	InitTrigger() 
	TriggerCondition( 1, IsMonster, 748 )	
	TriggerAction( 1, AddNextFlag, 900, 10, 10 )
	RegCurTrigger(9001)



	-------------------------------------------------宠宠总动员(2)
	DefineMission(901,"Pet Event",901)

	MisBeginTalk("<t>Want a beautiful pet? Then you will have to take my test. Go outside of town to kill  10 Fox Taoists and bring back the Exorcism Bell. I will give you a chance to obtain a beautiful pet.")

	MisBeginCondition(LvCheck, "<", 60 )
	MisBeginCondition(HasItem, 0844, 1)
	MisBeginCondition(NoMission,901)
	MisBeginAction(AddMission, 901) 
	MisBeginAction(AddTrigger, 9011, TE_KILL, 103, 20)
	MisBeginAction(AddTrigger, 9012, TE_KILL, 70, 20)
	MisBeginAction(AddTrigger, 9013, TE_KILL, 253, 10)
	MisBeginAction(AddTrigger, 9014, TE_KILL, 85, 10)
	MisBeginAction(AddTrigger, 9015, TE_KILL, 76, 10)
	MisCancelAction(ClearMission, 901)

	MisNeed(MIS_NEED_DESP, "Help Old Man Blurry at (2272, 2700) to kill 20 Forest Spirit, 20 Little Squidy, 10 Mud Monster, 10 Stramonium and 10 Rookie Boxeroo.")
	MisNeed(MIS_NEED_KILL, 103, 20, 10, 20)
	MisNeed(MIS_NEED_KILL, 70, 20, 30, 20)
	MisNeed(MIS_NEED_KILL, 253, 10, 50, 10)
	MisNeed(MIS_NEED_KILL, 85, 10, 60, 10)
	MisNeed(MIS_NEED_KILL, 76, 10, 70, 10)

	MisHelpTalk("<t>Hurry up for your beautiful pet")
	MisResultTalk("<t>You are quite fast!<n><t>If you are lucky, the chest will contain the pet you wanted")
	MisResultCondition(HasMission, 901)
	MisResultCondition(HasFlag, 901, 29)
	MisResultCondition(HasFlag, 901, 49)
	MisResultCondition(HasFlag, 901, 59)
	MisResultCondition(HasFlag, 901, 69)
	MisResultCondition(HasFlag, 901, 79)
	MisResultCondition(HasItem, 0844, 1)
	MisResultAction(TakeItem, 0844, 1)
	MisResultAction(ClearMission, 901)
	MisResultAction(GiveItem, 1852, 1, 4)
	MisResultBagNeed(1) 

	InitTrigger() 
	TriggerCondition( 1, IsMonster, 103 )	
	TriggerAction( 1, AddNextFlag, 901, 10, 20 )
	RegCurTrigger(9011)

	InitTrigger() 
	TriggerCondition( 1, IsMonster, 70 )	
	TriggerAction( 1, AddNextFlag, 901, 30, 20 )
	RegCurTrigger(9012)

	InitTrigger() 
	TriggerCondition( 1, IsMonster, 253 )	
	TriggerAction( 1, AddNextFlag, 901, 50, 10 )
	RegCurTrigger(9013)

	InitTrigger() 
	TriggerCondition( 1, IsMonster, 85 )	
	TriggerAction( 1, AddNextFlag, 901, 60, 10 )
	RegCurTrigger(9014)

	InitTrigger() 
	TriggerCondition( 1, IsMonster, 76 )	
	TriggerAction( 1, AddNextFlag, 901, 70, 10 )
	RegCurTrigger(9015)


	-------------------------------------------------端午佳节吃粽子 雄黄艾草辟百邪
	DefineMission( 902, "Fight Evil, Eat Dumplings!", 902)

	MisBeginTalk("<t>Oh dear! The river monsters are moving again. I need some things to throw down to the river. Can you help me collect them?")

	MisBeginCondition(LvCheck, ">",15  )
	MisBeginCondition(NoMission,902)
	MisBeginCondition(NoRecord,902)
	MisBeginAction(AddMission,902)
	MisBeginAction(AddTrigger, 9021, TE_GETITEM, 3116, 10 )		--精灵果
	MisBeginAction(AddTrigger, 9022, TE_GETITEM, 3131, 10 )		--奇异果实
	MisBeginAction(AddTrigger, 9023, TE_GETITEM, 4419, 5 )		--坏掉的蜂蜜
	MisCancelAction(ClearMission, 902)

	MisNeed(MIS_NEED_DESP, "Help Qu Yuan find 10 Elven Fruit, 10 Strange Fruit and 5 Fermented Honey")
	MisNeed(MIS_NEED_ITEM, 3116, 10, 10, 10)
	MisNeed(MIS_NEED_ITEM, 3131, 10, 20, 10)
	MisNeed(MIS_NEED_ITEM, 4419, 5, 30, 5)

	MisHelpTalk("<t>Hurry! I'll be waiting for you! Its 10 Elven Fruits, 10 Strange Fruits and 5 Fermented Honey.")
	MisResultTalk("<t>Hope that these can feed them well and prevent them from creating anymore mischief.")
	MisResultCondition(HasMission, 902)
	MisResultCondition(NoRecord,902)
	MisResultCondition(HasItem, 3116, 10)
	MisResultCondition(HasItem, 3131, 10 )
	MisResultCondition(HasItem, 4419, 5 )
	MisResultAction(TakeItem, 3116, 10 )
	MisResultAction(TakeItem, 3131, 10 )
	MisResultAction(TakeItem, 4419, 5 )
	MisResultAction(ClearMission, 902)
	MisResultAction(SetRecord, 902 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 3116)	
	TriggerAction( 1, AddNextFlag, 902, 10, 10 )
	RegCurTrigger( 9021 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 3131)	
	TriggerAction( 1, AddNextFlag, 902, 20, 10 )
	RegCurTrigger( 9022 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4419)	
	TriggerAction( 1, AddNextFlag, 902, 30, 5 )
	RegCurTrigger( 9023 )

	-------------------------------------------------- 端午佳节吃粽子 雄黄艾草辟百邪
	DefineMission( 903, "Fight Evil, Eat Dumplings!", 903)
	
	MisBeginTalk("<t>Oh dear! Those items are not enough! I need more. Can you help me again?")
	MisBeginCondition(NoMission,902)
	MisBeginCondition(NoMission,903)
	MisBeginCondition(HasRecord,902)
	MisBeginCondition(NoRecord,903)
	MisBeginAction(AddMission,903)
	MisBeginAction(AddTrigger, 9031, TE_GETITEM, 1779, 10 )		--药瓶 
	MisBeginAction(AddTrigger, 9032, TE_GETITEM, 1584, 20 )		--有毒的刺 
	MisBeginAction(AddTrigger, 9033, TE_GETITEM, 1650, 10 )		--有疗效的水
	MisCancelAction(ClearMission, 903)

	MisNeed(MIS_NEED_DESP, "Help Qu Yuan find 10 Bottle, 20 Poisoned Thorn and 10 Healing Water")
	MisNeed(MIS_NEED_ITEM, 1779, 10, 10, 10)
	MisNeed(MIS_NEED_ITEM, 1584, 20, 20, 20)
	MisNeed(MIS_NEED_ITEM, 1650, 10, 40, 10)

	MisHelpTalk("<t>Sign...these river creatures...")
	MisResultTalk("<t>They shouldn't dare to try anything funny this time.")
	MisResultCondition(HasMission, 903)
	MisResultCondition(NoRecord,903)
	MisResultCondition(HasItem, 1779, 10)
	MisResultCondition(HasItem, 1584, 20 )
	MisResultCondition(HasItem, 1650, 10 )
	MisResultAction(TakeItem, 1779, 10 )
	MisResultAction(TakeItem, 1584, 20 )
	MisResultAction(TakeItem, 1650, 10 )
	MisResultAction(ClearMission, 903)
	MisResultAction(SetRecord, 903 )


	InitTrigger()
	TriggerCondition( 1, IsItem, 1779)	
	TriggerAction( 1, AddNextFlag, 903, 10, 10 )
	RegCurTrigger( 9031 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 1584)	
	TriggerAction( 1, AddNextFlag, 903, 20, 20 )
	RegCurTrigger( 9032 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 1650)	
	TriggerAction( 1, AddNextFlag, 903, 40, 10 )
	RegCurTrigger( 9033 )


-------------------------------------------------- 端午佳节吃粽子 雄黄艾草辟百邪
	DefineMission( 904, "Fight Evil, Eat Dumplings!", 904)

	MisBeginTalk("<t>Sigh...To appease those river monsters, I spent so much effort, resulting in me getting seriously ill. Although I know what can cure my illness, I am unable to get them on my own. Can you get those items back for me to make a cure?")

	MisBeginCondition(NoMission,904)
	MisBeginCondition(NoRecord,904)
	MisBeginCondition(HasRecord,903)
	MisBeginAction(AddMission,904)
	MisBeginAction(AddTrigger, 9041, TE_GETITEM, 3129, 5 )		--药用草叶
	MisBeginAction(AddTrigger, 9042, TE_GETITEM, 1681, 5 )		--眼泪
	MisCancelAction(ClearMission, 904)

	MisNeed(MIS_NEED_DESP, "Help Qu Yuan collect 5 Medicated Grass and 5 Tears")
	MisNeed(MIS_NEED_ITEM, 3129, 5, 10, 5)
	MisNeed(MIS_NEED_ITEM, 1681, 5, 20, 5)

	MisHelpTalk("<t>Sigh...I have so much illness...")
	MisResultTalk("<t>Thank you for helping me. Please take these as rewards.")
	MisResultCondition(HasMission, 904)
	MisResultCondition(NoRecord,904)
	MisResultCondition(HasItem, 3129, 5)
	MisResultCondition(HasItem, 1681, 5 )
	MisResultAction(TakeItem, 3129, 5 )
	MisResultAction(TakeItem, 1681, 5 )
	MisResultAction(GiveItem, 263, 3, 4)
	MisResultAction(GiveItem, 264, 3, 4)
	MisResultAction(GiveItem, 265, 3 ,4)
	MisResultAction(ClearMission, 904)
	MisResultAction(SetRecord,  904 )
	MisResultBagNeed(3)
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 3129)	
	TriggerAction( 1, AddNextFlag, 904, 10, 5 )
	RegCurTrigger( 9041 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 1681)	
	TriggerAction( 1, AddNextFlag, 904, 20, 5 )
	 RegCurTrigger( 9042 )
	 
  -------------------------------------------------- 海盗王的生日
	DefineMission( 905, "Pirate King Anniversary", 905)
	MisBeginTalk("<t>Do you know that not only Drunky loves to eat cakes baked by Granny Beldi, Pirate King Roland loves them too! Rumor has it that whoever eats the cake will get 3 bonus stat points! No wonder the Pirate King is invincible.<n><t>Don't you want to try too? Not everybody has a chance though. You need to take a 'Cake Sampling Voucher' and go to 'Granny Beldi' for exchange of a slice.")
	MisBeginCondition(NoMission,905)
	MisBeginCondition(HasItem, 1097, 1 )
	MisBeginCondition(NoRecord,905)
	MisBeginAction(AddMission,905)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "Look for Granny Beldi")
	MisHelpTalk("<t>Hurry and look for the old granny else no more cakes will be left!")
	
	MisResultCondition(AlwaysFailure )


	 -------------------------------------------------- 海盗王的生日
	DefineMission ( 906, "Pirate King Anniversary", 905,COMPLETE_SHOW)
	MisBeginCondition(AlwaysFailure )

	MisResultTalk("<t>Its Tintin who recommended you to come. Hmm...He loves to eat my bread. Haha. I take the 'Cake Voucher'. Here is your cake.")
	MisResultCondition(HasMission,905)
	MisResultCondition(HasItem, 1097, 1 )
	MisResultAction(ClearMission, 905 )
	MisResultAction(TakeItem, 1097, 1 )
	MisResultAction(GiveItem, 3338, 1, 4 )
	MisResultAction(SetRecord, 905 )
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	MisBeginBagNeed(1)	

	-------------------------------寻找遗失的爱情之鱼儿寻找花瓣
	DefineMission( 907, "Search for Flower", 906)
	
	MisBeginTalk( "<t>I miss her a lot! I beg you, please help me find her. I can't do without her. I know she was last sighted at Deep Blue(1333,558). Can you go look around in that area?")
	MisBeginCondition(NoRecord, 913 )
	MisBeginCondition(NoMission, 906 )
	MisBeginAction(AddMission, 906 )
	MisCancelAction(ClearMission, 906)
		
	MisNeed(MIS_NEED_DESP, "Locate Flower at (1333, 558)")
	MisHelpTalk("<t>Her last known coordinates is at (1333, 558) in Deep Blue region.")
	MisResultCondition(AlwaysFailure )

	---------------------------------------寻找遗失的爱情之鱼儿寻找花瓣

	DefineMission(908,"Search for Flower",906,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>You are a friend of Little Fish? I'm Flower's friend, the one he has been looking for!")
	MisResultCondition(HasMission, 906)
	MisBeginCondition(NoRecord, 913)
	MisResultAction(ClearMission, 906)
	MisResultAction(SetRecord, 913)

	----------------------------------寻找遗失的爱情之舞蝶喜欢吃月饼
	DefineMission ( 909, "Mooncake Affinity", 907)

	MisBeginTalk("<t>How can I so easily believe that you were sent by Little Fish? How about this, I really love to eat mooncake. Help me find 10 mooncakes.")
	MisBeginCondition(HasRecord,913)
	MisBeginCondition(NoMission,907)
	MisBeginCondition(NoRecord,907)
	MisBeginAction(AddMission,907)
	MisBeginAction(AddTrigger, 9071, TE_GETITEM, 3915, 10)
	MisCancelAction(ClearMission, 907)
	

	MisNeed(MIS_NEED_DESP, "Help Butterfly to collect 10 Mooncakes")
	MisNeed(MIS_NEED_ITEM, 3915, 10, 10, 10)

	MisHelpTalk("<t>Need 10 mooncakes!")
	MisResultTalk("<t>You seems to be a nice fellow. I love to eat mooncake, thank you!") 
	
	MisResultCondition(HasMission, 907)
	MisResultCondition(NoRecord,907)
	MisResultCondition(HasItem, 3915, 10)
	MisResultAction(TakeItem, 3915, 10 )
	MisResultAction(ClearMission, 907)
	MisResultAction(SetRecord, 907 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 3915)	
	TriggerAction( 1, AddNextFlag, 907, 10, 10 )
	RegCurTrigger( 9071 )
	
-------------------------------------------------------	寻找遗失的爱情之花瓣的遗信
	DefineMission(910,"Flower's Letter",908)
	
	MisBeginTalk("<t>Not bad, I think I can trust you now so deliver a message to him for me, Flower was a friend of my mine who passed away 2 days ago due to failed treatment of his leukemia. Before Flower's passing, she wrote a letter. Please pass the letter to him so as to let him grief in peace.")

	MisBeginCondition(HasRecord, 907)
	MisBeginCondition(NoRecord, 908)
	MisBeginCondition(NoMission, 908)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 908)
	MisBeginAction(GiveItem, 1005,1,4)

	MisHelpTalk("<t>May the Goddess bless those sorrowful people. Little Fish is in Shaitan City at (917, 3572).")
	MisNeed(MIS_NEED_DESP, "Help Butterfly to pass Flower's letter to Little Fish")

	MisCancelAction(ClearMission, 908)

	MisResultCondition(AlwaysFailure)




-----------------------------------寻找遗失的爱情之花瓣的遗信
	DefineMission( 911, "Flower's Letter", 908, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk("<t>What? It is really a letter from her.<n><t>Contents of the letter as follows: My Little Fish, by the time you have read this letter, I am already watching you from above. I do not wish for you to see my pale face, nor do I wish that you feel anguish, hurt and pain because of me. It is then i decided to leave you so that you will forget me. The only thing that you can do now is to hold me dear in your heart forever.<n><t>Little Fish, I will give you my blessings . Time passes by but yet love remains eternal.")
	MisResultCondition(HasMission, 908)
	MisResultCondition(NoRecord,908)
	MisResultCondition(HasItem, 1005, 1)
	MisResultAction(TakeItem, 1005, 1)
	MisResultAction(GiveItem, 1006, 1, 4)
	MisResultAction(ClearMission, 908)
	MisResultAction(SetRecord, 908)

	
	-------------------------------------------------------------寻找遗失的爱情之鱼儿想忘情
	DefineMission ( 912, "Reverse Love Potion", 909)
	
	MisBeginTalk("<t>I heard that theres a thing called Reverse Love Potion, and only Ditto at (2250, 2770) in Argent City knows how to concoct it. How I wish for a taste of it to wipe all my woes away..")
	
	MisBeginCondition(HasRecord,908)
	MisBeginCondition(NoRecord,909)
	MisBeginCondition(NoMission,909)
	MisBeginAction(AddMission,909)
	MisCancelAction(ClearMission, 909)
	
	MisHelpTalk("<t>Sign...How to forgot the sorrow? Only by using the Love Reverse Potion")
	MisNeed(MIS_NEED_DESP, "Help Little Fish to look for Reverse Love Potion")


	MisResultCondition(AlwaysFailure)


------------------------------------------------------------------------寻找遗失的爱情之鱼儿想忘情



	DefineMission(913,"Reverse Love Potion", 909,COMPLETE_SHOW)
	
	MisBeginCondition(AlwaysFailure)
	MisResultTalk("<t>You are a friend of Little Fish?<n><t>I have heard their story...sad indeed. You are a helpful person.")
	MisResultCondition(HasMission, 909)
	MisResultCondition(NoRecord, 909)
	MisResultAction(ClearMission, 909)
	MisResultAction(SetRecord, 909)



	
	
	-------------------------------------------------------------寻找遗失的爱情之制造忘情水
	DefineMission ( 914, "Decoct Reverse Love Potion", 910)
	
	MisBeginTalk("<t>You are here to seek Reverse Love Potion? The recipe for Reverse Love Potion is complicated. Get me 1 vial of Pure Water, 1 Heart of Naiad, 2 strands of Medicated Grass, 3 vials of Healing Water and return here.")
	
	MisBeginCondition(NoMission,910)
	MisBeginCondition(HasRecord,909)
	MisBeginCondition(NoRecord,910)
	MisBeginAction(AddMission,910)
	MisBeginAction(AddTrigger, 9101, TE_GETITEM, 1649, 1)
	MisBeginAction(AddTrigger, 9102, TE_GETITEM, 4418, 1)
	MisBeginAction(AddTrigger, 9103, TE_GETITEM, 3129, 2)
	MisBeginAction(AddTrigger, 9104, TE_GETITEM, 1650, 3)	
	MisCancelAction(ClearMission, 910)

	MisNeed(MIS_NEED_DESP, "You need 1 Pure Water, 1 Heart of Naiad, 2 Medicated Grass and 3 Healing Water.")
	MisNeed(MIS_NEED_ITEM, 1649, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 4418, 1, 20, 1)
	MisNeed(MIS_NEED_ITEM, 3129, 2, 30, 2)
	MisNeed(MIS_NEED_ITEM, 1650, 3, 40, 3)

	MisHelpTalk("<t>Please find 1 Pure Water, 1 Heart of Naiad, 2 Medicated Grass and 3 Healing Water")
	MisResultTalk("<t>Very well, these are the materials needed to create the Reverse Love Potion.")
	MisResultCondition(HasMission, 910)
	MisResultCondition(NoRecord,910)
	MisResultCondition(HasItem, 1649, 1)
	MisResultCondition(HasItem, 4418, 1)
	MisResultCondition(HasItem, 3129, 2)
	MisResultCondition(HasItem, 1650, 3)
	MisResultAction(TakeItem, 1649, 1 )
	MisResultAction(TakeItem, 4418, 1)
	MisResultAction(TakeItem, 3129, 2 )
	MisResultAction(TakeItem,1650, 3 )
	MisResultAction(ClearMission, 910)
	MisResultAction(SetRecord, 910 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1649)	
	TriggerAction( 1, AddNextFlag, 910, 10, 1 )
	RegCurTrigger( 9101 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 4418)	
	TriggerAction( 1, AddNextFlag, 910, 20, 1 )
	RegCurTrigger( 9102 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 3129)	
	TriggerAction( 1, AddNextFlag, 910, 30, 2 )
	RegCurTrigger( 9103 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 1650)	
	TriggerAction( 1, AddNextFlag, 910, 40, 3 )
	RegCurTrigger( 9104 )
	
	
	-----------------------------------------------------------------寻找遗失的爱情之购买玉金瓶
	DefineMission ( 915, "Purchase Golden Jade Bottle", 911)
	
	MisBeginTalk("<t>The Reverse Love Potion is a special kind of liquid. If it is placed in any kind of container, the potion will quickly evapourate. Only the Golden Jade Bottle Is able to prevent the potion from evaporating.")

	MisBeginCondition(NoMission,911)
	MisBeginCondition(HasRecord,910)
	MisBeginCondition(NoRecord,911)
	MisBeginAction(AddMission,911)
	MisBeginAction(AddTrigger, 9111, TE_GETITEM, 1007, 1)
	MisCancelAction(ClearMission, 911)
	MisNeed(MIS_NEED_DESP, "Requires a Golden Jade Bottle")
	MisNeed(MIS_NEED_ITEM, 1007, 1, 80, 1)

	MisHelpTalk("<t>Purchase the Golden Jade Bottle from Item Mall.")
	MisResultTalk("<t>I can help you make the Reverse Love Potion if I have the Golden Jade Bottle.")


	MisResultCondition(HasMission, 911)
	MisResultCondition(NoRecord,911)
	MisResultCondition(HasItem, 1007, 1)
	MisResultAction(TakeItem, 1007, 1 )
	MisResultAction(ClearMission, 911)
	MisResultAction(SetRecord,  911 )

	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1007)	
	TriggerAction( 1, AddNextFlag, 911, 80, 1 )
	RegCurTrigger( 9111 )


-------------------------------------------------------------------寻找遗失的爱情之忘情水

DefineMission(916,"Love in the Past",912)
	
	MisBeginTalk("<t>Take it. The Love Reversal Potion is ready. Hopefull it will heal Little Fish at (917, 3572).")

	MisBeginCondition(HasRecord, 911)
	MisBeginCondition(NoRecord, 912)
	MisBeginCondition(NoMission, 912)
	MisBeginBagNeed(1)

	MisBeginAction(AddMission, 912)
	MisBeginAction(GiveItem, 1008,1,4)

	MisHelpTalk("<t>Hurry and save the heart-broken person!")
	MisNeed(MIS_NEED_DESP, "Bring the Reverse Love Potion to Little Fish to heal his sorrow")

	MisCancelAction(ClearMission, 912)
	MisResultCondition(AlwaysFailure)




-------------------------------------------------------------------寻找遗失的爱情之忘情水
	DefineMission( 917, "Love in the Past", 912, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure )

	
	MisResultTalk("<t>So this is the mythical Reverse Love Potion! Take this Heart of Innocence as a gift from me to you, it represents true love.<n><t>Sigh! Will I really forget her if I use this potion?")
	MisResultCondition(HasMission, 912)
	MisResultCondition(NoRecord,912)
	MisResultCondition(HasItem, 1008, 1)
	MisResultAction(TakeItem, 1008, 1 )
	MisResultAction(GiveItem, 1009, 1 ,4)
	MisResultAction(ClearMission, 912)
	MisResultAction(SetRecord, 912 )
	MisResultAction(ClearRecord, 909)
	MisResultAction(ClearRecord, 910)
	MisResultAction(ClearRecord, 911)
	MisResultAction(ClearRecord, 912)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1008)	
	TriggerAction( 1, AddNextFlag, 912, 10, 1 )
	RegCurTrigger( 9121 ) 


	--------------------------------------------------------------------爱情重生

	DefineMission( 918, "Love Revival", 914 )
	MisBeginTalk("<t>Child, if you heart is empty and lifeless, look for the Reverse Love Potion. I will restore your heart to its former glory!")
	MisBeginCondition(NoMission, 914)
	MisBeginCondition(HasItem,1010,1)------------有纯真之心使用后的枯竭之心
	MisBeginCondition(NoRecord,914)
	MisBeginAction(AddMission,914)
	MisBeginAction(AddTrigger, 9141, TE_GETITEM, 1008, 1)
	MisCancelAction(ClearMission, 914)

	MisNeed(MIS_NEED_DESP, "Requires a Reverse Love Potion to moist a Withered Heart")
	MisNeed(MIS_NEED_ITEM, 1008, 1, 10, 1)

	MisHelpTalk("<t>Found a Reverse Love Potion, bring it to Mysterious Granny along with Withered Heart.")
	MisResultTalk("<t>Very good child, this is the Love Reversal Potion. Drink it, and face rebirth bravely.")

	MisResultCondition(HasMission, 914)
	MisResultCondition(NoRecord,914)
	MisResultCondition(HasItem, 1008, 1)
	MisResultCondition(HasItem, 1010, 1)------------有枯竭之心
	MisResultAction(TakeItem, 1008, 1 )
	MisResultAction(TakeItem, 1010, 1 )
	MisResultAction(GiveItem, 1013,1,4)------------给重生之心
	MisResultAction(ClearMission, 914)
	MisResultAction(SetRecord, 914)
	MisResultAction(ClearRecord, 914)---------------可以反复接

	InitTrigger()
	TriggerCondition( 1, IsItem, 1008)	
	TriggerAction( 1, AddNextFlag, 914, 10, 1 )
	RegCurTrigger( 9141 )
	
	
	-----------------------------------------------------------------------血腥的高跟鞋
	DefineMission( 919, "Bloodied High Heels", 915)
	
	MisBeginTalk( "<t>Ouch...I got hit on the head by a high heel shoe thrown by my boss...Look at the wound...What?! You don't believe me? I still have the medical report I got from <bNurse - Gina> in Argent City at (2244, 2770). The dressing is done by her. Check it out. Ouch...Ouch...")
	MisBeginCondition(NoRecord, 915 )
	MisBeginCondition(NoMission, 915 )
	MisBeginAction(AddMission, 915 )
	MisBeginAction(GiveItem, 1026,1,4)------白银医院验伤单
	MisCancelAction(ClearMission, 915)
	MisBeginBagNeed(1)
	
	MisNeed(MIS_NEED_DESP, "Look for Nurse Gina in Argent City to verify")
	MisHelpTalk("<t>The nurse is located at (2244, 2770)")
	MisResultCondition(AlwaysFailure )

------------------------------------------------------------------------------血腥的高跟鞋
	DefineMission( 920, "Bloodied High Heels", 915, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure )

	MisResultTalk("<t>Why is there always someone getting hurt recently!")
	MisResultCondition(HasMission, 915)
	MisResultCondition(NoRecord,915)
	MisResultCondition(HasItem, 1026, 1)
	MisResultAction(TakeItem, 1026, 1 )
	MisResultAction(ClearMission, 915)
	MisResultAction(SetRecord, 915 )
	 
-------------------------------------------------------------------------------向巡逻兵求证

	DefineMission( 921, "Verify with the Patroller", 916 )

	MisBeginTalk("<t>Yes, this Medical Report comes from me. The injury seems to be caused by a high heel shoe and the victim is a skinny man. However, I do not know the cause of the injury. It seems that <bGuard - Michael> in Shaitan City at (959, 3549) is also investigating this matter.")
	MisBeginCondition(NoMission, 916)
	MisBeginCondition(HasRecord,915)
	MisBeginCondition(NoRecord,916)
	MisBeginAction(AddMission, 916 )
	MisCancelAction(ClearMission, 916)
	MisResultCondition(AlwaysFailure )
	-------------------------------------------------------------------向巡逻兵求证
	DefineMission( 922, "Verify with the Patroller", 916, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure )

	MisResultTalk("<t>Its not easy being a patrol guard, theres always trouble and little pay!")
	MisResultCondition(HasMission, 916)
	MisResultCondition(NoRecord,916)
	MisResultAction(ClearMission, 916)
	MisResultAction(SetRecord, 916 )

	 
	---------------------------------------------------------------高跟鞋案件调查
	DefineMission( 923, "Investigation to the Case of the High Heels", 917)
	
	MisBeginTalk( "<t>Hmm...I have been investigating for some time about the incident you brought up. This is a very troublesome issue. Both parties claim to be the victim, insisting that the opposite party started the fight. What a problematic case! Look, this is the medical report of the lady boss, although the details are abit vague, they still can be used as clues.")
	MisBeginCondition(NoRecord, 917 )
	MisBeginCondition(NoMission, 917)
	MisBeginCondition(HasRecord, 916 )
	MisBeginAction(AddMission, 917 )
	MisBeginAction(GiveItem, 1027,1,4)------女老板的验伤单
	MisBeginAction(AddTrigger, 9171, TE_GETITEM, 1030, 1)
	MisBeginBagNeed(1)

	MisCancelAction(ClearMission, 917)
	MisNeed(MIS_NEED_ITEM, 1030, 1, 10, 1)

	MisResultTalk("<t>Only those who are brave dare to uphold rightness!")
	MisHelpTalk("<t>Use the Medical Report to summon a monster and defeat it")
	MisResultCondition(HasMission,  917)
	MisResultCondition(NoRecord , 917)
	MisResultCondition(HasItem,1030,1 )
	MisResultAction(TakeItem, 1030, 1 )-------
	MisResultAction(ClearMission,   917)
	MisResultAction(SetRecord,  917 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1030)	
	TriggerAction( 1, AddNextFlag, 917, 10, 1 )
	RegCurTrigger( 9171 )
-------------------------------------------------------------------------高跟鞋案件凶器--------------
	DefineMission( 924, "Weapon of the Case of the High Heels", 918)------------

	MisBeginTalk( "<t>Surprisingly the weapon used is this High Heels. I will safekeep it with me to keep it from harming other people. Thank you!")---------------
	MisBeginCondition(NoRecord, 918 )
	--MisBeginCondition(NoMission, 918 )
	MisBeginCondition(HasRecord, 917 )
	--MisBeginAction(AddMission, 918 )
	MisBeginAction(GiveItem, 1029,1,4)----------
	MisBeginAction(AddExp,500,500)
	--MisBeginAction(ClearMission, 918 )
	MisBeginAction(SetRecord, 918 )
	MisCancelAction(ClearMission, 918)
	MisBeginBagNeed(1)---------------

	MisHelpTalk("<t>Theres justice in the world.")----------

	MisResultCondition(AlwaysFailure )---------


	--------------------------------------------------------------------艰难任务1

	DefineMission( 6000, "Phoenix Rebirth", 1300 )
	MisBeginTalk("<t>Mortal, have you heard of Phoenix Rebirth? A Phoenix will be reborn every 500 years. All aspiring pirates also wish to be reborn. However, since the last Sacred War, the Rebirth Stone is broken up into pieces and lost in the mortal world. These fragments are being guarded by some people. If you can collect these fragments, I will help you attain rebirth. There is a <rTower in Ascaron> which seems suspicious. You might want to start from there.")
	MisBeginCondition(NoMission, 1300)
	MisBeginCondition(NoRecord,1300)
	MisBeginCondition(HasCredit,9999)
	MisBeginAction(AddMission,1300)
	MisBeginAction(AddTrigger, 13001, TE_GETITEM, 2226, 1)
	MisBeginAction(AddTrigger, 13002, TE_GETITEM, 2227, 1)
	MisBeginAction(AddTrigger, 13003, TE_GETITEM, 2228, 1)
	MisBeginAction(AddTrigger, 13004, TE_GETITEM, 2229, 1)
	MisBeginAction(AddTrigger, 13005, TE_GETITEM, 2230, 1)
	MisBeginAction(AddTrigger, 13006, TE_GETITEM, 2231, 1)
	MisBeginAction(AddTrigger, 13007, TE_GETITEM, 2232, 1)
	MisBeginAction(AddTrigger, 13008, TE_GETITEM, 2233, 1)
	
	
	MisCancelAction(ClearMission, 1300)

	MisNeed(MIS_NEED_DESP, "Bring back 8 Fragments of the Rebirth Stone.")
	MisNeed(MIS_NEED_ITEM, 2226, 1, 10, 1)
	MisNeed(MIS_NEED_ITEM, 2227, 1, 20, 1)
	MisNeed(MIS_NEED_ITEM, 2228, 1, 30, 1)
	MisNeed(MIS_NEED_ITEM, 2229, 1, 40, 1)
	MisNeed(MIS_NEED_ITEM, 2230, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 2231, 1, 60, 1)
	MisNeed(MIS_NEED_ITEM, 2232, 1, 70, 1)
	MisNeed(MIS_NEED_ITEM, 2233, 1, 80, 1)
	
	

	MisHelpTalk("<t>The 8 pieces were scattered all over the world.You have to be mentally prepared to embark on a long journey.")
	MisResultTalk("<t>You are God's miracle, wait for the grand moment of rebirth.")

	MisResultCondition(HasMission, 1300)
	MisResultCondition(NoRecord,1300)
	MisResultCondition(HasItem, 2226, 1)
	MisResultCondition(HasItem, 2227, 1)
	MisResultCondition(HasItem, 2228, 1)
	MisResultCondition(HasItem, 2229, 1)
	MisResultCondition(HasItem, 2230, 1)
	MisResultCondition(HasItem, 2231, 1)
	MisResultCondition(HasItem, 2232, 1)
	MisResultCondition(HasItem, 2233, 1)
	
	
	MisResultAction(TakeItem, 2226, 1 )
	MisResultAction(TakeItem, 2227, 1 )
	MisResultAction(TakeItem, 2228, 1 )
	MisResultAction(TakeItem, 2229, 1 )
	MisResultAction(TakeItem, 2230, 1 )
	MisResultAction(TakeItem, 2231, 1 )
	MisResultAction(TakeItem, 2232, 1 )
	MisResultAction(TakeItem, 2233, 1 )
	
	
	MisResultAction(GiveItem, 2235,1,4)------------给再生之石
	MisResultAction(ClearMission, 1300)
	MisResultAction(SetRecord, 1300)
	MisResultBagNeed(1)
	


	InitTrigger()
	TriggerCondition( 1, IsItem, 2226)	
	TriggerAction( 1, AddNextFlag, 1300, 10, 1 )
	RegCurTrigger( 13001 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2227)	
	TriggerAction( 1, AddNextFlag, 1300, 20, 1 )
	RegCurTrigger( 13002 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2228)	
	TriggerAction( 1, AddNextFlag, 1300, 30, 1 )
	RegCurTrigger( 13003 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2229)	
	TriggerAction( 1, AddNextFlag, 1300, 40, 1 )
	RegCurTrigger( 13004 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2230)	
	TriggerAction( 1, AddNextFlag, 1300, 50, 1 )
	RegCurTrigger( 13005 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2231)	
	TriggerAction( 1, AddNextFlag, 1300, 60, 1 )
	RegCurTrigger( 13006 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2232)	
	TriggerAction( 1, AddNextFlag, 1300, 70, 1 )
	RegCurTrigger( 13007 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2233)	
	TriggerAction( 1, AddNextFlag, 1300, 80, 1 )
	RegCurTrigger( 13008 )
	
-------------------------------------------------打雪仗	
	DefineMission (5500, "Snowball Fight", 818)
	
	MisBeginTalk("<t>What a wonderful Christmas Day! There is snow all over! You want to have a snowball fight? You need to kill 20 <bDry Mystic Shrub>, then I can make you some.<r Snowballs>")

	MisBeginCondition(NoMission,818)
	MisBeginCondition(NoRecord,818)
	MisBeginAction(AddMission,818)
	MisBeginAction(AddTrigger, 8181, TE_KILL, 218, 20 )
	MisCancelAction(ClearMission, 818)
	
	MisNeed(MIS_NEED_DESP, "kill 20 Mystic Shrub")
	MisNeed(MIS_NEED_KILL, 218, 20, 10, 20)

	MisHelpTalk("<t>Christmas is coming!")
	MisResultTalk("<t>Not bad, you have already done the work. These snowballs were made for you. Merry Christmas!")


	MisResultCondition(HasMission, 818)
	MisResultCondition(NoRecord,818)
	MisResultCondition(HasFlag, 818, 29 )
	MisResultAction(ClearMission, 818)
	MisResultAction(SetRecord,  818 )
	MisResultAction(ClearRecord, 818)---------------可以反复接
	MisResultAction(GiveItem, 2896, 10, 4)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 218)	
	TriggerAction( 1, AddNextFlag, 818, 10, 20 )
	RegCurTrigger( 8181 )

	-------------------------------------------------打雪仗	
	DefineMission (5501, "Snowball Fight", 819)
	
	MisBeginTalk("<t> What a wonderful Christmas Day! There is snow all over! You want to have a snowball fight? You need to kill 20 <b Mystic Shrub>, then I can make you some.<r Snowballs>")

	MisBeginCondition(NoMission,819)
	MisBeginCondition(NoRecord,819)
	MisBeginAction(AddMission,819)
	MisBeginAction(AddTrigger, 8191, TE_KILL, 75, 20 )
	MisCancelAction(ClearMission, 819)
	
	MisNeed(MIS_NEED_DESP, "Kill 20 Dry Mystic Shrub")
	MisNeed(MIS_NEED_KILL, 75, 20, 10, 20)

	MisHelpTalk("<t> Christmas is coming")
	MisResultTalk("<t> Not bad, you have already done the work. These snowballs were made for you. Merry Christmas!")


	MisResultCondition(HasMission, 819)
	MisResultCondition(NoRecord,819)
	MisResultCondition(HasFlag, 819, 29 )
	MisResultAction(ClearMission, 819)
	MisResultAction(SetRecord,  819 )
	MisResultAction(ClearRecord, 819)---------------可以反复接
	MisResultAction(GiveItem, 2896, 10, 4)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 75)	
	TriggerAction( 1, AddNextFlag, 819, 10, 20 )
	RegCurTrigger( 8191 )

-------------------------------------------------打雪仗	
	DefineMission (5502, "Snowball Fight", 820)
	
	MisBeginTalk("<t> What a wonderful Christmas Day! There is snow all over! You want to have a snowball fight? You need to kill 20 <b Snowy Mystic Shrub>, then I can make you some.<r Snowballs>")

	MisBeginCondition(NoMission,820)
	MisBeginCondition(NoRecord,820)
	MisBeginAction(AddMission,820)
	MisBeginAction(AddTrigger, 8201, TE_KILL, 216, 20 )
	MisCancelAction(ClearMission, 820)
	
	MisNeed(MIS_NEED_DESP, "Kill 20 Snowy Mystic Shrub")
	MisNeed(MIS_NEED_KILL, 216, 20, 10, 20)

	MisHelpTalk("<t> Christmas is coming")
	MisResultTalk("<t> Not bad, you have already done the work. These snowballs were made for you. Merry Christmas!")


	MisResultCondition(HasMission, 820)
	MisResultCondition(NoRecord,820)
	MisResultCondition(HasFlag, 820, 29 )
	MisResultAction(ClearMission, 820)
	MisResultAction(SetRecord,  820 )
	MisResultAction(ClearRecord, 820)---------------可以反复接
	MisResultAction(GiveItem, 2896, 10, 4)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 216)	
	TriggerAction( 1, AddNextFlag, 820, 10, 20 )
	RegCurTrigger( 8201 )

-----------------------------------------------勇士的证明
	DefineMission(6001,"Mark of a Warrior",1302)

      MisBeginTalk("<t>Use your wisdom and bravery to eradicate these demons from this world! 15 Nimble Forest Hunter, 15 Nimble Shadow Hunter, 15 Vicious Grassland Elder, 15 Evil Guardian Angel, 15 Ruthless Shadow Hunter and 15 Ruthless Forest Hunter.")

      MisBeginCondition(HasRecord,1301)
      MisBeginCondition(NoRecord,1302)
      MisBeginCondition(NoMission,1302)
      MisBeginCondition(HasCredit,9999 )
     -- MisBeginAction(TakeCredit, 9999 )
	  --MisBeginAction(DelRoleCredit, 9999 )  
      MisBeginAction(AddMission,1302)
      MisBeginAction(AddTrigger, 13021, TE_KILL,525, 15)
      MisBeginAction(AddTrigger, 13022, TE_KILL,526, 15)
      MisBeginAction(AddTrigger, 13023, TE_KILL, 532, 15)
      MisBeginAction(AddTrigger, 13024, TE_KILL, 550, 15)
      MisBeginAction(AddTrigger, 13025, TE_KILL, 554, 15)
      MisBeginAction(AddTrigger, 13026, TE_KILL, 553, 15)
      MisCancelAction(ClearMission, 1302)

      MisNeed(MIS_NEED_DESP, "Kill 15 Nimble Forest Hunter, 15 Nimble Shadow Hunter, 15 Vicious Grassland Elder, 15 Evil Guardian Angel, 15 Ruthless Shadow Hunter, 15 Ruthless Forest Hunter!")
      MisNeed(MIS_NEED_KILL, 525, 15, 10, 15)
      MisNeed(MIS_NEED_KILL, 526, 15, 30, 15)
      MisNeed(MIS_NEED_KILL, 532, 15, 50, 15)
      MisNeed(MIS_NEED_KILL, 550, 15, 70, 15)
      MisNeed(MIS_NEED_KILL, 554, 15, 90, 15)
      MisNeed(MIS_NEED_KILL, 553, 15, 110, 15)

      MisHelpTalk("<t>Kill them.")  
      MisResultTalk("<t>You have good skills. Learn from me from now on. This Fragment represents Wisdom. Take it to fulfill your dream. Rumored that rebirth allows you to reselect class...")
      MisResultCondition(HasMission,1302 )
      MisResultCondition(NoRecord,1302)
      MisResultCondition(HasFlag, 1302, 24)
      MisResultCondition(HasFlag, 1302, 44)
      MisResultCondition(HasFlag, 1302, 64)
      MisResultCondition(HasFlag, 1302, 84)
      MisResultCondition(HasFlag, 1302, 104)
      MisResultCondition(HasFlag, 1302, 124)
      MisResultAction(GiveItem, 2228, 1, 4 )
      MisResultAction(ClearMission, 1302 )
      MisResultAction(SetRecord, 1302)
      MisResultBagNeed(1)

      InitTrigger()
      TriggerCondition( 1, IsMonster, 525 )
      TriggerAction( 1, AddNextFlag, 1302, 10, 15 )
      RegCurTrigger( 13021 )
       InitTrigger()
      TriggerCondition( 1, IsMonster, 526 )
      TriggerAction( 1, AddNextFlag, 1302, 30, 15 )
      RegCurTrigger( 13022 )
       InitTrigger()
      TriggerCondition( 1, IsMonster,532  )
      TriggerAction( 1, AddNextFlag, 1302, 50, 15 )
      RegCurTrigger( 13023 )
       InitTrigger()
      TriggerCondition( 1, IsMonster, 550 )
      TriggerAction( 1, AddNextFlag, 1302, 70, 15 )
      RegCurTrigger( 13024 )
       InitTrigger()
      TriggerCondition( 1, IsMonster, 554 )
      TriggerAction( 1, AddNextFlag, 1302, 90, 15 )
      RegCurTrigger( 13025 )
       InitTrigger()
      TriggerCondition( 1, IsMonster,553)
      TriggerAction( 1, AddNextFlag, 1302, 110, 15 )
      RegCurTrigger( 13026 )




------------------------------------------------------小镇神秘人
	DefineMission( 6002, "Little Mystery Man", 1303 )

	MisBeginTalk( "<t>Judging from your reputation, I am sure that guy will not reject you...However, I did not say that he has part of the fragment." )------------
	MisBeginCondition(NoRecord,   1303)
	MisBeginCondition(HasRecord, 1302)
	MisBeginCondition(NoMission,  1303)
	MisBeginAction(AddMission,  1303)
	MisCancelAction(ClearMission, 1303)
	MisNeed(MIS_NEED_DESP, "Searching for Eastern town's mysterious guardian")
	MisHelpTalk("<t>I can only tell you this much.")
	
	MisResultCondition(AlwaysFailure)
	
-------------------------------------------------------小镇神秘人
	DefineMission( 6003, "Little Mystery Man", 1303, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk("<t>I'm already this fat, and yet I'm still recognizable?!")
	MisResultCondition(NoRecord,  1303)
	MisResultCondition(HasMission,  1303)
	MisResultAction(SetRecord,  1303)
	MisResultAction(ClearMission,  1303)

------------------------------------------------------------简单任务
	DefineMission( 6004, "Simple Mission", 1304 )

	MisBeginTalk( "<t>I never like to trouble others, help me find 30 <bGigantic Stramonium Flower>, 30 <bQuality Caviar>, 30 <bCompressed Energy III> as a gift, hehe..." )
	MisBeginCondition(NoRecord, 1304)
	MisBeginCondition(HasRecord, 1303)
	MisBeginCondition(NoMission, 1304)
	MisBeginAction(AddMission, 1304)
	MisBeginAction(AddTrigger, 13041, TE_GETITEM, 4730, 30 )
	MisBeginAction(AddTrigger, 13042, TE_GETITEM, 1358, 30 )
	MisBeginAction(AddTrigger, 13043, TE_GETITEM, 2619, 30 )
	MisCancelAction(ClearMission, 1304)
	
	MisNeed(MIS_NEED_ITEM, 4730, 30, 10, 30)
	MisNeed(MIS_NEED_ITEM, 1358, 30, 50, 30)
	MisNeed(MIS_NEED_ITEM, 2619, 30, 90, 30)

	MisResultTalk("<t>These are the ingredients in making Mao Wine! I gave those away when I quit drinking to go on a diet.")
	MisHelpTalk("<t>I discovered that quit drinking doesn't help in getting thin so...")
	MisResultCondition(HasMission, 1304)
	MisResultCondition(HasItem, 4730, 30 )
	MisResultCondition(HasItem, 1358, 30 )
	MisResultCondition(HasItem, 2619, 30 )
	MisResultAction(TakeItem, 4730, 30 )
	MisResultAction(TakeItem, 1358, 30 )
	MisResultAction(TakeItem, 2619, 30 )
	MisResultAction(ClearMission, 1304)
	MisResultAction(SetRecord, 1304 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 4730)	
	TriggerAction( 1, AddNextFlag, 1304, 10, 30 )
	RegCurTrigger( 13041 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1358)	
	TriggerAction( 1, AddNextFlag, 1304, 50, 30 )
	RegCurTrigger( 13042 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2619)	
	TriggerAction( 1, AddNextFlag, 1304, 90, 30 )
	RegCurTrigger( 13043 )




------------------------------------------------------------戒酒记
	DefineMission( 6005, "Day of Abstinence", 1305)

	MisBeginTalk( "<t>This is really a good wine...But it is too troublesome to brew on my own. Go get me a few bottles more." )
	MisBeginCondition(NoRecord, 1305)
	MisBeginCondition(HasRecord, 1304)
	MisBeginCondition(NoMission, 1305)
	MisBeginAction(AddMission, 1305)
	MisBeginAction(AddTrigger, 13051, TE_GETITEM, 1087, 30 )		
	MisCancelAction(ClearMission, 1305)
	
	MisNeed(MIS_NEED_ITEM, 1087, 30, 10, 30)

	MisResultTalk("<t>Good wine!Good wine!")
	MisHelpTalk("<t>Be quick,if my urge to drink passes, don't blame me for being nasty")
	MisResultCondition(HasMission, 1305)
	MisResultCondition(HasItem, 1087, 30 )
	MisResultAction(TakeItem, 1087, 30 )
	MisResultAction(ClearMission, 1305)
	MisResultAction(SetRecord, 1305 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1087)	
	TriggerAction( 1, AddNextFlag, 1305, 10, 30 )
	RegCurTrigger( 13051 )

------------------------------------------------------------戒酒记
	DefineMission( 6006, "Day of Abstinence", 1306)

	MisBeginTalk( "<t>Someone famous once told me, to see how the taste of Dukan Wine and Mao Wine differs, you need to taste it yourself. You don't mind getting me a few bottles of Dukan Wine, do you?" )
	MisBeginCondition(NoRecord, 1306)
	MisBeginCondition(HasRecord, 1305)
	MisBeginCondition(NoMission, 1306)
	MisBeginAction(AddMission, 1306)
	MisBeginAction(AddTrigger, 13061, TE_GETITEM, 1088, 20 )		--
	MisCancelAction(ClearMission, 1306)
	
	MisNeed(MIS_NEED_ITEM, 1088, 20, 10, 20)

	MisResultTalk("<t>Only Dukan can relieve woes!")
	MisHelpTalk("<t>I advise against giving me any fake items. I just drank some wine, and I may do something nasty")
	MisResultCondition(HasMission, 1306)
	MisResultCondition(HasItem, 1088, 20 )
	MisResultAction(TakeItem, 1088, 20 )
	MisResultAction(ClearMission, 1306)
	MisResultAction(SetRecord, 1306 )
	

	InitTrigger()
	TriggerCondition( 1, IsItem, 1088)	
	TriggerAction( 1, AddNextFlag, 1306, 10, 20 )
	RegCurTrigger( 13061 )



------------------------------------------------------------戒酒记
	DefineMission( 6007, "Day of Abstinence", 1307)

	MisBeginTalk( "<t>After tasting them, I think Mao Wine would suit me more. I think I would need to stock up 20 bottles in the wine cellar. You think so too, don't you?" )
	MisBeginCondition(NoRecord, 1307)
	MisBeginCondition(HasRecord, 1306)
	MisBeginCondition(NoMission, 1307)
	MisBeginAction(AddMission, 1307)
	MisBeginAction(AddTrigger, 13071, TE_GETITEM, 1087, 20 )		--
	MisCancelAction(ClearMission, 1307)
	
	MisNeed(MIS_NEED_ITEM, 1087, 20, 10, 20)

	MisResultTalk("<t>Wine gets better as it gets older...Ah...")
	MisHelpTalk("<t>Famous quotes: Never argue with a drunk.")
	MisResultCondition(HasMission, 1307)
	MisResultCondition(HasItem, 1087, 20 )
	MisResultAction(TakeItem, 1087, 20 )
	MisResultAction(ClearMission, 1307)
	MisResultAction(SetRecord, 1307 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1087)	
	TriggerAction( 1, AddNextFlag, 1307, 10, 20 )
	RegCurTrigger( 13071 )

------------------------------------------------------------戒酒记
	DefineMission( 6008, "Day of Abstinence", 1008)

	MisBeginTalk( "<t>I need to quit drinking! I think I have been drinking too much lately. I have signs of internal bleeding. Nobody stop me! I heard that Ginseng Wine is a good remedy for internal bleeding. Hmm...You know what i mean?" )
	MisBeginCondition(NoRecord, 1008)
	MisBeginCondition(HasRecord, 1307)
	MisBeginCondition(NoMission, 1008)
	MisBeginAction(AddMission, 1008)
	MisBeginAction(AddTrigger, 10081, TE_GETITEM, 1089, 15 )		--
	MisCancelAction(ClearMission, 1008)
	
	MisNeed(MIS_NEED_ITEM, 1089, 15, 10, 15)

	MisResultTalk("<t>I have not tasted Tiger Bone Tonic in a long time...")
	MisHelpTalk("<t>Young man, its not good to drink too much,it might hinder you...")
	MisResultCondition(HasMission, 1008)
	MisResultCondition(HasItem, 1089, 15 )
	MisResultAction(TakeItem, 1089, 15 )
	MisResultAction(ClearMission, 1008)
	MisResultAction(SetRecord, 1008 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1089)	
	TriggerAction( 1, AddNextFlag, 1008, 10, 15 )
	RegCurTrigger( 10081 )


------------------------------------------------------寻访魔方导游
	DefineMission( 6009, "Seek out Demonic Guide", 1009 )

	MisBeginTalk( "<t>To express my thanks, I will give you this piece of fragment that symbolize virtue. In my drunken state, I remember seeing a guy in Demonic World having part of this fragment as well. You will have to look around to complete the piece. I heard that rebirth enable you to redistribute your stats..." )
	MisBeginCondition(NoRecord,   1009)
	MisBeginCondition(HasRecord, 1008)
	MisBeginCondition(NoMission,  1009)
	MisBeginAction(AddMission,  1009)
	MisBeginAction(GiveItem, 2227, 1, 4 )
	MisCancelAction(ClearMission, 1009)
	MisBeginBagNeed(1)

	MisNeed(MIS_NEED_DESP, "Search for Demonic World's Mysterious Guardian")
	MisHelpTalk("<t>I really can't recall.")
	
	MisResultCondition(AlwaysFailure)
	
-------------------------------------------------------寻访魔方导游
	DefineMission( 6010, "Seek out Demonic Guide", 1009, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
		
	MisResultTalk("<t>I may be the guide of demonic world but I do not conduct tours. I only give directions, as I often get lost...")
	MisResultCondition(NoRecord,  1009)
	MisResultCondition(HasMission,  1009)
	MisResultAction(SetRecord,  1009)
	MisResultAction(ClearMission,  1009)
----------------------------------------------------------加勒比观光游
	DefineMission( 6011, "Caribbean 1 day tour", 1010 )
	MisBeginTalk("<t>The incident happened a long time ago. This fragment has given me endless nightmares. I wish to return it before I retire, however, I have no means to get to heaven. Have you been to the Caribbean? If you can defeat Deathsoul Commander, I will consider to give this fragment to you.")
				
	MisBeginCondition(NoMission, 1010)
	MisBeginCondition(HasRecord, 1009)
	MisBeginCondition(NoRecord,1010)	
	MisBeginAction(AddMission,1010)
	MisBeginAction(AddTrigger, 10101, TE_KILL, 807, 1)--亡灵司令(807)  
	MisCancelAction(ClearMission, 1010)

	MisNeed(MIS_NEED_DESP, "Kill Deathsoul Commander")
	MisNeed(MIS_NEED_KILL, 807,1, 10, 1)
	
	
	MisResultTalk("<t>The scenery of Caribbean is beautiful, but the monsters are too fearsome!")
	MisHelpTalk("<t>This task should be simple")
	MisResultCondition(HasMission,  1010)
	MisResultCondition(HasFlag, 1010, 10)
	MisResultCondition(NoRecord , 1010)
	MisResultAction(ClearMission,  1010)
	MisResultAction(SetRecord,  1010 )
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 807)	
	TriggerAction( 1, AddNextFlag, 1010, 10, 1 )
	RegCurTrigger( 10101 )

	


----------------------------------------------------------加勒比观光游
	DefineMission( 6012, "Carribean 2 days tour", 1011 )
	MisBeginTalk("<t>I wonder why do I hate those from the Caribbean. It would be better off if all are dead...especially that Barborosa")
				
	MisBeginCondition(NoMission, 1011)
	MisBeginCondition(NoRecord,1011)
	MisBeginCondition(HasRecord, 1010)
	MisBeginAction(AddMission,1011)
	MisBeginAction(AddTrigger, 10111, TE_KILL, 805, 1)--巴伯萨(805)
	MisCancelAction(ClearMission, 1011)

	MisNeed(MIS_NEED_DESP, "Kill Barborosa!")
	MisNeed(MIS_NEED_KILL, 805,1, 10, 1)
	

	MisResultTalk("<t>I knew you would want to start a killing spree in Carribean")
	MisHelpTalk("Leave none alive!")
	MisResultCondition(HasMission,  1011)
	MisResultCondition(HasFlag, 1011, 10)
	MisResultCondition(NoRecord , 1011)
	MisResultAction(ClearMission,  1011)
	MisResultAction(SetRecord,  1011 )
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 805)	
	TriggerAction( 1, AddNextFlag, 1011, 10, 1 )
	RegCurTrigger( 10111 )
	
	----------------------------------------------------------加勒比观光游
	DefineMission( 6013, "Caribbean Tour 2", 1012 )
	MisBeginTalk("<t>I can see that you aren't satisfied with a 2 days tour of Carribean Island. No need to thank me, I've already applied for another tour for you. Hehe! Kill the irritating Kraken!")
				
	MisBeginCondition(NoMission, 1012)
	MisBeginCondition(NoRecord,1012)
	MisBeginCondition(HasRecord, 1011)
	MisBeginAction(AddMission,1012)
	MisBeginAction(AddTrigger, 10121, TE_KILL, 796, 1)---史前大章鱼
	
	MisCancelAction(ClearMission, 1012)

	MisNeed(MIS_NEED_DESP, "Kill Kraken!")
	MisNeed(MIS_NEED_KILL, 796,1, 10, 1)
	

	MisResultTalk("<t>The world was never this beautiful. Your ability has convinced me. Here take this Shard of Love and I hope that you will find your purest love.")
	MisHelpTalk("<t>Let that octopus disappear from this world!")
	MisResultCondition(HasMission,  1012)
	MisResultCondition(HasFlag, 1012, 10)
	MisResultCondition(NoRecord , 1012)
	MisResultAction(GiveItem, 2226, 1, 4 )
	MisResultAction(ClearMission,  1012)
	MisResultAction(SetRecord,  1012 )
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 796)	
	TriggerAction( 1, AddNextFlag, 1012, 10, 1 )
	RegCurTrigger( 10121 )
	
	------------------------------------------------------谁是守护者
	DefineMission( 6014, "Who is the Guardian", 1013 )

	MisBeginTalk( "<t>My friend, seek it out fast, rebirth will allow you to soar above the rest! I vaguely remembered that Icicle City do have a guardian..." )
	MisBeginCondition(NoRecord,   1013)
	MisBeginCondition(HasRecord, 1012)
	MisBeginCondition(NoMission,  1013)
	MisBeginAction(AddMission,  1013)
	MisCancelAction(ClearMission, 1013)
	

	MisNeed(MIS_NEED_DESP, "Search for the next guardian")
	MisHelpTalk("<t>Still not moving out? You want another 3 days tour?")
	
	MisResultCondition(AlwaysFailure)

	-------------------------------------------------情人节的礼物----------沙泉补给站找NPC菲菲对话：（男性角色）	
	DefineMission (5503, "Valentine's Day gift", 825)
	
	MisBeginTalk("<t>Want to leave some pleasant memories for your love one? Help me collect one rose and 10 Heart of Naiad. I'll give you a surprise that your love one will definitely like.")

	MisBeginCondition(NoMission,825)
	MisBeginCondition(NoRecord,825)
	MisBeginCondition(LvCheck, ">",30)
	MisBeginCondition(NoChaType,3)
	MisBeginCondition(NoChaType,4)
	MisBeginAction(AddMission,825)
	MisBeginAction(AddTrigger, 8251, TE_GETITEM, 3343, 11)
	MisBeginAction(AddTrigger, 8252, TE_GETITEM, 4418, 10)
	MisCancelAction(ClearMission, 825)
	
	MisNeed(MIS_NEED_DESP, "Collect 11 Rose, 10 Heart of Naiad.")
	MisNeed(MIS_NEED_ITEM, 3343, 11, 10, 11)
	MisNeed(MIS_NEED_ITEM, 4418, 10, 30, 10 )

	MisHelpTalk("<t>Will it snow this Valentine's Day?")
	MisResultTalk("<t>Very good, this is Gift of the Beauty. Give it to the person you love. She will definitely be touched.")


	MisResultCondition(HasMission, 825)
	MisResultCondition(NoRecord,825)
	MisResultCondition(HasItem, 3343, 11)
	MisResultCondition(HasItem, 4418, 10)
	MisResultAction(TakeItem, 3343, 11 )
	MisResultAction(TakeItem, 4418, 10 )
	MisResultAction(ClearMission, 825)
	MisResultAction(SetRecord,  825 )
	MisResultAction(GiveItem, 2904, 1, 4)
	MisResultBagNeed(1)
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 3343)	
	TriggerAction( 1, AddNextFlag, 825, 10, 11 )
	RegCurTrigger( 8251 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4418)	
	TriggerAction( 1, AddNextFlag, 825, 30, 10 )
	RegCurTrigger( 8252 )

-------------------------------------------------情人节的礼物----------冰极补给站找NPC法迪尔对话：（女性角色）	
	DefineMission (5504, "Valentine's Day gift", 826)
	
	MisBeginTalk("<t>Want to leave some pleasant memories for your love one? Help me collect one rose and 10 Heart of Naiad. I'll give you a surprise that your love one will definitely like.")

	MisBeginCondition(NoMission,826)
	MisBeginCondition(NoRecord,826)
	MisBeginCondition(LvCheck, ">",30)
	MisBeginCondition(NoChaType,1)
	MisBeginCondition(NoChaType,2)
	MisBeginAction(AddMission,826)
	MisBeginAction(AddTrigger, 8261, TE_GETITEM, 3343, 11)
	MisBeginAction(AddTrigger, 8262, TE_GETITEM, 4418, 10)
	MisCancelAction(ClearMission, 826)
	
	MisNeed(MIS_NEED_DESP, "Collect 11 Rose, 10 Heart of Naiad.")
	MisNeed(MIS_NEED_ITEM, 3343, 11, 10, 11)
	MisNeed(MIS_NEED_ITEM, 4418, 10, 30, 10 )

	MisHelpTalk("<t>Will it snow this Valentine's Day?")
	MisResultTalk("<t>Very good, heres Gift of the Hunk. Give this to your love one and he will be moved!")


	MisResultCondition(HasMission, 826)
	MisResultCondition(NoRecord,826)
	MisResultCondition(HasItem, 3343, 11)
	MisResultCondition(HasItem, 4418, 10)
	MisResultAction(TakeItem, 3343, 11 )
	MisResultAction(TakeItem, 4418, 10 )
	MisResultAction(ClearMission, 826)
	MisResultAction(SetRecord,  826 )
	MisResultAction(GiveItem, 2905, 1, 4)
	MisResultBagNeed(1)
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 3343)	
	TriggerAction( 1, AddNextFlag, 826, 10, 11 )
	RegCurTrigger( 8261 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4418)	
	TriggerAction( 1, AddNextFlag, 826, 30, 10 )
	RegCurTrigger( 8262 )


-----------------------------------------------七猪开泰---------玛拉依兰
	DefineMission(5505,"Fortune of 7 Pigs",827)

      MisBeginTalk("<t>Want to gain the favor of the Piggy God? Go forth and hunt 1 of each: Snowy Piglet, Piglet, Tusk Battle Boar, Air Porky, Mad Boar, Combat Piglet and Snowy Tusk Boar.")

      MisBeginCondition(NoRecord,827)
      MisBeginCondition(NoMission,827)
      MisBeginAction(AddMission,827)
      MisBeginAction(AddTrigger, 8271, TE_KILL,239, 1)
      MisBeginAction(AddTrigger, 8272, TE_KILL,237, 1)
      MisBeginAction(AddTrigger, 8273, TE_KILL, 264, 1)
      MisBeginAction(AddTrigger, 8274, TE_KILL, 295, 1)
      MisBeginAction(AddTrigger, 8275, TE_KILL, 64, 1)
      MisBeginAction(AddTrigger, 8276, TE_KILL, 296, 1)
      MisBeginAction(AddTrigger, 8277, TE_KILL, 144, 1)
      MisCancelAction(ClearMission, 827)

      MisNeed(MIS_NEED_DESP, "Snowy Piglet, Piglet, Tusk Battle Boar, Air Porky, Mad Boar, Combat Piglet and Snowy Tusk Boar, 1 of each")
      MisNeed(MIS_NEED_KILL, 239, 1, 10, 1)
      MisNeed(MIS_NEED_KILL, 237, 1, 20, 1)
      MisNeed(MIS_NEED_KILL, 264, 1, 30, 1)
      MisNeed(MIS_NEED_KILL, 295, 1, 40, 1)
      MisNeed(MIS_NEED_KILL, 64, 1, 50, 1)
      MisNeed(MIS_NEED_KILL, 296, 1, 60, 1)
      MisNeed(MIS_NEED_KILL, 144, 1, 70, 1)


      MisHelpTalk("<t>Happy New Year, Fortune of 7 Pigs. ")  
      MisResultTalk("<t>Well done!")
      MisResultCondition(HasMission,827 )
      MisResultCondition(NoRecord,827)
      MisResultCondition(HasFlag, 827, 10)
      MisResultCondition(HasFlag, 827, 20)
      MisResultCondition(HasFlag, 827, 30)
      MisResultCondition(HasFlag, 827, 40)
      MisResultCondition(HasFlag, 827, 50)
      MisResultCondition(HasFlag, 827, 60)
      MisResultCondition(HasFlag, 827, 70)
      MisResultAction(GiveItem, 855, 10, 4 )
      MisResultAction(ClearMission, 827 )
      MisResultAction(SetRecord, 827)
      MisResultBagNeed(1)

      InitTrigger()
      TriggerCondition( 1, IsMonster, 239 )
      TriggerAction( 1, AddNextFlag, 827, 10, 1 )
      RegCurTrigger( 8271 )
       InitTrigger()
      TriggerCondition( 1, IsMonster, 237 )
      TriggerAction( 1, AddNextFlag, 827, 20, 1 )
      RegCurTrigger( 8272 )
       InitTrigger()
      TriggerCondition( 1, IsMonster,264  )
      TriggerAction( 1, AddNextFlag, 827, 30, 1 )
      RegCurTrigger( 8273 )
       InitTrigger()
      TriggerCondition( 1, IsMonster, 295 )
      TriggerAction( 1, AddNextFlag, 827, 40, 1 )
      RegCurTrigger( 8274 )
       InitTrigger()
      TriggerCondition( 1, IsMonster, 64 )
      TriggerAction( 1, AddNextFlag, 827, 50, 1 )
      RegCurTrigger( 8275 )
       InitTrigger()
      TriggerCondition( 1, IsMonster,296)
      TriggerAction( 1, AddNextFlag, 827, 60, 1 )
      RegCurTrigger( 8276 )

      InitTrigger()
      TriggerCondition( 1, IsMonster,144)
      TriggerAction( 1, AddNextFlag, 827, 70, 1 )
      RegCurTrigger( 8277 )

-------------------------------------------------幸运猪猪----------玛拉依兰	
	DefineMission (5506, "Lucky Piggy", 828)
	
	MisBeginTalk("<t>But without Lucky Piggy Clover, Piggy God will not bother with you! Go collect Lucky Piggy Clover! <bObtainable from Item Mall>. You will stand a chance to obtain Gem of Colossus, Gem of Rage, Gem of Striking, Gem of the Wind, Gem of Soul, Goddess's Pouch, First Prize etc! There will be a <r30000G handling fee>.")

	MisBeginCondition(NoMission,828)
	MisBeginCondition(HasRecord,827)
	MisBeginCondition(NoRecord,828)
	MisBeginAction(AddMission,828)
	MisBeginAction(AddTrigger, 8281, TE_GETITEM, 2908, 1)
	MisCancelAction(ClearMission, 828)
	
	MisNeed(MIS_NEED_ITEM, 2908, 1, 10, 1)
	

	MisHelpTalk("<t>Hurry on, surprise wait for no one")
	MisResultTalk("<t>Very well. The Piggy God has bestowed upon you this mystery treasure chest. Open it to take a look!")

	MisResultCondition(HasMission, 828)
	MisResultCondition(NoRecord,828)
	MisResultCondition(HasItem, 2908, 1)
	MisResultCondition(HasMoney, 30000)
	MisResultAction(TakeItem, 2908, 1 )
	MisResultAction(TakeMoney,30000 )
	MisResultAction(ClearMission, 828)
	MisResultAction(SetRecord,  828 )
	MisResultAction(GiveItem, 2909, 1, 4)
	MisResultAction(ClearRecord, 828)---------------可以反复接
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 2908)	
	TriggerAction( 1, AddNextFlag, 828, 10, 1 )
	RegCurTrigger( 8281 )

	
-----------------------------------------------海盗王压岁大礼---------白银商城新手指导
	DefineMission(5507,"Auspicious Gift",829)

      MisBeginTalk("<t> It's the Year of The Pig. Go catch 20 Piglets and y can receive a TOP's Auspicious packet.")

      MisBeginCondition(NoRecord,829)
      MisBeginCondition(NoMission,829)
      MisBeginCondition(LvCheck, ">",45)
      MisBeginAction(AddMission,829)
      MisBeginAction(AddTrigger, 8291, TE_KILL,237, 20)
      MisCancelAction(ClearMission, 829)

      MisNeed(MIS_NEED_DESP, "Catch 20 Piglets.")
      MisNeed(MIS_NEED_KILL, 237, 20, 10, 20)
     
      MisHelpTalk("<t>Time waits for no one.")  
      MisResultTalk("<t>Not bad! This is Tales of Pirates's Piggy Year Auspicious Bag! If you open it on Lunar New Year's Eve at the 17th February from 23:00 to 01:00 of 18th February, you stand a chance to win a super gift.")
      MisResultCondition(HasMission,829 )
      MisResultCondition(NoRecord,829)
      MisResultCondition(HasFlag, 829, 29)
      MisResultAction(GiveItem, 2910, 1, 4 )
      MisResultAction(ClearMission, 829 )
      MisResultAction(SetRecord, 829)
      MisResultBagNeed(1)

      InitTrigger()
      TriggerCondition( 1, IsMonster, 237 )
      TriggerAction( 1, AddNextFlag, 829, 10, 20 )
      RegCurTrigger( 8291 )
       
-------------------------------------------------情为何物----------玛拉依兰	
	DefineMission (5508, "What is love", 830)
	
	MisBeginTalk("<t>Love transends all things! If you believe in fate, I can help you fulfil your long cherished wish! But before that, you must first pass my Test, to prove ur worth.")

	MisBeginCondition(NoMission,830)
	MisBeginCondition(LvCheck, ">",30)
	MisBeginCondition(NoRecord,830)
	MisBeginAction(AddMission,830)
	MisBeginAction(AddTrigger, 8301, TE_GETITEM, 4418, 10 )
	MisCancelAction(ClearMission, 830)
	
	MisNeed(MIS_NEED_ITEM, 4418, 10, 10, 10 )
	

	MisHelpTalk("<t>Don't let your love ones wait too long!")
	MisResultTalk("<t>Very well! You have done well! This is a Chest of Fate. Open it and you will not be alone anymore!")

	MisResultCondition(HasMission, 830)
	MisResultCondition(NoRecord,830)
	MisResultCondition(HasItem, 4418, 10)
	MisResultAction(TakeItem, 4418, 10 )
	MisResultAction(ClearMission, 830)
	MisResultAction(SetRecord,  830 )
	MisResultAction(GiveItem, 2916, 1, 4)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 4418)	
	TriggerAction( 1, AddNextFlag, 830, 10, 10 )
	RegCurTrigger( 8301 )


	-------------------------------------------------倾城之恋----------玛拉依兰	
	DefineMission (5509, "Beautiful Love", 831)
	
	MisBeginTalk("<t>Youngster! Seek out your true love today! Look for the other half with a similar <bLove Number> and also a  <rRed Rope> to tie your fate together. I will await for both of you to bring me <rLove Amulets>.")

	MisBeginCondition(NoMission,831)
	MisBeginCondition(NoMission,832)
	MisBeginCondition(HasRecord,830)
	MisBeginCondition(NoRecord,831)
	MisBeginCondition(NoRecord,832)
	MisBeginCondition(NoChaType,1)
	MisBeginCondition(NoChaType,2)
	MisBeginCondition(HasItem, 2902, 1)
	MisBeginAction(AddTrigger, 8311, TE_GETITEM, 2903, 1 )
	MisBeginAction(AddTrigger, 8312, TE_GETITEM, 2845, 1 )
	MisBeginAction(AddMission,831)
	MisCancelAction(ClearMission, 831)
	

	MisNeed(MIS_NEED_ITEM, 2903, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 2845, 1, 20, 1 )


	MisHelpTalk("<t>Remember that you and your loved one need to bring <rAmulets with the same Love Number>")
	MisResultTalk("<t>Both of you are a matching couple! Congratulations! Allow me to award both of you with 2 Chest of Gown. A person can only open it once! May God bless you!")

	MisResultCondition(HasMission, 831)
	MisResultCondition(NoRecord,831)
	MisResultCondition(HasItem, 2902, 1)
	MisResultCondition(HasItem, 2903, 1)
	MisResultCondition(HasItem, 2845, 1)
	MisResultCondition(CheckItem,2902,2903)
	MisResultAction(TakeItem, 2902, 1 )
	MisResultAction(TakeItem, 2903, 1 )
	MisResultAction(TakeItem, 2845, 1 )
	MisResultAction(ClearMission, 831)
	MisResultAction(SetRecord,  831 )
	MisResultAction(GiveItem, 2915, 2, 4)
	MisResultAction(Starteffect,  370 )
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2903)	
	TriggerAction( 1, AddNextFlag, 831, 10, 1 )
	RegCurTrigger( 8311 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2845)	
	TriggerAction( 1, AddNextFlag, 831, 20, 1 )
	RegCurTrigger( 8312 )
		-------------------------------------------------倾城之恋----------玛拉依兰	
	DefineMission (5536, "Beautiful Love", 832)
	
	MisBeginTalk("<t>Youngster! Seek out your true love today! Look for the other half with a similar <bLove Number> and also a  <rRed Rope> to tie your fate together. I will await for both of you to bring me <rLove Amulets>.")

	MisBeginCondition(NoMission,832)
	MisBeginCondition(NoMission,831)
	MisBeginCondition(HasRecord,830)
	MisBeginCondition(NoRecord,831)
	MisBeginCondition(NoRecord,832)
	MisBeginCondition(NoChaType,3)
	MisBeginCondition(NoChaType,4)
	MisBeginCondition(HasItem, 2903, 1)
	MisBeginAction(AddTrigger, 8321, TE_GETITEM, 2902, 1 )
	MisBeginAction(AddTrigger, 8322, TE_GETITEM, 2845, 1 )
	MisBeginAction(AddMission,832)
	MisCancelAction(ClearMission, 832)
	

	MisNeed(MIS_NEED_ITEM, 2902, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 2845, 1, 20, 1 )


	MisHelpTalk("<t>Remember that you and your loved one need to bring <rAmulets with the same Love Number>")
	MisResultTalk("<t>Both of you are a matching couple! Congratulations! Allow me to award both of you with 2 Chest of Gown. A person can only open it once! May God bless you!")

	MisResultCondition(HasMission, 832)
	MisResultCondition(NoRecord,832)
	MisResultCondition(HasItem, 2902, 1)
	MisResultCondition(HasItem, 2903, 1)
	MisResultCondition(HasItem, 2845, 1)
	MisResultCondition(CheckItem,2902,2903)
	MisResultAction(TakeItem, 2902, 1 )
	MisResultAction(TakeItem, 2903, 1 )
	MisResultAction(TakeItem, 2845, 1 )
	MisResultAction(ClearMission, 832)
	MisResultAction(SetRecord,  832 )
	MisResultAction(GiveItem, 2915, 2, 4)
	MisResultAction(Starteffect,  370 )
	MisResultBagNeed(2)


	InitTrigger()
	TriggerCondition( 1, IsItem, 2902)	
	TriggerAction( 1, AddNextFlag, 832, 10, 1 )
	RegCurTrigger( 8321 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2845)	
	TriggerAction( 1, AddNextFlag, 832, 20, 1 )
	RegCurTrigger( 8322 )



	-------------------------------------------------挑战吉尼斯1	
	DefineMission (5510, "Challenge Genesis", 743)
	
	MisBeginTalk("<t>Want to be the number 1 pirate warrior? Feel like challenging your limit? Then come experience the Pirate King 07 Sea Course! You can start from Argent City and travel to Sara Haven. From there, the Harbor Operator will inform you of your next location. <rThis Challenge Letter can record your time. Now this letter have to be placed in the first slot of ur bag, and never must it be moved throughout the whole journey>, take it.")

	MisBeginCondition(NoMission,743)
	MisBeginCondition(NoRecord,743)
	MisBeginCondition(CheckBagEmp,0)
	MisBeginAction(AddMission,743)
	MisBeginAction(AddChaItem1, 2911)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	MisBeginBagNeed(1)
	
	MisNeed(MIS_NEED_DESP, "First stop is Sara Haven. Harbor Operator Whitneyis the one you should look for.")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯1

	DefineMission(5511,"Challenge Genesis",743,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Thanks for your trouble!")
	MisResultCondition(HasMission, 743)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultCondition(NoRecord,743)
	MisResultAction(ClearMission, 743)
	MisResultAction(SetRecord,743 )
	


	-------------------------------------------------挑战吉尼斯2	
	DefineMission (5512, "Challenge Genesis 2", 744)
	
	MisBeginTalk("<t>You are not that fast, someone already pass by here. Heres your pass. Be on your way now, Hubble Haven's Harbor Operator Dannis is waiting for you!")

	MisBeginCondition(NoMission,744)
	MisBeginCondition(HasRecord, 743)
	MisBeginCondition(NoRecord,744)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,744)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Hubble Haven. You will need to locate Harbor Operator - Dannis at (136, 3432)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯2

	DefineMission(5513,"Challenge Genesis 2",744,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Your sense of timing is really not strong")
	MisResultCondition(HasMission, 744)
	MisResultCondition(NoRecord,744)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 744)
	MisResultAction(SetRecord,  744 )

	

	-------------------------------------------------挑战吉尼斯3	
	DefineMission (5514, "Challenge Genesis", 745)
	
	MisBeginTalk("<t>This is your official letter! Go! Didance at Gelada Haven awaits you!")

	MisBeginCondition(NoMission,745)
	MisBeginCondition(HasRecord, 744)
	MisBeginCondition(NoRecord,745)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,745)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Gelada Haven, you need to locate Harbor Operator Didane at (1544, 3712)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯3

	DefineMission(5515,"Challenge Genesis",745,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Was your voyage smooth?")
	MisResultCondition(HasMission, 745)
	MisResultCondition(NoRecord,745)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 745)
	MisResultAction(SetRecord,  745 )



	-------------------------------------------------挑战吉尼斯4	
	DefineMission (5516, "Challenge Genesis 4", 746)
	
	MisBeginTalk("<t>I have been to busy to meet up with Harbor Operator - Soc of Ethio Haven lately.")

	MisBeginCondition(NoMission,746)
	MisBeginCondition(HasRecord, 745)
	MisBeginCondition(NoRecord,746)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,746)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Ethio Haven. You will need to locate Harbor Operator Soc at (3194, 3507)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯4

	DefineMission(5517,"Challenge Genesis 4",746,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>You should have salvaged some treasures throughout your journey. I heard that the Titanic sunk around here.")
	MisResultCondition(HasMission, 746)
	MisResultCondition(NoRecord,746)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 746)
	MisResultAction(SetRecord,  746 )
	


	-------------------------------------------------挑战吉尼斯5	
	DefineMission (5518, "Challenge Genesis 5", 747)
	
	MisBeginTalk("<t>Although the scenary on the sea is great, but time is precious! Theres only 1 set of Black Dragon equipment! And Karalas Haven is still far.")

	MisBeginCondition(NoMission,747)
	MisBeginCondition(HasRecord,746)
	MisBeginCondition(NoRecord,747)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,747)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Karmas Haven. You will need to locate Harbor Operator Odie at (738, 3803)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯5

	DefineMission(5519,"Challenge Genesis 5",747,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>You are as slow as a Sandy Tortoise!")
	MisResultCondition(HasMission, 747)
	MisResultCondition(NoRecord,747)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 747)
	MisResultAction(SetRecord,  747 )
	


	-------------------------------------------------挑战吉尼斯6	
	DefineMission (5520, "Challenge Genesis6", 748)
	
	MisBeginTalk("<t>The nearby islands may have Sirens. My advice is to sail straight to Salva Haven. If you hear any beautiful music, be sure to cover your ears.")

	MisBeginCondition(NoMission,748)
	MisBeginCondition(HasRecord,747)
	MisBeginCondition(NoRecord,748)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,748)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Salva Haven, you need to locate Harbor Operator Gregory at (194, 1715)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯6

	DefineMission(5521,"Challenge Genesis6",748,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Sail and courage is a must for a sea voyage")
	MisResultCondition(HasMission, 748)
	MisResultCondition(NoRecord,748)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 748)
	MisResultAction(SetRecord,  748 )
	


	-------------------------------------------------挑战吉尼斯7	
	DefineMission (5522, "Challenge Genesis 7", 749)
	
	MisBeginTalk("<t>Work harder! Do what an adventurer have to do! Next stop: Lahu Haven")

	MisBeginCondition(NoMission,749)
	MisBeginCondition(HasRecord,748)
	MisBeginCondition(NoRecord,749)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,749)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is at Lahu Haven. Look for Harbor Operator - Domoru (3498, 923)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯7

	DefineMission(5523,"Challenge Genesis 7",749,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Heard there is a lot of challengers? But...")
	MisResultCondition(HasMission, 749)
	MisResultCondition(NoRecord,749)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 749)
	MisResultAction(SetRecord,  749 )
	


	-------------------------------------------------挑战吉尼斯8	
	DefineMission (5524, "Challenge Genesis 8", 750)
	
	MisBeginTalk("<t>There is not much adventurer left on Lahu Haven. Did any misfortune befallen them? Aerase Haven's Harbor Operator - Buni should be all alone!")

	MisBeginCondition(NoMission,750)
	MisBeginCondition(HasRecord,749)
	MisBeginCondition(NoRecord,750)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,750)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is at Aerase Haven. Look for Harbor Operator - Buni at (2042, 635)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯8

	DefineMission(5525,"Challenge Genesis 8",750,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Looks like you are pretty lucky.You didn't met with a whirlpool nor get eaten by a sea monster")
	MisResultCondition(HasMission, 750)
	MisResultCondition(NoRecord,750)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 750)
	MisResultAction(SetRecord,  750 )
	
	

	-------------------------------------------------挑战吉尼斯9	
	DefineMission (5526, "Challenge Genesis 9", 751)
	
	MisBeginTalk("<t>Thinking of the days that I sailed in the sea...Oh sorry, forgot that you are in a hurry. Harbor Operator - Luigi is waiting for you at Norite Harbor Haven.")

	MisBeginCondition(NoMission,751)
	MisBeginCondition(HasRecord,750)
	MisBeginCondition(NoRecord,751)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,751)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Norite Harbor Haven. Look for Harbor Operator Luigi at (464, 468)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯9

	DefineMission(5527,"Challenge Genesis 9",751,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Buni always like to waste time! I hate this type of person. Don't be wishy washy like him! Ok...I shall say no more...")
	MisResultCondition(HasMission, 751)
	MisResultCondition(NoRecord,751)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 751)
	MisResultAction(SetRecord,  751 )
	



	-------------------------------------------------挑战吉尼斯10	
	DefineMission (5528, "Challenge Genesis10", 752)
	
	MisBeginTalk("<t>Next stop: Reagen Haven.")

	MisBeginCondition(NoMission,752)
	MisBeginCondition(HasRecord,751)
	MisBeginCondition(NoRecord,752)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,752)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Reagen Haven. You will have to locate Harbor Operator Fardell at (3153, 674)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯10

	DefineMission(5529,"Challenge Genesis10",752,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>I can't help but mention that you need to move faster!")
	MisResultCondition(HasMission, 752)
	MisResultCondition(NoRecord,752)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 752)
	MisResultAction(SetRecord,  752 )
	


	-------------------------------------------------挑战吉尼斯11	
	DefineMission (5530, "Challenge Genesis 11", 753)
	
	MisBeginTalk("<t>Somebody might have reached Hafta Haven! Please hurry!")

	MisBeginCondition(NoMission,753)
	MisBeginCondition(HasRecord,752)
	MisBeginCondition(NoRecord,753)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,753)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Hafta Haven. You need to find Harbor Operator - Whitcombe at (2041, 1355).")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯11

	DefineMission(5531,"Challenge Genesis 11",753,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Welcome to Hafta Haven!")
	MisResultCondition(HasMission, 753)
	MisResultCondition(NoRecord,753)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 753)
	MisResultAction(SetRecord,  753 )
	
	


	-------------------------------------------------挑战吉尼斯12	
	DefineMission (5532, "Challenge Genesis 12", 754)
	
	MisBeginTalk("<t>For honor and glory, you will have to work fast. Now go to Albania Haven!")

	MisBeginCondition(NoMission,754)
	MisBeginCondition(HasRecord,753)
	MisBeginCondition(NoRecord,754)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,754)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is Albania Haven. You will need to locate Harbor Operator - Daruka at (1497, 1707)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯12

	DefineMission(5533,"Challenge Genesis 12",754,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Are you sure that you have tried your best?")
	MisResultCondition(HasMission, 754)
	MisResultCondition(NoRecord,754)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(ClearMission, 754)
	MisResultAction(SetRecord,  754 )
	
	


	
	-------------------------------------------------挑战吉尼斯13	
	DefineMission (5534, "Challenge Genesis 13", 755)
	
	MisBeginTalk("<t>The goddess of victory is smiling at you! Rush towards the ending point now!")

	MisBeginCondition(NoMission,755)
	MisBeginCondition(HasRecord,754)
	MisBeginCondition(NoRecord,755)
	MisBeginCondition(CheckBag, 2911,0,1)
	MisBeginAction(AddMission,755)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed(MIS_NEED_DESP, "Next stop is at Thundoria Harbor. Look for Sailor Dio at (1083, 1285)")
	
	MisHelpTalk("<t>Everyone who wishes to obtain Black Dragon equipment are all fighting for it")
	MisResultCondition(AlwaysFailure )

	---------------------------------------挑战吉尼斯13

	DefineMission(5535,"Challenge Genesis 13",755,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>You are very brave. You are definitely  cut out to be a pirate. It will be a waste if you don't be one. This <rBawcock Letter> records the timing of your entire journey. Don't forget to collect your prize.")
	MisResultCondition(HasMission, 755)
	MisResultCondition(NoRecord,755)
	MisResultCondition(HasItem,2911,1)
	MisResultCondition(CheckBag, 2911,0,1)
	MisResultAction(AddChaItem2, 2912)
	MisResultAction(ClearMission, 755)
	MisResultAction(SetRecord,  755 )
	MisResultBagNeed(2)
	MisResultAction(ClearRecord, 743)---------------可以反复接
	MisResultAction(ClearRecord, 744)---------------可以反复接
	MisResultAction(ClearRecord, 745)---------------可以反复接
	MisResultAction(ClearRecord, 746)---------------可以反复接
	MisResultAction(ClearRecord, 747)---------------可以反复接
	MisResultAction(ClearRecord, 748)---------------可以反复接
	MisResultAction(ClearRecord, 749)---------------可以反复接
	MisResultAction(ClearRecord, 750)---------------可以反复接
	MisResultAction(ClearRecord, 751)---------------可以反复接
	MisResultAction(ClearRecord, 752)---------------可以反复接
	MisResultAction(ClearRecord, 753)---------------可以反复接
	MisResultAction(ClearRecord, 754)---------------可以反复接
	MisResultAction(ClearRecord, 755)---------------可以反复接

	-------------------------------------------------乱斗英雄----------少女莘蒂	
	DefineMission (5536, "Vampiric Aries Battle Hero", 1060)
	
	MisBeginTalk("<t>A challenging Hero must be a Chaos expert. 10 Chaos points should not daunt you. ")

	MisBeginCondition(NoMission,1060)
	MisBeginCondition(HasRecord,833)
	MisBeginCondition(NoRecord,1060)
	MisBeginAction(AddMission,1060)
	MisCancelAction(ClearMission, 1060)
	
	MisHelpTalk("<t>Its only 10 Chaos points. Work harder!")
	MisResultTalk("<t>I knew 10 Chaos points shouldn't be a problem for you")

	MisResultCondition(HasMission, 1060)
	MisResultCondition(NoRecord,1060)
	MisResultCondition(HasFightingPoint,10 )
	MisResultAction(TakeFightingPoint, 10 )
	MisResultAction(ClearMission, 1060)
	MisResultAction(SetRecord,  1060 )
	MisResultAction(GiveItem, 2944, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------少女莘蒂	
	DefineMission (5537, "Vampiric Aries Renown Hero", 1061)
	
	MisBeginTalk("<t>How to do a challenge without 500 reputation points! I believe you will have a way to gain reputation points, such as getting a disciple... ")

	MisBeginCondition(NoMission,1061)
	MisBeginCondition(HasRecord,833)
	MisBeginCondition(NoRecord,1061)
	MisBeginAction(AddMission,1061)
	MisCancelAction(ClearMission, 1061)
	
	MisHelpTalk("<t>Go now! I still have other important stuff to do!")
	MisResultTalk("<t>You sure have a way with this")

	MisResultCondition(HasMission, 1061)
	MisResultCondition(NoRecord,1061)
	MisResultCondition(HasCredit,500 )
	MisResultAction(DelRoleCredit, 500 )
	MisResultAction(ClearMission, 1061)
	MisResultAction(SetRecord,  1061 )
	MisResultAction(GiveItem, 2945, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------少女莘蒂	
	DefineMission (5538, "Vampiric Aries Hero", 1062)
	
	MisBeginTalk("<t>You need to be at least Lv 40. Don't tell me you cannot do it ")

	MisBeginCondition(NoMission,1062)
	MisBeginCondition(HasRecord,833)
	MisBeginCondition(NoRecord,1062)
	MisBeginAction(AddMission,1062)
	MisCancelAction(ClearMission, 1062)
	
	MisHelpTalk("<t>You better not return if you are lower than Lv 40")
	MisResultTalk("<t>You are so slow, I need to go out for a date soon")

	MisResultCondition(HasMission, 1062)
	MisResultCondition(NoRecord,1062)
	MisResultCondition(LvCheck, ">", 39 )
	MisResultAction(ClearMission, 1062)
	MisResultAction(SetRecord,  1062 )
	MisResultAction(GiveItem, 2946, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------少女莘蒂	
	DefineMission (5539, "Vampiric Aries Honorable Hero", 1063)
	
	MisBeginTalk("<t>Honor is the combination of both courage and wisdom. I believe you will not let me down. Earn yourself 100 Honor points ")

	MisBeginCondition(NoMission,1063)
	MisBeginCondition(HasRecord,833)
	MisBeginCondition(NoRecord,1063)
	MisBeginAction(AddMission,1063)
	MisCancelAction(ClearMission, 1063)
	
	MisHelpTalk("<t>I have a love letter to read. Remember to come back with Honor")
	MisResultTalk("<t>How should I reward you...How about a kiss?")

	MisResultCondition(HasMission, 1063)
	MisResultCondition(NoRecord,1063)
	MisResultCondition(HasHonorPoint,100 )
	MisResultAction(TakeHonorPoint, 100 )
	MisResultAction(ClearMission, 1063)
	MisResultAction(SetRecord,  1063 )
	MisResultAction(GiveItem, 2947, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------少女莘蒂	
	DefineMission (5540, "Vampiric Aries Gatherer Ambassador", 1064)
	
	MisBeginTalk("<t>Do you know that my friend has a Gatherer Emblem? If you wish to get it, prepare for yourself for some test. ")

	MisBeginCondition(NoMission,1064)
	MisBeginCondition(HasRecord,833)
	MisBeginCondition(NoRecord,1064)
	MisBeginAction(AddMission,1064)
	MisBeginAction(AddTrigger, 10641, TE_GETITEM, 3116, 15 )---------------精灵果15
	MisBeginAction(AddTrigger, 10642, TE_GETITEM, 1678, 15 )---------------羊绒15
	MisBeginAction(AddTrigger, 10643, TE_GETITEM, 4809, 15 )-------------南瓜头15
	MisBeginAction(AddTrigger, 10644, TE_GETITEM, 0855, 20 )---------------精灵硬币20
	MisBeginAction(AddTrigger, 10645, TE_GETITEM, 4503, 1 )---------------皇冠1个
	MisBeginAction(AddTrigger, 10646, TE_GETITEM, 1848, 50 )-------------面包50
	MisCancelAction(ClearMission, 1064)
	

	MisNeed(MIS_NEED_ITEM, 3116, 15, 1, 15 )
	MisNeed(MIS_NEED_ITEM, 1678, 15, 16, 15 )
	MisNeed(MIS_NEED_ITEM, 4809, 15, 31, 15 )
	MisNeed(MIS_NEED_ITEM, 0855, 20, 46, 20 )
	MisNeed(MIS_NEED_ITEM, 4503, 1, 66, 1 )
	MisNeed(MIS_NEED_ITEM, 1848, 50, 67, 50 )

	MisHelpTalk("<t>These items are not tough to find. Go now!")
	MisResultTalk("<t>I suspect you could actually gather alien matter")

	MisResultCondition(HasMission, 1064)
	MisResultCondition(NoRecord,1064)
	MisResultCondition(HasItem, 3116, 15 )
	MisResultCondition(HasItem, 1678, 15 )
	MisResultCondition(HasItem, 4809, 15 )
	MisResultCondition(HasItem, 0855, 20 )
	MisResultCondition(HasItem, 4503, 1 )
	MisResultCondition(HasItem, 1848, 50 )

	MisResultAction(TakeItem, 3116, 15 )
	MisResultAction(TakeItem, 1678, 15 )
	MisResultAction(TakeItem, 4809, 15 )
	MisResultAction(TakeItem, 0855, 20 )
	MisResultAction(TakeItem, 4503, 1 )
	MisResultAction(TakeItem, 1848, 50 )
	MisResultAction(ClearMission, 1064)
	MisResultAction(SetRecord,  1064 )
	MisResultAction(GiveItem, 2948, 1, 4)
	MisResultAction(GiveItem, 2990, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3116)	
	TriggerAction( 1, AddNextFlag, 1064, 1, 15 )
	RegCurTrigger( 10641 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1678)	
	TriggerAction( 1, AddNextFlag, 1064, 16, 15 )
	RegCurTrigger( 10642 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4809)	
	TriggerAction( 1, AddNextFlag, 1064, 31, 15 )
	RegCurTrigger( 10643 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0855)	
	TriggerAction( 1, AddNextFlag, 1064, 46, 20 )
	RegCurTrigger( 10644 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4503)	
	TriggerAction( 1, AddNextFlag, 1064, 66, 1 )
	RegCurTrigger( 10645 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1848)	
	TriggerAction( 1, AddNextFlag, 1064, 67, 50 )
	RegCurTrigger( 10646 )

	----------------------------------------------------------沉睡的白羊----------少女莘蒂
	DefineMission( 5541, "Vampiric Aries – Sleeping Aries", 1065 )
	MisBeginTalk("<t>There is a bad guy in shiny Aries armor nearby. Please help the villagers of Cupid Isle to get rid of him.")
				
	MisBeginCondition(NoMission, 1065)
	MisBeginCondition(HasRecord,836)
	MisBeginCondition(NoRecord,1065)
	MisBeginAction(AddMission,1065)
	MisBeginAction(AddTrigger, 10651, TE_KILL, 1009, 1)---白羊守护者
	
	MisCancelAction(ClearMission, 1065)

	MisNeed(MIS_NEED_DESP, "Kill the Aries Guardian on Cupid Isle at (2566, 2454)!")
	MisNeed(MIS_NEED_KILL, 1009,1, 10, 1)
	

	MisResultTalk("<t>Saving a damsel in distress does not happen daily. Moreover, he seldom appears.")
	MisHelpTalk("<t>Are you blessed by the gods? You seem invincible.")
	MisResultCondition(HasMission,  1065)
	MisResultCondition(HasFlag, 1065, 10)
	MisResultCondition(NoRecord , 1065)
	MisResultAction(GiveItem, 2950, 1, 4 )
	MisResultAction(ClearMission,  1065)
	MisResultAction(SetRecord,  1065 )
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 1009)	
	TriggerAction( 1, AddNextFlag, 1065, 10, 1 )
	RegCurTrigger( 10651 )






-------------------------------------------------乱斗英雄----------少女莘蒂	
	DefineMission (5542, "Vampiric Aries Battle Hero", 1066)
	
	MisBeginTalk("<t>Challenging Hero needs to be an expert in Chaos combat. 20 Chaos points should not deter you")

	MisBeginCondition(NoMission,1066)
	MisBeginCondition(HasRecord,834)
	MisBeginCondition(NoRecord,1066)
	MisBeginAction(AddMission,1066)
	MisCancelAction(ClearMission, 1066)
	
	MisHelpTalk("<t>Its only 20 Chaos points! Work harder!")
	MisResultTalk("<t>I knew that 20 Chaos points should not pose any difficulty for you")

	MisResultCondition(HasMission, 1066)
	MisResultCondition(NoRecord,1066)
	MisResultCondition(HasFightingPoint,20 )
	MisResultAction(TakeFightingPoint, 20 )
	MisResultAction(ClearMission, 1066)
	MisResultAction(SetRecord,  1066 )
	MisResultAction(GiveItem, 2944, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------少女莘蒂	
	DefineMission (5543, "Vampiric Aries Renown Hero", 1067)
	
	MisBeginTalk("<t>How can you do a challenge when you have less than 1000 reputation points? Try getting a disciple to increase your reputation points ")

	MisBeginCondition(NoMission,1067)
	MisBeginCondition(HasRecord,834)
	MisBeginCondition(NoRecord,1067)
	MisBeginAction(AddMission,1067)
	MisCancelAction(ClearMission, 1067)
	
	MisHelpTalk("<t>Go now! I still have other important stuff to do!")
	MisResultTalk("<t>You sure have a way with this")

	MisResultCondition(HasMission, 1067)
	MisResultCondition(NoRecord,1067)
	MisResultCondition(HasCredit,1000 )
	MisResultAction(DelRoleCredit, 1000 )
	MisResultAction(ClearMission, 1067)
	MisResultAction(SetRecord,  1067 )
	MisResultAction(GiveItem, 2945, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------少女莘蒂	
	DefineMission (5544, "Vampiric Aries Hero", 1068)
	
	MisBeginTalk("<t>You need to be at least Lv 45. Don't tell me you cannot do it ")

	MisBeginCondition(NoMission,1068)
	MisBeginCondition(HasRecord,834)
	MisBeginCondition(NoRecord,1068)
	MisBeginAction(AddMission,1068)
	MisCancelAction(ClearMission, 1068)
	
	MisHelpTalk("<t>Do not return if you are lower than Lv 45")
	MisResultTalk("<t>You are so slow, I need to go out for a date soon")

	MisResultCondition(HasMission, 1068)
	MisResultCondition(NoRecord,1068)
	MisResultCondition(LvCheck, ">", 44 )
	MisResultAction(ClearMission, 1068)
	MisResultAction(SetRecord,  1068 )
	MisResultAction(GiveItem, 2946, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------少女莘蒂	
	DefineMission (5545, "Vampiric Aries Honorable Hero", 1069)
	
	MisBeginTalk("<t> Honor is the combination of both courage and wisdom. I believe you will not let me down. Earn yourself 200 Honor points ")

	MisBeginCondition(NoMission,1069)
	MisBeginCondition(HasRecord,834)
	MisBeginCondition(NoRecord,1069)
	MisBeginAction(AddMission,1069)
	MisCancelAction(ClearMission, 1069)
	
	MisHelpTalk("<t>I have a love letter to read. Remember to come back with Honor")
	MisResultTalk("<t>How should I reward you...How about a kiss?")

	MisResultCondition(HasMission, 1069)
	MisResultCondition(NoRecord,1069)
	MisResultCondition(HasHonorPoint,200 )
	MisResultAction(TakeHonorPoint, 200 )
	MisResultAction(ClearMission, 1069)
	MisResultAction(SetRecord,  1069 )
	MisResultAction(GiveItem, 2947, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------少女莘蒂	
	DefineMission (5546, "Vampiric Aries Gatherer Ambassador", 1070)
	
	MisBeginTalk("<t>Do you know that my friend has a Gatherer Emblem? If you wish to get it, prepare for yourself for some test. ")

	MisBeginCondition(NoMission,1070)
	MisBeginCondition(HasRecord,834)
	MisBeginCondition(NoRecord,1070)
	MisBeginAction(AddMission,1070)
	MisBeginAction(AddTrigger, 10701, TE_GETITEM, 3116, 15 )---------------精灵果15
	MisBeginAction(AddTrigger, 10702, TE_GETITEM, 1678, 15 )---------------羊绒15
	MisBeginAction(AddTrigger, 10703, TE_GETITEM, 4809, 15 )-------------南瓜头15
	MisBeginAction(AddTrigger, 10704, TE_GETITEM, 0855, 20 )---------------精灵硬币20
	MisBeginAction(AddTrigger, 10705, TE_GETITEM, 4503, 1 )---------------皇冠1个
	MisBeginAction(AddTrigger, 10706, TE_GETITEM, 1848, 40 )-------------蛋糕40
	MisBeginAction(AddTrigger, 10707, TE_GETITEM, 2673, 10 )-------------幻影发生器LV1  10
	MisCancelAction(ClearMission, 1070)
	

	MisNeed(MIS_NEED_ITEM, 3116, 15, 1, 15 )
	MisNeed(MIS_NEED_ITEM, 1678, 15, 16, 15 )
	MisNeed(MIS_NEED_ITEM, 4809, 15, 31, 15 )
	MisNeed(MIS_NEED_ITEM, 0855, 20, 46, 20 )
	MisNeed(MIS_NEED_ITEM, 4503, 1, 66, 1 )
	MisNeed(MIS_NEED_ITEM, 1848, 40, 67, 40 )
	MisNeed(MIS_NEED_ITEM, 2673, 10, 107, 10 )

	MisHelpTalk("<t>These items are not tough to find. Go now!")
	MisResultTalk("<t>I suspect you could actually gather alien matter")

	MisResultCondition(HasMission, 1070)
	MisResultCondition(NoRecord,1070)
	MisResultCondition(HasItem, 3116, 15 )
	MisResultCondition(HasItem, 1678, 15 )
	MisResultCondition(HasItem, 4809, 15 )
	MisResultCondition(HasItem, 0855, 20 )
	MisResultCondition(HasItem, 4503, 1 )
	MisResultCondition(HasItem, 1848, 40 )
	MisResultCondition(HasItem, 2673, 10 )

	MisResultAction(TakeItem, 3116, 15 )
	MisResultAction(TakeItem, 1678, 15 )
	MisResultAction(TakeItem, 4809, 15 )
	MisResultAction(TakeItem, 0855, 20 )
	MisResultAction(TakeItem, 4503, 1 )
	MisResultAction(TakeItem, 1848, 40 )
	MisResultAction(TakeItem, 2673, 10 )
	MisResultAction(ClearMission, 1070)
	MisResultAction(SetRecord,  1070 )
	MisResultAction(GiveItem, 2948, 1, 4)
	MisResultAction(GiveItem, 2990, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3116)	
	TriggerAction( 1, AddNextFlag, 1070, 1, 15 )
	RegCurTrigger( 10701 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1678)	
	TriggerAction( 1, AddNextFlag, 1070, 16, 15 )
	RegCurTrigger( 10702 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4809)	
	TriggerAction( 1, AddNextFlag, 1070, 31, 15 )
	RegCurTrigger( 10703 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0855)	
	TriggerAction( 1, AddNextFlag, 1070, 46, 20 )
	RegCurTrigger( 10704 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4503)	
	TriggerAction( 1, AddNextFlag, 1070, 66, 1 )
	RegCurTrigger( 10705 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1848)	
	TriggerAction( 1, AddNextFlag, 1070, 67, 40 )
	RegCurTrigger( 10706 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2673)	
	TriggerAction( 1, AddNextFlag, 1070, 107, 10 )
	RegCurTrigger( 10707 )

	



-------------------------------------------------乱斗英雄----------少女莘蒂	
	DefineMission (5547, "Vampiric Aries Battle Hero", 1071)
	
	MisBeginTalk("<t>Challenging Hero must be a Chaos expert. 50 Chaos points should not be an issue. ")

	MisBeginCondition(NoMission,1071)
	MisBeginCondition(HasRecord,835)
	MisBeginCondition(NoRecord,1071)
	MisBeginAction(AddMission,1071)
	MisCancelAction(ClearMission, 1071)
	
	MisHelpTalk("<t>Its only 50 Chaos points. Work harder!")
	MisResultTalk("<t>I knew that 50 Chaos points shouldn't be a problem for you")

	MisResultCondition(HasMission, 1071)
	MisResultCondition(NoRecord,1071)
	MisResultCondition(HasFightingPoint,50 )
	MisResultAction(TakeFightingPoint, 50 )
	MisResultAction(ClearMission, 1071)
	MisResultAction(SetRecord,  1071 )
	MisResultAction(GiveItem, 2944, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------少女莘蒂	
	DefineMission (5548, "Vampiric Aries Renown Hero", 1072)
	
	MisBeginTalk("<t>How can a hero challenge with less than 3000 reputation points? I believe that you will have a way to gain those reputation, such as getting a disciple... ")

	MisBeginCondition(NoMission,1072)
	MisBeginCondition(HasRecord,835)
	MisBeginCondition(NoRecord,1072)
	MisBeginAction(AddMission,1072)
	MisCancelAction(ClearMission, 1072)
	
	MisHelpTalk("<t>Go now! I still have other important stuff to do!")
	MisResultTalk("<t>You sure have a way with this")

	MisResultCondition(HasMission, 1072)
	MisResultCondition(NoRecord,1072)
	MisResultCondition(HasCredit,3000 )
	MisResultAction(DelRoleCredit, 3000 )
	MisResultAction(ClearMission, 1072)
	MisResultAction(SetRecord,  1072 )
	MisResultAction(GiveItem, 2945, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------少女莘蒂	
	DefineMission (5549, "Vampiric Aries Hero", 1073)
	
	MisBeginTalk("<t>The minimum is Lv 50. Do not tell me you cannot do it ")

	MisBeginCondition(NoMission,1073)
	MisBeginCondition(HasRecord,835)
	MisBeginCondition(NoRecord,1073)
	MisBeginAction(AddMission,1073)
	MisCancelAction(ClearMission, 1073)
	
	MisHelpTalk("<t>You dare to return without reaching Lv 50?")
	MisResultTalk("<t>You are so slow, I need to go out for a date soon")

	MisResultCondition(HasMission, 1073)
	MisResultCondition(NoRecord,1073)
	MisResultCondition(LvCheck, ">", 49 )
	MisResultAction(ClearMission, 1073)
	MisResultAction(SetRecord,  1073 )
	MisResultAction(GiveItem, 2946, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------少女莘蒂	
	DefineMission (5550, "Vampiric Aries Honorable Hero", 1074)
	
	MisBeginTalk("<t>Honor is the combination of both courage and wisdom. I believe you will not let me down. Earn yourself 500 Honor points")

	MisBeginCondition(NoMission,1074)
	MisBeginCondition(HasRecord,835)
	MisBeginCondition(NoRecord,1074)
	MisBeginAction(AddMission,1074)
	MisCancelAction(ClearMission, 1074)
	
	MisHelpTalk("<t>I have a love letter to read. Remember to come back with Honor")
	MisResultTalk("<t>How should I reward you...How about a kiss?")

	MisResultCondition(HasMission, 1074)
	MisResultCondition(NoRecord,1074)
	MisResultCondition(HasHonorPoint,500 )
	MisResultAction(TakeHonorPoint, 500 )
	MisResultAction(ClearMission, 1074)
	MisResultAction(SetRecord,  1074 )
	MisResultAction(GiveItem, 2947, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------少女莘蒂	
	DefineMission (5551, "Vampiric Aries Gatherer Ambassador", 1075)
	
	MisBeginTalk("<t>Do you know that my friend has a Gatherer Emblem? If you wish to get it, prepare for yourself for some test. ")

	MisBeginCondition(NoMission,1075)
	MisBeginCondition(HasRecord,835)
	MisBeginCondition(NoRecord,1075)
	MisBeginAction(AddMission,1075)
	MisBeginAction(AddTrigger, 10751, TE_GETITEM, 3116, 15 )---------------精灵果15
	MisBeginAction(AddTrigger, 10752, TE_GETITEM, 1678, 15 )---------------羊绒15
	MisBeginAction(AddTrigger, 10753, TE_GETITEM, 4809, 15 )-------------南瓜头15
	MisBeginAction(AddTrigger, 10754, TE_GETITEM, 0855, 20 )---------------精灵硬币20
	MisBeginAction(AddTrigger, 10755, TE_GETITEM, 4503, 1 )---------------皇冠1个
	MisBeginAction(AddTrigger, 10756, TE_GETITEM, 1848, 40 )-------------蛋糕40
	MisBeginAction(AddTrigger, 10757, TE_GETITEM, 2673, 10 )-------------幻影发生器LV1  10
	MisBeginAction(AddTrigger, 10758, TE_GETITEM, 0227, 4 )-------------守护精灵饲料  4
	MisCancelAction(ClearMission, 1075)
	

	MisNeed(MIS_NEED_ITEM, 3116, 15, 1, 15 )
	MisNeed(MIS_NEED_ITEM, 1678, 15, 16, 15 )
	MisNeed(MIS_NEED_ITEM, 4809, 15, 31, 15 )
	MisNeed(MIS_NEED_ITEM, 0855, 20, 46, 20 )
	MisNeed(MIS_NEED_ITEM, 4503, 1, 66, 1 )
	MisNeed(MIS_NEED_ITEM, 1848, 40, 67, 40 )
	MisNeed(MIS_NEED_ITEM, 2673, 10, 107, 10 )
	MisNeed(MIS_NEED_ITEM, 0227, 4, 117, 4 )

	MisHelpTalk("<t>These items are not tough to find. Go now!")
	MisResultTalk("<t>I suspect you could actually gather alien matter")

	MisResultCondition(HasMission, 1075)
	MisResultCondition(NoRecord,1075)
	MisResultCondition(HasItem, 3116, 15 )
	MisResultCondition(HasItem, 1678, 15 )
	MisResultCondition(HasItem, 4809, 15 )
	MisResultCondition(HasItem, 0855, 20 )
	MisResultCondition(HasItem, 4503, 1 )
	MisResultCondition(HasItem, 1848, 40 )
	MisResultCondition(HasItem, 2673, 10 )
	MisResultCondition(HasItem, 0227, 4 )

	MisResultAction(TakeItem, 3116, 15 )
	MisResultAction(TakeItem, 1678, 15 )
	MisResultAction(TakeItem, 4809, 15 )
	MisResultAction(TakeItem, 0855, 20 )
	MisResultAction(TakeItem, 4503, 1 )
	MisResultAction(TakeItem, 1848, 40 )
	MisResultAction(TakeItem, 2673, 10 )
	MisResultAction(TakeItem, 0227, 4 )
	MisResultAction(ClearMission, 1075)
	MisResultAction(SetRecord,  1075 )
	MisResultAction(GiveItem, 2948, 1, 4)
	MisResultAction(GiveItem, 2990, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3116)	
	TriggerAction( 1, AddNextFlag, 1075, 1, 15 )
	RegCurTrigger( 10751 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1678)	
	TriggerAction( 1, AddNextFlag, 1075, 16, 15 )
	RegCurTrigger( 10752 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4809)	
	TriggerAction( 1, AddNextFlag, 1075, 31, 15 )
	RegCurTrigger( 10753 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0855)	
	TriggerAction( 1, AddNextFlag, 1075, 46, 20 )
	RegCurTrigger( 10754 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4503)	
	TriggerAction( 1, AddNextFlag, 1075, 66, 1 )
	RegCurTrigger( 10755 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1848)	
	TriggerAction( 1, AddNextFlag, 1075, 67, 40 )
	RegCurTrigger( 10756 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2673)	
	TriggerAction( 1, AddNextFlag, 1075, 107, 10 )
	RegCurTrigger( 10757 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0227)	
	TriggerAction( 1, AddNextFlag, 1075, 117, 4 )
	RegCurTrigger( 10758 )


	

	----------------------------------------------------------社交大使----------少女莘蒂
	DefineMission( 5552, "Vampiric Aries TOP Ambassador", 1076 )
	MisBeginTalk("<t>It takes intellect to become a pirate, to go around eating for free and having fun along the way, so you have to differentiate between important person and those who are not")
				
	MisBeginCondition(NoMission, 1076)
	MisBeginCondition(NoRecord,1076)
	MisBeginCondition(HasRecord, 836)
	MisBeginAction(AddMission,1076)
	MisCancelAction(ClearMission, 1076)

	MisNeed(MIS_NEED_DESP, "Look for Merman Prince Hassan in Shaitan at (1254, 3491)")
	
	MisHelpTalk("<t>You have to go even if you are familiar with that place. This is a quest")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使-----------------人鱼王子·哈沙特
	DefineMission(5553, "TOP Ambassador", 1076, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Do you know that I am the most handsome fellow here, and also the fastest swimmer!")
	MisResultCondition(NoRecord, 1076)
	MisResultCondition(HasMission,1076)
	MisResultAction(ClearMission,1076)
	MisResultAction(SetRecord, 1076)

	----------------------------------------------------------社交大使1----------人鱼王子·哈沙特
	DefineMission( 5554, "TOP Ambassador 2", 1077 )
	MisBeginTalk("<t>I prayed to the gods to turn me into a tree that she will pass by and rest upon daily. Indeed she do pass by that tree daily, but I have been turned into a fish...")
				
	MisBeginCondition(NoMission, 1077)
	MisBeginCondition(NoRecord,1077)
	MisBeginCondition(HasRecord, 1076)
	MisBeginAction(AddMission,1077)
	MisCancelAction(ClearMission, 1077)

	MisNeed(MIS_NEED_DESP, "Look for Strawberry in Icicle at (1010, 350)")
	
	MisHelpTalk("<t>I am only a little fish...air in the water...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使1-------------草莓优优
	DefineMission(5555, "TOP Ambassador 2", 1077, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Hi! My ambassador!")
	MisResultCondition(NoRecord, 1077)
	MisResultCondition(HasMission,1077)
	MisResultAction(ClearMission,1077)
	MisResultAction(SetRecord, 1077)

	----------------------------------------------------------社交大使2----------草莓优优
	DefineMission( 5556, "TOP Ambassador 3", 1078 )
	MisBeginTalk("<t>I look like a normal being on the outside. However, if you believe it to be so, may the lord bless you")
				
	MisBeginCondition(NoMission, 1078)
	MisBeginCondition(NoRecord,1078)
	MisBeginCondition(HasRecord, 1077)
	MisBeginAction(AddMission,1078)
	MisCancelAction(ClearMission, 1078)

	MisNeed(MIS_NEED_DESP, "Look for Oldman Blurry in Ascaron at (2272, 2700)")
	
	MisHelpTalk("<t>That adorable old man has an amazing talent")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使2--------老者·糊涂山人
	DefineMission(5557, "TOP Ambassador 3", 1078, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>A simple person can always find happiness...")
	MisResultCondition(NoRecord, 1078)
	MisResultCondition(HasMission,1078)
	MisResultAction(ClearMission,1078)
	MisResultAction(SetRecord, 1078)



	----------------------------------------------------------社交大使3----------老者·糊涂山人
	DefineMission( 5558, "TOP Ambassador 4", 1079 )
	MisBeginTalk("<t>Jealous of me? The wise are often inspired by music. Visit Musician - Shamel. He is wiser than me.")
				
	MisBeginCondition(NoMission, 1079)
	MisBeginCondition(NoRecord,1079)
	MisBeginCondition(HasRecord, 1078)
	MisBeginAction(AddMission,1079)
	MisCancelAction(ClearMission, 1079)

	MisNeed(MIS_NEED_DESP, "Look for Musician Shamel in Shaitan at (664, 3093)")
	
	MisHelpTalk("<t>Music can create miracle, remember this!")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使3--------乐器专家·沙梅洱
	DefineMission(5559, "TOP Ambassador 4", 1079, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Blurry is the Enlightened One!")
	MisResultCondition(NoRecord, 1079)
	MisResultCondition(HasMission,1079)
	MisResultAction(ClearMission,1079)
	MisResultAction(SetRecord, 1079)


	----------------------------------------------------------社交大使4----------乐器专家·沙梅洱
	DefineMission( 5560, "TOP Ambassador 5", 1080 )
	MisBeginTalk("<t>My dream is to create a paradise on earth with music. Do you have a dream as well? Is it the same as Lulu's?")
				
	MisBeginCondition(NoMission, 1080)
	MisBeginCondition(NoRecord,1080)
	MisBeginCondition(HasRecord, 1079)
	MisBeginAction(AddMission,1080)
	MisCancelAction(ClearMission, 1080)

	MisNeed(MIS_NEED_DESP, "Look for Lulu in Icicle at (2668, 634)")
	
	MisHelpTalk("<t>Dream is a shadow of reality...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使4--------鲁鲁
	DefineMission(5561, "TOP Ambassador 5", 1080, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I wish to have lollipops daily...")
	MisResultCondition(NoRecord, 1080)
	MisResultCondition(HasMission,1080)
	MisResultAction(ClearMission,1080)
	MisResultAction(SetRecord, 1080)


	----------------------------------------------------------社交大使5----------鲁鲁
	DefineMission( 5562, "TOP Ambassador 6", 1081 )
	MisBeginTalk("<t>If only I have lollipops to eat daily and the beautiful sister next door to accompany me to Ascaron to visit a friend whom I have never meet...")
				
	MisBeginCondition(NoMission, 1081)
	MisBeginCondition(NoRecord,1081)
	MisBeginCondition(HasRecord, 1080)
	MisBeginAction(AddMission,1081)
	MisCancelAction(ClearMission, 1081)

	MisNeed(MIS_NEED_DESP, "Look for Gregg in Ascaron at (526, 2432)")
	
	MisHelpTalk("<t>Please send my blessing for Gregg.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使5--------古力果
	DefineMission(5563, "TOP Ambassador 6", 1081, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>You are a friend of Lulu? Is Lulu well?")
	MisResultCondition(NoRecord, 1081)
	MisResultCondition(HasMission,1081)
	MisResultAction(ClearMission,1081)
	MisResultAction(SetRecord, 1081)



	----------------------------------------------------------社交大使6----------古力果
	DefineMission( 5564, "TOP Ambassador 7", 1082 )
	MisBeginTalk("<t>I love to get to know strangers from afar. But there is this guy Welly who keep telling me that he is a lamb. Could you check it out for me?")
				
	MisBeginCondition(NoMission, 1082)
	MisBeginCondition(NoRecord,1082)
	MisBeginCondition(HasRecord, 1081)
	MisBeginAction(AddMission,1082)
	MisCancelAction(ClearMission, 1082)

	MisNeed(MIS_NEED_DESP, "Look for Lamb Welly in Shaitan at (898, 3683)")
	
	MisHelpTalk("<t>How I wish Welly is a great knight...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使6--------小羊·威利
	DefineMission(5565, "TOP Ambassador 7", 1082, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>You never tell her? I used to be a normal lamb. It is only recently that I learnt how to speak human")
	MisResultCondition(NoRecord, 1082)
	MisResultCondition(HasMission,1082)
	MisResultAction(ClearMission,1082)
	MisResultAction(SetRecord, 1082)


	----------------------------------------------------------社交大使7----------小羊·威利
	DefineMission( 5566, "TOP Ambassador 8", 1083 )
	MisBeginTalk("<t>Do you want to be a TOP Hero? Let me introduce you to somebody. He is a challenging person!")
				
	MisBeginCondition(NoMission, 1083)
	MisBeginCondition(NoRecord,1083)
	MisBeginCondition(HasRecord, 1082)
	MisBeginAction(AddMission,1083)
	MisCancelAction(ClearMission, 1083)

	MisNeed(MIS_NEED_DESP, "Look for Doctor Minoseva in Ascaron at (1004, 2973)")
	
	MisHelpTalk("<t>Good luck, human!")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使8--------旅行医生·米奈希尔
	DefineMission(5567, "TOP Ambassador 8", 1083, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>It is ok that human misunderstood me, as they always quick to judge by the appearances. However, even sheeps are the same now. What is happening in the world now")
	MisResultCondition(NoRecord, 1083)
	MisResultCondition(HasMission,1083)
	MisResultAction(ClearMission,1083)
	MisResultAction(SetRecord, 1083)


	----------------------------------------------------------社交大使8----------旅行医生·米奈希尔
	DefineMission( 5568, "TOP Ambassador 9", 1084 )
	MisBeginTalk("<t>My kindness often goes unnoticed. I do not have a pair of charming eyes like Fey Fey. Please send my regards to her.")
				
	MisBeginCondition(NoMission, 1084)
	MisBeginCondition(NoRecord,1084)
	MisBeginCondition(HasRecord, 1083)
	MisBeginAction(AddMission,1084)
	MisCancelAction(ClearMission, 1084)

	MisNeed(MIS_NEED_DESP, "Look for Fey Fey in Shaitan at (797, 3129)")
	
	MisHelpTalk("<t>I want you to change your opinion of me.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使8--------菲菲
	DefineMission(5569, "TOP Ambassador 9", 1084, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Doctor – Minoseva is a quiet but nice person")
	MisResultCondition(NoRecord, 1084)
	MisResultCondition(HasMission,1084)
	MisResultAction(ClearMission,1084)
	MisResultAction(SetRecord, 1084)

	----------------------------------------------------------社交大使10----------菲菲
	DefineMission( 5572, "TOP Ambassador 10", 1086 )
	MisBeginTalk("<t>Don't talk about her anymore. I wish to meet this person named Elizabeth. I have picked up a floating bottle a couple of days ago and in it contains an invitation to a dance.")
				
	MisBeginCondition(NoMission, 1086)
	MisBeginCondition(NoRecord,1086)
	MisBeginCondition(HasRecord, 1084)
	MisBeginAction(AddMission,1086)
	MisCancelAction(ClearMission, 1086)

	MisNeed(MIS_NEED_DESP, "Look for Elizabeth in the Treasure Gulf at (616, 965)")
	
	MisHelpTalk("<t>Romantic dance...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使10--------伊丽莎白
	DefineMission(5573, "TOP Ambassador 10", 1086, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Somebody got my invitation? This is great! Thank you for bring me this good news.")
	MisResultCondition(NoRecord, 1086)
	MisResultCondition(HasMission,1086)
	MisResultAction(ClearMission,1086)
	MisResultAction(SetRecord, 1086)

	----------------------------------------------------------社交大使11----------伊丽莎白
	DefineMission( 5574, "TOP Ambassador 11", 1087 )
	MisBeginTalk("<t>My dance is going to start soon! Yet I have to fetch Wang Rong. Can you help me invite <bNavy HQ - General Ken>?")
				
	MisBeginCondition(NoMission, 1087)
	MisBeginCondition(NoRecord,1087)
	MisBeginCondition(HasRecord, 1086)
	MisBeginAction(AddMission,1087)
	MisCancelAction(ClearMission, 1087)

	MisNeed(MIS_NEED_DESP, "Look for Thundoria Castle's Navy HQ - General Ken at (808, 1521)")
	
	MisHelpTalk("<t>I want to get to know those girls...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使11--------海军总部指挥官·基.埃斯西准将
	DefineMission(5575, "TOP Ambassador 11", 1087, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I never reject invitation from a beautiful lady, hehe...")
	MisResultCondition(NoRecord, 1087)
	MisResultCondition(HasMission,1087)
	MisResultAction(ClearMission,1087)
	MisResultAction(SetRecord, 1087)

	----------------------------------------------------------社交大使12----------海军总部指挥官·基.埃斯西准将
	DefineMission( 5576, "TOP Ambassador 12", 1088 )
	MisBeginTalk("<t>I promised to write a poem for Momo in Shaitan. However, I am sick at the moment so could you tell her that I will send her a draft after I am well enough to start composing.")
				
	MisBeginCondition(NoMission, 1088)
	MisBeginCondition(NoRecord,1088)
	MisBeginCondition(HasRecord, 1087)
	MisBeginAction(AddMission,1088)
	MisCancelAction(ClearMission, 1088)

	MisNeed(MIS_NEED_DESP, "Look for Momo in Shaitan City at (1209, 3196)")
	
	MisHelpTalk("<t>A romantic dance will give me a perfect chance to woo her. Oh...my lovely Elizabeth...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使12--------蘑蘑
	DefineMission(5577, "TOP Ambassador 12", 1088, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>He is so tough yet he has fallen sick. Poor general")
	MisResultCondition(NoRecord, 1088)
	MisResultCondition(HasMission,1088)
	MisResultAction(ClearMission,1088)
	MisResultAction(SetRecord, 1088)


	----------------------------------------------------------社交大使13----------蘑蘑
	DefineMission( 5578, "TOP Ambassador 13", 1089 )
	MisBeginTalk("<t>Actually my friend idolize the general and wishes to get a copy of his manuscript. If you are free could you inform him for me? Thank you.")
				
	MisBeginCondition(NoMission, 1089)
	MisBeginCondition(NoRecord,1089)
	MisBeginCondition(HasRecord, 1088)
	MisBeginAction(AddMission,1089)
	MisCancelAction(ClearMission, 1089)

	MisNeed(MIS_NEED_DESP, "Look for Berry in Ascaron at (1893, 2812)")
	
	MisHelpTalk("<t>Berry will become a great poet one day")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使13--------淘淘
	DefineMission(5579, "TOP Ambassador 13", 1089, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>So the General also do falls ill?")
	MisResultCondition(NoRecord, 1089)
	MisResultCondition(HasMission,1089)
	MisResultAction(ClearMission,1089)
	MisResultAction(SetRecord, 1089)

	----------------------------------------------------------社交大使14----------淘淘
	DefineMission( 5580, "TOP Ambassador 14", 1090 )
	MisBeginTalk("<t>How I wish that the general will recover faster. Thank you. Let me introduce you to Wynne")
				
	MisBeginCondition(NoMission, 1090)
	MisBeginCondition(NoRecord,1090)
	MisBeginCondition(HasRecord, 1089)
	MisBeginAction(AddMission,1090)
	MisCancelAction(ClearMission, 1090)

	MisNeed(MIS_NEED_DESP, "Talk to Wynne of Icicle City at (1380, 523)")
	
	MisHelpTalk("<t>Wynne is in Icicle")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使14--------温莉·冰泉        
	DefineMission(5581, "TOP Ambassador 14", 1090, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I used to be beautiful before I fallen out of love.")
	MisResultCondition(NoRecord, 1090)
	MisResultCondition(HasMission,1090)
	MisResultAction(ClearMission,1090)
	MisResultAction(SetRecord, 1090)

	----------------------------------------------------------社交大使15----------温莉·冰泉
	DefineMission( 5582, "TOP Ambassador 15", 1091 )
	MisBeginTalk("<t>I am very  weak now. Please help me deliever a message to Don Pitt. I will put in a good word for you at Cindy if you will do me the favor")
				
	MisBeginCondition(NoMission, 1091)
	MisBeginCondition(NoRecord,1091)
	MisBeginCondition(HasRecord, 1090)
	MisBeginAction(AddMission,1091)
	MisCancelAction(ClearMission, 1091)

	MisNeed(MIS_NEED_DESP, "Look for Don Pitt in Ascaron at (1113, 2779)")
	
	MisHelpTalk("<t>I beg of you, I love him dearly")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使15-------- 瑞得·皮戈
	DefineMission(5583, "TOP Ambassador 15", 1091, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>My dear Wynne is looking pale! What should I do?")
	MisResultCondition(NoRecord, 1091)
	MisResultCondition(HasMission,1091)
	MisResultAction(ClearMission,1091)
	MisResultAction(SetRecord, 1091)


	----------------------------------------------------------社交大使16----------瑞得·皮戈
	DefineMission( 5584, "TOP Ambassador 16", 1092 )
	MisBeginTalk("<t>Actually I haven already forgiven her. However, I have been so busy that I forgot to write to her. Please help me inform Oracle – Moonlight that I will look for her soon")
				
	MisBeginCondition(NoMission, 1092)
	MisBeginCondition(NoRecord,1092)
	MisBeginCondition(HasRecord, 1091)
	MisBeginAction(AddMission,1092)
	MisCancelAction(ClearMission, 1092)

	MisNeed(MIS_NEED_DESP, "Look for Oracle Moonlight in Icicle at (2134, 555)")
	
	MisHelpTalk("<t>I believe Oracle will understand")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使16-------- 通灵者·月光眼
	DefineMission(5585, "TOP Ambassador 16", 1092, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>He has done right. If I could give in in the past, I would not have lost my loved one.")
	MisResultCondition(NoRecord, 1092)
	MisResultCondition(HasMission,1092)
	MisResultAction(ClearMission,1092)
	MisResultAction(SetRecord, 1092)


	----------------------------------------------------------社交大使17----------通灵者·月光眼
	DefineMission( 5586, "TOP Ambassador 17", 1093 )
	MisBeginTalk("<t>All is in the past. What worries me most is Durian's greedy appetite")
				
	MisBeginCondition(NoMission, 1093)
	MisBeginCondition(NoRecord,1093)
	MisBeginCondition(HasRecord, 1092)
	MisBeginAction(AddMission,1093)
	MisCancelAction(ClearMission, 1093)

	MisNeed(MIS_NEED_DESP, "Look for Durian in Ascaron at (1535, 3071)")
	
	MisHelpTalk("<t>Durian seems like a kid. He is always daydreaming")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使17-------- 榴莲
	DefineMission(5587, "TOP Ambassador 17", 1093, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I am satisfied with my illness. It is keeping me slim.")
	MisResultCondition(NoRecord, 1093)
	MisResultCondition(HasMission,1093)
	MisResultAction(ClearMission,1093)
	MisResultAction(SetRecord, 1093)

	----------------------------------------------------------社交大使18----------榴莲
	DefineMission( 5588, "TOP Ambassador 18", 1094 )
	MisBeginTalk("<t>Having some many to be concern over my illness can be irritating at times. Please help me send a message to <bNana> in Icicle Haven and tell her that I am well")
				
	MisBeginCondition(NoMission, 1094)
	MisBeginCondition(NoRecord,1094)
	MisBeginCondition(HasRecord, 1093)
	MisBeginAction(AddMission,1094)
	MisCancelAction(ClearMission, 1094)

	MisNeed(MIS_NEED_DESP, "Look for Nana in Icicle at (798, 369)")
	
	MisHelpTalk("<t>How I wish to be full")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使18-------- 奈奈
	DefineMission(5589, "TOP Ambassador 18", 1094, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Actually I am quite jealous of her")
	MisResultCondition(NoRecord, 1094)
	MisResultCondition(HasMission,1094)
	MisResultAction(ClearMission,1094)
	MisResultAction(SetRecord, 1094)

	----------------------------------------------------------社交大使19----------奈奈
	DefineMission( 5590, "TOP Ambassador 19", 1095 )
	MisBeginTalk("<t>I have been busy composing poems nowadays. Please help me send a message to <bAzur Breeze >.")
				
	MisBeginCondition(NoMission, 1095)
	MisBeginCondition(NoRecord,1095)
	MisBeginCondition(HasRecord, 1094)
	MisBeginAction(AddMission,1095)
	MisCancelAction(ClearMission, 1095)

	MisNeed(MIS_NEED_DESP, "Look for Azur Breeze in Ascaron at (624, 2105)")
	
	MisHelpTalk("<t>Homeric is the greatest poet of the world")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使19-------- 海蓝·微风
	DefineMission(5591, "TOP Ambassador 19", 1095, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Ah...Wrinkles! Ah...")
	MisResultCondition(NoRecord, 1095)
	MisResultCondition(HasMission,1095)
	MisResultAction(ClearMission,1095)
	MisResultAction(SetRecord, 1095)


		----------------------------------------------------------社交大使20----------海蓝·微风
	DefineMission( 5592, "TOP Ambassador 20", 1096 )
	MisBeginTalk("<t>If I am so wise, I would have knew how did that sea monster find our ship during that time. And I would not have request the help of that person...Please help me tell him that I have not forgotten about him")
				
	MisBeginCondition(NoMission, 1096)
	MisBeginCondition(NoRecord,1096)
	MisBeginCondition(HasRecord, 1095)
	MisBeginAction(AddMission,1096)
	MisCancelAction(ClearMission, 1096)

	MisNeed(MIS_NEED_DESP, "Look for Abaddon Teleporter at (690, 1043)")
	
	MisHelpTalk("<t>Thank you, go now.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使20-------- 地狱传送使
	DefineMission(5593, "TOP Ambassador 20", 1096, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>That happens many years ago, I am surprised that he still remembers")
	MisResultCondition(NoRecord, 1096)
	MisResultCondition(HasMission,1096)
	MisResultAction(ClearMission,1096)
	MisResultAction(SetRecord, 1096)

		----------------------------------------------------------社交大使21----------地狱传送使
	DefineMission( 5594, "TOP Ambassador 21", 1097 )
	MisBeginTalk("<t>Want to do me a favor? Hmm...I miss the Heaven Teleporter...And also the money he stole from me. Please remind him so")
				
	MisBeginCondition(NoMission, 1097)
	MisBeginCondition(NoRecord,1097)
	MisBeginCondition(HasRecord, 1096)
	MisBeginAction(AddMission,1097)
	MisCancelAction(ClearMission, 1097)

	MisNeed(MIS_NEED_DESP, "Look for Heaven Teleporter at (474, 1054)")
	
	MisHelpTalk("<t>I am the one in debt at this time of the year")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使21-------- 天堂传送使
	DefineMission(5595, "TOP Ambassador 21", 1097, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>So petty, its only a small sum.")
	MisResultCondition(NoRecord, 1097)
	MisResultCondition(HasMission,1097)
	MisResultAction(ClearMission,1097)
	MisResultAction(SetRecord, 1097)

	----------------------------------------------------------社交英雄22----------天堂传送使
	DefineMission( 5596, "TOP Hero 22", 1098 )
	MisBeginTalk("<t>Congratulations, you have completed the arduous TOP quest. I heard <bCindy> is looking for you")
				
	MisBeginCondition(NoMission, 1098)
	MisBeginCondition(NoRecord,1098)
	MisBeginCondition(HasRecord, 1097)
	MisBeginAction(AddMission,1098)
	MisCancelAction(ClearMission, 1098)

	MisNeed(MIS_NEED_DESP, "Look for Cindy at (740, 1451)")
	
	MisHelpTalk("<t>I am the one in debt at this time of the year")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交英雄22------- 辛蒂
	DefineMission(5597, "TOP Hero 22", 1098, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>You have passed TOP test, I will award you with an emblem")
	MisResultCondition(NoRecord, 1098)
	MisResultCondition(HasMission,1098)
	MisResultAction(ClearMission,1098)
	MisResultAction(SetRecord, 1098)
	MisResultAction(GiveItem, 2949, 1, 4)
	MisResultBagNeed(1)




	

	-------------------------------------------------特别任务	
	DefineMission (5600, "Special Operation – Vampiric Aries", 1101)
	
	MisBeginTalk("<t>This quest is specially for Aries Palace. You can choose not to participate but there will be no prizes for you. <bTo kill 99 Mystic Shrubs in 15 minutes is not an easy task.>")

	MisBeginCondition(NoMission,1101)
	MisBeginCondition(NoRecord,1101)
	MisBeginCondition(HasRecord,835)
	MisBeginCondition(HasRecord,1071)
	MisBeginCondition(HasRecord,1072)
	MisBeginCondition(HasRecord,1073)
	MisBeginCondition(HasRecord,1074)
	MisBeginCondition(HasRecord,1075)
	MisBeginCondition(HasRecord,1065)
	MisBeginCondition(HasRecord,1098)
	MisBeginAction(AddMission,1101)
	MisBeginAction(AddChaItem3, 2952)---------特别行动卡
	MisBeginAction(AddTrigger, 11011, TE_KILL, 75, 99 )
	MisCancelAction(ClearMission, 1101)
	MisBeginBagNeed(1)
	
	MisNeed(MIS_NEED_KILL, 75, 99, 1, 99)

	MisHelpTalk("<t>Go now! You only have 15 minutes")
	MisResultTalk("<t>Not too bad, you will not regret it.")


	MisResultCondition(HasMission, 1101)
	MisResultCondition(NoRecord,1101)
	MisResultCondition(HasFlag, 1101, 99 )
	MisResultAction(AddChaItem4, 2952)----特别行动卡
	MisResultAction(ClearMission, 1101)
	MisResultAction(SetRecord,  1101 )
	MisResultAction(GiveItem, 2955, 1, 4)------------白羊船长酷装宝箱
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 75)	
	TriggerAction( 1, AddNextFlag, 1101, 1, 99 )
	RegCurTrigger( 11011 )





	----------------------------------------------------------愚人节的果实
	DefineMission( 5601, "Fruit of April's Fool", 1102)

	MisBeginTalk( "<t>Today is April’s Fool day! I love to make a fool out of others. Do you dare to take up my challenge? I got some surprising rewards to be claimed. Ok, the first task: Collect 100 Elven Fruits!" )
	MisBeginCondition(NoRecord, 1102)
	MisBeginCondition(NoMission, 1102)
	MisBeginCondition(LvCheck, ">", 10 )
	MisBeginAction(AddMission, 1102)
	MisBeginAction(AddTrigger, 11021, TE_GETITEM, 3116, 100 )		
	MisCancelAction(ClearMission, 1102)
	
	MisNeed(MIS_NEED_ITEM, 3116, 100, 10, 100)

	MisResultTalk("<t>You are quite honest. I shall give you an April’s Fool Gift")
	MisHelpTalk("<t>What use does 100 Cute Fruit of April’s Fool have? I am also unsure...")
	MisResultCondition(HasMission, 1102)
	MisResultCondition(HasItem, 3116, 100 )
	MisResultAction(TakeItem, 3116, 100 )
	MisResultAction(ClearMission, 1102)
	MisResultAction(SetRecord, 1102 )
	MisResultAction(GiveItem, 2953, 1, 4)------------愚人节的礼物
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 3116)	
	TriggerAction( 1, AddNextFlag, 1102, 10, 100 )
	RegCurTrigger( 11021 )



	------------------------------------------------------愚人节的慷慨
	DefineMission( 5602, "April’s Fool Bounty", 1103)

	MisBeginTalk( "<t>I would like to borrow some gold from you, please do not reject me! My bunny baby is going to school soon and I need 1000000 gold! Lend me please!" )
	MisBeginCondition(NoRecord, 1103)
	MisBeginCondition(HasRecord, 1102)
	MisBeginCondition(NoMission, 1103)
	MisBeginAction(AddMission, 1103)	
	MisCancelAction(ClearMission, 1103)
	
	MisResultTalk("<t>You do not expect me to return you the gold?!")
	MisHelpTalk("<t>Do not be so petty, I might have a surprise for you")
	MisResultCondition(HasMission, 1103)
	MisResultCondition(HasMoney, 1000000 )
	MisResultAction(TakeMoney, 1000000 )
	MisResultAction(ClearMission, 1103)
	MisResultAction(SetRecord, 1103 )



	------------------------------------------------------愚人节的死神
	DefineMission( 5603, "Death of April’s Fool", 1104)

	MisBeginTalk( "<t>How can you be so naive to believe this? Haha! Want me to return the money? No possible, unless you die 41 times again and I will reconsider" )
	MisBeginCondition(NoRecord, 1104)
	MisBeginCondition(HasRecord, 1103)
	MisBeginCondition(NoMission, 1104)
	MisBeginCondition(HaveNoItem, 2954)
	MisBeginAction(AddMission, 1104)	
	MisBeginAction(GiveItem, 2954, 1, 4)------------死亡证明
	MisCancelAction(ClearMission, 1104)
	MisBeginBagNeed(1)
	
	MisResultTalk("<t>You are indeed the most blur and adorable person in Pirate King Online. Never mind...I will tell give you some consolation.")
	MisHelpTalk("<t>What is Death? Is there no fear?")
	MisResultCondition(HasMission, 1104)
	MisResultCondition(CheckPoint, 2954 )
	MisResultAction(TakeItem, 2954,1,4)
	MisResultAction(GiveItem, 0853,1,4)
	MisResultAction(ClearMission, 1104)
	MisResultAction(SetRecord, 1104 )
	MisResultBagNeed(1)


--------------------------------------------------谁是守护者--------路人·丁
	DefineMission( 6015, "Who is the Guardian", 1013, COMPLETE_SHOW )

	MisBeginCondition(AlwaysFailure )

	MisResultTalk("<t>Tutu is always creating trouble for me")
	MisResultCondition(NoRecord, 1013)
	MisResultCondition(HasMission, 1013)
	MisResultAction(SetRecord, 1013)
	MisResultAction(ClearMission, 1013)

--------------------------------------------------难？还是烦？-------路人·丁
	DefineMission( 6016, "Tough? Or troublesome?", 1014)
	MisBeginTalk("<t>Path to rebirth is never simple. Go and inquire from Clan Chief Albuda.")
	MisBeginCondition(NoRecord, 1014)
	MisBeginCondition(NoMission, 1014)
	MisBeginCondition(HasRecord, 1013)
	MisBeginAction(AddMission, 1014)
	MisBeginAction(ZSSTART)
	MisCancelAction(ClearMission, 1014)

	MisNeed(MIS_NEED_DESP, "<t>Look for Clan Chief Albuda to understand about the problem of rebirth")
	MisHelpTalk("<t>Look for Clan Chief Albuda in Shaitan City.")

	MisResultCondition(AlwaysFailure)



---------------------------------------------------难？还是烦？----------氏族长·阿布多罗.李
	DefineMission( 6017, "Tough? Or irritating?", 1014, COMPLETE_SHOW )
	MisBeginCondition(AlwaysFailure )
	MisResultTalk("<t>Have you made your decision? If you wish to change your decision in the future, look for me again but there will be a price to pay")
	MisResultCondition(NoRecord, 1014)
	MisResultCondition(HasMission, 1014)
	MisResultCondition(HasRecord, 1059)
	MisResultAction(ClearMission, 1014)
	MisResultAction(SetRecord, 1014)
	

---------------------------------------------------继续转生之路-----------氏族长·阿布多罗.李
	DefineMission( 6018, "Continue the path of rebirth", 1017)
	MisBeginTalk("<t>You have chosen your own path. Now look for Tink. He will guide you.")
	MisBeginCondition(NoRecord, 1017)
	MisBeginCondition(NoMission, 1017)
	MisBeginCondition(HasRecord, 1014)
	MisBeginAction(AddMission, 1017)
	MisCancelAction(ClearMission, 1017)

	MisNeed(MIS_NEED_DESP, "<t>Look for Passerby - Tink")
	MisHelpTalk("<t>Look for Tink now.")

	MisResultCondition(AlwaysFailure)

--------------------------------------------------继续转生之路---------------路人·丁
	DefineMission( 6019, "Continue the path of rebirth", 1017, COMPLETE_SHOW )
	MisBeginCondition(AlwaysFailure)
	MisResultTalk("<t>Have you selected your path? Let us continue!")
	MisResultCondition(NoRecord, 1017)
	MisResultCondition(HasMission, 1017)
	MisResultAction(ClearMission, 1017)
	MisResultAction(SetRecord, 1017)

---------------------------------------------------艰巨的任务---------路人·丁
	DefineMission( 6020, "Arduous Quest", 1018)
	MisBeginTalk("<t>Since you have selected the tough difficulty, I will give you a pointer or two. However, help me teach some guys a lesson first.")
	MisBeginCondition(NoRecord,1000)
	MisBeginCondition(HasRecord,1017)
	MisBeginCondition(HasRecord,1015)
	MisBeginCondition(NoRecord,1018)
	MisBeginCondition(NoMission,1018)
	MisBeginAction(AddMission,1018)
	MisBeginAction(AddTrigger, 10181, TE_KILL,678, 1)
	MisBeginAction(AddTrigger, 10182, TE_KILL,679, 1)
	MisBeginAction(AddTrigger, 10183, TE_KILL,789, 1)
	MisCancelAction(ClearMission,1018)

	MisNeed(MIS_NEED_DESP, "Defeat Snowman Warlord, Wandering Soul and Black Dragon")
	MisNeed(MIS_NEED_KILL, 678, 1, 10, 1)
	MisNeed(MIS_NEED_KILL, 679, 1, 20, 1)
	MisNeed(MIS_NEED_KILL, 789, 1, 30, 1)

	MisHelpTalk("<t>One person is not enough. Look for some friends!")
	MisResultTalk("<t>Thank you my friend, this is what you needed.")
	MisResultCondition(HasMission,1018)
	MisResultCondition(NoRecord,1018)
	MisResultCondition(HasFlag, 1018, 10)
	MisResultCondition(HasFlag, 1018, 20)
	MisResultCondition(HasFlag, 1018, 30)
	MisResultAction(SetRecord,1018)
	MisResultAction(SetRecord,1056)
	MisResultAction(ClearMission,1018)
	MisResultAction(GiveItem, 2229, 1, 4)
	MisResultAction(GiveItem, 2230, 1, 4)
	MisResultAction(GiveItem, 2231, 1, 4)
	MisResultAction(GiveItem, 2232, 1, 4)
	MisResultAction(GiveItem, 2233, 1, 4)
	MisResultBagNeed(5)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 678 )
	TriggerAction( 1, AddNextFlag, 1018, 10, 1 )
	RegCurTrigger( 10181 )
	InitTrigger()
	TriggerCondition( 1, IsMonster, 679 )
	TriggerAction( 1, AddNextFlag, 1018, 20, 1 )
	RegCurTrigger( 10182 )
	InitTrigger()
	TriggerCondition( 1, IsMonster, 789 )
	TriggerAction( 1, AddNextFlag, 1018, 30, 1 )
	RegCurTrigger( 10183 )

----------------------------------------------限时的挑战---------路人·丁
	DefineMission( 6021, "Time0based Challenge", 1019)
	MisBeginTalk("<t>You selected the troublesome path? Ok, have you heard about the Genesis Challenge? You will have to complete it in 30 minutes")
	MisBeginCondition( NoRecord, 1000)
	MisBeginCondition( NoRecord, 1019)
	MisBeginCondition( NoMission, 1019)
	MisBeginCondition( HasRecord, 1017)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1019)
	MisCancelAction(ClearMission,1019)

	MisNeed(MIS_NEED_DESP, "Complete Genesis challenge in 30 minutes")

	MisHelpTalk("<t>If the timing recorded on the Bawcock Letter is less than 1800 secs, I will consider you to be through. Please note to bring only 1 Bawcock Letter!")
	MisResultTalk("<t>It’s so fun")
	MisResultCondition( HasItem, 2912, 1)
	MisResultCondition( LessTime, 1800)
	MisResultCondition( NoRecord, 1019)
	MisResultCondition( HasMission, 1019)
	MisResultAction( SetRecord, 1019)
	MisResultAction( ClearMission, 1019)


--------------------------------------------限时的挑战-------------路人·丁
	DefineMission( 6022, "Time0based Challenge", 1020)
	MisBeginTalk("<t>Go for another round. However, please take your time to do it. Try to finish it between 7 hours to 8 hours.")
	MisBeginCondition( NoRecord, 1020)
	MisBeginCondition( NoMission, 1020)
	MisBeginCondition( HasRecord, 1019)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1020)
	MisCancelAction( ClearMission, 1020)

	MisNeed(MIS_NEED_DESP, "You need to complete Genesis Challenge between 7 hours to 8 hours")

	MisHelpTalk("<t>The recorded timing on the Bawcock Letter must be higher than 25200 secs and lower than 28800 secs. I only accept if you have 1 Bawcock Letter!")
	MisResultTalk("<t>Isn't the scenery nice?")
	MisResultCondition( MoreTime, 25200)
	MisResultCondition( LessTime, 28800)
	MisResultCondition( NoRecord, 1020)
	MisResultCondition( HasMission, 1020)
	MisResultAction( SetRecord, 1020)
	MisResultAction( ClearMission, 1020)



-----------------------------------------------限时的挑战------------路人·丁
	DefineMission( 6023, "Time0based Challenge", 1021)
	MisBeginTalk("<t>Do the run once more. You will need to complete the journey between 5 hours to 5.5 hours.")
	MisBeginCondition( NoRecord, 1021)
	MisBeginCondition( NoMission, 1021)
	MisBeginCondition( HasRecord, 1020)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1021)
	MisCancelAction( ClearMission, 1021)

	MisNeed(MIS_NEED_DESP, "Complete Genesis Challenge must be between 5 hours to 5 hours 30 minutes")

	MisHelpTalk("<t>The recorded timing on the Bawcock Letter must be between 18000 secs to 19800 secs. Please note to bring only 1 Bawcock Letter!")
	MisResultTalk("<t>I recognize your effort on this!")
	MisResultCondition( LessTime, 19800)
	MisResultCondition( MoreTime, 18000)
	MisResultCondition( NoRecord, 1021)
	MisResultCondition( HasMission, 1021)

	MisResultAction( SetRecord, 1021)
	MisResultAction( ClearMission, 1021)

---------------------------------------------寻访雷霆守护者------路人·丁
	DefineMission( 6024, "Visit the guardian of Thundoria", 1022)
	MisBeginTalk("<t>Next guardian is at Thundoria Castle. Look for him there.")
	MisBeginCondition( NoRecord, 1022)
	MisBeginCondition( NoMission, 1022)
	MisBeginCondition( HasRecord, 1021)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1022)
	MisCancelAction( ClearMission, 1022)

	MisNeed(MIS_NEED_DESP, "Look for the guardian of Thundoria Castle")
	MisHelpTalk("<t>Look for him in Thundoria Castle")

	MisResultCondition(AlwaysFailure)

-----------------------------------------------寻访雷霆守护者--------白银城驻雷霆堡大使·伊塔多
	DefineMission( 6025, "Visit the guardian of Thundoria", 1022,COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure )

	MisResultTalk("<t>You are finally here!")
	MisResultCondition( NoRecord, 1022)
	MisResultCondition( HasMission, 1022)
	MisResultAction( SetRecord, 1022)
	MisResultAction( ClearMission, 1022)

-------------------------------------------------白羊宫的战斗---------------白银城驻雷霆堡大使·伊塔多
	DefineMission( 6026, "Battle of Aries Palace", 1023)
	MisBeginTalk("<t>The wheel of fate has started to turn! Enter the gate of the Horoscope Palace now and seek the Seal of Aries in Aries Palace")
	MisBeginCondition( NoRecord, 1023)
	MisBeginCondition( NoMission, 1023)
	MisBeginCondition( HasRecord, 1022)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1023)
	MisBeginAction(AddTrigger, 10231, TE_GETITEM, 2942, 1 )
	MisCancelAction( ClearMission, 1023)

	MisNeed(MIS_NEED_DESP, "Wear a full set of Aries apparel and bring the Seal of Aries to Argent Ambassador – Yata in Thundoria")
	MisNeed(MIS_NEED_ITEM, 2942, 1, 10 ,1)

	MisHelpTalk("<t>Wear the apparel set of Aries Palace to welcome me")
	MisResultTalk("<t>You are indeed the chosen one")
	MisResultCondition( HasItem, 2942, 1)
	MisResultCondition( BaiyangOn )
	MisResultAction( SetRecord, 1023)
	MisResultAction( ClearMission, 1023)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2942)	
	TriggerAction( 1, AddNextFlag, 1023, 10, 1 )
	RegCurTrigger( 10231 )

--------------------------------------------------寻访沙岚守护者--------------------白银城驻雷霆堡大使·伊塔多
	DefineMission( 6027, "Visit guardian of Shaitan", 1024)
	MisBeginTalk("<t>Look for the next guardian at a sandy town")
	MisBeginCondition( NoRecord, 1024)
	MisBeginCondition( NoMission, 1024)
	MisBeginCondition( HasRecord, 1023)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1024)
	MisCancelAction( ClearMission, 1024)

	MisNeed(MIS_NEED_DESP, "Visit the guardian of Shaitan City")
	MisHelpTalk("<t>Go to a sandy city")
	
	MisResultCondition(AlwaysFailure)

-----------------------------------------------------寻访沙岚守护者--------------------路人·珊瑚虫
	DefineMission( 6028, "Visit guardian of Shaitan", 1024, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

--	MisResultTalk("<t>Do not ignore me because I look weak!")
	MisResultCondition( NoRecord, 1024)
	MisResultCondition( HasMission, 1024)
	MisResultAction( SetRecord, 1024)
	MisResultAction( ClearMission, 1024)

-------------------------------------------------------环球旅行--------------------路人·珊瑚虫
	DefineMission( 6029, "World Tour", 1025)
	MisBeginTalk("<t>Are you familiar with the world of Pirate King Online? Let me bring you on a world tour. There are many interesting people to meet along the way and they will take a portion of your reputation points for their help. First stop is Abandoned Mine Haven. Look for Kentaro.")
	MisBeginCondition( NoMission, 1025)
	MisBeginCondition( NoRecord, 1025)
	MisBeginCondition( HasRecord, 1024)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1025)
	MisCancelAction( ClearMission, 1025)

	MisNeed(MIS_NEED_DESP, "Look for Kentaro when you have at least 500 reputation points")
	MisHelpTalk("<t>Kentaro is at Abandon Mine Haven")

	MisResultCondition(AlwaysFailure)

-------------------------------------------------------环球旅行-----------------严罗塔
	DefineMission( 6030, "World Tour", 1025, COMPLETE_SHOW)
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Tourist? Remember to rest well!")
	MisResultCondition( NoRecord, 1025)
	MisResultCondition( HasMission, 1025)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1025)
	MisResultAction( ClearMission, 1025)

--------------------------------------------------------环球旅行------------------严罗塔
	DefineMission( 6031, "World Tour", 1026)
	MisBeginTalk("<t>Next stop is Babul Haven. Look for Minelli")
	MisBeginCondition( NoMission, 1026)
	MisBeginCondition( NoRecord, 1026)
	MisBeginCondition( HasRecord, 1025)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1026)
	MisCancelAction( ClearMission, 1026)

	MisNeed(MIS_NEED_DESP, "Look for Minelli when you have at least 500 reputation points")
	MisHelpTalk("<t>Minelli is at Babul Haven")

	MisResultCondition(AlwaysFailure)

---------------------------------------------------------环球旅行----------------米尔米莉
	DefineMission( 6032, "World Tour", 1026, COMPLETE_SHOW)
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Tourist? Remember to rest well!")
	MisResultCondition( NoRecord, 1026)
	MisResultCondition( HasMission, 1026)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1026)
	MisResultAction( ClearMission, 1026)

----------------------------------------------------------环球旅行-----------------米尔米莉
	DefineMission( 6033, "World Tour", 1027)
	MisBeginTalk("<t>Next stop is Atlantis Haven. Look for Willi")
	MisBeginCondition( NoMission, 1027)
	MisBeginCondition( NoRecord, 1027)
	MisBeginCondition( HasRecord, 1026)
	MisBeginCondition( HasRecord, 1016)
 	MisBeginAction( AddMission,1027)
	MisCancelAction( ClearMission, 1027)

	MisNeed(MIS_NEED_DESP, "Look for Willi when you have at least 500 reputation points")
	MisHelpTalk("<t>You cannot take it anymore? Look for Clan Chief Albuda to reselect your path of rebirth.")

	MisResultCondition(AlwaysFailure)

---------------------------------------------------------环球旅行-------------------薇莉尔
	DefineMission( 6034, "World Tour", 1027, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1027)
	MisResultCondition( HasMission, 1027)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1027)
	MisResultAction( ClearMission, 1027)

-----------------------------------------------------------环球旅行------------------薇莉尔
	DefineMission( 6035, "World Tour", 1028)
	MisBeginTalk("<t>Next stop is Valhalla Haven. Look for Professor Fenny")
	MisBeginCondition( NoMission, 1028)
	MisBeginCondition( NoRecord, 1028)
	MisBeginCondition( HasRecord, 1027)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1028)
	MisCancelAction( ClearMission, 1028)

	MisNeed(MIS_NEED_DESP, "Look for Professor Fenny when you have 500 reputation points")
	MisHelpTalk("<t>Professor Fenny is at Valhalla Haven")

	MisResultCondition(AlwaysFailure)

------------------------------------------------------------环球旅行---------------博尔芬尼
	DefineMission( 6036, "World Tour", 1028, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1028)
	MisResultCondition( HasMission, 1028)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1028)
	MisResultAction( ClearMission, 1028)

---------------------------------------------------------------环球旅行------------博尔芬尼
	DefineMission( 6037, "World Tour", 1029)
	MisBeginTalk("<t>Next stop is Oasis Haven. Look for Ditaro")
	MisBeginCondition( NoMission, 1029)
	MisBeginCondition( NoRecord, 1029)
	MisBeginCondition( HasRecord, 1028)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1029)
	MisCancelAction( ClearMission, 1029)

	MisNeed(MIS_NEED_DESP, "Look for Ditaro when you have 500 reputation points")
	MisHelpTalk("<t>Ditaro is at Oasis Haven")

	MisResultCondition(AlwaysFailure)

--------------------------------------------------------------环球旅行-----------迪迪马修
	DefineMission( 6038, "World Tour", 1029, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1029)
	MisResultCondition( HasMission, 1029)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1029)
	MisResultAction( ClearMission, 1029)

--------------------------------------------------------------环球旅行-----------迪迪马修
	DefineMission( 6039, "World Tour", 1030)
	MisBeginTalk("<t>Next stop is Icespire Haven. Look for Lulu")
	MisBeginCondition( NoMission, 1030)
	MisBeginCondition( NoRecord, 1030)
	MisBeginCondition( HasRecord, 1029)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1030)
	MisCancelAction( ClearMission, 1030)

	MisNeed(MIS_NEED_DESP, "Look for Lulu when you have 500 reputation points")
	MisHelpTalk("<t>Lulu is at Icespire Haven")

	MisResultCondition(AlwaysFailure)

--------------------------------------------------------------环球旅行-----------鲁鲁
	DefineMission( 6040, "World Tour", 1030, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1030)
	MisResultCondition( HasMission, 1030)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1030)
	MisResultAction( ClearMission, 1030)

--------------------------------------------------------------环球旅行-----------鲁鲁
	DefineMission( 6041, "World Tour", 1031)
	MisBeginTalk("<t>Next stop is Rockery Haven. Look for Durian")
	MisBeginCondition( NoMission, 1031)
	MisBeginCondition( NoRecord, 1031)
	MisBeginCondition( HasRecord, 1030)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1031)
	MisCancelAction( ClearMission, 1031)

	MisNeed(MIS_NEED_DESP, "Look for Durian when you have 500 reputation points")
	MisHelpTalk("<t>Durian is at Rockery Haven")

	MisResultCondition(AlwaysFailure)

--------------------------------------------------------------环球旅行-------------榴莲
	DefineMission( 6042, "World Tour", 1031, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1031)
	MisResultCondition( HasMission, 1031)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1031)
	MisResultAction( ClearMission, 1031)

--------------------------------------------------------------环球旅行-------------榴莲
	DefineMission( 6043, "World Tour", 1032)
	MisBeginTalk("<t>Next stop is Solace Haven. Look for Linda")
	MisBeginCondition( NoMission, 1032)
	MisBeginCondition( NoRecord, 1032)
	MisBeginCondition( HasRecord, 1031)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1032)
	MisCancelAction( ClearMission, 1032)

	MisNeed(MIS_NEED_DESP, " Look for Linda when you have at least 500 reputation points")
	MisHelpTalk("<t>Linda is at Solace Haven")

	MisResultCondition(AlwaysFailure)

---------------------------------------------------------------环球旅行--------------琳达
	DefineMission( 6044, "World Tour", 1032, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1032)
	MisResultCondition( HasMission, 1032)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( GiveItem, 3128, 10, 4)
	MisResultAction( SetRecord, 1032)
	MisResultAction( ClearMission, 1032)
	MisResultBagNeed(1)


---------------------------------------------------------------环球旅行--------------琳达
	DefineMission( 6045, "World Tour", 1033)
	MisBeginTalk("<t>Next stop is at Skeletar Haven. Look for Xeus")
	MisBeginCondition( NoMission, 1033)
	MisBeginCondition( NoRecord, 1033)
	MisBeginCondition( HasRecord, 1032)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1033)
	MisCancelAction( ClearMission, 1033)

	MisNeed(MIS_NEED_DESP, "Look for Xeus when you have at least 500 reputation points")
	MisHelpTalk("<t>Xeus is at Skeletar Haven")

	MisResultCondition(AlwaysFailure)

----------------------------------------------------------------环球旅行--------------修司
	DefineMission( 6046, "World Tour", 1033, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1033)
	MisResultCondition( HasMission, 1033)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1033)
	MisResultAction( ClearMission, 1033)

----------------------------------------------------------------环球旅行--------------修司
	DefineMission( 6047, "World Tour", 1034)
	MisBeginTalk("<t>Next stop is at Chaldea Haven. Look for Love Yuri")
	MisBeginCondition( NoMission, 1034)
	MisBeginCondition( NoRecord, 1034)
	MisBeginCondition( HasRecord, 1033)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1034)
	MisCancelAction( ClearMission, 1034)

	MisNeed(MIS_NEED_DESP, "Look for Love Yuri when you have at least 500 reputation points")
	MisHelpTalk("<t>Love Yuri is at Chaldea Haven")

	MisResultCondition(AlwaysFailure)

-----------------------------------------------------------------环球旅行-------------海蓝·微风
	DefineMission( 6048, "World Tour", 1034, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1034)
	MisResultCondition( HasMission, 1034)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1034)
	MisResultAction( ClearMission, 1034)

-----------------------------------------------------------------环球旅行-------------海蓝·微风
	DefineMission( 6049, "World Tour", 1035)
	MisBeginTalk("<t>Next stop is Nana at Icicle Haven")
	MisBeginCondition( NoMission, 1035)
	MisBeginCondition( NoRecord, 1035)
	MisBeginCondition( HasRecord, 1034)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1035)
	MisCancelAction( ClearMission, 1035)

	MisNeed(MIS_NEED_DESP, "Look for Nana when you have 500 reputation points")
	MisHelpTalk("<t>Nana is at Icicle Haven")

	MisResultCondition(AlwaysFailure)

----------------------------------------------------------------环球旅行---------------奈奈
	DefineMission( 6050, "World Tour", 1035, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1035)
	MisResultCondition( HasMission, 1035)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1035)
	MisResultAction( ClearMission, 1035)

----------------------------------------------------------------环球旅行---------------奈奈
	DefineMission( 6051, "World Tour", 1036)
	MisBeginTalk("<t>Next stop is at Andes Forest Haven. Look for Doctor Minoseva")
	MisBeginCondition( NoMission, 1036)
	MisBeginCondition( NoRecord, 1036)
	MisBeginCondition( HasRecord, 1035)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1036)
	MisCancelAction( ClearMission, 1036)

	MisNeed(MIS_NEED_DESP, "Look for Minoseva when you have 500 reputation points")
	MisHelpTalk("<t>Minoseva is at Andes Forest Haven")

	MisResultCondition(AlwaysFailure)

----------------------------------------------------------------环球旅行---------------米奈希尔
	DefineMission( 6052, "World Tour", 1036, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>旅行者吗？注意休息哦！")
	MisResultCondition( NoRecord, 1036)
	MisResultCondition( HasMission, 1036)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( GiveItem, 3139, 10, 4)
	MisResultAction( SetRecord, 1036)
	MisResultAction( ClearMission, 1036)
	MisResultBagNeed(1)


----------------------------------------------------------------环球旅行-------------------米奈希尔
	DefineMission( 6053, "World Tour", 1037)
	MisBeginTalk("<t>The tour has ended. Go back and look for Passerby Wowo")
	MisBeginCondition( NoMission, 1037)
	MisBeginCondition( NoRecord, 1037)
	MisBeginCondition( HasRecord, 1036)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1037)
	MisCancelAction( ClearMission, 1037)

	MisNeed(MIS_NEED_DESP, "Look for Wowo")
	MisHelpTalk("<t>Look for Wowo")

	MisResultCondition(AlwaysFailure)

---------------------------------------------------------------环球旅行--------------------路人·珊瑚虫
	DefineMission( 6054, "World Tour", 1037, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>How is it? Is the tour interesting? Do you want to do it once again? Haha, I am only joking. Do not worry!")
	MisResultCondition( NoRecord, 1037)
	MisResultCondition( HasMission, 1037)
	MisResultCondition( HasCredit, 500)
	MisResultAction( DelRoleCredit, 500)
	MisResultAction( SetRecord, 1037)
	MisResultAction( ClearMission, 1037)

--------------------------------------------------------------寻访天堂守护者--------------路人·珊瑚虫
	DefineMission( 6055, "Visit the Guardian of Heaven", 1038)
	MisBeginTalk("<t>Look for the next guardian at the entrance of Heaven.")
	MisBeginCondition( NoMission, 1038)
	MisBeginCondition( NoRecord, 1038)
	MisBeginCondition( HasRecord, 1037)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission,1038)
	MisCancelAction( ClearMission, 1038)

	MisNeed(MIS_NEED_DESP, "Look for the next guardian")
	MisHelpTalk("<t>Next guardian is at the entrance to Heaven.")

	MisResultCondition(AlwaysFailure)

-------------------------------------------------------------寻访天堂守护者--------------天堂传送使
	DefineMission( 6056, "Visit the Guardian of Heaven", 1038, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Have you meet the Goddess?")
	MisResultCondition( NoRecord, 1038)
	MisResultCondition( HasMission, 1038)
	MisResultAction( SetRecord, 1038)
	MisResultAction( ClearMission, 1038)
	
------------------------------------------------------------虔诚的证明-------------------天堂传送使
	DefineMission( 6057, "Testament of the Piety", 1039)
	MisBeginTalk("<t>Want to gain my recognition? No problem, but you have to show me your faithfulness to the Goddess. There are 9 Sacred Candles. Light them up!")
	MisBeginCondition( NoRecord, 1039)
	MisBeginCondition( NoMission, 1039)
	MisBeginCondition( HasRecord, 1038)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction(AddTrigger, 10391, TE_GETITEM, 3007, 9 )
	MisBeginAction( AddMission, 1039)
	MisBeginAction( GiveItem, 3006, 9, 4)
	MisBeginBagNeed(1)
	MisCancelAction( ClearMission, 1039)

	MisNeed(MIS_NEED_ITEM, 3007, 9, 10, 9)

	MisResultTalk("<t>Well done")
	MisHelpTalk("<t>Use these Sacred Candles to light them.")
	MisResultCondition( NoRecord, 1039)
	MisResultCondition( HasMission, 1039)
	MisResultCondition( HasItem, 3007, 9)
	MisResultAction( TakeItem, 3007, 9)
	MisResultAction( SetRecord, 1039)
	MisResultAction( ClearMission, 1039)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3007)	
	TriggerAction( 1, AddNextFlag, 1039, 10, 9 )
	RegCurTrigger( 10391 )


------------------------------------------------------------虔诚的证明-------------------天堂传送使
	DefineMission( 6058, "Testament of the Piety", 1040)
	MisBeginTalk("<t>Since you are so determined, light these 99 candles for me.")
	MisBeginCondition( NoRecord, 1040)
	MisBeginCondition( NoMission, 1040)
	MisBeginCondition( HasRecord, 1039)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction(AddTrigger, 10401, TE_GETITEM, 3007, 99 )
	MisBeginAction( AddMission, 1040)
	MisBeginAction( GiveItem, 3006, 99, 4)
	MisBeginBagNeed(1)
	MisCancelAction( ClearMission, 1040)

	MisNeed(MIS_NEED_ITEM, 3007, 99, 10, 99)

	MisResultTalk("<t>Well done!")
	MisHelpTalk("<t>Use these Sacred Candles to light them.")
	MisResultCondition( NoRecord, 1040)
	MisResultCondition( HasMission, 1040)
	MisResultCondition( HasItem, 3007, 99)
	MisResultAction( TakeItem, 3007, 99)
	MisResultAction( SetRecord, 1040)
	MisResultAction( ClearMission, 1040)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3007)	
	TriggerAction( 1, AddNextFlag, 1040, 10, 99 )
	RegCurTrigger( 10401 )

------------------------------------------------------------虔诚的证明-------------------天堂传送使
	DefineMission( 6059, "Testament of the Piety", 1041)
	MisBeginTalk("<t>This is the last test. Here is a Goddess Statue. You will infuse 1 point of energy everytime you use it. Come back to me when you maximise the energy. Note that I only accept 1 Goddess Statue!")
	MisBeginCondition( NoRecord, 1041)
	MisBeginCondition( NoMission, 1041)
	MisBeginCondition( HasRecord, 1040)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction(AddTrigger, 10411, TE_GETITEM, 3010, 1 )
	MisBeginAction( AddMission, 1041)
	MisBeginAction( GiveNSDX, 3010 )
	MisBeginBagNeed(1)
	MisCancelAction( ClearMission, 1041)
	
	MisNeed(MIS_NEED_ITEM, 3010, 1, 10, 1)

	MisResultTalk("<t>The Goddess will always be at your side.")
	MisHelpTalk("<t>You cannot take it anymore? Look for Clan Chief Albuda to reselect your path of rebirth.")
	MisResultCondition( NoRecord, 1041)
	MisResultCondition( HasMission, 1041)
	MisResultCondition( CheckEnergy )
	MisResultAction( TakeItem, 3010, 1)
	MisResultAction( SetRecord, 1041)
	MisResultAction( ClearMission, 1041)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3010)	
	TriggerAction( 1, AddNextFlag, 1041, 10, 1 )
	RegCurTrigger( 10411 )

----------------------------------------------------------寻访白银守护者--------------天堂传送使
	DefineMission( 6060, "Visit the guardian of Argent", 1042)
	MisBeginTalk("<t> Look for the next guardian in Argent City. He is not someone to mess with.")
	MisBeginCondition( NoRecord, 1042)
	MisBeginCondition( NoMission, 1042)
	MisBeginCondition( HasRecord, 1041)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1042)
	MisCancelAction( ClearMission, 1042)

	MisNeed(MIS_NEED_DESP, "Look for the next guardian in Argent City")
	MisHelpTalk("<t>Visit the next guardian in Argent City.")

	MisResultCondition(AlwaysFailure)

-----------------------------------------------------------寻访白银守护者--------------水手·海云
	DefineMission( 6061, "Visit the guardian of Argent", 1042, COMPLETE_SHOW)
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>Want to play a game?")
	MisResultCondition( NoRecord, 1042)
	MisResultCondition( HasMission, 1042)
	MisResultAction( SetRecord, 1042)
	MisResultAction( ClearMission, 1042)

------------------------------------------------------------疯狂的游戏-----------------水手·海云
	DefineMission( 6062, "Game of Madness", 1043)
	MisBeginTalk("<t>Let’s play a little game. Kill 110 Mystic Shrubs and return to answer my question.")
	MisBeginCondition( NoRecord, 1043)
	MisBeginCondition( NoMission, 1043)
	MisBeginCondition( HasRecord, 1042)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1043)
	MisBeginAction( AddTrigger, 10431, TE_KILL, 75, 110)
	MisCancelAction( ClearMission, 1043)

	MisNeed(MIS_NEED_DESP, "Kill 110 Mystic Shrubs")
	MisNeed(MIS_NEED_KILL, 75, 110, 10, 110)

	MisResultTalk("<t>You kill fast")
	MisHelpTalk("<t>There are many Mystic Shrubs surrounding Argent City. You will need to answer a question after killing them!")
	MisResultCondition( NoRecord, 1043)
	MisResultCondition( HasMission, 1043)
	MisResultCondition( HasFlag, 1043, 10)
	MisResultCondition( HasRecord, 1058)
	MisResultAction( SetRecord, 1043)
	MisResultAction( ClearMission, 1043)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 75 )
	TriggerAction( 1, AddNextFlag, 1043, 10, 110 )
	RegCurTrigger( 10431 )

------------------------------------------------------------疯狂的游戏-----------------水手·海云
	DefineMission( 6063, "Game of Madness", 1046)
	MisBeginTalk("<t>Kill 110 Dry Mystic Shrubs!")
	MisBeginCondition( NoRecord, 1046)
	MisBeginCondition( NoMission, 1046)
	MisBeginCondition( HasRecord, 1043)
	MisBeginCondition( HasRecord, 1044)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1046)
	MisBeginAction( AddTrigger, 10461, TE_KILL, 218, 110)
	MisCancelAction( ClearMission, 1046)

	MisNeed(MIS_NEED_DESP, "Kill 110 Dry Mystic Shrubs")
	MisNeed(MIS_NEED_KILL, 218, 110, 10, 110)

	MisResultTalk("<t>You kill fast")
	MisHelpTalk("<t>Dry Mystic Shrub can be found in the surrounding of Shaitan City.")
	MisResultCondition( NoRecord, 1046)
	MisResultCondition( HasMission, 1046)
	MisResultCondition( HasFlag, 1046, 10)
	MisResultCondition( HasRecord, 1058)
	MisResultAction( SetRecord, 1046)
	MisResultAction( SetRecord, 1057)
	MisResultAction( ClearMission, 1046)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 218 )
	TriggerAction( 1, AddNextFlag, 1046, 10, 110 )
	RegCurTrigger( 10461 )

---------------------------------------------------------------疯狂的游戏------------------水手·海云
	DefineMission( 6064, "Game of Madness", 1047)
	MisBeginTalk("<t>Kill 110 Snowy Mystic Shrubs!")
	MisBeginCondition( NoRecord, 1047)
	MisBeginCondition( NoMission, 1047)
	MisBeginCondition( HasRecord, 1045)
	MisBeginCondition( HasRecord, 1043)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1047)
	MisBeginAction( AddTrigger, 10471, TE_KILL, 216, 110)
	MisCancelAction( ClearMission, 1047)

	MisNeed(MIS_NEED_DESP, "Kill 110 Snowy Mystic Shrubs")
	MisNeed(MIS_NEED_KILL, 216, 110, 10, 110)

	MisResultTalk("<t>You kill fast")
	MisHelpTalk("<t>Dry Mystic Shrub can be found in the surrounding of Shaitan City.")
	MisResultCondition( NoRecord, 1047)
	MisResultCondition( HasMission, 1047)
	MisResultCondition( HasFlag, 1047, 10)
	MisResultCondition( HasRecord, 1058)
	MisResultAction( SetRecord, 1047)
	MisResultAction( SetRecord, 1057)
	MisResultAction( ClearMission, 1047)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 216 )
	TriggerAction( 1, AddNextFlag, 1047, 10, 110 )
	RegCurTrigger( 10471 )

---------------------------------------------------------------疯狂的游戏------------------水手·海云
	DefineMission( 6065, "Game of Madness", 1048)
	MisBeginTalk("<t>Next target is Sailor Squidy. Kill 110 of them too.")
	MisBeginCondition( NoRecord, 1048)
	MisBeginCondition( NoMission, 1048)
	MisBeginCondition( HasRecord, 1057)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1048)
	MisBeginAction( AddTrigger, 10481, TE_KILL, 233, 110)
	MisCancelAction( ClearMission, 1048)

	MisNeed(MIS_NEED_DESP, "Kill 110 Sailor Squidy")
	MisNeed(MIS_NEED_KILL, 233, 110, 10, 110)

	MisResultTalk("<t>Isn't this game fun?")
	MisHelpTalk("<t>Sailor Squidy is near Argent City.")
	MisResultCondition( NoRecord, 1048)
	MisResultCondition( HasMission, 1048)
	MisResultCondition( HasFlag, 1048, 10)
	MisResultAction( SetRecord, 1048)
	MisResultAction( ClearMission, 1048)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 233)
	TriggerAction( 1, AddNextFlag, 1048, 10, 110 )
	RegCurTrigger( 10481 )

---------------------------------------------------------------疯狂的游戏------------------水手·海云
	DefineMission( 6066, "Game of Madness", 1049)
	MisBeginTalk("<t>Next target is Snow Squidy, kill 110 of them.")
	MisBeginCondition( NoRecord, 1049)
	MisBeginCondition( NoMission, 1049)
	MisBeginCondition( HasRecord, 1048)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1049)
	MisBeginAction( AddTrigger, 10491, TE_KILL, 235, 110)
	MisCancelAction( ClearMission, 1049)

	MisNeed(MIS_NEED_DESP, "Kill 110 Snow Squidy")
	MisNeed(MIS_NEED_KILL, 235, 110, 10, 110)

	MisResultTalk("<t>Isn't this game fun?")
	MisHelpTalk("<t>Snow Squidy can be found near Icicle City.")
	MisResultCondition( NoRecord, 1049)
	MisResultCondition( HasMission, 1049)
	MisResultCondition( HasFlag, 1049, 10)
	MisResultAction( SetRecord, 1049)
	MisResultAction( ClearMission, 1049)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 235)
	TriggerAction( 1, AddNextFlag, 1049, 10, 110 )
	RegCurTrigger( 10491 )

---------------------------------------------------------------疯狂的游戏------------------水手·海云
	DefineMission( 6067, "Game of Madness", 1050)
	MisBeginTalk("<t>Next target is Sailor Squirt. Kill 110 of them.")
	MisBeginCondition( NoRecord, 1050)
	MisBeginCondition( NoMission, 1050)
	MisBeginCondition( HasRecord, 1049)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1050)
	MisBeginAction( AddTrigger, 10501, TE_KILL, 232, 110)
	MisCancelAction( ClearMission, 1050)

	MisNeed(MIS_NEED_DESP, "Kill 110 Sailor Squirt")
	MisNeed(MIS_NEED_KILL, 232, 110, 10, 110)

	MisResultTalk("<t>Isn't this game fun?")
	MisHelpTalk("<t>Don't you find this game fun?")
	MisResultCondition( NoRecord, 1050)
	MisResultCondition( HasMission, 1050)
	MisResultCondition( HasFlag, 1050, 10)
	MisResultAction( SetRecord, 1050)
	MisResultAction( ClearMission, 1050)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 232)
	TriggerAction( 1, AddNextFlag, 1050, 10, 110 )
	RegCurTrigger( 10501 )

---------------------------------------------------------------疯狂的游戏------------------水手·海云
	DefineMission( 6068, "Game of Madness", 1051)
	MisBeginTalk("<t>The last target is Snow Squirt. Kill 110 of them.")
	MisBeginCondition( NoRecord, 1051)
	MisBeginCondition( NoMission, 1051)
	MisBeginCondition( HasRecord, 1050)
	MisBeginCondition( HasRecord, 1016)
	MisBeginAction( AddMission, 1051)
	MisBeginAction( AddTrigger, 10511, TE_KILL, 234, 110)
	MisCancelAction( ClearMission, 1051)

	MisNeed(MIS_NEED_DESP, "Kill 110个Snow Squirt")
	MisNeed(MIS_NEED_KILL, 234, 110, 10, 110)

	MisResultTalk("<t>Is the game over? What a pity. Your determination has moved me. This is the reward you deserved.")
	MisHelpTalk("<t>Go for it!")
	MisResultCondition( NoRecord, 1051)
	MisResultCondition( HasMission, 1051)
	MisResultCondition( HasFlag, 1051, 10)
	MisResultAction( SetRecord, 1051)
	MisResultAction( SetRecord, 1056)
	MisResultAction( ClearMission, 1051)
	MisResultAction(GiveItem, 2229, 1, 4)
	MisResultAction(GiveItem, 2230, 1, 4)
	MisResultAction(GiveItem, 2231, 1, 4)
	MisResultAction(GiveItem, 2232, 1, 4)
	MisResultAction(GiveItem, 2233, 1, 4)
	MisResultBagNeed(5)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 234)
	TriggerAction( 1, AddNextFlag, 1051, 10, 110 )
	RegCurTrigger( 10511 )

-------------------------------------------------做寿司的原料----------提司面包	
	DefineMission (5604, "Ingredient to make sushi", 1107)
	
	MisBeginTalk("<t>Dear friend, do you wish to have some sushi? You will never taste anything as good as these! Get me some ingredients if you wish to have it! ")

	MisBeginCondition(NoMission,1107)
	MisBeginCondition(NoRecord,1107)
	MisBeginAction(AddMission,1107)
	MisBeginAction(AddTrigger, 11071, TE_GETITEM, 1649, 1 )---------------1个纯净的水
	MisBeginAction(AddTrigger, 11072, TE_GETITEM, 1690, 1 )---------------1个蜗牛触角
	MisBeginAction(AddTrigger, 11073, TE_GETITEM, 3116, 1 )-------------1个精灵果
	MisCancelAction( ClearMission, 1107)
	
	MisNeed(MIS_NEED_ITEM, 1649, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 1690, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 3116, 1, 30, 1 )

	MisHelpTalk("<t>These items are not tough to find. Go now!")
	MisResultTalk("<t>This is great, I will let you see the greatest work of the Kitchen God")

	MisResultCondition(HasMission, 1107)
	MisResultCondition(NoRecord,1107)
	MisResultCondition(HasItem, 1649, 1 )
	MisResultCondition(HasItem, 1690, 1 )
	MisResultCondition(HasItem, 3116, 1 )
	
	MisResultAction(TakeItem, 1649, 1 )
	MisResultAction(TakeItem, 1690, 1 )
	MisResultAction(TakeItem, 3116, 1 )
	
	MisResultAction(ClearMission, 1107)
	MisResultAction(SetRecord,  1107 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1649)	
	TriggerAction( 1, AddNextFlag, 1107, 10, 1 )
	RegCurTrigger( 11071 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1690)	
	TriggerAction( 1, AddNextFlag, 1107, 20, 1 )
	RegCurTrigger( 11072 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3116)	
	TriggerAction( 1, AddNextFlag, 1107, 30, 1 )
	RegCurTrigger( 11073 )


	-------------------------------------------------超级寿司----------提司面包	
	DefineMission (5605, "Super Sushi", 1108)
	
	MisBeginTalk("<t>Bring 2 Cake Sampling Voucher if you wish to taste it! ")

	MisBeginCondition(NoMission,1108)
	MisBeginCondition(HasRecord,1107)
	MisBeginCondition(NoRecord,1108)
	MisBeginAction(AddMission,1108)
	MisBeginAction(AddTrigger, 11081, TE_GETITEM, 1097, 2 )---------------2个蛋糕品尝券
	MisCancelAction( ClearMission, 1108)
	
	MisNeed(MIS_NEED_ITEM, 1097, 2, 10, 2 )

	MisHelpTalk("<t>Faster, if not it will get cold")
	MisResultTalk("<t>Do not praise me! I am sick of such words...")

	MisResultCondition(HasMission, 1108)
	MisResultCondition(NoRecord,1108)
	MisResultCondition(HasItem, 1097, 2 )
	MisResultAction(TakeItem, 1097, 2 )
	MisResultAction(GiveItem, 2989,1,4)-------超级寿司
	MisResultAction(ClearMission, 1108)
	MisResultAction(SetRecord,  1108 )
	MisResultAction(ClearRecord, 1107)---------------可以反复接
	MisResultAction(ClearRecord, 1108)---------------可以反复接
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1097)	
	TriggerAction( 1, AddNextFlag, 1108, 10, 2 )
	RegCurTrigger( 11081 )

	-------------------------------------------------蛋糕勇士----------提司面包	
	DefineMission (5606, "Cake Warrior", 1109)
	
	MisBeginTalk("<t>Dear friend, my deserts are the most delicious in the market! Others will envy you should you ever taste my cakes. In order to sample it, you will have to obtain a Medal of Honor from the Arena Administrator! ")

	MisBeginCondition(NoMission,1109)
	MisBeginCondition(NoRecord,1109)
	MisBeginAction(AddMission,1109)
	MisBeginAction(AddTrigger, 11091, TE_GETITEM, 3849, 1 )---------------1个勇者之证
	MisCancelAction( ClearMission, 1109)
	
	MisNeed(MIS_NEED_ITEM, 3849, 1, 10, 1 )

	MisHelpTalk("<t>Faster, if not it will get cold")
	MisResultTalk("<t>Do not praise me! I am sick of such words...")

	MisResultCondition(HasMission, 1109)
	MisResultCondition(NoRecord,1109)
	MisResultCondition(HasItem, 3849, 1 )
	MisResultAction(ClearMission, 1109)
	MisResultAction(SetRecord,  1109 )
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 3849)	
	TriggerAction( 1, AddNextFlag, 1109, 10, 1 )
	RegCurTrigger( 11091 )


	-------------------------------------------------品牌蛋糕----------提司面包	
	DefineMission (5607, "Famous Cake", 1110)
	
	MisBeginTalk("<t>You need to have a Cake Sampling Voucher as well! ")

	MisBeginCondition(NoMission,1110)
	MisBeginCondition(HasRecord,1109)
	MisBeginCondition(NoRecord,1110)
	MisBeginAction(AddMission,1110)
	MisBeginAction(AddTrigger, 11101, TE_GETITEM, 1097, 1 )---------------1个蛋糕品尝券
	MisCancelAction( ClearMission, 1110)
	
	MisNeed(MIS_NEED_ITEM, 1097, 1, 10, 1 )
	MisHelpTalk("<t>You need to have a Cake Sampling Voucher to taste my cake")
	MisResultTalk("<t>I have high hopes for you")
	

	MisResultCondition(HasMission, 1110)
	MisResultCondition(NoRecord,1110)
	MisResultCondition(HasItem, 1097, 1 )
	MisResultAction(TakeItem, 1097, 1 )
	MisResultAction(GiveItem, 2988,1,4)------品牌蛋糕
	MisResultAction(ClearMission, 1110)
	MisResultAction(SetRecord,  1110 )
	MisResultAction(ClearRecord, 1109)---------------可以反复接
	MisResultAction(ClearRecord, 1110)---------------可以反复接
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1097)	
	TriggerAction( 1, AddNextFlag, 1110, 10, 1 )
	RegCurTrigger( 11101 )


--	-----------------------------------------------------马来西亚开服献礼
--	DefineMission( 6069, "Server opening ceremony", 1400)
--
--	MisBeginTalk( "<t>Feeling shy lately? If you help me do a small flavour, I'll give you a rich reward in return ")
--	MisBeginCondition( LvCheck, ">", 10)
--	MisBeginCondition( NoRecord, 1400)
--	MisBeginCondition( NoMission, 1400)
--	MisBeginAction( AddMission, 1400 )
--	MisBeginAction( AddTrigger, 14001, TE_GETITEM, 1604, 10 )
--	MisBeginAction( AddTrigger, 14002, TE_GETITEM, 1777, 5 )
--	MisBeginAction( AddTrigger, 14002, TE_GETITEM, 1692, 5 )
--	MisBeginAction( AddTrigger, 14002, TE_GETITEM, 4334, 5 )
--	MisBeginAction( AddTrigger, 14002, TE_GETITEM, 4511, 1 )
--	MisCancelAction(ClearMission, 1400)
--
--	MisNeed(MIS_NEED_ITEM, 1604, 10, 10, 10)
--	MisNeed(MIS_NEED_ITEM, 1779, 5, 20, 5)
--	MisNeed(MIS_NEED_ITEM, 1692, 5, 30, 5)
--	MisNeed(MIS_NEED_ITEM, 4334, 5, 40, 5)
--	MisNeed(MIS_NEED_ITEM, 4511, 1, 50, 1)
--
--	MisResultTalk("<t>Nice job, I won't forget your reward!")
--	MisHelpTalk("<t>Mane is dropped by Bear Cub (Ascaron 1905, 2953), Glass is dropped by Forest Spirit (Ascaron 2220, 2638), Cactus is dropped by Killer Cactus (Magical Ocean 884, 3156), Pengiun Pelt is dropped by Sailor Penguin (Deep Blue 994, 365), and Glistening Shrub is from water shrub (Ascaron Sea Region 3000, 2566).")
--	MisResultCondition( HasMission, 1400)
--	MisResultCondition( NoRecord, 1400)
--	MisResultCondition( HasItem, 1604, 10)
--	MisResultCondition( HasItem, 1777, 5)
--	MisResultCondition( HasItem, 1692, 5)
--	MisResultCondition( HasItem, 4334, 5)
--	MisResultCondition( HasItem, 4511, 1)
--	MisResultAction( TakeItem, 1604, 10)
--	MisResultAction( TakeItem, 1777, 5)
--	MisResultAction( TakeItem, 1692, 5)
--	MisResultAction( TakeItem, 4334, 5)
--	MisResultAction( TakeItem, 4511, 1)
--	MisResultAction( SetRecord, 1400)
--	MisResultAction( ClearMission, 1400)
--	MisResultAction( AddMoney, 10000, 10000)
--
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 1604)	
--	TriggerAction( 1, AddNextFlag, 1400, 10, 10 )
--	RegCurTrigger( 14001 )
--
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 1777)	
--	TriggerAction( 1, AddNextFlag, 1400, 20, 5 )
--	RegCurTrigger( 14002 )
--
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 1692)	
--	TriggerAction( 1, AddNextFlag, 1400, 30, 5 )
--	RegCurTrigger( 14003 )
--
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 4334)	
--	TriggerAction( 1, AddNextFlag, 1400, 40, 5 )
--	RegCurTrigger( 14004 )
--
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 4511)	
--	TriggerAction( 1, AddNextFlag, 1400, 50, 1 )
--	RegCurTrigger( 14005 )
--
--
--	----------------------------------------------------------马来西亚幸运大宝箱
--	DefineMission ( 6070 , "Golden Chest" , 1401 )
--	MisBeginTalk("<t>Want to obtain Big Lucky chest? If you want one help me kill the following monsters: 30 Bandit, 20 Miner mole, 10 Tribal warrior, 5 Bandit Leader - Adder, 5 Ruby dolphin, 5 Fish bone, 20 Sluggish Squid, and Man Eating Sea Jelly")
--	MisBeginCondition( NoMission, 1401)
--	MisBeginCondition( NoRecord, 1401)
--	MisBeginAction( AddMission, 1401)
--	MisBeginAction( AddTrigger, 14011, TE_KILL, 93, 30)
--	MisBeginAction( AddTrigger, 14012, TE_KILL, 88, 20)
--	MisBeginAction( AddTrigger, 14013, TE_KILL, 248, 10)
--	MisBeginAction( AddTrigger, 14014, TE_KILL, 211, 5)
--	MisBeginAction( AddTrigger, 14015, TE_KILL, 58, 5)
--	MisBeginAction( AddTrigger, 14016, TE_KILL, 242, 5)
--	MisBeginAction( AddTrigger, 14017, TE_KILL, 578, 20)
--	MisBeginAction( AddTrigger, 14018, TE_KILL, 596, 20)
--	MisCancelAction(ClearMission, 1401)
--
--	MisNeed(MIS_NEED_KILL, 93, 30, 10, 30)
--	MisNeed(MIS_NEED_KILL, 88, 20, 20, 20)
--	MisNeed(MIS_NEED_KILL, 248, 10, 30, 10)
--	MisNeed(MIS_NEED_KILL, 211, 5, 40, 5)
--	MisNeed(MIS_NEED_KILL, 58, 5, 50, 5)
--	MisNeed(MIS_NEED_KILL, 242, 5, 60, 5)
--	MisNeed(MIS_NEED_KILL, 578, 20, 70, 20)
--	MisNeed(MIS_NEED_KILL, 596, 20, 80, 20)
--
--	MisResultTalk("<t>祝你好运哦~")
--	MisHelpTalk("<t>The monsters on the sea must be defeated on a ship")
--	MisResultCondition( HasMission, 1401)
--	MisResultCondition( NoRecord, 1401)
--	MisResultCondition( HasFlag, 1401, 10)
--	MisResultCondition( HasFlag, 1401, 20)
--	MisResultCondition( HasFlag, 1401, 30)
--	MisResultCondition( HasFlag, 1401, 40)
--	MisResultCondition( HasFlag, 1401, 50)
--	MisResultCondition( HasFlag, 1401, 60)
--	MisResultCondition( HasFlag, 1401, 70)
--	MisResultCondition( HasFlag, 1401, 80)
--	MisResultAction( SetRecord, 1401)
--	MisResultAction( ClearMission, 1401)
--	MisResultAction( GiveItem, 4312)
--	MisResultBagNeed(1)
--
--	InitTrigger()
--	TriggerCondition( 1, IsMonster, 93 )
--	TriggerAction( 1, AddNextFlag, 1401, 10, 30 )
--	RegCurTrigger( 14011 )
--	InitTrigger()
--	TriggerCondition( 1, IsMonster, 88 )
--	TriggerAction( 1, AddNextFlag, 1401, 20, 20 )
--	RegCurTrigger( 14012 )
--	InitTrigger()
--	TriggerCondition( 1, IsMonster, 248 )
--	TriggerAction( 1, AddNextFlag, 1401, 30, 10 )
--	RegCurTrigger( 14013 )
--	InitTrigger()
--	TriggerCondition( 1, IsMonster, 211 )
--	TriggerAction( 1, AddNextFlag, 1401, 40, 5 )
--	RegCurTrigger( 14014 )
--	InitTrigger()
--	TriggerCondition( 1, IsMonster, 58 )
--	TriggerAction( 1, AddNextFlag, 1401, 50, 5 )
--	RegCurTrigger( 14015 )
--	InitTrigger()
--	TriggerCondition( 1, IsMonster, 242 )
--	TriggerAction( 1, AddNextFlag, 1401, 60, 5 )
--	RegCurTrigger( 14016 )
--	InitTrigger()
--	TriggerCondition( 1, IsMonster, 578 )
--	TriggerAction( 1, AddNextFlag, 1401, 70, 20 )
--	RegCurTrigger( 14017 )
--	InitTrigger()
--	TriggerCondition( 1, IsMonster, 596 )
--	TriggerAction( 1, AddNextFlag, 1401, 80, 30 )
--	RegCurTrigger( 14018 )


------------------------------------------------------------------新的磨练---转生天使
	DefineMission( 6071, "New challenge", 1402)
	MisBeginTalk("<t>You still need more training. Lately around Argent City the Mystic Shrub has been causing trouble, please go investigate!")
	MisBeginCondition( CheckZS )
	MisBeginCondition( NoRecord, 1402)
	MisBeginCondition( NoMission, 1402)
	MisBeginAction( AddMission, 1402)
	MisCancelAction( ClearMission ,1402)

	MisNeed( MIS_NEED_DESP, "Investigate the Mystic shrub around Argent city area")
	MisHelpTalk("<t>Go around Argent City and see if anything special is happening")

	MisResultCondition( AlwaysFailure )

-------------------------------------------------------------------新的磨练---怨念草
	DefineMission( 6072, "New challenge", 1402, COMPLETE_SHOW)

	MisBeginCondition( AlwaysFailure )

	MisResultTalk("<t>Hatred, hatred...")
	MisResultCondition( HasMission, 1402)
	MisResultCondition( NoRecord, 1402)
	MisResultAction( AddSailExp , 10, 10)
	MisResultAction( SetRecord, 1402)
	MisResultAction( ClearMission, 1402)

-----------------------------------------------------------------精灵草的怨念----怨念草
	DefineMission( 6073, "Mystic Shrub hatred", 1403)

	MisBeginTalk("<t>Answer me one question!")
	MisBeginCondition( CheckZS )
	MisBeginCondition( HasRecord, 1402)
	MisBeginCondition( NoRecord, 1403)
	MisBeginCondition( NoMission, 1403)
	MisBeginAction( AddMission, 1403)
	MisCancelAction( ClearMission, 1403)

	MisNeed( MIS_NEED_DESP, "Answer hatred shrub question")
	
	MisResultTalk( "<t>I want to have revenge!")
	MisHelpTalk( "<t>Do not escape and answer my question")
	MisResultCondition( HasRecord, 1404)
	MisResultCondition( HasMission, 1403)
	MisResultAction( SetRecord, 1403)
	MisResultAction( ClearMission, 1403)
	MisResultAction( AddSailExp, 10, 10)

---------------------------------------------------------------怨念草的要求------怨念草
	DefineMission( 6074, "Hatred Shrub request", 1408)

	MisBeginTalk("<t>I will not accept this, so I'll create a quest too, you go and kill people for me!! After you slain them, help me get 20 Blood Contracts!")
	MisBeginCondition( NoMission, 1408)
	MisBeginCondition( NoRecord, 1408)
	MisBeginCondition( HasRecord, 1403)
	MisBeginCondition( HasRecord, 1405)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1408)
	MisBeginAction( AddTrigger, 14081, TE_GETITEM, 2383, 20 )
	MisCancelAction( ClearMission, 1408)

	MisNeed( MIS_NEED_ITEM, 2383 , 20, 10, 20)
	
	MisResultTalk( "<t>Haha, feel good after killing people right? Please keep up the good work!")
	MisHelpTalk( "<t>Blood contract can be obtained by killing people in Sacred war, haha")
	MisResultCondition( HasMission, 1408)
	MisResultCondition( NoRecord, 1408)
	MisResultCondition( HasItem, 2383, 20)
	MisResultAction( TakeItem ,2383, 20)
	MisResultAction( AddSailExp, 20, 20)
	MisResultAction( SetRecord, 1408)
	MisResultAction( SetRecord, 1409)
	MisResultAction( ClearMission, 1408)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2383)	
	TriggerAction( 1, AddNextFlag, 1408, 10, 20 )
	RegCurTrigger( 14081 )

-------------------------------------------------------------怨念草的要求------怨念草
	DefineMission( 6075, "Hatred Shrub request", 1410)

	MisBeginTalk( "<t>You don't even care about us, hmph, I am too lazy to answer you too! (Looks like he's angry, maybe some water will help him cool down)")
	MisBeginCondition( NoRecord, 1410)
	MisBeginCondition( NoMission, 1410)
	MisBeginCondition( HasRecord, 1406)
	MisBeginCondition( HasRecord, 1403)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1410)
	MisBeginAction( AddTrigger, 14101, TE_GETITEM, 1649, 10 )
	MisCancelAction( ClearMission, 1410)

	MisNeed( MIS_NEED_ITEM, 1649 , 10, 10, 10)

	MisResultTalk( "<t>Seeing you did so much, I will give you one more chance.")
	MisHelpTalk( "Ignore me!")
	MisResultCondition( HasMission, 1410)
	MisResultCondition( NoRecord, 1410)
	MisResultCondition( HasItem, 1649, 10)
	MisResultAction( SetRecord, 1410)
	MisResultAction( SetRecord, 1405)
	MisResultAction( TakeItem, 1649, 10)
	MisResultAction( ClearMission, 1410)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1649)	
	TriggerAction( 1, AddNextFlag, 1410, 10, 10 )
	RegCurTrigger( 14101 )

-------------------------------------------------------怨念草的要求
	DefineMission( 6076, "Hatred Shrub request", 1411)
	MisBeginTalk( "<t>Grrr, you must have killed a lot of my grasslings too. Give me 1, 000, 000 as compensation or I won't let you off!")
	MisBeginCondition( NoRecord, 1411)
	MisBeginCondition( NoMission, 1411)
	MisBeginCondition( HasRecord, 1403)
	MisBeginCondition( HasRecord, 1407)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1411)
	MisCancelAction( ClearMission, 1411)

	MisNeed( MIS_NEED_DESP, "<t>Give Hatred Shrub 1million as a compensate")
	
	MisResultTalk( "<t>The money does not cover up my mental pain, but since I'm generous, I'll forgive you this time.")
	MisHelpTalk("<t>Hurry up and give me money!")
	MisResultCondition( HasMission, 1411)
	MisResultCondition( NoRecord, 1411)
	MisResultCondition( HasMoney, 1000000)
	MisResultAction( TakeMoney, 1000000)
	MisResultAction( AddSailExp, 20, 20)
	MisResultAction( SetRecord, 1411)
	MisResultAction( SetRecord, 1409)
	MisResultAction( ClearMission, 1411)

---------------------------------------------------------汇报情况-------怨念草
	DefineMission( 6077, "Report situation", 1412)
	MisBeginTalk( "<t>Since you know whom you're dealing with, I'll forgive you today, but you better be more careful next time!")
	MisBeginCondition( NoRecord, 1412)
	MisBeginCondition( NoMission, 1412)
	MisBeginCondition( HasRecord, 1409)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1412)
	MisCancelAction( ClearMission, 1412)

	MisNeed( MIS_NEED_DESP, "Go find Castle Guard - Peter and report the information")
	MisHelpTalk( "<t>Hurry up and go away, don't walk back and forth infront of me!")

	MisResultCondition( AlwaysFailure )

---------------------------------------------------------汇报情况------城堡护卫·比特
	DefineMission( 6078, "Report situation", 1412, COMPLETE_SHOW)

	MisBeginCondition( AlwaysFailure)

	MisResultTalk( "<t>What? Mystic Shrub war? This tiny issue shouldn't be our concern, I can crush them all with one hand.")
	MisResultCondition( HasMission, 1412)
	MisResultCondition( NoRecord, 1412)
	MisResultAction( SetRecord, 1412)
	MisResultAction( ClearMission, 1412)
	MisResultAction( AddSailExp, 5, 5)

---------------------------------------------------------收集羽毛-------城堡护卫·比特
	DefineMission( 6079, "Gather feathers", 1413)
	MisBeginTalk( "<t>Now I'll give you a severe quest: Lately we are running out of feathers to make the rebirth wings, please help me find 100 Snowy White Plume, and 100 Black Feather.")
	MisBeginCondition( NoMission, 1413)
	MisBeginCondition( NoRecord, 1413)
	MisBeginCondition( HasRecord, 1412)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1413)
	MisBeginAction( AddTrigger, 14131, TE_GETITEM, 4364, 100)
	MisBeginAction( AddTrigger, 14132, TE_GETITEM, 4347, 100)
	MisCancelAction( ClearMission, 1413)

	MisNeed( MIS_NEED_ITEM, 4364, 100, 10, 100)
	MisNeed( MIS_NEED_ITEM, 4347, 100, 20, 100)

	MisResultTalk( "<t>Good job!")
	MisHelpTalk( "Snowy White Plume is dropped by White Owlie (Ascaron 1360, 2683), and Black Feather is dropped by Owlie (Ascaron 1461, 3018).")
	MisResultCondition( HasMission, 1413)
	MisResultCondition( NoRecord, 1413)
	MisResultCondition( HasItem, 4364, 100)
	MisResultCondition( HasItem, 4347, 100)
	MisResultAction( TakeItem, 4364, 100)
	MisResultAction( TakeItem, 4347, 100)
	MisResultAction( AddSailExp, 40, 40)
	MisResultAction( SetRecord, 1413)
	MisResultAction( ClearMission, 1413)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4364)	
	TriggerAction( 1, AddNextFlag, 1413, 10, 100 )
	RegCurTrigger( 14131 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4347)	
	TriggerAction( 1, AddNextFlag, 1413, 20, 100 )
	RegCurTrigger( 14132 )

--------------------------------------------------------帮助他人--------城堡护卫·比特
	DefineMission( 6080, "Help other people", 1414)
	MisBeginTalk("0")
	MisBeginCondition( HasRecord, 1413)
	MisBeginCondition( NoRecord, 1414)
	MisBeginCondition( NoMission, 1414)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1414)
	MisCancelAction( ClearMission, 1414)

	MisNeed( MIS_NEED_DESP, "<t>Head inside the city and see if anyone needs help.")

	MisResultTalk( "<t>You helped so many people, good for you.")
	MisHelpTalk( "<t>There's a lot of people that needs help inside the city, please go help them.")
	MisResultCondition( HasMission, 1414)
	MisResultCondition( NoRecord, 1414)
	MisResultCondition( HasRecord, 1428)
	MisResultCondition( HasRecord, 1417)
	MisResultCondition( HasRecord, 1420)
	MisResultCondition( HasRecord, 1422)
	MisResultCondition( HasRecord, 1424)
	MisResultAction( AddSailExp, 10,10)
	MisResultAction( SetRecord, 1414)
	MisResultAction( ClearMission, 1414)

---------------------------------------------------------玫瑰的魅力----酒吧女·蒂娜
	DefineMission( 6081, "Charm of the rose", 1415)
	MisBeginTalk("<t>I've been a young boy holding a rose in his mouth, that look is totally handsome ( Her eyes is full of stars), why don't you try it and let me see?")
	MisBeginCondition( NoChaType, 3)
	MisBeginCondition( NoChaType, 4)
	MisBeginCondition( HasMission, 1414)
	MisBeginCondition( CheckZS )
	MisBeginCondition( NoMission, 1415)
	MisBeginCondition( NoRecord, 1415)
	MisBeginAction( AddMission, 1415)
	MisCancelAction( ClearMission, 1415)

	MisNeed( MIS_NEED_DESP, "Barmaid.Donna would like to see you with a Rose in your mouth")

	MisResultTalk( "<t>Not bad, anyhow hit also can get 80 points")
	MisHelpTalk( "<t>aren't roses beautiful?")
	MisResultCondition( HasState, 110)
	MisResultCondition( HasMission, 1415)
	MisResultCondition( NoRecord, 1415)
	MisResultAction( SetRecord, 1415)
	MisResultAction( AddSailExp, 20, 20)
	MisResultAction( SetRecord, 1428)
	MisResultAction( ClearMission, 1415)


---------------------------------------------------------玫瑰的魅力----酒鬼·芬德内
	DefineMission( 6082, "Charm of the rose", 1416)
	MisBeginTalk( "<t>I've seen a beautiful women once with a rose holding in her mouth, it was so sexy ( He seems to have something shiny below his lips), why don't you try it and let me see?")
	MisBeginCondition( HasMission, 1414)
	MisBeginCondition( NoRecord, 1416)
	MisBeginCondition( NoMission, 1416)
	MisBeginCondition( NoChaType, 1)
	MisBeginCondition( NoChaType, 2)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1416)
	MisCancelAction( ClearMission, 1416)

	MisNeed( MIS_NEED_DESP, "Drunkyard - Anthony wants to see you holding a rose with your mouth")

	MisResultTalk( "<t>Not bad, quite sexy, have to admit you're quite beautiful.")
	MisHelpTalk( "<t>aren't roses beautiful?")
	MisResultCondition( HasState, 110)
	MisResultCondition( HasMission, 1416)
	MisResultCondition( NoRecord, 1416)
	MisResultAction( SetRecord, 1416)
	MisResultAction( SetRecord, 1428)
	MisResultAction( AddSailExp, 20, 20)
	MisResultAction( ClearMission, 1416)
---------------------------------------------------------倒霉的模特----潮流发型师·卡特
	DefineMission( 6085, "Unlucky Model", 1417)
	MisBeginTalk( "<t>Lately I've thought of a new hairstyle, but I don't have enough combs and scissors, please go help me find some!")
	MisBeginCondition( NoMission, 1417)
	MisBeginCondition( NoRecord, 1417)
	MisBeginCondition( HasMission, 1414)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1417)
	MisBeginAction( AddTrigger, 14171, TE_GETITEM, 1804, 5)
	MisBeginAction( AddTrigger, 14172, TE_GETITEM, 1805, 5)
	MisCancelAction( ClearMission, 1417)

	MisNeed( MIS_NEED_ITEM, 1804, 5, 10, 5)
	MisNeed( MIS_NEED_ITEM, 1805, 5, 20, 5)
	
	MisResultTalk( "<t>Thank you very much, I will design a new hairstyle soon!")
	MisResultCondition( HasMission, 1417)
	MisResultCondition( HasItem, 1804, 5)
	MisResultCondition( HasItem, 1805, 5)
	MisResultCondition( NoRecord, 1417)
	MisResultAction( TakeItem, 1804, 5)
	MisResultAction( TakeItem, 1805, 5)
	MisResultAction( AddSailExp, 20, 20)
	MisResultAction( SetRecord, 1417)
	MisResultAction( ClearMission, 1417)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1804)	
	TriggerAction( 1, AddNextFlag, 1417, 10, 5 )
	RegCurTrigger( 14171 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1805)	
	TriggerAction( 1, AddNextFlag, 1417, 20, 5 )
	RegCurTrigger( 14172 )


----------------------------------------------------------跑龙套的梦想----路人·甲
	DefineMission( 6086, "The Dream for Loric Dragon Set", 1418)
	MisBeginTalk( "<t>I don't want to be an utility man, I also want to be the main character, please help me talk to Navy Commander - Dessaro about I want to be a navy!")
	MisBeginCondition( NoMission, 1418)
	MisBeginCondition( NoRecord, 1418)
	MisBeginCondition( CheckZS )
	MisBeginCondition( HasMission, 1414)
	MisBeginAction( AddMission, 1418)
	MisCancelAction( ClearMission, 1418)

	MisNeed( MIS_NEED_DESP, "Go find Navy Commander - Dessaro and tell him the dream of Passerby - Ja.")

	MisResultCondition( AlwaysFailure )

------------------------------------------------------------跑龙套的梦想----海军司令官·德斯塔罗
	DefineMission( 6087, "The Dream for Loric Dragon Set", 1418, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>Passerby - Ja wants to be in the navy? You sure I haven't heard you wrong?")
	MisResultCondition( HasMission, 1418)
	MisResultCondition( NoRecord, 1418)
	MisResultAction( SetRecord, 1418)
	MisResultAction( AddSailExp, 5, 5)
	MisResultAction( ClearMission, 1418)

-------------------------------------------------------------跑龙套的梦想----海军司令官·德斯塔罗
	DefineMission( 6088, "The Dream for Loric Dragon Set", 1419)
	MisBeginTalk( "<t>Tell Passerby - Ja if he wants to be in the Navy, go defeat 5 Beardy Pirate Support Ship and 5 Beardy Pirate Warship.")
	MisBeginCondition( NoMission, 1419)
	MisBeginCondition( NoRecord, 1419)
	MisBeginCondition( HasMission, 1414)
	MisBeginCondition( HasRecord, 1418)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1419)
	MisCancelAction( ClearMission, 1419)

	MisNeed( MIS_NEED_DESP, "Tell Passerby - Ja the request from Navy Commander - Dessaro")

	MisResultCondition( AlwaysFailure )


--------------------------------------------------------------跑龙套的梦想----路人·甲
	DefineMission( 6089, "The Dream for Loric Dragon Set", 1419, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )
	
	MisResultTalk( "<t>Is this what Dessaro means? Let me think")
	MisResultCondition( HasMission, 1419)
	MisResultCondition( NoRecord, 1419)
	MisResultAction( AddSailExp, 5, 5)
	MisResultAction( SetRecord, 1419)
	MisResultAction( ClearMission, 1419)

-------------------------------------------------------------跑龙套的梦想----路人·甲
	DefineMission( 6090, "The Dream for Loric Dragon Set", 1420)
	MisBeginTalk( "<t>This is too hard for me, why don't you help until the end and eliminate them!")
	MisBeginCondition( NoMission, 1420)
	MisBeginCondition( NoRecord, 1420)
	MisBeginCondition( HasMission, 1414)
	MisBeginCondition( HasRecord, 1419)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1420)
	MisBeginAction( AddTrigger, 14201, TE_KILL, 630, 5)
	MisBeginAction( AddTrigger, 14202, TE_KILL, 631, 5)
	MisCancelAction( ClearMission, 1420)

	MisNeed( MIS_NEED_DESP, "kill 5 Beardy Pirate Support Ship and 5 Beardy Pirate Warship")
	MisNeed( MIS_NEED_KILL, 630, 5, 10, 5)
	MisNeed( MIS_NEED_KILL, 631, 5, 20, 5)
	
	MisResultTalk( "<t>I have received the Navy recommendation letter, Thank you so much.")
	MisResultCondition( HasMission, 1420)
	MisResultCondition( NoRecord, 1420)
	MisResultCondition( HasFlag, 1420, 14)
	MisResultCondition( HasFlag, 1420, 24)
	MisResultAction( SetRecord, 1420)
	MisResultAction( ClearMission, 1420)
	MisResultAction( AddSailExp, 20, 20)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 630 )
	TriggerAction( 1, AddNextFlag, 1420, 10, 5 )
	RegCurTrigger( 14201 )

	InitTrigger()
	TriggerCondition( 1, IsMonster, 631 )
	TriggerAction( 1, AddNextFlag, 1420, 20, 5 )
	RegCurTrigger( 14202 )


---------------------------------------------------------------紧急快递-----------银行出纳·摩妮雅
	DefineMission( 6091, "Express delivery", 1421)
	MisBeginTalk( "<t>I have a package here for Banker - Belinda at Icicle city, but I need a person who's fast, can you help me?")
	MisBeginCondition( NoMission, 1421)
	MisBeginCondition( NoRecord, 1421)
	MisBeginCondition( CheckZS )
	MisBeginCondition( HasMission, 1414)
	MisBeginAction( AddMission, 1421)
	MisCancelAction( ClearMission, 1421)

	MisNeed( MIS_NEED_DESP, "<t>Wear your speed gear then find Monica, because she needs a person that is very speed for delivery!")

	MisResultTalk( "<t>Looks like you can really run fast!")
	MisHelpTalk( "<t>You run too slow, go find some equipment that boosts your speed!")
	MisResultCondition( HasMission, 1421)
	MisResultCondition( NoRecord, 1421)
	MisResultCondition( CheckSpeed, 550)
	MisResultAction( SetRecord, 1421)
	MisResultAction( AddSailExp, 20, 20)
	MisResultAction( ClearMission, 1421)

---------------------------------------------------------------紧急快递-----------银行出纳·摩妮雅
	DefineMission( 6092, "Express delivery", 1422)
	MisBeginTalk( "<t>I believe in your speed, please help me deliever this package to Banker - Belinda at Icicle City. ")
	MisBeginCondition( NoMission, 1422)
	MisBeginCondition( NoRecord, 1422)
	MisBeginCondition( HasRecord, 1421)
	MisBeginAction( AddMission, 1422)
	MisBeginAction( GiveItem, 956, 1, 4)
	MisCancelAction( ClearMission, 1422)

	MisNeed( MIS_NEED_DESP, "Please send the package to Banker - Belinda at Icicle City")
	MisHelpTalk( "<t>Banker - Belinda is at Icicle city")

	MisResultCondition( AlwaysFailure )

------------------------------------------------------------紧急快递--------------银行出纳·布丽娜
	DefineMission( 6093, "Express delivery", 1422, COMPLETE)
	MisBeginCondition( AlwaysFailure )
	
	MisResultTalk( "<t>Wah! The package was so heavy and you delievered it in time, thank you very much!")
	MisResultCondition( HasMission, 1422)
	MisResultCondition( NoRecord, 1422)
	MisResultCondition( HasItem, 956, 1)
	MisResultAction( TakeItem, 956, 1)
	MisResultAction( SetRecord, 1422)
	MisResultAction( ClearMission, 1422)
	MisResultAction( AddSailExp, 5, 5)

----------------------------------------------------------开卷有益----------------老者·糊涂山人
	DefineMission( 6094, "opening scroll is good for you", 1423)
	MisBeginTalk( "<t>You should read more books. I got a book here, I'll lend it to you. Please help me deliever the book to Tomas Tutu when you're done reading.")
	MisBeginCondition( NoRecord, 1423)
	MisBeginCondition( NoMission, 1423)
	MisBeginCondition( HasMission, 1414)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1423)
	MisBeginAction( GiveItem, 957, 1, 4)
	MisCancelAction( ClearMission, 1423)

	MisNeed( MIS_NEED_DESP, "Send the book to Tomas.Tutu")
	MisHelpTalk( "<t>Remember to look at the book yourself first")

	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------开卷有益-----------------托马斯·图图
	DefineMission( 6095, "opening scroll is good for you", 1423)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>You've seen this book already? I'll take it away then.")
	MisResultCondition( HasMission, 1423)
	MisResultCondition( NoRecord, 1423)
	MisResultCondition( HasItem, 957, 1)
	MisResultAction( TakeItem, 957, 1)
	MisResultAction( AddSailExp, 5, 5)
	MisResultAction( SetRecord, 1423)
	MisResultAction( ClearMission, 1423)

-----------------------------------------------------------开卷有益-----------------托马斯·图图
	DefineMission( 6096, "opening scroll is good for you", 1424)
	MisBeginTalk( "<t>Since you said you finished reading the book, let me test you with some questions.")
	MisBeginCondition( NoMission, 1424)
	MisBeginCondition( NoRecord, 1424)
	MisBeginCondition( HasRecord, 1423)
	MisBeginAction( AddMission, 1424)
	MisCancelAction( ClearMission, 1424)

	MisNeed( MIS_NEED_DESP, "Answer Tomas Tutu a few questions")
	MisHelpTalk( "<t>These questions are so easy, there shouldn't be any reason why you couldn't answer them?")
		
	MisResultTalk( "<t>Read more books is good for you!")
	MisResultCondition( HasMission, 1424)
	MisResultCondition( NoRecord, 1424)
	MisResultCondition( HasRecord, 1429)
	MisResultAction( AddSailExp, 5, 5)
	MisResultAction( SetRecord, 1424)
	MisResultAction( ClearMission, 1424)

-----------------------------------------------------------刺探军情--------------城堡护卫·比特
	DefineMission( 6097, "Spy for army information", 1425)
	MisBeginTalk( "<t>After my observation, you're a person that can be rely on. Now, I will give you an important mission. We've sent a a group of soldier to the Black Dragon lair to investigate military situation, but they haven't come back since, can you help me look for them?")
	MisBeginCondition( NoMission, 1425)
	MisBeginCondition( NoRecord, 1425)
	MisBeginCondition( HasRecord, 1414)
	MisBeginCondition( CheckZS )
	MisBeginAction( AddMission, 1425)
	MisCancelAction( ClearMission, 1425)

	MisNeed( MIS_NEED_DESP, "Head down to Black dragon lair 2 to investigate the military situation")
	MisHelpTalk( "<t>Hurry and go, please becareful!")
	
	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------刺探军情--------------重伤的无名战士
	DefineMission( 6098, "Spy for army information", 1425, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>We...got attacked by massive spawns of baby dragons, and everyone...died...")
	MisResultCondition( HasMission, 1425)
	MisResultCondition( NoRecord, 1425)
	MisResultAction( SetRecord, 1425)
	MisResultAction( AddSailExp, 10, 10)
	MisResultAction( ClearMission, 1425)

-----------------------------------------------------------刺探军情---------------重伤的无名战士
	DefineMission( 6099, "Spy for army information", 1426)
	MisBeginCondition( NoMission, 1426)
	MisBeginCondition( NoRecord, 1426)
	MisBeginCondition( HasRecord, 1425)
	MisBeginAction( AddMission, 1426)
	MisBeginAction( GiveItem, 958, 1, 4)
	MisCancelAction( ClearMission, 1426)

	MisNeed( MIS_NEED_DESP, "Help me give this letter of information to Castle Guard - Peter, this letter has saraficed a lot of troops lifes in exchange.")
	MisHelpTalk( "<t>I'm counting on you!")

	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------刺探军情--------------城堡护卫·比特
	DefineMission( 6100, "Spy for army information", 1426, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>What? The whole army got defeated? How is this possible!")
	MisResultCondition( HasMission, 1426)
	MisResultCondition( NoRecord, 1426)
	MisResultCondition( HasItem, 958, 1)
	MisResultAction( TakeItem, 958, 1)
	MisResultAction( AddSailExp, 10, 10)
	MisResultAction( SetRecord, 1426)
	MisResultAction( ClearMission, 1426)

-----------------------------------------------------------比特的复仇-----------城堡护卫·比特
	DefineMission( 6101, "Peter's Revenge", 1427)
	MisBeginTalk( "<t>I have to kill those winged big lizards, go, go help them revenge. Go and prove your bravery!")
	MisBeginCondition( NoMission, 1427)
	MisBeginCondition( NoRecord, 1427)
	MisBeginCondition( HasRecord, 1426)
	MisBeginAction( AddMission, 1427)
	MisBeginAction( AddTrigger, 14271, TE_KILL, 791, 1)
	MisBeginAction( AddTrigger, 14272, TE_KILL, 793, 1)
	MisBeginAction( AddTrigger, 14273, TE_KILL, 794, 1)
	MisCancelAction( ClearMission, 1427)

	MisNeed( MIS_NEED_KILL, 791, 1, 10, 1)
	MisNeed( MIS_NEED_KILL, 793, 1, 30, 1)
	MisNeed( MIS_NEED_KILL, 794, 1, 50, 1)

	MisResultTalk( "<t>Thank you very much, you've proven yourself to be a true warrior. Now you can go to Shaitan City NPC to take quest to raise your Rebirth Level.")
	MisHelpTalk( "<t>Becareful, those big capillas are not easy to handle.")
	MisResultCondition( HasMission, 1427)
	MisResultCondition( NoRecord, 1427)
	MisResultCondition( HasFlag, 1427, 10)
	MisResultCondition( HasFlag, 1427, 30)
	MisResultCondition( HasFlag, 1427, 50)
	MisResultAction( AddSailExp, 50, 50)
	MisResultAction( SetRecord, 1427)
	MisResultAction( ClearMission, 1427)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 791 )
	TriggerAction( 1, AddNextFlag, 1427, 10, 1 )
	RegCurTrigger( 14271 )

	InitTrigger()
	TriggerCondition( 1, IsMonster, 793 )
	TriggerAction( 1, AddNextFlag, 1427, 30, 1 )
	RegCurTrigger( 14272 )

	InitTrigger()
	TriggerCondition( 1, IsMonster, 794 )
	TriggerAction( 1, AddNextFlag, 1427, 50, 1 )
	RegCurTrigger( 14273 )


----------------------------------------------------挑战·黑龙----------BOSS挑战登记员
	DefineMission( 6102, "Challenge Black Dragon", 1430)
	MisBeginTalk( "<t>Black Dragon is located at Black Dragon Lair 2, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1430)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1430)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14301, TE_KILL, 789, 1)
	MisCancelAction( ClearMission, 1430)

	MisNeed( MIS_NEED_KILL, 789, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1430, 10)
	MisResultCondition( HasMission, 1430)
	MisResultAction( AddSailExp, 120, 120)
	MisResultAction( ClearMission, 1430)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 789 )
	TriggerAction( 1, AddNextFlag, 1430, 10, 1 )
	RegCurTrigger( 14301 )

------------------------------------------------------挑战·雪殇灵--------BOSS挑战登记员
	DefineMission( 6103, "Challenge Wandering Soul", 1432)
	MisBeginTalk( "<t>Wandering Soul is located at Demonic World Level 1, and is one of the strong bosses in the game, you sure you want to challenge her?")
	MisBeginCondition( NoMission, 1432)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1432)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14321, TE_KILL, 679, 1)
	MisCancelAction( ClearMission, 1432)

	MisNeed( MIS_NEED_KILL, 679, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1432, 10)
	MisResultCondition( HasMission, 1432)
	MisResultAction( AddSailExp, 50, 50)
	MisResultAction( ClearMission, 1432)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 679 )
	TriggerAction( 1, AddNextFlag, 1432, 10, 1 )
	RegCurTrigger( 14321 )

------------------------------------------------------挑战·巨人首领--------BOSS挑战登记员
	DefineMission( 6104, "Challenge Snowman Warlord", 1433)
	MisBeginTalk( "<t>Snowman Warlord is located at Demonic World Level 2, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1433)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1433)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14331, TE_KILL, 678, 1)
	MisCancelAction( ClearMission, 1433)

	MisNeed( MIS_NEED_KILL, 679, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1433, 10)
	MisResultCondition( HasMission, 1433)
	MisResultAction( AddSailExp, 50, 50)
	MisResultAction( ClearMission, 1433)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 678 )
	TriggerAction( 1, AddNextFlag, 1433, 10, 1 )
	RegCurTrigger( 14331 )

-------------------------------------------------------挑战·巴伯萨--------BOSS挑战登记员
	DefineMission( 6105, "Challenge Snowman Warlord", 1434)
	MisBeginTalk( "<t>Barborosa is located at Skeletar Isle, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1434)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1434)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14341, TE_KILL, 805, 1)
	MisCancelAction( ClearMission, 1434)

	MisNeed( MIS_NEED_KILL, 805, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1434, 10)
	MisResultCondition( HasMission, 1434)
	MisResultAction( AddSailExp, 75, 75)
	MisResultAction( ClearMission, 1434)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 805 )
	TriggerAction( 1, AddNextFlag, 1434, 10, 1 )
	RegCurTrigger( 14341 )

-------------------------------------------------------挑战·亡灵司令--------BOSS挑战登记员
	DefineMission( 6106, "Challenge Deathsoul Commander", 1435)
	MisBeginTalk( "<t>Deathsoul Commander is located at Research Shelter, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1435)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1435)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14351, TE_KILL, 807, 1)
	MisCancelAction( ClearMission, 1435)

	MisNeed( MIS_NEED_KILL, 807, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1435, 10)
	MisResultCondition( HasMission, 1435)
	MisResultAction( AddSailExp, 75, 75)
	MisResultAction( ClearMission, 1435)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 807 )
	TriggerAction( 1, AddNextFlag, 1435, 10, 1 )
	RegCurTrigger( 14351 )

-------------------------------------------------------挑战·大章鱼--------BOSS挑战登记员
	DefineMission( 6107, "Challenge Kraken", 1436)
	MisBeginTalk( "<t>Kraken is located at Skeletar Isle, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1436)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1436)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14361, TE_KILL, 795, 1)
	MisCancelAction( ClearMission, 1436)

	MisNeed( MIS_NEED_KILL, 795, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1436, 10)
	MisResultCondition( HasMission, 1436)
	MisResultAction( AddSailExp, 75, 75)
	MisResultAction( ClearMission, 1436)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 795 )
	TriggerAction( 1, AddNextFlag, 1436, 10, 1 )
	RegCurTrigger( 14361 )

-------------------------------------------------------挑战·黑珍珠--------BOSS挑战登记员
	DefineMission( 6108, "Challenge Black Jewel", 1437)
	MisBeginTalk( "<t>Black Jewel is located at Caribbean Sea, and is one of the strong bosses in the game, you sure you want to challenge?")
	MisBeginCondition( NoMission, 1437)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1437)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14371, TE_KILL, 815, 1)
	MisCancelAction( ClearMission, 1437)

	MisNeed( MIS_NEED_KILL, 815, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1437, 10)
	MisResultCondition( HasMission, 1437)
	MisResultAction( AddSailExp, 75, 75)
	MisResultAction( ClearMission, 1437)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 815 )
	TriggerAction( 1, AddNextFlag, 1437, 10, 1 )
	RegCurTrigger( 14371 )

-------------------------------------------------------挑战·绝望骑士-塞拉------BOSS挑战登记员
	DefineMission( 6109, "Challenge Despair Knight - Saro", 1438)
	MisBeginTalk( "<t>Despair Knight - Saro is located at Abaddon Level 5, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1438)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1438)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14381, TE_KILL, 974, 1)
	MisCancelAction( ClearMission, 1438)

	MisNeed( MIS_NEED_KILL, 974, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1438, 10)
	MisResultCondition( HasMission, 1438)
	MisResultAction( AddSailExp, 90, 90)
	MisResultAction( ClearMission, 1438)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 974 )
	TriggerAction( 1, AddNextFlag, 1438, 10, 1 )
	RegCurTrigger( 14381 )

-------------------------------------------------------挑战·冥泥怪-卡普顿------BOSS挑战登记员
	DefineMission( 6110, "Challenge Abyss Mudmonster - Karu", 1439)
	MisBeginTalk( "<t>Abyss Mudmonster - Karu is located at Abaddon Level 6, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1439)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1439)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14391, TE_KILL, 975, 1)
	MisCancelAction( ClearMission, 1439)

	MisNeed( MIS_NEED_KILL, 975, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1439, 10)
	MisResultCondition( HasMission, 1439)
	MisResultAction( AddSailExp, 90, 90)
	MisResultAction( ClearMission, 1439)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 975 )
	TriggerAction( 1, AddNextFlag, 1439, 10, 1 )
	RegCurTrigger( 14391 )

-------------------------------------------------------挑战·冥囚-阿尔提斯------BOSS挑战登记员
	DefineMission( 6111, "Challenge Abyss Prisoner - Aruthur", 1440)
	MisBeginTalk( "<t>Abyss Prisoner - Aruthur is located at Abaddon Level 7, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1440)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1440)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14401, TE_KILL, 976, 1)
	MisCancelAction( ClearMission, 1440)

	MisNeed( MIS_NEED_KILL, 976, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1440, 10)
	MisResultCondition( HasMission, 1440)
	MisResultAction( AddSailExp, 90, 90)
	MisResultAction( ClearMission, 1440)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 976 )
	TriggerAction( 1, AddNextFlag, 1440, 10, 1 )
	RegCurTrigger( 14401 )

-------------------------------------------------------挑战·冥妖-萨库西斯------BOSS挑战登记员
	DefineMission( 6112, "Challenge Abyss Demon - Sacrois", 1441)
	MisBeginTalk( "<t>Abyss Demon - Sacrois is located at Abaddon Level 8, and is one of the strong bosses in the game, you sure you want to challenge him?")
	MisBeginCondition( NoMission, 1441)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1441)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14411, TE_KILL, 977, 1)
	MisCancelAction( ClearMission, 1441)

	MisNeed( MIS_NEED_KILL, 977, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1441, 10)
	MisResultCondition( HasMission, 1441)
	MisResultAction( AddSailExp, 90, 90)
	MisResultAction( ClearMission, 1441)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 977 )
	TriggerAction( 1, AddNextFlag, 1441, 10, 1 )
	RegCurTrigger( 14411 )

-------------------------------------------------------挑战·冥界兽-咕咕------BOSS挑战登记员
	DefineMission( 6113, "Challenge Abyss Beast - Kuroo", 1442)
	MisBeginTalk( "0")
	MisBeginCondition( NoMission, 1442)
	MisBeginCondition( NoRecord, 1431)
	MisBeginCondition( HasRecord, 1427)
	MisBeginAction(	AddMission, 1442)
	MisBeginAction( SetRecord, 1431)
	MisBeginAction( AddTrigger, 14421, TE_KILL, 978, 1)
	MisCancelAction( ClearMission, 1442)

	MisNeed( MIS_NEED_KILL, 978, 1, 10, 1)

	MisResultTalk( "<t>Every battle will make us stronger.")
	MisHelpTalk( "<t>please becareful.")
	MisResultCondition( HasFlag, 1442, 10)
	MisResultCondition( HasMission, 1442)
	MisResultAction( AddSailExp, 90, 90)
	MisResultAction( ClearMission, 1442)
	MisResultAction( ClearRecord, 1431)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 978 )
	TriggerAction( 1, AddNextFlag, 1442, 10, 1 )
	RegCurTrigger( 14412 )

	-------------------------------------------------乱斗英雄----------芭芭拉	
	DefineMission (5608, "Blood Shed Taurus Hero of Chaos", 1114)
	
	MisBeginTalk("<t>Taurus always have represent luck, why don't you go to the Chaos arena to try your luck")

	MisBeginCondition(NoMission,1114)
	MisBeginCondition(HasRecord,1111)
	MisBeginCondition(NoRecord,1114)
	MisBeginAction(AddMission,1114)
	MisCancelAction(ClearMission, 1114)
	
	MisNeed(MIS_NEED_DESP, "Obtained 30 Chaos point")
	MisHelpTalk("<t>30 chao points, not hard!")
	MisResultTalk("<t>You came back pretty fast, but don't let you guard down. Your luck isn't so bad")

	MisResultCondition(HasMission, 1114)
	MisResultCondition(NoRecord,1114)
	MisResultCondition(HasFightingPoint,30 )
	MisResultAction(TakeFightingPoint, 30 )
	MisResultAction(ClearMission, 1114)
	MisResultAction(SetRecord,  1114 )
	MisResultAction(GiveItem, 3028, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------芭芭拉	
	DefineMission (5609, "Bloody Taurus - Reputed Hero", 1115)
	
	MisBeginTalk("<t>To pass Taurus Palace, raising your reputation is very important.")

	MisBeginCondition(NoMission,1115)
	MisBeginCondition(HasRecord,1111)
	MisBeginCondition(NoRecord,1115)
	MisBeginAction(AddMission,1115)
	MisCancelAction(ClearMission, 1115)
	
	MisNeed(MIS_NEED_DESP, "Gained 1000 reputation points")
	MisHelpTalk("<t>Other people say my name is very poetic, what do you think?")
	MisResultTalk("<t>I bet you'll come back for this Reputation Emblem, I can tell you're a person who won't give up so easily.")

	MisResultCondition(HasMission, 1115)
	MisResultCondition(NoRecord,1115)
	MisResultCondition(HasCredit,1000 )
	MisResultAction(TakeCredit, 1000 )
	MisResultAction(ClearMission, 1115)
	MisResultAction(SetRecord,  1115 )
	MisResultAction(GiveItem, 3029, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------芭芭拉	
	DefineMission (5610, "Blood Shed Taurus Level Hero", 1116)
	
	MisBeginTalk("All the warriors participating for Taurus Palace must be above level 55. Although you give off a special aura, I cannot give you an exception.")

	MisBeginCondition(NoMission,1116)
	MisBeginCondition(HasRecord,1111)
	MisBeginCondition(NoRecord,1116)
	MisBeginAction(AddMission,1116)
	MisCancelAction(ClearMission, 1116)
	
	MisNeed(MIS_NEED_DESP, "Level reached 55")
	MisHelpTalk("<t>Level 55 could be hard for some people....")
	MisResultTalk("<t>Now I gift this emblem to you. You're worthy of this emblem.")

	MisResultCondition(HasMission, 1116)
	MisResultCondition(NoRecord,1116)
	MisResultCondition(LvCheck, ">", 54 )
	MisResultAction(ClearMission, 1116)
	MisResultAction(SetRecord,  1116 )
	MisResultAction(GiveItem, 3030, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------芭芭拉	
	DefineMission (5611, "Blood Shed Taurus Hero of Honor", 1117)
	
	MisBeginTalk("<t>300 honor points is the minimum I require for heros challenging Taurus Palace. A talented warrior like you should also know the importance on honor points.")

	MisBeginCondition(NoMission,1117)
	MisBeginCondition(HasRecord,1111)
	MisBeginCondition(NoRecord,1117)
	MisBeginAction(AddMission,1117)
	MisCancelAction(ClearMission, 1117)
	
	MisNeed(MIS_NEED_DESP, "Obtained 300 honor points")
	MisHelpTalk("<t>Remember you must finish the quest to get your present")
	MisResultTalk("<t>Your type usually gets very popular here at the bar, handsome looking and bravery. Looks like you're not far from Gemini Palace.")

	MisResultCondition(HasMission, 1117)
	MisResultCondition(NoRecord,1117)
	MisResultCondition(HasHonorPoint,300 )
	MisResultAction(TakeHonorPoint, 300 )
	MisResultAction(ClearMission, 1117)
	MisResultAction(SetRecord,  1117 )
	MisResultAction(GiveItem, 3031, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------芭芭拉	
	DefineMission (5612, "Blood Shed Taurus Gathering ambassador", 1118)
	
	MisBeginTalk("<t>Gathering can test a warrior's patience. Patience is very important for success you know. If you're willing to work hard and not slack, I'll keep that gathering emblem for you.")

	MisBeginCondition(NoMission,1118)
	MisBeginCondition(HasRecord,1111)
	MisBeginCondition(NoRecord,1118)
	MisBeginAction(AddMission,1118)
	MisBeginAction(AddTrigger, 11181, TE_GETITEM, 4804, 10 )---------------带刺的曼陀罗花10
	MisBeginAction(AddTrigger, 11182, TE_GETITEM, 4720, 10 )---------------巨大的熊掌10
	MisBeginAction(AddTrigger, 11183, TE_GETITEM, 3129, 10 )-------------药用草叶10
	MisBeginAction(AddTrigger, 11184, TE_GETITEM, 2588, 5 )--------------精灵辉印5张
	MisBeginAction(AddTrigger, 11185, TE_GETITEM, 4494, 1 )--------------巨大的蟹钳1个
	MisBeginAction(AddTrigger, 11186, TE_GETITEM, 1682, 50 )-------------犬齿50个
	MisBeginAction(AddTrigger, 11187, TE_GETITEM, 1138, 10 )--------------幽灵探测器LV1  10个
	MisBeginAction(AddTrigger, 11188, TE_GETITEM, 0227, 1 )-------------守护精灵饲料1个
	MisCancelAction(ClearMission, 1118)
	

	MisNeed(MIS_NEED_ITEM, 4804, 10, 1, 10 )
	MisNeed(MIS_NEED_ITEM, 4720, 10, 11, 10 )
	MisNeed(MIS_NEED_ITEM, 3129, 10, 21, 10 )
	MisNeed(MIS_NEED_ITEM, 2588, 5, 31, 5 )
	MisNeed(MIS_NEED_ITEM, 4494, 1, 36, 1 )
	MisNeed(MIS_NEED_ITEM, 1682, 50, 37, 50 )
	MisNeed(MIS_NEED_ITEM, 1138, 10, 87, 10 )
	MisNeed(MIS_NEED_ITEM, 0227, 1, 97, 1 )

	MisHelpTalk("<t>those are commonly seen things, shouldn't be hard for you.")
	MisResultTalk("<t>This world exists a lot of people with weird hobbies, I don't really know the purpose of me wanting Canine Tooth and Crab Pincer.")

	MisResultCondition(HasMission, 1118)
	MisResultCondition(NoRecord,1118)
	MisResultCondition(HasItem, 4804, 10 )
	MisResultCondition(HasItem, 4720, 10 )
	MisResultCondition(HasItem, 3129, 10 )
	MisResultCondition(HasItem, 2588, 5 )
	MisResultCondition(HasItem, 4494, 1 )
	MisResultCondition(HasItem, 1682, 50 )
	MisResultCondition(HasItem, 1138, 10 )
	MisResultCondition(HasItem, 0227, 1 )

	MisResultAction(TakeItem, 4804, 10 )
	MisResultAction(TakeItem, 4720, 10 )
	MisResultAction(TakeItem, 3129, 10 )
	MisResultAction(TakeItem, 2588, 5 )
	MisResultAction(TakeItem, 4494, 1 )
	MisResultAction(TakeItem, 1682, 50 )
	MisResultAction(TakeItem, 1138, 10 )
	MisResultAction(TakeItem, 0227, 1 )
	MisResultAction(ClearMission, 1118)
	MisResultAction(SetRecord,  1118 )
	MisResultAction(GiveItem, 3032, 1, 4)
	MisResultAction(GiveItem, 3036, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4804)	
	TriggerAction( 1, AddNextFlag, 1118, 1, 10 )
	RegCurTrigger( 11181 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4720)	
	TriggerAction( 1, AddNextFlag, 1118, 11, 10 )
	RegCurTrigger( 11182 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3129)	
	TriggerAction( 1, AddNextFlag, 1118, 21, 10 )
	RegCurTrigger( 11183 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2588)	
	TriggerAction( 1, AddNextFlag, 1118, 31, 5 )
	RegCurTrigger( 11184 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4494)	
	TriggerAction( 1, AddNextFlag, 1118, 36, 1 )
	RegCurTrigger( 11185 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1682)	
	TriggerAction( 1, AddNextFlag, 1118, 37, 50 )
	RegCurTrigger( 11186 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1138)	
	TriggerAction( 1, AddNextFlag, 1118, 87, 10 )
	RegCurTrigger( 11187 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0227)	
	TriggerAction( 1, AddNextFlag, 1118, 97, 1 )
	RegCurTrigger( 11188 )


	----------------------------------------------------------金牛末日----------芭芭拉
	DefineMission( 5613, "Bloody Taurus - Taurus Doomsday", 1119 )
	MisBeginTalk("<t>Seems like every item that lure people has something to do with beasts. Boss Emblem is a good example for that.")
				
	MisBeginCondition(NoMission, 1119)
	MisBeginCondition(HasRecord,1152)
	MisBeginCondition(NoRecord,1119)
	MisBeginAction(AddMission,1119)
	MisBeginAction(AddTrigger, 11191, TE_KILL, 1038, 1)---金牛守护者
	
	MisCancelAction(ClearMission, 1119)

	MisNeed(MIS_NEED_DESP, "Slain Taurus Protector (2436, 2405)!")
	MisNeed(MIS_NEED_KILL, 1038,1, 10, 1)
	

	MisResultTalk("<t>All scary and haunted adventures is a very good treasure of your memory. When you gain more of this treasure, you'll be seeing a world that people will never be able to see.")
	MisHelpTalk("<t>That scary guy owns a cute beer belly, but this doesn't mean you can let your guard down.")
	MisResultCondition(HasMission,  1119)
	MisResultCondition(HasFlag, 1119, 10)
	MisResultCondition(NoRecord , 1119)
	MisResultAction(GiveItem, 3034, 1, 4 )
	MisResultAction(ClearMission,  1119)
	MisResultAction(SetRecord,  1119 )
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 1038)	
	TriggerAction( 1, AddNextFlag, 1119, 10, 1 )
	RegCurTrigger( 11191 )






-------------------------------------------------乱斗英雄----------芭芭拉	
	DefineMission (5614, "Blood Shed Taurus Hero of Chaos", 1120)
	
	MisBeginTalk("<t>Taurus always have represent luck, why don't you go to the Chaos arena to try your luck")

	MisBeginCondition(NoMission,1120)
	MisBeginCondition(HasRecord,1112)
	MisBeginCondition(NoRecord,1120)
	MisBeginAction(AddMission,1120)
	MisCancelAction(ClearMission, 1120)
	
	MisNeed(MIS_NEED_DESP, "Obtained 60 Chaos Points")
	MisHelpTalk("<t>60 chao points is not that hard!")
	MisResultTalk("<t>You came back pretty fast, but don't let you guard down. Your luck isn't so bad")

	MisResultCondition(HasMission, 1120)
	MisResultCondition(NoRecord,1120)
	MisResultCondition(HasFightingPoint,60 )
	MisResultAction(TakeFightingPoint, 60 )
	MisResultAction(ClearMission, 1120)
	MisResultAction(SetRecord,  1120 )
	MisResultAction(GiveItem, 3028, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------芭芭拉	
	DefineMission (5615, "Bloody Taurus - Reputed Hero", 1121)
	
	MisBeginTalk("<t>To pass Taurus Palace, raising reputation is very important.")

	MisBeginCondition(NoMission,1121)
	MisBeginCondition(HasRecord,1112)
	MisBeginCondition(NoRecord,1121)
	MisBeginAction(AddMission,1121)
	MisCancelAction(ClearMission, 1121)
	
	MisNeed(MIS_NEED_DESP, "Obtain 3000 points of reputation")
	MisHelpTalk("<t>Other people say my name is very poetic, what do you think?")
	MisResultTalk("<t>I bet you'll come back for this Reputation Emblem, I can tell you're a person who won't give up so easily.")

	MisResultCondition(HasMission, 1121)
	MisResultCondition(NoRecord,1121)
	MisResultCondition(HasCredit,3000 )
	MisResultAction(TakeCredit,3000  )
	MisResultAction(ClearMission, 1121)
	MisResultAction(SetRecord,  1121 )
	MisResultAction(GiveItem, 3029, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------芭芭拉	
	DefineMission (5616, "Blood Shed Taurus Level Hero", 1122)
	
	MisBeginTalk("All the warriors participating for Taurus Palace must be above level 60. Although you give off a special aura, I cannot give you an exception.")

	MisBeginCondition(NoMission,1122)
	MisBeginCondition(HasRecord,1112)
	MisBeginCondition(NoRecord,1122)
	MisBeginAction(AddMission,1122)
	MisCancelAction(ClearMission, 1122)
	
	MisNeed(MIS_NEED_DESP, "Level reached 60")
	MisHelpTalk("<t>Level 60 to other players may be a bit hard...")
	MisResultTalk("<t>Now I gift this emblem to you. You're worthy of this emblem.")

	MisResultCondition(HasMission, 1122)
	MisResultCondition(NoRecord,1122)
	MisResultCondition(LvCheck, ">", 59 )
	MisResultAction(ClearMission, 1122)
	MisResultAction(SetRecord,  1122 )
	MisResultAction(GiveItem, 3030, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------芭芭拉	
	DefineMission (5617, "Blood Shed Taurus Hero of Honor", 1123)
	
	MisBeginTalk("<t>500 Honor points is the minimum requirement for a hero challenging Taurus Palace in my rules. I think a skilled warrior like you would look heavily on your honor points too.")

	MisBeginCondition(NoMission,1123)
	MisBeginCondition(HasRecord,1112)
	MisBeginCondition(NoRecord,1123)
	MisBeginAction(AddMission,1123)
	MisCancelAction(ClearMission, 1123)
	
	MisNeed(MIS_NEED_DESP, "Gained 500 honor points")
	MisHelpTalk("<t>Remember you must finish the quest to get your present")
	MisResultTalk("<t>Your type usually gets very popular here at the bar, handsome looking and bravery. Looks like you're not far from Gemini Palace.")

	MisResultCondition(HasMission, 1123)
	MisResultCondition(NoRecord,1123)
	MisResultCondition(HasHonorPoint,500 )
	MisResultAction(TakeHonorPoint, 500 )
	MisResultAction(ClearMission, 1123)
	MisResultAction(SetRecord,  1123 )
	MisResultAction(GiveItem, 3031, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------芭芭拉	
	DefineMission (5618, "Blood Shed Taurus Gathering ambassador", 1124)
	
	MisBeginTalk("<t>Gathering can test a warrior patience. Patience is very important to succeeding you know. If you're willing to work hard and not slack, I'll keep that gathering emblem for you.")

	MisBeginCondition(NoMission,1124)
	MisBeginCondition(HasRecord,1112)
	MisBeginCondition(NoRecord,1124)
	MisBeginAction(AddMission,1124)
	MisBeginAction(AddTrigger, 11241, TE_GETITEM, 4804, 15 )-------------------带刺的曼陀罗花15    
	MisBeginAction(AddTrigger, 11242, TE_GETITEM, 4720, 15 )-------------------巨大的熊掌15          
	MisBeginAction(AddTrigger, 11243, TE_GETITEM, 3129, 15 )-----------------药用草叶15               
	MisBeginAction(AddTrigger, 11244, TE_GETITEM, 2588, 10 )----------------精灵辉印10张               
	MisBeginAction(AddTrigger, 11245, TE_GETITEM, 4494, 1 )------------------巨大的蟹钳1个            
	MisBeginAction(AddTrigger, 11246, TE_GETITEM, 1682, 40 )-----------------犬齿40个                  
	MisBeginAction(AddTrigger, 11247, TE_GETITEM, 1138, 20 )------------------幽灵探测器LV1  20个 
	MisBeginAction(AddTrigger, 11248, TE_GETITEM, 0227, 3 )---------------守护精灵饲料3个          
	MisCancelAction(ClearMission, 1124)
	

	MisNeed(MIS_NEED_ITEM, 4804, 15, 1, 15 )
	MisNeed(MIS_NEED_ITEM, 4720, 15, 16, 15 )
	MisNeed(MIS_NEED_ITEM, 3129, 15, 31, 15 )
	MisNeed(MIS_NEED_ITEM, 2588, 10, 46, 10 )
	MisNeed(MIS_NEED_ITEM, 4494, 1, 56, 1 )
	MisNeed(MIS_NEED_ITEM, 1682, 40, 57, 40 )
	MisNeed(MIS_NEED_ITEM, 1138, 20, 97, 20 )
	MisNeed(MIS_NEED_ITEM, 0227, 3, 117, 3 )

	MisHelpTalk("<t>those are commonly seen things, shouldn't be hard for you.")
	MisResultTalk("<t>This world exists a lot of people with weird hobbies, I don't really know the purpose of me wanting Canine Tooth and Crab Pincer.")

	MisResultCondition(HasMission, 1124)
	MisResultCondition(NoRecord,1124)
	MisResultCondition(HasItem, 4804, 15 )
	MisResultCondition(HasItem, 4720, 15 )
	MisResultCondition(HasItem, 3129, 15 )
	MisResultCondition(HasItem, 2588, 10 )
	MisResultCondition(HasItem, 4494, 1 )
	MisResultCondition(HasItem, 1682, 40 )
	MisResultCondition(HasItem, 1138, 20 )
	MisResultCondition(HasItem, 0227, 3 )

	MisResultAction(TakeItem, 4804, 15 )
	MisResultAction(TakeItem, 4720, 15 )
	MisResultAction(TakeItem, 3129, 15 )
	MisResultAction(TakeItem, 2588, 10 )
	MisResultAction(TakeItem, 4494, 1 )
	MisResultAction(TakeItem, 1682, 40 )
	MisResultAction(TakeItem, 1138, 20 )
	MisResultAction(TakeItem, 0227, 3 )
	MisResultAction(ClearMission, 1124)
	MisResultAction(SetRecord,  1124 )
	MisResultAction(GiveItem, 3032, 1, 4)
	MisResultAction(GiveItem, 3036, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4804)	
	TriggerAction( 1, AddNextFlag, 1124, 1, 15 )
	RegCurTrigger( 11241 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4720)	
	TriggerAction( 1, AddNextFlag, 1124, 16, 15 )
	RegCurTrigger( 11242 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3129)	
	TriggerAction( 1, AddNextFlag, 1124, 31, 15 )
	RegCurTrigger( 11243 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2588)	
	TriggerAction( 1, AddNextFlag, 1124, 46, 10 )
	RegCurTrigger( 11244 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4494)	
	TriggerAction( 1, AddNextFlag, 1124, 56, 1 )
	RegCurTrigger( 11245 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1682)	
	TriggerAction( 1, AddNextFlag, 1124, 57, 40 )
	RegCurTrigger( 11246 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1138)	
	TriggerAction( 1, AddNextFlag, 1124, 97, 20 )
	RegCurTrigger( 11247 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0227)	
	TriggerAction( 1, AddNextFlag, 1124, 117, 3 )
	RegCurTrigger( 11248 )

	



-------------------------------------------------乱斗英雄----------芭芭拉	
	DefineMission (5619, "Blood Shed Taurus Hero of Chaos", 1125)
	
	MisBeginTalk("<t>金牛座一向是幸运的象征,不如你去乱斗场里碰碰运气 ")

	MisBeginCondition(NoMission,1125)
	MisBeginCondition(HasRecord,1113)
	MisBeginCondition(NoRecord,1125)
	MisBeginAction(AddMission,1125)
	MisCancelAction(ClearMission, 1125)
	
	MisNeed(MIS_NEED_DESP, "Obtained 100 chaos points")
	MisHelpTalk("<t>100 chao points, not hard!")
	MisResultTalk("<t>You came back pretty fast, but don't let you guard down. Your luck isn't so bad")

	MisResultCondition(HasMission, 1125)
	MisResultCondition(NoRecord,1125)
	MisResultCondition(HasFightingPoint,100 )
	MisResultAction(TakeFightingPoint, 100 )
	MisResultAction(ClearMission, 1125)
	MisResultAction(SetRecord,  1125 )
	MisResultAction(GiveItem, 3028, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------芭芭拉	
	DefineMission (5620, "Bloody Taurus - Reputed Hero", 1126)
	
	MisBeginTalk("<t>要闯过金牛宫,提高名声是很重要的.")

	MisBeginCondition(NoMission,1126)
	MisBeginCondition(HasRecord,1113)
	MisBeginCondition(NoRecord,1126)
	MisBeginAction(AddMission,1126)
	MisCancelAction(ClearMission, 1126)
	
	MisNeed(MIS_NEED_DESP, "Obtained 5000 points of reputation")
	MisHelpTalk("<t>Other people say my name is very poetic, what do you think?")
	MisResultTalk("<t>I bet you'll come back for this Reputation Emblem, I can tell you're a person who won't give up so easily.")

	MisResultCondition(HasMission, 1126)
	MisResultCondition(NoRecord,1126)
	MisResultCondition(HasCredit,5000 )
	MisResultAction(TakeCredit, 5000 )
	MisResultAction(ClearMission, 1126)
	MisResultAction(SetRecord,  1126 )
	MisResultAction(GiveItem, 3029, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------芭芭拉	
	DefineMission (5621, "Blood Shed Taurus Level Hero", 1127)
	
	MisBeginTalk("All the warriors participating for Taurus Palace must be above level 65. Although you give off a special aura, I cannot give you an exception.")

	MisBeginCondition(NoMission,1127)
	MisBeginCondition(HasRecord,1113)
	MisBeginCondition(NoRecord,1127)
	MisBeginAction(AddMission,1127)
	MisCancelAction(ClearMission, 1127)
	
	MisNeed(MIS_NEED_DESP, "Reached Level 65")
	MisHelpTalk("<t>Level 65 may be a bit hard for someone else...")
	MisResultTalk("<t>Now I gift this emblem to you. You're worthy of this emblem.")

	MisResultCondition(HasMission, 1127)
	MisResultCondition(NoRecord,1127)
	MisResultCondition(LvCheck, ">", 64 )
	MisResultAction(ClearMission, 1127)
	MisResultAction(SetRecord,  1127 )
	MisResultAction(GiveItem, 3030, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------芭芭拉	
	DefineMission (5622, "Blood Shed Taurus Hero of Honor", 1128)
	
	MisBeginTalk("<t>800 honor points is the lowest I'll accept for a hero challenging the Taurus Palace. For a talented warrior like you, honor points should be very important to you.")

	MisBeginCondition(NoMission,1128)
	MisBeginCondition(HasRecord,1113)
	MisBeginCondition(NoRecord,1128)
	MisBeginAction(AddMission,1128)
	MisCancelAction(ClearMission, 1128)
	
	MisNeed(MIS_NEED_DESP, "Gained 800 honor points")
	MisHelpTalk("<t>Remember you must finish the quest to get your present")
	MisResultTalk("<t>Your type usually gets very popular here at the bar, handsome looking and bravery. Looks like you're not far from Gemini Palace.")

	MisResultCondition(HasMission, 1128)
	MisResultCondition(NoRecord,1128)
	MisResultCondition(HasHonorPoint,800 )
	MisResultAction(TakeHonorPoint, 800 )
	MisResultAction(ClearMission, 1128)
	MisResultAction(SetRecord,  1128 )
	MisResultAction(GiveItem, 3031, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------芭芭拉	
	DefineMission (5623, "Blood Shed Taurus Gathering ambassador", 1129)
	
	MisBeginTalk("<t>Gathering can test a warrior patience. Patience is very important to succeeding you know. If you're willing to work hard and not slack, I'll keep that gathering emblem for you.")

	MisBeginCondition(NoMission,1129)
	MisBeginCondition(HasRecord,1113)
	MisBeginCondition(NoRecord,1129)
	MisBeginAction(AddMission,1129)
	MisBeginAction(AddTrigger, 11291, TE_GETITEM, 4804, 10 )---------------------带刺的曼陀罗花10    
	MisBeginAction(AddTrigger, 11292, TE_GETITEM, 4720, 10 )---------------------巨大的熊掌10          
	MisBeginAction(AddTrigger, 11293, TE_GETITEM, 3129, 10 )-------------------药用草叶10               
	MisBeginAction(AddTrigger, 11294, TE_GETITEM, 2588, 15 )------------------精灵辉印15张             
	MisBeginAction(AddTrigger, 11295, TE_GETITEM, 4494, 5 )--------------------巨大的蟹钳5个             
	MisBeginAction(AddTrigger, 11296, TE_GETITEM, 1682, 40 )-------------------犬齿40个                  
	MisBeginAction(AddTrigger, 11297, TE_GETITEM, 1138, 25 )--------------------幽灵探测器LV1  25个 
	MisBeginAction(AddTrigger, 11298, TE_GETITEM, 0227, 5 )----------------------守护精灵饲料5个            
	MisCancelAction(ClearMission, 1129)						                                     
	

	MisNeed(MIS_NEED_ITEM, 4804, 10, 1, 10 )
	MisNeed(MIS_NEED_ITEM, 4720, 10, 11, 10 )
	MisNeed(MIS_NEED_ITEM, 3129, 10, 21, 10 )
	MisNeed(MIS_NEED_ITEM, 2588, 15, 31, 15 )
	MisNeed(MIS_NEED_ITEM, 4494, 5, 46, 5)
	MisNeed(MIS_NEED_ITEM, 1682, 40, 51, 40 )
	MisNeed(MIS_NEED_ITEM, 1138, 25, 91, 25 )
	MisNeed(MIS_NEED_ITEM, 0227, 5, 116, 5 )

	MisHelpTalk("<t>those are commonly seen things, shouldn't be hard for you.")
	MisResultTalk("<t>This world exists a lot of people with weird hobbies, I don't really know the purpose of me wanting Canine Tooth and Crab Pincer.")

	MisResultCondition(HasMission, 1129)
	MisResultCondition(NoRecord,1129)
	MisResultCondition(HasItem, 4804, 10 )
	MisResultCondition(HasItem, 4720, 10 )
	MisResultCondition(HasItem, 3129, 10 )
	MisResultCondition(HasItem, 2588, 15 )
	MisResultCondition(HasItem, 4494,  5 )
	MisResultCondition(HasItem, 1682, 40 )
	MisResultCondition(HasItem, 1138, 25 )
	MisResultCondition(HasItem, 0227, 5 )

	MisResultAction(TakeItem, 4804, 10 )
	MisResultAction(TakeItem, 4720, 10 )
	MisResultAction(TakeItem, 3129, 10 )
	MisResultAction(TakeItem, 2588, 15 )
	MisResultAction(TakeItem, 4494, 5 )
	MisResultAction(TakeItem, 1682, 40 )
	MisResultAction(TakeItem, 1138, 25 )
	MisResultAction(TakeItem, 0227, 5 )
	MisResultAction(ClearMission, 1129)
	MisResultAction(SetRecord,  1129 )
	MisResultAction(GiveItem, 3032, 1, 4)
	MisResultAction(GiveItem, 3036, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4804)	
	TriggerAction( 1, AddNextFlag, 1129, 1, 10 )
	RegCurTrigger( 11291 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4720)	
	TriggerAction( 1, AddNextFlag, 1129, 11, 10 )
	RegCurTrigger( 11292 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3129)	
	TriggerAction( 1, AddNextFlag, 1129, 21, 10 )
	RegCurTrigger( 11293 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2588)	
	TriggerAction( 1, AddNextFlag, 1129, 31, 15 )
	RegCurTrigger( 11294 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4494)	
	TriggerAction( 1, AddNextFlag, 1129, 46, 5 )
	RegCurTrigger( 11295 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1682)	
	TriggerAction( 1, AddNextFlag, 1129, 51, 40 )
	RegCurTrigger( 11296 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1138)	
	TriggerAction( 1, AddNextFlag, 1129, 91, 25 )
	RegCurTrigger( 11297 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0227)	
	TriggerAction( 1, AddNextFlag, 1129, 116, 5 )
	RegCurTrigger( 11298 )


	

	----------------------------------------------------------社交大使----------芭芭拉
	DefineMission( 5624, "Blood Shed Taurus Public Relations Ambassador", 1130 )
	MisBeginTalk("<t>The bar isn't doing too well lately, we need to advertise but we don't have the money. Can you please help us advertise a bit while making new friends outside town?")
				
	MisBeginCondition(NoMission, 1130)
	MisBeginCondition(NoRecord,1130)
	MisBeginCondition(HasRecord, 1152)-------------------新的id,最后的id
	MisBeginAction(AddMission,1130)
	MisCancelAction(ClearMission, 1130)

	MisNeed(MIS_NEED_DESP, "Talk to Sa Mori (628, 2095) in Region Ascaron")
	
	MisHelpTalk("<t>When she was young, she's our frequent customer.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使-----------------賽·魔力

	DefineMission(5625, "TOP Ambassador", 1130, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Bar? You've found the right person. Look at my body shape and you can tell I can drink a lot, I'm very proud of this.")
	MisResultCondition(NoRecord, 1130)
	MisResultCondition(HasMission,1130)
	MisResultAction(ClearMission,1130)
	MisResultAction(SetRecord, 1130)

	----------------------------------------------------------社交大使2----------賽·魔力
	DefineMission( 5626, "TOP Ambassador 2", 1131 )
	MisBeginTalk("<t>Thank you for you help. I'm not sure if you'll be passing by Shaitan, but I'm very worried about my friend Ada, she's always staying in a place full of beasts and pray for them to turn good. She wants the beast to eat vegetable not meat, hope she'll succeed.")
				
	MisBeginCondition(NoMission, 1131)
	MisBeginCondition(NoRecord,1131)
	MisBeginCondition(HasRecord, 1130)
	MisBeginAction(AddMission,1131)
	MisCancelAction(ClearMission, 1131)

	MisNeed(MIS_NEED_DESP, "Find Shaitan's Holy Priestess· Ada(862, 3303) for a chat")
	
	MisHelpTalk("<t>Holy people are just too na?ve, how can they compare to us drunker freedom?...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使2-------------圣女·艾达
	DefineMission(5627, "TOP Ambassador 2", 1131, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Hi! May Kara bless you! May the world best things be blessed upon you. May happiness be always around you.....")
	MisResultCondition(NoRecord, 1131)
	MisResultCondition(HasMission,1131)
	MisResultAction(ClearMission,1131)
	MisResultAction(SetRecord, 1131)

	----------------------------------------------------------社交大使3----------圣女·艾达
	DefineMission( 5628, "TOP Ambassador 3", 1132 )
	MisBeginTalk("<t>All thanks to the Goddess's blessing that allows me to live in harmony with these wild animals. I'm not a expert on drinking, why don't you ask Tae.")
				
	MisBeginCondition(NoMission, 1132)
	MisBeginCondition(NoRecord,1132)
	MisBeginCondition(HasRecord, 1131)
	MisBeginAction(AddMission,1132)
	MisCancelAction(ClearMission, 1132)

	MisNeed(MIS_NEED_DESP, "Head to Skeleton Haven and talk to Tae (2128, 540)")
	
	MisHelpTalk("<t>His Dreams is full of rich poetic ideas, but it'll be hard to archieve")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使3--------阿泰
	DefineMission(5629, "TOP Ambassador 3", 1132, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>The dream where I want to change into a sea creature has no chance to come true at all, is kind of regretful. I'm a fish, the air in the water..... Swimming back and forth.....")
	MisResultCondition(NoRecord, 1132)
	MisResultCondition(HasMission,1132)
	MisResultAction(ClearMission,1132)
	MisResultAction(SetRecord, 1132)



	----------------------------------------------------------社交大使4----------阿泰
	DefineMission( 5630, "TOP Ambassador 4", 1133 )
	MisBeginTalk("<t>Use wine to get rid of my problems? NO! This does not fit my sunshine boy image. If Granny - Beldi knows about this, she'll no longer send me any cakes. For that tasty cake, I hold my grudge.")
				
	MisBeginCondition(NoMission, 1133)
	MisBeginCondition(NoRecord,1133)
	MisBeginCondition(HasRecord, 1132)
	MisBeginAction(AddMission,1133)
	MisCancelAction(ClearMission, 1133)

	MisNeed(MIS_NEED_DESP, "Help Tae to visit Granny - Beldi (2277, 2769)")
	
	MisHelpTalk("<t>Talking about cakes makes me want to drool..")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使4--------老奶奶·贝蒂
	DefineMission(5631, "TOP Ambassador 4", 1133, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Really? Tae thought of me again? I think he misses the cakes I bake more, hoho.")
	MisResultCondition(NoRecord, 1133)
	MisResultCondition(HasMission,1133)
	MisResultAction(ClearMission,1133)
	MisResultAction(SetRecord, 1133)


	----------------------------------------------------------社交大使5----------老奶奶·贝蒂
	DefineMission( 5632, "TOP Ambassador 5", 1134 )
	MisBeginTalk("<t>I'll hurry and bake some cakes for Tae, but when it comes to bar, is not my age anymore. Thank you for asking though, maybe Trader - Yuka would be interested.")
				
	MisBeginCondition(NoMission, 1134)
	MisBeginCondition(NoRecord,1134)
	MisBeginCondition(HasRecord, 1133)
	MisBeginAction(AddMission,1134)
	MisCancelAction(ClearMission, 1134)

	MisNeed(MIS_NEED_DESP, "Talk to Trader - Yuka (2519, 2397) at Cupid Isle ")
	
	MisHelpTalk("<t>Thinking of tae drooling makes me want to rush baking my cake more.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使5--------交易员·尤卡
	DefineMission(5633, "TOP Ambassador 5", 1134, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I'm scared to miss good things like drinking wine, but good thing granny still thinks of me, haha. I really miss eating granny's cake as I grow up.")
	MisResultCondition(NoRecord, 1134)
	MisResultCondition(HasMission,1134)
	MisResultAction(ClearMission,1134)
	MisResultAction(SetRecord, 1134)


	----------------------------------------------------------社交大使6----------交易员·尤卡
	DefineMission( 5634, "TOP Ambassador 6", 1135 )
	MisBeginTalk("<t>Once I'm finished with moving these goodies I'll be going to the bar, hope my drinking friend Harbor Operator - Odie also can come.")
				
	MisBeginCondition(NoMission, 1135)
	MisBeginCondition(NoRecord,1135)
	MisBeginCondition(HasRecord, 1134)
	MisBeginAction(AddMission,1135)
	MisCancelAction(ClearMission, 1135)

	MisNeed(MIS_NEED_DESP, "Talk to Harbor Operator - Odie (738, 3803) at Karmas Haven")
	
	MisHelpTalk("<t>Not sure if Babara is more beautiful.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使6--------海港指挥·奥登
	DefineMission(5635, "TOP Ambassador 6", 1135, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>To a man, drinking means a chance to go on a date with a girl..")
	MisResultCondition(NoRecord, 1135)
	MisResultCondition(HasMission,1135)
	MisResultAction(ClearMission,1135)
	MisResultAction(SetRecord, 1135)



	----------------------------------------------------------社交大使7----------海港指挥·奥登
	DefineMission( 5636, "TOP Ambassador 7", 1136 )
	MisBeginTalk("<t>What are you laughing at?Humph! Help me inform the Conch Merchant . Lamon to come and collect his Conch, I need to go to the bar now")
				
	MisBeginCondition(NoMission, 1136)
	MisBeginCondition(NoRecord,1136)
	MisBeginCondition(HasRecord, 1135)
	MisBeginAction(AddMission,1136)
	MisCancelAction(ClearMission, 1136)

	MisNeed(MIS_NEED_DESP, "Talk to Coral Vendor - Lamon (2061, 2543) at Region Ascaron")
	
	MisHelpTalk("<t>I always help those cute merchants, if not how to have money to stay in bar?")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使7--------贝壳商人·拉姆
	DefineMission(5637, "TOP Ambassador 7", 1136, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Odie has always been a drunk with no money, I can only use this to make him help me.")
	MisResultCondition(NoRecord, 1136)
	MisResultCondition(HasMission,1136)
	MisResultAction(ClearMission,1136)
	MisResultAction(SetRecord, 1136)


	----------------------------------------------------------社交大使8----------贝壳商人·拉姆
	DefineMission( 5638, "TOP Ambassador 8", 1137 )
	MisBeginTalk("<t>Why do you look at me like that? We merchants all look like this.")
				
	MisBeginCondition(NoMission, 1137)
	MisBeginCondition(NoRecord,1137)
	MisBeginCondition(HasRecord, 1136)
	MisBeginAction(AddMission,1137)
	MisCancelAction(ClearMission, 1137)

	MisNeed(MIS_NEED_DESP, "Talk to Captain Jack (1672, 3777) on Canary Isle")
	
	MisHelpTalk("<t>Don't say I didn't remind you, its not safe there, be careful!")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使8--------杰克船长
	DefineMission(5639, "TOP Ambassador 8", 1137, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I am already used to being adored by girls, and boys being jealous")
	MisResultCondition(NoRecord, 1137)
	MisResultCondition(HasMission,1137)
	MisResultAction(ClearMission,1137)
	MisResultAction(SetRecord, 1137)


	----------------------------------------------------------社交大使9----------杰克船长
	DefineMission( 5640, "TOP Ambassador 9", 1138 )
	MisBeginTalk("<t>Scar is a man badge, beer is a pirate's partner, I will not miss out on any beer. I wonder if my friend Northern Pirate - Yakamoto will join, although not a lot of people can understand him when he talks.")
				
	MisBeginCondition(NoMission, 1138)
	MisBeginCondition(NoRecord,1138)
	MisBeginCondition(HasRecord, 1137)
	MisBeginAction(AddMission,1138)
	MisCancelAction(ClearMission, 1138)

	MisNeed(MIS_NEED_DESP, "Head to Autumn Island and talk toNorthern Pirate - Yakamoto (2221, 3285)")
	
	MisHelpTalk("<t>Northern Pirate - Yakamoto has always want to exchange experience with other pirates.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使9--------东方海盗·铃佐田山
	DefineMission(5641, "TOP Ambassador 9", 1138, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I am a pirate from a faraway land who just learnt your language.##@@#$, I love this beautiful island.&*&%, Hmm...but being a pirate is often misleading. I had some issue with Captain Jack when I first came here.")
	MisResultCondition(NoRecord, 1138)
	MisResultCondition(HasMission,1138)
	MisResultAction(ClearMission,1138)
	MisResultAction(SetRecord, 1138)

	----------------------------------------------------------社交大使10----------东方海盗·铃佐田山
	DefineMission( 5642, "TOP Ambassador 10", 1139 )
	MisBeginTalk("<t>Jack is going also? Please let me think about it then. I think I'll just go fishing with my friend Trader - Sacenis.")
				
	MisBeginCondition(NoMission, 1139)
	MisBeginCondition(NoRecord,1139)
	MisBeginCondition(HasRecord, 1138)
	MisBeginAction(AddMission,1139)
	MisCancelAction(ClearMission, 1139)

	MisNeed(MIS_NEED_DESP, "Talk to Trader - Sacenis (2279, 1112) at Glacier Isle")
	
	MisHelpTalk("<t>Think I'll just wait for the date with Sacenis")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使10--------交易员·赛瑟尼
	DefineMission(5643, "TOP Ambassador 10", 1139, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I really love Northern Pirate - Yakamoto, especially his romantic trait and his appearance switch.")
	MisResultCondition(NoRecord, 1139)
	MisResultCondition(HasMission,1139)
	MisResultAction(ClearMission,1139)
	MisResultAction(SetRecord, 1139)

	----------------------------------------------------------社交大使11----------交易员·赛瑟尼
	DefineMission( 5644, "TOP Ambassador 11", 1140 )
	MisBeginTalk("<t>If Jack likes going to the bar, then I'll go to the sea side with Northern Pirate - Yakamoto. Enemies should meet less. Yes, I think that boy Ham will be interested in going to the bar.")
				
	MisBeginCondition(NoMission, 1140)
	MisBeginCondition(NoRecord,1140)
	MisBeginCondition(HasRecord, 1139)
	MisBeginAction(AddMission,1140)
	MisCancelAction(ClearMission, 1140)

	MisNeed(MIS_NEED_DESP, "Talk to ham (826, 3347) at Old Shaitan City")
	
	MisHelpTalk("<t>Please don't teach the bad things to kids. We're mainly scared they'll come for the excitement...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使11--------汉姆
	DefineMission(5645, "TOP Ambassador 11", 1140, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Kids shouldn't be going to the bar, but...handsome boys are an expection! I will go for sure, thank you for the good news.")
	MisResultCondition(NoRecord, 1140)
	MisResultCondition(HasMission,1140)
	MisResultAction(ClearMission,1140)
	MisResultAction(SetRecord, 1140)

	----------------------------------------------------------社交大使12----------汉姆
	DefineMission( 5646, "TOP Ambassador 12", 1141 )
	MisBeginTalk("<t>Gentlemen will not enjoy the wine himself, and that's my rule. I am going to call my friend Zurbi.")
				
	MisBeginCondition(NoMission, 1141)
	MisBeginCondition(NoRecord,1141)
	MisBeginCondition(HasRecord, 1140)
	MisBeginAction(AddMission,1141)
	MisCancelAction(ClearMission, 1141)

	MisNeed(MIS_NEED_DESP, "Talk to Zurbi (1037, 671) in Atlantis Haven")
	
	MisHelpTalk("<t>I have never went to the bar before, do I need to bring ID card? If I get drunk will there be people sending me home?")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使12--------朱比
	DefineMission(5647, "TOP Ambassador 12", 1141, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>To speak the truth, everytime Ham gives a suggestion, it is very exciting. However, is because of this I get scold by my mother every time that I'm not mature enough.")
	MisResultCondition(NoRecord, 1141)
	MisResultCondition(HasMission,1141)
	MisResultAction(ClearMission,1141)
	MisResultAction(SetRecord, 1141)


	----------------------------------------------------------社交大使13----------朱比
	DefineMission( 5648, "TOP Ambassador 13", 1142 )
	MisBeginTalk("<t>Although I've sworn to never listen to his suggestions again, but going to the bar is my goal and sign to become mature, so..hehe, if you pass by Andes Forest Haven please help me ask Accessory - Rikka if he has any beautiful buttons. This will be my first time going to the bar, I cannot dress too poorly. ")
				
	MisBeginCondition(NoMission, 1142)
	MisBeginCondition(NoRecord,1142)
	MisBeginCondition(HasRecord, 1141)
	MisBeginAction(AddMission,1142)
	MisCancelAction(ClearMission, 1142)

	MisNeed(MIS_NEED_DESP, "Talk to Accessory - Rikka (996, 2969) in Andes Forest Haven")
	
	MisHelpTalk("<t>Accessory - Rikka has a sharp eye for looking at jewelry. When I was small, my mother always brought me there to buy jewelry. Then, he'll say my mother is very beautiful each time and gives me candy.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使13--------饰品商人·里克
	DefineMission(5649, "TOP Ambassador 13", 1142, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Selling buttons to go to the bar? Forbei has grow up now, but his mother face doesn't seem to get affected at all, she still processes the best charm as a customer.")
	MisResultCondition(NoRecord, 1142)
	MisResultCondition(HasMission,1142)
	MisResultAction(ClearMission,1142)
	MisResultAction(SetRecord, 1142)

	----------------------------------------------------------社交大使14----------饰品商人·里克
	DefineMission( 5650, "TOP Ambassador 14", 1143 )
	MisBeginTalk("<t>Remembering back when I was young I met Pirate Jeremy, and our friendship is very good. My Jewlery business is so successful thanks to his help. If you're free to go Isle of Chill, please help me give my greetings to him.")
				
	MisBeginCondition(NoMission, 1143)
	MisBeginCondition(NoRecord,1143)
	MisBeginCondition(HasRecord, 1142)
	MisBeginAction(AddMission,1143)
	MisCancelAction(ClearMission, 1143)

	MisNeed(MIS_NEED_DESP, "Talk to Pirate Jeremy (2362, 657) on Isle of Chill")
	
	MisHelpTalk("Isle of Chill is located at Region Magical Ocean.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使14--------海盗杰里米        
	DefineMission(5651, "TOP Ambassador 14", 1143, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Haha, that was my first time going to the bar. I remember that time I was only a tiny pirate, and I drank to make myself become more brave while sailing at sea. I don't know why I'm so fateful with Rikka, sometimes I think if Rikka is a girl, then maybe I won't be single anymore.")
	MisResultCondition(NoRecord, 1143)
	MisResultCondition(HasMission,1143)
	MisResultAction(ClearMission,1143)
	MisResultAction(SetRecord, 1143)

	----------------------------------------------------------社交大使15----------海盗杰里米
	DefineMission( 5652, "TOP Ambassador 15", 1144 )
	MisBeginTalk("<t>This reminds me I want to join the pirate group Lessie, but too bad he's too tiny. If you want to travel out to the sea, you have to drink beer to become more brave.")
				
	MisBeginCondition(NoMission, 1144)
	MisBeginCondition(NoRecord,1144)
	MisBeginCondition(HasRecord, 1143)
	MisBeginAction(AddMission,1144)
	MisCancelAction(ClearMission, 1144)

	MisNeed(MIS_NEED_DESP, "Talk to Lessie (1379, 612) at Icicle City")
	
	MisHelpTalk("<t>I beg of you, I love him dearly")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使15-------- 雷斯·小虫
	DefineMission(5653, "TOP Ambassador 15", 1144, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>My goal is to become a Golden Pirate like Huckinson")
	MisResultCondition(NoRecord, 1144)
	MisResultCondition(HasMission,1144)
	MisResultAction(ClearMission,1144)
	MisResultAction(SetRecord, 1144)


	----------------------------------------------------------社交大使16----------雷斯·小虫
	DefineMission( 5654, "TOP Ambassador 16", 1145 )
	MisBeginTalk("<t>To achieve my dreams, I think I should start learning to swim, sword skills, and operate a boat. I think Harbor Operator - Whitcombe can help me learn how to operate a boat.")
				
	MisBeginCondition(NoMission, 1145)
	MisBeginCondition(NoRecord,1145)
	MisBeginCondition(HasRecord, 1144)
	MisBeginAction(AddMission,1145)
	MisCancelAction(ClearMission, 1145)

	MisNeed(MIS_NEED_DESP, "Talk to Harbor Operator - Whitcombe (2041, 1355) in Hafta Haven")
	
	MisHelpTalk("<t>I'm a very stubborn person, for recovering the peaceful sea for trading I'm willing to be a good willed pirate.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使16-------- 海港指挥·瓦雷米
	DefineMission(5655, "TOP Ambassador 16", 1145, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>He wants to learn operating a boat from me? Haha, my boat skills are very famous you know.")
	MisResultCondition(NoRecord, 1145)
	MisResultCondition(HasMission,1145)
	MisResultAction(ClearMission,1145)
	MisResultAction(SetRecord, 1145)


	----------------------------------------------------------社交大使17----------海港指挥·瓦雷米
	DefineMission( 5656, "TOP Ambassador 17", 1146 )
	MisBeginTalk("<t>I don't go to the bar anymore. There seem to be a growing of dark aura around here, If I don't help the ships that came from afar, I don't know how many people will become shark's buffet. Maybe you can go ask Solaru, I remember he said he was going to go for a vacation, maybe he can intro me a place or two.")
				
	MisBeginCondition(NoMission, 1146)
	MisBeginCondition(NoRecord,1146)
	MisBeginCondition(HasRecord, 1145)
	MisBeginAction(AddMission,1146)
	MisCancelAction(ClearMission, 1146)

	MisNeed(MIS_NEED_DESP, "Talk to Solaru (1202, 3179) in Babu Haven")
	
	MisHelpTalk("<t>Solaru is a youngster full of passion, go and talk to him.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使17-------- 索拉姆·萨加
	DefineMission(5657, "TOP Ambassador 17", 1146, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>I'm a person who is willing to give up life just for my dreams and honour, even girls agree.")
	MisResultCondition(NoRecord, 1146)
	MisResultCondition(HasMission,1146)
	MisResultAction(ClearMission,1146)
	MisResultAction(SetRecord, 1146)

	----------------------------------------------------------社交大使18----------索拉姆·萨加
	DefineMission( 5658, "TOP Ambassador 18", 1147 )
	MisBeginTalk("<t>I'm about to go out, if you have anything to say please hurry. Bar? That's a good place to meet people, I think I am going to change my plan now. Please help me tell Ramus that this haven came a lot of traders lately and he should look over his port as well, thank you very much.")
				
	MisBeginCondition(NoMission, 1147)
	MisBeginCondition(NoRecord,1147)
	MisBeginCondition(HasRecord, 1146)
	MisBeginAction(AddMission,1147)
	MisCancelAction(ClearMission, 1147)

	MisNeed(MIS_NEED_DESP, "Talk to Harbor Operator - Ramus (2297, 3723) at Muse Haven")
	
	MisHelpTalk("<t>Compared to sleeping, young people should spent time noticing their growth. Why are you looking at me like that? I'm a youth with great passion in other people eyes.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使18-------- 海港指挥·拉米修
	DefineMission(5659, "TOP Ambassador 18", 1147, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Thank you for coming and bringing me this message. I'm short of man right now, do you want to stay here and be my assistant?")
	MisResultCondition(NoRecord, 1147)
	MisResultCondition(HasMission,1147)
	MisResultAction(ClearMission,1147)
	MisResultAction(SetRecord, 1147)

	----------------------------------------------------------社交大使19----------海港指挥·拉米修
	DefineMission( 5660, "TOP Ambassador 19", 1148 )
	MisBeginTalk("<t>Habour Operator is a high rank and busy job. Speaking of busy I haven't seen cute Elizabeth for awhile, I wonder if her style is still the same.")
				
	MisBeginCondition(NoMission, 1148)
	MisBeginCondition(NoRecord,1148)
	MisBeginCondition(HasRecord, 1147)
	MisBeginAction(AddMission,1148)
	MisCancelAction(ClearMission, 1148)

	MisNeed(MIS_NEED_DESP, "Look for Elizabeth in the Treasure Gulf at (616, 965)")
	
	MisHelpTalk("<t>When elizabeth was small, she was pretty like a mess. ")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使19-------- 伊丽莎白
	DefineMission(5661, "TOP Ambassador 19", 1148, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>Waiting for one person is very painful and lonely, but I enjoy my standing ground for this passion. ")
	MisResultCondition(NoRecord, 1148)
	MisResultCondition(HasMission,1148)
	MisResultAction(ClearMission,1148)
	MisResultAction(SetRecord, 1148)


		----------------------------------------------------------社交大使20----------伊丽莎白
	DefineMission( 5662, "TOP Ambassador 20", 1149 )
	MisBeginTalk("<t>I always relay on some strange shining jewlery to waste time, but Miner Drunky told me he dugged up one Ancient Emerald, and I'm in need of money, I must make him stay and sell it to me. Strange though, how can digging dug up an emerald?")
				
	MisBeginCondition(NoMission, 1149)
	MisBeginCondition(NoRecord,1149)
	MisBeginCondition(HasRecord, 1148)
	MisBeginAction(AddMission,1149)
	MisCancelAction(ClearMission, 1149)

	MisNeed(MIS_NEED_DESP, "Talk to Miner Drunky (296, 57) down at Silver Mine B2")
	
	MisHelpTalk("<t>谢谢你年轻人．去吧")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使20-------- 矿工大肚腩
	DefineMission(5663, "TOP Ambassador 20", 1149, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>An outstanding man and expensive treasure is what beautiful women loves the most, like me and Ancient Emerald.")
	MisResultCondition(NoRecord, 1149)
	MisResultCondition(HasMission,1149)
	MisResultAction(ClearMission,1149)
	MisResultAction(SetRecord, 1149)

		----------------------------------------------------------社交大使21----------矿工大肚腩
	DefineMission( 5664, "TOP Ambassador 21", 1150 )
	MisBeginTalk("<t>Congratlations for completing this super long Community quest, think now you will know more people around the world, this will help in your exploring a lot. I also heard the beautiful Bar Waitress - <bBabara> is looking for you.")
				
	MisBeginCondition(NoMission, 1150)
	MisBeginCondition(NoRecord,1150)
	MisBeginCondition(HasRecord, 1149)
	MisBeginAction(AddMission,1150)
	MisCancelAction(ClearMission, 1150)

	MisNeed(MIS_NEED_DESP, "Talk to Babara (1310, 530)")
	
	MisHelpTalk("<t>Babara has a present for you.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交英雄21------- 芭芭拉
	DefineMission(5667, "Community Hero 21", 1150, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>You have passed TOP test, I will award you with an emblem")
	MisResultCondition(NoRecord, 1150)
	MisResultCondition(HasMission,1150)
	MisResultAction(ClearMission,1150)
	MisResultAction(SetRecord, 1150)
	MisResultAction(GiveItem, 3033, 1, 4)
	MisResultBagNeed(1)

--	-------------------------------------------------特别任务	--------芭芭拉
--	DefineMission (5668, "Blood Shed Taurus Special Operation", 1153)
--	
--	MisBeginTalk("<t>This quest is Taurus Special Operation, you don't have to participate if you don't want to, but you don't get the prize. Sail to <b Aerase Haven and talk to Harbor Operator - Buni (2042, 6351) in 10 minutes>")
--
--	MisBeginCondition(NoMission,1153)
--	MisBeginCondition(NoRecord,1153)
--	MisBeginCondition(HasRecord,1113)
--	MisBeginCondition(HasRecord,1114)
--	MisBeginCondition(HasRecord,1115)
--	MisBeginCondition(HasRecord,1116)
--	MisBeginCondition(HasRecord,1117)
--	MisBeginCondition(HasRecord,1118)
--	MisBeginCondition(HasRecord,1150)
--	MisBeginCondition(HasRecord,1119)
--	MisBeginAction(AddMission,1153)
--	MisBeginAction(AddChaItem3, 2952)---------金牛特别行动卡
--	MisCancelAction(ClearMission, 1153)
--	MisBeginBagNeed(1)
--	
--	MisNeed(MIS_NEED_DESP, "Sail to Aerase Haven and talk to Harbor Operator - Buni (2042, 635)")
--	MisHelpTalk("<t>Go now! You only have 15 minutes")
--
--	MisResultCondition(AlwaysFailure)	
--
--	--------------------------------------特别任务----海港指挥·布纽
--
--	DefineMission(5669, "Blood Shed Taurus Special Operation", 1153, COMPLETE_SHOW )
--	
--	MisBeginCondition(AlwaysFailure )
--
--	MisResultTalk("<t>Not too bad, you will not regret it.")
--	MisResultCondition(HasMission, 1153)
--	MisResultCondition(NoRecord,1153)
--	MisResultAction(AddChaItem5, 2952)----特别行动卡
--	MisResultAction(ClearMission, 1153)
--	MisResultAction(SetRecord,  1153 )
--	MisResultAction(GiveItem, 3035, 1, 4)------------金牛船长酷装宝箱
--	MisResultBagNeed(1)
	
---------------------------------------------------特别任务	--------芭芭拉
--	DefineMission (5673, "Blood Shed Taurus Special Operation", 1159)
--	
--	MisBeginTalk("<t>This quest is Taurus Special Operation, you don't have to participate if you don't want to, but you don't get the prize. Sail to <b Aerase Haven and talk to Harbor Operator - Buni (2042, 6351) in 10 minutes>")
--
--	MisBeginCondition(NoMission,1159)
--	MisBeginCondition(NoRecord,1159)
--	MisBeginCondition(HasRecord,1112)
--	MisBeginCondition(HasRecord,1120)
--	MisBeginCondition(HasRecord,1121)
--	MisBeginCondition(HasRecord,1122)
--	MisBeginCondition(HasRecord,1123)
--	MisBeginCondition(HasRecord,1124)
--	MisBeginCondition(HasRecord,1150)
--	MisBeginCondition(HasRecord,1119)
--	MisBeginAction(AddMission,1159)
--	MisBeginAction(AddChaItem3, 2952)---------金牛特别行动卡
--	MisCancelAction(ClearMission, 1159)
--	MisBeginBagNeed(1)
--	
--	MisNeed(MIS_NEED_DESP, "Sail to Aerase Haven and talk to Harbor Operator - Buni (2042, 635)")
--	MisHelpTalk("<t>Go now! You only have 15 minutes")
--
--	MisResultCondition(AlwaysFailure)	
--
--	--------------------------------------特别任务----海港指挥·布纽
--
--	DefineMission(5674, "Blood Shed Taurus Special Operation", 1159, COMPLETE_SHOW )
--	
--	MisBeginCondition(AlwaysFailure )
--
--	MisResultTalk("<t>Not too bad, you will not regret it.")
--	MisResultCondition(HasMission, 1159)
--	MisResultCondition(NoRecord,1159)
--	MisResultAction(AddChaItem5, 2952)----特别行动卡
--	MisResultAction(ClearMission, 1159)
--	MisResultAction(SetRecord,  1159 )
--	MisResultAction(GiveItem, 3035, 1, 4)------------金牛船长酷装宝箱
--	MisResultBagNeed(1)
--	
-------------------------------------------------特别任务	--------芭芭拉
	DefineMission (5675, "Blood Shed Taurus Special Operation", 1160)
	
	MisBeginTalk("<t>This quest is a Taurus Palace special event. You don't have to play the quest, but of course you don't get a present. Test your knowledge now, Talk to <b Jack Arrow (230, 579) at Skeletar Isle within 7 minutes>")

	MisBeginCondition(NoMission,1160)
	MisBeginCondition(NoRecord,1160)
	MisBeginCondition(HasRecord,1113)
	MisBeginCondition(HasRecord,1125)
	MisBeginCondition(HasRecord,1126)
	MisBeginCondition(HasRecord,1127)
	MisBeginCondition(HasRecord,1128)
	MisBeginCondition(HasRecord,1129)
	MisBeginCondition(HasRecord,1150)
	MisBeginCondition(HasRecord,1119)
	MisBeginAction(AddMission,1160)
	MisBeginAction(AddChaItem3, 2952)---------金牛特别行动卡
	MisCancelAction(ClearMission, 1160)
	MisBeginBagNeed(1)
	
	MisNeed(MIS_NEED_DESP, "Talk to Jack Arrow (230, 579)")
	MisHelpTalk("<t>Hurry up and go, you only have 7 minutes")

	MisResultCondition(AlwaysFailure)	

	--------------------------------------特别任务----杰克史派罗

	DefineMission(5676, "Blood Shed Taurus Special Operation", 1160, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )

	MisResultTalk("<t>You dare to challenge Skeletar Isle? You got guts! However, I hate people like you who have guts, only give me nothing but trouble and making me busy for nothing.")
	MisResultCondition(HasMission, 1160)
	MisResultCondition(NoRecord,1160)
	MisResultAction(AddChaItem5, 2952)----特别行动卡
	MisResultAction(ClearMission, 1160)
	MisResultAction(SetRecord,  1160 )
	MisResultAction(GiveItem, 3035, 1, 4)------------金牛船长酷装宝箱
	MisResultBagNeed(1)
	


-------------------------------------------------金牛之水手过关奖励----------芭芭拉	
	DefineMission (5670, "Prize for completing Sailor of Taurus", 1156)
	
	MisBeginTalk("<t>Collect all 7 Taurus Emblem to exchange with me for Taurus Protector Seal and Gemini Gate Ticket. There are also more prizes available.")

	MisBeginCondition(NoMission,1156)
	MisBeginCondition(HasRecord,1111)
	MisBeginCondition(HasRecord,1114)
	MisBeginCondition(HasRecord,1115)
	MisBeginCondition(HasRecord,1116)
	MisBeginCondition(HasRecord,1117)
	MisBeginCondition(HasRecord,1118)
	MisBeginCondition(HasRecord,1150)
	MisBeginCondition(HasRecord,1119)
	MisBeginCondition(NoRecord,1156)
	MisBeginAction(AddMission,1156)  
	MisBeginAction(AddTrigger, 11561, TE_GETITEM, 3028, 1 )		
	MisBeginAction(AddTrigger, 11562, TE_GETITEM, 3029, 1 )		
	MisBeginAction(AddTrigger, 11563, TE_GETITEM, 3030, 1 )		
 	MisBeginAction(AddTrigger, 11564, TE_GETITEM, 3031, 1 )		
	MisBeginAction(AddTrigger, 11565, TE_GETITEM, 3032, 1 )		
	MisBeginAction(AddTrigger, 11566, TE_GETITEM, 3033, 1 )		
	MisBeginAction(AddTrigger, 11567, TE_GETITEM, 3034, 1 )	
	MisCancelAction(ClearMission, 1156)						                                     
	
	MisNeed(MIS_NEED_ITEM, 3028, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 3029, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 3030, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 3031, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 3032, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 3033, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 3034, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>Next Palace is Gemini Palace, more exciting challenges and prizes awaits you.")

	MisResultCondition(HasMission, 1156)
	MisResultCondition(NoRecord,1156)
	MisResultCondition(HasItem, 3028, 1 )
	MisResultCondition(HasItem, 3029, 1 )
	MisResultCondition(HasItem, 3030, 1 )
	MisResultCondition(HasItem, 3031, 1 )
	MisResultCondition(HasItem, 3032, 1 )
	MisResultCondition(HasItem, 3033, 1 )
	MisResultCondition(HasItem, 3034, 1 )

	MisResultAction(TakeItem, 3028, 1 )
	MisResultAction(TakeItem, 3029, 1 )
	MisResultAction(TakeItem, 3030, 1 )
	MisResultAction(TakeItem, 3031, 1 )
	MisResultAction(TakeItem, 3032, 1 )
	MisResultAction(TakeItem, 3033, 1 )
	MisResultAction(TakeItem, 3034, 1 )

	MisResultAction(ClearMission, 1156)
	MisResultAction(SetRecord,  1156 )
	MisResultAction(GiveItem, 3026, 1, 4)
	MisResultAction(GiveItem, 3027, 1, 4)
	MisResultAction(GiveItem, 0227, 10, 4)
	MisResultAction(AddMoney,100000,100000)
	MisResultAction(JINNiuSS)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3028)	
	TriggerAction( 1, AddNextFlag, 1156, 10, 1 )
	RegCurTrigger( 11561 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3029)	
	TriggerAction( 1, AddNextFlag, 1156, 20, 1 )
	RegCurTrigger( 11562 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3030)	
	TriggerAction( 1, AddNextFlag, 1156, 30, 1 )
	RegCurTrigger( 11563 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3031)	
	TriggerAction( 1, AddNextFlag, 1156, 40, 1 )
	RegCurTrigger( 11564 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3032)	
	TriggerAction( 1, AddNextFlag, 1156, 50, 1 )
	RegCurTrigger( 11565 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3033)	
	TriggerAction( 1, AddNextFlag, 1156, 60, 1 )
	RegCurTrigger( 11566 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3034)	
	TriggerAction( 1, AddNextFlag, 1156, 70, 1 )
	RegCurTrigger( 11567 )
----------------------------------------------金牛之海盗过关奖励----------芭芭拉	
	DefineMission (5671, "Prize of completing Pirate of Taurus", 1157)
	
	MisBeginTalk("<t>Collect all 7 Taurus Emblem to exchange with me for Taurus Protector Seal and Gemini Gate Ticket. There are also more prizes available.")

	MisBeginCondition(NoMission,1157)
	MisBeginCondition(HasRecord,1112)
	MisBeginCondition(HasRecord,1120)
	MisBeginCondition(HasRecord,1121)
	MisBeginCondition(HasRecord,1122)
	MisBeginCondition(HasRecord,1123)
	MisBeginCondition(HasRecord,1124)
	MisBeginCondition(HasRecord,1150)
	MisBeginCondition(HasRecord,1119)
	MisBeginCondition(NoRecord,1157)
	MisBeginAction(AddMission,1157)
	MisBeginAction(AddTrigger, 11571, TE_GETITEM, 3028, 1 )		
	MisBeginAction(AddTrigger, 11572, TE_GETITEM, 3029, 1 )		
	MisBeginAction(AddTrigger, 11573, TE_GETITEM, 3030, 1 )		
 	MisBeginAction(AddTrigger, 11574, TE_GETITEM, 3031, 1 )		
	MisBeginAction(AddTrigger, 11575, TE_GETITEM, 3032, 1 )		
	MisBeginAction(AddTrigger, 11576, TE_GETITEM, 3033, 1 )		
	MisBeginAction(AddTrigger, 11577, TE_GETITEM, 3034, 1 )		
	MisCancelAction(ClearMission, 1157)						                                     
	
	MisNeed(MIS_NEED_ITEM, 3028, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 3029, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 3030, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 3031, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 3032, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 3033, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 3034, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>Next Palace is Gemini Palace, more exciting challenges and prizes awaits you.")

	MisResultCondition(HasMission, 1157)
	MisResultCondition(NoRecord,1157)
	MisResultCondition(HasItem, 3028, 1 )
	MisResultCondition(HasItem, 3029, 1 )
	MisResultCondition(HasItem, 3030, 1 )
	MisResultCondition(HasItem, 3031, 1 )
	MisResultCondition(HasItem, 3032, 1 )
	MisResultCondition(HasItem, 3033, 1 )
	MisResultCondition(HasItem, 3034, 1 )

	MisResultAction(TakeItem, 3028, 1 )
	MisResultAction(TakeItem, 3029, 1 )
	MisResultAction(TakeItem, 3030, 1 )
	MisResultAction(TakeItem, 3031, 1 )
	MisResultAction(TakeItem, 3032, 1 )
	MisResultAction(TakeItem, 3033, 1 )
	MisResultAction(TakeItem, 3034, 1 )

	MisResultAction(ClearMission, 1157)
	MisResultAction(SetRecord,  1157 )
	MisResultAction(GiveItem, 3026, 1, 4)
	MisResultAction(GiveItem, 3027, 1, 4)
	MisResultAction(GiveItem, 0227, 20, 4)
	MisResultAction(AddMoney,200000,200000)
	MisResultAction(JINNiuHD)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3028)	
	TriggerAction( 1, AddNextFlag, 1157, 10, 1 )
	RegCurTrigger( 11571 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3029)	
	TriggerAction( 1, AddNextFlag, 1157, 20, 1 )
	RegCurTrigger( 11572 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3030)	
	TriggerAction( 1, AddNextFlag, 1157, 30, 1 )
	RegCurTrigger( 11573 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3031)	
	TriggerAction( 1, AddNextFlag, 1157, 40, 1 )
	RegCurTrigger( 11574 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3032)	
	TriggerAction( 1, AddNextFlag, 1157, 50, 1 )
	RegCurTrigger( 11575 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3033)	
	TriggerAction( 1, AddNextFlag, 1157, 60, 1 )
	RegCurTrigger( 11576 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3034)	
	TriggerAction( 1, AddNextFlag, 1157, 70, 1 )
	RegCurTrigger( 11577 )

	---------------------------------------------金牛之船长过关奖励----------芭芭拉	
	DefineMission (5672, "Prize for completing Captain of Taurus", 1158)
	
	MisBeginTalk("<t>Collect all 7 Taurus Emblem to exchange with me for Taurus Protector Seal and Gemini Gate Ticket. There are also more prizes available.")

	MisBeginCondition(NoMission,1158)
	MisBeginCondition(HasRecord,1113)
	MisBeginCondition(HasRecord,1125)
	MisBeginCondition(HasRecord,1126)
	MisBeginCondition(HasRecord,1127)
	MisBeginCondition(HasRecord,1128)
	MisBeginCondition(HasRecord,1129)
	MisBeginCondition(HasRecord,1150)
	MisBeginCondition(HasRecord,1119)
	MisBeginCondition(NoRecord,1158)
	MisBeginAction(AddMission,1158)   
	MisBeginAction(AddTrigger, 11581, TE_GETITEM, 3028, 1 )		
	MisBeginAction(AddTrigger, 11582, TE_GETITEM, 3029, 1 )		
	MisBeginAction(AddTrigger, 11583, TE_GETITEM, 3030, 1 )		
 	MisBeginAction(AddTrigger, 11584, TE_GETITEM, 3031, 1 )		
	MisBeginAction(AddTrigger, 11585, TE_GETITEM, 3032, 1 )		
	MisBeginAction(AddTrigger, 11586, TE_GETITEM, 3033, 1 )		
	MisBeginAction(AddTrigger, 11587, TE_GETITEM, 3034, 1 )	
	MisCancelAction(ClearMission, 1158)						                                     
	
	MisNeed(MIS_NEED_ITEM, 3028, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 3029, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 3030, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 3031, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 3032, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 3033, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 3034, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>Next Palace is Gemini Palace, more exciting challenges and prizes awaits you.")

	MisResultCondition(HasMission, 1158)
	MisResultCondition(NoRecord,1158)
	MisResultCondition(HasItem, 3028, 1 )
	MisResultCondition(HasItem, 3029, 1 )
	MisResultCondition(HasItem, 3030, 1 )
	MisResultCondition(HasItem, 3031, 1 )
	MisResultCondition(HasItem, 3032, 1 )
	MisResultCondition(HasItem, 3033, 1 )
	MisResultCondition(HasItem, 3034, 1 )

	MisResultAction(TakeItem, 3028, 1 )
	MisResultAction(TakeItem, 3029, 1 )
	MisResultAction(TakeItem, 3030, 1 )
	MisResultAction(TakeItem, 3031, 1 )
	MisResultAction(TakeItem, 3032, 1 )
	MisResultAction(TakeItem, 3033, 1 )
	MisResultAction(TakeItem, 3034, 1 )

	MisResultAction(ClearMission, 1158)
	MisResultAction(SetRecord,  1158 )
	MisResultAction(GiveItem, 3026, 1, 4)
	MisResultAction(GiveItem, 3027, 1, 4)
	MisResultAction(GiveItem, 0227, 30, 4)
	MisResultAction(AddMoney,300000,300000)
	MisResultAction(JINNiuCZ)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3028)	
	TriggerAction( 1, AddNextFlag, 1158, 10, 1 )
	RegCurTrigger( 11581 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3029)	
	TriggerAction( 1, AddNextFlag, 1158, 20, 1 )
	RegCurTrigger( 11582 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3030)	
	TriggerAction( 1, AddNextFlag, 1158, 30, 1 )
	RegCurTrigger( 11583 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3031)	
	TriggerAction( 1, AddNextFlag, 1158, 40, 1 )
	RegCurTrigger( 11584 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3032)	
	TriggerAction( 1, AddNextFlag, 1158, 50, 1 )
	RegCurTrigger( 11585 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3033)	
	TriggerAction( 1, AddNextFlag, 1158, 60, 1 )
	RegCurTrigger( 11586 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3034)	
	TriggerAction( 1, AddNextFlag, 1158, 70, 1 )
	RegCurTrigger( 11587 )

--	-----------------------------------------------------猪光宝气-----------马来西亚
--
--       DefineMission(6126,"猪光宝气",1452)
--
--	MisBeginTalk("<t>最近我再研究一道新菜色需要些特别的材料,我猜你一定愿意帮忙,因为回报够好哦.")
--	MisBeginCondition(NoMission, 1452)
--	MisBeginCondition(NoRecord,1452)
--	MisBeginAction(AddMission,1452)
--	MisBeginAction(AddTrigger, 14521, TE_GETITEM, 4325, 5)
--	MisBeginAction(AddTrigger, 14522, TE_GETITEM, 1680, 5)
--	MisBeginAction(AddTrigger, 14523, TE_GETITEM, 4433, 5)
--	MisBeginAction(AddTrigger, 14524, TE_GETITEM, 4357, 5)
--	MisBeginAction(AddTrigger, 14525, TE_GETITEM, 4461, 40)
--	MisBeginAction(AddTrigger, 14526, TE_GETITEM, 4462, 40)
--
--
--	MisCancelAction(ClearMission, 1452)
--
--	MisNeed(MIS_NEED_DESP, "收集到雪白猪尾 5个(深蓝1179,371),粉红猪尾 5个(加纳1950,2563),豪猪短尾 5个(加纳1384,3065),粗糙的猪尾 5个(加纳910,2971),变异猪蹄 40 深蓝1455,560)及 强壮猪蹄 40(深蓝2266,590).")
--	MisNeed(MIS_NEED_ITEM, 4325, 5, 10, 5)
--	MisNeed(MIS_NEED_ITEM, 1680, 5, 15, 5)
--	MisNeed(MIS_NEED_ITEM, 4433, 5, 20, 5)
--	MisNeed(MIS_NEED_ITEM, 4357, 5, 25, 5)
--	MisNeed(MIS_NEED_ITEM, 4461, 40, 30, 40)
--	MisNeed(MIS_NEED_ITEM, 4462, 40, 70, 40)
--
--	
--	
--	MisHelpTalk("<t>及早回来复命,我会给您最好的犒赏")
--	MisResultTalk("<t>这个神秘的幸运猪宝箱就是我要送给你的奖赏了,我有很多事需要帮忙,你可以经常过来找我.")
--
--	MisResultCondition(HasMission, 1452)
--	MisResultCondition(NoRecord,1452)
--	MisResultCondition(HasItem, 4325, 5)
--	MisResultCondition(HasItem, 1680, 5)
--	MisResultCondition(HasItem, 4433, 5)
--	MisResultCondition(HasItem, 4357, 5)
--	MisResultCondition(HasItem, 4461, 40)
--	MisResultCondition(HasItem, 4462, 40)
--
--	
--	
--	MisResultAction(TakeItem, 4325, 5 )
--	MisResultAction(TakeItem, 1680, 5 )
--	MisResultAction(TakeItem, 4433, 5 )
--	MisResultAction(TakeItem, 4357, 5 )
--	MisResultAction(TakeItem, 4461, 40 )
--	MisResultAction(TakeItem, 4462, 40 )
--
--	
--	
--	MisResultAction(GiveItem, 2909,1,4)------------给幸运猪宝箱
--	MisResultAction(ClearMission, 1452)
--	MisResultAction(SetRecord, 1452)
--	MisResultAction(ClearRecord, 1452)---------------可以反复接
--	MisResultBagNeed(1)
--	
--
--
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 4325)	
--	TriggerAction( 1, AddNextFlag, 1452, 10, 5 )
--	RegCurTrigger( 14521 )
--
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 1680)	
--	TriggerAction( 1, AddNextFlag, 1452, 15, 5 )
--	RegCurTrigger( 14522 )
--	
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 4433)	
--	TriggerAction( 1, AddNextFlag, 1452, 20, 5 )
--	RegCurTrigger( 14523 )
--	
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 4357)	
--	TriggerAction( 1, AddNextFlag, 1452, 25, 5 )
--	RegCurTrigger( 14524 )
--	
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 4461)	
--	TriggerAction( 1, AddNextFlag, 1452, 30, 40 )
--	RegCurTrigger( 14525 )
--	
--	InitTrigger()
--	TriggerCondition( 1, IsItem, 4462)	
--	TriggerAction( 1, AddNextFlag, 1452, 70, 40 )
--	RegCurTrigger( 14526 )

-------------------------------------------------乱斗英雄----------海盗·德克	--------水手
	DefineMission (5673, "梦幻双子之乱斗英雄", 1163)
	
	MisBeginTalk("<t>双子座的人,手艺十分灵巧,在各方面也都能表现出自己的才能.这是属于你的梦幻星座吗? ")

	MisBeginCondition(NoMission,1163)
	MisBeginCondition(HasRecord,1159)
	MisBeginCondition(NoRecord,1163)
	MisBeginAction(AddMission,1163)
	MisCancelAction(ClearMission, 1163)
	
	MisNeed(MIS_NEED_DESP, "获得5点乱斗点数")
	MisHelpTalk("<t>乱斗点数可以从乱斗白银获得!")
	MisResultTalk("<t>看得出你注定是一个为战斗而生的人.")

	MisResultCondition(HasMission, 1163)
	MisResultCondition(NoRecord,1163)
	MisResultCondition(HasFightingPoint,5 )
	MisResultAction(TakeFightingPoint, 5 )
	MisResultAction(ClearMission, 1163)
	MisResultAction(SetRecord,  1163 )
	MisResultAction(GiveItem, 1874, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------海盗·德克	--------水手
	DefineMission (5674, "梦幻双子之名声英雄", 1164)
	
	MisBeginTalk("<t>朋友你好,我想让你知道我是一个对自己有要求的人．所以梦幻双子宫对你的要求也更高一些.")

	MisBeginCondition(NoMission,1164)
	MisBeginCondition(HasRecord,1159)
	MisBeginCondition(NoRecord,1164)
	MisBeginAction(AddMission,1164)
	MisCancelAction(ClearMission, 1164)
	
	MisNeed(MIS_NEED_DESP, "获得2000点名声点数")
	MisHelpTalk("<t>看什么看,还不走?你以为2000点名声很好混吗?")
	MisResultTalk("<t>这枚名声勋章是用来见证英雄的.")

	MisResultCondition(HasMission, 1164)
	MisResultCondition(NoRecord,1164)
	MisResultCondition(HasCredit,2000 )
	MisResultAction(TakeCredit, 2000 )
	MisResultAction(ClearMission, 1164)
	MisResultAction(SetRecord,  1164 )
	MisResultAction(GiveItem, 1875, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------海盗·德克	---------水手
	DefineMission (5741, "梦幻双子之等级英雄", 1165)
	
	MisBeginTalk("<t>勇敢的朋友,让我看到你非凡的能力吧,向我证明你只比我差一点,哈哈... ")

	MisBeginCondition(NoMission,1165)
	MisBeginCondition(HasRecord,1159)
	MisBeginCondition(NoRecord,1165)
	MisBeginAction(AddMission,1165)
	MisCancelAction(ClearMission, 1165)
	
	MisNeed(MIS_NEED_DESP, "Level reached 60")
	MisHelpTalk("<t>当然,60级对我来说不成问题.")
	MisResultTalk("<t>不得不承认,你的确只比我略差一筹而已,这枚等级勋章是你的了.")

	MisResultCondition(HasMission, 1165)
	MisResultCondition(NoRecord,1165)
	MisResultCondition(LvCheck, ">", 59 )
	MisResultAction(ClearMission, 1165)
	MisResultAction(SetRecord,  1165 )
	MisResultAction(GiveItem, 1876, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------海盗·德克	----------水手
	DefineMission (5742, "梦幻双子之荣誉英雄", 1166)
	
	MisBeginTalk("<t>传说中海盗世界最伟大的荣誉之子就是我..我的祖先,我因此受到广大海盗同行的尊敬,你要以我为榜样啊.")

	MisBeginCondition(NoMission,1166)
	MisBeginCondition(HasRecord,1159)
	MisBeginCondition(NoRecord,1166)
	MisBeginAction(AddMission,1166)
	MisCancelAction(ClearMission, 1166)
	
	MisNeed(MIS_NEED_DESP, "Gained 500 honor points")
	MisHelpTalk("<t>去为荣誉而战吧!")
	MisResultTalk("<t>你是个很不错的荣誉之子.")

	MisResultCondition(HasMission, 1166)
	MisResultCondition(NoRecord,1166)
	MisResultCondition(HasHonorPoint,500 )
	MisResultAction(TakeHonorPoint, 500 )
	MisResultAction(ClearMission, 1166)
	MisResultAction(SetRecord,  1166 )
	MisResultAction(GiveItem, 1877, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------海盗·德克	------------水手
	DefineMission (5677, "梦幻双子之采集大使", 1167)
	
	MisBeginTalk("<t>采集勋章是赠与那些洞察力很强的人的礼物,有信心的话就去试试吧. ")

	MisBeginCondition(NoMission,1167)
	MisBeginCondition(HasRecord,1159)
	MisBeginCondition(NoRecord,1167)
	MisBeginAction(AddMission,1167)
	MisBeginAction(AddTrigger, 11671, TE_GETITEM, 1346, 10 )---------------血腥的蝌蚪血10
	MisBeginAction(AddTrigger, 11672, TE_GETITEM, 4526, 10 )--------------- 生锈的长矛10
	MisBeginAction(AddTrigger, 11673, TE_GETITEM, 1608, 10 )-------------动物皮毛10--------
	MisBeginAction(AddTrigger, 11674, TE_GETITEM, 4495, 1 )--------------山贼腰带1个
	MisBeginAction(AddTrigger, 11675, TE_GETITEM, 1612, 20 )--------------锋利的角20个
	MisBeginAction(AddTrigger, 11676, TE_GETITEM, 1140, 20 )-------------船只喷射器LV1 20个
	MisBeginAction(AddTrigger, 11677, TE_GETITEM, 3094, 5 )--------------努力增幅器5个
	MisCancelAction(ClearMission, 1167)
	

	MisNeed(MIS_NEED_ITEM, 1346, 10, 1, 10 )
	MisNeed(MIS_NEED_ITEM, 4526, 10, 11, 10 )
	MisNeed(MIS_NEED_ITEM, 1608, 10, 21, 10 )
	MisNeed(MIS_NEED_ITEM, 4495, 1, 31, 1 )
	MisNeed(MIS_NEED_ITEM, 1612, 20, 32, 20 )
	MisNeed(MIS_NEED_ITEM, 1140, 20, 52, 20 )
	MisNeed(MIS_NEED_ITEM, 3094, 5, 72, 5 )
	

	MisHelpTalk("<t>不要以为很容易,快去吧")
	MisResultTalk("<t>这些东西让你很伤脑筋吧,记住,这世界上所有的东西都有自己的价值,不要总是急需的时候才想起来去留意.")

	MisResultCondition(HasMission, 1167)
	MisResultCondition(NoRecord,1167)
	MisResultCondition(HasItem, 1346, 10 )
	MisResultCondition(HasItem, 4526, 10 )
	MisResultCondition(HasItem, 1608, 10 )
	MisResultCondition(HasItem, 4495, 1 )
	MisResultCondition(HasItem, 1612, 20 )
	MisResultCondition(HasItem, 1140, 20 )
	MisResultCondition(HasItem, 3094, 5 )


	MisResultAction(TakeItem, 1346, 10 )
	MisResultAction(TakeItem, 4526, 10 )
	MisResultAction(TakeItem, 1608, 10 )
	MisResultAction(TakeItem, 4495, 1)
	MisResultAction(TakeItem, 1612, 20 )
	MisResultAction(TakeItem, 1140, 20 )
	MisResultAction(TakeItem, 3094, 5 )
	
	MisResultAction(ClearMission, 1167)
	MisResultAction(SetRecord,  1167 )
	MisResultAction(GiveItem, 1878, 1, 4)
	MisResultAction(GiveItem, 1882, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1346)	
	TriggerAction( 1, AddNextFlag, 1167, 1, 10 )
	RegCurTrigger( 11671 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4526)	
	TriggerAction( 1, AddNextFlag, 1167, 11, 10 )
	RegCurTrigger( 11672 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1608)	
	TriggerAction( 1, AddNextFlag, 1167, 21, 10 )
	RegCurTrigger( 11673 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4495)	
	TriggerAction( 1, AddNextFlag, 1167, 31, 1 )
	RegCurTrigger( 11674 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1612)	
	TriggerAction( 1, AddNextFlag, 1167, 36, 20 )
	RegCurTrigger( 11675 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1140)	
	TriggerAction( 1, AddNextFlag, 1167, 37, 20 )
	RegCurTrigger( 11676 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3094)	
	TriggerAction( 1, AddNextFlag, 1167, 87, 5 )
	RegCurTrigger( 11677 )


	----------------------------------------------------------双子末日----------海盗·德克
	DefineMission( 5678, "梦幻双子之双子末日", 1168 )
	MisBeginTalk("<t>BOSS勋章是最具英雄主义意味的奖章,你要的话就去杀掉可怕的双子守护者.")
				
	MisBeginCondition(NoMission, 1168)
	MisBeginCondition(HasRecord,1162)
	MisBeginCondition(NoRecord,1168)
	MisBeginAction(AddMission,1168)
	MisBeginAction(AddTrigger, 11681, TE_KILL, 1039, 1)---双子守护者
	
	MisCancelAction(ClearMission, 1168)

	MisNeed(MIS_NEED_DESP, "捕杀双子守护者魔女之海(2527, 2467)!")
	MisNeed(MIS_NEED_KILL, 1039,1, 10, 1)
	

	MisResultTalk("<t>双头四臂的怪物是上神不小心的杰作.你永远都无法真正的杀死它们!")
	MisHelpTalk("<t>听说是只双头怪,不同以往,你要小心.")
	MisResultCondition(HasMission,  1168)
	MisResultCondition(HasFlag, 1168, 10)
	MisResultCondition(NoRecord , 1168)
	MisResultAction(GiveItem, 1880, 1, 4 )
	MisResultAction(ClearMission,  1168)
	MisResultAction(SetRecord,  1168 )
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 1039)	
	TriggerAction( 1, AddNextFlag, 1168, 10, 1 )
	RegCurTrigger( 11681 )

-------------------------------------------------乱斗英雄----------海盗·德克	
	DefineMission (5679, "梦幻双子之乱斗英雄", 1169)
	
	MisBeginTalk("<t>双子座的人,手艺十分灵巧,在各方面也都能表现出自己的才能.这是属于你的梦幻星座吗? ")

	MisBeginCondition(NoMission,1169)
	MisBeginCondition(HasRecord,1204)
	MisBeginCondition(NoRecord,1169)
	MisBeginAction(AddMission,1169)
	MisCancelAction(ClearMission, 1169)
	
	MisNeed(MIS_NEED_DESP, "获得10点乱斗点数")
	MisHelpTalk("<t>乱斗点数可以从乱斗白银获得!")
	MisResultTalk("<t>看得出你注定是一个为战斗而生的人.")

	MisResultCondition(HasMission, 1169)
	MisResultCondition(NoRecord,1169)
	MisResultCondition(HasFightingPoint,10 )
	MisResultAction(TakeFightingPoint, 10 )
	MisResultAction(ClearMission, 1169)
	MisResultAction(SetRecord,  1169 )
	MisResultAction(GiveItem, 1874, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------海盗·德克	
	DefineMission (5680, "梦幻双子之名声英雄", 1170)
	
	MisBeginTalk("<t>朋友你好,我想让你知道我是一个对自己有要求的人．所以梦幻双子宫对你的要求也更高一些.")

	MisBeginCondition(NoMission,1170)
	MisBeginCondition(HasRecord,1204)
	MisBeginCondition(NoRecord,1170)
	MisBeginAction(AddMission,1170)
	MisCancelAction(ClearMission, 1170)
	
	MisNeed(MIS_NEED_DESP, "Obtained 5000 points of reputation")
	MisHelpTalk("<t>看什么看,还不走?你以为5000点名声很好混吗?")
	MisResultTalk("<t>这枚名声勋章是用来见证英雄的.")

	MisResultCondition(HasMission, 1170)
	MisResultCondition(NoRecord,1170)
	MisResultCondition(HasCredit,5000 )
	MisResultAction(TakeCredit,5000  )
	MisResultAction(ClearMission, 1170)
	MisResultAction(SetRecord,  1170 )
	MisResultAction(GiveItem, 1875, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------海盗·德克	
	DefineMission (5681, "梦幻双子之等级英雄", 1171)
	
	MisBeginTalk("<t>勇敢的朋友,让我看到你非凡的能力吧,向我证明你只比我差一点,哈哈... ")

	MisBeginCondition(NoMission,1171)
	MisBeginCondition(HasRecord,1204)
	MisBeginCondition(NoRecord,1171)
	MisBeginAction(AddMission,1171)
	MisCancelAction(ClearMission, 1171)
	
	MisNeed(MIS_NEED_DESP, "Reached Level 65")
	MisHelpTalk("<t>当然,65级对我来说不成问题.")
	MisResultTalk("<t>不得不承认,你的确只比我略差一筹而已,这枚等级勋章是你的了.")

	MisResultCondition(HasMission, 1171)
	MisResultCondition(NoRecord,1171)
	MisResultCondition(LvCheck, ">", 64 )
	MisResultAction(ClearMission, 1171)
	MisResultAction(SetRecord,  1171 )
	MisResultAction(GiveItem, 1876, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------海盗·德克	
	DefineMission (5682, "梦幻双子之荣誉英雄", 1172)
	
	MisBeginTalk("<t>传说中海盗世界最伟大的荣誉之子就是我..我的祖先,我因此受到广大海盗同行的尊敬,你要以我为榜样啊.")

	MisBeginCondition(NoMission,1172)
	MisBeginCondition(HasRecord,1204)
	MisBeginCondition(NoRecord,1172)
	MisBeginAction(AddMission,1172)
	MisCancelAction(ClearMission, 1172)
	
	MisNeed(MIS_NEED_DESP, "获得700点荣誉点数")
	MisHelpTalk("<t>去为荣誉而战吧!")
	MisResultTalk("<t>你是个很不错的荣誉之子.")

	MisResultCondition(HasMission, 1172)
	MisResultCondition(NoRecord,1172)
	MisResultCondition(HasHonorPoint,700 )
	MisResultAction(TakeHonorPoint, 700 )
	MisResultAction(ClearMission, 1172)
	MisResultAction(SetRecord,  1172 )
	MisResultAction(GiveItem, 1877, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------海盗·德克	
	DefineMission (5683, "梦幻双子之采集大使", 1173)
	
	MisBeginTalk("<t>采集勋章是赠与那些洞察力很强的人的礼物,有信心的话就去试试吧. ")

	MisBeginCondition(NoMission,1173)
	MisBeginCondition(HasRecord,1204)
	MisBeginCondition(NoRecord,1173)
	MisBeginAction(AddMission,1173)
	MisBeginAction(AddTrigger, 11731, TE_GETITEM, 1346, 15 )-------------------血腥的蝌蚪血15
	MisBeginAction(AddTrigger, 11732, TE_GETITEM, 4526, 15 )-------------------生锈的长矛15          
	MisBeginAction(AddTrigger, 11733, TE_GETITEM, 1608, 15 )-----------------动物皮毛15               
	MisBeginAction(AddTrigger, 11734, TE_GETITEM, 4495, 2 )----------------山贼腰带2个               
	MisBeginAction(AddTrigger, 11735, TE_GETITEM, 1612, 30)------------------锋利的角30个            
	MisBeginAction(AddTrigger, 11736, TE_GETITEM, 2724, 20 )-----------------船只喷射器LV2 20个                  
	MisBeginAction(AddTrigger, 11737, TE_GETITEM, 3094, 10 )------------------努力增幅器10个          
	MisCancelAction(ClearMission, 1173)
	

	MisNeed(MIS_NEED_ITEM, 1346, 15, 1, 15 )
	MisNeed(MIS_NEED_ITEM, 4526, 15, 16, 15 )
	MisNeed(MIS_NEED_ITEM, 1608, 15, 31, 15 )
	MisNeed(MIS_NEED_ITEM, 4495,  2, 46, 2 )
	MisNeed(MIS_NEED_ITEM, 1612, 30, 48, 30 )
	MisNeed(MIS_NEED_ITEM, 2724, 20, 78, 20 )
	MisNeed(MIS_NEED_ITEM, 3094, 10, 98, 10 )
	

	MisHelpTalk("<t>不要以为很容易,快去吧")
	MisResultTalk("<t>这些东西让你很伤脑筋吧,记住,这世界上所有的东西都有自己的价值,不要总是急需的时候才想起来去留意..")

	MisResultCondition(HasMission, 1173)
	MisResultCondition(NoRecord,1173)
	MisResultCondition(HasItem, 1346, 15 )
	MisResultCondition(HasItem, 4526, 15 )
	MisResultCondition(HasItem, 1608, 15 )
	MisResultCondition(HasItem, 4495, 2 )
	MisResultCondition(HasItem, 1612, 30 )
	MisResultCondition(HasItem, 2724, 20 )
	MisResultCondition(HasItem, 3094, 10 )


	MisResultAction(TakeItem, 1346, 15 )
	MisResultAction(TakeItem, 4526, 15 )
	MisResultAction(TakeItem, 1608, 15 )
	MisResultAction(TakeItem, 4495, 2 )
	MisResultAction(TakeItem, 1612, 30 )
	MisResultAction(TakeItem, 2724, 20 )
	MisResultAction(TakeItem, 3094, 10 )

	MisResultAction(ClearMission, 1173)
	MisResultAction(SetRecord,  1173 )
	MisResultAction(GiveItem, 1878, 1, 4)
	MisResultAction(GiveItem, 1882, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1346)	
	TriggerAction( 1, AddNextFlag, 1173, 1, 15 )
	RegCurTrigger( 11731 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4526)	
	TriggerAction( 1, AddNextFlag, 1173, 16, 15 )
	RegCurTrigger( 11732 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1608)	
	TriggerAction( 1, AddNextFlag, 1173, 31, 15 )
	RegCurTrigger( 11733 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4495)	
	TriggerAction( 1, AddNextFlag, 1173, 46, 2 )
	RegCurTrigger( 11734 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1612)	
	TriggerAction( 1, AddNextFlag, 1173, 48, 30 )
	RegCurTrigger( 11735 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2724)	
	TriggerAction( 1, AddNextFlag, 1173,78, 20 )
	RegCurTrigger( 11736 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3094)	
	TriggerAction( 1, AddNextFlag, 1173, 98, 10 )
	RegCurTrigger( 11737 )


-------------------------------------------------乱斗英雄----------海盗·德克	
	DefineMission (5684, "梦幻双子之乱斗英雄", 1174)
	
	MisBeginTalk("<t>双子座的人,手艺十分灵巧,在各方面也都能表现出自己的才能.这是属于你的梦幻星座吗? ")

	MisBeginCondition(NoMission,1174)
	MisBeginCondition(HasRecord,1161)
	MisBeginCondition(NoRecord,1174)
	MisBeginAction(AddMission,1174)
	MisCancelAction(ClearMission, 1174)
	
	MisNeed(MIS_NEED_DESP, "获得15点乱斗点数")
	MisHelpTalk("<t>乱斗点数可以从乱斗白银获得!")
	MisResultTalk("<t>看得出你注定是一个为战斗而生的人.")

	MisResultCondition(HasMission, 1174)
	MisResultCondition(NoRecord,1174)
	MisResultCondition(HasFightingPoint,15 )
	MisResultAction(TakeFightingPoint, 15 )
	MisResultAction(ClearMission, 1174)
	MisResultAction(SetRecord,  1174 )
	MisResultAction(GiveItem, 1874, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------海盗·德克	
	DefineMission (5685, "梦幻双子之名声英雄", 1175)
	
	MisBeginTalk("<t>朋友你好,我想让你知道我是一个对自己有要求的人．所以梦幻双子宫对你的要求也更高一些.")

	MisBeginCondition(NoMission,1175)
	MisBeginCondition(HasRecord,1161)
	MisBeginCondition(NoRecord,1175)
	MisBeginAction(AddMission,1175)
	MisCancelAction(ClearMission, 1175)
	
	MisNeed(MIS_NEED_DESP, "获得8000点名声点数")
	MisHelpTalk("<t>看什么看,还不走?你以为8000点名声很好混吗?")
	MisResultTalk("<t>这枚名声勋章是用来见证英雄的.")

	MisResultCondition(HasMission, 1175)
	MisResultCondition(NoRecord,1175)
	MisResultCondition(HasCredit,8000 )
	MisResultAction(TakeCredit, 8000 )
	MisResultAction(ClearMission, 1175)
	MisResultAction(SetRecord,  1175 )
	MisResultAction(GiveItem, 1875, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------海盗·德克	
	DefineMission (5686, "梦幻双子之等级英雄", 1176)
	
	MisBeginTalk("<t>勇敢的朋友,让我看到你非凡的能力吧,向我证明你只比我差一点,哈哈....")

	MisBeginCondition(NoMission,1176)
	MisBeginCondition(HasRecord,1161)
	MisBeginCondition(NoRecord,1176)
	MisBeginAction(AddMission,1176)
	MisCancelAction(ClearMission, 1176)
	
	MisNeed(MIS_NEED_DESP, "等级达到70级")
	MisHelpTalk("<t>当然,70级对我来说不成问题.")
	MisResultTalk("<t>不得不承认,你的确只比我略差一筹而已,这枚等级勋章是你的了.")

	MisResultCondition(HasMission, 1176)
	MisResultCondition(NoRecord,1176)
	MisResultCondition(LvCheck, ">", 69 )
	MisResultAction(ClearMission, 1176)
	MisResultAction(SetRecord,  1176 )
	MisResultAction(GiveItem, 1876, 1, 4)
	MisResultBagNeed(1)
	

	-------------------------------------------------荣誉英雄----------海盗·德克	
	DefineMission (5687, "梦幻双子之荣誉英雄", 1177)
	
	MisBeginTalk("<t>传说中海盗世界最伟大的荣誉之子就是我..我的祖先,我因此受到广大海盗同行的尊敬,你要以我为榜样啊.")

	MisBeginCondition(NoMission,1177)
	MisBeginCondition(HasRecord,1161)
	MisBeginCondition(NoRecord,1177)
	MisBeginAction(AddMission,1177)
	MisCancelAction(ClearMission, 1177)
	
	MisNeed(MIS_NEED_DESP, "获得1000点荣誉点数")
	MisHelpTalk("<t>去为荣誉而战吧!")
	MisResultTalk("<t>你是个很不错的荣誉之子.")

	MisResultCondition(HasMission, 1177)
	MisResultCondition(NoRecord,1177)
	MisResultCondition(HasHonorPoint,1000 )
	MisResultAction(TakeHonorPoint, 1000 )
	MisResultAction(ClearMission, 1177)
	MisResultAction(SetRecord,  1177 )
	MisResultAction(GiveItem, 1877, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------采集大使----------海盗·德克	
	DefineMission (5688, "梦幻双子之采集大使", 1178)
	
	MisBeginTalk("<t>采集勋章是赠与那些洞察力很强的人的礼物,有信心的话就去试试吧. ")

	MisBeginCondition(NoMission,1178)
	MisBeginCondition(HasRecord,1161)
	MisBeginCondition(NoRecord,1178)
	MisBeginAction(AddMission,1178)
	MisBeginAction(AddTrigger, 11781, TE_GETITEM, 1346, 20 )---------------------血腥的蝌蚪血20 
	MisBeginAction(AddTrigger, 11782, TE_GETITEM, 3433, 1 )---------------------费诺符石1个          
	MisBeginAction(AddTrigger, 11783, TE_GETITEM, 4495, 3 )-------------------山贼腰带3个               
	MisBeginAction(AddTrigger, 11784, TE_GETITEM, 1612, 30 )------------------锋利的角30个             
	MisBeginAction(AddTrigger, 11785, TE_GETITEM, 2724, 30 )--------------------船只喷射器LV2 30个             
	MisBeginAction(AddTrigger, 11786, TE_GETITEM, 3094, 30 )-------------------努力增幅器30个                              
	MisCancelAction(ClearMission, 1178)						                                     
	

	MisNeed(MIS_NEED_ITEM, 1346, 20, 1, 20 )
	MisNeed(MIS_NEED_ITEM, 3433, 1, 21, 1 )
	MisNeed(MIS_NEED_ITEM, 4495, 3, 22, 3 )
	MisNeed(MIS_NEED_ITEM, 1612, 30, 25, 30 )
	MisNeed(MIS_NEED_ITEM, 2724, 30, 55, 30)
	MisNeed(MIS_NEED_ITEM, 3094, 30, 85, 30 )


	MisHelpTalk("<t>不要以为很容易,快去吧")
	MisResultTalk("<t>这些东西让你很伤脑筋吧,记住,这世界上所有的东西都有自己的价值,不要总是急需的时候才想起来去留意.")

	MisResultCondition(HasMission, 1178)
	MisResultCondition(NoRecord,1178)
	MisResultCondition(HasItem, 1346, 20 )
	MisResultCondition(HasItem, 3433, 1 )
	MisResultCondition(HasItem, 4495, 3 )
	MisResultCondition(HasItem, 1612, 30 )
	MisResultCondition(HasItem, 2724, 30 )
	MisResultCondition(HasItem, 3094, 30 )


	MisResultAction(TakeItem, 1346, 20 )
	MisResultAction(TakeItem, 3433, 1 )
	MisResultAction(TakeItem, 4495, 3 )
	MisResultAction(TakeItem, 1612, 30 )
	MisResultAction(TakeItem, 2724, 30 )
	MisResultAction(TakeItem, 3094, 30 )

	MisResultAction(ClearMission, 1178)
	MisResultAction(SetRecord,  1178 )
	MisResultAction(GiveItem, 1878, 1, 4)
	MisResultAction(GiveItem, 1882, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1346)	
	TriggerAction( 1, AddNextFlag, 1178, 1, 20 )
	RegCurTrigger( 11781 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3433)	
	TriggerAction( 1, AddNextFlag, 1178, 21, 1 )
	RegCurTrigger( 11782 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4495)	
	TriggerAction( 1, AddNextFlag, 1178, 22, 3 )
	RegCurTrigger( 11783 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1612)	
	TriggerAction( 1, AddNextFlag, 1178, 25, 30 )
	RegCurTrigger( 11784 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2724)	
	TriggerAction( 1, AddNextFlag, 1178, 55, 30 )
	RegCurTrigger( 11785 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3094)	
	TriggerAction( 1, AddNextFlag, 1178, 85, 30 )
	RegCurTrigger( 11786 )

	----------------------------------------------------------社交大使----------海盗·德克
	DefineMission( 5689, "梦幻双子之社交大使", 1179 )
	MisBeginTalk("<t>有人说我喜欢吹牛,难道这是我的错吗?有几个男人不是这样?其实我还是很有名望的,那些崇拜我的朋友们可以作证.正好我要在圣诞节举办派对,如果你想要探索勋章就帮我去邀请他们吧.")
				
	MisBeginCondition(NoMission, 1179)
	MisBeginCondition(NoRecord,1179)
	MisBeginCondition(HasRecord, 1162)-------------------新的id,最后的id
	MisBeginAction(AddMission,1179)
	MisCancelAction(ClearMission, 1179)

	MisNeed(MIS_NEED_DESP, "找雷霆堡的护卫·尼松(711,1414)聊聊")
	
	MisHelpTalk("<t>快去吧,时间总是比想象的过得快.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使-----------------护卫·尼松

	DefineMission(5690, "TOP Ambassador", 1179, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>海盗·德克?我认识他,他吹牛的本事我是早有耳闻的.")
	MisResultCondition(NoRecord, 1179)
	MisResultCondition(HasMission,1179)
	MisResultAction(ClearMission,1179)
	MisResultAction(SetRecord, 1179)

	----------------------------------------------------------社交大使2----------护卫·尼松
	DefineMission( 5691, "TOP Ambassador 2", 1180 )
	MisBeginTalk("<t>我刚刚18岁的时候很向往海盗生活,后来认识了德克就放弃了这个梦想...他的派对我能不能参加还要看有没有假期,我可没有迈克那么悠闲")
				
	MisBeginCondition(NoMission, 1180)
	MisBeginCondition(NoRecord,1180)
	MisBeginCondition(HasRecord, 1179)
	MisBeginAction(AddMission,1180)
	MisCancelAction(ClearMission, 1180)

	MisNeed(MIS_NEED_DESP, "找沙岚的巡逻兵·迈克(958,3549)聊聊")
	
	MisHelpTalk("<t>在长官眼皮底下当差就是不那么悠闲.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使2-------------巡逻兵·迈克
	DefineMission(5692, "TOP Ambassador 2", 1180, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你好!我队长不在,你是找我吗?")
	MisResultCondition(NoRecord, 1180)
	MisResultCondition(HasMission,1180)
	MisResultAction(ClearMission,1180)
	MisResultAction(SetRecord, 1180)

	----------------------------------------------------------社交大使3----------巡逻兵·迈克
	DefineMission( 5693, "TOP Ambassador 3", 1181 )
	MisBeginTalk("<t>德克的圣诞派对?很不错,我已经度过了很多个孤独无聊的圣诞节了.不过我已经约过修司了,不如你帮我问一下修司的意见")
				
	MisBeginCondition(NoMission, 1181)
	MisBeginCondition(NoRecord,1181)
	MisBeginCondition(HasRecord, 1180)
	MisBeginAction(AddMission,1181)
	MisCancelAction(ClearMission, 1181)

	MisNeed(MIS_NEED_DESP, "找骷髅营地补给站的修司(2138,545)聊聊")
	
	MisHelpTalk("<t>说实话我对德克已经没什么印象了,呵呵..")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使3--------修司
	DefineMission(5694, "TOP Ambassador 3", 1181, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>参加德克的圣诞派对是个极好的主意,虽然我不喜欢德克,但是我喜欢派对上的姑娘.")
	MisResultCondition(NoRecord, 1181)
	MisResultCondition(HasMission,1181)
	MisResultAction(ClearMission,1181)
	MisResultAction(SetRecord, 1181)



	----------------------------------------------------------社交大使4----------修司
	DefineMission( 5695, "TOP Ambassador 4", 1182 )
	MisBeginTalk("<t>如果你会去德尔维平原请帮忙告诉可怜的马尔斯,我知道一种植物可以有效的驱除章鱼汁.")
				
	MisBeginCondition(NoMission, 1182)
	MisBeginCondition(NoRecord,1182)
	MisBeginCondition(HasRecord, 1181)
	MisBeginAction(AddMission,1182)
	MisCancelAction(ClearMission, 1182)

	MisNeed(MIS_NEED_DESP, "找德尔维平原的巡逻兵·马尔斯(2065,2732)聊聊")
	
	MisHelpTalk("<t>他对这个消息会很感兴趣的.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使4--------巡逻兵·马尔斯
	DefineMission(5696, "TOP Ambassador 4", 1182, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>是吗?有这种植物,那他为什么不让你带一些给我,看来是有交换条件的.这个家伙真是小气啊.")
	MisResultCondition(NoRecord, 1182)
	MisResultCondition(HasMission,1182)
	MisResultAction(ClearMission,1182)
	MisResultAction(SetRecord, 1182)


	----------------------------------------------------------社交大使5----------巡逻兵·马尔斯
	DefineMission( 5697, "TOP Ambassador 5", 1183 )
	MisBeginTalk("<t>你说德克?我与德克相识多年了,他是一个很不错的朋友,虽然爱吹牛,却是一个很真诚的朋友.我一定会去参加他的派对.我想你会愿意帮我通知俄克琉西斯,他的真诚意识太差,我要带他去接受一点教育.")
				
	MisBeginCondition(NoMission, 1183)
	MisBeginCondition(NoRecord,1183)
	MisBeginCondition(HasRecord, 1182)
	MisBeginAction(AddMission,1183)
	MisCancelAction(ClearMission, 1183)

	MisNeed(MIS_NEED_DESP, "找南部沙漠的俄克琉西斯(1131,3153)聊聊")
	
	MisHelpTalk("<t>俄克琉西斯是个视财如命的小孩,应该向德克学习.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使5--------俄克琉西斯
	DefineMission(5698, "TOP Ambassador 5", 1183, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我视财如命?你问他不发军饷给他他会同意吗?")
	MisResultCondition(NoRecord, 1183)
	MisResultCondition(HasMission,1183)
	MisResultAction(ClearMission,1183)
	MisResultAction(SetRecord, 1183)


	----------------------------------------------------------社交大使6----------俄克琉西斯
	DefineMission( 5699, "TOP Ambassador 6", 1184 )
	MisBeginTalk("<t>其实我这样爱钱也有我的原因,追求梦中情人是不能只靠语言的,奈奈是个可爱的女孩,我不要她受苦.不知道她有没有想我.")
				
	MisBeginCondition(NoMission, 1184)
	MisBeginCondition(NoRecord,1184)
	MisBeginCondition(HasRecord, 1183)
	MisBeginAction(AddMission,1184)
	MisCancelAction(ClearMission, 1184)

	MisNeed(MIS_NEED_DESP, "找奈奈(798,369)聊聊")
	
	MisHelpTalk("<t>奈奈是一个气质优雅的美丽姑娘.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使6--------奈奈
	DefineMission(5700, "TOP Ambassador 6", 1184, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>虽然男人应该有宽广的胸怀和雄厚的资本,但关心我才是最重要的.")
	MisResultCondition(NoRecord, 1184)
	MisResultCondition(HasMission,1184)
	MisResultAction(ClearMission,1184)
	MisResultAction(SetRecord, 1184)


	----------------------------------------------------------社交大使7----------奈奈
	DefineMission( 5701, "TOP Ambassador 7", 1185 )
	MisBeginTalk("<t>我是清纯不懂爱情的小女生,所有关于爱情的理想的和现实的观念我都是通过古博拉的书了解到的.")
				
	MisBeginCondition(NoMission, 1185)
	MisBeginCondition(NoRecord,1185)
	MisBeginCondition(HasRecord, 1184)
	MisBeginAction(AddMission,1185)
	MisCancelAction(ClearMission, 1185)

	MisNeed(MIS_NEED_DESP, "找加纳的古博拉(1507,3105)聊聊")
	
	MisHelpTalk("<t>我从没见过这位文学大师,但是我猜想他一定是一位成熟稳重的优雅男子.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使7--------古博拉
	DefineMission(5702, "TOP Ambassador 7", 1185, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我的忠实读者奈奈?我的读者太多了.不过她有这个欣赏水准让我对这个世界重燃信心了.")
	MisResultCondition(NoRecord, 1185)
	MisResultCondition(HasMission,1185)
	MisResultAction(ClearMission,1185)
	MisResultAction(SetRecord, 1185)


	----------------------------------------------------------社交大使8----------古博拉
	DefineMission( 5703, "TOP Ambassador 8", 1186 )
	MisBeginTalk("<t>其实我原本是奈奈想象的那种男子,是那次海难后飘到海岛上造成的,我和德克被莫名其妙的互换了外貌.不知道这个家伙懂不懂得保养,我那俊美的脸啊,是该去看一下了.你不信?波尔可以作证的.")
				
	MisBeginCondition(NoMission, 1186)
	MisBeginCondition(NoRecord,1186)
	MisBeginCondition(HasRecord, 1185)
	MisBeginAction(AddMission,1186)
	MisCancelAction(ClearMission, 1186)

	MisNeed(MIS_NEED_DESP, "找冰雪岛海港指挥·波尔(2372,737)聊聊")
	
	MisHelpTalk("<t>我好怀念我的脸啊!")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使8--------海港指挥·波尔
	DefineMission(5704, "TOP Ambassador 8", 1186, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>古博拉和德克换脸?不记得了,每天经过这里的人都很多.说实话他们的脸换不换都看不出什么美感,也就谈不上谁受益.呵呵")
	MisResultCondition(NoRecord, 1186)
	MisResultCondition(HasMission,1186)
	MisResultAction(ClearMission,1186)
	MisResultAction(SetRecord, 1186)


	----------------------------------------------------------社交大使9----------海港指挥·波尔
	DefineMission( 5705, "TOP Ambassador 9", 1187 )
	MisBeginTalk("<t>疤痕是男人的徽章,酒精是海盗的伙伴,有酒我是不会错过的.不知道我的外国友人东方海盗·铃佐田山会不会参加,虽然他讲话很少有人能听懂.哪像可爱的优优...")
				
	MisBeginCondition(NoMission, 1187)
	MisBeginCondition(NoRecord,1187)
	MisBeginCondition(HasRecord, 1186)
	MisBeginAction(AddMission,1187)
	MisCancelAction(ClearMission, 1187)

	MisNeed(MIS_NEED_DESP, "找阿兰比斯冰原的草莓优优(1010,350)聊聊")
	
	MisHelpTalk("<t>优优简直是冰雪中盛开的玫瑰.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使9--------草莓优优
	DefineMission(5706, "TOP Ambassador 9", 1187, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我哪有波尔爷爷说得那么可爱呢?是因为他喜欢我才越发觉得我可爱.")
	MisResultCondition(NoRecord, 1187)
	MisResultCondition(HasMission,1187)
	MisResultAction(ClearMission,1187)
	MisResultAction(SetRecord, 1187)

	----------------------------------------------------------社交大使10----------草莓优优
	DefineMission( 5707, "TOP Ambassador 10", 1188 )
	MisBeginTalk("<t>德克是有名的海盗吗?他也邀请了我?那我要为他准备礼物了...送什么给他呢?有办法了,不如你帮我问问瓦萨法尔,他那有很有趣的纸牌.我想海盗都会喜欢纸牌游戏的.")
				
	MisBeginCondition(NoMission, 1188)
	MisBeginCondition(NoRecord,1188)
	MisBeginCondition(HasRecord, 1187)
	MisBeginAction(AddMission,1188)
	MisCancelAction(ClearMission, 1188)

	MisNeed(MIS_NEED_DESP, "找贝比平原的瓦萨法尔(1136,2778)聊聊")
	
	MisHelpTalk("<t>不知道瓦萨法尔肯不肯把纸牌送给我呢...")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使10--------瓦萨法尔
	DefineMission(5708, "TOP Ambassador 10", 1188, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>优优也注意到我的才华了?好有成就感啊!")
	MisResultCondition(NoRecord, 1188)
	MisResultCondition(HasMission,1188)
	MisResultAction(ClearMission,1188)
	MisResultAction(SetRecord, 1188)

	----------------------------------------------------------社交大使11----------瓦萨法尔
	DefineMission( 5709, "TOP Ambassador 11", 1189 )
	MisBeginTalk("<t>我不能让优优这样的小女孩一个人去参加海盗的Party,我会带着礼物陪她一起去的.说到圣诞节使我想起一件事,由于原料紧缺,年底要交给交易员·米索亚斯的货物可能不会按时送到了,如果你路过鸣沙岛代我说明一下好吗?我相信你.")
				
	MisBeginCondition(NoMission, 1189)
	MisBeginCondition(NoRecord,1189)
	MisBeginCondition(HasRecord, 1188)
	MisBeginAction(AddMission,1189)
	MisCancelAction(ClearMission, 1189)

	MisNeed(MIS_NEED_DESP, "找鸣沙岛的交易员·米索亚斯(1739,3748)聊聊")
	
	MisHelpTalk("<t>你的样子看起来就很值得托付.交易员·米索亚斯在鸣沙岛.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使11--------交易员·米索亚斯
	DefineMission(5710, "TOP Ambassador 11", 1189, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>又要延时!瓦萨法尔为了可爱的女孩什么都可以放弃,甚至是我这个好朋友的嘱托...")
	MisResultCondition(NoRecord, 1189)
	MisResultCondition(HasMission,1189)
	MisResultAction(ClearMission,1189)
	MisResultAction(SetRecord, 1189)

	----------------------------------------------------------社交大使12----------交易员·米索亚斯
	DefineMission( 5711, "TOP Ambassador 12", 1190 )
	MisBeginTalk("<t>这样看来年底我也没有太多事可以做了.我会去参加德克的宴会的,很久没去拜访过朋友了.古博拉也去吗?太好了,如果饰品商人·瑞恩也能参加,那将是一个完美的圣诞节.")
				
	MisBeginCondition(NoMission, 1190)
	MisBeginCondition(NoRecord,1190)
	MisBeginCondition(HasRecord, 1189)
	MisBeginAction(AddMission,1190)
	MisCancelAction(ClearMission, 1190)

	MisNeed(MIS_NEED_DESP, "找冰极补给站的饰品商人·瑞恩(2673,657)聊聊")
	
	MisHelpTalk("<t>如果瑞恩不去的话我会觉得遗憾的,希望你可以帮我.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使12--------饰品商人·瑞恩
	DefineMission(5712, "TOP Ambassador 12", 1190, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>哈哈哈,米索亚斯这个家伙总是说这些让人感动的话.讨厌拉.")
	MisResultCondition(NoRecord, 1190)
	MisResultCondition(HasMission,1190)
	MisResultAction(ClearMission,1190)
	MisResultAction(SetRecord, 1190)


	----------------------------------------------------------社交大使13----------饰品商人·瑞恩
	DefineMission( 5713, "TOP Ambassador 13", 1191 )
	MisBeginTalk("<t>可能是多年经营珠宝饰品使我的性格也女性化了.为了让自己始终保持男子的阳刚,多年来我始终与男人味十足的卡休·碎石保持联络.")
				
	MisBeginCondition(NoMission, 1191)
	MisBeginCondition(NoRecord,1191)
	MisBeginCondition(HasRecord, 1190)
	MisBeginAction(AddMission,1191)
	MisCancelAction(ClearMission, 1191)

	MisNeed(MIS_NEED_DESP, "找卡尔加德补给站的卡休·碎石(626,2100)聊聊")
	
	MisHelpTalk("<t>你可以顺便到卡尔加德补给站转转,那里的树会走路的.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使13--------卡休·碎石
	DefineMission(5714, "TOP Ambassador 13", 1191, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>这里不是一个适合人类居住的地方,尤其是当你不喜欢你的邻居时,这种感觉就更强烈.")
	MisResultCondition(NoRecord, 1191)
	MisResultCondition(HasMission,1191)
	MisResultAction(ClearMission,1191)
	MisResultAction(SetRecord, 1191)

	----------------------------------------------------------社交大使14----------卡休·碎石
	DefineMission( 5715, "TOP Ambassador 14", 1192 )
	MisBeginTalk("<t>有聚会可以参加?虽然还有很久才到圣诞节,但是听到这个消息仍然让我觉得很振奋,至少可以远离某个人.我想交易员·尤卡也想解脱的,不如你去问下他.")
				
	MisBeginCondition(NoMission, 1192)
	MisBeginCondition(NoRecord,1192)
	MisBeginCondition(HasRecord, 1191)
	MisBeginAction(AddMission,1192)
	MisCancelAction(ClearMission, 1192)

	MisNeed(MIS_NEED_DESP, "Talk to Trader - Yuka (2519, 2397) at Cupid Isle ")
	
	MisHelpTalk("<t>真爱岛的地形是心形的,你知道吗?")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使14--------交易员·尤卡        
	DefineMission(5716, "TOP Ambassador 14", 1192, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你和卡休·碎石真是我的救星啊．我在躲我的债主,我承认我不是一个成功的交易员,总是做赔本的生意.最害怕过圣诞节有人逼债了.")
	MisResultCondition(NoRecord, 1192)
	MisResultCondition(HasMission,1192)
	MisResultAction(ClearMission,1192)
	MisResultAction(SetRecord, 1192)

	----------------------------------------------------------社交大使15----------交易员·尤卡
	DefineMission( 5717, "TOP Ambassador 15", 1193 )
	MisBeginTalk("<t>开私人聚会没有像样的点心可不行,为了那个美好的晚上,我认为你应该帮我们邀请会作美味点心的尤塔里尼.")
				
	MisBeginCondition(NoMission, 1193)
	MisBeginCondition(NoRecord,1193)
	MisBeginCondition(HasRecord, 1192)
	MisBeginAction(AddMission,1193)
	MisCancelAction(ClearMission, 1193)

	MisNeed(MIS_NEED_DESP, "找阿兰比斯补给站的尤塔里尼(1059,661)聊聊")
	
	MisHelpTalk("<t>拜托你了,为了美味的点心.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使15-------- 尤塔里尼
	DefineMission(5718, "TOP Ambassador 15", 1193, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>那些年轻的聚会邀请我应该是因为美味的点心.")
	MisResultCondition(NoRecord, 1193)
	MisResultCondition(HasMission,1193)
	MisResultAction(ClearMission,1193)
	MisResultAction(SetRecord, 1193)


	----------------------------------------------------------社交大使16----------尤塔里尼
	DefineMission( 5719, "TOP Ambassador 16", 1194 )
	MisBeginTalk("<t>看见我佝偻的腰杆了吗?我已经不做点心了,废矿补给站的打包人·乎勒达是我的学徒,你去拜托他吧.")
				
	MisBeginCondition(NoMission, 1194)
	MisBeginCondition(NoRecord,1194)
	MisBeginCondition(HasRecord, 1193)
	MisBeginAction(AddMission,1194)
	MisCancelAction(ClearMission, 1194)

	MisNeed(MIS_NEED_DESP, "找废矿补给站的打包人·乎勒达(1907,2798)聊聊")
	
	MisHelpTalk("<t>也该是锻炼他的时候了.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使16-------- 打包人·乎勒达
	DefineMission(5720, "TOP Ambassador 16", 1194, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我的确继承了我老师的精湛技艺,放心吧,包在我身上.")
	MisResultCondition(NoRecord, 1194)
	MisResultCondition(HasMission,1194)
	MisResultAction(ClearMission,1194)
	MisResultAction(SetRecord, 1194)


	----------------------------------------------------------社交大使17----------打包人·乎勒达
	DefineMission( 5721, "TOP Ambassador 17", 1195 )
	MisBeginTalk("<t>不过我需要一个温柔的助手帮忙.如果米尔米莉不忙的话,他应该是最佳人选.")
				
	MisBeginCondition(NoMission, 1195)
	MisBeginCondition(NoRecord,1195)
	MisBeginCondition(HasRecord, 1194)
	MisBeginAction(AddMission,1195)
	MisCancelAction(ClearMission, 1195)

	MisNeed(MIS_NEED_DESP, "找南部沙漠的米尔米莉(1244,3186)聊聊")
	
	MisHelpTalk("<t>米尔米莉是一个很细心并且很有耐心的女孩.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使17-------- 米尔米莉
	DefineMission(5722, "TOP Ambassador 17", 1195, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你好!欢迎你朋友.我接受乎勒达的赞扬,因为我对工作和生活都是这样认真的.")
	MisResultCondition(NoRecord, 1195)
	MisResultCondition(HasMission,1195)
	MisResultAction(ClearMission,1195)
	MisResultAction(SetRecord, 1195)

	----------------------------------------------------------社交大使18----------米尔米莉
	DefineMission( 5723, "TOP Ambassador 18", 1196 )
	MisBeginTalk("<t>今天是我来到这片梦幻的南部沙漠一周年的纪念日,要怎么庆祝呢?我想最重要的是要感谢海港指挥·拉米修,是他指引我来到这里的.可是我实在走不开,我现在是职业老师的专职秘书呢.你能体谅我吧.")
				
	MisBeginCondition(NoMission, 1196)
	MisBeginCondition(NoRecord,1196)
	MisBeginCondition(HasRecord, 1195)
	MisBeginAction(AddMission,1196)
	MisCancelAction(ClearMission, 1196)

	MisNeed(MIS_NEED_DESP, "Talk to Harbor Operator - Ramus (2297, 3723) at Muse Haven")
	
	MisHelpTalk("<t>我热爱我的工作和生活,感谢这片美丽的土地.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使18-------- 海港指挥·拉米修
	DefineMission(5724, "TOP Ambassador 18", 1196, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>时间过得好快啊.转眼已经一年了,那个小女孩居然还记得我.呵呵....")
	MisResultCondition(NoRecord, 1196)
	MisResultCondition(HasMission,1196)
	MisResultAction(ClearMission,1196)
	MisResultAction(SetRecord, 1196)

	----------------------------------------------------------社交大使19----------海港指挥·拉米修
	DefineMission( 5725, "TOP Ambassador 19", 1197 )
	MisBeginTalk("<t>时光飞逝,我刚到这里的时候还是一个小伙子.很怀念从前的老朋友.不知道天堂传送使现在过得怎么样了.")
				
	MisBeginCondition(NoMission, 1197)
	MisBeginCondition(NoRecord,1197)
	MisBeginCondition(HasRecord, 1196)
	MisBeginAction(AddMission,1197)
	MisCancelAction(ClearMission, 1197)

	MisNeed(MIS_NEED_DESP, "Look for Heaven Teleporter at (474, 1054)")
	
	MisHelpTalk("<t>他的职位是一个很重要的位置.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使19-------- 天堂传送使
	DefineMission(5726, "TOP Ambassador 19", 1197, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>不知道天堂上的时光是否也如此流逝无影.")
	MisResultCondition(NoRecord, 1197)
	MisResultCondition(HasMission,1197)
	MisResultAction(ClearMission,1197)
	MisResultAction(SetRecord, 1197)


		----------------------------------------------------------社交大使20----------天堂传送使
	DefineMission( 5727, "TOP Ambassador 20", 1198 )
	MisBeginTalk("<t>我想今年的圣诞节一定会很美,桑吉还答应送给我一些华丽的烟花呢,不知道他还记不记得了.")
				
	MisBeginCondition(NoMission, 1198)
	MisBeginCondition(NoRecord,1198)
	MisBeginCondition(HasRecord, 1197)
	MisBeginAction(AddMission,1198)
	MisCancelAction(ClearMission, 1198)

	MisNeed(MIS_NEED_DESP, "找交易员·桑吉(1003,1306)聊聊")
	
	MisHelpTalk("<t>Thank you, go now.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交大使20-------- 交易员·桑吉
	DefineMission(5728, "TOP Ambassador 20", 1198, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我怎么会忘记呢?他总是帮助别人,我不会让他失望的.")
	MisResultCondition(NoRecord, 1198)
	MisResultCondition(HasMission,1198)
	MisResultAction(ClearMission,1198)
	MisResultAction(SetRecord, 1198)

		----------------------------------------------------------社交大使21----------交易员·桑吉
	DefineMission( 5729, "TOP Ambassador 21", 1199 )
	MisBeginTalk("<t>恭喜你完成了漫长的社交任务．感恩是每一个热爱生活的人特有的能力,因为拥有它,人们会觉得幸福.不耽误你的时间了,德克在等你了.")
				
	MisBeginCondition(NoMission, 1199)
	MisBeginCondition(NoRecord,1199)
	MisBeginCondition(HasRecord, 1198)
	MisBeginAction(AddMission,1199)
	MisCancelAction(ClearMission, 1199)

	MisNeed(MIS_NEED_DESP, "找沙岚城海盗·德克(794,3669)聊聊")
	
	MisHelpTalk("<t>德克有礼物给你.")
	MisResultCondition(AlwaysFailure)	
-----------------------------------------社交英雄21------- 海盗·德克
	DefineMission(5730, "Community Hero 21", 1199, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你是我见过的最出色的社交大使,这枚勋章你受之无愧.")
	MisResultCondition(NoRecord, 1199)
	MisResultCondition(HasMission,1199)
	MisResultAction(ClearMission,1199)
	MisResultAction(SetRecord, 1199)
	MisResultAction(GiveItem, 1879, 1, 4)
	MisResultBagNeed(1)


-------------------------------------------------特别任务	--------海盗·德克
	DefineMission (5731, "梦幻双子之特别行动", 1200)
	
	MisBeginTalk("<t>这个任务是金牛宫特别行动,你可以不参加,当然不参加的没有礼物拿.你知道<b百万大钞>这种东西吗?我急需一张,你一定愿意帮我的是吧.")

	MisBeginCondition(NoMission,1200)
	MisBeginCondition(NoRecord,1200)
	MisBeginCondition(HasRecord,1161)
	MisBeginCondition(HasRecord,1174)
	MisBeginCondition(HasRecord,1175)
	MisBeginCondition(HasRecord,1176)
	MisBeginCondition(HasRecord,1177)
	MisBeginCondition(HasRecord,1178)
	MisBeginCondition(HasRecord,1199)
	MisBeginCondition(HasRecord,1168)
	MisBeginAction(AddMission,1200)
	MisBeginAction(AddTrigger, 12001, TE_GETITEM, 0854, 1 )---------------------百万大钞 
	MisCancelAction(ClearMission, 1200)
	
	
	MisNeed(MIS_NEED_ITEM, 0854, 1, 1, 1 )
	MisHelpTalk("<t>我不是一个爱钱的人,但是喜欢收藏钞票...")

	MisResultTalk("<t>我最欣赏你这种大方的人,也只有大方的人配穿这套双子酷装.")

	MisResultCondition(HasMission, 1200)
	MisResultCondition(NoRecord,1200)
	MisResultCondition(HasItem, 0854, 1 )
	MisResultAction(TakeItem, 0854, 1 )
	MisResultAction(GiveItem, 1881, 1, 4)
	MisResultAction(ClearMission, 1200)
	MisResultAction(SetRecord,  1200 )
	MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 0854)	
	TriggerAction( 1, AddNextFlag, 1200, 1, 1 )
	RegCurTrigger( 12001 )	


	
-------------------------------------------------双子之水手过关奖励----------海盗·德克	
	DefineMission (5733, "双子之水手过关奖励", 1201)
	
	MisBeginTalk("<t>集齐7枚勋章就可以在我这里兑换到双子宫守印和巨蟹宫的门票了.还有很多奖励哦 ")

	MisBeginCondition(NoMission,1201)
	MisBeginCondition(HasRecord,1159)
	MisBeginCondition(HasRecord,1163)
	MisBeginCondition(HasRecord,1164)
	MisBeginCondition(HasRecord,1165)
	MisBeginCondition(HasRecord,1166)
	MisBeginCondition(HasRecord,1167)
	MisBeginCondition(HasRecord,1168)
	MisBeginCondition(HasRecord,1199)
	MisBeginCondition(NoRecord,1201)
	MisBeginAction(AddMission,1201)  
	MisBeginAction(AddTrigger, 12011, TE_GETITEM, 1874, 1 )		
	MisBeginAction(AddTrigger, 12012, TE_GETITEM, 1875, 1 )		
	MisBeginAction(AddTrigger, 12013, TE_GETITEM, 1876, 1 )		
 	MisBeginAction(AddTrigger, 12014, TE_GETITEM, 1877, 1 )		
	MisBeginAction(AddTrigger, 12015, TE_GETITEM, 1878, 1 )		
	MisBeginAction(AddTrigger, 12016, TE_GETITEM, 1879, 1 )		
	MisBeginAction(AddTrigger, 12017, TE_GETITEM, 1880, 1 )	
	MisCancelAction(ClearMission, 1201)						                                     
	
	MisNeed(MIS_NEED_ITEM, 1874, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 1875, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 1876, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 1877, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 1878, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 1879, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 1880, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>下一宫是巨蟹宫,有更诱人的奖励和更刺激的挑战在等你.")

	MisResultCondition(HasMission, 1201)
	MisResultCondition(NoRecord,1201)
	MisResultCondition(HasItem, 1874, 1 )
	MisResultCondition(HasItem, 1875, 1 )
	MisResultCondition(HasItem, 1876, 1 )
	MisResultCondition(HasItem, 1877, 1 )
	MisResultCondition(HasItem, 1878, 1 )
	MisResultCondition(HasItem, 1879, 1 )
	MisResultCondition(HasItem, 1880, 1 )

	MisResultAction(TakeItem, 1874, 1 )
	MisResultAction(TakeItem, 1875, 1 )
	MisResultAction(TakeItem, 1876, 1 )
	MisResultAction(TakeItem, 1877, 1 )
	MisResultAction(TakeItem, 1878, 1 )
	MisResultAction(TakeItem, 1879, 1 )
	MisResultAction(TakeItem, 1880, 1 )

	MisResultAction(ClearMission, 1201)
	MisResultAction(SetRecord,  1201 )
	MisResultAction(GiveItem, 1865, 1, 4)
	MisResultAction(GiveItem, 1866, 1, 4)
	MisResultAction(GiveItem, 1002, 30, 4)
	MisResultAction(AddMoney,500000,500000)
	MisResultAction(ShuangZiSS)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1874)	
	TriggerAction( 1, AddNextFlag, 1201, 10, 1 )
	RegCurTrigger( 12011 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1875)	
	TriggerAction( 1, AddNextFlag, 1201, 20, 1 )
	RegCurTrigger( 12012 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1876)	
	TriggerAction( 1, AddNextFlag, 1201, 30, 1 )
	RegCurTrigger( 12013 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1877)	
	TriggerAction( 1, AddNextFlag, 1201, 40, 1 )
	RegCurTrigger( 12014 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1878)	
	TriggerAction( 1, AddNextFlag, 1201, 50, 1 )
	RegCurTrigger( 12015 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1879)	
	TriggerAction( 1, AddNextFlag, 1201, 60, 1 )
	RegCurTrigger( 12016 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1880)	
	TriggerAction( 1, AddNextFlag, 1201, 70, 1 )
	RegCurTrigger( 12017 )
----------------------------------------------双子之海盗过关奖励----------海盗·德克	
	DefineMission (5734, "双子之海盗过关奖励", 1202)
	
	MisBeginTalk("<t>集齐7枚勋章就可以在我这里兑换到双子宫守印和巨蟹宫的门票了.还有很多奖励哦 ")

	MisBeginCondition(NoMission,1202)
	MisBeginCondition(HasRecord,1204)
	MisBeginCondition(HasRecord,1169)
	MisBeginCondition(HasRecord,1170)
	MisBeginCondition(HasRecord,1171)
	MisBeginCondition(HasRecord,1172)
	MisBeginCondition(HasRecord,1173)
	MisBeginCondition(HasRecord,1168)
	MisBeginCondition(HasRecord,1199)
	MisBeginCondition(NoRecord,1202)
	MisBeginAction(AddMission,1202)
	MisBeginAction(AddTrigger, 11571, TE_GETITEM, 1874, 1 )		
	MisBeginAction(AddTrigger, 11572, TE_GETITEM, 1875, 1 )		
	MisBeginAction(AddTrigger, 11573, TE_GETITEM, 1876, 1 )		
 	MisBeginAction(AddTrigger, 11574, TE_GETITEM, 1877, 1 )		
	MisBeginAction(AddTrigger, 11575, TE_GETITEM, 1878, 1 )		
	MisBeginAction(AddTrigger, 11576, TE_GETITEM, 1879, 1 )		
	MisBeginAction(AddTrigger, 11577, TE_GETITEM, 1880, 1 )		
	MisCancelAction(ClearMission, 1202)						                                     
	
	MisNeed(MIS_NEED_ITEM, 1874, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 1875, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 1876, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 1877, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 1878, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 1879, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 1880, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>下一宫是巨蟹宫,有更诱人的奖励和更刺激的挑战在等你.")

	MisResultCondition(HasMission, 1202)
	MisResultCondition(NoRecord,1202)
	MisResultCondition(HasItem, 1874, 1 )
	MisResultCondition(HasItem, 1875, 1 )
	MisResultCondition(HasItem, 1876, 1 )
	MisResultCondition(HasItem, 1877, 1 )
	MisResultCondition(HasItem, 1878, 1 )
	MisResultCondition(HasItem, 1879, 1 )
	MisResultCondition(HasItem, 1880, 1 )

	MisResultAction(TakeItem, 1874, 1 )
	MisResultAction(TakeItem, 1875, 1 )
	MisResultAction(TakeItem, 1876, 1 )
	MisResultAction(TakeItem, 1877, 1 )
	MisResultAction(TakeItem, 1878, 1 )
	MisResultAction(TakeItem, 1879, 1 )
	MisResultAction(TakeItem, 1880, 1 )

	MisResultAction(ClearMission, 1202)
	MisResultAction(SetRecord,  1202 )
	MisResultAction(GiveItem, 1865, 1, 4)
	MisResultAction(GiveItem, 1866, 1, 4)
	MisResultAction(GiveItem, 1002, 60, 4)
	MisResultAction(AddMoney,700000,700000)
	MisResultAction(ShuangZiHD)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1874)	
	TriggerAction( 1, AddNextFlag, 1157, 10, 1 )
	RegCurTrigger( 12021 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1875)	
	TriggerAction( 1, AddNextFlag, 1202, 20, 1 )
	RegCurTrigger( 12022 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1876)	
	TriggerAction( 1, AddNextFlag, 1202, 30, 1 )
	RegCurTrigger( 12023 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1877)	
	TriggerAction( 1, AddNextFlag, 1202, 40, 1 )
	RegCurTrigger( 12024 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1878)	
	TriggerAction( 1, AddNextFlag, 1202, 50, 1 )
	RegCurTrigger( 12025 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1879)	
	TriggerAction( 1, AddNextFlag, 1202, 60, 1 )
	RegCurTrigger( 12026 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1880)	
	TriggerAction( 1, AddNextFlag, 1202, 70, 1 )
	RegCurTrigger( 12027 )

	--------------------------------------------双子之船长过关奖励----------海盗·德克	
	DefineMission (5735, "双子之船长过关奖励", 1203)
	
	MisBeginTalk("<t>集齐7枚勋章就可以在我这里兑换到双子宫守印和巨蟹宫的门票了.还有很多奖励哦 ")

	MisBeginCondition(NoMission,1203)
	MisBeginCondition(HasRecord,1161)
	MisBeginCondition(HasRecord,1174)
	MisBeginCondition(HasRecord,1175)
	MisBeginCondition(HasRecord,1176)
	MisBeginCondition(HasRecord,1177)
	MisBeginCondition(HasRecord,1178)
	MisBeginCondition(HasRecord,1199)
	MisBeginCondition(HasRecord,1168)
	MisBeginCondition(NoRecord,1203)
	MisBeginAction(AddMission,1203)   
	MisBeginAction(AddTrigger, 11581, TE_GETITEM, 1874, 1 )		
	MisBeginAction(AddTrigger, 11582, TE_GETITEM, 1875, 1 )		
	MisBeginAction(AddTrigger, 11583, TE_GETITEM, 1876, 1 )		
 	MisBeginAction(AddTrigger, 11584, TE_GETITEM, 1877, 1 )		
	MisBeginAction(AddTrigger, 11585, TE_GETITEM, 1878, 1 )		
	MisBeginAction(AddTrigger, 11586, TE_GETITEM, 1879, 1 )		
	MisBeginAction(AddTrigger, 11587, TE_GETITEM, 1880, 1 )	
	MisCancelAction(ClearMission, 1203)						                                     
	
	MisNeed(MIS_NEED_ITEM, 1874, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 1875, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 1876, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 1877, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 1878, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 1879, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 1880, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>下一宫是巨蟹宫,有更诱人的奖励和更刺激的挑战在等你.")

	MisResultCondition(HasMission, 1203)
	MisResultCondition(NoRecord,1203)
	MisResultCondition(HasItem, 1874, 1 )
	MisResultCondition(HasItem, 1875, 1 )
	MisResultCondition(HasItem, 1876, 1 )
	MisResultCondition(HasItem, 1877, 1 )
	MisResultCondition(HasItem, 1878, 1 )
	MisResultCondition(HasItem, 1879, 1 )
	MisResultCondition(HasItem, 1880, 1 )

	MisResultAction(TakeItem, 1874, 1 )
	MisResultAction(TakeItem, 1875, 1 )
	MisResultAction(TakeItem, 1876, 1 )
	MisResultAction(TakeItem, 1877, 1 )
	MisResultAction(TakeItem, 1878, 1 )
	MisResultAction(TakeItem, 1879, 1 )
	MisResultAction(TakeItem, 1880, 1 )

	MisResultAction(ClearMission, 1203)
	MisResultAction(SetRecord,  1203 )
	MisResultAction(GiveItem, 1865, 1, 4)
	MisResultAction(GiveItem, 1866, 1, 4)
	MisResultAction(GiveItem, 1002, 90, 4)
	MisResultAction(AddMoney,900000,900000)
	MisResultAction(ShuangZiCZ)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1874)	
	TriggerAction( 1, AddNextFlag, 1203, 10, 1 )
	RegCurTrigger( 12031 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1875)	
	TriggerAction( 1, AddNextFlag, 1203, 20, 1 )
	RegCurTrigger( 12032 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1876)	
	TriggerAction( 1, AddNextFlag, 1203, 30, 1 )
	RegCurTrigger( 12033 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1877)	
	TriggerAction( 1, AddNextFlag, 1203, 40, 1 )
	RegCurTrigger( 12034 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1878)	
	TriggerAction( 1, AddNextFlag, 1203, 50, 1 )
	RegCurTrigger( 12035 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1879)	
	TriggerAction( 1, AddNextFlag, 1203, 60, 1 )
	RegCurTrigger( 12036 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1880)	
	TriggerAction( 1, AddNextFlag, 1203, 70, 1 )
	RegCurTrigger( 12037 )

	----------------------------------天仙配传奇--------月老
	DefineMission ( 5736, "天仙配传奇", 1205)

	MisBeginTalk("<t>七夕将至,苦等一年的牛郎织女即将相会,真是令人感慨啊.你想要听牛郎与织女的天仙配传奇故事吗?用10个精灵之心来交换吧.")

	MisBeginCondition(NoMission,1205)
	MisBeginCondition(NoRecord,1205)
	MisBeginAction(AddMission,1205)
	MisBeginAction(AddTrigger, 12051, TE_GETITEM, 4418, 10)
	MisCancelAction(ClearMission, 1205)
	

	MisNeed(MIS_NEED_DESP, "去找到10个精灵之心与月老交换动人的爱情故事")
	MisNeed(MIS_NEED_ITEM, 4418, 10, 10, 10)

	MisHelpTalk("<t>要10个精灵之心")
	MisResultTalk("<t>我编织过无数的凄美故事,但我发誓这件事与我无关.我可是一个善良的老头.") 
	
	MisResultCondition(HasMission, 1205)
	MisResultCondition(NoRecord,1205)
	MisResultCondition(HasItem, 4418, 10)
	MisResultAction(TakeItem, 4418, 10 )
	MisResultAction(ClearMission, 1205)
	MisResultAction(SetRecord, 1205 )
	
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 4418)	
	TriggerAction( 1, AddNextFlag, 1205, 10, 10 )
	RegCurTrigger( 12051 )

	-------------------------------鹊桥情事--------月老
	DefineMission( 5737, "鹊桥情事", 1206)
	
	MisBeginTalk( "<t>在很久很久以前......这是一个以情贯穿的故事.人的情、神的情、牲灵的情、人和神的情、正义的情、邪恶的情、生怨的情、凄美的情、生死相依的情......<n><t>去寻找故事的主人公牛郎吧!据说他在夏岛附近.")
	MisBeginCondition(HasRecord, 1205 )
	MisBeginCondition(NoRecord, 1206 )
	MisBeginCondition(NoMission, 1206 )
	MisBeginAction(AddMission, 1206 )
	MisCancelAction(ClearMission, 1206)
	
	MisNeed(MIS_NEED_DESP, "找到夏岛牛郎(3670,2636)")
	MisHelpTalk("<t>去夏岛要用机票哦.")
	MisResultCondition(AlwaysFailure )

	---------------------------------------鹊桥情事-------牛郎

	DefineMission(5738,"鹊桥情事",1206,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>我即将与我的爱人见面,真是期待啊!遥想当年,我们历尽千辛万苦,终于换来这一年一次的相聚.虽然短暂,但也值得.")
	MisResultCondition(HasMission, 1206)
	MisBeginCondition(NoRecord, 1206)
	MisResultAction(ClearMission, 1206)
	MisResultAction(SetRecord, 1206)


	-------------------------------千里传书------牛郎
	DefineMission( 5739, "千里传书", 1207)
	
	MisBeginTalk( "<t>马上就要见面,有千言万语要说,已经迫不及待了.您能否将这封信交到织女手中?她在天堂!辛苦你了!")
	MisBeginCondition(HasRecord, 1206 )
	MisBeginCondition(NoRecord, 1207 )
	MisBeginCondition(NoMission, 1207 )
	MisBeginAction(AddMission, 1207 )
	MisBeginAction(GiveItem, 2669, 1, 4)----------牛郎的情书
	MisCancelAction(ClearMission, 1207)
	MisBeginBagNeed(1)
	
	MisNeed(MIS_NEED_DESP, "帮牛郎送信给天堂的织女(1599,909)")
	MisHelpTalk("<t>一年一度的相聚,多亏了那些喜鹊.")
	MisResultCondition(AlwaysFailure )

	---------------------------------------千里传书----织女

	DefineMission(5740,"千里传书",1207,COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure)

	MisResultTalk("<t>这是牛郎给我的书信?太好了,实在感谢您.作为回报,我将用天梭为你编织世界上最美丽的衣服.也祝愿您能找到您的挚爱.穿上我给你做的衣服,一定可以捕获他(她)的心.<n><t>如果您想了解更多关于我和牛郎的故事,尽请关注即将为我们筹拍的电视剧《牛郎织女》.")
	MisResultCondition(HasMission, 1207)
	MisBeginCondition(NoRecord, 1207)
	MisResultCondition(HasItem,2669,1)---------牛郎的情书
	MisResultAction(TakeItem, 2669,1)
	MisResultAction(GiveItem, 2670, 1, 4)----------天衣宝箱
	MisResultAction(ClearMission, 1207)
	MisResultAction(SetRecord, 1207)
	MisResultAction(ClearRecord, 1205 )
	MisResultAction(ClearRecord, 1206 )
	MisResultAction(ClearRecord, 1207 )
	MisResultBagNeed(1)

-------------------------------------------------------昂贵的学费----------雷诺校长
	DefineMission( 6127, "昂贵的学费", 1453)
	MisBeginTalk( "<t>又一个学年开始咯,小朋友你想体验上学的乐趣吗?那么~~嘿嘿,先付点学费吧,也不贵,只要2亿海盗币就行了.什么?你没钱?算啦算啦,只要你帮我老人家去找99个食神水饺过来吧,学费就免了吧.")
	MisBeginCondition( NoMission, 1453)
	MisBeginCondition( NoRecord, 1453)
	MisBeginAction( AddMission, 1453)
	MisBeginAction(AddTrigger, 14531, TE_GETITEM, 3909, 99)
	MisCancelAction( ClearMission, 1453)

	MisNeed( MIS_NEED_DESP, "找99个食神水饺来给雷诺校长(2232,2781)")
	MisNeed( MIS_NEED_ITEM, 3909, 99, 10, 99)

	MisHelpTalk( "<t>食神水饺的话据说有个神秘的商城有卖，不过记得把背包留出足够的空格")
	MisResultTalk( "<t>水饺真好吃,小朋友真不错啊!")
	MisResultCondition( HasMission, 1453)
	MisResultCondition( NoRecord, 1453)
	MisResultCondition( HasItem, 3909, 99)
	MisResultAction( ClearMission, 1453)
	MisResultAction( TakeItem, 3909, 99)
	MisResultAction( SetRecord, 1453)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3909)	
	TriggerAction( 1, AddNextFlag, 1453, 10, 99 )
	RegCurTrigger( 14531 )

-------------------------------------------------------更多的朋友----------雷诺校长
	DefineMission( 6128, "更多的朋友", 1454)
	MisBeginTalk( "<t>入了学你还要多认识新伙伴啊,这样吧,去认识4个朋友,然后带他们来见我.")
	MisBeginCondition( NoMission, 1454)
	MisBeginCondition( NoRecord, 1454)
	MisBeginCondition( HasRecord, 1453)
	MisBeginAction( AddMission, 1454)
	MisCancelAction( ClearMission, 1454)

	MisNeed( MIS_NEED_DESP, "组4个队友然后回去找雷诺校长(2232,2781)谈谈")
	
	MisHelpTalk( "<t>去组4个队友吧!")
	MisResultTalk( "<t>恩，还是年轻好,多有活力啊,去多多认识些朋友吧.")
	MisResultCondition( HasMission, 1454)
	MisResultCondition( NoRecord, 1454)
	MisResultCondition( CheckTeam1, 5)					------检测有几个队友
	MisResultAction( ClearMission, 1454)
	MisResultAction( SetRecord, 1454)

-------------------------------------------------------体育锻炼----------雷诺校长

	DefineMission( 6129, "体育锻炼", 1455)
	MisBeginTalk( "<t>当一个好学生身体也要健健康康,去锻炼下消灭10棵精灵草.")
	MisBeginCondition( NoMission, 1455)
	MisBeginCondition( NoRecord, 1455)
	MisBeginCondition( HasRecord, 1454)
	MisBeginAction( AddMission, 1455)
	MisBeginAction(AddTrigger, 14551, TE_KILL, 75, 10 )
	MisCancelAction( ClearMission, 1455)

	MisNeed( MIS_NEED_DESP, "去消灭10棵精灵草(2118,2638)后回来找雷诺校长.")
	MisNeed( MIS_NEED_KILL, 75, 10, 10, 10)

	MisHelpTalk( "<t>精灵草白银城门口就有很多.")
	MisResultTalk( "<t>看来你真的很健壮.")
	MisResultCondition( HasMission, 1455)
	MisResultCondition( NoRecord, 1455)
	MisResultCondition( HasFlag, 1455, 19)
	MisResultAction( ClearMission, 1455)
	MisResultAction( SetRecord, 1455)

	InitTrigger() 
	TriggerCondition( 1, IsMonster, 75 )	
	TriggerAction( 1, AddNextFlag, 1455, 10, 10 )
	RegCurTrigger(14551)

-------------------------------------------------------入学证书----------雷诺校长
	DefineMission( 6130, "入学证书", 1456)
	MisBeginTalk( "<t>既然学费也交过了,朋友也认识了,那这张入学证书就给你吧,不过证书也要制作费的嘛,算你便宜点,给我张百万大钞就行了.")
	MisBeginCondition( NoMission, 1456)
	MisBeginCondition( NoRecord, 1456)
	MisBeginCondition( HasRecord, 1455)
	MisBeginAction( AddMission, 1456)
	MisBeginAction(AddTrigger, 14561, TE_GETITEM, 854, 1)
	MisCancelAction( ClearMission, 1456)

	MisNeed( MIS_NEED_DESP, "找张百万大钞给雷诺校长(2232,2781)")
	MisNeed( MIS_NEED_ITEM, 854, 1, 10, 1)

	MisHelpTalk( "<t>给我一张百万大钞,我就给你入学证书,嘿嘿")
	MisResultTalk( "<t>钱拿来了?那入学证书给你吧.")
	MisResultCondition( HasMission, 1456)
	MisResultCondition( NoRecord, 1456)
	MisResultCondition( HasItem, 854, 1)
	MisResultAction( ClearMission, 1456)
	MisResultAction( TakeItem, 854, 1)
	MisResultAction( GiveItem, 579, 1, 4)
	MisResultAction( SetRecord, 1456)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 854)	
	TriggerAction( 1, AddNextFlag, 1456, 10, 1 )
	RegCurTrigger( 14561 )

-------------------------------------------------------开学报到----------雷诺校长
	DefineMission( 6131, "开学报到", 1457)
	MisBeginTalk( "<t>既然学费也交过了，朋友也认识了，那就带着这张入学证书去找昂莉娜老师(871,3582)报到吧，不过她可能会考下你哦！")
	MisBeginCondition( NoMission, 1457)
	MisBeginCondition( NoRecord, 1457)
	MisBeginCondition( HasRecord, 1456)
	MisBeginAction( AddMission, 1457)
	MisCancelAction( ClearMission, 1457)

	MisNeed( MIS_NEED_DESP, "带着入学证书去找昂莉娜老师(871,3582)报到")
	MisHelpTalk( "<t>昂莉娜老师就在沙岚(871,3582),别忘记带入学证书过去哦.")
	MisResultCondition( AlwaysFailure )

-------------------------------------------------------开学报到----------昂莉娜老师
	DefineMission( 6132, "开学报到", 1457, COMPLETE_SHOW)

	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>知道吗？有些神秘的文具据说可以当做武器使用哦.")
	MisResultCondition( HasMission, 1457)
	MisResultCondition( NoRecord, 1457)
	MisResultCondition( HasItem, 579, 1)
	MisResultAction( ClearMission, 1457)
	MisResultAction( SetRecord, 1457)
	
-------------------------------------------------------入学考试----------昂莉娜老师
	DefineMission( 6133, "入学考试", 1458)
	MisBeginTalk( "<t>要想入学的话要接受我的考试吗?那可是很难的哦,每道题你只有30秒的思考时间,未答或者晚答都算答错.")
	MisBeginCondition( NoMission, 1458)
	MisBeginCondition( NoRecord, 1458)
	MisBeginCondition( HasRecord, 1457)
	MisBeginAction( AddMission, 1458)
	MisCancelAction( ClearMission, 1458)

	MisNeed( MIS_NEED_DESP, "回答完昂莉娜老师的入学考试问题")

	MisHelpTalk( "<t>要想回答对我的问题的话,你可要做好充分的准备哦,只有对我们海盗王的世界有一定了解的人才能回答出来.")
	MisResultCondition( AlwaysFailure )

-------------------------------------------------------入学考试----------昂莉娜老师
	DefineMission( 6134, "入学考试", 1458, COMPLETE_SHOW)
	
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>恭喜你,你真的很聪明,我相信你一定会成为一个好学生的,作为奖励,给你一个大礼包吧.")
	MisResultCondition( HasMission, 1458)
	MisResultCondition( NoRecord, 1463)
	MisResultCondition( HasRecord, 1461)
	MisResultCondition( CheckRightNum )
	MisResultAction( SetRecord, 1463)
	MisResultAction( SetRecord, 1458)
	MisResultAction( TakeItem, 579, 1)
	MisResultAction( GiveItem, 47, 1, 4)
	MisResultAction( ClearMission, 1458)
	MisResultBagNeed(1)

-------------------------------------------------------入学考试----------昂莉娜老师
	DefineMission( 6135, "入学考试", 1458, COMPLETE_SHOW)
	
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>不及格哦,不过没关系,我还有另外的一项任务交给你.")
	MisResultCondition( HasMission, 1458)
	MisResultCondition( NoRecord, 1463)
	MisResultCondition( HasRecord, 1461)
	MisResultCondition( CheckErroNum )
	MisResultAction( SetRecord, 1463)
	MisResultAction( SetRecord, 1458)
	MisResultAction( SetRecord, 1460)
	MisResultAction( TakeItem, 579, 1)
	MisResultAction( ClearMission, 1458)

-------------------------------------------------------真假友人----------昂莉娜老师
	DefineMission( 6136, "真假友人", 1464)
	MisBeginTalk( "<t>我这里有封信需要你去帮我送给住在冰极的库拉托斯.他是个很喜欢开玩笑的人,经常和3个跟他自己一模一样的傀儡在一起,你如果去的话一定要分清楚哪个是真的,不然会有很可怕的事情发生的!!还有,顺便去找10张圣雪山直航票给库拉托斯")
	MisBeginCondition( NoMission, 1464)
	MisBeginCondition( NoRecord, 1464)
	MisBeginCondition( HasRecord, 1460)
	MisBeginAction( AddMission, 1464)
	MisBeginAction(AddTrigger, 14641, TE_GETITEM, 3050, 10)
	MisBeginAction( GiveItem, 500, 1, 4)
	MisCancelAction( ClearMission, 1464)
	MisBeginBagNeed(1)

	MisNeed( MIS_NEED_DESP, "把昂莉娜的信,还有10张圣雪山机票送去给真正的库拉托斯,他就在冰极补给站附近")
	MisHelpTalk( "<t>库拉托斯就在冰极附近,不过你要判断准他是不是真的库拉托斯")
	
	MisResultCondition( AlwaysFailure )

-------------------------------------------------------真假友人----------库拉托斯
	DefineMission( 6137, "真假友人", 1464, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>居然能发现我的真身,看来你拥有很敏锐的观察能力和不折不挠的毅力啊,这是值得奖励的,我相信你也一定会是个好学生.")
	MisResultCondition( HasMission, 1464)
	MisResultCondition( NoRecord, 1464)
	MisResultCondition( HasRecord, 1465)
	MisResultCondition( HasItem, 500, 1)
	MisResultCondition( HasItem, 3050, 10)
	MisResultAction( SetRecord, 1464)
	MisResultAction( TakeItem, 500, 1)
	MisResultAction( TakeItem, 3050, 10)
	MisResultAction( ClearMission, 1464)
	MisResultAction( GiveItem, 47, 1, 4)
	MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3050)	
	TriggerAction( 1, AddNextFlag, 1464, 10, 10 )
	RegCurTrigger( 14641 )

	-----------------------------------------乱斗英雄----------海事所助理·罗拉娜--------水手
	DefineMission (5800, "温情巨蟹之乱斗英雄", 1470)
	
	MisBeginTalk("<t>巨蟹座的人,温情顾家,在事业方面也都能表现出自己的才能.这是属于你的梦幻星座吗?")

	MisBeginCondition(NoMission,1470)
	MisBeginCondition(HasRecord,1466)
	MisBeginCondition(NoRecord,1470)
	MisBeginAction(AddMission,1470)
	MisCancelAction(ClearMission, 1470)
	
	MisNeed(MIS_NEED_DESP, "获得80点乱斗点数")
	MisHelpTalk("<t>乱斗点数可以从乱斗白银获得!")
	MisResultTalk("<t>成为英雄的道路上必定会有种种阻碍,战斗的勇气片刻都不能丢失哦.投入全力去战斗吧!")

	MisResultCondition(HasMission, 1470)
	MisResultCondition(NoRecord,1470)
	MisResultCondition(HasFightingPoint,80 )
	MisResultAction(TakeFightingPoint, 80 )
	MisResultAction(ClearMission, 1470)
	MisResultAction(SetRecord,  1470 )
	MisResultAction(GiveItem, 2568, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------名声英雄----------海事所助理·罗拉娜	--------水手
	DefineMission (5801, "温情巨蟹之名声英雄", 1471)
	
	MisBeginTalk("<t>有目标才有追求,有追求才有成就.所以温情巨蟹宫对你的要求也更高一些. ")

	MisBeginCondition(NoMission,1471)
	MisBeginCondition(HasRecord,1466)
	MisBeginCondition(NoRecord,1471)
	MisBeginAction(AddMission,1471)
	MisCancelAction(ClearMission, 1471)
	
	MisNeed(MIS_NEED_DESP, "Obtain 3000 points of reputation")
	MisHelpTalk("<t>看来你得到的名声还不够哦,我想3000点名声对你来说应该不是问题吧? ")
	MisResultTalk("<t>这枚名声勋章是用来见证英雄的.")

	MisResultCondition(HasMission, 1471)
	MisResultCondition(NoRecord,1471)
	MisResultCondition(HasCredit,3000 )
	MisResultAction(TakeCredit, 3000 )
	MisResultAction(ClearMission, 1471)
	MisResultAction(SetRecord,  1471 )
	MisResultAction(GiveItem, 2569, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------等级英雄----------海事所助理·罗拉娜	---------水手
	DefineMission (5802, "温情巨蟹之等级英雄", 1472)
	
	MisBeginTalk("<t>成长的道路是漫长和艰辛的,但是付出一定会有回报哦,让我看看你收获了什么吧...")

	MisBeginCondition(NoMission,1472)
	MisBeginCondition(HasRecord,1466)
	MisBeginCondition(NoRecord,1472)
	MisBeginAction(AddMission,1472)
	MisCancelAction(ClearMission, 1472)
	
	MisNeed(MIS_NEED_DESP, "Reached Level 65")
	MisHelpTalk("<t>当然,65级对我来说不成问题.")
	MisResultTalk("<t>看来你已经经历了成长的磨练,收获不少哦,这枚等级勋章是你的了.")

	MisResultCondition(HasMission, 1472)
	MisResultCondition(NoRecord,1472)
	MisResultCondition(LvCheck, ">", 64 )
	MisResultAction(ClearMission, 1472)
	MisResultAction(SetRecord,  1472 )
	MisResultAction(GiveItem, 2570, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------荣誉英雄----------海事所助理·罗拉娜	----------水手
	DefineMission (5803, "温情巨蟹之荣誉英雄", 1473)
	
	MisBeginTalk("<t>亲爱的朋友,有一点你必须要知道,海盗世界最重要的就是荣誉!祖先为此付出一切赢得尊敬,你一定要继承下去.")

	MisBeginCondition(NoMission,1473)
	MisBeginCondition(HasRecord,1466)
	MisBeginCondition(NoRecord,1473)
	MisBeginAction(AddMission,1473)
	MisCancelAction(ClearMission, 1473)
	
	MisNeed(MIS_NEED_DESP, "获得600点荣誉点数")
	MisHelpTalk("<t>去为荣誉而战吧!")
	MisResultTalk("<t>你是个很不错的荣誉之子.")

	MisResultCondition(HasMission, 1473)
	MisResultCondition(NoRecord,1473)
	MisResultCondition(HasHonorPoint,600 )
	MisResultAction(TakeHonorPoint, 600 )
	MisResultAction(ClearMission, 1473)
	MisResultAction(SetRecord,  1473 )
	MisResultAction(GiveItem, 2571, 1, 4)
	MisResultBagNeed(1)	

	-------------------------------------------------采集大使----------海事所助理·罗拉娜	----------水手	
	DefineMission (5804, "温情巨蟹之采集大使", 1474)
	
	MisBeginTalk("<t>成功是需要平时的积累的哦!洞察力也是关键.现在我需要你去收集一些东西... ")

	MisBeginCondition(NoMission,1474)
	MisBeginCondition(HasRecord,1466)
	MisBeginCondition(NoRecord,1474)
	MisBeginAction(AddMission,1474)
	MisBeginAction(AddTrigger, 14741, TE_GETITEM, 1693, 10 )-------------------蝎甲10个
	MisBeginAction(AddTrigger, 14742, TE_GETITEM, 2677, 10 )-------------------链弹LV1 10          
	MisBeginAction(AddTrigger, 14743, TE_GETITEM, 3909, 1 )-----------------食神水饺1               
	MisBeginAction(AddTrigger, 14744, TE_GETITEM, 2589, 5 )----------------精灵王辉印5               
	MisBeginAction(AddTrigger, 14745, TE_GETITEM, 3094, 5)------------------努力增幅器5            
	MisBeginAction(AddTrigger, 14746, TE_GETITEM, 3827, 1 )-----------------情之殇1             
	MisCancelAction(ClearMission, 1474)
	

	MisNeed(MIS_NEED_ITEM, 1693, 10,  1, 10 )
	MisNeed(MIS_NEED_ITEM, 2677, 10, 11, 10 )
	MisNeed(MIS_NEED_ITEM, 3909, 1,  21, 1 )
	MisNeed(MIS_NEED_ITEM, 2589, 5,  22, 5 )
	MisNeed(MIS_NEED_ITEM, 3094, 5,  27, 5 )
	MisNeed(MIS_NEED_ITEM, 3827, 1,  32, 1 )
	

	MisHelpTalk("<t>需要的东西不是很多,但是也不是那么容易哦.")
	MisResultTalk("<t>物到用时方恨少吧,积累的过程虽然比较麻烦,但是如果要做个大人物,细心积累和观察都是不可缺少的哦,当然,还有超强的耐心和毅力!")

	MisResultCondition(HasMission, 1474)
	MisResultCondition(NoRecord,1474)
	MisResultCondition(HasItem, 1693, 10 )
	MisResultCondition(HasItem, 2677, 10 )
	MisResultCondition(HasItem, 3909, 1 )
	MisResultCondition(HasItem, 2589, 5 )
	MisResultCondition(HasItem, 3094, 5 )
	MisResultCondition(HasItem, 3827, 1 )


	MisResultAction(TakeItem, 1693, 10 )
	MisResultAction(TakeItem, 2677, 10 )
	MisResultAction(TakeItem, 3909, 1 )
	MisResultAction(TakeItem, 2589, 5 )
	MisResultAction(TakeItem, 3094, 5 )
	MisResultAction(TakeItem, 3827, 1 )

	MisResultAction(ClearMission, 1474)
	MisResultAction(SetRecord,  1474 )
	MisResultAction(GiveItem, 2572, 1, 4)
	MisResultAction(GiveItem, 2576, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1693)	
	TriggerAction( 1, AddNextFlag, 1474, 1, 10 )
	RegCurTrigger( 14741 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2677)	
	TriggerAction( 1, AddNextFlag, 1474, 11, 10 )
	RegCurTrigger( 14742 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3909)	
	TriggerAction( 1, AddNextFlag, 1474, 21, 1 )
	RegCurTrigger( 14743 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2589)	
	TriggerAction( 1, AddNextFlag, 1474, 22, 5 )
	RegCurTrigger( 14744 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3094)	
	TriggerAction( 1, AddNextFlag, 1474, 27, 5 )
	RegCurTrigger( 14745 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3827)	
	TriggerAction( 1, AddNextFlag, 1474,32, 1 )
	RegCurTrigger( 14746 )

	----------------------------------------------------------巨蟹末日----------海事所助理·罗拉娜
	DefineMission( 5805, "温情巨蟹之巨蟹末日", 1475 )
	MisBeginTalk("<t>BOSS勋章是最具英雄主义意味的奖章,你要的话就去杀掉可怕的巨蟹宫守护神.")
				
	MisBeginCondition(NoMission, 1475)
	MisBeginCondition(HasRecord,1469)
	MisBeginCondition(NoRecord,1475)
	MisBeginAction(AddMission,1475)
	MisBeginAction(AddTrigger, 14751, TE_KILL, 1040, 1)---巨蟹守护者
	
	MisCancelAction(ClearMission, 1475)

	MisNeed(MIS_NEED_DESP, "捕杀巨蟹宫守护神,魔女之海(1637,3751)!")
	MisNeed(MIS_NEED_KILL, 1040,1, 10, 1)
	

	MisResultTalk("<t>当人和螃蟹结合将是可怕的造物.他的野心犹如外表一样丑陋!")
	MisHelpTalk("<t>那怪物拥有强有力的大钳和恶心的唾沫哦,你要小心.")
	MisResultCondition(HasMission,  1475)
	MisResultCondition(HasFlag, 1475, 10)
	MisResultCondition(NoRecord , 1475)
	MisResultAction(GiveItem, 2574, 1, 4 )
	MisResultAction(ClearMission,  1475)
	MisResultAction(SetRecord,  1475 )
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsMonster, 1040)	
	TriggerAction( 1, AddNextFlag, 1475, 10, 1 )
	RegCurTrigger( 14751 )


	-----------------------------------------乱斗英雄----------海事所助理·罗拉娜--------海盗
	DefineMission (5806, "温情巨蟹之乱斗英雄", 1476)
	
	MisBeginTalk("<t>巨蟹座的人,温情顾家,在事业方面也都能表现出自己的才能.这是属于你的梦幻星座吗?")

	MisBeginCondition(NoMission,1476)
	MisBeginCondition(HasRecord,1467)
	MisBeginCondition(NoRecord,1476)
	MisBeginAction(AddMission,1476)
	MisCancelAction(ClearMission, 1476)
	
	MisNeed(MIS_NEED_DESP, "获得150点乱斗点数")
	MisHelpTalk("<t>乱斗点数可以从乱斗白银获得!")
	MisResultTalk("<t>成为英雄的道路上必定会有种种阻碍,战斗的勇气片刻都不能丢失哦.投入全力去战斗吧!")

	MisResultCondition(HasMission, 1476)
	MisResultCondition(NoRecord,1476)
	MisResultCondition(HasFightingPoint,150 )
	MisResultAction(TakeFightingPoint, 150 )
	MisResultAction(ClearMission, 1476)
	MisResultAction(SetRecord,  1476 )
	MisResultAction(GiveItem, 2568, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------名声英雄----------海事所助理·罗拉娜	--------海盗
	DefineMission (5807, "温情巨蟹之名声英雄", 1477)
	
	MisBeginTalk("<t>有目标才有追求,有追求才有成就.所以温情巨蟹宫对你的要求也更高一些. ")

	MisBeginCondition(NoMission,1477)
	MisBeginCondition(HasRecord,1467)
	MisBeginCondition(NoRecord,1477)
	MisBeginAction(AddMission,1477)
	MisCancelAction(ClearMission, 1477)
	
	MisNeed(MIS_NEED_DESP, "获得6000点名声点数")
	MisHelpTalk("<t>看来你得到的名声还不够哦,我想6000点名声对你来说应该不是问题吧? ")
	MisResultTalk("<t>这枚名声勋章是用来见证英雄的.")

	MisResultCondition(HasMission, 1477)
	MisResultCondition(NoRecord,1477)
	MisResultCondition(HasCredit,6000 )
	MisResultAction(TakeCredit, 6000 )
	MisResultAction(ClearMission, 1477)
	MisResultAction(SetRecord,  1477 )
	MisResultAction(GiveItem, 2569, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------海事所助理·罗拉娜	---------海盗
	DefineMission (5808, "温情巨蟹之等级英雄", 1600)
	
	MisBeginTalk("<t>成长的道路是漫长和艰辛的,但是付出一定会有回报哦,让我看看你收获了什么吧...")

	MisBeginCondition(NoMission,1600)
	MisBeginCondition(HasRecord,1467)
	MisBeginCondition(NoRecord,1600)
	MisBeginAction(AddMission,1600)
	MisCancelAction(ClearMission, 1600)
	
	MisNeed(MIS_NEED_DESP, "等级达到70级")
	MisHelpTalk("<t>当然,70级对我来说不成问题.")
	MisResultTalk("<t>看来你已经经历了成长的磨练,收获不少哦,这枚等级勋章是你的了.")

	MisResultCondition(HasMission, 1600)
	MisResultCondition(NoRecord,1600)
	MisResultCondition(LvCheck, ">", 69 )
	MisResultAction(ClearMission, 1600)
	MisResultAction(SetRecord,  1600 )
	MisResultAction(GiveItem, 2570, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------荣誉英雄----------海事所助理·罗拉娜	----------海盗
	DefineMission (5809, "温情巨蟹之荣誉英雄", 1479)
	
	MisBeginTalk("<t>亲爱的朋友,有一点你必须要知道,海盗世界最重要的就是荣誉!祖先为此付出一切赢得尊敬,你一定要继承下去.")

	MisBeginCondition(NoMission,1479)
	MisBeginCondition(HasRecord,1467)
	MisBeginCondition(NoRecord,1479)
	MisBeginAction(AddMission,1479)
	MisCancelAction(ClearMission, 1479)
	
	MisNeed(MIS_NEED_DESP, "获得900点荣誉点数")
	MisHelpTalk("<t>去为荣誉而战吧!")
	MisResultTalk("<t>你是个很不错的荣誉之子.")

	MisResultCondition(HasMission, 1479)
	MisResultCondition(NoRecord,1479)
	MisResultCondition(HasHonorPoint,900 )
	MisResultAction(TakeHonorPoint, 900 )
	MisResultAction(ClearMission, 1479)
	MisResultAction(SetRecord,  1479 )
	MisResultAction(GiveItem, 2571, 1, 4)
	MisResultBagNeed(1)	

	-------------------------------------------------采集大使----------海事所助理·罗拉娜	----------海盗	
	DefineMission (5810, "温情巨蟹之采集大使", 1480)
	
	MisBeginTalk("<t>成功是需要平时的积累的哦!洞察力也是关键.现在我需要你去收集一些东西... ")

	MisBeginCondition(NoMission,1480)
	MisBeginCondition(HasRecord,1467)
	MisBeginCondition(NoRecord,1480)
	MisBeginAction(AddMission,1480)
	MisBeginAction(AddTrigger, 14801, TE_GETITEM, 1693, 20 )-------------------蝎甲20个
	MisBeginAction(AddTrigger, 14802, TE_GETITEM, 2677, 20 )-------------------链弹LV1 20个          
	MisBeginAction(AddTrigger, 14803, TE_GETITEM, 3909, 5 )-----------------食神水饺5个               
	MisBeginAction(AddTrigger, 14804, TE_GETITEM, 2589, 5 )----------------精灵王辉印5               
	MisBeginAction(AddTrigger, 14805, TE_GETITEM, 3094, 10)------------------努力增幅器10个         
	MisBeginAction(AddTrigger, 14806, TE_GETITEM, 3827, 1 )-----------------情之殇1     
	MisBeginAction(AddTrigger, 14807, TE_GETITEM, 0271, 1 )-----------------天使骰子1个         
	MisCancelAction(ClearMission, 1480)
	

	MisNeed(MIS_NEED_ITEM, 1693, 20,  1, 20 )
	MisNeed(MIS_NEED_ITEM, 2677, 20, 21, 20 )
	MisNeed(MIS_NEED_ITEM, 3909, 5,  41, 5 )
	MisNeed(MIS_NEED_ITEM, 2589, 5,  46, 5 )
	MisNeed(MIS_NEED_ITEM, 3094, 10, 51, 10 )
	MisNeed(MIS_NEED_ITEM, 3827, 1,  61, 1 )
	MisNeed(MIS_NEED_ITEM, 0271, 1,  62, 1 )

	MisHelpTalk("<t>需要的东西不是很多,但是也不是那么容易哦.")
	MisResultTalk("<t>物到用时方恨少吧,积累的过程虽然比较麻烦,但是如果要做个大人物,细心积累和观察都是不可缺少的哦,当然,还有超强的耐心和毅力!")

	MisResultCondition(HasMission, 1480)
	MisResultCondition(NoRecord,1480)
	MisResultCondition(HasItem, 1693, 20 )
	MisResultCondition(HasItem, 2677, 20 )
	MisResultCondition(HasItem, 3909, 5 )
	MisResultCondition(HasItem, 2589, 5 )
	MisResultCondition(HasItem, 3094, 10 )
	MisResultCondition(HasItem, 3827, 1 )
	MisResultCondition(HasItem, 0271, 1 )

	MisResultAction(TakeItem, 1693, 20 )
	MisResultAction(TakeItem, 2677, 20 )
	MisResultAction(TakeItem, 3909, 5 )
	MisResultAction(TakeItem, 2589, 5 )
	MisResultAction(TakeItem, 3094, 10 )
	MisResultAction(TakeItem, 3827, 1 )
	MisResultAction(TakeItem, 0271, 1 )

	MisResultAction(ClearMission, 1480)
	MisResultAction(SetRecord,  1480 )
	MisResultAction(GiveItem, 2572, 1, 4)
	MisResultAction(GiveItem, 2576, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1693)	
	TriggerAction( 1, AddNextFlag, 1480, 1, 20 )
	RegCurTrigger( 14801 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2677)	
	TriggerAction( 1, AddNextFlag, 1480, 21, 20 )
	RegCurTrigger( 14802 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3909)	
	TriggerAction( 1, AddNextFlag, 1480, 41, 5 )
	RegCurTrigger( 14803 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2589)	
	TriggerAction( 1, AddNextFlag, 1480, 46, 5 )
	RegCurTrigger( 14804 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3094)	
	TriggerAction( 1, AddNextFlag, 1480, 51, 10 )
	RegCurTrigger( 14805 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3827)	
	TriggerAction( 1, AddNextFlag, 1480,61, 1 )
	RegCurTrigger( 14806 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0271)	
	TriggerAction( 1, AddNextFlag, 1480,62, 1 )
	RegCurTrigger( 14807 )


	-----------------------------------------乱斗英雄----------海事所助理·罗拉娜--------船长
	DefineMission (5811, "温情巨蟹之乱斗英雄", 1481)
	
	MisBeginTalk("<t>巨蟹座的人,温情顾家,在事业方面也都能表现出自己的才能.这是属于你的梦幻星座吗?")

	MisBeginCondition(NoMission,1481)
	MisBeginCondition(HasRecord,1468)
	MisBeginCondition(NoRecord,1481)
	MisBeginAction(AddMission,1481)
	MisCancelAction(ClearMission, 1481)
	
	MisNeed(MIS_NEED_DESP, "获得200点乱斗点数")
	MisHelpTalk("<t>乱斗点数可以从乱斗白银获得!")
	MisResultTalk("<t>成为英雄的道路上必定会有种种阻碍,战斗的勇气片刻都不能丢失哦.投入全力去战斗吧!")

	MisResultCondition(HasMission, 1481)
	MisResultCondition(NoRecord,1481)
	MisResultCondition(HasFightingPoint,200 )
	MisResultAction(TakeFightingPoint, 200 )
	MisResultAction(ClearMission, 1481)
	MisResultAction(SetRecord,  1481 )
	MisResultAction(GiveItem, 2568, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------名声英雄----------海事所助理·罗拉娜	--------船长
	DefineMission (5812, "温情巨蟹之名声英雄", 1482)
	
	MisBeginTalk("<t>有目标才有追求,有追求才有成就.所以温情巨蟹宫对你的要求也更高一些. ")

	MisBeginCondition(NoMission,1482)
	MisBeginCondition(HasRecord,1468)
	MisBeginCondition(NoRecord,1482)
	MisBeginAction(AddMission,1482)
	MisCancelAction(ClearMission, 1482)
	
	MisNeed(MIS_NEED_DESP, "获得10000点名声点数")
	MisHelpTalk("<t>看来你得到的名声还不够哦,我想10000点名声对你来说应该不是问题吧? ")
	MisResultTalk("<t>这枚名声勋章是用来见证英雄的.")

	MisResultCondition(HasMission, 1482)
	MisResultCondition(NoRecord,1482)
	MisResultCondition(HasCredit,10000 )
	MisResultAction(TakeCredit, 10000 )
	MisResultAction(ClearMission, 1482)
	MisResultAction(SetRecord,  1482 )
	MisResultAction(GiveItem, 2569, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------等级英雄----------海事所助理·罗拉娜	---------船长
	DefineMission (5813, "温情巨蟹之等级英雄", 1483)
	
	MisBeginTalk("<t>成长的道路是漫长和艰辛的,但是付出一定会有回报哦,让我看看你收获了什么吧...")

	MisBeginCondition(NoMission,1483)
	MisBeginCondition(HasRecord,1468)
	MisBeginCondition(NoRecord,1483)
	MisBeginAction(AddMission,1483)
	MisCancelAction(ClearMission, 1483)
	
	MisNeed(MIS_NEED_DESP, "等级达到75级")
	MisHelpTalk("<t>当然,75级对我来说不成问题.")
	MisResultTalk("<t>看来你已经经历了成长的磨练,收获不少哦,这枚等级勋章是你的了.")

	MisResultCondition(HasMission, 1483)
	MisResultCondition(NoRecord,1483)
	MisResultCondition(LvCheck, ">", 74 )
	MisResultAction(ClearMission, 1483)
	MisResultAction(SetRecord,  1483 )
	MisResultAction(GiveItem, 2570, 1, 4)
	MisResultBagNeed(1)

	-------------------------------------------------荣誉英雄----------海事所助理·罗拉娜	----------船长
	DefineMission (5814, "温情巨蟹之荣誉英雄", 1484)
	
	MisBeginTalk("<t>亲爱的朋友,有一点你必须要知道,海盗世界最重要的就是荣誉!祖先为此付出一切赢得尊敬,你一定要继承下去.")

	MisBeginCondition(NoMission,1484)
	MisBeginCondition(HasRecord,1468)
	MisBeginCondition(NoRecord,1484)
	MisBeginAction(AddMission,1484)
	MisCancelAction(ClearMission, 1484)
	
	MisNeed(MIS_NEED_DESP, "获得1200点荣誉点数")
	MisHelpTalk("<t>去为荣誉而战吧!")
	MisResultTalk("<t>你是个很不错的荣誉之子.")

	MisResultCondition(HasMission, 1484)
	MisResultCondition(NoRecord,1484)
	MisResultCondition(HasHonorPoint,1200 )
	MisResultAction(TakeHonorPoint, 1200 )
	MisResultAction(ClearMission, 1484)
	MisResultAction(SetRecord,  1484 )
	MisResultAction(GiveItem, 2571, 1, 4)
	MisResultBagNeed(1)	


	-------------------------------------------------采集大使----------海事所助理·罗拉娜	----------船长	
	DefineMission (5815, "温情巨蟹之采集大使", 1485)
	
	MisBeginTalk("<t>成功是需要平时的积累的哦!洞察力也是关键.现在我需要你去收集一些东西... ")

	MisBeginCondition(NoMission,1485)
	MisBeginCondition(HasRecord,1468)
	MisBeginCondition(NoRecord,1485)
	MisBeginAction(AddMission,1485)
	MisBeginAction(AddTrigger, 14851, TE_GETITEM, 1693, 30 )-------------------蝎甲30个
	MisBeginAction(AddTrigger, 14852, TE_GETITEM, 2677, 30 )-------------------链弹LV1 30个          
	MisBeginAction(AddTrigger, 14853, TE_GETITEM, 3909, 10 )-----------------食神水饺10个               
	MisBeginAction(AddTrigger, 14854, TE_GETITEM, 2589, 10 )----------------精灵王辉印10               
	MisBeginAction(AddTrigger, 14855, TE_GETITEM, 3094, 20)------------------努力增幅器20个         
	MisBeginAction(AddTrigger, 14856, TE_GETITEM, 3827, 1 )-----------------情之殇1     
	MisBeginAction(AddTrigger, 14857, TE_GETITEM, 0271, 2 )-----------------天使骰子2个         
	MisCancelAction(ClearMission, 1485)
	

	MisNeed(MIS_NEED_ITEM, 1693, 30,  1, 30 )
	MisNeed(MIS_NEED_ITEM, 2677, 30, 31, 30 )
	MisNeed(MIS_NEED_ITEM, 3909, 10, 61, 10 )
	MisNeed(MIS_NEED_ITEM, 2589, 10, 71, 10 )
	MisNeed(MIS_NEED_ITEM, 3094, 20, 81, 20 )
	MisNeed(MIS_NEED_ITEM, 3827, 1,  101, 1 )
	MisNeed(MIS_NEED_ITEM, 0271, 2,  102, 2 )

	MisHelpTalk("<t>需要的东西不是很多,但是也不是那么容易哦.")
	MisResultTalk("<t>物到用时方恨少吧,积累的过程虽然比较麻烦,但是如果要做个大人物,细心积累和观察都是不可缺少的哦,当然,还有超强的耐心和毅力!")

	MisResultCondition(HasMission, 1485)
	MisResultCondition(NoRecord,1485)
	MisResultCondition(HasItem, 1693, 30 )
	MisResultCondition(HasItem, 2677, 30 )
	MisResultCondition(HasItem, 3909, 10 )
	MisResultCondition(HasItem, 2589, 10 )
	MisResultCondition(HasItem, 3094, 20 )
	MisResultCondition(HasItem, 3827, 1 )
	MisResultCondition(HasItem, 0271, 2 )

	MisResultAction(TakeItem, 1693, 30 )
	MisResultAction(TakeItem, 2677, 30 )
	MisResultAction(TakeItem, 3909, 10 )
	MisResultAction(TakeItem, 2589, 10 )
	MisResultAction(TakeItem, 3094, 20 )
	MisResultAction(TakeItem, 3827, 1 )
	MisResultAction(TakeItem, 0271, 2 )

	MisResultAction(ClearMission, 1485)
	MisResultAction(SetRecord,  1485 )
	MisResultAction(GiveItem, 2572, 1, 4)
	MisResultAction(GiveItem, 2576, 1, 4)
	MisResultBagNeed(2)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1693)	
	TriggerAction( 1, AddNextFlag, 1485, 1, 30 )
	RegCurTrigger( 14851 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2677)	
	TriggerAction( 1, AddNextFlag, 1485, 31, 30 )
	RegCurTrigger( 14852 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3909)	
	TriggerAction( 1, AddNextFlag, 1485, 61, 10 )
	RegCurTrigger( 14853 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2589)	
	TriggerAction( 1, AddNextFlag, 1485, 71, 10 )
	RegCurTrigger( 14854 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3094)	
	TriggerAction( 1, AddNextFlag, 1485, 81, 20 )
	RegCurTrigger( 14855 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3827)	
	TriggerAction( 1, AddNextFlag, 1485,101, 1 )
	RegCurTrigger( 14856 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0271)	
	TriggerAction( 1, AddNextFlag, 1485,102, 2 )
	RegCurTrigger( 14857 )


	----------------------------------------------------------社交大使----------海事所助理·罗拉娜
	DefineMission( 5816, "社交大使1", 1486 )
	MisBeginTalk("<t>成功的人还需要有出色的社交能力哦,就像我,朋友遍及各个城镇,但是由于海事公务的繁忙,我都好久没有问候他们了,如果你想要探索勋章就替我问候他们吧.")
				
	MisBeginCondition(NoMission, 1486)
	MisBeginCondition(NoRecord,1486)
	MisBeginCondition(HasRecord, 1469)
	MisBeginAction(AddMission,1486)
	MisCancelAction(ClearMission, 1486)

	MisNeed(MIS_NEED_DESP, "找春风镇的铁匠·武鑫(3316,2516)聊聊")
	
	MisHelpTalk("<t>快去吧,我迫不及待告诉他们我很想念他们.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使-----------------铁匠·武鑫

	DefineMission(5817, "社交大使1", 1486, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>海事所助理·罗拉娜?天呢,真的好久都没有见面了呢,她一定还记得我出色的手艺吧.")
	MisResultCondition(NoRecord, 1486)
	MisResultCondition(HasMission,1486)
	MisResultAction(ClearMission,1486)
	MisResultAction(SetRecord, 1486)

	----------------------------------------------------------社交大使2----------铁匠·武鑫
	DefineMission( 5818, "TOP Ambassador 2", 1487 )
	MisBeginTalk("<t>我一直非常欣赏罗拉娜,她从来不会因为自己的地位而自满,所以她的朋友很多哦,龙女和我当初是一起有幸结识这位可爱的女士的.")
				
	MisBeginCondition(NoMission, 1487)
	MisBeginCondition(NoRecord,1487)
	MisBeginCondition(HasRecord, 1486)
	MisBeginAction(AddMission,1487)
	MisCancelAction(ClearMission, 1487)

	MisNeed(MIS_NEED_DESP, "找春风镇的客栈老板·龙女(3302,2501)聊聊")
	
	MisHelpTalk("<t>随时欢迎你和罗拉娜来我这里打造极品装备哦.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使2-------------客栈老板·龙女
	DefineMission(5819, "TOP Ambassador 2", 1487, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你好,年轻人,需要住店吗?")
	MisResultCondition(NoRecord, 1487)
	MisResultCondition(HasMission,1487)
	MisResultAction(ClearMission,1487)
	MisResultAction(SetRecord, 1487)

	----------------------------------------------------------社交大使3----------客栈老板·龙女
	DefineMission( 5820, "TOP Ambassador 3", 1488 )
	MisBeginTalk("<t>你认识罗拉娜?太好了,她是我的朋友!还记得她当初偶然来到我的客栈时的情景呢,她豪爽的性格让我们很快成为了朋友.我们还经常手牵手去杂货商人·鲁娜儿那里购物呢!")
				
	MisBeginCondition(NoMission, 1488)
	MisBeginCondition(NoRecord,1488)
	MisBeginCondition(HasRecord, 1487)
	MisBeginAction(AddMission,1488)
	MisCancelAction(ClearMission, 1488)

	MisNeed(MIS_NEED_DESP, "找春风镇的杂货商人·鲁娜儿(3279,2501)聊聊")
	
	MisHelpTalk("<t>鲁娜儿是一个精明的商人,但不吝啬,呵呵..")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使3--------杂货商人·鲁娜儿
	DefineMission(5821, "TOP Ambassador 3", 1488, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>龙女经常来我这里购物,可惜很久没有看到她和罗拉娜一起来了哦,我很想念她呢,如果她再次光临,我一定给她最大的折扣.")
	MisResultCondition(NoRecord, 1488)
	MisResultCondition(HasMission,1488)
	MisResultAction(ClearMission,1488)
	MisResultAction(SetRecord, 1488)

	----------------------------------------------------------社交大使4----------杂货商人·鲁娜儿
	DefineMission( 5822, "TOP Ambassador 4", 1489 )
	MisBeginTalk("<t>那次我在野外跑商,结果碰到了可怕的海盗霍金斯,我以为我就这样完了!是罗拉娜救了我!后来竟然连霍金斯都害怕罗拉娜,不敢到镇里来捣乱了.")
				
	MisBeginCondition(NoMission, 1489)
	MisBeginCondition(NoRecord,  1489)
	MisBeginCondition(HasRecord, 1488)
	MisBeginAction(AddMission, 1489)
	MisCancelAction(ClearMission, 1489)

	MisNeed(MIS_NEED_DESP, "找寂寞之塔的霍金斯(513,269)聊聊")
	
	MisHelpTalk("<t>面对这样的海盗你要小心哦,如果有危险就说你是罗拉娜的朋友!")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使4--------霍金斯
	DefineMission(5823, "TOP Ambassador 4", 1489, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>哼哼,小样哪里来的啊?要想过此路,留下所有钱!额...你是罗拉娜的朋友啊.最近我都没干什么坏事,我几乎已经要结束我的海盗生活了.")
	MisResultCondition(NoRecord, 1489)
	MisResultCondition(HasMission,1489)
	MisResultAction(ClearMission,1489)
	MisResultAction(SetRecord, 1489)


	----------------------------------------------------------社交大使5----------霍金斯
	DefineMission( 5824, "TOP Ambassador 5", 1490 )
	MisBeginTalk("<t>虽然身为海盗,但是我不得不钦佩罗拉娜的胆识和智慧,为了朋友她可以面对一切危险,我们身为海盗最看重的就是义气了!嘿嘿.当时的情况?你可以去问那个贸易商人.")
				
	MisBeginCondition(NoMission, 1490)
	MisBeginCondition(NoRecord,  1490)
	MisBeginCondition(HasRecord, 1489)
	MisBeginAction(AddMission,1490)
	MisCancelAction(ClearMission, 1490)

	MisNeed(MIS_NEED_DESP, "找春风镇的贸易商人·油李(3195,2506)聊聊")
	
	MisHelpTalk("<t>贸易商人·油李是个喜欢耍小聪明的商人.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使5--------贸易商人·油李
	DefineMission(5825, "TOP Ambassador 5", 1490, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>咳咳,像我这样的商人要和各种人物打交道,特别是像海盗这样的角色,当然要头脑灵活啦,那个不算耍小聪明吧?")
	MisResultCondition(NoRecord, 1490)
	MisResultCondition(HasMission,1490)
	MisResultAction(ClearMission,1490)
	MisResultAction(SetRecord, 1490)


	----------------------------------------------------------社交大使6----------贸易商人·油李
	DefineMission( 5826, "TOP Ambassador 6", 1491)
	MisBeginTalk("<t>说起那次经历,真是可怕!幸运的是我也得到了罗拉娜的帮助,才摆脱了海盗的纠缠,否则我所有的家当都被抢了!当时他们可都拿着锋利的武器啊!罗拉娜救了我,还让传送使·春莉送我到了安全的地方,自己独自面对那么多坏蛋.")
				
	MisBeginCondition(NoMission, 1491)
	MisBeginCondition(NoRecord,1491)
	MisBeginCondition(HasRecord, 1490)
	MisBeginAction(AddMission,1491)
	MisCancelAction(ClearMission, 1491)

	MisNeed(MIS_NEED_DESP, "找传送使·春莉(3326,2511)聊聊")
	
	MisHelpTalk("<t>春莉也是罗拉娜的朋友呢.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使6--------传送使·春莉
	DefineMission(5827, "TOP Ambassador 6", 1491, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你好,帮助人会使自己也变得快乐哦.")
	MisResultCondition(NoRecord, 1491)
	MisResultCondition(HasMission,1491)
	MisResultAction(ClearMission,1491)
	MisResultAction(SetRecord, 1491)


	----------------------------------------------------------社交大使7----------传送使·春莉
	DefineMission( 5828, "TOP Ambassador 7", 1492 )
	MisBeginTalk("<t>那次送油李回来的的确是我.我从罗拉娜那里学会了助人为乐,帮助别人真的是件很快乐的事情呢,有机会我还要从她身上学到更多东西!听说算命先生·算破天也和罗拉娜接触过.")
				
	MisBeginCondition(NoMission, 1492)
	MisBeginCondition(NoRecord,1492)
	MisBeginCondition(HasRecord, 1491)
	MisBeginAction(AddMission,1492)
	MisCancelAction(ClearMission, 1492)

	MisNeed(MIS_NEED_DESP, "找春风镇的算命先生·算破天(3262,2502)聊聊")
	
	MisHelpTalk("<t>算命先生·算破天以前是个只相信命运的人.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使7--------算命先生·算破天
	DefineMission(5829, "TOP Ambassador 7", 1492, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我以前的确是个只相信命运的人,但是罗拉娜使我明白了命运是可以靠自己改变的,我现在给人算命是为了让大家防范于未然,创造自己更好的未来.")
	MisResultCondition(NoRecord, 1492)
	MisResultCondition(HasMission,1492)
	MisResultAction(ClearMission,1492)
	MisResultAction(SetRecord, 1492)


	----------------------------------------------------------社交大使8----------算命先生·算破天
	DefineMission( 5830, "TOP Ambassador 8", 1493 )
	MisBeginTalk("<t>上次给酒店老板·裴蒂算命的时候,我告诉他将有贵人相助,没想到后来他告诉我他的贵人就是罗拉娜!呵呵.")
				
	MisBeginCondition(NoMission, 1493)
	MisBeginCondition(NoRecord,  1493)
	MisBeginCondition(HasRecord, 1492)
	MisBeginAction(AddMission,1493)
	MisCancelAction(ClearMission, 1493)

	MisNeed(MIS_NEED_DESP, "找酒店老板·裴蒂(3287,2501)聊聊")
	
	MisHelpTalk("<t>带我向罗拉娜问好!")
	MisResultCondition(AlwaysFailure)
	
	-----------------------------------------社交大使8--------酒店老板·裴蒂
	DefineMission(5831, "TOP Ambassador 8", 1493, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>罗拉娜真是我的贵人,当时我们酒店的生意并不怎么样,你知道,这里只是一个小镇,后来是罗拉娜介绍了很多旅行的人来光顾我.")
	MisResultCondition(NoRecord, 1493)
	MisResultCondition(HasMission,1493)
	MisResultAction(ClearMission,1493)
	MisResultAction(SetRecord, 1493)


	----------------------------------------------------------社交大使9----------酒店老板·裴蒂
	DefineMission( 5832, "TOP Ambassador 9", 1494 )
	MisBeginTalk("<t>那次罗拉娜是来找港口指挥·霜奇谈公事的....")
				
	MisBeginCondition(NoMission, 1494)
	MisBeginCondition(NoRecord,  1494)
	MisBeginCondition(HasRecord, 1493)
	MisBeginAction(AddMission,1494)
	MisCancelAction(ClearMission, 1494)

	MisNeed(MIS_NEED_DESP, "找港口指挥·霜奇(3409,2560)聊聊")
	
	MisHelpTalk("<t>港口指挥·霜奇是个敬公职守的人.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使9--------港口指挥·霜奇
	DefineMission(5833, "TOP Ambassador 9", 1494, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>欢迎你来到春风镇,这里虽然是小镇,但是这里的人都很好客哦!罗拉娜上次过来是来视察这里的工作的.")
	MisResultCondition(NoRecord, 1494)
	MisResultCondition(HasMission,1494)
	MisResultAction(ClearMission,1494)
	MisResultAction(SetRecord, 1494)

	----------------------------------------------------------社交大使10----------港口指挥·霜奇
	DefineMission( 5834, "TOP Ambassador 10", 1495 )
	MisBeginTalk("<t>罗拉娜真是一个好人,一点都没有高高在上的架子,她对我的工作给予了肯定,太令人高兴了.而且她还很关心下属呢,后来她还去慰问了卫兵·赵钱孙.")
				
	MisBeginCondition(NoMission, 1495)
	MisBeginCondition(NoRecord, 1495)
	MisBeginCondition(HasRecord, 1494)
	MisBeginAction(AddMission, 1495)
	MisCancelAction(ClearMission, 1495)

	MisNeed(MIS_NEED_DESP, "找卫兵·赵钱孙(3303,2533)聊聊")
	
	MisHelpTalk("<t>我想上级的慰问对于下属是很好的鼓舞吧...")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使10--------卫兵·赵钱孙
	DefineMission(5835, "TOP Ambassador 10", 1495, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你好，你是远道而来的旅客吧.你认识罗拉娜?哈哈,罗拉娜小姐亲自来看过我哦!太幸福了!")
	MisResultCondition(NoRecord, 1495)
	MisResultCondition(HasMission,1495)
	MisResultAction(ClearMission,1495)
	MisResultAction(SetRecord, 1495)

	----------------------------------------------------------社交大使11----------卫兵·赵钱孙
	DefineMission( 5836, "TOP Ambassador 11", 1496 )
	MisBeginTalk("<t>罗拉娜是个温柔体贴的人,那天她特地来慰问了我和周吴郑.")
				
	MisBeginCondition(NoMission, 1496)
	MisBeginCondition(NoRecord,1496)
	MisBeginCondition(HasRecord, 1495)
	MisBeginAction(AddMission,1496)
	MisCancelAction(ClearMission, 1496)

	MisNeed(MIS_NEED_DESP, "找卫兵·周吴郑(3298,2534)聊聊")
	
	MisHelpTalk("<t>周吴郑和我像亲兄弟一样,下班后我们无所不谈.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使11--------卫兵·周吴郑
	DefineMission(5837, "TOP Ambassador 11", 1496, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>哇哈哈,见到你很高兴罗拉娜的朋友.你从赵钱孙那里过来的?他没有偷懒吧.")
	MisResultCondition(NoRecord, 1496)
	MisResultCondition(HasMission,1496)
	MisResultAction(ClearMission,1496)
	MisResultAction(SetRecord, 1496)

	----------------------------------------------------------社交大使12----------卫兵·周吴郑
	DefineMission( 5838, "TOP Ambassador 12", 1497 )
	MisBeginTalk("<t>别看我只是小小的卫兵,我的交际可是很广的呢,银行总管·王墨也是我的朋友.上次罗拉娜小姐来慰问我,闲聊到她有一些东西需要找地方寄放,这样才能专心视察工作,我引荐王墨给罗拉娜小姐认识了.")
				
	MisBeginCondition(NoMission, 1497)
	MisBeginCondition(NoRecord,1497)
	MisBeginCondition(HasRecord, 1496)
	MisBeginAction(AddMission,1497)
	MisCancelAction(ClearMission, 1497)

	MisNeed(MIS_NEED_DESP, "找银行总管·王墨(3290,2512)聊聊")
	
	MisHelpTalk("<t>银行总管·王墨是行事谨慎的人.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使12--------银行总管·王墨
	DefineMission(5839, "TOP Ambassador 12", 1497, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>罗拉娜一定觉得我是值得信任的人,所以将她贵重的物品寄放在我这里,不过你千万不要告诉别人哦,罗拉娜小姐下次来一定会十分满意我们的服务的.")
	MisResultCondition(NoRecord, 1497)
	MisResultCondition(HasMission,1497)
	MisResultAction(ClearMission,1497)
	MisResultAction(SetRecord, 1497)


	----------------------------------------------------------社交大使13----------银行总管·王墨
	DefineMission( 5840, "TOP Ambassador 13", 1498 )
	MisBeginTalk("<t>虽然罗拉娜是来视察的,但是既然来到了我们美丽的小镇,自然要好好体验和享受一下这里的风土人情啦,我让流云陪罗拉娜小姐到处逛逛.")
				
	MisBeginCondition(NoMission, 1498)
	MisBeginCondition(NoRecord,1498)
	MisBeginCondition(HasRecord, 1497)
	MisBeginAction(AddMission,1498)
	MisCancelAction(ClearMission, 1498)

	MisNeed(MIS_NEED_DESP, "找青年男子·流云(3275,2467)聊聊")
	
	MisHelpTalk("<t>青年男子·流云是个充满活力的小伙子.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使13--------青年男子·流云
	DefineMission(5841, "TOP Ambassador 13", 1498, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>嘿,朋友!有什么可以帮助你的吗?我号称是春风镇的导游哦.")
	MisResultCondition(NoRecord, 1498)
	MisResultCondition(HasMission,1498)
	MisResultAction(ClearMission,1498)
	MisResultAction(SetRecord, 1498)

	----------------------------------------------------------社交大使14----------青年男子·流云
	DefineMission( 5842, "TOP Ambassador 14", 1499 )
	MisBeginTalk("<t>是哦,上次罗拉娜来我们春风镇就是我和水雾带她到处游玩的呢!话说回来,她也是一个开朗的人,和我们一起玩的很投机.")
				
	MisBeginCondition(NoMission, 1499)
	MisBeginCondition(NoRecord,1499)
	MisBeginCondition(HasRecord, 1498)
	MisBeginAction(AddMission,1499)
	MisCancelAction(ClearMission, 1499)

	MisNeed(MIS_NEED_DESP, "找青年女子·水雾(3241,2533)聊聊")
	
	MisHelpTalk("<t>其实...每天能够和水雾在一起是我一直以来的愿望...")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使14--------青年女子·水雾        
	DefineMission(5843, "TOP Ambassador 14", 1499, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>是流云让你来找我的吗?他...他是个好人.其实如果他能够在事业上有所成就并且温柔体贴些,那该多好.我只对罗拉娜说过心里的想法...")
	MisResultCondition(NoRecord, 1499)
	MisResultCondition(HasMission,1499)
	MisResultAction(ClearMission,1499)
	MisResultAction(SetRecord, 1499)

	----------------------------------------------------------社交大使15----------青年女子·水雾
	DefineMission( 5844, "TOP Ambassador 15", 1601 )
	MisBeginTalk("<t>对我来说,罗拉娜就像一个大姐姐一样,我什么话都愿意对她说.我好想她哦,我有好多话想和她说呢.现在只有王蓉阿姨能够陪我说说话.")
				
	MisBeginCondition(NoMission, 1601)
	MisBeginCondition(NoRecord,1601)
	MisBeginCondition(HasRecord, 1499)
	MisBeginAction(AddMission,1601)
	MisCancelAction(ClearMission, 1601)

	MisNeed(MIS_NEED_DESP, "找中年女子·王蓉(3265,2547)聊聊")
	
	MisHelpTalk("<t>黄蓉,是个中年女子.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使15-------- 中年女子·王蓉
	DefineMission(5845, "TOP Ambassador 15", 1601, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>水雾这小丫头是很多愁善感的女孩,她倒是一直念叨着罗拉娜呢,她很希望自己能有这样一个姐姐.我是很喜欢这个小丫头,所以经常陪她聊天.")
	MisResultCondition(NoRecord, 1601)
	MisResultCondition(HasMission,1601)
	MisResultAction(ClearMission,1601)
	MisResultAction(SetRecord, 1601)


	----------------------------------------------------------社交大使16----------中年女子·王蓉
	DefineMission( 5846, "TOP Ambassador 16", 1602 )
	MisBeginTalk("<t>哈,你是专程来替罗拉娜问候大家的吗?罗拉娜真是有心啊,谢谢你.对了,比盖也是罗拉娜的朋友.")
				
	MisBeginCondition(NoMission, 1602)
	MisBeginCondition(NoRecord,1602)
	MisBeginCondition(HasRecord, 1601)
	MisBeginAction(AddMission,1602)
	MisCancelAction(ClearMission, 1602)

	MisNeed(MIS_NEED_DESP, "找中年男子·比盖(3235,2550)聊聊")
	
	MisHelpTalk("<t>比盖是个风趣的男人.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使16-------- 中年男子·比盖
	DefineMission(5847, "TOP Ambassador 16", 1602, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>罗拉娜最近可好?罗拉娜的微笑就像天上的太阳一样灿烂,在她的周围总是会有一群朋友,如果有选秀活动,我敢打赌罗拉娜的短信支持率一定最高!")
	MisResultCondition(NoRecord, 1602)
	MisResultCondition(HasMission,1602)
	MisResultAction(ClearMission,1602)
	MisResultAction(SetRecord, 1602)


	----------------------------------------------------------社交大使17----------中年男子·比盖
	DefineMission( 5848, "TOP Ambassador 17", 1502 )
	MisBeginTalk("<t>什么?你问我为什么?如果我告诉你连东方海盗·铃佐田山都是罗拉娜的朋友的话,你应该没有疑问了吧.")
				
	MisBeginCondition(NoMission, 1502)
	MisBeginCondition(NoRecord,1502)
	MisBeginCondition(HasRecord, 1602)
	MisBeginAction(AddMission,1502)
	MisCancelAction(ClearMission, 1502)

	MisNeed(MIS_NEED_DESP, "找东方海盗·铃佐田山(2219,3286)聊聊")
	
	MisHelpTalk("<t>东方海盗·铃佐田山是有名的海盗,曾经驰骋东方海域.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使17-------- 东方海盗·铃佐田山
	DefineMission(5849, "TOP Ambassador 17", 1502, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>空尼齐哇，没想到你是罗拉娜的朋友,说起来连我都不敢相信竟然能够和海事助理成为朋友,并且我们达成了协议,我不会袭击罗拉娜管辖范围的船只.")
	MisResultCondition(NoRecord, 1502)
	MisResultCondition(HasMission,1502)
	MisResultAction(ClearMission,1502)
	MisResultAction(SetRecord, 1502)

	----------------------------------------------------------社交大使18----------东方海盗·铃佐田山
	DefineMission( 5850, "TOP Ambassador 18", 1603 )
	MisBeginTalk("<t>春风镇真是好地方啊,在这里我都几乎忘记了海上的风风雨雨.这里的服饰和发型都和我家乡不一样哦,上次罗拉娜带我去潮流理发师那里设计了一个莫西干发型,哇塞,酷弊了!虽然我是海盗,但是我也是需要包装的嘛,何况我是那么有名的海盗啊,哈哈哈.")
				
	MisBeginCondition(NoMission, 1603)
	MisBeginCondition(NoRecord,1603)
	MisBeginCondition(HasRecord, 1502)
	MisBeginAction(AddMission,1603)
	MisCancelAction(ClearMission, 1603)

	MisNeed(MIS_NEED_DESP, "找潮流理发师(3300,2513)聊聊")
	
	MisHelpTalk("<t>潮流理发师是思想前卫,设计出众的发型设计师.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使18-------- 潮流理发师
	DefineMission(5851, "TOP Ambassador 18", 1603, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>哈哈,你说的是上次罗拉娜带来的那个奇怪的海盗吧,他对我给他设计的发型很满意吧!")
	MisResultCondition(NoRecord, 1603)
	MisResultCondition(HasMission,1603)
	MisResultAction(ClearMission,1603)
	MisResultAction(SetRecord, 1603)

	----------------------------------------------------------社交大使19----------潮流理发师
	DefineMission( 5852, "TOP Ambassador 19", 1604 )
	MisBeginTalk("<t>啊,原来你是专程替罗拉娜来问候她的朋友的啊,你去过港口指挥·霜奇那里了?那有没有去过海港指挥·夏青那里呢?对了,记得向我替罗拉娜问好,顺便告诉她我为她专门设计了一个发型,绝对适合她的气质!")
				
	MisBeginCondition(NoMission, 1604)
	MisBeginCondition(NoRecord,1604)
	MisBeginCondition(HasRecord, 1603)
	MisBeginAction(AddMission,1604)
	MisCancelAction(ClearMission, 1604)

	MisNeed(MIS_NEED_DESP, "找海港指挥·夏青(3685,2652)聊聊")
	
	MisHelpTalk("<t>海港指挥·夏青是一个喜欢幻想的人.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使19-------- 海港指挥·夏青
	DefineMission(5853, "TOP Ambassador 19", 1604, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>哈喽,看看这大海,多迷人啊!我每天都会和它聊天,额...你会觉得我有什么不妥吗?那天罗拉娜看到我在和大海说话都没有觉得奇怪,她真是一个特别的人,好像能够看透我的心.")
	MisResultCondition(NoRecord, 1604)
	MisResultCondition(HasMission,1604)
	MisResultAction(ClearMission,1604)
	MisResultAction(SetRecord, 1604)


	----------------------------------------------------------社交大使20----------海港指挥·夏青
	DefineMission( 5854, "TOP Ambassador 20", 1605 )
	MisBeginTalk("<t>我一直以为除了海港指挥·夏云以外,没有人能够理解我为什么对大海说话呢.对了,说起夏云,他也觉得罗拉娜是个特别的人,甚至整天在我耳边提起罗拉娜呢,嘿嘿.")
				
	MisBeginCondition(NoMission, 1605)
	MisBeginCondition(NoRecord,1605)
	MisBeginCondition(HasRecord, 1604)
	MisBeginAction(AddMission,1605)
	MisCancelAction(ClearMission, 1605)

	MisNeed(MIS_NEED_DESP, "找海港指挥·夏云(3337,3523)聊聊")
	
	MisHelpTalk("<t>夏青是个拥有远大理想和抱负的海港指挥,可是没有人认为他的愿望能够实现.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交大使20-------- 海港指挥·夏云
	DefineMission(5855, "TOP Ambassador 20", 1605, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你见过夏青了啊.什么,他告诉你我一直提起罗拉娜了?呵呵,说实话,罗拉娜是能够给人留下深刻印象的人哦.做这个小镇的海港指挥那么多年了,第一次有人认同我的理想...因为我想有一天能够自己拥有一支舰队去对付所有的海盗.")
	MisResultCondition(NoRecord, 1605)
	MisResultCondition(HasMission,1605)
	MisResultAction(ClearMission,1605)
	MisResultAction(SetRecord, 1605)

	----------------------------------------------------------社交大使21----------海港指挥·夏云
	DefineMission( 5856, "TOP Ambassador 21", 1606 )
	MisBeginTalk("<t>你已经问候了所有这里罗拉娜的朋友了?我欣赏你的责任心.千万不要忘记把我的祝福带给罗拉娜哦,如果她能够尽快来看我们,我一定第一时间迎接她.我们都很想念她!对了,请代表春风镇的朋友将这个礼物带给罗拉娜,看到它要想到我们哦.")
				
	MisBeginCondition(NoMission, 1606)
	MisBeginCondition(NoRecord,1606)
	MisBeginCondition(HasRecord, 1605)
	MisBeginAction(AddMission,1606)
	MisCancelAction(ClearMission, 1606)

	MisNeed(MIS_NEED_DESP, "找白银城海事所助理·罗拉娜(2247,2858)聊聊")
	
	MisHelpTalk("<t>麻烦你将我们的礼物带给罗拉娜.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------社交英雄21------- 海事所助理·罗拉娜
	DefineMission(5857, "Community Hero 21", 1606, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你真的帮我问候了春风镇所有的朋友了,太感谢你了,竟然还带来了礼物!啊,真不知道如何感谢你,这枚勋章你受之无愧.")
	MisResultCondition(NoRecord, 1606)
	MisResultCondition(HasMission,1606)
	MisResultAction(ClearMission,1606)
	MisResultAction(SetRecord, 1606)
	MisResultAction(GiveItem, 2573, 1, 4)
	MisResultBagNeed(1)


	-------------------------------------------------特别任务一--------海事所助理·罗拉娜
	DefineMission (5858, "巨蟹之特别行动一", 1607)
	
	MisBeginTalk("<t>嘿,就这样满足于你的成绩了吗?呵呵,如果你还有足够的信心的话,去冰狼堡找路人·丁吧,他将给你特别的考验.")

	MisBeginCondition(NoMission,1607)
	MisBeginCondition(NoRecord,1607)
	MisBeginCondition(HasRecord,1468)
	MisBeginCondition(HasRecord,1481)
	MisBeginCondition(HasRecord,1482)
	MisBeginCondition(HasRecord,1483)
	MisBeginCondition(HasRecord,1484)
	MisBeginCondition(HasRecord,1485)
	MisBeginCondition(HasRecord,1475)
	MisBeginCondition(HasRecord,1606)
	MisBeginAction(AddMission,1607)
	MisCancelAction(ClearMission, 1607)
	MisBeginBagNeed(1)
	
	MisNeed(MIS_NEED_DESP, "找冰狼堡的路人·丁(1335,469)聊聊")
	MisHelpTalk("<t>要想知道有什么特别任务等待着你，就赶快去找路人·丁吧.")

	MisResultCondition(AlwaysFailure)	


	-------------------------------------------------特别任务一--------冰狼堡的路人·丁
	DefineMission (5859, "巨蟹之特别行动一", 1607, COMPLETE_SHOW)

	MisBeginCondition(AlwaysFailure )

	MisResultTalk("<t>你已经通过罗拉娜给你的任务了吗?真了不起,别看我看上去是个不起眼的路人,其实我是隐藏级别的人物哦!哼哼!连我的名字都隐藏的那么巧妙,很酷吧!那么来看看你是否有能力完成我给你的特别任务吧..")	
	MisResultCondition(NoRecord, 1607)
	MisResultCondition(HasMission,1607)
	MisResultAction(ClearMission,1607)
	MisResultAction(SetRecord, 1607)


	--------------------------------------特别任务二----冰狼堡的路人·丁

	DefineMission(5860, "巨蟹之特别行动二", 1608 )	
	
	MisBeginTalk("<t>这个任务是巨蟹宫特别行动,你可以不参加,但是就没有特别的礼物哦.如果你真的拥有实力和勇气,那么就接受挑战吧.我这里有十分重要的东西需要你尽快送到海港指挥·瓦雷米那里.<b15分钟内赶到哈尔补给站找海港指挥·瓦雷米(2041,1355)>聊聊.")

	MisBeginCondition(NoMission,1608)
	MisBeginCondition(NoRecord,1608)
	MisBeginCondition(HasRecord,1607)
	MisBeginAction(AddMission,1608)
	MisBeginAction(AddChaItem3, 2952)---------巨蟹特别行动卡
	MisCancelAction(ClearMission, 1608)
	MisBeginBagNeed(1)
	
	MisNeed(MIS_NEED_DESP, "找海港指挥·瓦雷米(2041,1355)聊聊")
	MisHelpTalk("<t>Go now! You only have 15 minutes")

	MisResultCondition(AlwaysFailure)	

	--------------------------------------特别任务二----海港指挥·瓦雷米

	DefineMission(5861, "巨蟹之特别行动二", 1608, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )

	MisResultTalk("<t>哈哈，非常感谢你.我等这个东西好久啦.恩...他们带信告诉我你是一个拥有强大潜力的可造之才.来,送你一份礼物,希望能够帮助你尽快强大起来.")
	MisResultCondition(HasMission, 1608)
	MisResultCondition(NoRecord,1608)
	MisResultAction(AddChaItem4, 2952)----特别行动卡
	MisResultAction(ClearMission, 1608)
	MisResultAction(SetRecord,  1608 )
	MisResultAction(GiveItem, 2575, 1, 4)------------巨蟹船长酷装宝箱
	MisResultBagNeed(1)

-------------------------------------------------巨蟹之水手过关奖励----------海事所助理·罗拉娜
	DefineMission (5862, "巨蟹之水手过关奖励", 1609)
	
	MisBeginTalk("<t>集齐7枚勋章就可以在我这里兑换到巨蟹宫守印和狮子宫的门票了.还有很多奖励哦 ")

	MisBeginCondition(NoMission,1609)
	MisBeginCondition(HasRecord,1466)
	MisBeginCondition(HasRecord,1470)
	MisBeginCondition(HasRecord,1471)
	MisBeginCondition(HasRecord,1472)
	MisBeginCondition(HasRecord,1473)
	MisBeginCondition(HasRecord,1474)
	MisBeginCondition(HasRecord,1475)
	MisBeginCondition(HasRecord,1606)
	MisBeginCondition(NoRecord,1609)
	MisBeginAction(AddMission,1609)  
	MisBeginAction(AddTrigger, 16091, TE_GETITEM, 2568, 1 )		
	MisBeginAction(AddTrigger, 16092, TE_GETITEM, 2569, 1 )		
	MisBeginAction(AddTrigger, 16093, TE_GETITEM, 2570, 1 )		
 	MisBeginAction(AddTrigger, 16094, TE_GETITEM, 2571, 1 )		
	MisBeginAction(AddTrigger, 16095, TE_GETITEM, 2572, 1 )		
	MisBeginAction(AddTrigger, 16096, TE_GETITEM, 2573, 1 )		
	MisBeginAction(AddTrigger, 16097, TE_GETITEM, 2574, 1 )	
	MisCancelAction(ClearMission, 1609)						                                     
	
	MisNeed(MIS_NEED_ITEM, 2568, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 2569, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 2570, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 2571, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 2572, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 2573, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 2574, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>下一宫是狮子宫,有更诱人的奖励和更刺激的挑战在等你.")

	MisResultCondition(HasMission, 1609)
	MisResultCondition(NoRecord,1609)
	MisResultCondition(HasItem, 2568, 1 )
	MisResultCondition(HasItem, 2569, 1 )
	MisResultCondition(HasItem, 2570, 1 )
	MisResultCondition(HasItem, 2571, 1 )
	MisResultCondition(HasItem, 2572, 1 )
	MisResultCondition(HasItem, 2573, 1 )
	MisResultCondition(HasItem, 2574, 1 )

	MisResultAction(TakeItem, 2568, 1 )
	MisResultAction(TakeItem, 2569, 1 )
	MisResultAction(TakeItem, 2570, 1 )
	MisResultAction(TakeItem, 2571, 1 )
	MisResultAction(TakeItem, 2572, 1 )
	MisResultAction(TakeItem, 2573, 1 )
	MisResultAction(TakeItem, 2574, 1 )

	MisResultAction(ClearMission, 1609)
	MisResultAction(SetRecord,  1609 )
	MisResultAction(GiveItem, 2273, 1, 4)
	MisResultAction(GiveItem, 2274, 1, 4)
	MisResultAction(GiveItem, 3877, 1, 4)
	MisResultAction(AddMoney,1000000,1000000)
	MisResultAction(ShuangZiSS)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 1874)	
	TriggerAction( 1, AddNextFlag, 1609, 10, 1 )
	RegCurTrigger( 16091 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1875)	
	TriggerAction( 1, AddNextFlag, 1609, 20, 1 )
	RegCurTrigger( 16092 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1876)	
	TriggerAction( 1, AddNextFlag, 1609, 30, 1 )
	RegCurTrigger( 16093 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1877)	
	TriggerAction( 1, AddNextFlag, 1609, 40, 1 )
	RegCurTrigger( 16094 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1878)	
	TriggerAction( 1, AddNextFlag, 1609, 50, 1 )
	RegCurTrigger( 16095 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1879)	
	TriggerAction( 1, AddNextFlag, 1609, 60, 1 )
	RegCurTrigger( 16096 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1880)	
	TriggerAction( 1, AddNextFlag, 1609, 70, 1 )
	RegCurTrigger( 16097 )
----------------------------------------------巨蟹之海盗过关奖励----------海事所助理·罗拉娜	
	DefineMission (5863, "巨蟹之海盗过关奖励", 1610)
	
	MisBeginTalk("<t>集齐7枚勋章就可以在我这里兑换到巨蟹宫守印和狮子宫的门票了.还有很多奖励哦 ")

	MisBeginCondition(NoMission,1610)
	MisBeginCondition(HasRecord,1467)
	MisBeginCondition(HasRecord,1476)
	MisBeginCondition(HasRecord,1477)
	MisBeginCondition(HasRecord,1600)
	MisBeginCondition(HasRecord,1479)
	MisBeginCondition(HasRecord,1480)
	MisBeginCondition(HasRecord,1475)
	MisBeginCondition(HasRecord,1606)
	MisBeginCondition(NoRecord,1610)
	MisBeginAction(AddMission,1610)
	MisBeginAction(AddTrigger, 16101, TE_GETITEM, 2568, 1 )		
	MisBeginAction(AddTrigger, 16102, TE_GETITEM, 2569, 1 )		
	MisBeginAction(AddTrigger, 16103, TE_GETITEM, 2570, 1 )		
 	MisBeginAction(AddTrigger, 16104, TE_GETITEM, 2571, 1 )		
	MisBeginAction(AddTrigger, 16105, TE_GETITEM, 2572, 1 )		
	MisBeginAction(AddTrigger, 16106, TE_GETITEM, 2573, 1 )		
	MisBeginAction(AddTrigger, 16107, TE_GETITEM, 2574, 1 )		
	MisCancelAction(ClearMission, 1610)						                                     
	
	MisNeed(MIS_NEED_ITEM, 2568, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 2569, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 2570, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 2571, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 2572, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 2573, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 2574, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>下一宫是狮子宫,有更诱人的奖励和更刺激的挑战在等你.")

	MisResultCondition(HasMission, 1610)
	MisResultCondition(NoRecord,1610)
	MisResultCondition(HasItem, 2568, 1 )
	MisResultCondition(HasItem, 2569, 1 )
	MisResultCondition(HasItem, 2570, 1 )
	MisResultCondition(HasItem, 2571, 1 )
	MisResultCondition(HasItem, 2572, 1 )
	MisResultCondition(HasItem, 2573, 1 )
	MisResultCondition(HasItem, 2574, 1 )

	MisResultAction(TakeItem, 2568, 1 )
	MisResultAction(TakeItem, 2569, 1 )
	MisResultAction(TakeItem, 2570, 1 )
	MisResultAction(TakeItem, 2571, 1 )
	MisResultAction(TakeItem, 2572, 1 )
	MisResultAction(TakeItem, 2573, 1 )
	MisResultAction(TakeItem, 2574, 1 )

	MisResultAction(ClearMission, 1610)
	MisResultAction(SetRecord,  1610 )
	MisResultAction(GiveItem, 2273, 1, 4)
	MisResultAction(GiveItem, 2274, 1, 4)
	MisResultAction(GiveItem, 3877, 2, 4)
	MisResultAction(AddMoney,2000000,2000000)
	MisResultAction(ShuangZiHD)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2568)	
	TriggerAction( 1, AddNextFlag, 1610, 10, 1 )
	RegCurTrigger( 16101 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2569)	
	TriggerAction( 1, AddNextFlag, 1610, 20, 1 )
	RegCurTrigger( 16102 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2570)	
	TriggerAction( 1, AddNextFlag, 1610, 30, 1 )
	RegCurTrigger( 16103 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2571)	
	TriggerAction( 1, AddNextFlag, 1610, 40, 1 )
	RegCurTrigger( 16104 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2572)	
	TriggerAction( 1, AddNextFlag, 1610, 50, 1 )
	RegCurTrigger( 16105 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2573)	
	TriggerAction( 1, AddNextFlag, 1610, 60, 1 )
	RegCurTrigger( 16106 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2574)	
	TriggerAction( 1, AddNextFlag, 1610, 70, 1 )
	RegCurTrigger( 16107 )

	--------------------------------------------巨蟹之船长过关奖励----------海事所助理·罗拉娜	
	DefineMission (5864, "巨蟹之船长过关奖励", 1611)
	
	MisBeginTalk("<t>集齐7枚勋章就可以在我这里兑换到巨蟹宫守印和狮子宫的门票了.还有很多奖励哦 ")

	MisBeginCondition(NoMission,1611)
	MisBeginCondition(HasRecord,1468)
	MisBeginCondition(HasRecord,1481)
	MisBeginCondition(HasRecord,1482)
	MisBeginCondition(HasRecord,1483)
	MisBeginCondition(HasRecord,1484)
	MisBeginCondition(HasRecord,1485)
	MisBeginCondition(HasRecord,1475)
	MisBeginCondition(HasRecord,1606)
	MisBeginCondition(NoRecord,1611)
	MisBeginAction(AddMission,1611)   
	MisBeginAction(AddTrigger, 16111, TE_GETITEM, 2568, 1 )		
	MisBeginAction(AddTrigger, 16112, TE_GETITEM, 2569, 1 )		
	MisBeginAction(AddTrigger, 16113, TE_GETITEM, 2570, 1 )		
 	MisBeginAction(AddTrigger, 16114, TE_GETITEM, 2571, 1 )		
	MisBeginAction(AddTrigger, 16115, TE_GETITEM, 2572, 1 )		
	MisBeginAction(AddTrigger, 16116, TE_GETITEM, 2573, 1 )		
	MisBeginAction(AddTrigger, 16117, TE_GETITEM, 2574, 1 )	
	MisCancelAction(ClearMission, 1611)						                                     
	
	MisNeed(MIS_NEED_ITEM, 2568, 1, 10, 1 )
	MisNeed(MIS_NEED_ITEM, 2569, 1, 20, 1 )
	MisNeed(MIS_NEED_ITEM, 2570, 1, 30, 1 )
	MisNeed(MIS_NEED_ITEM, 2571, 1, 40, 1 )
	MisNeed(MIS_NEED_ITEM, 2572, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 2573, 1, 60, 1 )
	MisNeed(MIS_NEED_ITEM, 2574, 1, 70, 1 )
	
	MisHelpTalk("<t>What are you still waiting for? Come now to exchange for prizes")
	MisResultTalk("<t>下一宫是狮子宫,有更诱人的奖励和更刺激的挑战在等你.")

	MisResultCondition(HasMission, 1611)
	MisResultCondition(NoRecord,1611)
	MisResultCondition(HasItem, 2568, 1 )
	MisResultCondition(HasItem, 2569, 1 )
	MisResultCondition(HasItem, 2570, 1 )
	MisResultCondition(HasItem, 2571, 1 )
	MisResultCondition(HasItem, 2572, 1 )
	MisResultCondition(HasItem, 2573, 1 )
	MisResultCondition(HasItem, 2574, 1 )

	MisResultAction(TakeItem, 2568, 1 )
	MisResultAction(TakeItem, 2569, 1 )
	MisResultAction(TakeItem, 2570, 1 )
	MisResultAction(TakeItem, 2571, 1 )
	MisResultAction(TakeItem, 2572, 1 )
	MisResultAction(TakeItem, 2573, 1 )
	MisResultAction(TakeItem, 2574, 1 )

	MisResultAction(ClearMission, 1611)
	MisResultAction(SetRecord,  1611 )
	MisResultAction(GiveItem, 2273, 1, 4)
	MisResultAction(GiveItem, 2274, 1, 4)
	MisResultAction(GiveItem, 3877, 3, 4)
	MisResultAction(AddMoney,3000000,3000000)
	MisResultAction(ShuangZiCZ)
	MisResultBagNeed(3)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2568)	
	TriggerAction( 1, AddNextFlag, 1611, 10, 1 )
	RegCurTrigger( 16111 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2569)	
	TriggerAction( 1, AddNextFlag, 1611, 20, 1 )
	RegCurTrigger( 16112 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2570)	
	TriggerAction( 1, AddNextFlag, 1611, 30, 1 )
	RegCurTrigger( 16113 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2571)	
	TriggerAction( 1, AddNextFlag, 1611, 40, 1 )
	RegCurTrigger( 16114 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2572)	
	TriggerAction( 1, AddNextFlag, 1611, 50, 1 )
	RegCurTrigger( 16115 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2573)	
	TriggerAction( 1, AddNextFlag, 1611, 60, 1 )
	RegCurTrigger( 16116 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2574)	
	TriggerAction( 1, AddNextFlag, 1611, 70, 1 )
	RegCurTrigger( 16117 )


----------------------------------------金秋十月大闸蟹活动（一）---------白银城老奶奶·贝蒂（2277,2769）

	DefineMission(5865,"金秋十月缤纷假期吃毛蟹",1208)

	MisBeginTalk("<t>金秋十月，正是吃蟹的黄金佳季！<n><t>近来我在春风镇寻得一本烹蟹秘方，据说由此方烹煮的毛蟹，有意想不到的效果，不知您可感兴趣？")

	MisBeginCondition(NoMission, 1208)
	MisBeginCondition(NoRecord, 1208)
	MisBeginAction(AddMission, 1208)
	MisBeginAction(AddTrigger, 12081, TE_GETITEM, 4490, 1)          
	MisBeginAction(AddTrigger, 12082, TE_GETITEM, 4426, 2)
	MisBeginAction(AddTrigger, 12083, TE_GETITEM, 4393, 8)

	MisCancelAction(ClearMission,1208)                         ---------可以取消此任务

	MisNeed(MIS_NEED_DESP, "<t>我虽精通烹饪，但原材料还需你的帮助。铁甲蟹(加纳1773,2517)身上1份<y蟹壳>是美味高汤的低料，卫兵蟹(加纳1783,2507)身上2个<y锋利的蟹钳>能把蟹肉切割得更为均匀，而8份硬甲蟹(深蓝994,857)身上<y无法食用的蟹脚>则是烹煮此菜的关键！")
	MisNeed(MIS_NEED_ITEM, 4490, 1, 10, 1)               ---------蟹壳
	MisNeed(MIS_NEED_ITEM, 4426, 2, 20, 2)               ---------锋利的蟹钳
	MisNeed(MIS_NEED_ITEM, 4393, 8, 30, 8)               ---------无法食用的蟹脚

	MisHelpTalk("<t>仔细找到这些原材料，我的厨艺一定不会让你失望！")
	MisResultTalk("<t>赶紧尝尝鲜美的毛蟹盛宴，一定得留意它的效果哦！国庆14天，真情为您烹饪蟹肉大餐，欢迎再次品尝！")

	MisResultCondition(HasMission, 1208)
	MisResultCondition(NoRecord, 1208)
	MisResultCondition(HasItem, 4490, 1)
	MisResultCondition(HasItem, 4426, 2)
	MisResultCondition(HasItem, 4393, 8)

	MisResultAction(TakeItem, 4490, 1)
	MisResultAction(TakeItem, 4426, 2)
	MisResultAction(TakeItem, 4393, 8)

	MisResultAction(GiveItem, 0048, 1, 4)                          ---------毛蟹
	MisResultAction(ClearMission, 1208)                        
	MisResultAction(SetRecord, 1208)
	MisResultAction(ClearRecord, 1208)                          ----------任务可以反复接
	MisResultBagNeed(1)


	InitTrigger()
	TriggerCondition(1, IsItem, 4490)
	TriggerAction(1, AddNextFlag, 1208, 10, 1)
	RegCurTrigger(12081)


	InitTrigger()
	TriggerCondition(1, IsItem, 4426)
	TriggerAction(1, AddNextFlag, 1208, 20, 2)
	RegCurTrigger(12082)


	InitTrigger()
	TriggerCondition(1, IsItem, 4393)
	TriggerAction(1, AddNextFlag, 1208, 30, 8)
	RegCurTrigger(12083)


----------------------------------------金秋十月大闸蟹活动（二）---------白银城老奶奶·贝蒂（2277,2769）

	DefineMission(5866,"金秋十月唇齿留香大闸蟹",1209)

	MisBeginTalk("<t>大闸蟹历来享有蟹中之王的美誉，由我熬煮的大闸蟹更是具备鲜、香、嫩、爽的特点，吃后让你神清气爽，与怪物战斗经验飞增！不知您是否有兴趣品尝？")

	
	MisBeginCondition(NoMission, 1209)
	MisBeginCondition(NoRecord, 1209)
	MisBeginAction(AddMission,1209)
	MisBeginAction(AddTrigger, 12091, TE_GETITEM, 4342, 1)
	MisBeginAction(AddTrigger, 12092, TE_GETITEM, 4793, 2)
	MisBeginAction(AddTrigger, 12093, TE_GETITEM, 4500, 1)
	MisBeginAction(AddTrigger, 12094, TE_GETITEM, 0057, 1)


	MisCancelAction(ClearMission, 1209)

	MisNeed(MIS_NEED_DESP, "<t>烹制此蟹所需的原料亦非常考究，除了卫兵蟹(加纳1783,2507)身上1个<y坚硬的蟹壳>，长绒蟹(海底隧道349, 376)身上2个<y长绒蟹钳>，铁甲蟹王(加纳1783,2507)身上1个<y猩红的蟹壳>，还需商城里出售的1根<y蟹绳>，此绳能捆蟹之精华，制蟹之精品。")
       
	
	MisNeed(MIS_NEED_ITEM, 4342, 1, 10, 1)                       ---------坚硬的蟹壳
	MisNeed(MIS_NEED_ITEM, 4793, 2, 20, 2)                       ---------长绒蟹钳
	MisNeed(MIS_NEED_ITEM, 4500, 1, 30, 1)                       ---------猩红的蟹壳
	MisNeed(MIS_NEED_ITEM, 0057, 1, 40, 1)                       ---------蟹绳

	MisHelpTalk("<t>纵然原材料的收集是一件非常辛苦的事，但相信品尝过美味的大闸蟹后，你会为自己的努力而感到自豪！")
	MisResultTalk("<t>鲜香大闸蟹出炉，记得珍惜食用之后20倍经验的超值效果喔！国庆长假，与您分享秘制美味烹蟹大餐，欢迎再此品尝！")

	MisResultCondition(HasMission, 1209)
	MisResultCondition(NoRecord, 1209)
	MisResultCondition(HasItem, 4342, 1)
	MisResultCondition(HasItem, 4793, 2)
	MisResultCondition(HasItem, 4500, 1)
	MisResultCondition(HasItem, 0057, 1)

	MisResultAction(TakeItem, 4342, 1)
	MisResultAction(TakeItem, 4793, 2)
	MisResultAction(TakeItem, 4500, 1)
	MisResultAction(TakeItem, 0057, 1)

	MisResultAction(GiveItem, 0056, 1, 4)                                   ---------大闸蟹
	MisResultAction(ClearMission, 1209)
	MisResultAction(SetRecord, 1209)
	MisResultAction(ClearRecord, 1209)                                   ----------任务可以反复接
	MisResultBagNeed(1)


	InitTrigger()
	TriggerCondition(1, IsItem, 4342)
	TriggerAction(1, AddNextFlag, 1209, 10, 1)
	RegCurTrigger(12091)


	InitTrigger()
	TriggerCondition(1, IsItem, 4793)
	TriggerAction(1, AddNextFlag, 1209, 20, 2)
	RegCurTrigger(12092)

	InitTrigger()
	TriggerCondition(1, IsItem, 4500)
	TriggerAction(1, AddNextFlag, 1209, 30, 1)
	RegCurTrigger(12093)

	InitTrigger()
	TriggerCondition(1, IsItem, 0057)
	TriggerAction(1, AddNextFlag, 1209, 40, 1)
	RegCurTrigger(12094)


----------------------------------------金秋十月大闸蟹活动（三）---------白银城老奶奶·贝蒂（2277,2769）

	DefineMission(5867, "金秋十月满怀期待育蟹苗", 1210)

	MisBeginTalk("<t>根据这本烹饪秘方上的记载，由精良蟹苗培育而出的蟹王可是具备无以伦比的升级功效！是为勇士之精品！而这蟹苗本身亦拥有神奇效果，不知您可感兴趣？")

	MisBeginCondition(NoMission, 1210)
	MisBeginCondition(NoRecord, 1210)
	MisBeginAction(AddMission, 1210)
	MisBeginAction(AddTrigger, 12101, TE_KILL, 273, 10)
	MisBeginAction(AddTrigger, 12102, TE_KILL, 186, 10)
	MisBeginAction(AddTrigger, 12103, TE_GETITEM, 4259, 5)
	MisBeginAction(AddTrigger, 12104, TE_GETITEM, 4890, 5)


	MisCancelAction(ClearMission, 1210)

	MisNeed(MIS_NEED_DESP, "<t>养育蟹苗可是件棘手的事儿，这几日我被长绒蟹、沙蟹搅得无法集中精神，您可否为我解决后顾之忧呢？消灭位于(海底隧道349, 376)的10只<y长绒蟹>和位于(魔女之海1341,3010)的10只<y沙蟹>，并顺带把它们藏匿的5份<y火绒>和5份<y有沙子的蟹肉>带回来！")
	MisNeed(MIS_NEED_KILL, 273, 10, 10, 10)                  ----------长绒蟹
	MisNeed(MIS_NEED_KILL, 186, 10, 20, 10)                  ----------沙蟹
	MisNeed(MIS_NEED_ITEM, 4259, 5, 30, 5)                  -----------火绒
	MisNeed(MIS_NEED_ITEM, 4890, 5, 40, 5)                  -----------有沙子的蟹肉



	MisHelpTalk("<t>你可要小心应对那些狡猾的长绒蟹和沙蟹，我会赠与你1份<y蟹苗>作为回报喔！")
	MisResultTalk("<t>这份柔嫩的蟹苗需要你放置在<y背包第2栏>(放置精灵的位置)，<y5天>(7200分钟)的精心呵护，方能到我这烹饪为饕餮大餐！不过，据说商城里会出售一种能更快刺激蟹苗成长的<y超级蟹用激素>，你若有此物可直接来找我！养育蟹苗真是不简单呐，如果觉得这些事都很劳神烦心，那么直接食用这份蟹苗，则会给你带来提升1000点经验的惊喜！")
	
	MisResultCondition(HasMission, 1210)
	MisResultCondition(NoRecord, 1210)
	MisResultCondition(HasFlag, 1210, 19)
	MisResultCondition(HasFlag, 1210, 29)
	MisResultCondition(HasItem, 4259, 5)
	MisResultCondition(HasItem, 4890, 5)

	MisResultAction(TakeItem, 4259, 5)
	MisResultAction(TakeItem, 4890, 5)


	MisResultAction(ClearMission, 1210)
	MisResultAction(SetRecord, 1210)
	MisResultAction(ClearRecord, 1210)                                   ----------任务可以反复接
	MisResultAction(Givecrab, 0058)                                   ---------蟹苗
	MisResultBagNeed(1)


	InitTrigger()
	TriggerCondition(1, IsMonster, 273)
	TriggerAction(1, AddNextFlag, 1210, 10, 10)
	RegCurTrigger(12101)

	InitTrigger()
	TriggerCondition(1, IsMonster, 186)
	TriggerAction(1, AddNextFlag, 1210, 20, 10)
	RegCurTrigger(12102)

	InitTrigger()
	TriggerCondition(1, IsItem, 4259)
	TriggerAction(1, AddNextFlag, 1210, 30, 5)
	RegCurTrigger(12103)

	InitTrigger()
	TriggerCondition(1, IsItem, 4890)
	TriggerAction(1, AddNextFlag, 1210, 40, 5)
	RegCurTrigger(12104)



-----------------------------kokora---------------------------------------
-------------------------------------------------------------------------------

-------------------------------------------升级考试1	
	DefineMission( 6138, "升级考试任务", 1211)
	MisBeginTalk( "<t>学了这么久，你终于可以提升学历了哦！这次的考试任务很简单，去找30个精灵果来就行了")
	MisBeginCondition( CheckXSZCh,2 )				------检测学生证中储存的学分是否达到上限
	MisBeginCondition( HasItem , 3280,1 )
	MisBeginCondition( HasNoItem, 3282)
	MisBeginCondition( NoMission ,1211)
	MisBeginAction( AddMission, 1211)
	MisBeginAction(AddTrigger, 12111, TE_GETITEM, 3116, 30 )
	MisCancelAction( ClearMission, 1211)

	MisNeed(MIS_NEED_ITEM, 3116, 30, 10, 30 )
	MisHelpTalk( "<t>快点去吧，时间不等人哦")

	MisResultTalk( "<t>祈祷自己有个好成绩吧！")
	MisResultCondition( HasMission, 1211)
	MisResultCondition( HasItem, 3116, 30)
	MisResultAction( TakeItem, 3116, 30)
	MisResultAction( ClearMission, 1211)
	MisResultAction( GiveItem, 3282, 1, 4)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3116)	
	TriggerAction( 1, AddNextFlag, 1211, 10, 30 )
	RegCurTrigger( 12111 )


--------------------------------------------------------------------拯救剑客裴梦

	DefineMission( 6139, "拯救剑客裴梦", 1212 )
	MisBeginTalk("<t>我的朋友裴梦被魔王洛克残忍的杀害了.勇敢的战士,如果你能够为我找回代表我朋友灵魂的<b七个字母P-E-I-M-E-N-G>.我将会把我收藏多年的魔法盒送给你.你可以去找一下在<b寂寞之塔附近的洛克的守门人(271,1775)>询问一下具体的情况")
	MisBeginCondition(NoMission, 1212)
	MisBeginCondition(NoRecord,1212)
	MisBeginAction(AddMission,1212)
	MisBeginAction(AddTrigger, 12121, TE_GETITEM, 3854, 2)
	MisBeginAction(AddTrigger, 12122, TE_GETITEM, 3858, 1)
	MisBeginAction(AddTrigger, 12123, TE_GETITEM, 3863, 1)
	MisBeginAction(AddTrigger, 12124, TE_GETITEM, 3865, 1)
	MisBeginAction(AddTrigger, 12125, TE_GETITEM, 3862, 1)
	MisBeginAction(AddTrigger, 12126, TE_GETITEM, 3856, 1)
	
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找回代表夏天朋友灵魂的<b七个字母P-E-I-M-E-N-G>.去找一下在<b寂寞之塔附近的洛克的守门人(271,1775)>询问一下具体的情况.记得回来找白银城的魔法师夏天(2229,2782)交差")
	MisNeed(MIS_NEED_ITEM, 3854, 2, 10, 2)
	MisNeed(MIS_NEED_ITEM, 3858, 1, 20, 1)
	MisNeed(MIS_NEED_ITEM, 3863, 1, 30, 1)
	MisNeed(MIS_NEED_ITEM, 3865, 1, 40, 1)
	MisNeed(MIS_NEED_ITEM, 3862, 1, 50, 1)
	MisNeed(MIS_NEED_ITEM, 3856, 1, 60, 1)

	MisHelpTalk("<t>我等着你的归来.")
	MisResultTalk("<t>你是真正的勇士!作为报答,这个我收藏了多年的魔法盒,现在是你的了.")

	MisResultCondition(HasMission, 1212)
	MisResultCondition(NoRecord,1212)
	MisResultCondition(HasItem, 3854, 2)
	MisResultCondition(HasItem, 3858, 1)
	MisResultCondition(HasItem, 3863, 1)
	MisResultCondition(HasItem, 3865, 1)
	MisResultCondition(HasItem, 3862, 1)
	MisResultCondition(HasItem, 3856, 1)

	MisResultAction(TakeItem, 3854, 2 )
	MisResultAction(TakeItem, 3858, 1 )
	MisResultAction(TakeItem, 3863, 1 )
	MisResultAction(TakeItem, 3865, 1 )
	MisResultAction(TakeItem, 3862, 1 )
	MisResultAction(TakeItem, 3856, 1 )

	
	MisResultAction(GiveItem, 3673,1,4)------------夏天的魔法盒
	MisResultAction(ClearMission, 1212)
	--MisResultAction(ZSSTOP)
	MisResultAction(SetRecord, 1212)
	MisResultBagNeed(1)
	


	InitTrigger()
	TriggerCondition( 1, IsItem, 3854)	
	TriggerAction( 1, AddNextFlag, 1212, 10, 2 )
	RegCurTrigger( 12121 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3858)	
	TriggerAction( 1, AddNextFlag, 1212, 20, 1 )
	RegCurTrigger( 12122 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3863)	
	TriggerAction( 1, AddNextFlag, 1212, 30, 1 )
	RegCurTrigger( 12123 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3865)	
	TriggerAction( 1, AddNextFlag, 1212, 40, 1 )
	RegCurTrigger( 12124 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3862)	
	TriggerAction( 1, AddNextFlag, 1212, 50, 1 )
	RegCurTrigger( 12125 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3856)	
	TriggerAction( 1, AddNextFlag, 1212, 60, 1 )
	RegCurTrigger( 12126 )

	----------------------------------------------------------守门人透漏的信息----------洛克家的守门人
	DefineMission( 6140, "守门人透漏的信息", 1213 )
	MisBeginTalk("<t>我不能出卖洛克大人,但我也很尊敬你这样舍身挽救朋友的人.这样吧,我告诉你一个信息：第一张字母在寂寞之塔1(263,260)我们家男佣的手里")
				
	MisBeginCondition(NoMission, 1213)
	MisBeginCondition(NoRecord,1213)
	MisBeginCondition(HasMission, 1212)
	MisBeginCondition(NoRecord, 1212)
	MisBeginAction(AddMission,1213)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找寂寞之塔1层(263,260)洛克家的男佣聊聊")
	
	MisHelpTalk("<t>我并没有出卖我的主人哦,有谁看到我送出了字母卡?")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------守门人透漏的信息--------洛克家的男佣
	DefineMission(6141, "守门人透漏的信息", 1213, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我的主人的确交给过我一张字母卡片.但我凭什么给你?")
	MisResultCondition(NoRecord, 1213)
	MisResultCondition(HasMission,1213)
	MisResultAction(ClearMission,1213)
	MisResultAction(SetRecord, 1213)


	---------------------------------------------男佣的不满---------洛克家的男佣
	DefineMission(6142,"男佣的不满",1214)

      MisBeginTalk("<t> 其实这个字母卡对我来说也没什么用,我也是偶然得到的.看到旁边那些讨厌的怪物了吗?每当我要约会的时候它们总是不合时宜的前来打扰,要给它们点颜色看看.你做得令我满意,我会把那张字母卡送给你.")

      MisBeginCondition(NoRecord,1214)
      MisBeginCondition(NoMission,1214)
      MisBeginCondition(HasRecord, 1213)
      MisBeginAction(AddMission,1214)
      MisBeginAction(AddTrigger, 12141, TE_GETITEM, 4739, 25 )
      MisBeginAction(AddTrigger, 12142, TE_GETITEM, 4740, 25 )          
      MisBeginAction(AddTrigger, 12143, TE_GETITEM, 4741, 25 )               
      MisBeginAction(AddTrigger, 12144, TE_GETITEM, 1486, 25 )               
      MisCancelAction(SystemNotice, "This quest cannot be abandoned")

      MisNeed(MIS_NEED_DESP, "尖锐的土著长矛、坚固的蜥蜴人腰带、敏捷的圣林之心、损坏的白色灵猫翅膀各25个!")
      MisNeed(MIS_NEED_ITEM, 4739, 25,  1, 25 )
      MisNeed(MIS_NEED_ITEM, 4740, 25, 26, 25 )
      MisNeed(MIS_NEED_ITEM, 4741, 25,  51, 25 )
      MisNeed(MIS_NEED_ITEM, 1486, 25,  76, 25 )

      MisHelpTalk("<t>不帮我教训它们,一切免谈.")  
      MisResultTalk("<t>勇士,既然你已经收集齐了我要的东西.那么作为报酬,这张字母P你拿去吧.")
      MisResultCondition(HasMission,1214 )
      MisResultCondition(NoRecord,1214)
      MisResultCondition(HasItem, 4739, 25 )
      MisResultCondition(HasItem, 4740, 25 )
      MisResultCondition(HasItem, 4741, 25 )
      MisResultCondition(HasItem, 1486, 25 )

        MisResultAction(TakeItem, 4739, 25 )
	MisResultAction(TakeItem, 4740, 25 )
	MisResultAction(TakeItem, 4741, 25 )
	MisResultAction(TakeItem, 1486, 25 )

      MisResultAction(GiveItem, 3865, 1, 4 )
      MisResultAction(ClearMission, 1214 )
      MisResultAction(SetRecord, 1214)
      MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4739)	
	TriggerAction( 1, AddNextFlag, 1214, 1, 25 )
	RegCurTrigger( 12141 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4740)	
	TriggerAction( 1, AddNextFlag, 1214, 26, 25 )
	RegCurTrigger( 12142 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4741)	
	TriggerAction( 1, AddNextFlag, 1214, 51, 25 )
	RegCurTrigger( 12143 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1486)	
	TriggerAction( 1, AddNextFlag, 1214, 76, 25 )
	RegCurTrigger( 12144 )
  
----------------------------------------------------------奇怪的女佣----------洛克家的男佣
	DefineMission( 6143, "奇怪的女佣", 1215 )
	MisBeginTalk("<t>据我所知,寂寞之塔2层(151,134)的我家的女佣那里也有一张字母卡.祝您好运.")
				
	MisBeginCondition(NoMission, 1215)
	MisBeginCondition(NoRecord,1215)
	MisBeginCondition(HasRecord, 1214)
	MisBeginAction(AddMission,1215)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找寂寞之塔2层(151,134)的洛克家的女佣聊聊")
	
	MisHelpTalk("<t>她是一位奇怪的女性.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------奇怪的女佣--------洛克家的女佣
	DefineMission(6144, "奇怪的女佣", 1215, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我的确像传说中的那样有个性,但我发誓我绝不是奇怪的人.")
	MisResultCondition(NoRecord, 1215)
	MisResultCondition(HasMission,1215)
	MisResultAction(ClearMission,1215)
	MisResultAction(SetRecord, 1215)

	---------------------------------------------治疗多嘴的秘方---------洛克家的女佣
	DefineMission(6145,"治疗多嘴的秘方",1216)

      MisBeginTalk("<t> 如果一定要说我有什么不足的地方就是我有点爱管闲事,就是人们常说的多嘴.我刚刚得到一个秘方可以治疗这个毛病,就是用铁镐和战斧不停的击碎骷髅,坚持七七四十九天.我想我会因此变得讨人喜欢的.")

      MisBeginCondition(NoRecord,1216)
      MisBeginCondition(NoMission,1216)
      MisBeginCondition(HasRecord, 1215)
      MisBeginAction(AddMission,1216)
      MisBeginAction(AddTrigger, 12161, TE_GETITEM, 4742, 35 )
      MisBeginAction(AddTrigger, 12162, TE_GETITEM, 4743, 35 )          
      MisBeginAction(AddTrigger, 12163, TE_GETITEM, 4745, 35 )                           
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

      MisNeed(MIS_NEED_DESP, "收集暗血骷髅、地精铁镐、沉重的地精战斧各35个!")
      MisNeed(MIS_NEED_ITEM, 4742, 35,  1, 35 )
      MisNeed(MIS_NEED_ITEM, 4743, 35, 36, 35 )
      MisNeed(MIS_NEED_ITEM, 4745, 35,  71, 35 )

      MisHelpTalk("<t>我知道这听起来有点匪夷所思.")  
      MisResultTalk("<t>真希望我的瑕疵可以祛除.这个字母是我给你的回报.")
      MisResultCondition(HasMission,1216 )
      MisResultCondition(NoRecord,1216)
      MisResultCondition(HasItem, 4742, 35 )
      MisResultCondition(HasItem, 4743, 35 )
      MisResultCondition(HasItem, 4745, 35 )

        MisResultAction(TakeItem, 4742, 35 )
	MisResultAction(TakeItem, 4743, 35 )
	MisResultAction(TakeItem, 4745, 35 )


      MisResultAction(GiveItem, 3854, 1, 4 )
      MisResultAction(ClearMission, 1216 )
      MisResultAction(SetRecord, 1216)
      MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4742)	
	TriggerAction( 1, AddNextFlag, 1216, 1, 35 )
	RegCurTrigger( 12161 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4743)	
	TriggerAction( 1, AddNextFlag, 1216, 36, 35 )
	RegCurTrigger( 12162 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4745)	
	TriggerAction( 1, AddNextFlag, 1216, 71, 35 )
	RegCurTrigger(12163 )
----------------------------------------------------------洛克家的小秘----------洛克家的女佣
	DefineMission( 6146, "洛克家的小秘", 1217 )
	MisBeginTalk("<t>你知道吗,寂寞之塔3层(63,311)的女人是洛克大人的小秘.说不定她那里也有一张字母卡,哎呦,我又多嘴了,看来要赶快治疗,不奉陪了.")
				
	MisBeginCondition(NoMission, 1217)
	MisBeginCondition(NoRecord,1217)
	MisBeginCondition(HasRecord, 1216)
	MisBeginAction(AddMission,1217)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找寂寞之塔3层(63,311)的洛克家的小秘聊聊")
	
	MisHelpTalk("<t>我最不喜欢那种搔首弄姿的女人.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------洛克家的小秘--------洛克家的小秘
	DefineMission(6147, "洛克家的小秘", 1217, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>谁说我和洛克大人关系暧昧了,造谣嘛.")
	MisResultCondition(NoRecord, 1217)
	MisResultCondition(HasMission,1217)
	MisResultAction(ClearMission,1217)
	MisResultAction(SetRecord, 1217)

	--------------------------------------------------------------------小秘的梦想------洛克家的小秘

	DefineMission( 6148, "小秘的梦想", 1218 )
	MisBeginTalk("<t>我有一个美丽的梦想,要背上翅膀翱翔远方.但是我需要原料和工具.")
	MisBeginCondition(NoMission, 1218)
	MisBeginCondition(NoRecord,1218)
	MisBeginCondition(HasRecord, 1217)
	MisBeginAction(AddMission,1218)
	MisBeginAction(AddTrigger, 12181, TE_GETITEM, 1501, 20)
	MisBeginAction(AddTrigger, 12182, TE_GETITEM, 1490, 20)
	MisBeginAction(AddTrigger, 12183, TE_GETITEM, 4748, 20)
	MisBeginAction(AddTrigger, 12184, TE_GETITEM, 4749, 20)
	MisBeginAction(AddTrigger, 12185, TE_GETITEM, 4725, 20)
	MisBeginAction(AddTrigger, 12186, TE_GETITEM, 4747, 20)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "收集破损的黑色猫铃铛、损坏的黑色灵猫翅膀、破裂的地精耳环、大号地精扳手、破旧的猎手之弓、白色灵猫翅膀各20个.")
	MisNeed(MIS_NEED_ITEM, 1501, 20, 1, 20)
	MisNeed(MIS_NEED_ITEM, 1490, 20, 21, 20)
	MisNeed(MIS_NEED_ITEM, 4748, 20, 41, 20)
	MisNeed(MIS_NEED_ITEM, 4749, 20, 61, 20)
	MisNeed(MIS_NEED_ITEM, 4725, 20, 81, 20)
	MisNeed(MIS_NEED_ITEM, 4747, 20, 101, 20)

	MisHelpTalk("<t>我仿佛已经触摸到了白云的衣角.")
	MisResultTalk("<t>谢谢你帮助我实现美丽的梦想,梦想可能不会实现,但是人是不能没有梦想的.")

	MisResultCondition(HasMission, 1218)
	MisResultCondition(NoRecord,1218)
	MisResultCondition(HasItem, 1501, 20)
	MisResultCondition(HasItem, 1490, 20)
	MisResultCondition(HasItem, 4748, 20)
	MisResultCondition(HasItem, 4749, 20)
	MisResultCondition(HasItem, 4725, 20)
	MisResultCondition(HasItem, 4747, 20)

	MisResultAction(TakeItem, 1501, 20 )
	MisResultAction(TakeItem, 1490, 20 )
	MisResultAction(TakeItem, 4748, 20 )
	MisResultAction(TakeItem, 4749, 20 )
	MisResultAction(TakeItem, 4725, 20 )
	MisResultAction(TakeItem, 4747, 20 )

	
	MisResultAction(GiveItem, 3858,1,4)------------i
	MisResultAction(ClearMission, 1218)
	MisResultAction(SetRecord, 1218)
	MisResultBagNeed(1)
	


	InitTrigger()
	TriggerCondition( 1, IsItem, 1501)	
	TriggerAction( 1, AddNextFlag, 1218, 1, 20 )
	RegCurTrigger( 12181 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1490)	
	TriggerAction( 1, AddNextFlag, 1218, 21, 20 )
	RegCurTrigger( 12182 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4748)	
	TriggerAction( 1, AddNextFlag, 1218, 41, 20 )
	RegCurTrigger( 12183 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4749)	
	TriggerAction( 1, AddNextFlag, 1218, 61, 20 )
	RegCurTrigger( 12184 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4725)	
	TriggerAction( 1, AddNextFlag, 1218, 81, 20 )
	RegCurTrigger( 12185 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4747)	
	TriggerAction( 1, AddNextFlag, 1218, 101, 20 )
	RegCurTrigger( 12186 )

	----------------------------------------------------------严肃的守护者----------洛克家的小秘
	DefineMission( 6149, "严肃的守护者", 1219 )
	MisBeginTalk("<t>寂寞之塔4(261,70)层的守护者是一个很严肃的人,祈祷你能顺利拿到一张卡片.")
				
	MisBeginCondition(NoMission, 1219)
	MisBeginCondition(NoRecord,1219)
	MisBeginCondition(HasRecord, 1218)
	MisBeginAction(AddMission,1219)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找寂寞之塔4(261,70)层的洛克家的守护者聊聊")
	
	MisHelpTalk("<t>上一层很危险哦.")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------严肃的守护者--------洛克家的守护者
	DefineMission(6150, "严肃的守护者", 1219, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>不管是什么地位的什么人,都应该学会尊重别人,否则永远不会得到别人真正的尊重.")
	MisResultCondition(NoRecord, 1219)
	MisResultCondition(HasMission,1219)
	MisResultAction(ClearMission,1219)
	MisResultAction(SetRecord, 1219)

--------------------------------------------------------------------一个人情又一个人情------洛克家的守护者

	DefineMission( 6151, "一份人情又一份人情", 1220 )
	MisBeginTalk("<t>我为什么会一直作魔王的守护者?!是因为我欠他一份人情.当初我落魄的时候,他给了我黑色灵猫翅膀、被污染的天使光环各10个,卖掉买稀饭吃.事到如今我对他的恩情已经报答得差不多了,你再帮我个忙我就可以摆脱洛克了.")
	MisBeginCondition(NoMission, 1220)
	MisBeginCondition(NoRecord,1220)
	MisBeginCondition(HasRecord, 1219)
	MisBeginAction(AddMission,1220)
	MisBeginAction(AddTrigger, 12201, TE_GETITEM, 4750,50)
	MisBeginAction(AddTrigger, 12202, TE_GETITEM, 4763, 50)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "收集黑色灵猫翅膀、被污染的天使光环各50个.")
	MisNeed(MIS_NEED_ITEM, 4750, 50, 1, 50)
	MisNeed(MIS_NEED_ITEM, 4763, 50, 51, 50)


	MisHelpTalk("<t>我能否获得自由就靠你了.")
	MisResultTalk("<t>终于可以还洛克这份人情,但我又欠了你一份人情,我只有把字母卡给你作为回报了,也算替洛克做一件好事.")

	MisResultCondition(HasMission, 1220)
	MisResultCondition(NoRecord,1220)
	MisResultCondition(HasItem, 4750, 50)
	MisResultCondition(HasItem, 4763,50)
	MisResultAction(TakeItem, 4750, 50 )
	MisResultAction(TakeItem, 4763, 50 )
	
	MisResultAction(GiveItem, 3862,1,4)----------m
	MisResultAction(ClearMission, 1220)
	MisResultAction(SetRecord, 1220)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 4750)	
	TriggerAction( 1, AddNextFlag, 1220, 1, 50 )
	RegCurTrigger( 12201 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4763)	
	TriggerAction( 1, AddNextFlag, 1220, 21, 50 )
	RegCurTrigger( 12202 )

----------------------------------------------------------还是一份人情----------洛克家的守护者
	DefineMission( 6152, "还是一份人情", 1221 )
	MisBeginTalk("<t>我突然有一个好主意,这辈子我一直在还别人的情,或许这次我可以让你欠我一份情.<n><t>寂寞之塔5层(542,54)的管家那有一张字母卡片")
				
	MisBeginCondition(NoMission, 1221)
	MisBeginCondition(NoRecord,1221)
	MisBeginCondition(HasRecord, 1220)
	MisBeginAction(AddMission,1221)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找寂寞之塔5层(542,54)的洛克家的管家聊聊")
	
	MisHelpTalk("<t>不用谢我,我很享受这种感觉,虽然好像有点自私.哈哈...")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------还是一份人情--------洛克家的管家
	DefineMission(6153, "还是一份人情", 1221, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>这个不苟言笑的家伙倒是开心的送人情给别人,我怎么办?")
	MisResultCondition(NoRecord, 1221)
	MisResultCondition(HasMission,1221)
	MisResultAction(ClearMission,1221)
	MisResultAction(SetRecord, 1221)


	--------------------------------------------------------------------管家的烦恼------洛克家的管家

	DefineMission( 6154, "管家的烦恼", 1222 )
	MisBeginTalk("<t>做人不可以太贪婪知道吗?不要像我.上次我的亲友来拜望我,我看洛克大人不是很注意家里的财物状况就私自拿家里的东西送给我的亲戚.不知道为什么洛克大人有了察觉,现在我很着急,如果你可以帮我收集齐这些东西,我不介意把大人的字母卡送给你")
	MisBeginCondition(NoMission, 1222)
	MisBeginCondition(NoRecord,1222)
	MisBeginCondition(HasRecord, 1221)
	MisBeginAction(AddMission,1222)
	MisBeginAction(AddTrigger, 12221, TE_GETITEM, 4770, 35)
	MisBeginAction(AddTrigger, 12222, TE_GETITEM, 4766, 35)
	MisBeginAction(AddTrigger, 12223, TE_GETITEM, 4772, 35)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "收集被诅咒的白色灵猫翅膀、 黑暗的圣林之心、被诅咒的黑色灵猫翅膀各35个.")
	MisNeed(MIS_NEED_ITEM, 4770, 35, 1, 35)
	MisNeed(MIS_NEED_ITEM, 4766, 35, 36, 35)
	MisNeed(MIS_NEED_ITEM, 4772, 35, 71, 35)

	MisHelpTalk("<t>要快,否则让洛克大人知道了,做什么都没有用了.")
	MisResultTalk("<t>总是这样拆东墙补西墙我真担心有一天我再没有退路了.")

	MisResultCondition(HasMission, 1222)
	MisResultCondition(NoRecord,1222)
	MisResultCondition(HasItem, 4770, 35)
	MisResultCondition(HasItem, 4766, 35)
	MisResultCondition(HasItem, 4772, 35)

	MisResultAction(TakeItem, 4770, 35 )
	MisResultAction(TakeItem, 4766, 35 )
	MisResultAction(TakeItem, 4772, 35 )
	
	MisResultAction(GiveItem, 3863,1,4)----------n
	MisResultAction(ClearMission, 1222)
	MisResultAction(SetRecord, 1222)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 4770)	
	TriggerAction( 1, AddNextFlag, 1222, 1, 35 )
	RegCurTrigger( 12221 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4766)	
	TriggerAction( 1, AddNextFlag, 1222, 36, 35 )
	RegCurTrigger( 12222 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4772)	
	TriggerAction( 1, AddNextFlag, 1222, 71, 35 )
	RegCurTrigger( 12223 )

---------------------------------------------------------管家的报复----------洛克家的管家
	DefineMission( 6155, "管家的报复", 1223 )
	MisBeginTalk("<t>哦~~我终于明白为什么一向信任我的洛克大人突然对我产生了怀疑,一定是他情人搞的鬼,因为我曾经看见她与一个陌生男子约会,她要陷害我...别说我不帮你,那个女人身上有一张卡片,你一定要拿到那张卡片.这样一来,如果我暴露了她也跑不了,哈哈哈,我太坏了~~")
				
	MisBeginCondition(NoMission, 1223)
	MisBeginCondition(NoRecord,1223)
	MisBeginCondition(HasRecord, 1222)
	MisBeginAction(AddMission,1223)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找寂寞之塔6层(541,268)的洛克的情人聊聊")
	
	MisHelpTalk("<t>怪不得从小妈妈就教育我不要和坏孩子玩呢,自从跟随了魔王洛克大人,我真的变坏了,呜...")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------管家的报复--------洛克的情人
	DefineMission(6156, "管家的报复", 1223, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>你怎么知道我有卡片的?")
	MisResultCondition(NoRecord, 1223)
	MisResultCondition(HasMission,1223)
	MisResultAction(ClearMission,1223)
	MisResultAction(SetRecord, 1223)
--------------------------------------------------------------------美女的奇特爱好------洛克的情人

	DefineMission( 6157, "美女的奇特爱好", 1224 )
	MisBeginTalk("<t>我最近突然对金属饰品特别感兴趣,已经痴迷到疯狂的程度.你一定不明白我为什么开始喜欢上金属烟囱,其实我也不明白.但我对自己喜欢的东西总是一定要得到,不惜任何代价,即使是魔王洛克的东西.")
	MisBeginCondition(NoMission, 1224)
	MisBeginCondition(NoRecord,1224)
	MisBeginCondition(HasRecord, 1223)
	MisBeginAction(AddMission,1224)
	MisBeginAction(AddTrigger, 12241, TE_GETITEM, 1503, 110)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "收集金属烟囱110个.")
	MisNeed(MIS_NEED_ITEM, 1503, 110, 1, 110)

	MisHelpTalk("<t>别跟我解释,我只要金属烟囱.")
	MisResultTalk("<t>看来我们真的是两个世界的人,像你不明白我一样,我永远不明白你要这个破字母有什么用,给你吧.")

	MisResultCondition(HasMission, 1224)
	MisResultCondition(NoRecord,1224)
	MisResultCondition(HasItem, 1503, 110)
	MisResultAction(TakeItem, 1503, 110 )

	MisResultAction(GiveItem, 3856,1,4)----------G
	MisResultAction(ClearMission, 1224)
	MisResultAction(SetRecord, 1224)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 1503)	
	TriggerAction( 1, AddNextFlag, 1224, 1, 110 )
	RegCurTrigger( 12241 )

------------------------------------------------------赌气的旺财----------洛克的情人
	DefineMission( 6158, "赌气的旺财", 1225 )
	MisBeginTalk("<t>下一张字母在我家男人的宠物旺财身上.那是一只很通人性的狗哦,只是有点小气.有一次我生气没给他骨头吃,他逃到地狱四层藏起来了.总的来说我还是很喜欢它的.")
				
	MisBeginCondition(NoMission, 1225)
	MisBeginCondition(NoRecord,1225)
	MisBeginCondition(HasRecord, 1224)
	MisBeginAction(AddMission,1225)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找地狱四层(154,912)的洛克家的旺财要字母卡片")
	
	MisHelpTalk("<t>美丽的烟囱啊...")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------赌气的旺财--------洛克家的旺财
	DefineMission(6159, "赌气的旺财", 1225, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>汪汪!我逃到这你都发现我了?是洛克情人要你来请我回去的吗?她怕疼爱我的洛克找不到我怪罪她吧?")
	MisResultCondition(NoRecord, 1225)
	MisResultCondition(HasMission,1225)
	MisResultAction(ClearMission,1225)
	MisResultAction(SetRecord, 1225)


	--------------------------------------------------------------------旺财也不是好惹的------洛克家的旺财

	DefineMission( 6160, "旺财也不是好惹的!", 1226 )
	MisBeginTalk("<t>地狱三层的僵尸一直欺负可怜的我,如果你帮我去把他的头发拔几根下来,这张无聊的卡片就是你的了.一定要让他们知道旺财也不是好惹的.")
	MisBeginCondition(NoMission, 1226)
	MisBeginCondition(NoRecord,1226)
	MisBeginCondition(HasRecord, 1225)
	MisBeginAction(AddMission,1226)
	MisBeginAction(AddTrigger, 12261, TE_GETITEM, 4884, 99)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "收集僵尸头发99个.")
	MisNeed(MIS_NEED_ITEM, 4884, 99, 1, 99)

	MisHelpTalk("<t>今天你汪汪了没有?")
	MisResultTalk("<t>你可以回去<b找白银城的魔法师夏天(2229,2782)交差>了.")

	MisResultCondition(HasMission, 1226)
	MisResultCondition(NoRecord,1226)
	MisResultCondition(HasItem, 4884, 99)
	MisResultAction(TakeItem, 4884, 99 )

	MisResultAction(GiveItem, 3854,1,4)----------E
	MisResultAction(ClearMission, 1226)
	MisResultAction(SetRecord, 1226)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 4884)	
	TriggerAction( 1, AddNextFlag, 1226, 1, 99 )
	RegCurTrigger( 12261 )


-----------------------------------------------------哦!没钥匙----------魔法师夏天
	DefineMission( 6161, "哦!没钥匙", 1227 )
	MisBeginTalk("<t>哦!没钥匙.我在去秋岛旅游的时候把开启魔法盒的钥匙掉在美丽的导游小姐(2423,3186)那了,只要你去找她要回,就可以打开魔法盒了")
				
	MisBeginCondition(NoMission, 1227)
	MisBeginCondition(NoRecord,1227)
	MisBeginCondition(HasRecord, 1212)
	MisBeginAction(AddMission,1227)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找秋岛导游小姐(2423,3186)要回开启魔法盒的钥匙。")
	
	MisHelpTalk("<t>哦!怎么忘记带回钥匙了...")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------哦!没钥匙--------秋岛导游小姐
	DefineMission(6162, "哦!没钥匙", 1227, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>一定是魔法师夏天叫你来的吧?他是有把钥匙丢在我这了")
	MisResultCondition(NoRecord, 1227)
	MisResultCondition(HasMission,1227)
	MisResultAction(ClearMission,1227)
	MisResultAction(SetRecord, 1227)



	--------------------------------------------------------------------导游小姐的请求------秋岛导游小姐

	DefineMission( 6163, "导游小姐的请求", 1228 )
	MisBeginTalk("<t>我帮你们保存了这么久,总该有点报答吧.秋岛经常有凶悍的土匪打劫游客,你就帮我除除害吧")
	MisBeginCondition(NoMission, 1228)
	MisBeginCondition(NoRecord,1228)
	MisBeginCondition(HasRecord, 1227)
	MisBeginAction(AddMission,1228)
	MisBeginAction(AddTrigger, 12281, TE_GETITEM, 0154, 20)
	MisBeginAction(AddTrigger, 12282, TE_GETITEM, 0156, 20)
	MisBeginAction(AddTrigger, 12283, TE_GETITEM, 0158, 20)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "收集东方海盗水手徽记、东方海盗战斗员徽记、东方海盗突击手徽记各20个.")
	MisNeed(MIS_NEED_ITEM, 0154, 20, 1, 20)
	MisNeed(MIS_NEED_ITEM, 0156, 20, 21, 20)
	MisNeed(MIS_NEED_ITEM, 0158, 20, 41, 20)

	MisHelpTalk("<t>你快去吧,我这里最近生意萧条得很呢.")
	MisResultTalk("<t>你还真是一个好手呢,谢谢.")

	MisResultCondition(HasMission, 1228)
	MisResultCondition(NoRecord,1228)
	MisResultCondition(HasItem, 0154, 20)
	MisResultCondition(HasItem, 0156, 20)
	MisResultCondition(HasItem, 0158, 20)

	MisResultAction(TakeItem, 0154, 20 )
	MisResultAction(TakeItem, 0156, 20 )
	MisResultAction(TakeItem, 0158, 20 )
	
	MisResultAction(ClearMission, 1228)
	MisResultAction(SetRecord, 1228)

	
	InitTrigger()
	TriggerCondition( 1, IsItem, 0154)	
	TriggerAction( 1, AddNextFlag, 1228, 1, 20 )
	RegCurTrigger( 12281 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0156)	
	TriggerAction( 1, AddNextFlag, 1228, 36, 20 )
	RegCurTrigger( 12282 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 0158)	
	TriggerAction( 1, AddNextFlag, 1228, 71, 20 )
	RegCurTrigger( 12283 )


		--------------------------------------------------------------------告慰亡灵------秋岛导游小姐

	DefineMission( 6164, "告慰亡灵", 1229 )
	MisBeginTalk("<t>秋岛上有很多的亡魂,能否继续为我找回去泣灵武士骸骨和废灵武士骸骨,让秋岛的亡灵得到安息.")
	MisBeginCondition(NoMission, 1229)
	MisBeginCondition(NoRecord,1229)
	MisBeginCondition(HasRecord, 1228)
	MisBeginAction(AddMission,1229)
	MisBeginAction(AddTrigger, 12291, TE_GETITEM, 3436, 50)
	MisBeginAction(AddTrigger, 12292, TE_GETITEM, 3434, 50)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "收集泣灵武士骸骨、废灵武士骸骨各50个.")
	MisNeed(MIS_NEED_ITEM, 3436, 50, 1, 50)
	MisNeed(MIS_NEED_ITEM, 3434, 50, 51, 50)


	MisHelpTalk("<t>实在拜托你了.")
	MisResultTalk("<t>你真是好人,太感谢你啦.钥匙拿去吧.")

	MisResultCondition(HasMission, 1229)
	MisResultCondition(NoRecord,1229)
	MisResultCondition(HasItem, 3436, 50)
	MisResultCondition(HasItem, 3434, 50)

	MisResultAction(TakeItem, 3436, 50 )
	MisResultAction(TakeItem, 3434, 50 )

	MisResultAction(GiveItem, 3674,1,4)----------钥匙
	MisResultAction(ClearMission, 1229)
	MisResultAction(SetRecord, 1229)
	MisResultBagNeed(1)
	
	InitTrigger()
	TriggerCondition( 1, IsItem, 3436)	
	TriggerAction( 1, AddNextFlag, 1229, 1, 50 )
	RegCurTrigger( 12291 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 3434)	
	TriggerAction( 1, AddNextFlag, 1229, 51, 50 )
	RegCurTrigger( 12292 )

----------------------------------------------------一把钥匙开一把锁---------秋岛导游小姐
	DefineMission( 6165, "一把钥匙开一把锁", 1230 )
	MisBeginTalk("<t>赶快找魔法师夏天打开魔法盒吧.")
				
	MisBeginCondition(NoMission, 1230)
	MisBeginCondition(NoRecord,1230)
	MisBeginCondition(HasRecord, 1229)
	MisBeginAction(AddMission,1230)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed(MIS_NEED_DESP, "找白银城魔法师夏天(2229,2782)打开魔法盒.")
	
	MisHelpTalk("<t>记得带钥匙和魔法盒一起去...")
	MisResultCondition(AlwaysFailure)	
	-----------------------------------------一把钥匙开一把锁---------魔法师夏天
	DefineMission(6166, "一把钥匙开一把锁", 1230, COMPLETE_SHOW )
	
	MisBeginCondition(AlwaysFailure )
	
	MisResultTalk("<t>我的主啊,世间竟有如此毅力的孩子,难能可贵啊.我帮你打开盒子吧.哇,居然盒子里面有个黑匣子.拿去看看,是什么东东?")
	MisResultCondition(NoRecord, 1230)
	MisResultCondition(HasMission,1230)
	MisResultCondition(HasItem, 3673, 1)
	MisResultCondition(HasItem, 3674, 1)
	MisResultAction(TakeItem, 3673, 1 )
	MisResultAction(TakeItem, 3674, 1 )
	MisResultAction(GiveItem, 3672,1,4)----------黑匣子
	MisResultAction(ClearMission,1230)
	MisResultAction(SetRecord, 1230)
	MisResultBagNeed(1)

	MisResultAction(ClearRecord, 1212)---------------可以反复接
	MisResultAction(ClearRecord, 1213)---------------可以反复接
	MisResultAction(ClearRecord, 1214)---------------可以反复接
	MisResultAction(ClearRecord, 1215)---------------可以反复接
	MisResultAction(ClearRecord, 1216)---------------可以反复接
	MisResultAction(ClearRecord, 1217)---------------可以反复接
	MisResultAction(ClearRecord, 1218)---------------可以反复接
	MisResultAction(ClearRecord, 1219)---------------可以反复接
	MisResultAction(ClearRecord, 1220)---------------可以反复接
	MisResultAction(ClearRecord, 1221)---------------可以反复接
	MisResultAction(ClearRecord, 1222)---------------可以反复接
	MisResultAction(ClearRecord, 1223)---------------可以反复接
	MisResultAction(ClearRecord, 1224)---------------可以反复接
	MisResultAction(ClearRecord, 1225)---------------可以反复接
	MisResultAction(ClearRecord, 1226)---------------可以反复接
	MisResultAction(ClearRecord, 1227)---------------可以反复接
	MisResultAction(ClearRecord, 1228)---------------可以反复接
	MisResultAction(ClearRecord, 1229)---------------可以反复接
	MisResultAction(ClearRecord, 1230)---------------可以反复接


--------------------------------------------------------勇者的足迹	
	DefineMission( 6167, "The Hero’s Relic", 1231)
	MisBeginTalk( "<t> You are not a kid anymore, it’s time to leave this place...<n><t> Here is the treasured relic of a brave fighter, do you want it? <n><t>You want it? If you want it, just tell me. I can see your eyes are filled with desire. I am serious, you really need to tell me if you want it... I ask you again, do you really want it? Ok, here you are.")
	MisBeginCondition( LvCheck, ">", 44)
	MisBeginCondition( LvCheck, "<", 66)
	MisBeginCondition( NoMission, 1231)
	MisBeginCondition( NoRecord, 1231)
	MisBeginAction( AddMission, 1231)
	MisBeginAction( AddTrigger, 12311, TE_KILL, 514, 30 )
	MisCancelAction(ClearMission, 1231)

	MisNeed(MIS_NEED_KILL, 514, 30, 10, 30)
	
	MisResultTalk("<t>Muwahhaha....you killed so many monsters. I told you the wrong number before, actually, 10 are enough. But you have already killed 30 monsters, which is ok too. <n><t>Well, I guess I’m too old. Why do you stand here?<n><t>Oh, I almost forgot, I haven’t give you the rewards.")
	MisHelpTalk("<t>Why don’t you get a move on? The Huge Spiky Stramonium is in Ascaron (440,1320).")
	MisResultCondition( HasFlag, 1231, 39 )
	MisResultCondition( HasMission, 1231)
	MisResultCondition( NoRecord, 1231)
	MisResultAction( ClearMission, 1231)
	MisResultAction( SetRecord, 1231)
	MisResultAction( AddExpPer, 1)
	MisResultAction( AddMoney, 1000)

	InitTrigger() 
	TriggerCondition( 1, IsMonster, 514 )	
	TriggerAction( 1, AddNextFlag, 1231, 10, 30 )
	RegCurTrigger(12311)

	----------------------------------------
	DefineMission( 6168, "The Hero’s Relic", 1232)
	MisBeginTalk( "<t>You are a very brave gambler. High risk, high return<n><t>But I must warn you, if you go adventuring without abilities, all your efforts will be in vain. <n><t> This is your next test, and I will be waiting for you to return.")
	MisBeginCondition( NoMission, 1232)
	MisBeginCondition( NoRecord, 1232)
	MisBeginCondition( HasRecord, 1231)
	MisBeginAction( AddMission, 1232)
	MisBeginAction( AddTrigger, 12321, TE_KILL, 284, 50 )
	MisCancelAction( ClearMission, 1232)

	MisNeed( MIS_NEED_KILL, 284, 50, 10, 50)

	MisResultTalk( "<t>Welcome back! Your performance has been recognized. But I want to tell you that all these tasks were designed by me to test you.<n><t>Don’t be mad at me! I knew the location of the treasure, but the lock keeping the treasure from being stolen had rusted, and I heard that only Terra Gold Ore can be used to open the lock. You must go and find some for me. <n><t>I know I shouldn’t have lied to you, ok, I promise, once you give me the Terra Gold Ore, I will give you all the treasure.")
	MisHelpTalk( "<t> The Guardian Angel usually walk around Ascaron (904,1280)")
	MisResultCondition( HasMission, 1232)
	MisResultCondition( NoRecord, 1232)
	MisResultCondition( HasFlag, 1232, 59)
	MisResultAction( ClearMission, 1232)
	MisResultAction( SetRecord, 1232)
	MisResultAction( AddExpPer, 1)
	MisResultAction( AddMoney, 3000)

	InitTrigger() 
	TriggerCondition( 1, IsMonster, 284 )	
	TriggerAction( 1, AddNextFlag, 1232, 10, 50 )
	RegCurTrigger(12321)

	----------------------------------------
	DefineMission( 6169, "The Hero’s Relic", 1233)
	MisBeginTalk( "<t>Young man, you are very kind! God bless you, this is the location of Terra Gold Ore (Magical Ocean 1381,3134), here you are, I think it will be helpful.")
	MisBeginCondition( NoMission, 1233)
	MisBeginCondition( NoRecord, 1233)
	MisBeginCondition( HasRecord, 1232)
	MisBeginAction( AddMission, 1233)
	MisBeginAction( AddTrigger, 12331, TE_KILL, 65, 10 )
	MisBeginAction( AddTrigger, 12332, TE_GETITEM, 1783, 50)
	MisCancelAction( ClearMission, 1233)

	MisNeed( MIS_NEED_KILL, 65, 10, 10, 10)
	MisNeed( MIS_NEED_ITEM, 1783, 50, 20, 50)

	MisResultTalk( "<t>I have finally found the legendary treasure! <n><t> What the hell is this? I don’t get it! <n><t> Damn it! Why do I only get this crap after I’ve made such an effort? <n><t> The treasure is useless to me so you can have it.")
	MisHelpTalk( "<t>Go go go!!")
	MisResultCondition( HasMission, 1233)
	MisResultCondition( NoRecord, 1233)
	MisResultCondition( HasFlag, 1233, 19)
	MisResultCondition( HasItem, 1783, 50)
	MisResultAction( TakeItem, 1783, 50)
	MisResultAction( ClearMission, 1233)
	MisResultAction( SetRecord, 1233)
	MisResultAction( AddExpPer, 1)
	MisResultAction( AddMoney , 5000)
	MisResultAction( AddExpAndType, 2, 80000, 80000)

	InitTrigger()
	TriggerCondition(1, IsMonster, 65)
	TriggerAction(1, AddNextFlag, 1233, 10, 10)
	RegCurTrigger(12331)

	InitTrigger()
	TriggerCondition(1, IsItem, 1783)
	TriggerAction(1, AddNextFlag, 1233, 20, 50)
	RegCurTrigger(12332)

	----------------------------------------------
	DefineMission( 6170, "The Brave Love", 1234)
	MisBeginTalk( "<t> Afterwards, I found out that the so-called treasure was the love letter of a hero.<n><t> Since then many loathsome monsters had been bothering our village, and the hero had to hide his love for the girl as he fought against those monsters.<n><t> After many years, we were able to lead a peaceful life again. We all respect this hero, because to save our village he gave up that girl. <n><t> Can you deliver this love letter to that girl? <n><t> It has been said that the girl lives on a small island in the Treasure Gulf.<n><t> Hey, don’t be so impatient, I haven’t finished talking... A gift prepared by the hero was stolen by monsters, you should get it back and give it to his girl. ")
	MisBeginCondition( NoMission, 1234)
	MisBeginCondition( NoRecord, 1234)
	MisBeginCondition( HasRecord, 1233)
	MisBeginAction( AddMission, 1234)
	MisBeginAction( GiveItem, 2671, 1, 4)
	MisBeginAction( AddTrigger, 12341, TE_GETITEM, 2671, 1)
	MisBeginAction( AddTrigger, 12342, TE_GETITEM, 4503, 1)
	MisBeginAction( AddTrigger, 12343, TE_GETITEM, 3361, 89)
	MisCancelAction( ClearMission, 1234)
	MisBeginBagNeed(1)

	MisHelpTalk( "<t>Now go!")
	MisNeed( MIS_NEED_DESP, " Give the hero’s relic,89 pearls and 1 Crown to Elizabeth in the Treasure Gulf.")
	MisNeed( MIS_NEED_ITEM, 2671, 1, 10, 1)
	MisNeed( MIS_NEED_ITEM, 4503, 1, 20, 1)
	MisNeed( MIS_NEED_ITEM, 3361, 89, 30, 89)

	MisResultCondition( AlwaysFailure )
	---------------------------------------------
	DefineMission( 6171, "The Brave Love", 1234, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )
	
	MisResultTalk( "<t>Thank you so much, so many years have passed... to finally hear from him... <n><t>Please accept this reward for bringing me so much joy.")
	MisResultCondition( HasItem, 2671, 1)
	MisResultCondition( HasItem, 4503, 1)
	MisResultCondition( HasItem, 3361, 89)
	MisResultCondition( HasMission, 1234)
	MisResultCondition( NoRecord, 1234)
	MisResultAction( TakeItem, 2671, 1)
	MisResultAction( TakeItem, 4503, 1)
	MisResultAction( TakeItem, 3361, 89)
	MisResultAction( ClearMission, 1234)
	MisResultAction( SetRecord, 1234)
	MisResultAction( AddExpPer, 2)
	MisResultAction( AddMoney, 300000)
	MisResultAction( AddReadingBook )                       ------给予本职业的初级读物

	InitTrigger()
	TriggerCondition(1, IsItem, 2671)
	TriggerAction(1, AddNextFlag, 1234, 10, 1)
	RegCurTrigger(12341)

	InitTrigger()
	TriggerCondition(1, IsItem, 4503)
	TriggerAction(1, AddNextFlag, 1234, 20, 1)
	RegCurTrigger(12342)

	InitTrigger()
	TriggerCondition(1, IsItem, 3361)
	TriggerAction(1, AddNextFlag, 1234, 30, 89)
	RegCurTrigger(12343)


	-------------------------------------------------------
	DefineMission( 6172, "The Brave Love", 1235)
	MisBeginTalk( "<t> There is still much room for improvement. You’d better visit Blurry, he will teach you a lot.")
	MisBeginCondition( NoMission, 1235)
	MisBeginCondition( NoRecord, 1235)
	MisBeginCondition( HasRecord, 1234)
	MisBeginAction( AddMission, 1235)
	MisCancelAction( ClearMission, 1235)

	MisHelpTalk( "<t> Blurry will give you some directions.")
	MisNeed( MIS_NEED_DESP, "To Find Blurry in Argent City.")

	MisResultCondition( AlwaysFailure )
	--------------------------------------------------------
	DefineMission( 6173, "The Brave Love", 1235, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>Well done, I should have more tasks to assign to you.")
	MisResultCondition( HasMission, 1235)
	MisResultCondition( NoRecord, 1235)
	MisResultAction( ClearMission, 1235)
	MisResultAction( SetRecord, 1235)
	MisResultAction( AddMoney, 88)

	MisResultAction(ClearRecord, 1231)---------------可以反复接
	MisResultAction(ClearRecord, 1232)---------------可以反复接
	MisResultAction(ClearRecord, 1233)---------------可以反复接
	MisResultAction(ClearRecord, 1234)---------------可以反复接
	MisResultAction(ClearRecord, 1235)---------------可以反复接

	-------------------------------四季发财----------客栈老板·龙女
	DefineMission( 6174, "四季发财", 1236)
	MisBeginTalk( "<t>春夏秋冬4张牌都在秋香(秋岛2722,3137)这个臭丫头身上,帮我找回来吧,我会重重酬谢你的.")
	MisBeginCondition( NoMission, 1236)
	MisBeginCondition( NoRecord, 1236)
	MisBeginCondition( LvCheck, "<", 80)
	MisBeginAction( AddMission, 1236)
	MisBeginAction( AddTrigger, 12361, TE_GETITEM, 2969, 1)
	MisBeginAction( AddTrigger, 12362, TE_GETITEM, 2970, 1)
	MisBeginAction( AddTrigger, 12363, TE_GETITEM, 2971, 1)
	MisBeginAction( AddTrigger, 12364, TE_GETITEM, 2972, 1)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP, "从秋香那里夺回麻将牌(春),麻将牌(夏),麻将牌(秋),麻将牌(冬)给龙女(春岛3302,2501),秋香就在秋岛(2722,3137)")
	MisNeed( MIS_NEED_ITEM, 2969, 1, 10, 1)
	MisNeed( MIS_NEED_ITEM, 2970, 1, 20, 1)
	MisNeed( MIS_NEED_ITEM, 2971, 1, 30, 1)
	MisNeed( MIS_NEED_ITEM, 2972, 1, 40, 1)

	MisResultTalk( "<t>哇!就是这4张牌,太好了!成为牌界第一人的宿愿今天得到实现.")
	MisHelpTalk( "<t>一定要帮我找回那四张牌啊,我成为牌界第一人的梦想就靠你了!")
	MisResultCondition( HasMission, 1236)
	MisResultCondition( NoRecord, 1236)
	MisResultCondition( HasItem, 2969, 1)
	MisResultCondition( HasItem, 2970, 1)
	MisResultCondition( HasItem, 2971, 1)
	MisResultCondition( HasItem, 2972, 1)
	MisResultAction( TakeItem, 2969, 1)
	MisResultAction( TakeItem, 2970, 1)
	MisResultAction( TakeItem, 2971, 1)
	MisResultAction( TakeItem, 2972, 1)
	MisResultAction( ClearMission, 1236)
	MisResultAction( SetRecord, 1236)
	MisResultAction( AddExpNextLv1 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 2969)	
	TriggerAction( 1, AddNextFlag, 1236, 10, 1 )
	RegCurTrigger( 12361 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2970)	
	TriggerAction( 1, AddNextFlag, 1236, 20, 1 )
	RegCurTrigger( 12362 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2971)	
	TriggerAction( 1, AddNextFlag, 1236, 30, 1 )
	RegCurTrigger( 12363 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2972)	
	TriggerAction( 1, AddNextFlag, 1236, 40, 1 )
	RegCurTrigger( 12364 )

---------------------------------八方进宝------------客栈老板·龙女
	DefineMission( 6175, "八方进宝", 1237)
	MisBeginTalk( "<t>春夏秋冬4张牌都在秋香(秋岛2722,3137)这个臭丫头身上,其中梅,兰,竹,菊在夏岛的西门庆(3734,2661)的身上,快点帮我找回来吧,我会重重酬谢你的!")
	MisBeginCondition( NoMission, 1237)
	MisBeginCondition( NoRecord, 1237)
	MisBeginCondition( LvCheck, "<", 90)
	MisBeginAction( AddMission, 1237)
	MisBeginAction( AddTrigger, 12371, TE_GETITEM, 2969, 1)
	MisBeginAction( AddTrigger, 12372, TE_GETITEM, 2970, 1)
	MisBeginAction( AddTrigger, 12373, TE_GETITEM, 2971, 1)
	MisBeginAction( AddTrigger, 12374, TE_GETITEM, 2972, 1)
	MisBeginAction( AddTrigger, 12375, TE_GETITEM, 2973, 1)
	MisBeginAction( AddTrigger, 12376, TE_GETITEM, 2974, 1)
	MisBeginAction( AddTrigger, 12377, TE_GETITEM, 2975, 1)
	MisBeginAction( AddTrigger, 12378, TE_GETITEM, 2976, 1)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP, "在夏岛的西门庆(3734,2661)的身上,找齐春夏秋冬梅兰竹菊8张麻将牌给龙女(春岛3302,2501)")
	MisNeed( MIS_NEED_ITEM, 2969, 1, 10, 1)
	MisNeed( MIS_NEED_ITEM, 2970, 1, 20, 1)
	MisNeed( MIS_NEED_ITEM, 2971, 1, 30, 1)
	MisNeed( MIS_NEED_ITEM, 2972, 1, 40, 1)
	MisNeed( MIS_NEED_ITEM, 2973, 1, 50, 1)
	MisNeed( MIS_NEED_ITEM, 2974, 1, 60, 1)
	MisNeed( MIS_NEED_ITEM, 2975, 1, 70, 1)
	MisNeed( MIS_NEED_ITEM, 2976, 1, 80, 1)

	MisResultTalk( "<t>你太完美了,我要嫁给你!让你知道我雀王之王的魅力!")
	MisHelpTalk( "<t>快点去吧,如果你帮我找回了这8张牌,我是不会亏待你的.")
	MisResultCondition( HasMission, 1237)
	MisResultCondition( NoRecord, 1237)
	MisResultCondition( HasItem, 2969, 1)
	MisResultCondition( HasItem, 2970, 1)
	MisResultCondition( HasItem, 2971, 1)
	MisResultCondition( HasItem, 2972, 1)
	MisResultCondition( HasItem, 2973, 1)
	MisResultCondition( HasItem, 2974, 1)
	MisResultCondition( HasItem, 2975, 1)
	MisResultCondition( HasItem, 2976, 1)
	MisResultAction( TakeItem, 2969, 1)
	MisResultAction( TakeItem, 2970, 1)
	MisResultAction( TakeItem, 2971, 1)
	MisResultAction( TakeItem, 2972, 1)
	MisResultAction( TakeItem, 2973, 1)
	MisResultAction( TakeItem, 2974, 1)
	MisResultAction( TakeItem, 2975, 1)
	MisResultAction( TakeItem, 2976, 1)
	MisResultAction( ClearMission, 1237)
	MisResultAction( SetRecord, 1237)
	MisResultAction( AddExpNextLv2 )
	MisResultAction(ClearRecord, 1236)---------------可以反复接
	MisResultAction(ClearRecord, 1237)---------------可以反复接
	MisResultAction(ClearRecord, 1238)---------------可以反复接
	MisResultAction(ClearRecord, 1239)---------------可以反复接
	MisResultAction(ClearRecord, 1240)---------------可以反复接
	MisResultAction(ClearRecord, 1241)---------------可以反复接
	MisResultAction(ClearRecord, 1242)---------------可以反复接
	MisResultAction(ClearRecord, 1243)---------------可以反复接
	MisResultAction(ClearRecord, 1244)---------------可以反复接
	MisResultAction(ClearRecord, 1245)---------------可以反复接
	MisResultAction(ClearRecord, 1246)---------------可以反复接

	InitTrigger()
	TriggerCondition( 1, IsItem, 2969)	
	TriggerAction( 1, AddNextFlag, 1237, 10, 1 )
	RegCurTrigger( 12371 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2970)	
	TriggerAction( 1, AddNextFlag, 1237, 20, 1 )
	RegCurTrigger( 12372 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2971)	
	TriggerAction( 1, AddNextFlag, 1237, 30, 1 )
	RegCurTrigger( 12373 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2972)	
	TriggerAction( 1, AddNextFlag, 1237, 40, 1 )
	RegCurTrigger( 12374 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2973)	
	TriggerAction( 1, AddNextFlag, 1237, 50, 1 )
	RegCurTrigger( 12375 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2974)	
	TriggerAction( 1, AddNextFlag, 1237, 60, 1 )
	RegCurTrigger( 12376 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2975)	
	TriggerAction( 1, AddNextFlag, 1237, 70, 1 )
	RegCurTrigger( 12377 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 2976)	
	TriggerAction( 1, AddNextFlag, 1237,80, 1 )
	RegCurTrigger( 12378 )

----------------------------------心之锁----------西门庆
	DefineMission( 6176, "心之锁", 1238)
	MisBeginTalk( "<t>金莲姑娘是我今生的唯一,我需要如意钥匙打开她心灵的枷锁,你可以去找海盗的情圣沙岚城大使·席巴(加纳2256,2707)他可以给你提示.")
	MisBeginCondition( NoMission, 1238)
	MisBeginCondition( NoRecord, 1238)
	MisBeginCondition( HasMission, 1237)
	MisBeginAction( AddMission, 1238)
	MisBeginAction( AddTrigger, 12381, TE_GETITEM, 2965, 1)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP,"去找沙岚城大使·席巴(加纳2256,2707)拿如意钥匙,并带回给夏岛西门庆(3734,2661).")
	MisNeed( MIS_NEED_ITEM, 2965, 1, 10, 1)

	MisResultTalk( "<t>Oh,baby!就是这把如意钥匙,今晚我就拿这把去开启金莲的心门.")
	MisHelpTalk( "<t>席巴一定知道如意钥匙的下落，去问问他吧")
	MisResultCondition( HasMission, 1238)
	MisResultCondition( NoRecord, 1238)
	MisResultCondition( HasItem, 2965, 1)
	MisResultAction( TakeItem, 2965, 1)
	MisResultAction( ClearMission, 1238)
	MisResultAction( SetRecord, 1238)
	MisResultAction( GiveItem, 2974, 1, 4)
	MisResultBagNeed(1)


	InitTrigger()
	TriggerCondition( 1, IsItem, 2965)	
	TriggerAction( 1, AddNextFlag, 1238, 10, 1 )
	RegCurTrigger( 12381 )

----------------------------------心之锁----------沙岚城大使·席巴
	DefineMission( 6177, "心之锁", 1239)
	MisBeginTalk( "<t>黑珍珠是世界上人人追求的宝贝,我的孙女很要拥有2个黑珍珠来镶嵌她白金的手镯上,据说可以在春岛的狐妖,狐道士身上找到,如果你能找来2个给我的话,我就把我珍藏多年的如意钥匙送给你!!")
	MisBeginCondition( HasMission, 1238)
	MisBeginCondition( NoRecord, 1239)
	MisBeginCondition( NoMission, 1239)
	MisBeginAction( AddMission, 1239)
	MisBeginAction( AddTrigger, 12391, TE_GETITEM, 3362, 2)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP, "在春岛的那些狐狸身上找2个黑珍珠给席巴")
	MisNeed( MIS_NEED_ITEM, 3362, 2, 10, 2)

	MisResultTalk( "<t>黑珍珠是多好的宝物,我已经拥有了它,我的孙女一定会很高兴.")
	MisHelpTalk( "<t>黑珍珠春岛的那些狐狸身上就有.")
	MisResultCondition( HasMission, 1239)
	MisResultCondition( NoRecord, 1239)
	MisResultCondition( HasItem, 3362, 2)
	MisResultAction( TakeItem, 3362, 2)
	MisResultAction( ClearMission, 1239)
	MisResultAction( SetRecord, 1239)
	MisResultAction( GiveItem, 2965, 1, 4)
	MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 3362)	
	TriggerAction( 1, AddNextFlag, 1239, 10, 2 )
	RegCurTrigger( 12391 )
	
---------------------------------陈年的红酒-----------西门庆
	DefineMission( 6178, "陈年的红酒", 1240)
	MisBeginTalk( "<t>浪漫的夜晚怎么能缺少美味的红酒,我在冰狼的旅店老板·约瑟夫(1291,541)那定了1瓶陈年的红酒,你可以去帮我取回来吗?")
	MisBeginCondition( NoMission, 1240)
	MisBeginCondition( NoRecord, 1240)
	MisBeginCondition( HasMission, 1237)
	MisBeginCondition( HasRecord, 1238)
	MisBeginAction( AddMission, 1240)
	MisBeginAction( AddTrigger, 12401, TE_GETITEM, 2977, 1)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP, "在冰狼的旅店老板·约瑟夫(1291,541)那帮西门庆(3734,2661)取来一瓶陈年的红酒")
	MisNeed( MIS_NEED_ITEM, 2977, 1, 10, 1)

	MisResultTalk( "<t>这将是一个令人期待的夜晚,我要和金莲姑娘一醉方休.")
	MisHelpTalk( "<t>快点去吧")
	MisResultCondition( HasMission, 1240)
	MisResultCondition( NoRecord, 1240)
	MisResultCondition( HasItem, 2977, 1)
	MisResultAction( TakeItem, 2977, 1)
	MisResultAction( ClearMission, 1240)
	MisResultAction( SetRecord, 1240)
	MisResultAction( GiveItem, 2976, 1, 4)
	MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2977)	
	TriggerAction( 1, AddNextFlag, 1240, 10, 1 )
	RegCurTrigger( 12401 )

---------------------------------陈年的红酒------------旅店老板·约瑟夫
	DefineMission( 6179, "陈年的红酒", 1241)
	MisBeginTalk( "<t>我这有特制的世界最美味的红酒,你想买吗?有钱也不卖你!除非你有我想要的!<n><t>请拿麻将牌杠3个,麻将牌碰3个,麻将牌胡3个,椰果酒70个来和我换.")
	MisBeginCondition( NoMission, 1241)
	MisBeginCondition( NoRecord, 1241)
	MisBeginCondition( HasMission, 1240)
	MisBeginAction( AddMission, 1241)
	
	MisBeginAction( AddTrigger, 12411, TE_GETITEM, 0172, 3)
	MisBeginAction( AddTrigger, 12412, TE_GETITEM, 0173, 3)
	MisBeginAction( AddTrigger, 12413, TE_GETITEM, 0174, 3)
	MisBeginAction( AddTrigger, 12414, TE_GETITEM, 3916, 70)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP, "找来约瑟夫需要的道具,那些麻将牌在下水道的僵尸身上有,椰果酒在白银城有卖哦")
	
	MisNeed( MIS_NEED_ITEM, 0172, 3, 5, 3)
	MisNeed( MIS_NEED_ITEM, 0173, 3, 10, 3)
	MisNeed( MIS_NEED_ITEM, 0174, 3, 15, 3)
	MisNeed( MIS_NEED_ITEM, 3916, 70, 20, 70)

	MisResultTalk( "<t>真的是我要的东西,实在太感谢你了.")
	MisHelpTalk( "<t>我这里的红酒可是世界闻名的哦.")
	MisResultCondition( HasMission, 1241)
	MisResultCondition( NoRecord, 1241)
	MisResultCondition( HasItem, 3916, 70)
	MisResultCondition( HasItem, 172, 3)
	MisResultCondition( HasItem, 173, 3)
	MisResultCondition( HasItem, 174, 3)
	MisResultAction( TakeItem, 3916, 70)
	MisResultAction( TakeItem, 172, 3)
	MisResultAction( TakeItem, 173, 3)
	MisResultAction( TakeItem, 174, 3)
	MisResultAction( ClearMission, 1241)
	MisResultAction( SetRecord, 1241)



	
	InitTrigger()
	TriggerCondition( 1, IsItem, 0172)	
	TriggerAction( 1, AddNextFlag, 1241, 5, 3 )
	RegCurTrigger( 12411 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 0173)	
	TriggerAction( 1, AddNextFlag, 1241, 10, 3)
	RegCurTrigger( 12412 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 0174)	
	TriggerAction( 1, AddNextFlag, 1241, 15, 3 )
	RegCurTrigger( 12413 )
	InitTrigger()
	TriggerCondition( 1, IsItem, 3916)	
	TriggerAction( 1, AddNextFlag, 1241, 20, 70 )
	RegCurTrigger( 12414 )
	
	
--------------------------------陈年的红酒------------旅店老板·约瑟夫
	DefineMission( 6180, "陈年的红酒", 1242)
	MisBeginTalk( "<t>太不巧了,我这里现在没有陈年的红酒,这样吧,这瓶红酒你帮我保管一下,明天再还给我!")
	MisBeginCondition( NoMission, 1242)
	MisBeginCondition( NoRecord, 1242)
	MisBeginCondition( HasRecord, 1241)
	MisBeginAction( AddMission, 1242)
	MisBeginAction( AddChaHJ )--------耐久为1440
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	MisBeginBagNeed(1)

	MisNeed( MIS_NEED_DESP, "将约瑟夫给的红酒放在背包第二格,等耐久没了以后再去还给约瑟夫.")
	
	MisResultTalk( "<t>红酒啊红酒,放的时间越长越珍贵.")
	MisHelpTalk( "<t>把红酒放在背包第二格就行了.")
	MisResultCondition( CheckHJ )-----1分钟扣1点,扣到0
	MisResultCondition( NoRecord, 1242)
	MisResultCondition( HasMission, 1242)
	MisResultAction( ClearMission, 1242)
	MisResultAction( SetRecord, 1242)
	MisResultAction( TakeItem, 2967, 1)
	MisResultAction( GiveItem, 2977, 1, 4)
	MisResultBagNeed(1)

----------------------------------找回玫瑰花瓣-------------西门庆
	DefineMission( 6181, "找回玫瑰花瓣", 1243)
	MisBeginTalk( "<t>玫瑰花瓣爱情的象征,我记得冰狼的米歇尔梅林芬(1280,478)那有玫瑰花瓣,可以帮我去取一些吗?")
	MisBeginCondition( NoMission, 1243)
	MisBeginCondition( NoRecord, 1243)
	MisBeginCondition( HasMission, 1237)
	MisBeginCondition( HasRecord, 1238)
	MisBeginCondition( HasRecord, 1240)
	MisBeginAction( AddMission, 1243)
	MisBeginAction( AddTrigger, 12431, TE_GETITEM, 2968, 1)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP, "去帮西门庆从冰狼的米歇尔梅林芬(1280,478)那里取来玫瑰花瓣")
	MisNeed( MIS_NEED_ITEM, 2968, 1, 10, 1)

	MisResultTalk( "<t>噢!我的神那!居然有这么美丽的花瓣!你太令我惊奇了,今晚我一定要成功!")
	MisHelpTalk( "<t>美丽的玫瑰花瓣一定能打动金莲的!")
	MisResultCondition( HasMission, 1243)
	MisResultCondition( NoRecord, 1243)
	MisResultCondition( HasItem, 2968, 1)
	MisResultAction( ClearMission, 1243)
	MisResultAction( SetRecord, 1243)
	MisResultAction( TakeItem, 2968, 1)
	MisResultAction( GiveItem, 2973, 1, 4)
	MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2968)	
	TriggerAction( 1, AddNextFlag, 1243, 10, 1 )
	RegCurTrigger( 12431 )

----------------------------------找回玫瑰花瓣-------------米歇尔梅林芬
	DefineMission( 6182, "找回玫瑰花瓣", 1244)
	MisBeginTalk( "<t>传闻海底隧道的长绒蟹,小冰龙,被诅咒的水仙子经常骚扰路人.我需要你带回火绒3个,龙鳞3个,生命晶石3个,来证明你的实力.如果完成任务就可以到我这里换取玫瑰花瓣作为奖励.")
	MisBeginCondition( NoMission, 1244)
	MisBeginCondition( NoRecord, 1244)
	MisBeginCondition( HasMission, 1243)
	MisBeginAction( AddMission, 1244)
	MisBeginAction( AddTrigger, 12441, TE_GETITEM, 4259, 3)
	MisBeginAction( AddTrigger, 12442, TE_GETITEM, 1774, 3)
	MisBeginAction( AddTrigger, 12443, TE_GETITEM, 1632, 3)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP, "带3个火绒,3个龙鳞,3个生命晶石给米歇尔梅林芬")
	MisNeed( MIS_NEED_ITEM, 4259, 3, 10, 3)
	MisNeed( MIS_NEED_ITEM, 1774, 3, 20, 3)
	MisNeed( MIS_NEED_ITEM, 1632, 3, 30, 3)

	MisResultTalk( "<t>你才识真正的勇者,这是给你的奖励.")
	MisHelpTalk( "<t>火绒,龙鳞和生命晶石的话打海底隧道的长绒蟹,小冰龙,被诅咒的水仙子就有了.")
	MisResultCondition( HasMission, 1244)
	MisResultCondition( NoRecord, 1244)
	MisResultCondition( HasItem, 4259, 3)
	MisResultCondition( HasItem, 1774, 3)
	MisResultCondition( HasItem, 1632, 3)
	MisResultAction( TakeItem, 4259, 3)
	MisResultAction( TakeItem, 1774, 3)
	MisResultAction( TakeItem, 1632, 3)
	MisResultAction( SetRecord, 1244)
	MisResultAction( ClearMission, 1244)
	MisResultAction( GiveItem, 2968, 1, 4)
	MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4259)	
	TriggerAction( 1, AddNextFlag, 1244, 10, 3 )
	RegCurTrigger( 12441 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1774)	
	TriggerAction( 1, AddNextFlag, 1244, 10, 1 )
	RegCurTrigger( 12442 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1632)	
	TriggerAction( 1, AddNextFlag, 1244, 10, 1 )
	RegCurTrigger( 12443 )

---------------------------------找回精美的蜡烛-----------西门庆
	DefineMission( 6183, "找回精美的蜡烛", 1245)
	MisBeginTalk( "<t>今晚将是个难忘的夜晚,我需要些蜡烛来温暖年轻人的心扉,可以帮我去沙岚的小羊·威力(897,3683)那找些精美的蜡烛吗?")
	MisBeginCondition( NoMission, 1245)
	MisBeginCondition( NoRecord, 1245)
	MisBeginCondition( HasMission, 1237)
	MisBeginCondition( HasRecord, 1238)
	MisBeginCondition( HasRecord, 1240)
	MisBeginCondition( HasRecord, 1243)
	MisBeginAction( AddMission, 1245)
	MisBeginAction( AddTrigger, 12451, TE_GETITEM, 2966, 1)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")
	
	MisNeed( MIS_NEED_DESP, "找小羊·威力(魔女897,3683)拿来精美的蜡烛给夏岛的西门庆(3734,2661)")
	MisNeed( MIS_NEED_ITEM, 2966, 1, 10, 1)

	MisResultTalk( "<t>蜡烛一根根的点亮,你有这耐心吗?今晚又是个不眠之夜~")
	MisHelpTalk( "<t>浪漫的夜晚怎么能没有烛光呢?")
	MisResultCondition( HasMission, 1245)
	MisResultCondition( NoRecord, 1245)
	MisResultCondition( HasItem, 2966, 1)
	MisResultAction( TakeItem, 2966, 1)
	MisResultAction( SetRecord, 1245)
	MisResultAction( ClearMission, 1245)
	MisResultAction( GiveItem, 2975, 1, 4)
	MisResultBagNeed(1)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2966)	
	TriggerAction( 1, AddNextFlag, 1245, 10, 1 )
	RegCurTrigger( 12451 )

----------------------------------找回精美的蜡烛------------小羊·威力
	DefineMission( 6184, "找回精美的蜡烛", 1246)
	MisBeginTalk( "<t>我想要做一根非常美丽的项链,不过现在还少2个黄色水晶,2个玛那石结晶,如果你能去危险的夏岛去挑战蜥蜴战士和疯狂的蜥蜴人的话,应该可以找到我想要的东西.")
	MisBeginCondition( NoMission, 1246)
	MisBeginCondition( NoRecord, 1246)
	MisBeginCondition( HasMission, 1245)
	MisBeginAction( AddMission, 1246)
	MisBeginAction( AddTrigger, 12461, TE_GETITEM, 3367,2)
	MisBeginAction( AddTrigger, 12462, TE_GETITEM, 3380,2)
	MisCancelAction(SystemNotice, "This quest cannot be abandoned")

	MisNeed( MIS_NEED_DESP, "帮小羊·威力(魔女897,3683)在夏岛的蜥蜴战士和疯狂的蜥蜴人身上找到2个黄色水晶,2个玛那石结晶.<r记得回去找西门庆(3734,2661)>")
	MisNeed( MIS_NEED_ITEM, 3367, 2, 10, 2)
	MisNeed( MIS_NEED_ITEM, 3380, 2, 20, 2)

	MisResultTalk( "<t>你好慢啊!我头上都等出蜘蛛网了~")
	MisHelpTalk( "<t>水晶啊水晶..")
	MisResultCondition( HasMission, 1246)
	MisResultCondition( NoRecord, 1246)
	MisResultCondition( HasItem, 3367, 2)
	MisResultCondition( HasItem, 3380, 2)
	MisResultAction( TakeItem, 3380, 2)
	MisResultAction( TakeItem, 3367, 2)
	MisResultAction( SetRecord, 1246)
	MisResultAction( ClearMission, 1246)
	MisResultAction( GiveItem, 2966, 1, 4)

	MisResultBagNeed(1)

        InitTrigger()
	TriggerCondition( 1, IsItem, 3367)	
	TriggerAction( 1, AddNextFlag, 1246, 10, 2 )
	RegCurTrigger( 12461 )

	 InitTrigger()
	TriggerCondition( 1, IsItem, 3380)	
	TriggerAction( 1, AddNextFlag, 1246, 20, 2 )
	RegCurTrigger( 12462 )

------------------------护送圣诞老人------------ 	冰狼堡NPC圣诞老人（1216，550）
	DefineMission( 6185, "护送圣诞小老人", 1247)
	MisBeginTalk( "<t>每年有那么多小朋友在等我放圣诞礼物在他们的臭袜子里,不会分身术怎么能行?我用一根胡须变出一只圣诞老人替身.由于烟囱的口径大小不一,所以圣诞老人一律统一规格,采用小型号.虽说每年才过一次圣诞,但仍然导致我胡子稀疏了.我的兄弟克瑞斯莫斯的胡子已经拔光带假的了,或许你愿意帮我跑一趟.借给他一个小老人.")
	MisBeginCondition( NoMission, 1247)
	MisBeginCondition( NoRecord, 1247)
	MisBeginCondition( HasItem, 2878, 1)
	MisBeginAction( TakeItem, 2878, 1)
	MisBeginAction( AddMission, 1247)
	MisBeginAction( CreatBBBB, 929)
	MisCancelAction( ClearMission, 1247)

	MisHelpTalk( "<t>请在<r一小时内将圣诞小老人送到卡特尔>那,记得要<r徒步>走到冰极骷髅营地补给站(2111,557),任何<r跳转地图、使用机票、离开被护送的NPC视野范围>等行为都将造成圣诞小老人的丢失.切记!")
	MisNeed( MIS_NEED_DESP, "请在<r一小时内将圣诞小老人送到克瑞斯莫斯>那,记得要<r徒步>走到冰极骷髅营地补给站(2111,557).为了圣诞老人的安全,请不要<r跳转地图、使用机票、下线、离开被护送的NPC视野范围>等.<b该任务只能接取一次,中断会造成护送资格证的损失,要谨慎哦>.")

	MisResultCondition( AlwaysFailure )


--------------------------------------------------------护送圣诞老人--------冰极骷髅营地补给站(2111,557)
	DefineMission( 6186, "护送圣诞小老人", 1247, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>谢谢你.我的假胡子还很逼真吧.呵呵")
	MisResultCondition( HasMission, 1247)
	MisResultCondition( NoRecord, 1247)
	MisResultAction( CheckBBBB)
	MisResultAction( ClearMission, 1247)
	MisResultAction( SetRecord, 1247)
	MisResultAction( GiveItem, 2888, 1, 4)
	MisResultAction( GiveItem, 2889, 1, 4)
	MisResultAction( GiveItem, 3240, 1, 4)
	MisResultBagNeed(3)
	
------------------------------火鸡大猎捕	
	DefineMission( 6187, "火鸡大猎捕", 1248)
	MisBeginTalk( "<t>我讨厌这圣洁雪白的冬天.朋友，为什么不抛弃这些无聊的庆祝活动出去杀戮一番呢?也许城外那些到处乱跑的火鸡是个不错的目标,去给我杀掉一些,然后把它们掉落的火鸡的羽毛带过来给我,数量嘛就100个吧.")
	MisBeginCondition( NoMission, 1248)
	MisBeginCondition( NoRecord, 1248)
	MisBeginAction( AddMission, 1248)
	MisBeginAction(AddTrigger, 12481, TE_GETITEM, 2879, 100 )
	MisCancelAction( ClearMission, 1248)

	MisNeed(MIS_NEED_ITEM, 2879, 100, 10, 100 )
	MisHelpTalk( "<t>火鸡在白银城,冰狼堡和沙岚城城外到处都是")

	MisResultTalk( "<t>干的好,你不觉得鲜血也是这个洁白圣诞节的点缀之一吗?")
	MisResultCondition( HasMission, 1248)
	MisResultCondition( NoRecord, 1248)
	MisResultCondition( HasItem, 2879, 100)
	MisResultAction( TakeItem, 2879, 100)
	MisResultAction( GiveItem, 2882, 1, 4)
	MisResultAction( CpHuojiNum )
	MisResultAction( ClearMission, 1248)
	MisResultAction( SetRecord, 1248)
	MisResultAction( ClearRecord, 1248)


	InitTrigger()
	TriggerCondition( 1, IsItem, 2879)	
	TriggerAction( 1, AddNextFlag, 1248, 10, 100 )
	RegCurTrigger( 12481 )

------------------------------麋鹿大猎捕	
	DefineMission( 6188, "麋鹿大猎捕", 1249)
	MisBeginTalk( "<t>我讨厌这圣洁雪白的冬天.朋友，为什么不抛弃这些无聊的庆祝活动出去杀戮一番呢?也许城外那些到处乱跑的邪恶麋鹿是个不错的目标,去给我杀掉一些,然后把它们掉落的麋鹿的尖角带过来给我,数量嘛就100个吧.")
	MisBeginCondition( NoMission, 1249)
	MisBeginCondition( NoRecord, 1249)
	MisBeginAction( AddMission, 1249)
	MisBeginAction(AddTrigger, 12491, TE_GETITEM, 2881, 100 )
	MisCancelAction( ClearMission, 1249)

	MisNeed(MIS_NEED_ITEM, 2881, 100, 10, 100 )
	MisHelpTalk( "<t>邪恶麋鹿在白银城,冰狼堡和沙岚城城外到处都是")

	MisResultTalk( "<t>干的好,你不觉得鲜血也是这个洁白圣诞节的点缀之一吗?")
	MisResultCondition( HasMission, 1249)
	MisResultCondition( NoRecord, 1249)
	MisResultCondition( HasItem, 2881, 100)
	MisResultAction( TakeItem, 2881, 100)
	MisResultAction( GiveItem, 2882, 1, 4)
	MisResultAction( CpMiluNum )
	MisResultAction( ClearMission, 1249)
	MisResultAction( SetRecord, 1249)
	MisResultAction( ClearRecord, 1249)


	InitTrigger()
	TriggerCondition( 1, IsItem, 2881)	
	TriggerAction( 1, AddNextFlag, 1249, 10, 100 )
	RegCurTrigger( 12491 )

------------------------------雪人大猎捕	
	DefineMission( 6189, "雪人大猎捕", 1250)
	MisBeginTalk( "<t>我讨厌这圣洁雪白的冬天.朋友，为什么不抛弃这些无聊的庆祝活动出去杀戮一番呢?也许城外那些到处乱跑的圣诞雪人是个不错的目标,去给我杀掉一些,然后把它们掉落的雪人的眼球带过来给我,数量嘛就100个吧.")
	MisBeginCondition( NoMission, 1250)
	MisBeginCondition( NoRecord, 1250)
	MisBeginAction( AddMission, 1250)
	MisBeginAction(AddTrigger, 12501, TE_GETITEM, 2880, 100 )
	MisCancelAction( ClearMission, 1250)

	MisNeed(MIS_NEED_ITEM, 2880, 100, 10, 100 )
	MisHelpTalk( "<t>圣诞雪人在白银城,冰狼堡和沙岚城城外到处都是")

	MisResultTalk( "<t>干的好,你不觉得鲜血也是这个洁白圣诞节的点缀之一吗?")
	MisResultCondition( HasMission, 1250)
	MisResultCondition( NoRecord, 1250)
	MisResultCondition( HasItem, 2880, 100)
	MisResultAction( TakeItem, 2880, 100)
	MisResultAction( GiveItem, 2882, 1, 4)
	MisResultAction( CpXuerenNum )
	MisResultAction( ClearMission, 1250)
	MisResultAction( SetRecord, 1250)
	MisResultAction( ClearRecord, 1250)


	InitTrigger()
	TriggerCondition( 1, IsItem, 2880)	
	TriggerAction( 1, AddNextFlag, 1250, 10, 100 )
	RegCurTrigger( 12501 )


	----------------------------------------------------------不忍错过的圣诞任务(一)--------------圣诞村传送使
	DefineMission( 6190, "不忍错过的圣诞任务(一)", 1251)
	MisBeginTalk( "<t>没有火鸡的圣诞节是不完整的,我介绍圣诞村的斐谢特给你认识吧,在制做圣诞大餐这方面他很在行哦.")
	MisBeginCondition( NoMission, 1251)
	MisBeginCondition( NoRecord, 1251)
	MisBeginAction( AddMission, 1251)
	MisCancelAction( ClearMission, 1251)

	MisNeed( MIS_NEED_DESP, "去找斐谢特(220,41)聊聊.")
	MisHelpTalk( "<t>圣诞节很快就过去了,你要加快速度了.")
	
	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------不忍错过的圣诞任务(一)--------------斐谢特(220,41)
	DefineMission( 6191, "不忍错过的圣诞任务(一)", 1251, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>你好朋友,圣诞快乐!也许你早就听说了,我这里专门负责烹饪美味的火鸡肉和圣诞大餐,欢迎来品尝.")
	MisResultCondition( HasMission, 1251)
	MisResultCondition( NoRecord, 1251)
	MisResultAction( SetRecord, 1251)
	MisResultAction( GiveItem, 2883, 2, 4)
	MisResultAction( ClearMission, 1251)
	MisResultBagNeed(1)


	--------------------------------------------------------不忍错过的圣诞任务(二)-----------------圣诞村传送使
	DefineMission( 6192, "不忍错过的圣诞任务(二)", 1252)
	MisBeginTalk( "<t>不可否认科恩是个性感的名字,他有收购鸡毛、鹿角、雪人眼球的癖好.如果你想去圣诞竞技场,就不得不去认识他一下.")
	MisBeginCondition( NoMission, 1252)
	MisBeginCondition( NoRecord, 1252)
	MisBeginAction( AddMission, 1252)
	MisCancelAction( ClearMission, 1252)

	MisNeed( MIS_NEED_DESP, "去找圣诞村的科恩(144,252)聊聊.")
	MisHelpTalk( "<t>你已经认识过他了?")
	
	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------不忍错过的圣诞任务(二)--------------科恩(144,252)
	DefineMission( 6193, "不忍错过的圣诞任务(二)", 1252, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>圣诞快乐!想去圣诞竞技场吗?想要用鸡毛、鹿角、雪人眼球这些垃圾换点有用的东西吗?想知道杀死火鸡、麋鹿、雪人会发生什么可怕后果吗?")
	MisResultCondition( HasMission, 1252)
	MisResultCondition( NoRecord, 1252)
	MisResultAction( SetRecord, 1252)
	MisResultAction( GiveItem, 2883, 2, 4)
	MisResultAction( ClearMission, 1252)
	MisResultBagNeed(1)

	--------------------------------------------------------不忍错过的圣诞任务(三)--------------圣诞村传送使
	DefineMission( 6194, "不忍错过的圣诞任务(三)", 1253)
	MisBeginTalk( "<t>它可不是一个普通的洗衣机啊.如果你有污浊的圣诞礼盒,又正愁没有地方清洗,那就去找它吧.")
	MisBeginCondition( NoMission, 1253)
	MisBeginCondition( NoRecord, 1253)
	MisBeginAction( AddMission, 1253)
	MisCancelAction( ClearMission, 1253)

	MisNeed( MIS_NEED_DESP, "去找圣诞村的圣诞老人的洗衣机(84,37).")
	MisHelpTalk( "<t>洗刷刷~洗刷刷......")
	
	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------不忍错过的圣诞任务(三)--------------圣诞老人的洗衣机(84,37)
	DefineMission( 6195, "不忍错过的圣诞任务(三)", 1253, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>朋友,你有什么要洗的吗?臭袜子免谈.")
	MisResultCondition( HasMission, 1253)
	MisResultCondition( NoRecord, 1253)
	MisResultAction( SetRecord, 1253)
	MisResultAction( GiveItem, 2883, 2, 4)
	MisResultAction( ClearMission, 1253)
	MisResultBagNeed(1)

	--------------------------------------------------------不忍错过的圣诞任务(四)--------------圣诞村传送使
	DefineMission( 6196, "不忍错过的圣诞任务(四)", 1254)
	MisBeginTalk( "<t>哪里有买高级货的地方?当然是圣诞杂货商那里了,出门在外,多跟他打交道没有害处.")
	MisBeginCondition( NoMission, 1254)
	MisBeginCondition( NoRecord, 1254)
	MisBeginAction( AddMission, 1254)
	MisCancelAction( ClearMission, 1254)

	MisNeed( MIS_NEED_DESP, "去找圣诞村的圣诞杂货商(197,251).")
	MisHelpTalk( "<t>不如去认识一下圣诞杂货商.")
	
	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------不忍错过的圣诞任务(四)--------------圣诞杂货商(197,251)
	DefineMission( 6197, "不忍错过的圣诞任务(四)", 1254, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>圣诞狂欢大抢购!数量有限,先到先得.")
	MisResultCondition( HasMission, 1254)
	MisResultCondition( NoRecord, 1254)
	MisResultAction( SetRecord, 1254)
	MisResultAction( GiveItem, 2883, 2, 4)
	MisResultAction( ClearMission, 1254)
	MisResultBagNeed(1)


	--------------------------------------------------------不忍错过的圣诞任务(五)--------------圣诞村传送使
	DefineMission( 6198, "不忍错过的圣诞任务(五)", 1255)
	MisBeginTalk( "<t>这个浪漫的圣诞不要错过向爱人表达爱意的机会哦.")
	MisBeginCondition( NoMission, 1255)
	MisBeginCondition( NoRecord, 1255)
	MisBeginAction( AddMission, 1255)
	MisCancelAction( ClearMission, 1255)

	MisNeed( MIS_NEED_DESP, "去找圣诞村的圣诞商人·我行我酷(125,253).")
	MisHelpTalk( "<t>我行我酷!")
	
	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------不忍错过的圣诞任务(五)--------------圣诞商人·我行我酷(125,253)
	DefineMission( 6199, "不忍错过的圣诞任务(五)", 1255, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>我行我酷!认识我的那个同事吗,我酷我行,是一个秀自己,娱乐别人的行家呢.")
	MisResultCondition( HasMission, 1255)
	MisResultCondition( NoRecord, 1255)
	MisResultAction( SetRecord, 1255)
	MisResultAction( GiveItem, 2883, 2, 4)
	MisResultAction( ClearMission, 1255)
	MisResultBagNeed(1)


	--------------------------------------------------------不忍错过的圣诞任务(六)--------------圣诞村传送使
	DefineMission( 6200, "不忍错过的圣诞任务(六)", 1256)
	MisBeginTalk( "<t>圣诞节的最重要人物是谁?是你!对,当然,还有一个人,就是圣诞老人哦.")
	MisBeginCondition( NoMission, 1256)
	MisBeginCondition( NoRecord, 1256)
	MisBeginAction( AddMission, 1256)
	MisCancelAction( ClearMission, 1256)

	MisNeed( MIS_NEED_DESP, "去找圣诞村的圣诞老人(144,166)聊聊.")
	MisHelpTalk( "<t>merry christmas!")
	
	MisResultCondition( AlwaysFailure )

-----------------------------------------------------------不忍错过的圣诞任务(六)-------------圣诞老人(144,166)
	DefineMission( 6201, "不忍错过的圣诞任务(六)", 1256, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>merry christmas!准备好你的袜子了吗?哈哈,我身后的圣诞树可以送祝福给你在乎的人哦.")
	MisResultCondition( HasMission, 1256)
	MisResultCondition( NoRecord, 1256)
	MisResultAction( SetRecord, 1256)
	MisResultAction( GiveItem, 2883, 2, 4)
	MisResultAction( ClearMission, 1256)
	MisResultBagNeed(1)

-----------------------------------------------------------幻觉任务------------不可能接到
	DefineMission( 6202, "幻觉", 1257)		------------圣诞老人

	MisBeginTalk( "<t>当你看到这个任务的时候，你一定是产生幻觉了，相信我，你没看到.")
	MisBeginCondition( XmasNotice, 1 )
	MisBeginCondition( AlwaysFailure )
	MisBeginAction( AddMission, 1257)
	MisCancelAction( ClearMission, 1257)

	MisResultCondition( AlwaysFailure )

	DefineMission( 6203, "幻觉", 1258)		------------圣诞篝火

	MisBeginTalk( "<t>当你看到这个任务的时候，你一定是产生幻觉了，相信我，你没看到.")
	MisBeginCondition( XmasNotice, 2 )
	MisBeginCondition( AlwaysFailure )
	MisBeginAction( AddMission, 1258)
	MisCancelAction( ClearMission, 1258)

	MisResultCondition( AlwaysFailure )

	DefineMission( 6204, "幻觉", 1259)		------------科恩

	MisBeginTalk( "<t>当你看到这个任务的时候，你一定是产生幻觉了，相信我，你没看到.")
	MisBeginCondition( XmasNotice, 3 )
	MisBeginCondition( AlwaysFailure )
	MisBeginAction( AddMission, 1259)
	MisCancelAction( ClearMission, 1259)

	MisResultCondition( AlwaysFailure )

	DefineMission( 6205, "幻觉", 1260)		------------小汤姆

	MisBeginTalk( "<t>当你看到这个任务的时候，你一定是产生幻觉了，相信我，你没看到.")
	MisBeginCondition( XmasNotice, 4 )
	MisBeginCondition( AlwaysFailure )
	MisBeginAction( AddMission, 1260)
	MisCancelAction( ClearMission, 1260)

	MisResultCondition( AlwaysFailure )
	
	----------------------------铁人六项之一------------bragi（for 北美)----
	DefineMission( 6114, "The First Task", 1000)

	MisBeginTalk( "<t>Could you do me one more favor? Please send this letter to Shaitan Chairman Guile at (873, 3545).Hurry up. A higher experience is waiting for you!")
	MisBeginCondition( CheckTime )
	MisBeginCondition( NoMission, 1000)
	MisBeginCondition( NoRecord, 1000)
	MisBeginAction( GiveItem, 3292, 1, 4)
	MisBeginAction( AddMission, 1000)
	MisCancelAction( ClearMission, 1000)
	MisBeginBagNeed(1)
	
	MisNeed( MIS_NEED_DESP, "Please send this letter to Chairman Guile in the Shaitan City")
	
	MisHelpTalk( "<t>Guile is at (873,3545) in the Shaitan City. Good Luck.")
	MisResultCondition( AlwaysFailure )

----------------------------铁人六项之一
	DefineMission( 6115, "The First Task", 1000, COMPLETE_SHOW)

	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>A letter for me? Thanks.")
	MisResultCondition( HasMission, 1000)
	MisResultCondition( HasItem, 3292, 1)
	MisResultCondition( NoRecord, 1000)
	MisResultAction( TakeItem, 3292, 1)
	MisResultAction( SetRecord, 1000)
	MisResultAction( ClearMission, 1000)
	MisResultAction( AddExp_1)


-----------------------------铁人六项之二
	DefineMission( 6116, "The Second Task", 1001)

	MisBeginTalk( "<t>The Nurse Gina of Argent City wants a Super Candy Stick. ")
	MisBeginCondition( HasRecord, 1000)
	MisBeginCondition( NoMission, 1001)
	MisBeginCondition( NoRecord, 1001)
	MisBeginAction( AddMission, 1001)
	MisBeginAction(AddTrigger, 10011, TE_GETITEM, 3910, 1)
	MisCancelAction( ClearMission, 1001)

	MisNeed( MIS_NEED_DESP, "Go and buy a Super Candy Stick for Nurse Gina")
	MisNeed( MIS_NEED_ITEM, 3910, 1, 10, 1)

	MisHelpTalk( "<t>Super Candy Stick")
	MisResultCondition( AlwaysFailure )



----------------------------铁人六项之二
	DefineMission( 6117, "The Second Task", 1001, COMPLETE_SHOW)

	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>Your Super Candy Stick comes at the right time. I need it right now!")
	MisResultCondition( HasMission, 1001)
	MisResultCondition( NoRecord, 1001)
	MisResultCondition( HasItem, 3910, 1)
	MisResultAction( TakeItem, 3910, 1)
	MisResultAction( SetRecord, 1001)
	MisResultAction( ClearMission, 1001)
	MisResultAction( AddExp_1 )


	InitTrigger()
	TriggerCondition( 1, IsItem, 3910)	
	TriggerAction( 1, AddNextFlag, 1001, 10, 1 )
	RegCurTrigger( 10011 )

---------------------------铁人六项之三A
	DefineMission( 6118, "The Third Task", 1002)
	
	MisBeginTalk( "Recently, the grassland elks brought us a lot of trouble. Could you give them a lesson for us?")
	MisBeginCondition( HasRecord, 1001)
	MisBeginCondition( NoMission, 1002)
	MisBeginCondition( NoRecord, 1002)
	MisBeginCondition( NoRecord, 1003)
	MisBeginCondition( LvCheck, "<", 40)
	MisBeginAction( AddMission, 1002)
	MisBeginAction( AddTrigger, 10021, TE_KILL, 299, 20 )
	--MisBeginAction( AddTrigger, 10022, TE_KILL, 97, 5 )		--海草
	MisCancelAction( ClearMission, 1002)
	
	MisNeed( MIS_NEED_DESP, "Kill 20 grassland elks at Garner")
	MisNeed( MIS_NEED_KILL, 299, 20, 10, 20)
	--MisNeed( MIS_NEED_KILL, 97, 5, 25, 5)


	MisResultTalk( "<t>Well done. You completed it so quickly. I will reward you something.")
	MisHelpTalk( "<t>You can find grassland elks around the Garner at (1360, 2683).")
	MisResultCondition( HasMission, 1002)
	MisResultCondition( NoRecord, 1002)
	MisResultCondition( HasFlag, 1002, 29)
	MisResultAction( SetRecord, 1002)
	MisResultAction( SetRecord, 1003)
	MisResultAction( ClearMission, 1002)
	MisResultAction( AddExp, 13000, 13000)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 299)	
	TriggerAction( 1, AddNextFlag, 1002, 10, 20)
	RegCurTrigger( 10021 )

	--InitTrigger()
	--TriggerCondition( 1, IsMonster, 97)	
	--TriggerAction( 1, AddNextFlag, 1002, 25, 5 )
	--RegCurTrigger( 10022 )


----------------------------铁人三项之三B
	DefineMission( 6119, "The Third Task", 1004)
	
	MisBeginTalk( "Recently, the Pumpkin Knights brought us a lot of trouble. Could you give them a lesson for us?")
	MisBeginCondition( HasRecord, 1001)
	MisBeginCondition( NoMission, 1004)
	MisBeginCondition( NoMission, 1002)
	MisBeginCondition( NoRecord, 1003)
	MisBeginCondition( NoRecord, 1004)
	MisBeginCondition( LvCheck, ">", 39)
	MisBeginAction( AddMission, 1004)
	MisBeginAction( AddTrigger, 10041, TE_KILL, 37, 20 )
	--MisBeginAction( AddTrigger, 10042, TE_KILL, 97, 5 )
	MisCancelAction( ClearMission, 1004)
	
	MisNeed( MIS_NEED_DESP, "Kill 20 pumpkin knights at Silver Mine2 or Silver Mine3")
	MisNeed( MIS_NEED_KILL, 37, 20, 10, 20)
	--MisNeed( MIS_NEED_KILL, 97, 5, 25, 5)

	MisResultTalk( "<t>Wow~ Well done. You completed it so quickly. I will reward you something.")
	MisHelpTalk( "<t>The pumpkin knights are around the Garner at (622，3364).")
	MisResultCondition( HasMission, 1004)
	MisResultCondition( NoRecord, 1004)
	MisResultCondition( HasFlag, 1004, 29)
	MisResultAction( SetRecord, 1004)
	MisResultAction( SetRecord, 1003)
	MisResultAction( ClearMission, 1004)
	MisResultAction( AddExp_3)

	InitTrigger()
	TriggerCondition( 1, IsMonster, 37)		
	TriggerAction( 1, AddNextFlag, 1004, 10, 20 )
	RegCurTrigger( 10041 )

	--InitTrigger()
	--TriggerCondition( 1, IsMonster, 97)		
	--TriggerAction( 1, AddNextFlag, 1004, 25, 5 )
	--RegCurTrigger( 10042 )
----------------------------------铁人六项之四
	DefineMission( 6120, "The Fourth Task", 1005)
	MisBeginTalk( "<t> Now you are qualified to the fourth task. Collect 3 Wood ,3 Sashimi and 3 Iron Ore and give them to Greg at (1882, 2805) in Abandon Mine Haven.")
	MisBeginCondition( HasRecord, 1003)
	MisBeginCondition( NoMission, 1005)
	MisBeginCondition( NoRecord, 1005)
	MisBeginAction( AddMission, 1005)
	MisBeginAction(AddTrigger, 10051, TE_GETITEM, 4543, 3 )
	MisBeginAction(AddTrigger, 10052, TE_GETITEM, 4545, 3 )
	MisBeginAction(AddTrigger, 10053, TE_GETITEM, 1478, 3 )
	MisCancelAction( ClearMission, 1005)

	MisNeed( MIS_NEED_DESP, "Send 3 Wood and 3 Iron Ore to Greg at (1882, 2805) in Abandon Mine Haven.")
	MisNeed( MIS_NEED_ITEM, 4543, 3, 10, 3)
	MisNeed( MIS_NEED_ITEM, 4545, 3, 20, 3)
	MisNeed( MIS_NEED_ITEM, 1478, 3, 30, 3)

	MisHelpTalk( "<t>You can get the Wood by cutting down trees and get the Iron Ore by mining..")

	MisResultCondition( AlwaysFailure )

---------------------------------铁人六项之四
	DefineMission( 6121, "The Fourth Task", 1005, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )

	MisResultTalk( "<t>Your Wood and  Iron Ore come just at the right time. I need them right now.")
	MisResultCondition( HasMission, 1005)
	MisResultCondition( NoRecord, 1005)
	MisResultCondition( HasItem, 4543, 3)
	MisResultCondition( HasItem, 4545, 3)
	MisResultCondition( HasItem, 1478, 3)
	MisResultAction( TakeItem, 4543, 3)
	MisResultAction( TakeItem, 4545, 3)
	MisResultAction( TakeItem, 1478, 3)
	MisResultAction( SetRecord, 1005)
	MisResultAction( ClearMission, 1005)
	MisResultAction( AddExp_4)

	InitTrigger()
	TriggerCondition( 1, IsItem, 4543)	
	TriggerAction( 1, AddNextFlag, 1005, 10, 3 )
	RegCurTrigger( 10051 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 4545)	
	TriggerAction( 1, AddNextFlag, 1005, 20, 3 )
	RegCurTrigger( 10052 )

	InitTrigger()
	TriggerCondition( 1, IsItem, 1478)	
	TriggerAction( 1, AddNextFlag, 1005, 30, 3 )
	RegCurTrigger( 10053 )
-----------------------------------铁人六项之五
	DefineMission( 6122, "The Fifth Task", 1006)
	MisBeginTalk( "<t> The next task is collecting 5 Elven Signet and give them to Forbei at(2226,2726) in the Argent City.")
	MisBeginCondition( HasRecord, 1005)
	MisBeginCondition( NoMission, 1006)
	MisBeginCondition( NoRecord, 1006)
	MisBeginAction( AddMission, 1006)
	MisBeginAction(AddTrigger, 10061, TE_GETITEM, 2588, 5 )
	MisCancelAction( ClearMission, 1006)

	MisNeed( MIS_NEED_DESP, "Collect 5 Elven Signet and give them to Forbei at (2226,2726) in the Argent City")
	MisNeed( MIS_NEED_ITEM, 2588, 5, 10, 5)

	MisHelpTalk( "<t>It seems that you can only get the Fairy Coin from the Oyster.")
	MisResultCondition( AlwaysFailure )

-----------------------------------铁人六项之五
	DefineMission( 6123, "The Fifth Task", 1006, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )
	
	MisResultTalk( "<t> You are so strong.The pearls are so beautiful. Now you have the chance to do the final task. I believe you can do it.")
	MisResultCondition( HasMission, 1006)
	MisResultCondition( NoRecord, 1006)
	MisResultCondition( HasItem, 2588, 5)
	MisResultAction( TakeItem, 2588, 5)
	MisResultAction( SetRecord, 1006)
	MisResultAction( ClearMission, 1006)
	MisResultAction( AddExp_5)

	InitTrigger()
	TriggerCondition( 1, IsItem, 2588)	
	TriggerAction( 1, AddNextFlag, 1006, 10, 2 )
	RegCurTrigger( 10061 )

-----------------------------------铁人六项之六
	DefineMission( 6124, "The Sixth Task", 1007)
	MisBeginTalk( "<t>The final task is very simple. All you need to do is just finding another two people as you companions. And on you team, you must have one person whose level is from 20 to 30, another person whose level is from 31 to 40 and the other whose level is higher than 40.When you make it, you can go to find Swordsman Ray in the Lower Icicle Castle to get your award!")
	MisBeginCondition( HasRecord, 1006)
	MisBeginCondition( NoMission, 1007)
	MisBeginCondition( NoRecord, 1007)
	MisBeginAction( AddMission, 1007)
	MisCancelAction( ClearMission, 1007)

	MisHelpTalk( "<t>Go to find your companion")

	MisResultCondition( AlwaysFailure )

----------------------------------铁人六项之六
	DefineMission( 6125, "The Sixth Task", 1007, COMPLETE_SHOW)
	MisBeginCondition( AlwaysFailure )


	MisResultTalk( "<t>You are so great! congratulations! I will look forward to your performance next time.")
	MisResultCondition( HasMission, 1007)
	MisResultCondition( NoRecord, 1007)
	MisResultCondition( CheckTeam )
	MisResultAction( SetRecord, 1007)
	MisResultAction( ClearMission, 1007)
	MisResultAction( AddExp_6)

-----------------------------------铁人六项结束