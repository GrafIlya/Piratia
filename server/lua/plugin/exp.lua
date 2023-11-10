print('Loading exp.lua')

EXP_RAID = 3
MF_RAID = 1

LV_LIMIT = 65
SetChaAttrMax(ATTR_LV, LV_LIMIT)

LV_EXP = {}
LV_EXP[01] = 1
LV_EXP[02] = 1
LV_EXP[03] = 1
LV_EXP[04] = 1
LV_EXP[05] = 1
LV_EXP[06] = 1.2
LV_EXP[07] = 1.2
LV_EXP[08] = 1.3
LV_EXP[09] = 1.3
LV_EXP[10] = 1.5
LV_EXP[11] = 1.5
LV_EXP[12] = 1.5
LV_EXP[13] = 1.5
LV_EXP[14] = 1.5
LV_EXP[15] = 1.5
LV_EXP[16] = 1.8
LV_EXP[17] = 1.8
LV_EXP[18] = 1.8
LV_EXP[19] = 1.8
LV_EXP[20] = 1.8
LV_EXP[21] = 2
LV_EXP[22] = 2
LV_EXP[23] = 2
LV_EXP[24] = 2
LV_EXP[25] = 2
LV_EXP[26] = 2.2
LV_EXP[27] = 2.2
LV_EXP[28] = 2.2
LV_EXP[29] = 2.2
LV_EXP[30] = 2.2
LV_EXP[31] = 2
LV_EXP[32] = 2
LV_EXP[33] = 2
LV_EXP[34] = 2
LV_EXP[35] = 2
LV_EXP[36] = 1.8
LV_EXP[37] = 1.8
LV_EXP[38] = 1.8
LV_EXP[39] = 1.8
LV_EXP[40] = 1.8
LV_EXP[41] = 1.5
LV_EXP[42] = 1.5
LV_EXP[43] = 1.5
LV_EXP[44] = 1.5
LV_EXP[45] = 1.3
LV_EXP[46] = 1.3
LV_EXP[47] = 1.3
LV_EXP[48] = 1.3
LV_EXP[49] = 1.2
LV_EXP[50] = 1.2
LV_EXP[51] = 1.2
LV_EXP[52] = 1.2
LV_EXP[53] = 1.1
LV_EXP[54] = 1.1
LV_EXP[55] = 1.1
LV_EXP[56] = 1.1
LV_EXP[57] = 1
LV_EXP[58] = 1
LV_EXP[59] = 1
LV_EXP[60] = 1
LV_EXP[61] = 1
LV_EXP[62] = 1
LV_EXP[63] = 1
LV_EXP[64] = 1
LV_EXP[65] = 1
LV_EXP[66] = 1
LV_EXP[67] = 1
LV_EXP[68] = 1
LV_EXP[69] = 1
LV_EXP[70] = 1
LV_EXP[71] = 1
LV_EXP[72] = 1
LV_EXP[73] = 1
LV_EXP[74] = 1
LV_EXP[75] = 1
LV_EXP[76] = 1
LV_EXP[77] = 1
LV_EXP[78] = 1
LV_EXP[79] = 1
LV_EXP[80] = 1
LV_EXP[81] = 1
LV_EXP[82] = 1
LV_EXP[83] = 1
LV_EXP[84] = 1
LV_EXP[85] = 1
LV_EXP[86] = 1
LV_EXP[87] = 1
LV_EXP[88] = 1
LV_EXP[89] = 1
LV_EXP[90] = 1
LV_EXP[91] = 1
LV_EXP[92] = 1
LV_EXP[93] = 1
LV_EXP[94] = 1
LV_EXP[95] = 1
LV_EXP[96] = 1
LV_EXP[97] = 1
LV_EXP[98] = 1
LV_EXP[99] = 1
LV_EXP[100] = 1

function IsMentorInParty(role, id)
	local mentorRole = GetRoleByID(id)
	local t = {true, true, true, true, true}
	t[1] = role
	t[2] = GetTeamCha(role, 0)  
	t[3] = GetTeamCha(role, 1)   
	t[4] = GetTeamCha(role, 2)    
	t[5] = GetTeamCha(role, 3)
	for i = 1, table.getn(t) do
		if t[i] == mentorRole then
			return true
		end
	end
	return false
