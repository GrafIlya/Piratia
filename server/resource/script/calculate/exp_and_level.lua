print( "Loading Exp_And_Level.lua" )
--此处放置经验值和级别有关的计算

InTeamGetExp_RAID = 1

--创建工会的物品检测
function AskGuildItem(role,Guild_type)
	local gold = GetChaAttr(role,ATTR_GD)
	local fame = GetChaAttr(role,ATTR_FAME) 
	local attr_guild = HasGuild ( role ) 
	if attr_guild ~= 0 then 
		HelpInfo(role,0,"Already in a guild")
		--SystemNotice(role,0,"已有所属工会")
		return 0 
	end 
	local Lv = Lv ( role )
	if Lv < 40 then
		SystemNotice ( role , "Have not reached Lv 40. Unable to create" )
		return 0
	end

	if Guild_type == 1 then						--判定海盗工会
		if Guild2_ItemMax > 0 then
			for i = 1 , Guild2_ItemMax , 1 do
				local K = Check_BagItem(role,Guild2_item[i],Guild2_count[i])
				if K == 0 then
					HelpInfo(role,0,"Items insufficient. Unable to create")
					--SystemNotice(role,0,"道具不足无法创建")
					return 0
				end
			end
		end

		if gold < Guild2_Gold then
			HelpInfo(role,0,"Insufficient gold. Unable to create")
			--SystemNotice(role,0,"金钱不足无法创建")
			return 0
		end
		if fame < Guild2_fame then
			HelpInfo(role,0,"Insufficient reputation to create")
			--SystemNotice(role,0,"声望不足无法创建")
			return 0
		end
	elseif Guild_type == 0 then					--判定海军工会
		if Guild1_ItemMax > 0 then
			for i = 1 , Guild1_ItemMax , 1 do
				local K = Check_BagItem(role,Guild1_item[i],Guild1_count[i])
				if K == 0 then
					HelpInfo(role,0,"Items insufficient. Unable to create")
					--SystemNotice(role,0,"道具不足无法创建")
					return 0
				end
			end
		end
		if gold < Guild1_Gold then
			HelpInfo(role,0,"Insufficient gold. Unable to create")
			--SystemNotice(role,0,"金钱不足无法创建")
			return 0
		end
		if fame < Guild1_fame then
			HelpInfo(role,0,"Insufficient reputation to create")
			--SystemNotice(role,0,"声望不足无法创建")
			return 0
		end
	else
		--LG("checkguild","工会类型错误  Guild_type = ",Guild_type)
	end
	return 1
end 

function Check_BagItem(role,a,b)		--检查背包数量是否足够
	local a = CheckBagItem ( role , a ) 
	if a>= b then 
		return 1 
	else 
		return 0 
	end 
end 
		


--删除创建工会所需物品
function DeductGuildItem(role,Guild_type)
	local gold = GetChaAttr(role,ATTR_GD)
	local fame = GetChaAttr(role,ATTR_FAME) 
	local attr_guild = HasGuild ( role )  
--	if attr_guild ~= 0 then 
--		HelpInfo(role,0,"已有所属工会") 
		--SystemNotice(role,0,"已有所属工会") 
--		return 0 
--	end 

	if Guild_type == 1 then						--判定海盗工会
--		if Guild2_ItemMax > 0 then
--			for i = 1 ,Guild2_ItemMax,1 do
--				local K = DelBagItem(role,Guild2_item[i],Guild2_count[i])
--			end
--		end
		DelBagItem(role,1780,1)	
		gold = gold - Guild2_Gold
		fame = fame - Guild2_fame
		SetAttrChangeFlag ( role )

		SetChaAttr(role,ATTR_GD,gold)
		SetChaAttr(role,ATTR_FAME,fame)

		SyncChar( role, 4 )
	
	elseif Guild_type == 0	then					--判定海军工会
--		if Guild1_ItemMax > 0 then
--			for i = 1 ,Guild1_ItemMax,1 do
--				local K = DelBagItem(role,Guild1_item[i],Guild1_count[i])
--			end
--		end
		DelBagItem(role,1780,1)	
		gold = gold - Guild1_Gold
		fame = fame - Guild1_fame
		SetAttrChangeFlag ( role )

		SetChaAttr(role,ATTR_GD,gold)
		SetChaAttr(role,ATTR_FAME,fame)

		SyncChar( role, 4 )
	else
		--LG("checkguild","工会类型错误  Guild_type = ",Guild_type)
	end

end
	

function AskJoinGuild ( role , guild_type ) 					-- 申请加入工会判定   工会类型 0－海军，1－海盗
	local attr_guild = HasGuild ( role )  
	if attr_guild ~= 0 then 
		HelpInfo(role,0,"Already in a guild") 
		--SystemNotice(role,0,"已有所属工会") 
		return 0 
	end 
--	local fame = GetChaAttr ( role , ATTR_FAME ) 
--	if guild_type == 0 then 
--		if fame < JOINGUILD_NAVY_FAME then 
--			HelpInfo(role,0,"海军名声不足") 
--			--SystemNotice(role,0,"海军名声不足") 
--			return 0 
--		end 
--	elseif guild_type == 1 then 
--		if fame > JOINGUILD_PIRATE_FAME then 
--			HelpInfo(role,0,"海盗名声不足") 
--			--SystemNotice(role,0,"海盗名声不足") 
--			return 0 
--		end 
--	end 
	return 1 
end 

			



--经验分配(包含组队经验分配)
--当有角色死亡时被调用
function GetExp_New(dead , atk  ) 
	if ValidCha(atk) == 0  then 
		LG ( "exp_atker=NIL" , "function GetExp_New : atker = nil " ) 
		return 
	end 
	--SystemNotice ( atk , "进入GetExp_New")

	--LuaPrint("Enter function GetExp() --[[经验值获得公式1、正常杀怪 2、人物被怪物杀死 3、人物正常pk死亡 4、无经验奖惩]]--") 
	local a = Check_Combat_Mod(dead , atk ) 
	if a==1 then 
	--LG("exp" , " enter  pkm mod" ) 
	GetExp_PKM( dead , atk ) --[[player kill monster]]--
	elseif a==2 then 
	--LG("exp" , " enter  mkp mod" ) 
	GetExp_MKP(dead , atk) --[[monster kill player]]--
	elseif a==3 then 
	--LG("exp" , " enter  pkp mod" ) 
	GetExp_PKP(dead , atk) --[[player kill player]]--
	elseif a==4 then 
	--LG("exp" , " enter  mkm mod" ) 
	GetExp_Noexp(dead , atk) --[[monster kill monster]]--
	else 
	--LuaPrint("无法判定经验获得模式".."\n") return 
	end 
