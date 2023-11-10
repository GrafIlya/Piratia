--table contains all objects placed in guild houses
guildObjects = guildObjects or {}
--table contains recorded locations of player before entering guild house.
guildHouseStoredMap = guildHouseStoredMap or {}

--index is iteminfo ID of object. Contains positioning of object
guildObjectID = {
	[15010] = {ID = 302, Action = {{ID = 351, offX = 0, offY = 35,offYaw = 0,offHeight = 10}}}, --bench 02
	[15011] = {ID = 234}, --New Barrel Group
	[15012] = {ID = 235, Action = {{ID = 352, offX = 0, offY = 0,offYaw = 0,offHeight = 0}}}, --New kask 01
	[15013] = {ID = 263, OffYaw = 270, Action = {{ID = 351, offX = 80, offY = 0,offYaw = 90,offHeight = 0},{ID = 351, offX = 180, offY = 0,offYaw = 90,offHeight = 0},}}, --Stone Bench 01
	[15014] = {ID = 314, OffYaw = 0, Action = {{ID = 351, offX = -30, offY = 40,offYaw = 0,offHeight = 0},{ID = 351, offX = 70, offY = 40,offYaw = 0,offHeight = 0},}}, --Bench 01
	
	[15015] = {ID = 315}, --flower 01
	[15016] = {ID = 316}, --long grass
	[15017] = {ID = 317}, --Blossom 02
	[15018] = {ID = 342}, --Big Chest
	[15019] = {ID = 347, Action = {{ID = 352, offX = 0, offY = 0,offYaw = 0,offHeight = 0}}}, --Wooden Barrel
	[15020] = {ID = 459}, --Rose Bush
	[15021] = {ID = 448}, --Small Tree 01
	[15022] = {ID = 313, OffYaw = 180, Action = {{ID = 351, offX = 0, offY = 0,offYaw = 180,offHeight = 30}}}, --ratten chair
	
	[15023] = {ID = 251}, --Palace Statue
	[15024] = {ID = 204}, --Mine Water Tower
	[15025] = {ID = 205}, --Mine Crystal Box
	
	[15026] = {ID = 233}, --Castle Wall (Candle)
	[15027] = {ID = 250}, --Castle Wall (Window)
	[15028] = {ID = 253}, --Castle Wall
	
	[15029] = {ID = 255}, --Castle Divider
	[15030] = {ID = 256}, --Castle Fence (Small)
	[15031] = {ID = 257}, --Castle Fence (Large)
	
	[15032] = {ID = 445}, --Desert Pool
	[15033] = {ID = 450}, --Forest Ruins 1
	[15034] = {ID = 451}, --Forest Ruins 2
	[15035] = {ID = 452}, --Forest Ruins 3
	[15036] = {ID = 453}, --Forest Ruins 4
	[15037] = {ID = 454}, --Forest Ruins 5
	[15038] = {ID = 455}, --Forest Ruins 6
	
	[15039] = {ID = 525}, --Spring Entrance
	[15040] = {ID = 526}, --Spring Wall
	[15041] = {ID = 528}, --Spring Wall (Corner)
	[15042] = {ID = 532}, --Spring Lamp
	
}




--list of maps, true = allowed to store location, nil/false = not allowed
GuildHouseExitMaps = {
	["garner"] = true,
	["darkblue"] = true,
	["magicsea"] = true,
}




guildObjectsDataFile = guildObjectsDataFile or DataFile:Init(GetResPath('guildhouse/obj.dat'),"guildObjects")
local hasData = false
--stupid way of checking there is atleast 1 data set. 
--since getn and # return 0 if 1 isnt set but 2 is.
for i,v in pairs(guildObjects) do
	hasData = true
	break
end
if not hasData then
	guildObjectsDataFile:Load()
end