end

function Shengji_Shuxingchengzhang( role )
	local lv = Lv ( role ) 
	if lv >= LV_LIMIT then 
		local year = os.date ( "%y" ) 
		local month = os.date ( "%m" ) 
		local day = os.date ( "%d" ) 
		local sep = "_"
		lgname = "lvup"..year..sep..month..sep..day
		local Cha_name = GetChaDefaultName ( role ) 
		LG ( lgname , Cha_name.." "..lv ) 
	end 
	BsAttrUpgrade( role ) 
	AttrRecheck(role) 
	hp = Mxhp_final(role) 
	sp = Mxsp_final(role) 
	SetCharaAttr(hp, role, ATTR_HP) 
	SetCharaAttr(sp, role, ATTR_SP) 

	local ret = HasMaster(role)
	if ret == LUA_TRUE then
		local mentorId = GetMasterID(role)
		if mentorId ~= 0 then
			local mentorRole = GetRoleByID(mentorId)
			if mentorRole ~= nil then
				-- mentor must be in the same pt, and must be in distance of 4000 (same distance shareteamexp checks)
				local x1, y1 = GetChaPos(role)
				local x2, y2 = GetChaPos(mentorRole)
				local distance = Dis(x1, y1, x2, y2)
				if lv ~= LV_LIMIT then
					if distance < 4000 and IsMentorInParty(role, mentorId) then
						AddMasterCredit(role, PlayerCredit[lv])
						SystemNotice(mentorRole, "Disciple ["..GetChaDefaultName(role).."] leveled up to "..lv..". Received "..PlayerCredit[lv].." reputation")
					else
						SystemNotice(mentorRole, "Disciple ["..GetChaDefaultName(role).."] leveled up to "..lv..". Not in party or in range of dsciple to receive reputation.")
					end
				end
			end
		end
		if lv <= 40 then
			GiveItemX( role , 0 , 1128  , 1 , 4 )
		end
		if lv == 41 then
			SystemNotice(role,"Congratulations! You are now a qualified mentor! Now you can have your own disciples.")
			AddCreditX(role, 300)
			AddMoney(role , 0, 200000)
			--GiveItemX( role , 0 , 3345  , 1 , 4 )
			--GiveItemX( role , 0 , 3346  , 1 , 4 )
			--GiveItemX( role , 0 , 3347  , 1 , 4 )
			--GiveItemX( role , 0 , 0855  , 49 , 4 )
			--AddMasterCredit(role, 500)
		end
	end
end 

-- Level up function
function BsAttrUpgrade(role)
	local job = GetChaAttr(role, ATTR_JOB)
	local job_check = CheckJobLegal(job) 
	if job_check == 0 then return end 
	local ap_extre = 0 
	local tp_extre = 0 
	local attr_tp = Attr_tp(role)  
	local attr_ap = Attr_ap(role) 
	local bsstr = BSStr(role) + 0
	SetCharaAttr(bsstr, role, ATTR_BSTR)
	local bsdex = BSDex(role) + 0
	SetCharaAttr(bsdex, role, ATTR_BDEX)
	local bscon = BSCon(role) + 0
	SetCharaAttr(bscon, role, ATTR_BCON)
	local bsagi = BSAgi(role) + 0
	SetCharaAttr(bsagi, role, ATTR_BAGI)
	local bssta = BSSta(role) + 0
	SetCharaAttr(bssta, role, ATTR_BSTA)
	local bsluk = BSLuk(role) + 0
	SetCharaAttr(bsluk, role, ATTR_BLUK)
	local lv = GetChaAttr(role, ATTR_LV)
	-- Each 10 lvs player will get 5 stats points, otherwise 1
	if(math.floor((lv)/10) - math.floor((lv - 1)/10)) == 1 then
		ap_extre = 5
	else
		ap_extre = 1
	end
	-- Each lv(from lv 60) player will get 2 stats points
	if lv >= 60 then
		ap_extre = ap_extre + 1
	end
	-- Only players above lv 9 will get skill points
	if lv > 9 then
		tp_extre = 1
	end 
	 -- Each 5 lvs(from lv 65) player will get 2 skill points, otherwise, only 1
	if lv >= 65 then
		if(math.floor((lv)/5) - math.floor((lv - 1)/5)) == 1 then
			tp_extre = 2
		else
			tp_extre = 1 
		end 
	end
	attr_ap = attr_ap + ap_extre
	SetCharaAttr(attr_ap, role, ATTR_AP) 
	attr_tp = attr_tp + tp_extre
	SetCharaAttr(attr_tp, role, ATTR_TP) 
