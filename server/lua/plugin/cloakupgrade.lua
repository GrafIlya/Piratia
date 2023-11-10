print('Loading Cloakupgrade.lua')

Creat_Cloak = Creat_ItemX

function Creat_ItemX(item, item_type, item_lv, item_event)
	local item, item_type, item_lv, item_event = Creat_Cloak(item, item_type, item_lv, item_event)

	if GetItemID(item) == 15053 then
		Add_Item_Attr(ITEMATTR_VAL_STR, 0)
		Add_Item_Attr(ITEMATTR_VAL_CON, 0)
		Add_Item_Attr(ITEMATTR_VAL_AGI, 0)
		Add_Item_Attr(ITEMATTR_VAL_STA, 0)
		Add_Item_Attr(ITEMATTR_VAL_DEX, 0)
		SetItemAttr(item, 55, 1); 
		

	end
	return item, item_type, item_lv, item_event
end

CloakUpgade = {1,1,.8,.7,.6,.5,.4,.3,.2,.1}

Cloaksttr = {}
Cloaksttr[2] = {
	[ITEMATTR_VAL_STR]	= 2,
	[ITEMATTR_VAL_CON]	= 2,
	[ITEMATTR_VAL_AGI]	= 2,
	[ITEMATTR_VAL_STA]	= 2,
	[ITEMATTR_VAL_DEX]	= 2
	
	}
Cloaksttr[3] = {
	[ITEMATTR_VAL_STR]	 = 3,
	[ITEMATTR_VAL_CON]	 = 3,
	[ITEMATTR_VAL_AGI]	 = 3,
	[ITEMATTR_VAL_STA]	 = 3,
	[ITEMATTR_VAL_DEX]	 = 3
	}
Cloaksttr[4] = {
	[ITEMATTR_VAL_STR] 	= 4,
	[ITEMATTR_VAL_CON] 	= 4,
	[ITEMATTR_VAL_AGI] 	= 4,
	[ITEMATTR_VAL_STA] 	= 4,
	[ITEMATTR_VAL_DEX] 	= 4
	}	
Cloaksttr[5] = {	
	[ITEMATTR_VAL_STR] 	= 5,
	[ITEMATTR_VAL_CON] 	= 5,
	[ITEMATTR_VAL_AGI] 	= 5,
	[ITEMATTR_VAL_STA] 	= 5,
	[ITEMATTR_VAL_DEX] 	= 5
	}	
Cloaksttr[6] = {	
	[ITEMATTR_VAL_STR] 	= 6,
	[ITEMATTR_VAL_CON] 	= 6,
	[ITEMATTR_VAL_AGI] 	= 6,
	[ITEMATTR_VAL_STA] 	= 6,
	[ITEMATTR_VAL_DEX] 	= 6
	}	
Cloaksttr[7] = {	
	[ITEMATTR_VAL_STR]=	 7,
	[ITEMATTR_VAL_CON]=	 7,
	[ITEMATTR_VAL_AGI]=	 7,
	[ITEMATTR_VAL_STA]=	 7,
	[ITEMATTR_VAL_DEX]=	 7
	}	
Cloaksttr[8] = {	
	[ITEMATTR_VAL_STR] 	= 8,
	[ITEMATTR_VAL_CON] 	= 8,
	[ITEMATTR_VAL_AGI] 	= 8,
	[ITEMATTR_VAL_STA] 	= 8,
	[ITEMATTR_VAL_DEX] 	= 8
	}	
Cloaksttr[9] = {	
	[ITEMATTR_VAL_STR] 	= 9,
	[ITEMATTR_VAL_CON] 	= 9,
	[ITEMATTR_VAL_AGI] 	= 9,
	[ITEMATTR_VAL_STA] 	= 9,
	[ITEMATTR_VAL_DEX] 	= 9
	}	
Cloaksttr[10] = {	
	[ITEMATTR_VAL_STR] 	= 10,
	[ITEMATTR_VAL_CON] 	= 10,
	[ITEMATTR_VAL_AGI] 	= 10,
	[ITEMATTR_VAL_STA] 	= 10,
	[ITEMATTR_VAL_DEX] 	= 10
	}