function WriteGuildHouseObject(pkt,obj)

	local Data = guildObjectID[obj.ID]

	WriteDword(pkt,Data.ID)
	WriteDword(pkt,obj.posX)
	WriteDword(pkt,obj.posY)
	
	local yaw = obj.yaw + (Data.OffYaw or 0)
	if yaw> 360 then
		yaw= yaw-360
	elseif yaw < 0 then
		yaw = yaw+360
	end
	
	WriteDword(pkt,yaw)

	if Data.Action and #Data.Action > 0 then	
		WriteByte(pkt,#Data.Action)
		for index,action in ipairs(Data.Action) do
			WriteDword(pkt,action.ID)
			WriteDword(pkt,action.offX)
			WriteDword(pkt,action.offY)
			WriteDword(pkt,action.offYaw)
			WriteDword(pkt,action.offHeight)
		end
	else
		WriteByte(pkt,0)
	end
end

function showGuildObjects(role , map_copy)
	local guildID = GetMapCopyID2(map_copy)
	if not guildObjects[guildID] then
		guildObjects[guildID] = {}
	end
	local pkt = GetPacket()
	WriteCmd(pkt,607)
	WriteDword(pkt,#guildObjects[guildID])
	for i,v in ipairs(guildObjects[guildID]) do
		WriteGuildHouseObject(pkt,v)
	end
	SendPacket(role,pkt)
end

function UseItemDelAllGuildObj(role)
	local guildID = GetChaGuildID(role)
	if GetChaMapName(role) ~= "guildhouse" then
		SystemNotice(role,"Item can only be used in the guild house.")
		return UseItemFailed(role)
	elseif GetChaMapCopyNO(role) ~= guildID then
		SystemNotice(role,"You are not a member of this guild.")
		return UseItemFailed(role)
	elseif not hasGuildPerm(role,emGldPermRem) then
		SystemNotice(role,"You do not have permission to remove items here.")
		return UseItemFailed(role)
	end
	for i,v in ipairs(guildObjects[guildID]) do
		GiveItem(role,0,guildObjects[guildID][i].ID,1,0)
	end
	guildObjects[guildID] = {}
	DealAllInGuild(guildID,"removeAllGuildHouseObjects")
	
	UseItemFailed(role)
end

function UseItemDelGuildObj(role)
	local guildID = GetChaGuildID(role)
	if GetChaMapName(role) ~= "guildhouse" then
		SystemNotice(role,"Item can only be used in the guild house.")
		return UseItemFailed(role)
	elseif GetChaMapCopyNO(role) ~= guildID then
		SystemNotice(role,"You are not a member of this guild.")
		return UseItemFailed(role)
	elseif not hasGuildPerm(role,emGldPermRem) then
		SystemNotice(role,"You do not have permission to remove items here.")
		return UseItemFailed(role)
	end
	local x,y = GetChaPos(role)
	local compare  = 0xFFFFFFFF
	local index = -1
	for i,v in ipairs(guildObjects[guildID]) do
		
		local deltaX = math.abs(v.posX - x)
		local deltaY = math.abs(v.posY - y)
		if deltaX < 100 and deltaY < 100 then
			local temp = deltaX + deltaY
			if temp < compare then
				compare = temp
				index = i
			end
		end
		
	end
	
	if index ~= -1 then
		GiveItem(role,0,guildObjects[guildID][index].ID,1,0)
		removeGuildHouseObject(guildID,index)
	else
		SystemNotice(role,"No item in range to destroy")
	end
	UseItemFailed(role)
end

function UseItemGuildObj(role,item)
	local guildID = GetChaGuildID(role)
	if GetChaMapName(role) ~= "guildhouse" then
		SystemNotice(role,"Item can only be placed in the guild house.")
		return UseItemFailed(role)
	elseif GetChaMapCopyNO(role) ~= guildID then
		SystemNotice(role,"You are not a member of this guild.")
		return UseItemFailed(role)
	elseif not hasGuildPerm(role,emGldPermPlace) then
		SystemNotice(role,"You do not have permission to place items here.")
		return UseItemFailed(role)
	elseif not guildObjectID[GetItemID(item)] then
		SystemNotice(role,"Invalid Object.")
		return UseItemFailed(role)
	end
	local x,y = GetChaPos(role)
	addGuildHouseObject(guildID,GetItemID(item),x,y,GetObjDire(role))
end

function addGuildHouseObject(guildID,ID,X,Y,Yaw)
	if not guildObjects[guildID] then
		guildObjects[guildID] = {}
	end
		
	guildObjects[guildID][#guildObjects[guildID]+1] = {ID = ID, posX = X,posY = Y, yaw = Yaw}
	
	guildObjectsDataFile:Save()
	DealAllInGuild(guildID,"updateGuildHouseObject",string.format("%d",#guildObjects[guildID]))
end

function updateGuildHouseObject(role,index)
	index = tonumber(index)
	local guildID = GetChaGuildID(role)
	local obj = guildObjects[guildID][index]
	if obj and GetChaMapName(role) == "guildhouse" then
		local pkt = GetPacket()
		WriteCmd(pkt,608)
		WriteGuildHouseObject(pkt,obj)
		SendPacket(role,pkt)
	end
end

function removeGuildHouseObject(guildID,index)
	if not guildObjects[guildID] then
		guildObjects[guildID] = {}
		return
	end
	table.remove(guildObjects[guildID],index)
	guildObjectsDataFile:Save()
	DealAllInGuild(guildID,"removeGuildHouseObject2",string.format("%d",index))
end

function removeGuildHouseObject2(role,index)
	index = tonumber(index)
	local pkt = GetPacket()
	WriteCmd(pkt,609)
	WriteDword(pkt,index-1) --c++ vectors start at 0, lua starts at 1.
	SendPacket(role,pkt)
end

function removeAllGuildHouseObjects(role)
	local pkt = GetPacket()
	WriteCmd(pkt,610)
	SendPacket(role,pkt)
end

function enterGuildHouse(role)
	local guildID = GetChaGuildID(role)
	if guildID < 1 or guildID > 200 then
		SystemNotice(role,"Not in a guild")
	elseif GetChaMapName(role) == "guildhouse" and GetChaMapCopyNO(role) == guildID then
		leaveGuildHouse(role)
	elseif not hasGuildPerm(role,emGldPermEnter)  then
		SystemNotice(role,"You do not have permission to enter.")
	else
		local hp = Hp(role)
		local mxhp = Mxhp(role)
		local sp = Sp(role)
		local mxsp = Mxsp(role)
		if sp < mxsp or hp < mxhp then 
			SystemNotice(role,"Teleportation is a tedious process. Please maintain full HP and SP")
			return
		end
		local star = 0
		star = IsChaInRegion( role, 2 )
		if star ~= 1 then
			SystemNotice( role , "You must be in a safe zone to teleport to Guild House" )
			return
		end
		local x,y = GetChaPos(role)
		local ID = GetRoleID(role)
		local cmd = string.format([[guildHouseStoredMap[%d] = {Map = '%s', PosX = %d , PosY = %d}]],ID,GetChaMapName(role),math.floor(x/100),math.floor(y/100))
		Lua_All(cmd,role)
		MoveCity(role, "guildhouse", guildID) 
	end
end

function leaveGuildHouse(role)
	local ID = GetRoleID(role)
	if guildHouseStoredMap[ID] and canExitTo(guildHouseStoredMap[ID].Map) then
		GoTo(role,guildHouseStoredMap[ID].PosX,guildHouseStoredMap[ID].PosY,guildHouseStoredMap[ID].Map)
	else
		MoveCity(role,"") --like old ticket
	end
end

function canExitTo(mapname)
	Notice(mapname)
	return GuildHouseExitMaps[mapname] or false
end

function afterLeaveGuildHouse(role)
	local ID = GetRoleID(role)
	local cmd = string.format([[guildHouseStoredMap[%d] = nil]],ID)
	Lua_All(cmd,role)
end