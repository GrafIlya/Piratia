print("Loading socket.lua")
-- 890,891
MAX_SOCKETS = 2

SOCKET_RATE = {}
SOCKET_RATE[0] = 1
SOCKET_RATE[1] = 1
SOCKET_RATE[2] = .4

function Damo_ChengGong ( role , Item_damo )
	local Num = GetItemForgeParam ( Item_damo , 1 )
	local i = 0
	Num = TansferNum ( Num )
	local Hole_Num = GetNum_Part1 ( Num )
	if Hole_Num <= MAX_SOCKETS then
		SystemNotice ( role , "Fusion successful. Obtain new socket in equipment." )
		Hole_Num = Hole_Num + 1
	else
		SystemNotice ( role , "Item sockets max. Unable to make new socket" )
	end
	Num = SetNum_Part1 ( Num , Hole_Num )
	i = SetItemForgeParam ( Item_damo , 1 , Num )
	if i == 0 then
		LG( "Damo" , "set forging content failed" )
	end
end

function can_milling_item_main ( Table )
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
	local ItemBag_damo = ItemBag [0]
	local Item_damo = GetChaItem ( role , 2 , ItemBag_damo )
	local Item_Cailiao1 = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_Cailiao2 = GetChaItem ( role , 2 , ItemBag [2] )
	local Check_Cailiao1 = 0
	local Check_Cailiao2 = 0
	Check_Cailiao1 = Check_Jiaguji ( Item_Cailiao1 , Item_Cailiao2 )
	Check_Cailiao2 = Check_Cuihuafen ( Item_Cailiao1 , Item_Cailiao2 )
	if Check_Cailiao1 == 0 then
		SystemNotice ( role , "Fusion requires Equipment Stabilizer" )
		return 0
	end
	if Check_Cailiao2 == 0 then
		SystemNotice ( role , "Requires Equipment Catalyst for fusion" )
		return 0
	end
	local Check_Hole = 0
	Check_Hole = Check_HasHole ( Item_damo )
	if Check_Hole >= MAX_SOCKETS then
		SystemNotice ( role , "Socket slots are max. Unable to continue Fusion" )
		return 0
	end
	local Money_Need = get_milling_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"Insufficient gold. Unable to undergo fusion")
		return 0
	end
	return 1
end

function Check_CG_damo ( Item_damo , Sklv )
	local a = 0
	local Hole_Num = Check_HasHole(Item_damo)
	if SOCKET_RATE[Hole_Num] ~= nil then
		a = SOCKET_RATE[Hole_Num]
	end
	local b = Percentage_Random(a)
	return b
end