--upgrade fix by mothannakh---
function Cloakupgrade(role, Item, Item_Traget)
	local isboat = 0
	isboat = GetCtrlBoat(role)
	if isboat ~= nil then
		SystemNotice(role, "Cannot use while sailing")
		UseItemFailed(role)
		return
	end
	--check if inventory locked--
	if KitbagLock(role, 1) == LUA_TRUE or GetChaStateLv(role, STATE_BAT) >= 1 or GetChaStateLv(role, STATE_JY) >= 1 then
		PopupNotice(role, "Inventory Locked! unlock it!")
		UseItemFailed(role)
		return
	end
	-- check item
	local itemid = GetItemID(Item_Traget)
	local itemname = GetItemName(itemid)
	--print(itemid..itemname)
	if itemid ~= 15053 then
		SystemNotice(role, "Please use only on Admiral Cloak!")
		UseItemFailed(role)
		return
	end
	-- check level
	local cloacklv = GetItemAttr(Item_Traget, 55)
	---incase if cloak lvl is 0--
	if cloacklv == 0 then 
		cloacklv = 1
	end
	if cloacklv >= 10 then
		SystemNotice(role, "Admiral Cloak Helm already maxed upgrade")
		UseItemFailed(role)
		return
	end
	local b = CloakUpgade[cloacklv]
	local r = Percentage_Random(b)
	--check Percentage 
	if r == 1 then
		cloacklv = cloacklv + 1
		
		for i,v in pairs(Cloaksttr[cloacklv]) do
			SetItemAttr(Item_Traget,i,v)
		end
		SetItemAttr(Item_Traget, 55, cloacklv);  
		PopupNotice(role, 'Successfully upgrade '..itemname..'! to lvl'..cloacklv.."]")
		LG('Admiral Cloak','Player ['..GetChaDefaultName(role)..'] Successfully upgrade [ '..itemname..'! to lvl'..cloacklv.."]")
		PlayEffect(role, 345)
		if cloacklv == 10 then 
			PlayEffect(role, 361);
			GMNotice (GetChaDefaultName(role).." Upgraded Cloak to Lv10 Enjoy!")
			LG('Admiral Cloak Max', ''..GetChaDefaultName(role)..' has maxed out the level of Admiral Cloak.')
		end
		
		SynChaKitbag(role, 13)
	else
		PopupNotice(role,"upgrade Failed! try again!")
		PlayEffect(role, 346);
		LG('Admiral Cloak','Player ['..GetChaDefaultName(role)..'] Failed upgrade [ '..itemname..'! to lvl'..cloacklv.."]")
	end
end

function ItemUse_CloakUnseal(role, Item)
	local isboat = 0
	isboat = GetCtrlBoat(role)
	if isboat ~= nil then
		SystemNotice(role, "Cannot use while sailing")
		UseItemFailed(role)
		return
	end
	--check if inventory locked--
	if KitbagLock(role, 1) == LUA_TRUE or GetChaStateLv(role, STATE_BAT) >= 1 or GetChaStateLv(role, STATE_JY) >= 1 then
		PopupNotice(role, "Inventory Locked! unlock it!")
		UseItemFailed(role)
		return
	end
	local itemid = GetItemID(Item)
	local itemname = GetItemName(itemid)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 2 then
		SystemNotice(role, "Failed to use ["..itemname.."]. Requires 2 slots in inventory")
		UseItemFailed(role)
		return 
	else
		GiveItem(role, 0, 15053, 1, 88);
		Notice(GetChaDefaultName(role)..' successfully Unsealed a '..itemname..'!');
		LG('Admiral Cloak', ''..GetChaDefaultName(role)..' has unsealed Admiral Cloak.')
		RefreshCha(role)
	end
end

		--[[
ItemInfo lines

15055	Admiral Cloak Upgrade	n2559	10130005	0	0	0	0	0	00	66	0	0	0	0	0	1	1	1	1	15	0	200	-1	0	-1	0	0	-1	-1	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0	0,0	0	0	0	0	0	0	0	0	0	Cloakupgrade	0	0	0	0	0	0	Said to be used on a Admiral Cloak to upgrade it!	1	
15056	Admiral Cloak Box	n0322	10130015	0	0	0	0	0	0	31	0	0	0	0	0	0	1	0	1	99	0	0	-1,-2,-2,-2	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2	-1,-2,-2,-2,-2,-2,-2,-2,-2,-2	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0,0	0	0,0	0,0	0	0	0	0	0	0	0	0	0	ItemUse_CloakUnseal	0	0	0	0,0	0	0	Double Click in the Chest obtained an Admiral Cloak!	0

		]]--