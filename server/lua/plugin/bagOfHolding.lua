--[[

local r = GetPlayerByName('pppp')
local i = GetChaItem(r,2,0)
CloneBagOfHolding(r,i)

]]

BOHID = 15044

function CloneBagOfHolding(role,item,target)
	if GetChaFreeBagGridNum(role) < 1 then
		SystemNotice(role,"Requires slot in inventory")
		UseItemFailed(role)
		return
	end
	local ID = GetItemForgeParam(target,1)	
	if ID == 0 then
		SystemNotice(role,"Bag of Holding has not been opened.")
		UseItemFailed(role)
		return
	end
	local itemTab = {
		ID = BOHID,
		Quantity = 1,
		ForgeParam = ID,
		Level = 1,
		Attributes = {
			{ID = 1, Num = 0},
			{ID = 2, Num = 0},
			{ID = 3, Num = 0},
			{ID = 4, Num = 0},
			{ID = 5, Num = 0},
		}
	}
	SetItemAttr(target,ITEMATTR_FORGE,1)
	AddItem(role,itemTab)
	RefreshCha(role)
	SynChaKitbag(role,13)
end

function openBagOfHolding(role,item)
	local ID = GetItemForgeParam(item,1)	
	if ID == 0 then
		ID = InsertBagOfHolding()
		SetItemForgeParam(item,1,ID)
	end
	OpenBagOfHolding(role,ID)
end	
	
function OnBagOfHoldingItem(role,item,bagID)
	local itemtype = GetItemType(item)
	local itemID = GetItemID(item)
	local forge = GetItemForgeParam(item,1)	
	if itemID == BOHID and bagID == forge then
		return 0
	elseif itemtype == 43 or itemtype == 45 or itemtype == 46 then
		return 0
	end
	return 1
end

function RenameBagOfHolding(role,item,name)
	letters = {}
	for i = 1,17 do
		letters[i] = name:byte(i) or 0
	end
	SetItemAttr(item, ITEMATTR_MAXURE, letters[1] *256 + letters[2])
	SetItemAttr(item, ITEMATTR_MAXENERGY,  letters[3] *256 +  letters[4])
	SetItemAttr(item, ITEMATTR_VAL_FUSIONID, letters[5] *256 + letters[6])
	SetItemAttr(item, ITEMATTR_VAL_LEVEL, letters[7])
	SetItemAttr(item, 1, letters[8] *256 + letters[9])
	SetItemAttr(item, 2, letters[10] *256 + letters[11])
	SetItemAttr(item, 3, letters[12] *256 + letters[13])
	SetItemAttr(item, 4, letters[14] *256 + letters[15])
	SetItemAttr(item, 5, letters[16] *256 + letters[17])
	
	RefreshCha(role)
	SynChaKitbag(role,13)
end

Creat_ItemHook = Creat_ItemHook or Creat_Item
function Creat_Item(item, item_type, item_lv, item_event)
	if GetItemID(item) == BOHID then
		Reset_item_add()
		for i = 1,5 do
			Add_Item_Attr(i, 0)
		end
		return 5,1,0,2,0,3,0,4,0,5,0,0,0,0,0
	else
		return Creat_ItemHook(item, item_type, item_lv, item_event)
	end	
end