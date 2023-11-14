--[[
	Lua tradeserver implementation by Billy
	
	todo - 		
		VIP stuffs.
		Limited Duration/quantity
		
]]

_igs					= {}												-- 
_igs.SavePath			= GetResPath('../Log/Igs.log')		--

_igs.Initial			= function(File)
	Table				= io.open(File, 'r')
	if Table ~= nil then
		io.close(Table)
	else
		table.save({}, File, 'w')
	end
end
_igs.Initial(_igs.SavePath)

CMD_CM_STORE_OPEN_ASK = 41
CMD_CM_STORE_LIST_ASK = 42
CMD_CM_STORE_BUY_ASK = 43
CMD_CM_STORE_CHANGE_ASK	= 44
CMD_CM_STORE_QUERY = 45
CMD_CM_STORE_VIP = 46
CMD_CM_STORE_AFFICHE = 47
CMD_CM_STORE_CLOSE = 48

CMD_MC_STORE_OPEN_ASR = 561
CMD_MC_STORE_LIST_ASR = 562
CMD_MC_STORE_BUY_ASR = 563
CMD_MC_STORE_CHANGE_ASR = 564
CMD_MC_STORE_QUERY = 565
CMD_MC_STORE_VIP = 566

CMD_MC_UPDATEIMP = 611

PACK_PER_PAGE = 6

IGSUsers = IGSUsers or {}
IGSPacks = {}
IGSTabs = {}

function AddMallPack(title,description,price,hot,items)
	local index = #IGSPacks+1
	IGSPacks[index] = {
		Title = title,
		Description = description,
		Price = price,
		Hot = hot,
		Items = items,
	}
	return index
end

function AddMallTab(Title,Packs,Parent)
	Packs = Packs or {}
	local index = #IGSTabs+1
	IGSTabs[index] = {
		Title = Title,
		Packs = Packs,
		Parent = Parent or 0,
	}
	for i,v in pairs(Packs) do
		IGSPacks[v].Enabled = true
	end
	return index
end

