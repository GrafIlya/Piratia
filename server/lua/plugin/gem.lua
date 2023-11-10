print('Loading gem.lua')

FORGE_RATE = {1, 1, 1, .8, .7, .5, .3, .2, .1}
MAX_FORGELV = 9

MAX_STONELV	= {}
MAX_STONELV[860] = 3		-- Unique Gems
MAX_STONELV[861] = 3
MAX_STONELV[862] = 3
MAX_STONELV[863] = 3
MAX_STONELV[1012] = 3
MAX_STONELV[5845] = 1		-- Azrael Gems
MAX_STONELV[5846] = 1
MAX_STONELV[5847] = 1
MAX_STONELV[5848] = 1
MAX_STONELV[5849] = 1
MAX_STONELV[864] = 2		-- BD Gems
MAX_STONELV[865] = 2
MAX_STONELV[866] = 2
MAX_STONELV[6717] = 2		-- Gem of Trial
MAX_STONELV[6718] = 2
MAX_STONELV[6817] = 3
MAX_STONELV[6818] = 3		-- Crack/Chipped/Broken
MAX_STONELV[6819] = 3
MAX_STONELV[6820] = 3
MAX_STONELV[6821] = 3
MAX_STONELV[6822] = 3
MAX_STONELV[6823] = 3
MAX_STONELV[6824] = 3
MAX_STONELV[6825] = 3
MAX_STONELV[6826] = 3
MAX_STONELV[6827] = 3
MAX_STONELV[6828] = 3
MAX_STONELV[6829] = 3
MAX_STONELV[6830] = 3
MAX_STONELV[6831] = 3
MAX_STONELV[885] = 9		-- Refining Gem

-- rings/neck extractable
Item_CanJinglian_ID[table.getn(Item_CanJinglian_ID)+1] = 25
Item_CanJinglian_ID[table.getn(Item_CanJinglian_ID)+1] = 26
Item_CanJinglian_Num = table.getn(Item_CanJinglian_ID)

function appendgem(gemid, eff, eq, stat, val, n)
	StoneTpye_ID[n] = gemid
	StoneEffType[n] = eff
	StoneItemType[n] = eq
	StoneAttrType[n] = stat
	StoneEff[n] = val
	-- max
	StoneEff_Num = n
	StoneAttrType_Num = n
	StoneEffType_Num = n
	StoneTpye_ID_Num = n
	StoneItemType_Num = n
end

appendgem(6817, 4, {24,0,0}, ITEMATTR_VAL_AGI, 2, 34) -- broken wind
appendgem(6818, 4, {24,0,0}, ITEMATTR_VAL_AGI, 3, 35) -- crack wind
appendgem(6819, 4, {24,0,0}, ITEMATTR_VAL_AGI, 4, 36) -- chip wind
appendgem(6820, 4, {23,0,0}, ITEMATTR_VAL_DEX, 2, 37) -- broken strike
appendgem(6821, 4, {23,0,0}, ITEMATTR_VAL_DEX, 3, 38) -- crack strike
appendgem(6822, 4, {23,0,0}, ITEMATTR_VAL_DEX, 4, 39) -- chip strike
appendgem(6823, 4, {11,22,27}, ITEMATTR_VAL_CON, 2, 40) -- broken colo
appendgem(6824, 4, {11,22,27}, ITEMATTR_VAL_CON, 3, 41) -- crack colo
appendgem(6825, 4, {11,22,27}, ITEMATTR_VAL_CON, 4, 42) -- chip colo
appendgem(6826, 4, {1,2,3,4,7,9,0}, ITEMATTR_VAL_STR, 2, 43) -- broken rage
appendgem(6827, 4, {1,2,3,4,7,9,0}, ITEMATTR_VAL_STR, 3, 44) -- crack rage
appendgem(6828, 4, {1,2,3,4,7,9,0}, ITEMATTR_VAL_STR, 4, 45) -- chip rage
appendgem(6829, 4, {1,2,3,4,7,9,0}, ITEMATTR_VAL_STA, 2, 46) -- broken rage
appendgem(6830, 4, {1,2,3,4,7,9,0}, ITEMATTR_VAL_STA, 3, 47) -- crack rage
appendgem(6831, 4, {1,2,3,4,7,9,0}, ITEMATTR_VAL_STA, 4, 48) -- chip rage

