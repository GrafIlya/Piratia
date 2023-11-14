function HasPirateGuild(role)
	if GetGuildID(role) > 0 then
		return LUA_TRUE
	else
		return LUA_FALSE
	end
end

function NoPirateGuild(role)
	if GetGuildID(role) == 0 then
		return LUA_TRUE
	else
		return LUA_FALSE
	end
end

function HasNavyGuild(role)
	return LUA_FALSE
end

function NoNavyGuild(role)
	if GetGuildID(role) == 0 then
		return LUA_TRUE
	else
		return LUA_FALSE
	end
end

function IsGuildType(role,gtype)
	if gtype ==1 and HasPirateGuild(role) then
		return LUA_TRUE
	else
		return LUA_FALSE
	end
end

--thundoria create guild
function r_talk24 ()
	Talk( 1, "Dessaro: Hi, I am the highest in command in Thundoria. It's a shame you can't join us." )
end 

--create guild (ici)
function r_talk80 ()
	
	
	Talk( 1, "Mas: My family history runs as deep as Icicle Castle. Everybody here know and respected me." )
	
	InitTrigger()
	TriggerCondition( 1, HasGuild)
	TriggerAction( 1, JumpPage, 4 )
	TriggerFailure( 1, JumpPage, 2 )
	Text( 1, "Regarding the legends of the Pirates", MultiTrigger, GetMultiTrigger(), 1)
	Text( 1, "Nothing...",CloseTalk )


	Talk( 2, "Mas: Hohoho...Pirates Crew? You wish to create one? That would have to depend on your ability." )

	InitTrigger()
	TriggerCondition( 2, HasMoney, 100000 )
	TriggerCondition( 2, HasItem, 1780, 1 )
	TriggerAction( 2, CreateGuild, 1 )
	TriggerFailure( 2, JumpPage, 3 )
	Text( 2, "Create a Guild", MultiTrigger, GetMultiTrigger(), 2)

	Talk( 3, "Mas: To be the leader of the pirates is not an easy matter. Bring 100000G and the Stone of Oath to prove your worth" )
	Talk( 4, "Mas: It seems you already have a guild... I can not help you." )


	AddNpcMission ( 253 )
	AddNpcMission ( 254 )
	AddNpcMission (	453 )
	AddNpcMission 	(698)
	AddNpcMission 	(801)
	AddNpcMission	(1004)
	AddNpcMission	(1059)
	AddNpcMission	(1114)
	AddNpcMission	(1168)
	AddNpcMission	(317)
	AddNpcMission	(321)
	AddNpcMission	(322)
-----------eleven
	AddNpcMission	(5045)
	AddNpcMission	(5046)
	AddNpcMission	(5047)

end 

--pirate guild
function r_talk211()

	Talk( 1, "Gewas: Hey! Want to know the world most notorious pirates? Want to join the pirates on their treasure hunt?" )
	InitTrigger()
	TriggerCondition( 1, HasGuild)
	TriggerAction( 1, JumpPage, 2 )
	TriggerCondition( 2, NoGuild )
	TriggerAction( 2, ListAllGuild, 1 )
	TriggerFailure( 2, JumpPage, 3 )
	Text( 1, "Check Guild List", MultiTrigger, GetMultiTrigger(), 3)
	Text( 1, "Leave", CloseTalk)
	Talk( 2, "Gewas: Hey! You are already in a guild!" )
end

--navy guild list
function r_talk212()
--no longer used, overwritten incase issues.		
end