function AddPackToTab(tab,item)
	IGSTabs[tab].Packs[#IGSTabs[tab].Packs+1] = IGSPacks[item]
	IGSPacks[item].Enabled = true
end


local weddingApp = AddMallPack("Wedding Set","Testing",9000,1,{5495,5492,5493,5494,})
local weddingApp3 = AddMallPack("Wedding Set","Testing",9000,1,{5495,5492,5493,5494,})


local tabGeneral = AddMallTab("General",{weddingApp,weddingApp,weddingApp,weddingApp,weddingApp,weddingApp,weddingApp,weddingApp,weddingApp,})
local tabPet = AddMallTab("Pet",{})
	local tabPets = AddMallTab("Pet",{},tabPet)
	local tabPetFood = AddMallTab("Food",{},tabPet)
	local tabPetSkill = AddMallTab("Skill",{},tabPet)
local tabLvl = AddMallTab("Leveling",{})
	local tabLvlTick= AddMallTab("Tickets",{},tabLvl)
	local tabLvlAmp = AddMallTab("Amplifiers",{},tabLvl)
	local tabLvlPot = AddMallTab("Potions",{},tabLvl)
local tabDec = AddMallTab("Decoration",{})
	local tabDecW= AddMallTab("Weapons",{},tabDec)
	local tabDecA = AddMallTab("Armour",{},tabDec)
	local tabDecO = AddMallTab("Other",{},tabDec)
local tabMisc = AddMallTab("Miscellaneous",{})
local tabPromo = AddMallTab("Promotion",{})

function operateIGS(role,pkt)
	local cmd = ReadCmd(pkt)
	if cmd == CMD_CM_STORE_OPEN_ASK then
		openIGS(role)
	elseif cmd == CMD_CM_STORE_BUY_ASK then
		local ID = ReadDword(pkt)
		BuyIGSPack(role,ID)
	elseif cmd == CMD_CM_STORE_LIST_ASK then
		local lClsID = ReadDword(pkt)
		local sPage = ReadWord(pkt)
		local sNum = ReadWord(pkt)	
		openIGSTab(role,lClsID,sPage)
	elseif cmd == CMD_CM_STORE_CLOSE then
		IGSUsers[role] = nil
	end
end

function IGSLog(msg)
	local file = "Log/Igs.log"
	local LogFile = io.open(file,'a')
	LogFile:write("["..os.date().."]\t"..msg.."\n")
	LogFile:close()	
end

function BuyIGSPack(role,ID)
	if IGSPacks[ID] and IGSPacks[ID].Enabled then
		local pack = IGSPacks[ID]
		local slots = #pack
		local pkt = GetPacket()
		WriteCmd(pkt,CMD_MC_STORE_BUY_ASR)
		if GetChaFreeTempBagGridNum(role) >= slots and HasIMP(role,pack.Price) then
			TakeIMP(role,pack.Price)
			IGSLog(string.format("[%s] Bought [%s] for [%d], [%d] remaining.",GetChaDefaultName(role),pack.Title,pack.Price,GetIMP(role)))
			for i,v in ipairs(pack.Items) do
				if type(v) == "table" then
					AddItem(role,v,1)
				else
					GiveItemX ( role , 0 , v , 1 , 0 )
				end
			end
			WriteByte(pkt,1)
			WriteDword(pkt,GetIMP(role))
		else
			WriteByte(pkt,0)
		end
		SendPacket(role,pkt)
	end
end

function SetIMPAcc(acc,num)
	local chas = {GetPlayerByActName(acc)}
	for i,v in ipairs(chas) do
		SetIMP(v,num,true)
		UpdateIMP(v)
	end
end

function imp(i)
	GiveIMP(GetPlayerByName('NodeJs'),i or 1000)
end

function imps(name,num)
	local role = GetPlayerByName(name)
	local cmd = string.format([[SetIMPAcc('%s',%d)]],GetActName(role),num)
	Lua_All(cmd,role)
end

function HasIMP(role,num)
	return GetIMP(role) >= num
end

function TakeIMP(role,num)
	--local cmd = string.format([[SetIMPAcc('%s',%d)]],GetActName(role),GetIMP(role)-num)
	--Lua_All(cmd,role)
	--SetIMPAcc(GetActName(role),GetIMP(role)-num)
	SetIMP(role,GetIMP(role)-num)
end

function GiveIMP(role,num)
	--SetIMP(role,GetIMP(role)+num)
	--local cmd = string.format([[SetIMPAcc('%s',%d)]],GetActName(role),GetIMP(role)+num)
	--Lua_All(cmd,role)
	SetIMP(role,GetIMP(role)+num)
	SystemNotice(role, "System gives you "..num.." IMP, total: "..GetIMP(role).."!");
end

function UpdateIMP(role)
	local pkt = GetPacket()
	WriteCmd(pkt,CMD_MC_UPDATEIMP)
	WriteDword(pkt,GetIMP(role))
	SendPacket(role,pkt)
end

function WritePackage(pkt,ID)
	local pack = IGSPacks[ID]
	WriteDword(pkt,ID) --comid
	WriteString(pkt,pack.Title) --package name
	WriteDword(pkt,pack.Price) --price
	WriteString(pkt,pack.Description) --description
	WriteByte(pkt,pack.Hot) --1=hot, 0=not
	WriteDword(pkt,0x80000000) --nTime (??)
	WriteDword(pkt,0x80000000) --stock
	WriteDword(pkt,0x80000000) --hours remaining
	WriteWord(pkt,#pack.Items)--number of items in package
	for j,k in pairs(pack.Items) do
		WriteItem(pkt,k)
	end
end

function WriteItem(pkt,item)
	if type(item) ~= "table" then
		item = {ID=item}
	end
	WriteWord(pkt,item.ID) --itemID
	WriteWord(pkt,item.Quantity or 1) --itemnum
	WriteWord(pkt,0) --flute(????)
	for i = 1,5 do
		if item.Attributes and item.Attributes[i] then
			WriteWord(pkt,item.Attributes[i].ID)--attr
			WriteWord(pkt,item.Attributes[i].Num)--value
		else
			WriteWord(pkt,0)--attr
			WriteWord(pkt,0)--value
		end
	end
end

function openIGSTab(role,tab,page)
	tab = tab or 1
	page = page or 1
	if not IGSTabs[tab] or not role then
		return
	end
	IGSUsers[role] = {tab,page}
	local pkt = GetPacket()
	WriteCmd(pkt,CMD_MC_STORE_LIST_ASR )
	local totalnum = #IGSTabs[tab].Packs
	local maxPage = math.ceil(totalnum/PACK_PER_PAGE)
	WriteWord(pkt,maxPage)--max page (calc this)
	if page<maxPage or totalnum==PACK_PER_PAGE then
		WriteWord(pkt,page)--current page
		WriteWord(pkt,PACK_PER_PAGE)--number of item packages
	else
		WriteWord(pkt,maxPage)--current page
		WriteWord(pkt,math.mod(totalnum,PACK_PER_PAGE))--number of item packages
	end
	for i = 1,PACK_PER_PAGE do
		local index = i + (page-1)*PACK_PER_PAGE
		local packID = IGSTabs[tab].Packs[index]
		if packID then
			WritePackage(pkt,packID)
		end
	end
	SendPacket(role,pkt)
end

function openIGS(role)
	if not role then
		return
	end
	IGSUsers[role] = true
	local pkt = GetPacket()
	WriteCmd(pkt,CMD_MC_STORE_OPEN_ASR)
	WriteByte(pkt,1)--is valid
	WriteDword(pkt,0)--VIP level
	WriteDword(pkt,0)--bean
	WriteDword(pkt,GetIMP(role))--money
	WriteDword(pkt,0)--unused (count for field that isnt used)
	WriteDword(pkt,#IGSTabs)--lClsNum
	for i,v in ipairs(IGSTabs) do
		WriteWord(pkt,i)--lClsID
		WriteString(pkt,v.Title)--szClsName
		WriteWord(pkt,v.Parent or 0)--parentID
	end
	SendPacket(role,pkt)
end

function UpdateIGS()
	for i,v in pairs(IGSUsers) do
		if v then
			if type(v) == "table" then
				openIGSTab(i,v[1],v[2])
			else
				openIGS(i)
			end
			PopupNotice(i,"Mall has been updated!")
		end
	end
end

UpdateIGS()