function GetEquipGemLv(item)
	local param = GetItemForgeParam(item, 1)
	local Item_Stone = {}
	local Item_StoneLv = {}
	param = TansferNum(param)
	Item_Stone[1] = GetNum_Part2(param)
	Item_Stone[2] = GetNum_Part4(param)
	Item_Stone[3] = GetNum_Part6(param)
	Item_StoneLv[1] = GetNum_Part3(param)
	Item_StoneLv[2] = GetNum_Part5(param)
	Item_StoneLv[3] = GetNum_Part7(param)
	local ret = Item_StoneLv[1] + Item_StoneLv[2] + Item_StoneLv[3];
	return ret;
end

function can_forge_item_main ( Table )
	local role = 0
	local ItemBag = {}										--道具背包位置
	local ItemCount = {}										--道具数量
	local ItemBagCount = {}										--道具对象数量
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	local ItemBagCount_Jinglian = ItemBagCount [0]
	local ItemBag_Jinglian = ItemBag [0]
	local ItemNum_Jinglian = ItemCount [0]
	local Item_Jinglian = GetChaItem ( role , 2 , ItemBag_Jinglian )
	local Check = 0
	if ItemBagCount_Jinglian ~= 1 then
		SystemNotice( role , "Forging item related slot illegal")
		return 0
	end
	if ItemNum_Jinglian ~= 1 then
		SystemNotice( role , "Forging item quantity illegal")
		return 0
	end
	Check = CheckItem_CanJinglian ( Item_Jinglian )
	if Check == 0 then
		SystemNotice( role ,"Item cannot be forged")
		return 0
	end
	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		SystemNotice ( role ,"Illegal Gem quantity")
		return 0
	end
	local Item_Stone1 = GetChaItem(role, 2, ItemBag [1])
	local Item_Stone2 = GetChaItem(role, 2, ItemBag [2])
	if MAX_STONELV[GetItemID(Item_Stone1)] ~= nil then
		if Get_StoneLv(Item_Stone1) > MAX_STONELV[GetItemID(Item_Stone1)] then
			BickerNotice(role, GetItemName(GetItemID(Item_Stone1)).." is capped at Lv"..MAX_STONELV[GetItemID(Item_Stone1)].."!");
			return 0;
		end
	end
	local getGemLv = GetEquipGemLv(Item_Jinglian);
	if getGemLv >= MAX_FORGELV then
		SystemNotice(role, "The server currently capped forging at +"..MAX_FORGELV.." Equipment!")
		return 0
	end
	local Item_Stone1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Stone2 = GetChaItem ( role , 2 , ItemBag [2] )
	local Check_Hole = 0
	Check_Hole = CheckItem_HaveHole ( Item_Jinglian , Item_Stone1 , Item_Stone2)
	if Check_Hole == 0 then
		SystemNotice( role ,"Does not have enough socket to forge" )
		return 0
	end
	local Check_Stone = 0
	Check_Stone = Check_StoneLv ( Item_Jinglian , Item_Stone1 , Item_Stone2 )
	if Check_Stone == 0 then
		SystemNotice ( role , "Gem or Refining Gem level does not match" )
		return 0
	end
	local Check_StoneItem = 0
	Check_StoneItem = Check_StoneItemType ( Item_Jinglian , Item_Stone1 , Item_Stone2 )
	if Check_StoneItem == 0 then
		SystemNotice ( role , "Gem and forging item does not match" )
		return 0
	end
	local Money_Need = getforge_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"Insufficient Gold. Unable to forge.")
		return 0
	end
	return 1
end