end 









function Check_Combat_Mod(dead , atk) --[[判定经验奖惩方式]]-- 
	--LuaPrint("Enter function Check_Combat_Mod () --[[判定经验奖惩方式]]-- ") 
	local rolemod_atker = IsPlayer(atk) 
	--LG("exp" , " atker role = " ,  rolemod_atker ) 
	local rolemod_defer = IsPlayer(dead)  --检查角色种类：0、怪物， 1、玩家
	--LG("exp" , " defer role = " ,  rolemod_defer ) 
	if (rolemod_atker==0) and (rolemod_defer==0) then 
		return 4 
	elseif rolemod_atker==0 and rolemod_defer==1 then 
		return 2 
	elseif rolemod_atker==1 and rolemod_defer==0 then 
		return 1 
	elseif rolemod_atker==1 and rolemod_defer==1 then 
		return 3 
	else 
		--LuaPrint("错误的角色类型值".."\n") 
		return 
	end 
	--LuaPrint("Out function Check_Combat_Mod () --[[判定经验奖惩方式]]-- ") 
end 




function GetExp_PKM( dead , atk  ) --[[player kill monster 经验值获得公式 所得exp＝exp(d)/math.floor(|lv(a)-lv(b)|*0.1+1)]]--
--	LG ( "exp" , " enter getexp " ) 
	--SystemNotice ( atk , "进入GetExp_PKM")
--	local EXP_RAID_STATE = 1
--	local StateLv = GetChaStateLv ( atk , STATE_SBJYGZ )
	
--	if StateLv >= 0 and StateLv <= 10 then
--			EXP_RAID_STATE = StateLv + 1
--	end

	local dead_lv = GetChaAttrI( dead , ATTR_LV ) --获得死者的等级   
	local dead_exp = GetChaAttrI( dead , ATTR_CEXP ) * EXP_RAID
	LG("exp" , "deadlv = " , dead_lv ) 
	LG("exp" , "dead_exp = " , dead_exp ) 
	local k = {} 
	local kdmg = {} 
	local k_exp = {} 

	k[0] , kdmg[0] = GetChaHarmByNo ( dead , 0 ) 
--	if ValidCha ( k[0] ) == 0 then 
--		SystemNotice ( atk , "伤害列表首位为空" ) 
--	end 
	--SystemNotice ( atk , "攻击伤害排位0号") 
	--SystemNotice ( atk , "攻击伤害为"..kdmg[0]) 

	k[1] , kdmg[1] = GetChaHarmByNo ( dead , 1 ) 
--	if ValidCha ( k[1] ) == 0 then 
--		SystemNotice ( atk , "伤害列表2位为空" ) 
--	end 
	--SystemNotice ( atk , "攻击伤害排位1号") 
	--SystemNotice ( atk , "攻击伤害为"..kdmg[1]) 

	k[2] , kdmg[2] = GetChaHarmByNo ( dead , 2 ) 
--	if ValidCha ( k[2] ) == 0 then 
--		SystemNotice ( atk , "伤害列表3位为空" ) 
--	end 
	--SystemNotice ( atk , "攻击伤害排位2号") 
	--SystemNotice ( atk , "攻击伤害为"..kdmg[2]) 

	k[3] , kdmg[3] = GetChaHarmByNo ( dead , 3 ) 
--	if ValidCha ( k[3] ) == 0 then 
--		SystemNotice ( atk , "伤害列表4位为空" ) 
--	end 
	--SystemNotice ( atk , "攻击伤害排位3号") 
	--SystemNotice ( atk , "攻击伤害为"..kdmg[3]) 

	k[4] , kdmg[4] = GetChaHarmByNo ( dead , 4 ) 
--	if ValidCha ( k[4] ) == 0 then 
--		SystemNotice ( atk , "伤害列表5位为空" ) 
--	end 
	--SystemNotice ( atk , "攻击伤害排位4号") 
	--SystemNotice ( atk , "攻击伤害为"..kdmg[4]) 
	local first_atker = GetFirstAtker ( dead ) 
	
	local Gen_dmg = 0 

	for i = 0 , 4 , 1 do 
		if k[i] ~= 0 then 
			Gen_dmg = Gen_dmg + kdmg[i] 
			--SystemNotice ( atk , "攻击伤害指针不为0的排位"..i) 
			--SystemNotice ( atk , "攻击伤害为"..kdmg[i]) 
		end 
	end 
	--SystemNotice ( atk , "总攻击伤害为"..Gen_dmg) 
	for i = 0 , 4 , 1 do 
		k_exp[i] = 0 

		if ValidCha( k[i] )== 1 then 
			if kdmg[i] > 0 then 
				if k[i] == first_atker then 
					k_exp[i] = dead_exp * ( 0.7 * kdmg[i] / Gen_dmg + 0.3 )		--第一位攻击者优先获得30％的怪物总经验
				else
					k_exp[i] =  dead_exp * 0.7 * kdmg[i] / Gen_dmg 
				end
				--SystemNotice ( atk , "攻击伤害排位"..i) 
				--SystemNotice ( atk , "分配到exp"..k_exp[i]) 
				ShareTeamExp ( dead , k[i] , k_exp[i] ,atk ) 
			end 
		end 
	end 
	local item_host = 0 
	local exp_max = k_exp[0] 
	--SystemNotice ( atk , "道具初始归属排位"..0) 
	for i = 1 , 4 , 1 do 
		--SystemNotice ( atk , "道具归属判定"..i) 
		--SystemNotice ( atk , "经验份额"..k_exp[i])

		if k_exp [i] > exp_max  then 
			exp_max = k_exp[i] 
			item_host = i 
			--SystemNotice ( atk , "道具更改归属排位"..i) 
		end 
	end 
	if ChaIsBoat (k[item_host] ) == 1 then 

		local ship_lv = GetChaAttr ( k[item_host] , ATTR_LV ) 
		local shipowner_lv  = GetChaAttr ( TurnToCha ( k[item_host] ) , ATTR_LV )  
		local ship_exp = GetChaAttr ( k[item_host] , ATTR_CEXP ) 
		local ship_expadd = math.floor ( math.min ( 7 , ( dead_lv / 10 + 2 ) ) ) 
		local lv_limit = math.min ( ship_lv , shipowner_lv ) - 10 
		if dead_lv >= lv_limit then 
			ship_exp = ship_exp + ship_expadd 
			SetCharaAttr (  ship_exp , k[item_host] ,ATTR_CEXP ) 
