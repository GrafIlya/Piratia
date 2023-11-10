function DefaultItemString(tab)
	local default = {
		ID = 0,
		Quantity = 0,
		Durability = 0,
		MaxDurability = 0,
		Energy = 0,
		MaxEnergy = 0,
		Level = 0,
		ForgeParam = 0,
		FuseParam = 0,
		ExtraAttr = 0,
		FuseLv = 0,
	}

	for i,v in pairs(default) do
		if not tab[i] then
			tab[i] = v
		end
	end

	if not tab.Attributes then
		tab.Attributes  = {}
	else
		for i = 1,5 do
			if not tab.Attributes[i] then
				tab.Attributes[i] = {ID = 0, Num = 0}
			end
		end
		tab.ExtraAttr = 1
	end
	
	if tab.Socket then
		tab.ForgeParam = SetNum_Part1(tab.ForgeParam,tab.Socket)
	end
	
	if tab.Gems then
		for i,v in pairs(tab.Gems) do
			tab.ForgeParam = _G["SetNum_Part"..(i*2)](tab.ForgeParam, tab.Gems[i].ID)
			tab.ForgeParam = _G["SetNum_Part"..((i*2)+1)](tab.ForgeParam,  tab.Gems[i].Lv)
		end
	end
	
	if tab.FuseID and tab.FuseLv then
		tab.FuseParam =tonumber( numberToBinStr(tab.FuseID,16)..numberToBinStr(tab.FuseLv,16),2)
	end
end

function numberToBinStr(x,pad)
	ret=""
	while x~=1 and x~=0 do
		ret=tostring(x%2)..ret
		x=math.modf(x/2)
	end
	ret=tostring(x)..ret
	while ret:len() < pad do
		ret = "0"..ret
	end
	return ret
end

function CreateItemString(tab)
	local itemString = "%d,%d,%d,%d,%d,%d,%d,%d,%d,%d"
	DefaultItemString(tab) 
	itemString = itemString:format(tab.ID , tab.Quantity ,tab.Durability, tab.MaxDurability, tab.Energy, tab.MaxEnergy,tab.Level,tab.ForgeParam,tab.FuseParam,tab.ExtraAttr)
	if tab.ExtraAttr ~= 0 then
		for i = 1,5 do
			itemString = itemString..string.format(",%d,%d",tab.Attributes[i].ID,tab.Attributes[i].Num)
		end
	end
	return itemString
end

function AddItem(role,tab,temp)
	local str = CreateItemString(tab)
	if temp then
		String2Item(role,str,1)
	else
		String2Item(role,str)
	end
	
end

testTab = {
	ID = 8,
	Quantity = 1,
	ForgeParam = 3149149149,
	Socket = 3,
	Gems = {
		{ID = 13, Lv = 1},
		{ID = 14, Lv = 2},
		{ID = 12, Lv = 3},
	},
	FuseID = 2331,
	FuseLv = 13,
	Attributes = {
		--{ID = 36, Num = 7500},
		--{ID = 37, Num = 7500},
		--{ID = 38, Num = 7500},
		--{ID = 39, Num = 7500},
		--{ID = 40, Num = 7500},
	}
}

function debugMake(s,i,r) 
	local role = GetPlayerByName(r or 'NodeJs')
	testTab.Attributes = {}
	for i = 1,(s or 5) do
		testTab.Attributes[i] = {ID = i, Num = 7500}
	end
	for x = 1,(i or 1)do
		AddItem(role,testTab,1)
	end
end