end 

expbyhook = function (cha, exp)
	exp = expbyamp(cha, exp)
	exp = expbyfairy(cha, exp)
	exp = expbynana(cha, exp)
	exp = expbyunity(cha, exp)
	return exp
end

function ShareTeamExp ( dead , team_atker , dead_exp , The_Killer) 
	local cha_name1100 = GetChaDefaultName (team_atker )
	local star111=GetChaAttr (  team_atker , ATTR_CEXP )
	local atker_role = ChaIsBoat ( team_atker ) 
	local monster_location = IsChaInLand ( dead ) 

	if atker_role == 1 and monster_location == 1 then
		dead_exp = math.floor ( dead_exp / 5 + 1 )
	end

	local dead_lv = GetChaAttrI( dead , ATTR_LV )
	local t = {}
	t[0] = team_atker
	if ValidCha (team_atker) == 0 then 
		return 
	end 
	t[1] = GetTeamCha(team_atker, 0 )
	t[2] = GetTeamCha(team_atker, 1 )
	t[3] = GetTeamCha(team_atker, 2 )
	t[4] = GetTeamCha(team_atker, 3 )

	local count = 0 
	local NewPlayer_CanGet = 0
	local NewPlayer_Lv = 0
	local NewPlayer_Lv_dif = -100
	local Check_Killer = 0
	if t[0] == The_Killer then
		Check_Killer = 1
	end
	for i = 0 , 4 , 1 do
		if ValidCha( t[i] )== 1  then
			a = CheckExpShare ( t[i] , team_atker ) 
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
		return 
	end

	-- PARTY EXP
	local TeamExp_Increas = 0.25 * TeamExp_RAID
	local exp_add = math.floor( dead_exp * ( 1 + (count -1 )* TeamExp_Increas ) )
	local exp_increase = math.floor ( dead_exp * (count -1 )* TeamExp_Increas )
	if count >=2 then
		exp_add = exp_add * InTeamGetExp_RAID
	end

	-- INDIVIDUAL EXP
	local exp_up
	for i = 0 , 4 , 1 do
		if ValidCha(t[i])==1 then
			local a = 1
			local b = 1
			if i >= 1 then 
				a = CheckExpShare ( t[i] , team_atker )
				exp_up = math.max (1,  math.floor ( exp_add/count ) ) * a
			else 
				exp_up = math.max ( 1, math.floor ( exp_add/count ) )
			end

			t_lv = GetChaAttrI ( TurnToCha(t[i]) , ATTR_LV ) 
			lv_dis =  t_lv - dead_lv
			if lv_dis >= 4 then 
				b = math.min ( 10 , 1 + ( math.abs ( lv_dis - 4 ) * 0.4 ) )
			elseif lv_dis <= -1 * 10 then 
				b = math.min ( 4 , 1 + math.abs ( lv_dis - 10)  * 0.1 ) 
			end 

			-- CONTRIBUTION POINTS
			exp_up = math.floor ( math.max ( 1 , exp_up / b ) ) * a 
			if count >=3 and NewPlayer_CanGet <= 0 and Check_Killer == 1 then
				if lv_dis <=3 then
					Add_RYZ_TeamPoint ( TurnToCha(t[i]) , count , 1)
				end
			end
			if t_lv >= 50 and NewPlayer_CanGet > 0 and Check_Killer == 1 then
				Add_RYZ_TeamPoint ( TurnToCha(t[i]) , 6 , NewPlayer_CanGet)
			end
			exp = GetChaAttrI ( TurnToCha(t[i]) , ATTR_CEXP )

			exp_up = expbyhook(t[i], exp_up)

			-- EXP / MOBs LV15 and BELOW
			local playerLv = Lv(TurnToCha(t[i]))
			if(Lv(dead) >(playerLv + 11))then
				if exp_up ~= 0 then
					exp_up = 0
					SystemNotice(TurnToCha(t[i]), GetChaDefaultName(dead).."'s Lv is too high. Unable to gain EXP.")
				end
			end
			-- From PKO2.4
			--[[if LV_EXP ~= nil then
				local expraid = LV_EXP[Lv(TurnToCha(t[i]))] or 1
				exp_up = math.floor(exp_up*expraid)
			end]]
			-- LEVEL JUMP
			if exp<DEXP[80] and (exp+exp_up) > DEXP[80] then
				exp_up = math.floor((DEXP[80]-exp) + (exp_up-(DEXP[80]-exp))/50)
			end
			if Lv ( TurnToCha(t[i]) ) >= 80 then 
				exp_up = math.floor ( exp_up / 50 ) 
			end 
			-- LEVEL LIMIT
			if exp < DEXP[LV_LIMIT] and (exp+exp_up) > DEXP[LV_LIMIT] then
				exp_up = DEXP[LV_LIMIT] - exp
			end
			if Lv ( TurnToCha(t[i]) ) >= LV_LIMIT then 
				exp_up = 0
			end 
			--[[if exp_up == 0 and retExpState ~= 0 then 
				SystemNotice ( TurnToCha(t[i]) , "Your level is too high to obtain any experience" )
			end]]
			-- EXP STONE
			local expstone = GetChaItem2 ( TurnToCha(t[i]) , 2 , 15006)
			local on = GetItemAttr(expstone, 55)
			if on == 1 then
				--SystemNotice(TurnToCha(t[i]), GetItemName(GetItemID(expstone))..' consumed the exp')
				SystemNotice(TurnToCha(t[i]), 'Exp Gained: NULL')
				exp_up = 0
			end
			-- FINAL
			local retExpState = GetExpState(t[i])
			exp_up = exp_up * GetExpState(t[i])/100
			exp = exp + exp_up  
			SetChaAttrI ( TurnToCha(t[i]) , ATTR_CEXP, exp ) 
		end 
	end 
