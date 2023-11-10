print('Loading treasure.lua')

function GiveGoldenMapItem_JLB ( role )
	local CheckRandom = math.random ( 1,100 )
	local x, y = GetChaPos(role)
	local lv= GetChaAttr(role, ATTR_LV) 
	local a=math.floor ( lv / 5 ) + 826
	local b=math.floor ( lv / 5 ) + 828
	local monserID=math.random(a,b)
	if CheckRandom >= 1 and CheckRandom <= 20 then
		local GiveMoney = 10000 * math.random ( 1, 20 )
		SystemNotice ( role , "Dug out Caribbean Treasure and obtain "..GiveMoney.."G" )
		AddMoney ( role , 0 , GiveMoney )
	elseif CheckRandom > 20 and CheckRandom <= 24 then
		XianJing ( role , 1 )
	elseif CheckRandom > 24 and CheckRandom <= 28 then
		XianJing ( role , 2 )
	elseif CheckRandom > 28 and CheckRandom <= 33 then
		SystemNotice ( role , "Today seems to be spining about. Don't know where it will spin to" )
		MapRandomtele ( role )
	elseif CheckRandom > 33 and CheckRandom <= 40 then
		SystemNotice ( role , "Oh no! Who let the dogs out! Help..." )
		local new1 = CreateCha(monserID, x, y, 145, 30)
		SetChaLifeTime(new1, 90000)
	else
		SystemNotice ( role , "dug out a hidden pirate treasure..." )
		local item_type = BaoXiang_JLBCBTBOX
		local item_type_rad = BaoXiang_JLBCBTBOX_Rad
		local item_type_count = BaoXiang_JLBCBTBOX_Count
		local maxitem = BaoXiang_JLBCBTBOX_Mxcount
		local item_quality = BaoXiang_JLBCBTBOX_Qua
		local General = 0  
		local ItemId = 0 
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		for i = 1 , maxitem , 1 do 
			General = item_type_rad [ i ] + General
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local c = -1
		for k = 1 , maxitem , 1 do
			d = item_type_rad [ k ] + b
			 if a <= d and a > b then
				c = k
				break 
			end 
			b = d 
		end 
		if c == -1 then 
			ItemId = 3124 
		else 
			ItemId = item_type [c]  
			ItemCount = item_type_count [c] 
		end 
		GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
		local GoodItem = {}
		GoodItem[0] = 0110
		GoodItem[1] = 0112
		GoodItem[2] = 0114
		GoodItem[3] = 0116
		GoodItem[4] = 0118
		GoodItem[5] = 0120
		GoodItem[6] = 0151
		GoodItem[7] = 0396
		GoodItem[8] = 0398
		GoodItem[9] = 0400
		GoodItem[10] = 0402
		GoodItem[11] = 0404
		GoodItem[12] = 0406
		GoodItem[13] = 0408
		GoodItem[14] = 0411
		GoodItem[15] = 0413
		GoodItem[16] = 0588
		GoodItem[17] = 0590
		GoodItem[18] = 0592
		GoodItem[19] = 0594
		GoodItem[20] = 0596
		GoodItem[21] = 0598
		GoodItem[22] = 0600
		GoodItem[23] = 0602
		GoodItem[24] = 0748
		GoodItem[25] = 0750
		GoodItem[26] = 0752
		GoodItem[27] = 0754
		GoodItem[28] = 0756
		GoodItem[29] = 0758
		GoodItem[30] = 0760
		GoodItem[31] = 0824
		GoodItem[32] = 0860
		GoodItem[33] = 0861
		GoodItem[34] = 0862
		GoodItem[35] = 0863
		GoodItem[36] = 1012
		local Good_C = 0
		for Good_C = 0 , table.getn(GoodItem) , 1 do
			if ItemId == GoodItem[Good_C] then
				local itemname = GetItemName ( ItemId ) 
				local cha_name = GetChaDefaultName ( role ) 
				local message = cha_name.." dug out a treasure and obtained "..itemname
				Notice ( message )
			end
		end
	end
end

BaoXiang_JLBCBTBOX_Qua = 5

BaoXiang_JLBCBTBOX = {}
BaoXiang_JLBCBTBOX_Rad = {}
BaoXiang_JLBCBTBOX_Count = {}