--			SystemNotice ( k[item_host] , "增加船只熟练"..ship_expadd ) 

		end 
	end 
	SetItemHost ( dead , k[item_host] ) 

end 


function ValidCha(ter)
  if ter==nil or ter==0 then 
	return 0 
  end
  return 1
end

function ShareTeamExp ( dead , team_atker , dead_exp , The_Killer) 
	local cha_name1100 = GetChaDefaultName (team_atker )	
	local star111=GetChaAttr (  team_atker , ATTR_CEXP )----------当前等级经验
	LG("star_exp" , "Player"..cha_name1100.."Current Experience is"..star111.."Starts ShareTeamExp" ) 
	local atker_role = ChaIsBoat ( team_atker ) 
	local monster_location = IsChaInLand ( dead ) 
	if atker_role == 1 and monster_location == 1 then 
		dead_exp = math.floor ( dead_exp / 5 + 1 ) 
	end 

	--SystemNotice ( team_atker , "进入ShareTeamExp")

	local dead_lv = GetChaAttrI( dead , ATTR_LV )			--获得死者的等级   
	--local team_atker = TurnToCha ( team_atker )				--转成人指针
	local t = {} 
	t[0] = team_atker  
	if ValidCha (team_atker) == 0 then 
		LG ( "luascript_err" , "function ShareTeamExp : party experience source as null" ) 
		return 
	end 
	t[1] = GetTeamCha(team_atker, 0 )  
	t[2] = GetTeamCha(team_atker, 1 )   
	t[3] = GetTeamCha(team_atker, 2 )    
	t[4] = GetTeamCha(team_atker, 3 )
    
    --SystemNotice ( team_atker , "aaaa")
--	LG("harm", "t[0] = ", t[0]," t[1] = ", t[1], "t[2] = ", t[2])
--	LG("harm", "\n")
    --local notice = "t[1]="..t[1].." t[2]="..t[2].." t[3]="..t[3].." t[4]="..t[4]
    ----SystemNotice ( team_atker , notice)
    --SystemNotice ( team_atker , "bbbb")
	
    
	local count = 0 
	local NewPlayer_CanGet = 0
	local NewPlayer_Lv = 0
	local NewPlayer_Lv_dif = -100
	local Check_Killer = 0
	if t[0] == The_Killer then
		Check_Killer = 1
	end
	for i = 0 , 4 , 1 do	
		if ValidCha( t[i] )== 1  then					--被加入组队经验分配的角色必须存在，且对队伍经验的加成和分享也仅由有效成员数起作用
			--SystemNotice(team_atker, "开始调用CheckExpShare")
			a = CheckExpShare ( t[i] , team_atker ) 
			--SystemNotice(team_atker, "结束调用CheckExpShare, 返回值="..a)
			if a == 1 then 
				count = count + 1 
				NewPlayer_Lv = Lv( TurnToCha(t[i]) )
				NewPlayer_Lv_dif = dead_lv - NewPlayer_Lv
				if NewPlayer_Lv <=30 and NewPlayer_Lv >= 10 and NewPlayer_Lv_dif >= -5 then
					NewPlayer_CanGet = NewPlayer_CanGet + 1
				end
			end 
		end 
        end 
	if count == 0 then 
		LG ("luascript_err" , "function ShareTeamExp : Member total count as 0 " )
		return 
	end 
	local TeamExp_Increas = 0.25 * TeamExp_RAID

	--SystemNotice ( team_atker , "被计入经验共享队员数count="..count)
	LG("exp" , "deadlv = " , dead_lv ) 
	LG("exp" , "dead_exp = " , dead_exp ) 
	LG("exp" , "teamer_count = " , count ) 
-------------------------------------------------------------------------------------------------------
-------------------------------------------------------------------------------------------------------
	local exp_add = math.floor( dead_exp * ( 1 + (count -1 )* TeamExp_Increas ) ) --总经验
	local exp_increase = math.floor ( dead_exp * (count -1 )* TeamExp_Increas ) --附加经验

---BB调整

	LG("exp" , "exp_add = " , exp_add ) 

	if count >=2 then
		exp_add = exp_add * InTeamGetExp_RAID
	end

	local exp_up

    --SystemNotice ( team_atker , "开始为队员分配经验")
	for i = 0 , 4 , 1 do	
		if ValidCha(t[i])==1 then			--角色不为空
			local a = 1							--初始化角色在开始时是否分配经验的监测系数
			local b = 1							--初始化角色在开始时分配经验的倍数系数
			LG("exp" , "loop = " , i ) 

			if i >= 1 then 