end

function expbyamp(cha, exp_up)
	local EXP_RAID_STATE = 1
	local StateLv = GetChaStateLv(cha, STATE_SBJYGZ)
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
		if StateLv == 5	then
			EXP_RAID_STATE = 5
		end
		if StateLv == 6	then
			EXP_RAID_STATE = 10
		end
		if StateLv == 7	then
			EXP_RAID_STATE = 20
		end
	end
	-- luck strike
	if StateLv > 1 then
		local CheckLucky = 0
		CheckLucky = CheckLuckyFinish(StateLv)
		if CheckLucky == 1 then
			EXP_RAID_STATE = EXP_RAID_STATE * 2
			SystemNotice(cha, "Lucky Strike, obtain increased experience gained")
		end
		if CheckLucky == 2 then
			EXP_RAID_STATE = 10
			SystemNotice(cha, "Super Lucky Strike! Obtained 10 times EXP")
		end
	end
	return EXP_RAID_STATE * exp_up
end

function expbyfairy(cha, exp_up)
	local Item_bg = GetChaItem(cha, 2, 1) 
	local Get_Item_Type = GetItemType(Item_bg) 
	if Get_Item_Type == 59 then 
		local  Item_ID = GetItemID(Item_bg)
		local str = GetItemAttr(Item_bg ,ITEMATTR_VAL_STR)
		local con = GetItemAttr(Item_bg ,ITEMATTR_VAL_CON)
		local agi = GetItemAttr(Item_bg ,ITEMATTR_VAL_AGI)
		local dex = GetItemAttr(Item_bg ,ITEMATTR_VAL_DEX)
		local sta = GetItemAttr(Item_bg ,ITEMATTR_VAL_STA)
		local lv_JL = str + con + agi + dex + sta -- Fairy Level

		local URE = GetItemAttr(Item_bg ,ITEMATTR_URE)
		local MAXURE = GetItemAttr(Item_bg ,ITEMATTR_MAXURE)

		local Num_JL = GetItemForgeParam(Item_bg, 1)
		local Part1 = GetNum_Part1(Num_JL)	
		local Part2 = GetNum_Part2(Num_JL)	
		local Part3 = GetNum_Part3(Num_JL)
		local StateLv1 = GetChaStateLv(cha, STATE_JLFT7)
		local StateLv2 = GetChaStateLv(cha, STATE_JLFT8)
		local StateLv3 = GetChaStateLv(cha, STATE_JLFT1)
		local StateLv4 = GetChaStateLv(cha, STATE_JLFT5)
		local StateLv5 = GetChaStateLv(cha, STATE_JLFT2)
		local flag = 0

		if Item_ID == 237 and StateLv1 ~= 0 then 
			flag=1 
		end
		if Item_ID == 681 and StateLv2 ~= 0 then 
			flag=1 
		end
		if flag == 1 then 
			if StateLv1 ~= 0 or StateLv2 ~= 0 then 
				exp_up = exp_up*(lv_JL*0.02+1)
			end
		end
		SetItemAttr(Item_bg, ITEMATTR_URE, URE)
	end
	return exp_up