function begin_forge_item(...)
	local arg = {...}
	local Check_CanForge = 0
	Check_CanForge = can_forge_item_main ( arg )
	if Check_CanForge == 0 then
		return 0
	end
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( arg )
	local ItemBag_Jinglian = ItemBag [0]
	local Item_Jinglian = GetChaItem ( role , 2 , ItemBag_Jinglian )
	local Item_Stone1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Stone2 = GetChaItem ( role , 2 , ItemBag [2] )
	local Check_Jinglian_Item = 0
	local Money_Need = getforge_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )
	local ItemID_Jinglian = GetItemID ( Item_Jinglian )
	local Jinglian_Lv_Now = GetItem_JinglianLv ( Item_Jinglian )
	local Num = GetItemForgeParam ( Item_Jinglian , 1 )
	Num = TansferNum ( Num )
	local Stone1Type = GetItemType ( Item_Stone1 )
	local Stone2Type = GetItemType ( Item_Stone2 )
	local Baoshi = 0
	if Stone1Type == 49 then
		Baoshi = Item_Stone1
	elseif Stone2Type == 49 then
		Baoshi = Item_Stone2
	end
	local Item_Stone = {}
	local Item_StoneLv = {}
	local Baoshi_NeedLv = 1
	Item_Stone[0] = GetNum_Part2 ( Num )
	Item_Stone[1] = GetNum_Part4 ( Num )
	Item_Stone[2] = GetNum_Part6 ( Num )
	Item_StoneLv[0] = GetNum_Part3 ( Num )
	Item_StoneLv[1] = GetNum_Part5 ( Num )
	Item_StoneLv[2] = GetNum_Part7 ( Num )
	BaoshiType = GetStone_TypeID ( Baoshi )
	for i = 0 , 2 ,1 do
		if BaoshiType == Item_Stone[i] then
			Baoshi_NeedLv = Item_StoneLv[i] + 1
		end
	end
	local Sklv = 1
	local StateLv = GetChaStateLv ( role , STATE_JLGLJB )
	Sklv = Sklv + StateLv
	local CheckFaild = Percentage_Random(FORGE_RATE[Baoshi_NeedLv])
	if CheckFaild == 1 then
		Check_Jinglian_Item = Jinglian_Item ( Item_Jinglian , Item_Stone1 , Item_Stone2 )
	else
		local cha_name = GetChaDefaultName ( role )
		local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
		LG( "JingLian_ShiBai" , "Player ["..cha_name.."] Forging of equipment failed. Equipment is not damaged - "..Item_Jinglian_name )
		SystemNotice ( role , "Sorry, forging has failed! Luckily equipment is not damaged..." )
	end
	local ItemID_Stone1 = GetItemID ( Item_Stone1 )
	local ItemID_Stone2 = GetItemID ( Item_Stone2 )
	local Stone1_Lv = Get_StoneLv ( Item_Stone1 )
	local Stone2_Lv = Get_StoneLv ( Item_Stone2 )
	local Jinglianshi_Lv = 0
	if Stone1_Lv > Stone2_Lv then
		Jinglianshi_Lv = Stone1_Lv
	else
		Jinglianshi_Lv = Stone2_Lv
	end
	local Jinglian_Lv = GetItem_JinglianLv ( Item_Jinglian )
	local R1 = 0
	local R2 = 0
	R1 = RemoveChaItem ( role , ItemID_Stone1 , 1 , 2 , ItemBag [1] , 2 , 1 , 0 )
	R2 = RemoveChaItem ( role , ItemID_Stone2 , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )
	if R1 == 0 or R2 == 0 then
		LG( "Jinglian" , "Gem deletion failed" )
	end
	if CheckFaild == 0 then
		return 2
	end
	check_item_final_data ( Item_Jinglian )
	local b = Check_CG_Jinglian ( Jinglian_Lv , Jinglianshi_Lv , Sklv )
	if b == 0 then
		i = RemoveChaItem ( role , ItemID_Jinglian , 1 , 2 , ItemBag [0] , 2 , 1 , 0)
		if i == 0 then
			LG( "Hecheng_BS" , "Delete item failed" )
		end
		local cha_name = GetChaDefaultName ( role )
		local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
		LG( "JingLian_ShiBai" , "Player ["..cha_name.."] Forging of equipment failed - "..Item_Jinglian_name )
		SystemNotice( role , "Very sorry! Forging has failed. Item was destroyed!")
		return 2
	end
	local cha_name = GetChaDefaultName ( role )
	local Item_Jinglian_name = GetItemName ( ItemID_Jinglian )
	LG( "JingLian_ShiBai" , "Player ["..cha_name.."] Forging successful - "..Item_Jinglian_name )
	return 1