--				t[i] = TurnToCha ( t[i] )			            --转成人指针
				a = CheckExpShare ( t[i] , team_atker ) 		--经验分配检测 
				LG("exp" , "experience distribution test a =  " , a ) 
				exp_up = math.max (1,  math.floor ( exp_add/count ) )  * a 
				LG("exp" , "exp_up1  =  " , exp_up ) 
			else 
				exp_up = math.max ( 1, math.floor ( exp_add/count ) )  
				LG("exp" , "exp_up1  =  " , exp_up ) 
				--对直接杀怪者做特殊处理 
			end 

			t_lv = GetChaAttrI ( TurnToCha(t[i]) , ATTR_LV ) 

			lv_dis =  t_lv - dead_lv 	--与怪物等级差对经验获取倍数的判断
			LG ( "exp" , " t_lv = " , t_lv , "  dead_lv = " , dead_lv , "  lv_dis = " , lv_dis ) 
			if lv_dis >= 4 then 
				b = math.min ( 10 , 1 + ( math.abs ( lv_dis - 4 ) * 0.4 ) )  --与怪物等级差距过大，无法获得全额经验
			elseif lv_dis <= -1 * 10 then 
				b = math.min ( 4 , 1 + math.abs ( lv_dis - 10)  * 0.1 )      --与怪物等级差距过大，无法获得全额经验 
			end 
			LG ( "exp" , "exp_up2 =  " , exp_up , " b = " , b , " a = ", a ) 

			exp_up = math.floor ( math.max ( 1 , exp_up / b ) ) * a 

			LG ( "exp" , "exp_up3 =  " , exp_up) 
			
			if count >=3 and NewPlayer_CanGet <= 0 and Check_Killer == 1 then				---判断获得组队贡献点数
				if lv_dis <=3 then
					Add_RYZ_TeamPoint ( TurnToCha(t[i]) , count , 1)
				end
			end
			if t_lv >= 50 and NewPlayer_CanGet > 0 and Check_Killer == 1 then
				Add_RYZ_TeamPoint ( TurnToCha(t[i]) , 6 , NewPlayer_CanGet)
			end

			exp = GetChaAttrI ( TurnToCha(t[i]) , ATTR_CEXP ) 
			LG("exp" , "exp_original = " , exp ) 
			local EXP_RAID_STATE = 1
			local StateLv = GetChaStateLv ( t[i] , STATE_SBJYGZ )
	
	---------------------------------------------------------------------08商品调整对相应statelv进行调整kokora-------------------------------------------------------------
			if StateLv > 0 and StateLv <= 10 then
				if StateLv == 1 then
					EXP_RAID_STATE = StateLv + 1
				end
				if StateLv == 2 then
					EXP_RAID_STATE = 2
				end
				if StateLv == 3	then
					EXP_RAID_STATE = 2.5
				end
				if StateLv == 4	then
					EXP_RAID_STATE = 3
				end
				if StateLv == 5	then----------------------------升级推进器------Amon
					EXP_RAID_STATE = 5---------------------半小时5倍经验
				end
				if StateLv == 6	then----------------------------超级推进器------Amon
					EXP_RAID_STATE = 10---------------------15分钟10倍经验
				end

				if StateLv == 7	then----------------------------大闸蟹--------kokora
					EXP_RAID_STATE = 20------------------2分钟20倍经验
				end
			end
			
			if StateLv > 1 then
				local CheckLucky = 0
				CheckLucky = CheckLuckyFinish ( StateLv )
				if CheckLucky == 1 then
					EXP_RAID_STATE = EXP_RAID_STATE * 2
					SystemNotice ( TurnToCha(t[i]) , "Lucky Strike, obtains increased experience gained" )
				end
				if CheckLucky == 2 then
					EXP_RAID_STATE = 10
					SystemNotice ( TurnToCha(t[i]) , "Super Lucky Strike! Obtained 10 times EXP" )
				end
			end

			if exp_up == 0 then 
				LG ( "exp" , "No experience growth" ) 
				return 
			end
			
			exp_up = exp_up * EXP_RAID_STATE
			

---------------------------------------精灵加经验状态判断
			--local Check_star = {}
			--	Check_star[0] = t[i]  
			--	Check_star[1] = GetTeamCha( t[i] , 0 )  
			--	Check_star[2] = GetTeamCha( t[i] , 1 )   
			--	Check_star[3] = GetTeamCha( t[i] , 2 )    
			--	Check_star[4] = GetTeamCha( t[i] , 3 )
			--for m = 0 , 4 , 1 do	
			--	if ValidCha( Check_star[m] )== 1  then					--被加入组队经验分配的角色必须存在
					local Item_bg = GetChaItem ( t[i] , 2 , 1  ) --取角色背包第二栏的指针
					local Get_Item_Type = GetItemType ( Item_bg ) --调用程序接口获得Item道具类型
					if Get_Item_Type==59 then --------判断是否为精灵
						local  Item_ID = GetItemID ( Item_bg )	--取ID
						local str = GetItemAttr( Item_bg ,ITEMATTR_VAL_STR )			--力量 
						local con = GetItemAttr( Item_bg ,ITEMATTR_VAL_CON )		 ---体质 
						local agi = GetItemAttr( Item_bg ,ITEMATTR_VAL_AGI )			--敏捷 
						local dex = GetItemAttr( Item_bg ,ITEMATTR_VAL_DEX )		 --专注 
						local sta = GetItemAttr( Item_bg ,ITEMATTR_VAL_STA )			 --精神 
						local URE = GetItemAttr( Item_bg ,ITEMATTR_URE )			--体力 
						local MAXURE = GetItemAttr( Item_bg ,ITEMATTR_MAXURE )		 --最大体力
						local lv_JL = str + con + agi + dex + sta	----一个精灵的等级
						local Num_JL = GetItemForgeParam ( Item_bg , 1 )
						local Part1 = GetNum_Part1 ( Num_JL )	--Get Num Part 1 到 Part 7
						local Part2 = GetNum_Part2 ( Num_JL )	
						local Part3 = GetNum_Part3 ( Num_JL )
						local StateLv1 = GetChaStateLv (t[i] , STATE_JLFT7 )
						local StateLv2 = GetChaStateLv (t[i] , STATE_JLFT8 )
						local flag=0
						if Item_ID==237 and StateLv1~=0 then
							flag=1
						end
						if Item_ID==681 and StateLv2~=0 then
							flag=1
						end
						if flag==1  then ----有id为237或是681号的精灵并且精灵附体技能存在
							--if StateLv1 == 1 or StateLv2 == 1 then ---初级
							--	exp_up = exp_up*(0.005*lv_JL*0.1+1)
							--end
							--if StateLv1 == 2 or StateLv2 == 2 then ---中级
							--	exp_up = exp_up*(0.0125*lv_JL*0.1+1)
							--end
							--if StateLv1 == 3 or StateLv2 == 3 then ---高级
							--	exp_up = exp_up*(0.025*lv_JL*0.1+1)
							--end
							if StateLv1 ~= 0 or StateLv2 ~= 0 then 
								exp_up = exp_up*(lv_JL*0.02+1)
							end
						--	URE=URE-4500
						end
						SetItemAttr ( Item_bg , ITEMATTR_URE , URE ) 	
					end
			--	end
			--end
