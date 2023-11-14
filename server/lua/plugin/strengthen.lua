print('Loading strengthen.lua')


StrengthenMax = 10 --2% per level

StrengthenRates = {
	1,
	1,
	0.8,
	0.7,
	0.6,
	0.5,
	0.5,
	0.4,
	0.4,
	0.3,
}

CanStrengthen ={
	[1] = true,--sword
	[2] = true,--gr8 sword
	[3] = true,--bow 
	[4] = true,--gun 
	[7] = true,--staff 
	[9] = true,--dagger 
	[11] = true,--shield 
	[19] = true,--helm 
	[22] = true,--armour 
	[23] = true,--glove 
	[24] = true,--boot 
	
	[25] = true,--neck 
	[26] = true,--ring 
	
	[27] = true,--tattoo
	
	[29] = false,--conch 
	
	[81] = true,--brace 
	[82] = true,--belt 
	[83] = true,--handguard 
	
	
}


--change this to be better
function Check_CG_beuplv ( Item_Lv )
	return Percentage_Random(StrengthenRates[Item_Lv+1] or 0)
end

function CheckCanStringthen(item)
	local Type = GetItemType ( item )
	return CanStrengthen[Type] or false
end

--we dont want fusing to work anymore.
function can_fusion_item(...)
	return 0
end

function can_upgrade_item (...)
	local arg = {...}
	if #arg ~= 12 then
		SystemNotice ( arg[1] , "parameter value illegal"..#arg )
		return 0
	end

	local Check = 0

	Check = can_beuplv_item_main ( arg )

	if Check == 1 then
		return 1
	else
		return 0
	end

end

function can_beuplv_item_main ( Table )


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

	local ItemBagCount_beuplv = ItemBagCount [1]
	local ItemBag_beuplv = ItemBag [1]
	local ItemNum_beuplv = ItemCount [1]
	local Item_beuplv = GetChaItem ( role , 2 , ItemBag_beuplv ) 

	local Item_beuplv_Type = GetItemType ( Item_beuplv )		
	local Item_beuplv_ID = GetItemID ( Item_beuplv )		
	local Item_ScItem = GetChaItem ( role , 2 , ItemBag [0] )	
	local Item_YxItem = GetChaItem ( role , 2 , ItemBag [2] )	
	local Item_ScItem_ID = GetItemID ( Item_ScItem )		
	local Item_YxItem_ID = GetItemID ( Item_YxItem )		
	local Item_ScItem_Type = GetItemType ( Item_ScItem )		
	local Item_YxItem_Type = GetItemType ( Item_YxItem )		


	local Item_beuplv_Lv =  Get_Itembeuplv_Lv ( Item_beuplv )	
	
	local ItemAttr_Val_Fusionid = GetItemAttr ( Item_beuplv , ITEMATTR_VAL_FUSIONID )

	if Item_beuplv_Lv >= StrengthenMax then					
		SystemNotice( role ,"Item level limit max. Unable to level again")
		return 0
	end
	if ItemBagCount_beuplv ~= 1 then				
		SystemNotice( role , "Strengthening item level slot illegal ")
		return 0
	end
	if Item_ScItem_Type ~= 62 then
		SystemNotice( role , "Invalid Strengthening  scroll type ")
		return 0
	end
	if Item_YxItem_Type ~= 63 then
		SystemNotice( role , "Strengthening gem type illegal ")
		return 0
	end

	if ItemNum_beuplv ~= 1 then
		SystemNotice( role , "Illegal force item upgrade number")
		return 0
	end
	
	if not CheckCanStringthen(Item_beuplv) then
		SystemNotice( role , "Item can not be strengthened.")
		return 0
	end

	if ItemCount [0] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [0] ~= 1 or ItemBagCount [2] ~= 1 then 
		SystemNotice ( role ,"Item mall items or game items error")
		return 0
	end

	local Money_Need = getupgrade_money_main ( Table )

	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"Insufficient gold. Unable to level up equipment")
		return 0
	end

	return 1

end


function begin_upgrade_item (...)
	local arg = {...}


	local Check_Canbeuplv = 0
	Check_Canbeuplv = can_beuplv_item_main ( arg )

	if Check_Canbeuplv == 0 then
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

	local ItemBag_beuplv = ItemBag [1]
	local Item_beuplv = GetChaItem ( role , 2 , ItemBag_beuplv )    
	local Item_ScItem = GetChaItem ( role , 2 , ItemBag [0] )	
	local Item_YxItem = GetChaItem ( role , 2 , ItemBag [2] )	
	local Item_ScItem_ID = GetItemID ( Item_ScItem )		
	local Item_YxItem_ID = GetItemID ( Item_YxItem )		

	local Item_beuplv_Lv =  Get_Itembeuplv_Lv ( Item_beuplv )	 

	local R1 = 0
	local R2 = 0

	R1 = RemoveChaItem ( role , Item_ScItem_ID , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		
	R2 = RemoveChaItem ( role , Item_YxItem_ID , 1 , 2 , ItemBag [2] , 2 , 1 , 0 )		

	if R1 == 0 or R2 == 0 then
		LG( "beuplv" , "Delete item failed" )
	end

	local Money_Need = getupgrade_money_main ( arg )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	Money_Have = Money_Have - Money_Need
	SetCharaAttr ( Money_Have , role , ATTR_GD )
	ALLExAttrSet( role )						

	local a = Check_CG_beuplv ( Item_beuplv_Lv )			

	if a == 0 then
		local cha_name = GetChaDefaultName ( role )
		LG( "JingLian_ShiBai" , "Player"..cha_name.."Forced upgrade failed" )
		SystemNotice( role , "Sorry, Strengthening has failed. Some items have disappeared...")
		return 0
	end


	Item_beuplv_Lv = Item_beuplv_Lv + 1

	SetChaKitbagChange( role , 1 )

	Set_Itembeuplv_Lv ( Item_beuplv , Item_beuplv_Lv )

	SynChaKitbag( role, 4 )

	local LvD = GetItemAttr( Item_beuplv , ITEMATTR_VAL_LEVEL )

	SynChaKitbag(role,13)

	SystemNotice( role , "Level up successful")
	local cha_name = GetChaDefaultName ( role )
	LG( "JingLian_ShiBai" , "Player"..cha_name.."Strengthening successful;" )

	return 1

end

function Get_Itembeuplv_Lv ( Item )								

	local Lv = GetItemAttr ( Item , ITEMATTR_VAL_LEVEL )

	return Lv
end

function Set_Itembeuplv_Lv ( Item , Item_Lv )							
	local i = 0
	i = SetItemAttr ( Item , ITEMATTR_VAL_LEVEL , Item_Lv )
	if i == 0 then
		LG( "Hecheng_BS","Failed to set gem level" )
	end
end



function get_item_upgrade_money(...)
	local arg = {...}
	local Money = getupgrade_money_main ( arg )
	return Money
end


function getupgrade_money_main ( Table )

	local role = 0
	local ItemBag = {}						
	local ItemCount = {}					
	local ItemBagCount = {}					
	local ItemBag_Num = 0					
	local ItemCount_Num = 0					
	local ItemBagCount_Num = 0				

	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )

	local ItemBag_Waiguan = ItemBag [1]
	local Item_Waiguan = GetChaItem ( role , 2 , ItemBag_Waiguan )
	local Waiguan_Lv = 0

	local Waiguan_Lv =  Get_Itembeuplv_Lv ( Item_Waiguan )

	local Money_Need = ( Waiguan_Lv + 1 )*( Waiguan_Lv + 1 )*10000

	return Money_Need
end