end

--[[function can_unite_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local Get_Count = 4
	local ItemReadCount = 0
	local ItemReadNow = 1
	local ItemReadNext = 0
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )
	local i = 0
	for i = 0 , 2 , 1 do
		if ItemBagCount[i] ~= 1 or ItemCount[i] ~= 1 then
			SystemNotice( role , "Item target unit and item unit illegal")
			return 0
		end
	end
	local BagItem1 = ItemBag [0]
	local BagItem2 = ItemBag [1]
	local BagItem3 = ItemBag [2]
	local Item1 = GetChaItem ( role , 2 , BagItem1 )
	local Item2 = GetChaItem ( role , 2 , BagItem2 )
	local Item3 = GetChaItem ( role , 2 , BagItem3 )
	local ItemID1 = GetItemID ( Item1 )
	local ItemID2 = GetItemID ( Item2 )
	local ItemID3 = GetItemID ( Item3 )
	local ItemType1 = GetItemType ( Item1 )
	local ItemType2 = GetItemType ( Item2 )
	local ItemType3 = GetItemType ( Item3 )

	if ItemType1 ~= 47 then
		SystemNotice( role ,"This is not a combining scroll")
		return 0
	end
	if ItemType2 ~= 49 or ItemType3 ~= 49 then
		if ItemType2 ~= 50 or ItemType3 ~= 50 then
			SystemNotice( role , "This is not a Gem")
			return 0
		end
	end
	if ItemID2 ~= ItemID3 then
		SystemNotice(role ,"Gem mismatch")
		return 0
	end
	local Item2_Lv = Get_StoneLv ( Item2 )
	local Item3_Lv = Get_StoneLv ( Item3 )
	
	if MAX_STONELV[ItemID2] ~= nil then
		if Item2_Lv >= MAX_STONELV[ItemID2] then
			SystemNotice(role, GetItemName(ItemID2).." can improved to level "..MAX_STONELV[ItemID2].." at most.")
			return 0
		end
	end
	
	if ItemType2 == 49 and ItemType3 == 49 then
		if Item2_Lv >= 9 or Item3_Lv >= 9 then
			SystemNotice ( role , "Gem Lv max")
			return 0
		end
	end
	if Item2_Lv ~= Item3_Lv then 
		SystemNotice(role ,"Level of 2 gems does not match")
		return 0
	end
	local Money_Need = getunite_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"Insufficient gold. Unable to combine")
		return 0
	end
	return 1
end]]

function get_item_unite_money (...)
	local arg = {...}
	local Money = getunite_money_main ( arg )
	return 0
end

function getunite_money_main ( Table )
	return 50000
end