-------------------------------------------
-------------------------------------------
			local Check = {}
				Check[0] = t[i]  
				Check[1] = GetTeamCha( t[i] , 0 )  
				Check[2] = GetTeamCha( t[i] , 1 )   
				Check[3] = GetTeamCha( t[i] , 2 )    
				Check[4] = GetTeamCha( t[i] , 3 )
	
			for j = 0 , 4 , 1 do	
				if ValidCha( Check[j] )== 1  then					--被加入组队经验分配的角色必须存在
					local star = IsTeamLeader( Check[j] )
					if	star==1 then -------------判断队长			
						local StateLv = GetChaStateLv ( Check[j] , STATE_ZDSBJYGZ )
						local	Isshare = CheckExpShare ( t[i] , Check[j])
						--SystemNotice ( TurnToCha(t[i]) , "Isshare" )
						if StateLv == 1 and Isshare == 1 then
							exp_up = 1.5*exp_up
						end
					end
				end
			end


----------------------------------------------
----------------------------------------------圣战打精灵草随机属性
     --Notice("come here")
     local map_name_atk = GetChaMapName ( The_Killer )
     local map_name_def = GetChaMapName ( dead )
     if map_name_atk == "guildwar" or map_name_def == "guildwar" then
       local normal_monster =  GetChaID(dead)
	  --Notice("normal_monster=="..normal_monster)
       if normal_monster == 220 then  ---紫色
	   --AddState ( The_Killer , The_Killer , STATE_JRQKL , 10 , 180 )
	   AddState ( The_Killer , The_Killer , STATE_HFZQ , 10 , 10 )
       end
       if normal_monster == 219 then  -----蓝色
           AddState ( The_Killer , The_Killer , STATE_QINGZ , 10 , 300 )
       end
       if normal_monster == 217 then  -----红色
           AddState ( The_Killer , The_Killer , STATE_JRQKL , 10 , 180 )
       end
       if normal_monster == 218 then -----黄色
           AddState ( The_Killer , The_Killer , STATE_YS , 10 , 300 )
       end
      elseif map_name_atk == "guildwar2" or map_name_def == "guildwar2" then
       local normal_monster =  GetChaID(dead)
	  --Notice("normal_monster=="..normal_monster)
       if normal_monster == 220 then  ---紫色
	   --AddState ( The_Killer , The_Killer , STATE_JRQKL , 10 , 180 )
	   AddState ( The_Killer , The_Killer , STATE_HFZQ , 10 , 10 )
       end
       if normal_monster == 219 then  -----蓝色
           AddState ( The_Killer , The_Killer , STATE_QINGZ , 10 , 300 )
       end
       if normal_monster == 217 then  -----红色
           AddState ( The_Killer , The_Killer , STATE_JRQKL , 10 , 180 )
       end
       if normal_monster == 218 then -----黄色
           AddState ( The_Killer , The_Killer , STATE_YS , 10 , 300 )
       end
     end


----------------------------------------
-----------------------------------------团队之星处理
		local expGetNow = exp_up		--当前角色正常打怪可可获得的经验
		local expCanGive = 0
		t[i] = TurnToCha ( t[i]  )-- 海洋处理
		local ptnItem = GetEquipItemP( t[i] , 8)--取到道具指针	pointer		
		local IdItem = GetItemID ( ptnItem )	
		local lvPerson = GetChaAttr(t[i] , ATTR_LV)
		--Notice ( "进行到这里" )
		if IdItem==1034 and lvPerson < 41 then
			local expItemNow = GetItemAttr( ptnItem , ITEMATTR_URE)*10   --100初始值
			local expItemMax = GetItemAttr ( ptnItem , ITEMATTR_MAXURE)*10
			local retIsInTeam = IsInTeam(t[i] )
			if retIsInTeam ~= LUA_TRUE then			--触发石头经验储存机制
				expItemNow = expItemNow + expGetNow
				if expItemNow >= expItemMax then
					expItemNow = expItemMax
				end
			else						--组队了
				if HasTeammate(t[i] ,0, 5) == LUA_TRUE then---没有比自己小5级的队友
					local ptnLowLvPlayer = returnLowLVPlayer( t[i], t[0], t[1], t[2], t[3], t[4]) --返回队伍中比自己等级小5的人物指
					if ValidCha(ptnLowLvPlayer) == 1 then      --人没死的处理
					
						local expCanUse = expItemNow - 1000				--经验返还处理
							if expGetNow * 2>= expCanUse then
								expCanGive = expCanUse
								expItemNow = 1000
							else
								expItemNow = expItemNow - expGetNow*2
								expCanGive = expGetNow * 2
							end
							if expItemNow <= 1000 then
								expItemNow = 1000
							end
						exp_up = exp_up + expCanGive
					else																	--死了的处理				
						expCanGive = 0
						exp_up = exp_up + expCanGive
					end
					
					local expCanUse = expItemNow - 1000

			
				end
			end
			expItemNow= math.floor(expItemNow/10)
			SetItemAttr ( ptnItem ,ITEMATTR_URE , expItemNow )
		end