BaoXiang_JLBCBTBOX[1] = 0291	BaoXiang_JLBCBTBOX_Rad[1] = 50 		BaoXiang_JLBCBTBOX_Count[1] = 1
BaoXiang_JLBCBTBOX[2] = 0293	BaoXiang_JLBCBTBOX_Rad[2] = 50 		BaoXiang_JLBCBTBOX_Count[2] = 1
BaoXiang_JLBCBTBOX[3] = 0295	BaoXiang_JLBCBTBOX_Rad[3] = 50 		BaoXiang_JLBCBTBOX_Count[3] = 1
BaoXiang_JLBCBTBOX[4] = 0297	BaoXiang_JLBCBTBOX_Rad[4] = 50 		BaoXiang_JLBCBTBOX_Count[4] = 1
BaoXiang_JLBCBTBOX[5] = 0298	BaoXiang_JLBCBTBOX_Rad[5] = 50 		BaoXiang_JLBCBTBOX_Count[5] = 1
BaoXiang_JLBCBTBOX[6] = 0300	BaoXiang_JLBCBTBOX_Rad[6] = 50 		BaoXiang_JLBCBTBOX_Count[6] = 1
BaoXiang_JLBCBTBOX[7] = 0306	BaoXiang_JLBCBTBOX_Rad[7] = 50 		BaoXiang_JLBCBTBOX_Count[7] = 1
BaoXiang_JLBCBTBOX[8] = 0307	BaoXiang_JLBCBTBOX_Rad[8] = 50 		BaoXiang_JLBCBTBOX_Count[8] = 1
BaoXiang_JLBCBTBOX[9] = 0311	BaoXiang_JLBCBTBOX_Rad[9] = 50 		BaoXiang_JLBCBTBOX_Count[9] = 1
BaoXiang_JLBCBTBOX[10] = 0313	BaoXiang_JLBCBTBOX_Rad[10] = 50 	BaoXiang_JLBCBTBOX_Count[10] = 1
BaoXiang_JLBCBTBOX[11] = 0314	BaoXiang_JLBCBTBOX_Rad[11] = 50 	BaoXiang_JLBCBTBOX_Count[11] = 1
BaoXiang_JLBCBTBOX[12] = 0336	BaoXiang_JLBCBTBOX_Rad[12] = 50 	BaoXiang_JLBCBTBOX_Count[12] = 1
BaoXiang_JLBCBTBOX[13] = 0337	BaoXiang_JLBCBTBOX_Rad[13] = 50 	BaoXiang_JLBCBTBOX_Count[13] = 1
BaoXiang_JLBCBTBOX[14] = 0338	BaoXiang_JLBCBTBOX_Rad[14] = 50 	BaoXiang_JLBCBTBOX_Count[14] = 1
BaoXiang_JLBCBTBOX[15] = 0339	BaoXiang_JLBCBTBOX_Rad[15] = 50 	BaoXiang_JLBCBTBOX_Count[15] = 1
BaoXiang_JLBCBTBOX[16] = 0340	BaoXiang_JLBCBTBOX_Rad[16] = 50 	BaoXiang_JLBCBTBOX_Count[16] = 1
BaoXiang_JLBCBTBOX[17] = 0341	BaoXiang_JLBCBTBOX_Rad[17] = 50 	BaoXiang_JLBCBTBOX_Count[17] = 1
BaoXiang_JLBCBTBOX[18] = 0352	BaoXiang_JLBCBTBOX_Rad[18] = 50 	BaoXiang_JLBCBTBOX_Count[18] = 1
BaoXiang_JLBCBTBOX[19] = 0353	BaoXiang_JLBCBTBOX_Rad[19] = 50 	BaoXiang_JLBCBTBOX_Count[19] = 1
BaoXiang_JLBCBTBOX[20] = 0354	BaoXiang_JLBCBTBOX_Rad[20] = 50 	BaoXiang_JLBCBTBOX_Count[20] = 1
BaoXiang_JLBCBTBOX[21] = 0350	BaoXiang_JLBCBTBOX_Rad[21] = 50 	BaoXiang_JLBCBTBOX_Count[21] = 1
BaoXiang_JLBCBTBOX[22] = 0360	BaoXiang_JLBCBTBOX_Rad[22] = 50 	BaoXiang_JLBCBTBOX_Count[22] = 1
BaoXiang_JLBCBTBOX[23] = 0361	BaoXiang_JLBCBTBOX_Rad[23] = 50 	BaoXiang_JLBCBTBOX_Count[23] = 1
BaoXiang_JLBCBTBOX[24] = 0362	BaoXiang_JLBCBTBOX_Rad[24] = 50 	BaoXiang_JLBCBTBOX_Count[24] = 1
BaoXiang_JLBCBTBOX[25] = 0467	BaoXiang_JLBCBTBOX_Rad[25] = 50 	BaoXiang_JLBCBTBOX_Count[25] = 1
BaoXiang_JLBCBTBOX[26] = 0469	BaoXiang_JLBCBTBOX_Rad[26] = 50 	BaoXiang_JLBCBTBOX_Count[26] = 1
BaoXiang_JLBCBTBOX[27] = 0471	BaoXiang_JLBCBTBOX_Rad[27] = 50 	BaoXiang_JLBCBTBOX_Count[27] = 1
BaoXiang_JLBCBTBOX[28] = 0473	BaoXiang_JLBCBTBOX_Rad[28] = 50 	BaoXiang_JLBCBTBOX_Count[28] = 1
BaoXiang_JLBCBTBOX[29] = 0474	BaoXiang_JLBCBTBOX_Rad[29] = 50 	BaoXiang_JLBCBTBOX_Count[29] = 1
BaoXiang_JLBCBTBOX[30] = 0476	BaoXiang_JLBCBTBOX_Rad[30] = 50 	BaoXiang_JLBCBTBOX_Count[30] = 1
BaoXiang_JLBCBTBOX[31] = 0482	BaoXiang_JLBCBTBOX_Rad[31] = 50 	BaoXiang_JLBCBTBOX_Count[31] = 1
BaoXiang_JLBCBTBOX[32] = 0483	BaoXiang_JLBCBTBOX_Rad[32] = 50 	BaoXiang_JLBCBTBOX_Count[32] = 1
BaoXiang_JLBCBTBOX[33] = 0486	BaoXiang_JLBCBTBOX_Rad[33] = 50 	BaoXiang_JLBCBTBOX_Count[33] = 1
BaoXiang_JLBCBTBOX[34] = 0487	BaoXiang_JLBCBTBOX_Rad[34] = 50 	BaoXiang_JLBCBTBOX_Count[34] = 1
BaoXiang_JLBCBTBOX[35] = 0490	BaoXiang_JLBCBTBOX_Rad[35] = 50 	BaoXiang_JLBCBTBOX_Count[35] = 1
BaoXiang_JLBCBTBOX[36] = 0513	BaoXiang_JLBCBTBOX_Rad[36] = 50 	BaoXiang_JLBCBTBOX_Count[36] = 1
BaoXiang_JLBCBTBOX[37] = 0514	BaoXiang_JLBCBTBOX_Rad[37] = 50 	BaoXiang_JLBCBTBOX_Count[37] = 1
BaoXiang_JLBCBTBOX[38] = 0515	BaoXiang_JLBCBTBOX_Rad[38] = 50 	BaoXiang_JLBCBTBOX_Count[38] = 1
BaoXiang_JLBCBTBOX[39] = 0516	BaoXiang_JLBCBTBOX_Rad[39] = 50 	BaoXiang_JLBCBTBOX_Count[39] = 1
BaoXiang_JLBCBTBOX[40] = 0517	BaoXiang_JLBCBTBOX_Rad[40] = 50 	BaoXiang_JLBCBTBOX_Count[40] = 1
BaoXiang_JLBCBTBOX[41] = 0536	BaoXiang_JLBCBTBOX_Rad[41] = 50 	BaoXiang_JLBCBTBOX_Count[41] = 1
BaoXiang_JLBCBTBOX[42] = 0537	BaoXiang_JLBCBTBOX_Rad[42] = 50 	BaoXiang_JLBCBTBOX_Count[42] = 1
BaoXiang_JLBCBTBOX[43] = 0542	BaoXiang_JLBCBTBOX_Rad[43] = 50 	BaoXiang_JLBCBTBOX_Count[43] = 1
BaoXiang_JLBCBTBOX[44] = 0543	BaoXiang_JLBCBTBOX_Rad[44] = 50 	BaoXiang_JLBCBTBOX_Count[44] = 1
BaoXiang_JLBCBTBOX[45] = 0544	BaoXiang_JLBCBTBOX_Rad[45] = 50 	BaoXiang_JLBCBTBOX_Count[45] = 1
BaoXiang_JLBCBTBOX[46] = 0546	BaoXiang_JLBCBTBOX_Rad[46] = 50 	BaoXiang_JLBCBTBOX_Count[46] = 1
BaoXiang_JLBCBTBOX[47] = 0549	BaoXiang_JLBCBTBOX_Rad[47] = 50 	BaoXiang_JLBCBTBOX_Count[47] = 1
BaoXiang_JLBCBTBOX[48] = 0550	BaoXiang_JLBCBTBOX_Rad[48] = 50 	BaoXiang_JLBCBTBOX_Count[48] = 1
BaoXiang_JLBCBTBOX[49] = 0557	BaoXiang_JLBCBTBOX_Rad[49] = 50 	BaoXiang_JLBCBTBOX_Count[49] = 1
BaoXiang_JLBCBTBOX[50] = 0562	BaoXiang_JLBCBTBOX_Rad[50] = 50 	BaoXiang_JLBCBTBOX_Count[50] = 1
BaoXiang_JLBCBTBOX[51] = 0565	BaoXiang_JLBCBTBOX_Rad[51] = 50 	BaoXiang_JLBCBTBOX_Count[51] = 1
BaoXiang_JLBCBTBOX[52] = 0566	BaoXiang_JLBCBTBOX_Rad[52] = 50 	BaoXiang_JLBCBTBOX_Count[52] = 1
BaoXiang_JLBCBTBOX[53] = 0568	BaoXiang_JLBCBTBOX_Rad[53] = 50 	BaoXiang_JLBCBTBOX_Count[53] = 1
BaoXiang_JLBCBTBOX[54] = 0649	BaoXiang_JLBCBTBOX_Rad[54] = 50 	BaoXiang_JLBCBTBOX_Count[54] = 1
BaoXiang_JLBCBTBOX[55] = 0650	BaoXiang_JLBCBTBOX_Rad[55] = 50 	BaoXiang_JLBCBTBOX_Count[55] = 1
BaoXiang_JLBCBTBOX[56] = 0652	BaoXiang_JLBCBTBOX_Rad[56] = 50 	BaoXiang_JLBCBTBOX_Count[56] = 1
BaoXiang_JLBCBTBOX[57] = 0658	BaoXiang_JLBCBTBOX_Rad[57] = 50 	BaoXiang_JLBCBTBOX_Count[57] = 1
BaoXiang_JLBCBTBOX[58] = 0659	BaoXiang_JLBCBTBOX_Rad[58] = 50 	BaoXiang_JLBCBTBOX_Count[58] = 1
BaoXiang_JLBCBTBOX[59] = 0662	BaoXiang_JLBCBTBOX_Rad[59] = 50 	BaoXiang_JLBCBTBOX_Count[59] = 1
BaoXiang_JLBCBTBOX[60] = 0665	BaoXiang_JLBCBTBOX_Rad[60] = 50 	BaoXiang_JLBCBTBOX_Count[60] = 1
BaoXiang_JLBCBTBOX[61] = 0666	BaoXiang_JLBCBTBOX_Rad[61] = 50 	BaoXiang_JLBCBTBOX_Count[61] = 1
BaoXiang_JLBCBTBOX[62] = 0689	BaoXiang_JLBCBTBOX_Rad[62] = 50 	BaoXiang_JLBCBTBOX_Count[62] = 1
BaoXiang_JLBCBTBOX[63] = 0690	BaoXiang_JLBCBTBOX_Rad[63] = 50 	BaoXiang_JLBCBTBOX_Count[63] = 1
BaoXiang_JLBCBTBOX[64] = 0691	BaoXiang_JLBCBTBOX_Rad[64] = 50 	BaoXiang_JLBCBTBOX_Count[64] = 1
BaoXiang_JLBCBTBOX[65] = 0692	BaoXiang_JLBCBTBOX_Rad[65] = 50 	BaoXiang_JLBCBTBOX_Count[65] = 1
BaoXiang_JLBCBTBOX[66] = 0693	BaoXiang_JLBCBTBOX_Rad[66] = 50 	BaoXiang_JLBCBTBOX_Count[66] = 1
BaoXiang_JLBCBTBOX[67] = 0702	BaoXiang_JLBCBTBOX_Rad[67] = 50 	BaoXiang_JLBCBTBOX_Count[67] = 1
BaoXiang_JLBCBTBOX[68] = 0704	BaoXiang_JLBCBTBOX_Rad[68] = 50 	BaoXiang_JLBCBTBOX_Count[68] = 1
BaoXiang_JLBCBTBOX[69] = 0705	BaoXiang_JLBCBTBOX_Rad[69] = 50 	BaoXiang_JLBCBTBOX_Count[69] = 1
BaoXiang_JLBCBTBOX[70] = 0706	BaoXiang_JLBCBTBOX_Rad[70] = 50 	BaoXiang_JLBCBTBOX_Count[70] = 1
BaoXiang_JLBCBTBOX[71] = 0712	BaoXiang_JLBCBTBOX_Rad[71] = 50 	BaoXiang_JLBCBTBOX_Count[71] = 1
BaoXiang_JLBCBTBOX[72] = 0713	BaoXiang_JLBCBTBOX_Rad[72] = 50 	BaoXiang_JLBCBTBOX_Count[72] = 1
BaoXiang_JLBCBTBOX[73] = 0718	BaoXiang_JLBCBTBOX_Rad[73] = 50 	BaoXiang_JLBCBTBOX_Count[73] = 1
BaoXiang_JLBCBTBOX[74] = 0719	BaoXiang_JLBCBTBOX_Rad[74] = 50 	BaoXiang_JLBCBTBOX_Count[74] = 1
BaoXiang_JLBCBTBOX[75] = 0720	BaoXiang_JLBCBTBOX_Rad[75] = 50 	BaoXiang_JLBCBTBOX_Count[75] = 1
BaoXiang_JLBCBTBOX[76] = 0722	BaoXiang_JLBCBTBOX_Rad[76] = 50 	BaoXiang_JLBCBTBOX_Count[76] = 1
BaoXiang_JLBCBTBOX[77] = 0725	BaoXiang_JLBCBTBOX_Rad[77] = 50 	BaoXiang_JLBCBTBOX_Count[77] = 1
BaoXiang_JLBCBTBOX[78] = 0726	BaoXiang_JLBCBTBOX_Rad[78] = 50 	BaoXiang_JLBCBTBOX_Count[78] = 1
BaoXiang_JLBCBTBOX[79] = 0733	BaoXiang_JLBCBTBOX_Rad[79] = 50 	BaoXiang_JLBCBTBOX_Count[79] = 1
BaoXiang_JLBCBTBOX[80] = 0738	BaoXiang_JLBCBTBOX_Rad[80] = 50 	BaoXiang_JLBCBTBOX_Count[80] = 1
BaoXiang_JLBCBTBOX[81] = 0741	BaoXiang_JLBCBTBOX_Rad[81] = 50 	BaoXiang_JLBCBTBOX_Count[81] = 1
BaoXiang_JLBCBTBOX[82] = 0742	BaoXiang_JLBCBTBOX_Rad[82] = 50 	BaoXiang_JLBCBTBOX_Count[82] = 1
BaoXiang_JLBCBTBOX[83] = 0744	BaoXiang_JLBCBTBOX_Rad[83] = 50 	BaoXiang_JLBCBTBOX_Count[83] = 1
BaoXiang_JLBCBTBOX[84] = 0763	BaoXiang_JLBCBTBOX_Rad[84] = 30 	BaoXiang_JLBCBTBOX_Count[84] = 1
BaoXiang_JLBCBTBOX[85] = 0770	BaoXiang_JLBCBTBOX_Rad[85] = 30 	BaoXiang_JLBCBTBOX_Count[85] = 1
BaoXiang_JLBCBTBOX[86] = 0777	BaoXiang_JLBCBTBOX_Rad[86] = 30 	BaoXiang_JLBCBTBOX_Count[86] = 1
BaoXiang_JLBCBTBOX[87] = 0781	BaoXiang_JLBCBTBOX_Rad[87] = 30 	BaoXiang_JLBCBTBOX_Count[87] = 1
BaoXiang_JLBCBTBOX[88] = 0785	BaoXiang_JLBCBTBOX_Rad[88] = 30 	BaoXiang_JLBCBTBOX_Count[88] = 1
BaoXiang_JLBCBTBOX[89] = 0789	BaoXiang_JLBCBTBOX_Rad[89] = 30 	BaoXiang_JLBCBTBOX_Count[89] = 1
BaoXiang_JLBCBTBOX[90] = 0799	BaoXiang_JLBCBTBOX_Rad[90] = 30 	BaoXiang_JLBCBTBOX_Count[90] = 1
BaoXiang_JLBCBTBOX[91] = 0803	BaoXiang_JLBCBTBOX_Rad[91] = 30 	BaoXiang_JLBCBTBOX_Count[91] = 1
BaoXiang_JLBCBTBOX[92] = 0230	BaoXiang_JLBCBTBOX_Rad[92] = 30 	BaoXiang_JLBCBTBOX_Count[92] = 1
BaoXiang_JLBCBTBOX[93] = 0304	BaoXiang_JLBCBTBOX_Rad[93] = 30 	BaoXiang_JLBCBTBOX_Count[93] = 1
BaoXiang_JLBCBTBOX[94] = 0317	BaoXiang_JLBCBTBOX_Rad[94] = 30 	BaoXiang_JLBCBTBOX_Count[94] = 1
BaoXiang_JLBCBTBOX[95] = 0344	BaoXiang_JLBCBTBOX_Rad[95] = 30 	BaoXiang_JLBCBTBOX_Count[95] = 1
BaoXiang_JLBCBTBOX[96] = 0358	BaoXiang_JLBCBTBOX_Rad[96] = 30 	BaoXiang_JLBCBTBOX_Count[96] = 1
BaoXiang_JLBCBTBOX[97] = 0364	BaoXiang_JLBCBTBOX_Rad[97] = 30 	BaoXiang_JLBCBTBOX_Count[97] = 1
BaoXiang_JLBCBTBOX[98] = 0377	BaoXiang_JLBCBTBOX_Rad[98] = 30 	BaoXiang_JLBCBTBOX_Count[98] = 1
BaoXiang_JLBCBTBOX[99] = 0393	BaoXiang_JLBCBTBOX_Rad[99] = 30 	BaoXiang_JLBCBTBOX_Count[99] = 1
BaoXiang_JLBCBTBOX[100] = 0394	BaoXiang_JLBCBTBOX_Rad[100] = 30 	BaoXiang_JLBCBTBOX_Count[100] = 1
BaoXiang_JLBCBTBOX[101] = 0480	BaoXiang_JLBCBTBOX_Rad[101] = 30 	BaoXiang_JLBCBTBOX_Count[101] = 1
BaoXiang_JLBCBTBOX[102] = 0493	BaoXiang_JLBCBTBOX_Rad[102] = 30 	BaoXiang_JLBCBTBOX_Count[102] = 1
BaoXiang_JLBCBTBOX[103] = 0520	BaoXiang_JLBCBTBOX_Rad[103] = 30 	BaoXiang_JLBCBTBOX_Count[103] = 1
BaoXiang_JLBCBTBOX[104] = 0534	BaoXiang_JLBCBTBOX_Rad[104] = 30 	BaoXiang_JLBCBTBOX_Count[104] = 1
BaoXiang_JLBCBTBOX[105] = 0540	BaoXiang_JLBCBTBOX_Rad[105] = 30 	BaoXiang_JLBCBTBOX_Count[105] = 1
BaoXiang_JLBCBTBOX[106] = 0553	BaoXiang_JLBCBTBOX_Rad[106] = 30 	BaoXiang_JLBCBTBOX_Count[106] = 1
BaoXiang_JLBCBTBOX[107] = 0569	BaoXiang_JLBCBTBOX_Rad[107] = 30 	BaoXiang_JLBCBTBOX_Count[107] = 1
BaoXiang_JLBCBTBOX[108] = 0570	BaoXiang_JLBCBTBOX_Rad[108] = 30 	BaoXiang_JLBCBTBOX_Count[108] = 1
BaoXiang_JLBCBTBOX[109] = 0656	BaoXiang_JLBCBTBOX_Rad[109] = 30 	BaoXiang_JLBCBTBOX_Count[109] = 1
BaoXiang_JLBCBTBOX[110] = 0669	BaoXiang_JLBCBTBOX_Rad[110] = 30 	BaoXiang_JLBCBTBOX_Count[110] = 1
BaoXiang_JLBCBTBOX[111] = 0696	BaoXiang_JLBCBTBOX_Rad[111] = 30 	BaoXiang_JLBCBTBOX_Count[111] = 1
BaoXiang_JLBCBTBOX[112] = 0710	BaoXiang_JLBCBTBOX_Rad[112] = 30 	BaoXiang_JLBCBTBOX_Count[112] = 1
BaoXiang_JLBCBTBOX[113] = 0716	BaoXiang_JLBCBTBOX_Rad[113] = 30 	BaoXiang_JLBCBTBOX_Count[113] = 1
BaoXiang_JLBCBTBOX[114] = 0729	BaoXiang_JLBCBTBOX_Rad[114] = 30 	BaoXiang_JLBCBTBOX_Count[114] = 1
BaoXiang_JLBCBTBOX[115] = 0745	BaoXiang_JLBCBTBOX_Rad[115] = 30 	BaoXiang_JLBCBTBOX_Count[115] = 1
BaoXiang_JLBCBTBOX[116] = 0746	BaoXiang_JLBCBTBOX_Rad[116] = 30 	BaoXiang_JLBCBTBOX_Count[116] = 1
BaoXiang_JLBCBTBOX[117] = 3425	BaoXiang_JLBCBTBOX_Rad[117] = 1 	BaoXiang_JLBCBTBOX_Count[117] = 1
BaoXiang_JLBCBTBOX[118] = 3426	BaoXiang_JLBCBTBOX_Rad[118] = 1 	BaoXiang_JLBCBTBOX_Count[118] = 1
BaoXiang_JLBCBTBOX[119] = 3427	BaoXiang_JLBCBTBOX_Rad[119] = 1 	BaoXiang_JLBCBTBOX_Count[119] = 1
BaoXiang_JLBCBTBOX[120] = 3428	BaoXiang_JLBCBTBOX_Rad[120] = 1 	BaoXiang_JLBCBTBOX_Count[120] = 1
BaoXiang_JLBCBTBOX[121] = 3429	BaoXiang_JLBCBTBOX_Rad[121] = 1 	BaoXiang_JLBCBTBOX_Count[121] = 1
BaoXiang_JLBCBTBOX[122] = 3430	BaoXiang_JLBCBTBOX_Rad[122] = 1 	BaoXiang_JLBCBTBOX_Count[122] = 1
BaoXiang_JLBCBTBOX[123] = 3431	BaoXiang_JLBCBTBOX_Rad[123] = 1 	BaoXiang_JLBCBTBOX_Count[123] = 1
BaoXiang_JLBCBTBOX[124] = 3432	BaoXiang_JLBCBTBOX_Rad[124] = 1 	BaoXiang_JLBCBTBOX_Count[124] = 1
BaoXiang_JLBCBTBOX[125] = 3433	BaoXiang_JLBCBTBOX_Rad[125] = 1 	BaoXiang_JLBCBTBOX_Count[125] = 1
BaoXiang_JLBCBTBOX[126] = 3138	BaoXiang_JLBCBTBOX_Rad[126] = 30 	BaoXiang_JLBCBTBOX_Count[126] = 1
BaoXiang_JLBCBTBOX[127] = 3139	BaoXiang_JLBCBTBOX_Rad[127] = 30 	BaoXiang_JLBCBTBOX_Count[127] = 1
BaoXiang_JLBCBTBOX[128] = 3136	BaoXiang_JLBCBTBOX_Rad[128] = 30 	BaoXiang_JLBCBTBOX_Count[128] = 1
BaoXiang_JLBCBTBOX[129] = 3140	BaoXiang_JLBCBTBOX_Rad[129] = 30 	BaoXiang_JLBCBTBOX_Count[129] = 1
BaoXiang_JLBCBTBOX[130] = 3123	BaoXiang_JLBCBTBOX_Rad[130] = 30 	BaoXiang_JLBCBTBOX_Count[130] = 1
BaoXiang_JLBCBTBOX[131] = 3125	BaoXiang_JLBCBTBOX_Rad[131] = 30 	BaoXiang_JLBCBTBOX_Count[131] = 1
BaoXiang_JLBCBTBOX[132] = 3122	BaoXiang_JLBCBTBOX_Rad[132] = 30 	BaoXiang_JLBCBTBOX_Count[132] = 1
BaoXiang_JLBCBTBOX[133] = 3126	BaoXiang_JLBCBTBOX_Rad[133] = 30 	BaoXiang_JLBCBTBOX_Count[133] = 1
BaoXiang_JLBCBTBOX[134] = 3127	BaoXiang_JLBCBTBOX_Rad[134] = 30 	BaoXiang_JLBCBTBOX_Count[134] = 1
BaoXiang_JLBCBTBOX[135] = 3138	BaoXiang_JLBCBTBOX_Rad[135] = 30 	BaoXiang_JLBCBTBOX_Count[135] = 1
BaoXiang_JLBCBTBOX[136] = 3135	BaoXiang_JLBCBTBOX_Rad[136] = 30 	BaoXiang_JLBCBTBOX_Count[136] = 1
BaoXiang_JLBCBTBOX[137] = 3828	BaoXiang_JLBCBTBOX_Rad[137] = 25 	BaoXiang_JLBCBTBOX_Count[137] = 1
BaoXiang_JLBCBTBOX[138] = 3829	BaoXiang_JLBCBTBOX_Rad[138] = 25 	BaoXiang_JLBCBTBOX_Count[138] = 1
BaoXiang_JLBCBTBOX[139] = 3830	BaoXiang_JLBCBTBOX_Rad[139] = 25 	BaoXiang_JLBCBTBOX_Count[139] = 1
BaoXiang_JLBCBTBOX[140] = 3831	BaoXiang_JLBCBTBOX_Rad[140] = 25 	BaoXiang_JLBCBTBOX_Count[140] = 1
BaoXiang_JLBCBTBOX[141] = 3832	BaoXiang_JLBCBTBOX_Rad[141] = 25 	BaoXiang_JLBCBTBOX_Count[141] = 1
BaoXiang_JLBCBTBOX[142] = 3833	BaoXiang_JLBCBTBOX_Rad[142] = 25 	BaoXiang_JLBCBTBOX_Count[142] = 1
BaoXiang_JLBCBTBOX[143] = 3834	BaoXiang_JLBCBTBOX_Rad[143] = 25 	BaoXiang_JLBCBTBOX_Count[143] = 1
BaoXiang_JLBCBTBOX[144] = 3835	BaoXiang_JLBCBTBOX_Rad[144] = 25 	BaoXiang_JLBCBTBOX_Count[144] = 1
BaoXiang_JLBCBTBOX[145] = 3836	BaoXiang_JLBCBTBOX_Rad[145] = 25 	BaoXiang_JLBCBTBOX_Count[145] = 1
BaoXiang_JLBCBTBOX[146] = 3837	BaoXiang_JLBCBTBOX_Rad[146] = 25 	BaoXiang_JLBCBTBOX_Count[146] = 1
BaoXiang_JLBCBTBOX[147] = 3838	BaoXiang_JLBCBTBOX_Rad[147] = 25 	BaoXiang_JLBCBTBOX_Count[147] = 1
BaoXiang_JLBCBTBOX[148] = 3839	BaoXiang_JLBCBTBOX_Rad[148] = 25 	BaoXiang_JLBCBTBOX_Count[148] = 1
BaoXiang_JLBCBTBOX[149] = 3840	BaoXiang_JLBCBTBOX_Rad[149] = 25 	BaoXiang_JLBCBTBOX_Count[149] = 1
BaoXiang_JLBCBTBOX[150] = 3841	BaoXiang_JLBCBTBOX_Rad[150] = 25 	BaoXiang_JLBCBTBOX_Count[150] = 1
BaoXiang_JLBCBTBOX[151] = 3842	BaoXiang_JLBCBTBOX_Rad[151] = 25 	BaoXiang_JLBCBTBOX_Count[151] = 1
BaoXiang_JLBCBTBOX[152] = 3843	BaoXiang_JLBCBTBOX_Rad[152] = 25 	BaoXiang_JLBCBTBOX_Count[152] = 1
BaoXiang_JLBCBTBOX[153] = 0899	BaoXiang_JLBCBTBOX_Rad[153] = 1 	BaoXiang_JLBCBTBOX_Count[153] = 1
BaoXiang_JLBCBTBOX[154] = 0900	BaoXiang_JLBCBTBOX_Rad[154] = 1 	BaoXiang_JLBCBTBOX_Count[154] = 1
BaoXiang_JLBCBTBOX[155] = 0901	BaoXiang_JLBCBTBOX_Rad[155] = 1 	BaoXiang_JLBCBTBOX_Count[155] = 1
BaoXiang_JLBCBTBOX[156] = 0902	BaoXiang_JLBCBTBOX_Rad[156] = 1 	BaoXiang_JLBCBTBOX_Count[156] = 1
BaoXiang_JLBCBTBOX[157] = 0903	BaoXiang_JLBCBTBOX_Rad[157] = 1 	BaoXiang_JLBCBTBOX_Count[157] = 1
BaoXiang_JLBCBTBOX[158] = 3846	BaoXiang_JLBCBTBOX_Rad[158] = 1 	BaoXiang_JLBCBTBOX_Count[158] = 1
BaoXiang_JLBCBTBOX[159] = 3462	BaoXiang_JLBCBTBOX_Rad[159] = 20 	BaoXiang_JLBCBTBOX_Count[159] = 1
BaoXiang_JLBCBTBOX[160] = 0860	BaoXiang_JLBCBTBOX_Rad[160] = 1 	BaoXiang_JLBCBTBOX_Count[160] = 1
BaoXiang_JLBCBTBOX[161] = 0861	BaoXiang_JLBCBTBOX_Rad[161] = 1 	BaoXiang_JLBCBTBOX_Count[161] = 1
BaoXiang_JLBCBTBOX[162] = 0862	BaoXiang_JLBCBTBOX_Rad[162] = 1 	BaoXiang_JLBCBTBOX_Count[162] = 1
BaoXiang_JLBCBTBOX[163] = 0863	BaoXiang_JLBCBTBOX_Rad[163] = 1 	BaoXiang_JLBCBTBOX_Count[163] = 1
BaoXiang_JLBCBTBOX[164] = 3463	BaoXiang_JLBCBTBOX_Rad[164] = 20 	BaoXiang_JLBCBTBOX_Count[164] = 1
BaoXiang_JLBCBTBOX[165] = 3844	BaoXiang_JLBCBTBOX_Rad[165] = 10 	BaoXiang_JLBCBTBOX_Count[165] = 1
BaoXiang_JLBCBTBOX[166] = 3845	BaoXiang_JLBCBTBOX_Rad[166] = 10 	BaoXiang_JLBCBTBOX_Count[166] = 1
BaoXiang_JLBCBTBOX[167] = 0878	BaoXiang_JLBCBTBOX_Rad[167] = 1 	BaoXiang_JLBCBTBOX_Count[167] = 1
BaoXiang_JLBCBTBOX[168] = 0879	BaoXiang_JLBCBTBOX_Rad[168] = 1 	BaoXiang_JLBCBTBOX_Count[168] = 1
BaoXiang_JLBCBTBOX[169] = 0880	BaoXiang_JLBCBTBOX_Rad[169] = 1 	BaoXiang_JLBCBTBOX_Count[169] = 1
BaoXiang_JLBCBTBOX[170] = 0881	BaoXiang_JLBCBTBOX_Rad[170] = 1 	BaoXiang_JLBCBTBOX_Count[170] = 1
BaoXiang_JLBCBTBOX[171] = 0882	BaoXiang_JLBCBTBOX_Rad[171] = 1 	BaoXiang_JLBCBTBOX_Count[171] = 1
BaoXiang_JLBCBTBOX[172] = 0883	BaoXiang_JLBCBTBOX_Rad[172] = 1 	BaoXiang_JLBCBTBOX_Count[172] = 1
BaoXiang_JLBCBTBOX[173] = 0884	BaoXiang_JLBCBTBOX_Rad[173] = 1 	BaoXiang_JLBCBTBOX_Count[173] = 1
BaoXiang_JLBCBTBOX[174] = 0885	BaoXiang_JLBCBTBOX_Rad[174] = 1 	BaoXiang_JLBCBTBOX_Count[174] = 1
BaoXiang_JLBCBTBOX[175] = 0887	BaoXiang_JLBCBTBOX_Rad[175] = 1 	BaoXiang_JLBCBTBOX_Count[175] = 1
BaoXiang_JLBCBTBOX[176] = 0893	BaoXiang_JLBCBTBOX_Rad[176] = 5 	BaoXiang_JLBCBTBOX_Count[176] = 1
BaoXiang_JLBCBTBOX[177] = 0894	BaoXiang_JLBCBTBOX_Rad[177] = 5 	BaoXiang_JLBCBTBOX_Count[177] = 1
BaoXiang_JLBCBTBOX[178] = 0895	BaoXiang_JLBCBTBOX_Rad[178] = 5 	BaoXiang_JLBCBTBOX_Count[178] = 1
BaoXiang_JLBCBTBOX[179] = 0896	BaoXiang_JLBCBTBOX_Rad[179] = 5 	BaoXiang_JLBCBTBOX_Count[179] = 1
BaoXiang_JLBCBTBOX[180] = 0897	BaoXiang_JLBCBTBOX_Rad[180] = 5 	BaoXiang_JLBCBTBOX_Count[180] = 1
BaoXiang_JLBCBTBOX[181] = 0453	BaoXiang_JLBCBTBOX_Rad[181] = 100 	BaoXiang_JLBCBTBOX_Count[181] = 1
BaoXiang_JLBCBTBOX[182] = 0455	BaoXiang_JLBCBTBOX_Rad[182] = 100 	BaoXiang_JLBCBTBOX_Count[182] = 1
BaoXiang_JLBCBTBOX[183] = 0938	BaoXiang_JLBCBTBOX_Rad[183] = 100 	BaoXiang_JLBCBTBOX_Count[183] = 1

-- gem of soul
BaoXiang_JLBCBTBOX[184] = 1012	BaoXiang_JLBCBTBOX_Rad[184] = 1 	BaoXiang_JLBCBTBOX_Count[184] = 1
-- fruits
BaoXiang_JLBCBTBOX[185] = 0222	BaoXiang_JLBCBTBOX_Rad[185] = 5 	BaoXiang_JLBCBTBOX_Count[185] = 1
BaoXiang_JLBCBTBOX[186] = 0223	BaoXiang_JLBCBTBOX_Rad[186] = 5 	BaoXiang_JLBCBTBOX_Count[186] = 1
BaoXiang_JLBCBTBOX[187] = 0224	BaoXiang_JLBCBTBOX_Rad[187] = 5 	BaoXiang_JLBCBTBOX_Count[187] = 1
BaoXiang_JLBCBTBOX[188] = 0225	BaoXiang_JLBCBTBOX_Rad[188] = 5 	BaoXiang_JLBCBTBOX_Count[188] = 1
BaoXiang_JLBCBTBOX[189] = 0226	BaoXiang_JLBCBTBOX_Rad[189] = 5 	BaoXiang_JLBCBTBOX_Count[189] = 1


BaoXiang_JLBCBTBOX_Mxcount = 189