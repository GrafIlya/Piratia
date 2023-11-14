print('Loading pve.lua')

function Dead_Punish ( dead , atk )
	local Role_ID = GetRoleID(dead)
	BBBB[ Role_ID ] = 0
	local map_name = GetChaMapName ( dead )
	if map_name == "leiting2" or map_name == "binglang2" or map_name == "shalan2" or map_name == "guildwar" or map_name == "guildwar2" then
		return
	end
	local map_name = GetChaMapName ( dead )
	if map_name == "garner2" then
		SetCharaAttr(0, dead, ATTR_SP)
		return
	end
	dead = TurnToCha ( dead ) 
	local lv = GetChaAttr( dead, ATTR_LV ) 
	local check_pirate=CheckItem_pirate(dead)
	local check_death=CheckItem_Death(dead)
	local Time = os.date("%H")
	local TimeNum = tonumber(Time)
	if lv <= 10 then
		return
	end
	if lv >= 70 and check_pirate == 1 then
		if TimeNum<=6 or TimeNum >=18 then
			SystemNotice (dead , "Received blessing from moonlight. Death penalty will be removed" ) 
			return
		end
	end
	if lv >= 75 and check_death ==1 then
		if TimeNum<=6 or TimeNum >=18 then
			SystemNotice (dead , "Blessed by Death. No death penalty upon character death" ) 
			return
		end
	end
	local exp_red 
	local exp = Exp(dead) 
	local nlexp = GetChaAttrI ( dead , ATTR_NLEXP ) 
	local clexp = GetChaAttrI ( dead , ATTR_CLEXP ) 
	if  exp <= clexp then 
		exp_red = 0 
	else
		exp_red = math.min ( math.floor ( ( nlexp - clexp ) * 0.02 ) , math.max ( exp - clexp , 0 ) ) 
	end
	SetCharaAttr(0, dead, ATTR_SP) 
	local i1 = CheckBagItem( dead,3846 )
	local i2 = CheckBagItem( dead,3047 )
	local i3 = CheckBagItem( dead,5609 )
	if map_name == "secretgarden" or map_name == "teampk" then
	SetCharaAttr(0, dead, ATTR_SP)
		return
	end
	local i= CheckBagItem( dead, 2954 )
	if i==1 then
		local Dead_BK = GetChaItem2 ( dead , 2 , 2954 )
		local DeadPoint=GetItemAttr ( Dead_BK , ITEMATTR_VAL_STR)
		local DeadPoint=DeadPoint+1
		SetItemAttr( Dead_BK , ITEMATTR_VAL_STR , DeadPoint )
		local DeadPoint1=GetItemAttr ( Dead_BK , ITEMATTR_VAL_STR)
		if DeadPoint>=100 then
		end
	end
	if i1 <= 0 and i2 <= 0 and  i3 <= 0 then
		exp = Exp(dead) - exp_red 
		if Lv ( dead ) >= 80 then 
			exp_red_80 = exp_red * 50 
			SystemNotice (dead , "Death penalty. EXP lost: "..exp_red_80 ) 
		else 
			SystemNotice (dead , "Death penalty. EXP lost: "..exp_red ) 
		end 
		SetChaAttrI( dead , ATTR_CEXP , exp )
		if lv > 20 then
			Dead_Punish_ItemURE ( dead )
		end
	elseif i1~=0 and i2==0 and  i3==0 then
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp )
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i2~=0 and  i1==0 and i3==0  then
		local j2 = TakeItem( dead,0,3047,1)
		if j2 == 0  then
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp )
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i3~=0 and i1==0 and  i2==0  then
		local j2 = TakeItem( dead,0,5609,1)
		if j2 == 0  then
			SystemNotice ( dead , "Stand-in Token delection failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp )
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Stand-in Token replace death penalty" )
		end
	elseif i1~=0 and i2~=0 and  i3==0 then
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp )
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i2~=0 and  i3~=0 and i1==0  then
		local j2 = TakeItem( dead,0,3047,1)
		if j2 == 0  then
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp )
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i1~=0 and i3~=0 and  i2==0 then
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp )
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i1~=0 and i2~=0 and  i3~=0 then
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost: "..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp )
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	end
end

function Dead_Punish_ItemURE ( role )
	local Player = IsPlayer ( role )
	local boat = ChaIsBoat ( role )
	local Punish = 0.05
	Dead_Punish_Item_Num = 5
	local Dead_Punish_Item_WZ = { }
	Dead_Punish_Item_WZ [0] = 0
	Dead_Punish_Item_WZ [1] = 2
	Dead_Punish_Item_WZ [2] = 3
	Dead_Punish_Item_WZ [3] = 4
	Dead_Punish_Item_WZ [4] = 6
	Dead_Punish_Item_WZ [5] = 9
	local Dead_Punish_Item = { }
	Dead_Punish_Item [0] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [0] )
	Dead_Punish_Item [1] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [1] )
	Dead_Punish_Item [2] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [2] )
	Dead_Punish_Item [3] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [3] )
	Dead_Punish_Item [4] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [4] )
	Dead_Punish_Item [5] = GetChaItem ( role , 1 , Dead_Punish_Item_WZ [5] )
	if Player == 1 and boat == 0 then
		local Item_URE = 0
		local Item_MAXURE = 0
		local Take_Num = 0
		local i = 0
		local j = 0
		local k = 0
		for j = 0 , Dead_Punish_Item_Num , 1 do
			if Dead_Punish_Item[j] ~= 0 and Dead_Punish_Item[j] ~= nil then
				local ItemType_Check = Check_Repair_ItemType ( Dead_Punish_Item[j] )
				if ItemType_Check == 1 then
					Item_URE = GetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_URE )
					Item_MAXURE = GetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_MAXURE )
					Take_Num = math.floor ( Item_MAXURE * Punish )
					if Item_URE >= 50 then
						k = 1
					end
					Item_URE = Item_URE - Take_Num
					if Item_URE < 50 then
						Item_URE = 49
					end
					i = SetItemAttr ( Dead_Punish_Item[j] , ITEMATTR_URE , Item_URE )
					if i == 0 then
						LG("Item_URE", "Normal death deducts attribute failed "..j)
					end
					if k == 1 and Item_URE == 49 then
						SetChaEquipValid ( role , Dead_Punish_Item_WZ [j] , 0 )
					end
				end
				
			end
		end
		SystemNotice ( role , "Death: 5%% penalty off durability of equipment" )
	end
end