---------------------------------
---------------------------------
-----------------------------------------				
			if exp_up > 20000 then
				local cha_name = GetChaDefaultName ( TurnToCha(t[i]) )
				local Monster_name = GetChaDefaultName ( dead )
				LG ( "Big_exp" ,"Character"..cha_name.."Attack"..Monster_name.."Obtained"..exp_up.."EXP" )
			end
			--SystemNotice ( team_atker , "经验为"..exp)
			--SystemNotice ( team_atker , "获得经验为"..exp_up)
			--SystemNotice ( TurnToCha(t[i]) , "exp = "..exp )
			if exp<DEXP[80] and (exp+exp_up)>DEXP[80] then
				--SystemNotice ( TurnToCha(t[i]) , "DEXP[80] = "..DEXP[80] )
				--SystemNotice ( TurnToCha(t[i]) , "exp_up前 = "..exp_up)
				exp_up =math.floor((DEXP[80]-exp) +(exp_up-(DEXP[80]-exp))/50)
				--SystemNotice ( TurnToCha(t[i]) , "exp_up后 = "..exp_up)
			end                                                                                  -------------避免79级到80级之后，拿到超出额度的经验 Jack


			if Lv ( TurnToCha(t[i]) ) >= 80 then 
				exp_up = math.floor ( exp_up / 50 ) 
			end 
			--防沉迷系数  
			local retExpState = GetExpState(t[i])

			if exp_up == 0 and retExpState ~= 0 then 
				SystemNotice ( TurnToCha(t[i]) , "Your level is too high to obtain any experience" )
			end 


			--Notice("打怪获取经验的防沉迷系数为"..retExpState)
			--Notice("防沉迷之前的exp"..exp_up)
			
			exp_up =exp_up *GetExpState(t[i])/100
			--Notice("防沉迷之后的exp"..exp_up)

			--SystemNotice ( TurnToCha(t[i]) , "经过各种计算后得到的exp_up = "..exp_up)
			exp = exp + exp_up  
			

--			local lv = GetChaAttr(TurnToCha(t[i]), ATTR_LV)
--			if lv == 100 then
--				local a = CheckBagItem ( TurnToCha(t[i]), 171 )
--				--SystemNotice( TurnToCha(t[i]), "数目="..a)
--				if a == 1 then
--					local role_jyp = GetChaItem2 ( TurnToCha(t[i]), 2, 171)
--					local exp_store = GetItemAttr ( role_jyp, ITEMATTR_VAL_PARAM1 )
--					--SystemNotice( TurnToCha(t[i]), "原NUM="..exp_store)
--					exp_store = exp_store+exp_up
--					--SystemNotice( TurnToCha(t[i]), "现NUM="..exp_store)
--					SetItemAttr ( role_jyp, ITEMATTR_VAL_PARAM1, exp_store)
--					SystemNotice( TurnToCha(t[i]), "你的经验瓶中的积分增加了"..exp_up)
--				else
--				SetChaAttrI ( TurnToCha(t[i]) , ATTR_CEXP, exp )
--				end
--			else
--			SetChaAttrI ( TurnToCha(t[i]) , ATTR_CEXP, exp )
--			LG("exp" , "exp_now = " , exp ) 
--			end
			SetChaAttrI ( TurnToCha(t[i]) , ATTR_CEXP, exp ) 
			LG("exp" , "exp_now = " , exp ) 
		else 
	        --SystemNotice ( team_atker , "队员排位["..i.."]的值为空")
		end 
	end 
	local star112=GetChaAttr (  team_atker , ATTR_CEXP )----------当前等级经验
	LG("star_exp" , "Player"..cha_name1100.."Current Experience is"..star112.."End ShareTeamExp" ) 
	LG("exp" , "end getexp " )
end 

function returnLowLVPlayer(PlayerNow,Player1,Player2,Player3,Player4,Player5)    --返回队伍中比自己等级小5级的玩家指针
	local lvPlayerNow = GetChaAttr(PlayerNow, ATTR_LV)
	PlayerNow = TurnToCha(PlayerNow)
	Player1 = TurnToCha(Player1)
	Player2 = TurnToCha(Player2)
	Player3 = TurnToCha(Player3)
	Player4 = TurnToCha(Player4)
	Player5 = TurnToCha(Player5)
	
	if ValidCha(Player1) == 1 then
		local lvPlayer1 = GetChaAttr(Player1, ATTR_LV)
		if lvPlayerNow > lvPlayer1 + 5 then
			return Player1
		end
	end
	
	if ValidCha(Player2) == 1 then
		local lvPlayer2 = GetChaAttr(Player2, ATTR_LV)
		if lvPlayerNow > lvPlayer2 + 5 then
			return Player2
		end
	end
	
	if ValidCha(Player3) == 1 then
		local lvPlayer3 = GetChaAttr(Player3, ATTR_LV)
		if lvPlayerNow > lvPlayer3 + 5 then
			return Player3
		end
	end
	
	if ValidCha(Player4) == 1 then
		local lvPlayer4 = GetChaAttr(Player4, ATTR_LV)
		if lvPlayerNow > lvPlayer4 + 5 then
			return Player4
		end
	end
	
	if ValidCha(Player5) == 1 then
		local lvPlayer5 = GetChaAttr(Player5, ATTR_LV)
		if lvPlayerNow > lvPlayer5 + 5 then
			return Player5
		end
	end
	
	return 0
end

function CheckExpShare ( ti , atk ) --ti如果atk相等那就有问题了
	if ValidCha(ti)==0 then 
		LG ( "luascript_err" , "fucntion CheckExpShare : party member count as null\n" ) 
		return 0
	end 

	if IsInSameMap ( atk , ti ) == 0   then 
		--SystemNotice( atk , "由于所在地图不同，您无法与某些队友分享战斗经验") 
		return 0 
	end 

	local pos_ti_x , pos_ti_y = GetChaPos ( ti ) 
	if ValidCha( atk ) == 0 then 
		LG ( "luascript_err" , "fucntion CheckExpShare :  Monster killer as null\n" ) 
		return 0
	end 

		
	local pos_atk_x , pos_atk_y = GetChaPos ( atk ) 
	local distance = Dis ( pos_ti_x , pos_ti_y , pos_atk_x , pos_atk_y ) 
	if distance >= 4000 then 
--		HelpInfo(ti,0,"由于相隔太远，您无法与您的某些队友分享战斗经验") 
		return 0 
	end 
	if IsChaInRegion ( ti , AREA_SAFE ) == 1 then 