function can_unite_item ( ... )
	local Table = {...}

	local role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	local i = 0
	for i = 0 , 2 , 1 do
		if ItemBagCount[i] < 1 or ItemCount[i] < 1 then
			SystemNotice( role , "Item target unit and item unit illegal")
			return 0
		end
	end

	local role ,BagItem1,BagItem2,BagItem3,Item1,Item2,Item3,ItemID1,ItemID2,ItemID3,ItemType1,ItemType2,ItemType3,Item2_Lv,Item3_Lv= getItemsData(role,ItemBag[0],ItemBag[1],ItemBag[2])

	if ItemType1 ~= 47 then
		SystemNotice( role ,"This is not a combining scroll")
		return 0
	end

	if ItemID2 ~= ItemID3 then
		SystemNotice(role ,"Gem mismatch")
		return 0
	end
	
	if ItemType2 ~= 49 and ItemType2 ~= 50 then
		SystemNotice( role , "This is not a Gem")
		return 0
	end

	if Item2_Lv >= 9 or Item3_Lv >= 9 then
		SystemNotice ( role , "Gem Lv max")
		return 0
	end
	

	if Item2_Lv ~= Item3_Lv then 
		SystemNotice(role ,"Level of 2 gems does not match")
		return 0
	end
	
	if MAX_STONELV[ItemID2] ~= nil then
		if Item2_Lv >= MAX_STONELV[ItemID2] then
			SystemNotice(role, GetItemName(ItemID2).." can improved to level "..MAX_STONELV[ItemID2].." at most.")
			return 0
		end
	end

	if Item2_Lv >= 9 or Item3_Lv >= 9 then
		SystemNotice ( role , "Gem Lv max")
		return 0
	end
		
	if Item2 == Item3 and GetItemStackSize(Item2) < 2 then
		SystemNotice(role ,"Does not possess 2nd gem.")
		return 0
	end

	local Money_Need = getunite_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"Insufficient gold. Unable to combine")
		return 0
	end
	return 1
end

function getItemsData(...)
	local arg = {...}
	
	local role = arg[1]
	local BagItem1 = arg [2]						
	local BagItem2 = arg [3]
	local BagItem3 = arg [4]
	
	local Item1 = GetChaItem ( role , 2 , BagItem1 ) 
	local Item2 = GetChaItem ( role , 2 , BagItem2 ) 
	local Item3 = GetChaItem ( role , 2 , BagItem3 ) 
	
	local ItemID1 = GetItemID ( Item1 )				 
	local ItemID2 = GetItemID ( Item2 ) 
	local ItemID3 = GetItemID ( Item3 ) 
	
	local ItemType1 = GetItemType ( Item1 )
	local ItemType2 = GetItemType ( Item2 )
	local ItemType3 = GetItemType ( Item3 )
	
	local Item2_Lv = Get_StoneLv ( Item2 )			
	local Item3_Lv = Get_StoneLv ( Item3 )
	
	return role ,BagItem1,BagItem2,BagItem3,Item1,Item2,Item3,ItemID1,ItemID2,ItemID3,ItemType1,ItemType2,ItemType3,Item2_Lv,Item3_Lv
end

function begin_unite_item (...)
	local arg = {...}	
	if can_unite_item ( unpack(arg) ) == 0 then
		return 0
	end
	
	local role ,BagItem1,BagItem2,BagItem3,Item1,Item2,Item3,ItemID1,ItemID2,ItemID3,ItemType1,ItemType2,ItemType3,Item2_Lv,Item3_Lv= getItemsData(arg[1],arg [3],arg [6] ,arg [9] )
	
	local i = RemoveChaItem ( role , ItemID1 , 1 , 2 , BagItem1 , 2 , 1 , 0) or 0
	local j = RemoveChaItem ( role , ItemID3 , 1 , 2 , BagItem3 , 2 , 1 , 0) or 0
	local k = RemoveChaItem ( role , ItemID2 , 1 , 2 , BagItem2 , 2 , 1 , 0) or 0
	
	if i == 0 or j == 0 or k == 0 then
		LG( "Hecheng_BS" , "Delete item failed" )
	end
	
	Item2_Lv =Item2_Lv + 1
	
	local Money_Need = getunite_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )

	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )
	
	local Sklv = 1
	local StateLv = GetChaStateLv ( role , STATE_HCGLJB )
	
	Sklv = Sklv + StateLv

	local b = Check_CG_HechengBS ( Item2_Lv , ItemType2 , Sklv )
	if b == 0 then
		SystemNotice( role , "Very sorry, combining has failed. Gem has vanished...")
		return 2	
	end
	local itemTab = {
		ID = ItemID2,
		Quantity = 1,
		MaxEnergy = Item2_Lv
	}
	AddItem(role,itemTab)
	local cha_name = GetChaDefaultName ( role )
	LG( "JingLian_ShiBai" , "Player"..cha_name.."Gem combining successful" )

	return 1
end