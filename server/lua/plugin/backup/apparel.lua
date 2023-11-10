print('Loading apparel.lua')

--[[
-- @func can_fusion_item_main
-- @info allows fusion of apparel with ids over 7k+
-- ported from 2.x files
--]]
function can_fusion_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role, ItemBag, ItemCount, ItemBagCount, ItemBag_Now, ItemCount_Now, ItemBagCount_Num = Read_Table ( Table )
	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		SystemNotice ( role ,"equipment quantity illegal ")
		return 0
	end
	local Item_Juanzhou = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Shuxing = GetChaItem ( role , 2 , ItemBag [2] )
	local ItemType_Juanzhou = GetItemType ( Item_Juanzhou )
	if ItemType_Juanzhou ~= 60 then
		SystemNotice( role ,"Scroll usage error")
		return 0
	end
	local ItemID_Waiguan = GetItemAttr ( Item_Waiguan , ITEMATTR_MAXURE )
	if ItemID_Waiguan ~= 25000 then
		SystemNotice( role ,"Apparel cannot be determined!")
		return 0
	end
	local Item_URE = GetItemAttr ( Item_Waiguan , ITEMATTR_URE )
	local Item_MAXENERGY = GetItemAttr ( Item_Waiguan , ITEMATTR_MAXURE )
	if	Item_URE < Item_MAXENERGY then
		SystemNotice( role ,"Armors have not reach the durability limit, cannot assign attribute")
		return 0
	end
	local Item_FUSIONID_star = GetItemAttr ( Item_Shuxing , ITEMATTR_VAL_FUSIONID )
	local ItemID_shuxing_star = GetItemAttr ( Item_Shuxing ,ITEMATTR_MAXURE )
	if	Item_FUSIONID_star == 0 and ItemID_shuxing_star == 25000 then
		SystemNotice( role ,"Equipment on right slot has not attribute. Unable to fuse!")
		return 0
	end
	local ItemType_Shuxing = GetItemType (Item_Shuxing)
	if	ItemType_Shuxing < 1	then
		SystemNotice( role ," Current item stats cannot be	transfer to another item")
		return 0
	elseif ItemType_Shuxing > 11 and	ItemType_Shuxing < 20 then
		SystemNotice( role ," Current item stats cannot be	transfer to another item")
		return 0
	elseif ItemType_Shuxing > 24	and ItemType_Shuxing ~= 27 then
		SystemNotice( role ," Current item stats cannot be	transfer to another item")
		return 0
	end
	local ItemType_Shuxing = GetItemType ( Item_Shuxing )
	local ItemType_Waiguan = GetItemType ( Item_Waiguan )
	local star=0
	if ItemType_Shuxing ~= 22 and ItemType_Shuxing ~=27 then
		star = 1
	end
	if ItemType_Waiguan~=27	then
		if ItemType_Shuxing ~= ItemType_Waiguan then
			SystemNotice( role ,"Both equipment type mismatch" )
			return 0
		end 
	elseif ItemType_Waiguan==27 and star == 1 then
		SystemNotice( role ,"Both equipment type mismatch" )
		return 0
	end
	local Check_RongHe = 0
	Check_RongHe = CheckFusionItem( Item_Waiguan , Item_Shuxing )
	if Check_RongHe == LUA_FALSE then
		SystemNotice( role ,"Both equipment type or class requirement does not match" )
		return 0
	end
	if ItemBagCount[3] == 0 then
		local Item_Waiguan_name = GetItemName ( ItemID_Waiguan )
		LG("Ronghe_CuiHuaJi","Combine armors and weapons without catalyst - [",Item_Waiguan_name,"] - No forging effect")
	end
	if ItemBagCount[3] ~= 0 then
		local Item_Cuihuaji =	GetChaItem ( role , 2 , ItemBag [3] )
		local ItemType_Cuihuaji =	GetItemType ( Item_Cuihuaji )
		if	ItemType_Cuihuaji ~= 61 then
			SystemNotice( role ,"there is some problem with the catalyst, cannot be used " )
			return 0
		end
	end
	local Money_Need = getfusion_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"Insufficient gold. Unable to undergo Fusion")
		return 0
	end
	return 1
end