--		HelpInfo(ti,0,"由于处于安去区，您无法与您的队友分享战斗经验") 
		return 0 
	end 
	return 1 
end 


function Dead_Punish ( dead , atk ) --死亡惩罚
----------圣诞
	local Role_ID = GetRoleID(dead)
	 BBBB[ Role_ID ] = 0
------------------
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

	if lv<=10 then
		return 
	end --[[判定大于10级扣除经验]]--
	if lv >= 70 and check_pirate ==1 then
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
	local i3 = CheckBagItem( dead,5609 )                                      ---------------------------------免死金牌kokora

	if map_name == "secretgarden" or map_name == "teampk" then
	SetCharaAttr(0, dead, ATTR_SP)
		return
	end
	
	local i= CheckBagItem( dead, 2954 )-------死亡证明
	--SystemNotice( dead , "i=="..i)
	if i==1 then
		local Dead_BK = GetChaItem2 ( dead , 2 , 2954 )
		local DeadPoint=GetItemAttr ( Dead_BK , ITEMATTR_VAL_STR)
			--SystemNotice( dead , "DeadPoint之前为=="..DeadPoint)

		local DeadPoint=DeadPoint+1
			SetItemAttr( Dead_BK , ITEMATTR_VAL_STR , DeadPoint )
				local DeadPoint1=GetItemAttr ( Dead_BK , ITEMATTR_VAL_STR)
				--SystemNotice( dead , "DeadPoint现在为=="..DeadPoint1)

		if DeadPoint>=100 then
		end
	end

	if i1 <= 0 and i2 <= 0 and  i3 <= 0 then ---没娃娃没宝宝没免死金牌kokora
		exp = Exp(dead) - exp_red 
		if Lv ( dead ) >= 80 then 
			exp_red_80 = exp_red * 50 
			SystemNotice (dead , "Death penalty. EXP lost:"..exp_red_80 ) 
		else 
			SystemNotice (dead , "Death penalty. EXP lost:"..exp_red ) 
		end 
		SetChaAttrI( dead , ATTR_CEXP , exp ) --[[扣除死亡玩家所在级别经验的2％]]--
		if lv > 20 then
			Dead_Punish_ItemURE ( dead )
		end
	
	elseif i1~=0 and i2==0 and  i3==0 then --有娃娃没宝宝没免死金牌kokora
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[扣除死亡玩家所在级别经验的2％]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i2~=0 and  i1==0 and i3==0  then --有宝宝没娃娃没免死金牌kokora
		local j2 = TakeItem( dead,0,3047,1)
		if j2 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[扣除死亡玩家所在级别经验的2％]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i3~=0 and i1==0 and  i2==0  then --有免死金牌没娃娃没宝宝kokora
		local j2 = TakeItem( dead,0,5609,1)
		if j2 == 0  then
			LG ( "NewItem" , "免死金牌删除失败" )
			SystemNotice ( dead , "免死金牌删除失败" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "由于死亡丢失经验"..exp_red_80 ) 
			else 
				SystemNotice (dead , "由于死亡丢失经验"..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[扣除死亡玩家所在级别经验的2％]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "由免死金牌代替死亡,免予经验和耐久惩罚" )
		end
	elseif i1~=0 and i2~=0 and  i3==0 then --有娃娃有宝宝没免死金牌kokora 先删除娃娃
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[扣除死亡玩家所在级别经验的2％]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i2~=0 and  i3~=0 and i1==0  then --有宝宝有免死金牌没娃娃kokora先删除宝宝
		local j2 = TakeItem( dead,0,3047,1)
		if j2 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[扣除死亡玩家所在级别经验的2％]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i1~=0 and i3~=0 and  i2==0 then --有娃娃有免死金牌没宝宝kokora 先删除娃娃
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[扣除死亡玩家所在级别经验的2％]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	elseif i1~=0 and i2~=0 and  i3~=0 then --有娃娃有免死金牌有宝宝kokora 先删除娃娃
		local j1 = TakeItem( dead,0,3846,1)
		if j1 == 0  then
			LG ( "NewItem" , "Voodoo Doll deletion failed" )
			SystemNotice ( dead , "Voodoo Doll deletion failed" )
			exp = Exp(dead) - exp_red 
			if Lv ( dead ) >= 80 then 
				exp_red_80 = exp_red * 50 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red_80 ) 
			else 
				SystemNotice (dead , "Death penalty. EXP lost:"..exp_red ) 
			end 
			SetChaAttrI( dead , ATTR_CEXP , exp ) --[[扣除死亡玩家所在级别经验的2％]]--
			if lv > 20 then
				Dead_Punish_ItemURE ( dead )
			end
		else
			SystemNotice ( dead , "Voodoo Doll replace death penalty" )
		end
	end
	
	local name = GetChaDefaultName ( dead )
	local exp_new = ( exp - clexp ) / ( nlexp - clexp )
	
	LG ( "die_exp" , "Character Name" , name , "Current Lv= ", lv , "Death EXP penalty= " , exp_red , "Newest EXP proportion= " , exp_new )

	local mars = 0
	for mars = 0 , 4 , 1 do
		if name == CheckDmgChaNameTest [mars] then
			LG ( "whydie" , name.."Hang" )
		end
	end
end 


function GetExp_MKP(dead , atk) --[[player kill monster 经验值改变公式]]-- 
	--LuaPrint("Enter function GetExp_MKP() --[[player kill monster 经验值改变公式]]--") 
	Dead_Punish( dead , atk) 
	--LuaPrint("Out function GetExp_MKP() --[[player kill monster 经验值改变公式]]--") 
end 

function GetExp_PKP(dead , atk) --[[player kill player 经验值改变公式]]-- 
	--LuaPrint("Enter function GetExp_MKP() --[[player kill monster 经验值改变公式]]--") 
--	Dead_Punish( dead , atk) 
	--LuaPrint("Out function GetExp_MKP() --[[player kill monster 经验值改变公式]]--") 
end 

