--[[
	
	extNpc v3 by Billy

	Creating the NPC.
	
		myNpc =  extNpc:Create()
		
	Adding pages to the NPC
	
		local page = myNpc:AddPage("title of the page")

	Adding list items (blue)
		
		myNpc:AddListItem(page, "name of the item", func)

		
		func is a table:
			The first entry is the function to be called.
			The secons is a table of parameters.
			NPC and role can be passed in with "!npc" and "!role" respectively
			
		eg:
		
		myNpc:AddListItem(page, "Settings",{myFunc,{"!role","hello",2}})
		
		
		This would call myFunc(role,"hello",2) when pressed.
		You can also just pass in the function instead of a table, in which case it will be called with role as a paramater
		
		
	MissionLists work the same way, with an additonal param for icon
	
	
		myNpc:AddMissionListItem(page, "My Text ",func1,func2)
		
		It follows the same convention as func.
		You can also just pass in the ID of the icon to be displayed.
		
		
	Opening the NPC:
	
		NPC can be opened in 2 ways: through a script (eg an item or command) or by talking to an npc.
		
			to link the extNpc to a real npc, use:
			
				myNpc:SetNpcByName(npcName)
		
		To open via a script:
			createExtNpcSession(role,myNpc,npc)
			
			This creates a new instance of our extNpc, so if multiple people use it at once it wont interfere.
			npc can be left as nil, or assigned to a mob etc.

	Advanced:
		Text, such as titles and list names, can also be generated via functions.
		Just like with items, you can pass a table with function as index 1 and a table of params as index 2
		
		When adding a page, an additonal table can be added for "Auto", eg
		
		local page = myNpc:AddPage("title of the page",{SystemNotice,{"!role","Hello"}})
		
		would call SystemNotice(role,"Hello") when the page is opened.
		Additionally, if the function returns false then the page wont show at all.
		
		To restrict access to an NPC, you can use the CanLoad method.
		After creating your npc, simply add this condition:
		
			function myNpc:CanLoad()
				return GetChaAttr(self.Role,ATTR_LV) > 50
			end
		
		would restrict access to those lv 50 or under.
		(canload is ran before page auto functions)
		



]]

activeExtNpcs = activeExtNpcs or {} --contains npcs which are active. index is player.
activeExtNpcHosts = activeExtNpcHosts or {} --contains npcs which are active. index is npc.
pendingExtNpcHosts = pendingExtNpcHosts or {} --contains npcs which are active. index is npcName.

extNpcs = {} --contains npc user data if we are overriding their functions (? todo)

local ret, eudNpc = GetEudemon()

extNpc = {}

--create a new extNpc npc
function extNpc:Create()
	local object = {
		Pages = {}, --content of all pages
		Npc = eudNpc, --defaults to Eudion npc
		Role = nil,--player that opened the NPC
		MissionListMax = 63, --max amount of missions to list
	}
	setmetatable(object, self)
	self.__index = self
	return object
end

--load an instance of another extNpc
function extNpc:Load(role,extNpcObj,npc)
	local object = {
		Role = role,
		Npc = npc or eudNpc,
		Page = 1,--index of the current page
		SelectPage = 0, -- index of current page for selection page
		ActiveTrade = {}, --contains active trade items
		ActiveExchange = {},--contains active exchange items
	}
	local canLoad = true
	setmetatable(object, extNpcObj)
	extNpcObj.__index = extNpcObj 
	if object.CanLoad then
		canLoad = object:CanLoad()
	end
	
	if canLoad then
		activeExtNpcs[role] = object
		return object
	else
		return nil
	end
end

function extNpc:AddPage(Title,Auto)
	local page = #self.Pages + 1
	self.Pages[page] = {
		Title = Title or "",
		List = {},
		MissionList = {},
		Auto = Auto or false,
		
		Type = "Normal",
	}
	return page
end