end

function expbynana(cha, exp_up)
	local Check = {}
	Check[0] = cha
	Check[1] = GetTeamCha(cha, 0)
	Check[2] = GetTeamCha(cha, 1)
	Check[3] = GetTeamCha(cha, 2)
	Check[4] = GetTeamCha(cha, 3)
	for j = 0 , 4 , 1 do
		if ValidCha(Check[j]) == 1 then
			local star = IsTeamLeader(Check[j])
			if star == 1 then
				local StateLv = GetChaStateLv(Check[j], STATE_ZDSBJYGZ)
				local Isshare = CheckExpShare(cha, Check[j])
				if StateLv == 1 and Isshare == 1 then
					exp_up = 1.5 * exp_up
				end
			end
		end
	end
	return exp_up
end

function expbyunity(cha, exp_up)
	local t = {}
	t[0] = cha
	if ValidCha (cha) == 0 then 
		return 
	end 
	t[1] = GetTeamCha(cha, 0 )
	t[2] = GetTeamCha(cha, 1 )
	t[3] = GetTeamCha(cha, 2 )
	t[4] = GetTeamCha(cha, 3 )

	local expGetNow = exp_up
	local expCanGive = 0
	cha = TurnToCha(cha)
	local ptnItem = GetEquipItemP(cha, 8)
	local IdItem = GetItemID(ptnItem)	
	local lvPerson = GetChaAttr(cha, ATTR_LV)
	if IdItem == 1034 and lvPerson < 41 then
		local expItemNow = GetItemAttr(ptnItem, ITEMATTR_URE)*10
		local expItemMax = GetItemAttr(ptnItem, ITEMATTR_MAXURE)*10
		local retIsInTeam = IsInTeam(cha)
		if retIsInTeam ~= LUA_TRUE then
			expItemNow = expItemNow + expGetNow
			if expItemNow >= expItemMax then
				expItemNow = expItemMax
			end
		--[[else
			if HasTeammate(cha,0, 5) == LUA_TRUE then
				local ptnLowLvPlayer = returnLowLVPlayer(cha, t[0], t[1], t[2], t[3], t[4])
				if ValidCha(ptnLowLvPlayer) == 1 then
					local expCanUse = expItemNow - 1000
						if expGetNow * 2>= expCanUse then
							expCanGive = expCanUse
							expItemNow = 1000
						else
							expItemNow = expItemNow - expGetNow*2
							expCanGive = expGetNow * 2
							SystemNotice(cha, 'Star of Unity drains energy. Obtained x2 exp!')
						end
						if expItemNow <= 1000 then
							expItemNow = 1000
						end
					exp_up = exp_up + expCanGive
				else
					expCanGive = 0
					exp_up = exp_up + expCanGive
				end
				local expCanUse = expItemNow - 1000
			end ]]
		end
		expItemNow= math.floor(expItemNow/10)
		if expItemNow == (expItemMax/10) then
			SystemNotice(cha, GetItemName(IdItem)..' is full!')
		else
			SystemNotice(cha, GetItemName(IdItem)..' charging...')
		end
		SetItemAttr(ptnItem ,ITEMATTR_URE, expItemNow)
	end
	return exp_up
end