function GetExp_Noexp(dead , atk) --[[无奖惩经验值改变公式]]-- 
	--LuaPrint("Enter function GetExp_Noexp() --[[无奖惩经验值改变公式]]-- ".."\n" ) 
	--LuaPrint("Out function GetExp_Noexp() --[[无奖惩经验值改变公式]]-- ".."\n" ) 
end 





--角色非技能性复活脚本————————————————————————————————————————————

function Relive ( role )							
	local mxhp = GetChaAttr ( role , ATTR_MXHP ) 
	local mxsp = GetChaAttr ( role , ATTR_MXSP ) 
	local hp = math.max ( 1, math.floor(  ( mxhp * 0.01 ) + 0.5 ) ) 
	local sp = math.max ( 1, math.floor(  ( mxsp * 0.01 ) + 0.5 ) ) 
	SetCharaAttr ( hp , role , ATTR_HP ) 
	SetCharaAttr ( sp , role , ATTR_SP ) 
end 

--角色技能性复活脚本————————————————————————————————————————————

function Relive_now ( role , sklv ) 
	local cha_role = TurnToCha ( role ) 
	local hp = math.max ( 1 , math.floor ( 0.05 * sklv * Mxhp ( cha_role ) ) ) 
	local sp = math.max ( 1 , math.floor ( 0.05 * sklv * Mxsp ( cha_role ) ) ) 
	SetCharaAttr ( hp , cha_role , ATTR_HP ) 
	SetCharaAttr ( sp , cha_role , ATTR_SP ) 
end 




--船只死亡最大耐久减少——————————————————————————————————————————————————————————————

function   Ship_ShipDieAttr ( role ) 
	local bmxhp = GetChaAttr ( role , ATTR_BMXHP ) 
	local dead_count = GetChaAttr ( role , ATTR_BOAT_DIECOUNT ) 
	LG ( "shipmxhp" , "___a new dead ship_____________________________________________________" ) 
	LG ( "shipmxhp" , "role = " , role ,  "dead_count = " , dead_count , "form_mxhp = " , bmxhp ) 
	bmxhp = bmxhp * math.max ( 0 , ( 1 - 0.02 - dead_count * 0.01 )  ) 
	LG ( "shipmxhp" , "role = " , role ,   "now_mxhp = " , bmxhp ) 
	SetCharaAttr ( bmxhp , role , ATTR_BMXHP ) 
end  


function BoatLevelUpProc ( cha, boat, levelup, exp, money ) 
	if ValidCha( cha ) == 0 then 
		LG ( "luascript_err" , "function BoatLevelUpProc : cha as null" ) 
		return 0 
	end 
	if ValidCha( boat ) == 0 then 
		LG ( "luascript_err" , "function BoatLevelUpProc : boat as null" ) 
		return 0 
	end 
	PRINT( "BoatLevelUpProc: levelup = , exp = , money = ", levelup, exp, money )
	local lv_up	= levelup 
	local req_exp	= exp 
	local req_gold	= money 
	local boat_lv = GetChaAttr ( boat , ATTR_LV ) 
	if boat_lv ~= lv_up - 1 then 
		PRINT( "BoatLevelUpProc:function BoatLevelUpProc :ship current level and upgrade level does not match" )
		LG ( "luascript_err" , "function BoatLevelUpProc :ship current level and level to upgrade does not match" )
		return 0 
	end 

	local boat_exp = GetChaAttr ( boat , ATTR_CEXP ) 
	if boat_exp < req_exp then 
		SystemNotice ( cha , "Insufficient EXP to level up ship. Please try harder") 
		return 0 
	end 

	local cha_money = GetChaAttr ( cha , ATTR_GD ) 
	if cha_money < req_gold then 
		SystemNotice ( cha , "Insufficient gold to level up ship. Please try harder") 
		return 0 
	end 
	PRINT( "BoatLevelUpProc: boat_exp, req_exp, cha_money, req_gold", boat_exp, req_exp, cha_money, req_gold )
	SetAttrChangeFlag( boat)	
	SetAttrChangeFlag( cha)	

	boat_exp = boat_exp - req_exp 
	SetCharaAttr ( boat_exp , boat , ATTR_CEXP ) 
	cha_money = cha_money - req_gold 	
	SetCharaAttr ( cha_money , cha , ATTR_GD ) 
	SetCharaAttr ( lv_up , boat , ATTR_LV ) 
	ALLExAttrSet ( boat ) 
	SystemNotice ( cha , "Ship level up successfully") 
	SystemNotice ( cha , "Gold Deducted"..req_gold) 
	SystemNotice ( cha , "Consume experience: "..req_exp) 
	SyncBoat ( boat, 4 )
	SyncChar ( cha, 4 )
	PRINT( "BoarLevelUpProc: return 1" )
	return 1 

end 




function Ship_Tran (  buyer , boat ) 
	local ship_lv = GetChaAttr ( boat , ATTR_LV ) 
	local ship_exp = GetChaAttr ( boat , ATTR_CEXP ) 
--	if ValidCha ( seller ) == 0 then 
--		LG ( "luascript_err"  , "function Ship_Tran : seller 为空"  ) 
--		return 
--	end 
--	if ValidCha ( buyer ) == 0 then 
--		LG ( "luascript_err"  , "function Ship_Tran : buyer 为空"  ) 
--		return 
--	end 
	SetAttrChangeFlag( boat)	

	ship_lv = math.max ( 1 , math.max (math.floor ( ship_lv /2 ), ship_lv - 10 ) )  
	ship_exp = 0 
	SetCharaAttr ( ship_exp , boat , ATTR_CEXP ) 
	SetCharaAttr ( ship_lv , boat , ATTR_LV ) 
	SystemNotice ( buyer , "After trade, ship level becomes "..ship_lv )	
	SystemNotice ( buyer , "After trade, ship experience reduced to "..ship_exp )	 

	SyncBoat ( boat, 4 )
end 


--幸运一击
function CheckLuckyFinish ( StateLv )
	if StateLv == 3 then
		local Huge_Lucky = Percentage_Random ( 0.01 )
		if Huge_Lucky == 1 then
			return 2
		end
	end
	
	local a = 0.1
	local b = Percentage_Random ( a )
	return b
end