function extNpc:AddSelectPage(Title,items,params,iconParam)
	local page = #self.Pages + 1
	self.Pages[page] = {
		Title = Title or "",
		List = {},
		MissionList = {},
		Auto = Auto or false,
		Type = "Select",
		
		SelectItems = items,
		SelectParams = params,
		SelectIconParams = iconParam or 4,
	}
	
	self:AddListItem(page, "Next", {ExtNpc,{"!role","ChangeSelectPage",1}})
	self:AddListItem(page, "Prev", {ExtNpc,{"!role","ChangeSelectPage",-1}})
	
	return page
end

function extNpc:GetMaxSelectPage()
	local total = #self.Pages[self.Page].MissionList
	return math.floor((total - total % self.MissionListMax)/self.MissionListMax )
end

function extNpc:ChangeSelectPage(dir)
	self.SelectPage = self.SelectPage + dir
	
	if self.SelectPage > self:GetMaxSelectPage() then
		self.SelectPage = 0
	end
	
	if self.SelectPage < 0 then
		self.SelectPage = self:GetMaxSelectPage()
	end
	
	self:JumpPage(self.Page)
end

function extNpc:SetNpcByName(npcName)
	pendingExtNpcHosts[npcName] = self
end

function extNpc:SetNpc(npc,notglobal,del)
	if del then
		activeExtNpcHosts[self.Npc] = nil
	end
	self.Npc = npc
	if not notglobal then
		activeExtNpcHosts[self.Npc] = self
	end
end

function extNpc:SetTitle(page, title)
	self.Pages[page].Title = title 
end

function extNpc:AddListItem(page, item,func)
	self.Pages[page].List[#self.Pages[page].List + 1] = {
		Text = item ,
		Func = func,
	}
end

function extNpc:AddMissionListItem(page, item, func, icon)
	self.Pages[page].MissionList[#self.Pages[page].MissionList + 1] ={
		Text = item,
		Icon = icon or 0,
		Func = func,
	} 
end

function extNpc:JumpPage(page)
	self.Page = page
	self:Open()
end

--open extnpc
function extNpc:Open()
	if self.CanLoad and not self:CanLoad() then
		return false
	end
	
	if self.Pages[self.Page].Auto then
		if self:ParseFunction(self.Pages[self.Page].Auto,"Auto") == false then
			return
		end
	end

	local packet = GetPacket()
	WriteCmd( packet, CMD_MC_FUNCPAGE )
	WriteDword( packet, GetCharID(self.Npc) )
	WriteByte( packet, 1 )
	WriteString(packet,self:GetItemText(self.Pages[self.Page].Title,"Title"))
	WriteByte( packet, #self.Pages[self.Page].List)
	
	
	for i,v in ipairs(self.Pages[self.Page].List) do
		WriteString( packet, self:GetItemText(v.Text,i))
	end
	
	if self.Pages[self.Page].Type == "Normal" then
	
		WriteByte( packet, #self.Pages[self.Page].MissionList)
		
		for i,v in ipairs(self.Pages[self.Page].MissionList) do
			WriteString( packet, self:GetItemText(v.Text,i))
			WriteByte( packet,self:GetItemText(v.Icon,i) )
		end
	
	elseif self.Pages[self.Page].Type == "Select" then
	
		self.Pages[self.Page].MissionList = {}
		
		local items = self.Pages[self.Page].SelectItems
		
		if type(self.Pages[self.Page].SelectItems) == "function" then
			items = items(self.Role)
		end
		
		for i,v in ipairs(items) do
			self:AddMissionListItem(self.Page, v, self.Pages[self.Page].SelectParams,  self.Pages[self.Page].SelectIconParams)
		end
		
		if self.SelectPage == self:GetMaxSelectPage() then
			WriteByte( packet, #self.Pages[self.Page].MissionList % self.MissionListMax)
		else
			WriteByte( packet,self.MissionListMax)
		end
		for i = 1+((self.SelectPage)*self.MissionListMax),((self.SelectPage+1)*self.MissionListMax) do
			local item = self.Pages[self.Page].MissionList[i]
			if item then				
				WriteString( packet, self:GetItemText(item.Text,i))
				WriteByte( packet,self:GetItemText(item.Icon,i) )
			end
		end
	end
	
	SendPacket( self.Role, packet )
end


function extNpc:GetItemText(item,index)
	if type(item) == "string" or type(item) == "number" then
		return item
	else
		return self:ParseFunction(item,index)
	end
end

function extNpc:GetMissionItemIcon(icon,index)
	if type(icon) == "number" then
		return icon
	else
		return self:ParseFunction(icon,index)
	end
end

function extNpc:ParseFunction(obj,index)
	if type(obj) == "function" then
		return obj(self.Role)
	elseif type(obj) == "table" then
		local func = obj[1]
		local param = {}
		for i,v in pairs(obj[2]) do
			param[i] = v
			if v == "!role" then
				param[i] = self.Role
			elseif v == "!npc" then
				param[i] = self.Npc
			elseif v == "!ID" then
				param[i] = index
			end
		end
		return func(unpack(param))
	end
end

function extNpc:DoListFunction(index)
	self:ParseFunction(self.Pages[self.Page].List[index].Func,index)
end

function extNpc:DoMissionListFunction(index)
	if self.Pages[self.Page].Type == "Select" then
		index = index + (self.SelectPage*self.MissionListMax)
	end
	self:ParseFunction(self.Pages[self.Page].MissionList[index].Func,index)
end

--todo - npc checks for distance etc.
function extNpc:RecievePacketMessage(rpk,npc)
	if self.CanLoad and not self:CanLoad() then
		return false
	end
	local usCmd = ReadWord( rpk )
	if usCmd == CMD_CM_TALKPAGE then
		self:JumpPage(1)
	elseif  usCmd == CMD_CM_FUNCITEM then
		local byCmd = ReadByte( rpk ) -- ?
		local index = ReadByte( rpk ) + 1 --packet starts at 0, lua table starts at 1
		self:DoListFunction(index)
	elseif usCmd == CMD_CM_MISSION  then
		local byCmd = ReadByte( rpk )
		if byCmd == MIS_SEL then
			local index = ReadByte( rpk ) + 1 --packet starts at 0, lua table starts at 1
			return self:DoMissionListFunction(index)
		end
	elseif usCmd == CMD_CM_BLACKMARKET_EXCHANGE_REQ then --TODO
		local timeNum = ReadWord( rpk )
		local srcID = ReadWord( rpk )
		local srcNum = ReadWord( rpk )
		local tarID = ReadWord( rpk )
		local tarNum = ReadWord( rpk )
		local byIndex = ReadWord( rpk ) + 1
		
		local ret = KitbagLock( self.Role, 0 )
		if ret ~= LUA_TRUE then
			SystemNotice( self.Role, "Inventory is binded. Unable to redeem" )
			return
		end
		
		local retbag = HasLeaveBagGrid( self.Role, 1)
		if retbag ~= LUA_TRUE then
			SystemNotice(self.Role,"Insufficent inventory space to redeem")
			return 
		end
		
		
		local exchangeID = self:FindExchange(srcID, srcNum, tarID, tarNum)

		local exchange = self.ActiveExchange[exchangeID]
		local num = CheckBagItem(self.Role,exchange.TakeID)
		if not exchange or num < exchange.TakeNum then
			SystemNotice(self.Role,"Error, you do not have the required items.")
			return
		end
	    
		TakeItem(self.Role,0,exchange.TakeID,exchange.TakeNum)
		if CheckBagItem(self.Role,exchange.TakeID) ~= (num - exchange.TakeNum) then
			SystemNotice(self.Role,'Error, items were not exchanged.')
			return
		else
			GiveItem(self.Role,0,exchange.GiveID,exchange.GiveNum,0)
		end
		local packet = GetPacket();
		WriteCmd(packet, CMD_MC_BLACKMARKET_EXCHANGEDATA + 1);
		WriteByte(packet, 1)
		WriteWord(packet, exchange.TakeID)
		WriteWord(packet, exchange.TakeNum)
		WriteWord(packet, exchange.GiveID)
		WriteWord(packet, exchange.GiveNum)
		SendPacket(self.Role,packet)
	elseif usCmd == CMD_CM_TRADEITEM then --TODO
		local tradetype = ReadByte( rpk )
		local itemtype = ReadByte( rpk )
		local index1 = ReadByte( rpk )
		local index2 = ReadByte( rpk )
		local count = ReadByte( rpk )	
		if tradetype == ROLE_TRADE_BUY then
			self:Buy(index1 + 1,index2,count,itemtype + 1)
		elseif tradetype == ROLE_TRADE_SALE then
			return SafeSale( self.Role, itemtype, index1 )
		end
	end
end

function extNpc:FindExchange(srcID, srcNum, tarID, tarNum)
	for i,v in ipairs(self.ActiveExchange) do
		if v.TakeID == srcID and v.TakeNum == srcNum and v.GiveID == tarID and v.GiveNum == tarNum then
			return i
		end
	end
end

function extNpc:OpenTrade(Items)
	local packet = GetPacket()
	WriteCmd( packet, CMD_MC_TRADEPAGE )
	WriteDword( packet, GetCharID(self.Npc) )
	WriteByte( packet, TRADE_BUY )
	WriteDword( packet, 0 )
	WriteByte( packet, 3 )
	
	self.ActiveTrade = Items
	
	for i,v in pairs(Items) do
		WriteByte( packet, i - 1  ) 
		WriteByte( packet, math.min(120,table.getn(v)) ) 
		for j,k in pairs(v) do
			if j > 120 then
				break
			end
			WriteWord( packet, k )
		end
	end
	
	SendPacket( self.Role, packet )
end

function extNpc:OpenExchange(Items)
	local packet = GetPacket()
	WriteCmd( packet, CMD_MC_BLACKMARKET_EXCHANGEDATA )
	WriteDword( packet, GetCharID(self.Npc) )
	WriteWord( packet, math.min(120,table.getn(Items)) )
	for i,v in pairs(Items) do
		WriteWord( packet, v.TakeID )
		WriteWord( packet, v.TakeNum )
		WriteWord( packet, v.GiveID )
		WriteWord( packet, v.GiveNum )
		if CheckBagItem(self.Role,v.TakeID) < v.TakeNum then
			WriteWord( packet, 1 )
		else
			WriteWord( packet, 0 )
		end
	end
	SendPacket( self.Role, packet )
	
	self.ActiveExchange = Items
end


function extNpc:Buy(slot ,userslot,count ,itemtype)
	local item = self.ActiveTrade[itemtype][slot]
	SafeBuy( self.Role, item, userslot, count )
end


--Hook npc functions.
function extNpcNpcProc( role, npc, rpk, id )
	if not activeExtNpcHosts[npc] and pendingExtNpcHosts[GetChaDefaultName(npc)] then
		activeExtNpcHosts[npc] = pendingExtNpcHosts[GetChaDefaultName(npc)]
	end
	if activeExtNpcs[role] and activeExtNpcs[role].Npc == npc  then
		activeExtNpcs[role]:RecievePacketMessage(rpk,npc)
	elseif activeExtNpcHosts[npc] then
		createExtNpcSession(role,activeExtNpcHosts[npc],npc)	
	elseif id then
		return NpcProcExtHook( role, npc, rpk, id )
	end
end

function ExtNpc(role,index,...)
	local param = {...}
	activeExtNpcs[role][index](activeExtNpcs[role],unpack(param))
end

function createExtNpcSession(role,obj,npc)
	local extNpcObj = extNpc:Load(role,obj,npc)
	if extNpcObj then
		extNpcObj:Open()
	end
end


NpcProcExtHook = NpcProcExtHook or NpcProc
NpcProc = extNpcNpcProc





