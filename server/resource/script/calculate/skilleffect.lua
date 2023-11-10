print( "Loading Calculate Files:" )
print( "------------------------------------" )
print( "Loading SkillEffect.lua" )

dofile(GetResPath("script\\calculate\\exp_and_level.lua"))
dofile(GetResPath("script\\calculate\\JobType.lua"))
dofile(GetResPath("script\\calculate\\AttrType.lua"))
dofile(GetResPath("script\\calculate\\Init_Attr.lua"))
dofile(GetResPath("script\\calculate\\ItemAttrType.lua")) 
dofile(GetResPath("script\\calculate\\functions.lua"))
dofile(GetResPath("script\\calculate\\AttrCalculate.lua")) 
dofile(GetResPath("script\\calculate\\ItemEffect.lua")) 
dofile(GetResPath("script\\calculate\\variable.lua"))
dofile(GetResPath("script\\calculate\\Look.lua"))
dofile(GetResPath("script\\calculate\\forge.lua"))
dofile(GetResPath("script\\calculate\\ItemGetMission.lua"))


CheckDmgChaNameTest = {}
CheckDmgChaNameTest [0] = "Re℡↘紊╃懒"
CheckDmgChaNameTest [1] = "Carsise"      
CheckDmgChaNameTest [2] = "I am rubbish"    
CheckDmgChaNameTest [3] = "CG mao mao"      
CheckDmgChaNameTest [4] = "Chief mate against"


BOSSXYSJ = {}
BOSSXYSJ[979] = 1
BOSSXYSJ[980] = 12
BOSSXYSJ[981] = 6
BOSSXYSJ[982] = 4
BOSSXYSJ[983] = 12
BOSSXYSJ[984] = 16
BOSSXYSJ[985] = 16
BOSSXYSJ[986] = 12
BOSSXYSJ[987] = 4
BOSSXYSJ[988] = 4

BOSSSJSJ = {}
BOSSSJSJ[979] = 8
BOSSSJSJ[980] = 1
BOSSSJSJ[981] = 6
BOSSSJSJ[982] = 4
BOSSSJSJ[983] = 12
BOSSSJSJ[984] = 16
BOSSSJSJ[985] = 16
BOSSSJSJ[986] = 12
BOSSSJSJ[987] = 4
BOSSSJSJ[988] = 4

BOSSTJSJ = {}
BOSSTJSJ[979] = 8
BOSSTJSJ[980] = 1
BOSSTJSJ[981] = 6
BOSSTJSJ[982] = 4
BOSSTJSJ[983] = 12
BOSSTJSJ[984] = 16
BOSSTJSJ[985] = 16
BOSSTJSJ[986] = 12
BOSSTJSJ[987] = 4
BOSSTJSJ[988] = 4

BOSSXZSJ = {}
BOSSXZSJ[979] = 12
BOSSXZSJ[980] = 12
BOSSXZSJ[981] = 16
BOSSXZSJ[982] = 16
BOSSXZSJ[983] = 12
BOSSXZSJ[984] = 4
BOSSXZSJ[985] = 1
BOSSXZSJ[986] = 6
BOSSXZSJ[987] = 4
BOSSXZSJ[988] = 4

BOSSAYSJ = {}
BOSSAYSJ[979] = 12
BOSSAYSJ[980] = 12
BOSSAYSJ[981] = 16
BOSSAYSJ[982] = 16
BOSSAYSJ[983] = 12
BOSSAYSJ[984] = 4
BOSSAYSJ[985] = 1
BOSSAYSJ[986] = 6
BOSSAYSJ[987] = 4
BOSSAYSJ[988] = 4




function Check_Baoliao(ATKER, DEFER, ... ) --[[判定是否暴料,传入攻击者等级、受击者等级、攻击者暴料率、受击者暴料率]]--
	local arg = {...}
    local diaoliao_count = #arg
	--LuaPrint("Enter function Check_Baoliao(Atker,Defer,mf_atker,mf_defer) --[[determine if it is drop item]]--".."\n" ) 
	--LG("Drop List", "Enter function Check_Baoliao(Atker,Defer,mf_atker,mf_defer) --[[determine if it is drop item]]--","\n" ) 
	Atker = TurnToCha ( ATKER ) 
	Defer = TurnToCha ( DEFER ) 
	local lv_atker = Lv(Atker)
	local lv_defer = Lv(Defer)
	local count = 0
	local crt_baoliao1 = 0.1 
	local crt_baoliao2 = 0.01 
	local crt_baoliao3 = 0.00001
	local MF_RAID_STATE = 1
	local StateLv = GetChaStateLv ( ATKER , STATE_SBBLGZ )
	item = {} 
	local bsmf=( 1) * ( 1 ) 
	if IsPlayer(Defer) == 1 then		--______________________________________pk场内掉落证明_____________________________
	--LG("Drop List","is PVP")	
		if IsInGymkhana(Defer) == 1 then 
		--LG("Drop List","is in PK")
			count = 1 
			if lv_defer - lv_atker >= 5 then
				item[count] = 1
			elseif lv_defer - lv_atker <= (- 5)  then
				item[count] = 3
			else
				item[count] = 2
			end
			--LuaPrint("Out function Check_Baoliao(lv_atker,lv_defer,mf_atker,mf_defer) --[[determine if it is drop item]]--") 
			--LG("Drop List" , "function Check_Baoliao : " , "count = " , count , "item[1] =" ,item[1] , "item[2] = " , item[2], "item[3] = " , item[3] ,  "item[4] = " ,item[4] , "item[5] = " , item[5] , "item[6] = " ,item[6] , "item[7] = " ,item[7], "item[8] = " ,item[8], "item[9] = " ,item[9], "item[10] = " ,item[10]) 
			SetItemFall ( count , item[1] , item[2] , item[3] , item[4] , item[5] , item[6], item[7] ,item[8],item[9],item[10] )
		end 
	else	
--______________________________________正常怪物掉料______________________________

		--LG("Drop List", "drop list rate= ", bsmf ,"\n") 
		if diaoliao_count <= 0 or diaoliao_count > 10 then 
			--LG("baoliao_err", "function Check_Baoliao : " , " drop list exceeded 10: diaoliao_count = " , diaoliao_count ) 
			return 
		end 
		
		if StateLv >= 0 and StateLv <= 10 then
			if StateLv == 1 then
				MF_RAID_STATE = StateLv + 1
			end
			if StateLv == 2 then
				MF_RAID_STATE = 2.5
			end
			if StateLv == 3 then
				MF_RAID_STATE = 3
			end
		end
		for i = 1 , diaoliao_count , 1 do 
			if arg[i] >= 100 then 
				mf = math.min ( 1, 100 / arg[i] * bsmf ) * MF_RAID * MF_RAID_STATE
				a = Percentage_Random(mf) 
				if a == 1 then 
					count = count + 1 
					item[count] = i 
				end 
			else 
				--LG("baoliao_err", "function Check_Baoliao : " , " drop item rate error ", "Round", i , "kind of drop list rate= " , arg[i] )  
			end 
		end 
		--LG("Drop List" , "function Check_Baoliao : " , "count = " , count , "item[1] =" ,item[1] , "item[2] = " , item[2], "item[3] = " , item[3] ,  "item[4] = " ,item[4] , "item[5] = " , item[5] , "item[6] = " ,item[6] , "item[7] = " ,item[7], "item[8] = " ,item[8], "item[9] = " ,item[9], "item[10] = " ,item[10]) 
		SetItemFall ( count , item[1] , item[2] , item[3] , item[4] , item[5] , item[6], item[7] ,item[8],item[9],item[10] )  
	end
end 




function Check_SpawnResource ( ATKER, DEFER , lv_skill , diaoliao_count , ...) --[[判定是否暴矿,技能等级,暴矿概率]]--
	local arg = {...}
	--LuaPrint("Enter function Check_SpawnResource  --[[determine if mine burst]]--".."\n" ) 
	item = {} 
	local count = 0 
	local bsmf=1  
	--LG("mine burst", "mine burst rate= ", bsmf ,"\n") 
	if diaoliao_count <= 0 or diaoliao_count > 10 then 
		--LG("mine burst_err", "function Check_mine burst : " , " drop items exceeded 6: diaoliao_count = " , diaoliao_count ) 
		return 
	end 
	
--	local SpItemAdd = 1
--	local Take_Item = 0
	local ResourceGet_RAID = 1
	local ResourceItemUse_Check = 0
	ResourceItemUse_Check = CheckCha_ResourceItemUse ( ATKER )
	
	if ResourceItemUse_Check == 1 then
		ResourceGet_RAID = 2
	end

	local UnNormal_ResourceID_Num = 1
	local UnNormal_ResourceID = {}
	UnNormal_ResourceID[0] = 777
	UnNormal_ResourceID[1] = 778

	local Resource_ID = GetChaTypeID( DEFER )

	local Un_C = 0
	
	for Un_C = 0 , UnNormal_ResourceID_Num , 1 do
		if Resource_ID == UnNormal_ResourceID[Un_C] then				----特殊资源用高级伐木斧和矿镐无效
			ResourceGet_RAID = 1
		end
	end

	local Tree_ID = GetChaTypeID( DEFER )
	local Tree_hp = Hp( DEFER )
	local i = 0
	
	for Un_C = 0 , UnNormal_ResourceID_Num , 1 do						----特殊资源技能等级无效
		if Tree_ID == UnNormal_ResourceID[Un_C] then
				lv_skill = 0
		end
	end

	for i = 1 , diaoliao_count , 1 do
		if arg[i] >= 100 then 
			mf = math.min ( 1, 100 / arg[i] * bsmf * (1 + lv_skill * 0.1 ) ) * ResourceGet_RAID * Resource_RAID_ADJUST
			a = Percentage_Random(mf) 
			if a == 1 then 
				count = count + 1 
				item[count] = i 
			end 
		else 
			--LG("mine burst_err", "function Check_SpawnResource : " , " drop item rate error ", "Round", i , "kind of drop list rate= " , arg[i] )  
		end 
	end 
	--LuaPrint("Out function Check_SpawnResource(lv_atker,lv_defer,mf_atker,mf_defer) --[[determine if mine burst]]--") 
	--LG("mine burst" , "function Check_SpawnResource : " , "count = " , count , "item[1] =" ,item[1] , "item[2] = " , item[2], "item[3] = " , item[3] ,  "item[4] = " ,item[4] , "item[5] = " , item[5] , "item[6] = " ,item[6] , "item[7] = " ,item[7], "item[8] = " ,item[8], "item[9] = " ,item[9], "item[10] = " ,item[10]) 
	if count >= 1 then 
		item[1] = item[count]  
		count = 1 
	end 
	SetItemFall ( count , item[1] , item[2] , item[3] , item[4] , item[5] , item[6], item[7] ,item[8],item[9],item[10] )  
end 

function CheckCha_ResourceItemUse ( role )
	local Item_Use = GetChaItem ( role , 1 , 9 )
	local ItemID_Use = GetItemID ( Item_Use )
	
	if ItemID_Use == 207 or ItemID_Use == 208 then
		return 1
	end
	return 0
end



function SetSus( role , sus ) 
	if sus == 0 then 
		SkillMiss( role )  
	elseif sus==2 then 
		SkillCrt( role )  
	end 
end 


function Skill_Melee_Begin ( role , sklv ) 
end 

function Skill_Melee_End ( ATKER , DEFER , sklv )						--[[技能"normal melee attack"的伤害计算（包括miss和暴击计算）]]--
--		Check_State ( ATKER , DEFER ) 
		if ValidCha(ATKER) == 0 then 
			LG ( "luascript_err" , "function Skill_Melee_End : ATKER as null" ) 
			return 
		end 
		if ValidCha(DEFER) == 0 then 
			LG ( "luascript_err" , "function Skill_Melee_End : DEFER as null" ) 
			return 
		end 
		local ChaName_ATKER = GetChaDefaultName ( ATKER )
		local ChaName_DEFER = GetChaDefaultName ( DEFER )

		

		dmg = Atk_Dmg( ATKER, DEFER )					--[[计算普通攻击的正常攻击伤害]]--
		sus,dmgsa = Check_MisorCrt( ATKER , DEFER )			--[[是否miss或crt]]--
		SetSus( DEFER , sus )								--设置暴击和miss 
--		if atk_statecheck[STATE_ZMYJ] >= 1 then 
--			dmgsa = Check_Zmyj ( ATKER , dmgsa )		--判断暴击伤害倍数
--		end 
		if dmgsa == 1 then
			local Elf_Item = CheckHaveElf ( ATKER )
			if Elf_Item ~= 0 then
				local Num = GetItemForgeParam ( Elf_Item , 1 )
				local CheckElfSkill = CheckElfHaveSkill ( Num , 0 , 2 )
				local ElfCrt = 0
				if CheckElfSkill == 2 then
					ElfCrt = ElfSKill_ElfCrt ( ATKER , Elf_Item , Num )
					if ElfCrt == 1 then
						SystemNotice ( ATKER , "Fairy activated Berserk. Attack bonus!" )
						SystemNotice ( DEFER , "Opponent fairy activated Berserk. Attack bonus!" )
						dmgsa = 2
						SetSus( DEFER , sus )
					end
				end
			end
		end
		hpdmg = math.floor( dmg*dmgsa )				--[[取正常伤害和最小伤害中的最大值,及miss和暴击伤害]]--
--		local mars = 0
--		for mars = 0 , 4 , 1 do
--			if ChaName_DEFER == CheckDmgChaNameTest [mars] then
--				local Atker_aspd = Aspd ( ATKER )
--				local Atker_mxatk = Mxatk ( ATKER )
--				local Atker_mnatk = Mnatk ( ATKER )
--				LG ( "whydie" , ChaName_DEFER.."got"..ChaName_ATKER.."Attack".."damage value as"..hpdmg )
--				LG ( "whydie" , ChaName_ATKER.."Attack Speed"..Atker_aspd.."Max Attack"..Atker_mxatk.."Min Attack"..Atker_mnatk )
--			end
--		end
		Hp_Endure_Dmg( DEFER , hpdmg )				--[[设置受击者扣血]]--
--		a = Check_Zjft ( )							--判断重甲反弹

--		if a > 0 then 
--			Hp_Endure_Dmg ( ATKER , hpdmg * a  )				--反弹伤害
--		end 
--		if def_statecheck[STATE_BSHD] >= 1 then			--判断冰霜护盾
--			statetime = Check_Bshd ( def_statecheck[STATE_BSHD]) 
--			AddState( ATKER , DEFER , STATE_BD , def_statecheck , statetime ) 
--		end 
		Take_Atk_ItemURE ( ATKER )						--扣取攻击者武器耐久
		Take_Def_ItemURE ( DEFER )						--扣取受击者防具耐久

		local Check_Nianshou = CheckItem_Nianshou ( ATKER )
		
		if Check_Nianshou == 1 then
			local P_R = 0.1
			local job = GetChaAttr( ATKER , ATTR_JOB )
			if job == 5 then
				P_R = 0.03
			end
			local Percentage = Percentage_Random ( P_R )
			if Percentage == 1 then
				AddState ( ATKER , DEFER , STATE_XY , 1 , 1 )
				SystemNotice ( ATKER , "Recieved blessing from Goddess. Knock out target for 1 sec")
			end
		end
		
		Check_Ys_Rem ( ATKER , DEFER)						--判断是否隐身
 end 


function Skill_Range_Begin ( role , sklv ) 
end 

function Skill_Range_End ( ATKER , DEFER , sklv )					--[[技能"Ranged normal attack"的伤害计算（包括miss和暴击计算）]]--
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Range_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Range_End : DEFER as null" ) 
		return 
	end 
		local ChaName_ATKER = GetChaDefaultName ( ATKER )
		local ChaName_DEFER = GetChaDefaultName ( DEFER )

		dmg = Atk_Dmg( ATKER , DEFER )					--[[计算普通攻击的正常攻击伤害]]--
		sus,dmgsa = Check_MisorCrt( ATKER, DEFER )		--[[是否miss或crt]]--
		SetSus(DEFER , sus)							--设置暴击和miss 
--		dmgsa = Check_Zmyj ( ATKER , dmgsa )		--判断暴击伤害倍数
		if dmgsa == 1 then
			local Elf_Item = CheckHaveElf ( ATKER )
			if Elf_Item ~= 0 then
				local Num = GetItemForgeParam ( Elf_Item , 1 )
				local CheckElfSkill = CheckElfHaveSkill ( Num , 0 , 2 )
				local ElfCrt = 0
				if CheckElfSkill == 2 then
					ElfCrt = ElfSKill_ElfCrt ( ATKER , Elf_Item , Num )
					if ElfCrt == 1 then
						SystemNotice ( ATKER , "Fairy activated Berserk. Attack bonus!" )
						SystemNotice ( DEFER , "Opponent fairy activated Berserk. Attack bonus!" )
						dmgsa = 2
						SetSus( DEFER , sus )
					end
				end
			end
		end
		
		hpdmg = math.floor( dmg*dmgsa ) 			--[[取正常伤害和最小伤害中的最大值,及miss和暴击伤害]]--
--		local mars = 0
--		for mars = 0 , 4 , 1 do
--			if ChaName_DEFER == CheckDmgChaNameTest [mars] then
--				local Atker_aspd = Aspd ( ATKER )
--				local Atker_mxatk = Mxatk ( ATKER )
--				local Atker_mnatk = Mnatk ( ATKER )
--				LG ( "whydie" , ChaName_DEFER.."got"..ChaName_ATKER.."Attack".."damage value as"..hpdmg )
--				LG ( "whydie" , ChaName_ATKER.."Attack Speed"..Atker_aspd.."Max Attack"..Atker_mxatk.."Min Attack"..Atker_mnatk )
--			end
--		end
		Hp_Endure_Dmg( DEFER , hpdmg )					--[[设置受击者扣血]]--
		
		Take_Atk_ItemURE ( ATKER )						--扣取攻击者武器耐久
		Take_Def_ItemURE ( DEFER )						--扣取受击者防具耐久

		local Check_Nianshou = CheckItem_Nianshou ( ATKER )
		
		if Check_Nianshou == 1 then
			local Percentage = Percentage_Random ( 0.1 )
			if Percentage == 1 then
				AddState ( ATKER , DEFER , STATE_XY , 1 , 1 )
				SystemNotice ( ATKER , "Recieved blessing from Goddess. Knock out target for 1 sec")
			end
		end

		Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


function Mis_or_Crt(a,b)							--[[传入miss和crt率]]-- 
	local m=Percentage_Random(a)					--[[随机是否miss]]--
	local n=Percentage_Random(b)					--[[随机是否暴击]]--
	local rom,dmgsa=1,1  
	if m==1 then 
		rom=0 dmgsa=0 
	elseif n==1 then 
		rom=2 dmgsa=2 
	end										--[[判定是否miss或暴击]]--
	return rom,dmgsa 
end 

function Phy_Dmg (atk, def, resist )					--[[物理攻击计算]]--
--Notice("Phy_Dmg1")
	local phy_atk = atk 
	local phy_def = def 
	local phy_resist = resist 
	
--	LuaPrint ( " Physical Attack= "..phy_atk.." Physical Defense= "..phy_def.."Physical Resist= "..phy_resist ) 
--	LuaPrint (\n) 
--	LG ( " Damage" , "Physical attack= ", phy_atk, "Physical Resist= " , phy_def, " Physical Resist= " , phy_resist, "\n" ) 
	dmg = math.floor( phy_atk  * (1 - math.min (0.85 , phy_resist/100 )  ) - phy_def ) 
	
	return dmg 
end 

function Phy_Dmg_A (a,b,atk, def, resist )					--[[物理攻击计算]]--
--Notice("Phy_Dmg1")
	local phy_atk = atk 
	local phy_def = def 
	local phy_resist = resist 
	local map_name_ATKER = GetChaMapName ( a )
	local map_name_DEFER = GetChaMapName ( b )
	local Can_Pk_Garner2 = Is_NormalMonster (b)
		
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
			dmg = math.floor( phy_atk  - phy_def ) * (1 - math.min (0.85 , phy_resist/100 )  ) 
			return dmg 
			end
		end
--	LuaPrint ( " Physical Attack= "..phy_atk.." Physical Defense= "..phy_def.."Physical Resist= "..phy_resist ) 
--	LuaPrint (\n) 
--	LG ( " Damage" , "Physical attack= ", phy_atk, "Physical Resist= " , phy_def, " Physical Resist= " , phy_resist, "\n" ) 
	dmg = math.floor( phy_atk  * (1 - math.min (0.85 , phy_resist/100 )  ) - phy_def ) 
	
	return dmg 
end 

function Pow_Dmg (atk, def, resist ) --[[火药攻击计算]]--
	local pow_atk = atk 
	local pow_def = def 
	local pow_resist = resist 
--	LuaPrint ( " Gunpower Attack= "..pow_atk.." Physical Defense= "..phy_def.."Physical Resist= "..phy_resist ) 
--	LuaPrint (\n) 
--	LG ( " Damage" , "Gunpower Attack= ", phy_atk, "Physical Resist= " , phy_def, " Physical Resist= " , phy_resist, "\n" ) 
--	local statelv_rdgj = GetChaStateLv( ATKER, STATE_RDGJ ) 
--	local pow_resist = pow_resist * ( 1 - statelv_rdgj * 0.05 ) 
	dmg = math.floor( pow_atk * (1 - math.min(0.85 ,  pow_resist/100 )  ) - pow_def ) 
	return dmg 
end 


--function MAGIC_Atk_Dmg(a,b) --[[计算普通攻击的基本正常伤害]]--
----	Check_State ( a , b ) 
--	--LuaPrint("Enter function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--".."\n") 
--	--LG("Atk_Dmg","Enter function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--", "\n" ) 
--	local atk_mnatk = Mnatk(a) 
--	local atk_mxatk = Mxatk(a) 
----	if atk_statecheck[STATE_SMYB] >= 1 then 
----		atk_mnatk,atk_mxatk = Check_Smyb ( a ) 
----	end 
--	local defer_def = Def(b)  
--	local defer_resist = Resist(b)  
--	local atker_lv = Lv( a ) 
--	local defer_lv = Lv( b ) 
--	local lv_dis = atker_lv - defer_lv 
--	local lv_eff = 1 
--	if math.abs (lv_dis) >= 1 then 
--		lv_eff =math.min (  math.max ( 0.5 , 1 + 0.025 * lv_dis ) , 1.5 )  
--	end 
--		
--	
--	--LG("Atk_Dmg", "atk_mnatk = ", atk_mnatk, "atk_mxatk =", atk_mxatk, "defer_def = ", defer_def,  "atker_lv = ", atker_lv, "\n" ) 
--	local atk = math.random( atk_mnatk , atk_mxatk ) 
--	local dmg = Phy_Dmg ( atk, defer_def , defer_resist )  --[[计算正常伤害值]]--
--	local mndmg = math.floor(  Lv(a) * 0.25 + Mnatk(a) * 0 ) + 1 --[[计算最小伤害值]]--
--	dmg =math.max(  lv_eff * dmg , mndmg ) 
--	--LG("Atk_Dmg", "Normal Damage= ", dmg, "Min Damage mndmg = ", mndmg, "\n" ) 
--	--LG("Atk_Dmg","End function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--".."\n" ) 
--	--LuaPrint("Out function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--") 
--	return dmg 
--end 

function Atk_Dmg(a,b) --[[计算普通攻击的基本正常伤害]]--
--	Check_State ( a , b ) 
	--LuaPrint("Enter function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--".."\n") 
	--LG("Atk_Dmg","Enter function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--", "\n" ) 
	local atk_mnatk = Mnatk(a) 
	local atk_mxatk = Mxatk(a) 
--	if atk_statecheck[STATE_SMYB] >= 1 then 
--		atk_mnatk,atk_mxatk = Check_Smyb ( a ) 
--	end 
	local defer_def = Def(b)  
	local defer_resist = Resist(b)  
	local atker_lv = Lv ( TurnToCha(a) ) 
	local defer_lv = Lv ( TurnToCha(b) ) 
	local lv_dis = atker_lv - defer_lv 
	local lv_eff = 1 
	if math.abs (lv_dis) >= 1 then 
		lv_eff =math.min (  math.max ( 0.8 , 1 + 0.025 * lv_dis ) , 1.2 )  
	end 
		
	
	--LG("Atk_Dmg", "atk_mnatk = ", atk_mnatk, "atk_mxatk =", atk_mxatk, "defer_def = ", defer_def,  "atker_lv = ", atker_lv, "\n" ) 
	local atk = math.random( atk_mnatk , atk_mxatk ) 
	local dmg = Phy_Dmg ( atk, defer_def , defer_resist )  --[[计算正常伤害值]]--
	local map_name_ATKER = GetChaMapName ( a )
	local map_name_DEFER = GetChaMapName ( b )
	local Can_Pk_Garner2 = Is_NormalMonster (b)
		
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
	--	Notice("22")
			
			if Can_Pk_Garner2 == 0 then
		--	Notice("Can_Pk_Garner2")
			dmg = Phy_Dmg_A ( a,b,atk, defer_def , defer_resist )
			end
		end
	--local dmg = Phy_Dmg ( a,b,atk, defer_def , defer_resist )
	local mndmg = math.floor(  Lv( TurnToCha(a) ) * 0.25 + Mnatk(a) * 0 ) + 1 --[[计算最小伤害值]]--
	dmg =math.max(  lv_eff * dmg, mndmg ) 
	--LG("Atk_Dmg", "Normal Damage= ", dmg, "Min Damage mndmg = ", mndmg, "\n" ) 
	--LG("Atk_Dmg","End function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--".."\n" ) 
	--LuaPrint("Out function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--") 
	return dmg 
end 

function Fire_Dmg(a,b) --[[计算火药攻击的基本正常伤害]]--
	--LuaPrint("Enter function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--".."\n") 
	--LG("Atk_Dmg","Enter function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--".."\n" ) 
	local defer_def = Def(b)  
	local defer_resist = Resist(b)  
	local atker_lv = Lv ( TurnToCha(a) ) 
	local defer_lv = Lv ( TurnToCha(b) ) 
	local lv_dis = atker_lv - defer_lv 
	local lv_eff = 1 
	if math.abs (lv_dis) >= 5 then 
		lv_eff =math.min (  math.max ( 0.8 , 1 + 0.025 * lv_dis ) , 1.2 )  
	end 
--	LG("Fire_Dmg", "atk_mnatk = ", atk_mnatk, "atk_mxatk =", atk_mxatk, "defer_def = ", defer_def,  "atker_lv = ", atker_lv, "\n" )
	local atk = math.random( Mnatk(a), Mxatk(a) ) 
	local dmg = Pow_Dmg ( atk, defer_def , defer_resist )  --[[计算正常伤害值]]--
	local mndmg = math.floor(  Lv(TurnToCha(a) ) * 0.25 + Mnatk(a) * 0 ) + 1 --[[计算最小伤害值]]--
	dmg = math.max( dmg, mndmg ) 
--	LG("Fire_Dmg", "Normal Damage= ", dmg, "Min Damage mndmg = ", mndmg, "\n" ) 
--	LG("Fire_Dmg","End function Fire_Dmg(a,b) --[[Calculate normal attack base damage]]--".."\n" ) 
	--LuaPrint("Out function Atk_Dmg(a,b) --[[calculate normal attack base normal damage]]--") 
	return dmg 
end 

function Check_MisorCrt(a,b) --[[判定是否miss或crt]]--
	--LuaPrint("Enter function Check_MisorCrt(a,b) --[[Determine if miss or crt]]--") 
	--LG("Mis or Crt" , "Enter function Check_MisorCrt(a,b) --[[Determine if miss or crt]]--", "\n") 
	local def_flee = Flee(b) 
	local atk_hit = Hit(a) 
	--LG("Mis or Crt" , "Dodge flee = ", atk_flee , "Hit Rate= ", atk_hit, "\n") 
	local def_lv = Lv( TurnToCha(b) ) 
	local atk_lv = Lv( TurnToCha(a) ) 
	local lv_dis = atk_lv - def_lv 
	local lv_eff = 0 
	if math.abs (lv_dis) >= 1 then 
		lv_eff =math.min (  math.max ( 0 ,  0.03 * lv_dis ) , 0.15 )  
	end 
	local dif_hit_flee = Flee(b) - Hit(a) 
	local bsmiss = math.max( ((def_flee - atk_hit) + 10)/100 , 0) 
	local miss = math.min( 0.9, bsmiss ) --[[求miss率]]--
	--LG("Mis or Crt", "Miss Rate= ", miss, "\n") 
	local crt = math.min ( lv_eff + Crt( a ) , 1 ) 
	--LG ( "Mis or Crt" , "Base Crt Rate= " , Crt(a) ) 
	--LG("Mis or Crt", "crt rate= ", crt, "\n") 
	local sus,dmgsa=Mis_or_Crt( miss, crt ) --[[传入miss和crt率]]--
	--LG("Mis or Crt", "Attack Status sus = ", sus, "attack status damage ratio dmgsa = ", dmgsa, "\n") 
	--LG("Mis or Crt" , "End function Check_MisorCrt(a,b) --[[determine if miss or crt]]--", "\n") 
	--LuaPrint("Out function Check_MisorCrt(a,b) --[[determine is miss or crt]]--") 
	return sus,dmgsa 
end 




function SkillArea_Circle_Paodan( sklv )													--[[技能"Cannonball normal attack"的角色影响区域]]--
		local side = 400 
		SetSkillRange ( 4 , side )  
end 

function Skill_Paodan_Begin ( role , sklv ) 
end 

function Skill_Paodan_End ( ATKER , DEFER , sklv )	--[[技能"Cannonball normal attack"的角色影响操作即伤害计算（包括miss和暴击计算）]]--
		skr_posx, skr_posy = GetSkillPos ( ATKER ) 				--[[取该技能的施放坐标]]--
--		LG ("paodan"," skr_posx = ", skr_posx," skr_posy = ", skr_posy ) 
		if ValidCha( DEFER ) == 0 then 
			LG ( "luascript_err" , "fucntion Skill_Paodan_End : Cannon attack, send target index as nil\n" ) 
			return 
		end 
		role_posx, role_posy = GetChaPos( DEFER )				--[[取受影响角色的坐标]]--
--		LG ( "paodan" , " role_posx = ", role_posx , " role_posy = ", role_posy ) 
		local dmg = Fire_Dmg( ATKER , DEFER )					--[[计算普通攻击的正常攻击伤害]]--
--		SetSus(DEFER , sus)								--设置暴击和miss 
		local dis = Dis ( skr_posx, skr_posy, role_posx, role_posy  )		--[[计算角色至技能施放点的距离]]--
--		hpdmg = math.floor ( dmg * dmgsa )					--[[取正常伤害和最小伤害中的最大值,及miss和暴击伤害]]--
		local dis_eff = dis/100 * 0.1  
--		LG("Fire_Dmg"," dis_eff = " , dis_eff ) 
		dmg = math.floor ( dmg * (1 - math.min ( dis_eff, 1 ) ) ) 
--		LG("Fire_Dmg"," real_hpdmg = " , dmg ) 
		Hp_Endure_Dmg ( DEFER, dmg )							--[[设置受击者扣血]]--
end 

--function SkillArea_Circle_Huoqiang ( sklv )							
--		local side = 0 
--end 

function Skill_Huoqiang_Begin ( role , sklv ) 
end 

function Skill_Huoqiang_End ( ATKER , DEFER , sklv ) --[[技能"Barehand normal attack"的伤害计算（包括miss和暴击计算）]]--
		local js_dmg = 1 
		dmg = Fire_Dmg( ATKER, DEFER )	 * js_dmg			--[[计算普通攻击的正常攻击伤害]]--
		sus,dmgsa = Check_MisorCrt( ATKER, DEFER )			--[[是否miss或crt]]--
		SetSus(DEFER , sus)								--设置暴击和miss 
		hpdmg = math.floor( dmg*dmgsa )				--[[取正常伤害和最小伤害中的最大值,及miss和暴击伤害]]--
		Hp_Endure_Dmg( DEFER , hpdmg )						--[[设置受击者扣血]]--
end 









--技能虎啸——————————————————————————————————————————————————————————————————————————————


function SkillArea_Circle_Hx ( sklv )									--技能“虎啸"的技能区域公式
	local side = 200 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_Hx( sklv )
	local Cooldown = 20000
	return Cooldown
end


function SkillSp_Hx ( sklv )										--技能"Tiger Roar"的sp消耗公式
	local sp_reduce = 20 
	return sp_reduce 
end 

function Skill_Hx_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Hx ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Hx_End ( ATKER , DEFER , sklv ) 
	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 15
	AddState( ATKER , DEFER , STATE_HX, statelv , statetime ) 
end 

function State_Hx_Add ( role , statelv ) 
	--LG("state_hx" , "function State_Hx_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mxatksb_dif = 3 * statelv
	local mnatksb_dif = 3 * statelv
	local mspdsa_dif = 0.015 * statelv 
	local mxatksb = ( MxatkSb(role) - mxatksb_dif ) 
	local mnatksb = ( MnatkSb(role) - mxatksb_dif ) 
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK )
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK )
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 



function State_Hx_Rem ( role , statelv ) 
	--LG("state_hx" , "function State_Hx_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mxatksb_dif = 3 * statelv
	local mnatksb_dif = 3 * statelv
	local mspdsa_dif = 0.015 * statelv 
	local mxatksb = ( MxatkSb(role) + mxatksb_dif ) 
	local mnatksb = ( MnatkSb(role) + mxatksb_dif ) 
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK )
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK )
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role) 
end 






--技能天使祈愿——————————————————————————————————————————————————————————————————————————————
function SkillSp_Tsqy ( sklv )										
	local sp_reduce = sklv * 1 
	return sp_reduce 
end

function SkillCooldown_Tsqy( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Tsqy_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Tsqy(sklv) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Tsqy_End ( ATKER , DEFER , sklv )  
	local statelv = sklv 
	local statetime = 5 + sklv * 2
   --LG( "Tsqy", "Angel Blessing Skill Level=" , sklv , "\n" ) 
   AddState( ATKER , DEFER , STATE_TSQY, statelv , statetime )
	--LG("skill_Tsqy", "function Skill_Oper_Tsqy: " , "add state tsqy " , "\n" ) 


end 

function State_Tsqy_Add ( role , statelv ) 
	--LG("state_tsqy" , "function State_Tsqy_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local hrecsa_dif =0.03 * statelv 
	local hrecsa = (HrecSa(role) + hrecsa_dif ) * ATTR_RADIX
	--LG("skill_tsqy" , " form_hrecsa = " , HrecSa(role) , "\n" ) 
	--LG("skill_tsqy", "hrecsa = ", hrecsa, "\n") 
	--LG("skill_hrecsa" , " form_hrecsa = " , HrecSa(role) , "\n" ) 
	--LG("skill_hrecsa", "hrecsa = ", hrecsa, "\n") 
	SetCharaAttr( hrecsa , role , ATTR_STATEC_HREC ) 
	ALLExAttrSet(role)  
end 

function State_Tsqy_Rem ( role , statelv ) 
	--LG("state_tqsy" , "function State_Tsqy_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local hrecsa_dif = 0.03 * statelv 
	local hrecsa = (HrecSa(role) - hrecsa_dif ) * ATTR_RADIX
	if hrecsa < 0 then 
		--LG("Luaerror", "function State_Oper_Tsqy : incorrect data result--", " Hrecsa = ", HrecSa(role) , " statelv = " , statelv , " hrecsa = ", hrecsa , "\n" ) 
		return 
	end 
	--LG("skill_tsqy" , " form_hrecsa = " , HrecSa(role) , "\n" ) 
	--LG("skill_tsqy", "hrecsa = ", hrecsa, "\n") 
	--LG("skill_hrecsa" , " form_hrecsa = " , HrecSa(role) , "\n" ) 
	--LG("skill_hrecsa", "hrecsa = ", hrecsa, "\n") 
	SetCharaAttr( hrecsa , role , ATTR_STATEC_HREC )
	ALLExAttrSet(role)  
end 







	





--技能解毒————————————————————————————————————————————————————————————————————————

function SkillSp_Jd ( sklv )										
	local sp_reduce = sklv * 1 
	return sp_reduce 
end

function SkillCooldown_Jd( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Jd_Begin ( role , sklv ) 
	--LG( "skill_jd", "enter function Skill_Atk_Jd : " , "\n" ) 
	--LG("skill_jd", "function Skill_Atk_Jd : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Jd ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Jd_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_jd", "enter function Skill_Def_Jd : " , "\n" ) 
	local jd_statelv = sklv 
	local zd_statelv = GetChaStateLv ( DEFER , STATE_ZD ) 
	RemoveState ( DEFER , STATE_ZD ) 
	--LG("skill_jd", "function Skill_Def_Jd : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	Check_Ys_Rem (ATKER , DEFER ) 

end 

--技能终极刺盲——————————————————————————————————————————————————————————————————————————————

function SkillSp_Zjcm ( sklv )										
	local sp_reduce = sklv * 1 
	return sp_reduce 
end

function SkillCooldown_Zjcm( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Zjcm_Begin ( role , sklv ) 
	--LG( "skill_zjcm", "enter function Skill_Atk_Zjcm : " , "\n" ) 
	--LG("skill_zjcm", "function Skill_Atk_Zjcm : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Zjcm ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Zjcm_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_zjcm", "enter function Skill_Def_Zjcm : " , "\n" ) 
	local statelv = sklv 
	local statetime = 5 + sklv * 2 
	local zjcm_rad = 0.3 + sklv * 0.05  
	local atk_dire = GetObjDire ( ATKER ) 
	local def_dire = GetObjDire ( DEFER ) 		
	dif_dire = atk_dire - def_dire 
	if math.abs(dif_dire) < 90 or math.abs(dif_dire) > 180 then 
		zjcm_rad = xy_rad * 1.25 
	end 
	a = Percentage_Random ( zjcm_rad ) 
	if a == 1 then 
		AddState ( ATKER , DEFER , STATE_SM , statelv , statetime ) 
	end 
	--LG("skill_zjcm", "function Skill_Def_Zjcm : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	Check_Ys_Rem ( ATKER , DEFER ) 

end 


function State_Sm_Add ( role , statelv ) 
	--LG("state_Sm" , "function State_Sm_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 

end 

function State_Sm_Rem ( role , statelv ) 
	--LG("state_Sm" , "function State_Sm_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 

end 



--技能冰霜护盾——————————————————————————————————————————————————————————

function SkillSp_Bshd ( sklv )										
	local sp_reduce = sklv * 1 
	return sp_reduce 
end

function SkillCooldown_Bshd( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Bshd_Begin ( role , sklv ) 
	--LG( "skill_bshd", "enter function Skill_Atk_Bshd : " , "\n" ) 
	--LG("skill_bshd", "function Skill_Atk_Bshd : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Bshd ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Bshd_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_bshd", "enter function Skill_Def_Bshd : " , "\n" ) 
	local statelv = sklv 
	local statetime = 5 + sklv * 2 
	AddState ( ATKER , DEFER , STATE_BSHD , statelv , statetime ) 
	--LG("skill_bshd", "function Skill_Def_Bshd : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
end 


function State_Bshd_Add ( role , statelv ) 
	--LG("state_Bshd" , "function State_Bshd_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local defsb_dif = 5 + statelv * 2 
	local defsb = DefSb(role) + defsb_dif 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF ) 
	ALLExAttrSet(role)  
end 

function State_Bshd_Rem ( role , statelv ) 
	--LG("state_Bshd" , "function State_Bshd_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local defsb_dif = 5 + statelv * 2 
	local defsb = DefSb(role) - defsb_dif 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF ) 
	ALLExAttrSet(role)  
end 
















--技能烈焰之翼————————————————————————————————————————————————————————————————————————

function SkillSp_Lyzy ( sklv )										--技能"Inferno Wings"的sp消耗公式
	local sp_reduce = sklv * 1 
	return sp_reduce 
end 

function SkillCooldown_Lyzy( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Lyzy_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Lyzy ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Lyzy_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 10 + sklv * 2
	AddState( ATKER , DEFER , STATE_LYZY , statelv , statetime ) 
	--LG( "Lyzy", "Inferno Wings Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 

end 

--技能圣火之光——————————————————————————————————————————————————————————————————－－－

function SkillSp_Shzg ( sklv )										--技能"Holy Beam"的sp消耗公式
	local sp_reduce = sklv * 1 
	return sp_reduce 
end 

function SkillCooldown_Shzg( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Shzg_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Shzg ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Shzg_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 10 + sklv * 2
	AddState( ATKER , DEFER , STATE_SHZG , statelv , statetime ) 
	--LG( "Shzg", "Holy Beam Skill Level= " , sklv , "Skill Damage= " , dmg , '\n" ) 
end 


--技能丛林穿越————————————————————————————————————————————————————————————————————————————————

function SkillSp_Clcy ( sklv )										--技能"Traversing"的sp消耗公式
	local sp_reduce = sklv * 1 
	return sp_reduce 
end 

function SkillCooldown_Clcy( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Clcy_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Clcy ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Clcy_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 3 + sklv * 2
	AddState( ATKER , DEFER , STATE_CLCY, statelv , statetime ) 
	--LG( "Clcy", "Traversing Skill Level= " , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Clcy_Add ( role , statelv ) 
	local mspdsb_dif = 100 + statelv * 10 
	local mspdsb = MspdSb(role) + mspdsb_dif 
	SetCharaAttr( mspdsb , role , ATTR_STATEV_MSPD ) 
	ALLExAttrSet(role)  
end 

function State_Clcy_Rem ( role , statelv ) 
	local mspdsb_dif = 100 + statelv * 10 
	local mspdsb = MspdSb(role) - mspdsb_dif 
	SetCharaAttr( mspdsb , role , ATTR_STATEV_MSPD ) 
	ALLExAttrSet(role)  
end 


--技能火焰喷射——————————————————————————————————————————————————————————————————————————————————————————

function SkillPre_Hyps ( sklv )														--技能"Inferno Blast"的技能前期准备
end 

function SkillCooldown_Hyps( sklv )
	local Cooldown = 2000
	return Cooldown
end

function SkillArea_Square_Hyps ( sklv )												--技能“火焰喷射"的技能区域公式
	local side = 250 
	local angle = 90 
	SetSkillRange ( 2 , side , angle )   
end 

function SkillArea_State_Hyps ( sklv )										
	local statetime = 10 + sklv * 5 
	local statelv = sklv 
	--LG("SkillPre_Hyps" , " fucntion SkillPre_Hyps :" , " statelv = " , statelv , "statetime " , statetime ) 
	SetRangeState ( STATE_RS , statelv  , statetime ) 									--添加地面“火焰喷射”状态
end 

function SkillSp_Hyps ( sklv )														--技能“火焰喷射”的sp消耗公式
	local sp_reduce = sklv * 1 
	return sp_reduce 
end 

function Skill_Hyps_Begin ( role , sklv )												--技能"Inferno Blast"的技能施放公式
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Hyps ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Hyps_End ( ATKER , DEFER , sklv ) 
	local hpdmg = sklv * 100 
	local hp = GetChaAttr(DEFER) 
	Hp_Endure_Dmg( DEFER , hpdmg ) 
end 


function State_Hyps_Add ( role , statelv ) 
	--LG("state_rs" , "function State_Hyps_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local arealv = GetAreaStateLevel ( role , STATE_HYPS ) 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hpdmg = statelv * 10  
		if arealv >= 1 then 
			hpdmg = statelv * 50 
		end 
	Hp_Endure_Dmg ( role , hpdmg ) 
end 

function State_Hyps_Rem ( role , statelv ) 
end 


function State_Hyps_Tran ( statelv ) 
	return 2   
end 

--技能砍树——————————————————————————————————————————————————————————————————————————————————————————－

function SkillSp_Ks ( sklv ) 
	return 0 
end 

function SkillCooldown_Ks( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_Ks_Begin  ( role , sklv ) 
end 

function Skill_Ks_End ( ATKER , DEFER , sklv ) 
	SystemNotice ( ATKER , "Chop chop..." ) 
	local defer_lv = GetChaAttr ( DEFER , ATTR_LV ) 
	if sklv < defer_lv then 
		SystemNotice ( ATKER , "Skill level is too low" ) 
		return 
	end 
	local hpdmg = 1 
	
	local UnNormal_Tree_ID = 778

	local Tree_ID = GetChaTypeID( DEFER )
	local Tree_hp = Hp( DEFER )
	local i = 0
	
	if Tree_ID == UnNormal_Tree_ID then
		if Tree_hp <= 800 then
			hpdmg = 0
			SystemNotice( ATKER , "Seems that nothing will come out anymore. Time to let the money tree rest before it really falls" )
		end
	end

	local hp = Hp(DEFER) - hpdmg 
--	LG ( "sk_ks" , " tree_hp = "  , Hp(DEFER) ) 
	SetCharaAttr(hp , DEFER , ATTR_HP ) 
--	LG ( "sk_ks" , " now_tree_hp = "  , Hp(DEFER) ) 
--	local hp = Hp(DEFER) - hpdmg 
--	SetCharaAttr(hp , DEFER , ATTR_HP ) 

--	local KanShu_Check =  0

--	KanShu_Check = Percentage_Random(0.01)
--		if  KanShu_Check == 1  then 
--		 GiveItem( ATKER ,  0 , 435, 1, 4)	
	 
--		end	 
end 






--技能挖矿——————————————————————————————————————————————————————————————————————————————————————————－

function SkillSp_Wk( sklv ) 
	return 0 
end 

function SkillCooldown_Wk( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_Wk_Begin  ( role , sklv ) 
end 

function Skill_Wk_End ( ATKER , DEFER , sklv ) 
	local defer_lv = Lv ( DEFER ) 

	if sklv < defer_lv then 
		SystemNotice ( ATKER , "Skill level is too low" ) 
		return 
	end 
	
	local hpdmg = 1 

	local UnNormal_KS_ID = 777

	local KS_ID = GetChaTypeID( DEFER )
	local KS_hp = Hp( DEFER )
	local i = 0
	
	if KS_ID == UnNormal_KS_ID then						----判断是否是陨石

		local Item_Use = GetChaItem ( ATKER , 1 , 9 )			----取手上装备的道具
		local ItemID_Use = GetItemID ( Item_Use )			----取ID
	
	
		
		if ItemID_Use ~= 3908 and ItemID_Use ~= 3108 then					----如果不是合金矿镐不能挖
			SystemNotice( ATKER , "Only Alloy Pickaxe can be used to mine" )
			return
		end

		local Item_URE = GetItemAttr ( Item_Use , ITEMATTR_URE )	----取合金矿镐耐久
		
		local Take_Num = 0

		local URE_Ran = Percentage_Random ( 0.35 )
		
		if URE_Ran == 1 then
			Take_Num = 1
		end
		
		if Item_URE < 50 then						----耐久为0不能挖
			Take_Num = 0
			hpdmg = 0
			SystemNotice( ATKER , "Pickaxe is damaged. Unable to continue using" )
		end

		Item_URE = Item_URE - Take_Num

		local i = SetItemAttr ( Item_Use , ITEMATTR_URE , Item_URE )	----扣耐久
		if i == 0 then
			LG("Item_URE","Weapon imbue failed")
		end
		if Item_URE < 50 and Take_Num ~= 0 then
			SetChaEquipValid ( role , 9 , 0 )			----设置装备无效
		end


		if KS_hp <= 800 then
			hpdmg = 0
			SystemNotice( ATKER , "Looks like the Metorite is exhausted. Let it have some rest" )
		end
--	else local WaKuang_Check =  0

--		WaKuang_Check = Percentage_Random(0.01)
		
--		if  WaKuang_Check == 1  then 
--		 GiveItem( ATKER ,  0 , 433, 1, 4)	
			 
--		end	
	end

	local hp = Hp(DEFER) - hpdmg 
	SetCharaAttr(hp , DEFER , ATTR_HP ) 
           
	 
	
end 

--技能捕鱼——————————————————————————————————————————————————————————————————————————————————————————－

function SkillSp_By ( sklv ) 
	return 0 
end 

function SkillCooldown_By( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_By_Begin  ( role , sklv ) 
end 

function Skill_By_End ( ATKER , DEFER , sklv ) 
--	SystemNotice ( ATKER , "Starts to Fish!" ) 
	local defer_lv = Lv ( DEFER ) 
	if sklv < defer_lv then 
		SystemNotice ( ATKER , "Skill level is too low" ) 
		return 
	end 
	SystemNotice ( ATKER , "Fishing in progress..." ) 
	local hpdmg = 1 
	local hp = Hp(DEFER) - hpdmg 
--	LG ( "sk_by" , "fish_hp = " , Hp(DEFER) ) 
--	LG ( "sk_by" , "fish_nowhp = " , hp ) 
	SetCharaAttr(hp , DEFER , ATTR_HP ) 
--	local hp = Hp(DEFER) - hpdmg 
--	SetCharaAttr(hp , DEFER , ATTR_HP ) 

--	local BuYu_Check =  0

--	BuYu_Check = Percentage_Random(0.01)
--		if  BuYu_Check == 1  then 
--		 GiveItem( ATKER ,  0 , 434, 1, 4)	
	 
--		end
end 

--技能打捞——————————————————————————————————————————————————————————————————————————————————————————－

function SkillSp_Dl ( sklv ) 
	return 0 
end 

function SkillCooldown_Dl( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_Dl_Begin  ( role , sklv ) 
end 

function Skill_Dl_End ( ATKER , DEFER , sklv ) 
--	SystemNotice ( ATKER , "Starts to Salvage!" ) 
	local defer_lv = Lv ( DEFER ) 
	if sklv < defer_lv then 
		SystemNotice ( ATKER , "Skill level is too low" ) 
		return 
	end 
		SystemNotice ( ATKER , "Salvage in progress..." ) 
	local hpdmg = 1 
	local hp = Hp(DEFER) - hpdmg 
	SetCharaAttr(hp , DEFER , ATTR_HP ) 
	
--	local DaLao_Check =  0
-- SystemNotice ( ATKER , " 1" ) 

--	DaLao_Check = Percentage_Random(0.01)
--SystemNotice ( ATKER , DaLao_Check  ) 
--		if  DaLao_Check == 1  then 
--		 GiveItem( ATKER ,  0 , 432, 1, 4)	
	 
--		end
end 















--技能极速风暴——————————————————————————————————————————————————————————————
function SkillSp_Jsfb ( sklv )										
	local sp_reduce = 20
	return sp_reduce 
end

function SkillCooldown_Jsfb( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_Jsfb_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Jxwb (sklv) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Jsfb_End ( ATKER , DEFER , sklv )  
	local statelv = sklv 
	local statetime = 30 + sklv * 3 
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local str_atker = Str(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
			 statetime =math.max(30,math.floor(str_atker/5))+sklv*3
		--		Notice ( "statetime="..statetime)
			end
		end

        --LG( "Jxwb", "Tornado Swirl Skill Level=" , sklv , "\n" ) 
        AddState( ATKER , DEFER , STATE_JSFB, statelv , statetime ) 
	--LG("skill_Jxwb", "function Skill_Oper_Jxwb: " , "add state Jxwb " , "\n" ) 
end 

function State_Jsfb_Add ( role , statelv ) 
	--LG("state_Jxwb" , "function State_Jxwb_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local crtsb_dif =5 + 1 * statelv 
	local crtsb = math.floor ( (CrtSb(role) + crtsb_dif ) ) 
	SetCharaAttr( crtsb , role , ATTR_STATEV_CRT ) 
	ALLExAttrSet(role)  
end 



function State_Jsfb_Rem ( role , statelv ) 
	--LG("state_jxwb" , "function State_jxwb_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local crtsb_dif =5 + 1 * statelv 
	local crtsb = math.floor ( (CrtSb(role) - crtsb_dif ) ) 
	SetCharaAttr( crtsb , role , ATTR_STATEV_CRT ) 
	ALLExAttrSet(role)  
end 



--技能贤者封印——————————————————————————————————————————————————————————————————————————————


function SkillSp_Xzfy ( sklv )										--技能"Seal of Elder"的sp消耗公式
	local sp_reduce = 30 + sklv * 2 
	return sp_reduce 
end 

function SkillCooldown_Xzfy( sklv )
	local Cooldown = 20000
	return Cooldown
end

function Skill_Xzfy_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Xzfy ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Xzfy_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 10 + math.floor ( sklv* 0.5  ) 
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local con_atker = Con(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
			 statetime =math.max(10,math.floor(con_atker/15))+sklv* 0.5
	--			Notice ( "statetime="..statetime)
			end
		end
	local Check_Heilong  = CheckItem_Heilong ( ATKER )
	if Check_Heilong == 1 then
		local Percentage = Percentage_Random ( 0.7)
			if Percentage == 1 then
				  statetime =  statetime*1.5
				SystemNotice ( ATKER , "Obtain power from Black Dragon set. Skill effect enhanced")
			end
	end
	local hp_defer = Hp ( DEFER ) 
	if hp_defer >= 100000 then 
		local a = Percentage_Random (0.8)
		if a == 1 then
			statetime = 5 + math.floor ( sklv * 0.3 ) 
		else
			SetSus( DEFER , 0 ) 
			SystemNotice ( ATKER , "Seal of Elder usage failed!!") 
			return
		end
	end 
	----boss使用技能处理
	if GetChaTypeID( ATKER ) == 985 then
		statetime = 15
		statelv = 10
	end
	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSXZSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSXZSJ[GetChaTypeID( DEFER )] = BOSSXZSJ[GetChaTypeID( DEFER )] -1
		end
	end

	----boss使用技能处理结束
	AddState ( ATKER , DEFER ,STATE_JNJZ , statelv , statetime ) 

end 

--技能暗影之章————————————————————————————————————————————————————————————————————————————————

function SkillSp_Ayzz ( sklv )										--技能"Shadow Insignia"的sp消耗公式
	local sp_reduce = 30 + sklv * 3  
	return sp_reduce 
end 

function SkillCooldown_Ayzz( sklv )
	local Cooldown = 30000
	return Cooldown
end

function Skill_Ayzz_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Ayzz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Ayzz_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 5 + sklv * 1
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local con_atker = Con(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
			 statetime =math.max(5,math.floor(con_atker/30))+sklv
	--			Notice ( "statetime="..statetime)
			end
		end
	local Check_Heilong  = CheckItem_Heilong ( ATKER )
	if Check_Heilong == 1 then
		local Percentage = Percentage_Random ( 0.7)
			if Percentage == 1 then
				  statetime =  statetime*1.5
				SystemNotice ( ATKER , "Obtain power from Black Dragon set. Skill effect enhanced")
			end
	end
	local hp_defer = Mxhp ( DEFER )
	if hp_defer >= 100000 and hp_defer < 1000000 then 
		local a = Percentage_Random (0.7)
		if a == 1 then
			statetime = 9
		else
			SetSus( DEFER , 0 )
			return
		end
	elseif hp_defer >= 1000000 then 
		local a = Percentage_Random (0.7)
		if a == 1 then
			statetime = 4
		else
			SetSus( DEFER , 0 )
			return
		end
	end 
	----boss使用技能处理
	if GetChaTypeID( ATKER ) == 985 then
		statetime = 15
		statelv = 10
	end
	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSAYSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSAYSJ[GetChaTypeID( DEFER )] = BOSSAYSJ[GetChaTypeID( DEFER )] -1
		end
	end
	----boss使用技能处理结束
	AddState( ATKER , DEFER , STATE_GJJZ, statelv , statetime ) 
	--LG( "Ayzz", "Shadow Insignia Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 


--技能鹰眼——————————————————————————————————————————————————————————————————————————————

function SkillSp_Yy ( sklv )										--技能"Eagle's Eye"的sp消耗公式
	local sp_reduce = 10  
	return sp_reduce 
end 

function SkillCooldown_Yy( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Yy_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Yy ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Yy_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 20 + sklv * 10   
	AddState( ATKER , DEFER , STATE_YY, statelv , statetime ) 
end 

function State_Yy_Add ( role , statelv ) 
	--LG("state_Yy" , "function State_Yy_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local hitsb_dif = statelv * 3 
	local hitsb = HitSb(role) + hitsb_dif 
	SetCharaAttr ( hitsb , role , ATTR_STATEV_HIT ) 
	ALLExAttrSet(role)  
end 

function State_Yy_Rem ( role , statelv ) 
	--LG("state_Yy" , "function State_Yy_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local hitsb_dif = statelv * 3 
	local hitsb = HitSb(role) - hitsb_dif 
	SetCharaAttr ( hitsb , role , ATTR_STATEV_HIT ) 
	ALLExAttrSet(role)  
end 




--技能连击箭————————————————————————————————————————————————————————————————————————————


function SkillSp_Lzj ( sklv )										--技能"Dual Shot"的sp消耗公式
	local sp_reduce = 20  
	return sp_reduce 
end 

function SkillCooldown_Lzj( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_Lzj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Lzj ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Lzj_End ( ATKER , DEFER , sklv ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Lzj_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Lzj_End : DEFER as null" ) 
		return 
	end 
		hpdmg = ( 1.5+sklv * 0.15 ) * Atk_Dmg ( ATKER , DEFER ) 
		Hp_Endure_Dmg ( DEFER , hpdmg )  
		--LG( "Lzj", "Dual Shot Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 

end 


--技能彗星强击——————————————————————————————————————————————————————————————————————————


function SkillSp_Hxqj ( sklv )										--技能"Astro Strike"的sp消耗公式
   local sp_reduce = 20 + sklv * 2 
	return sp_reduce 
end 

function SkillCooldown_Hxqj( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Hxqj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Hxqj ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Hxqj_End ( ATKER , DEFER , sklv ) 
	local back_dis = 300 + sklv * 30 
	atk = ( 1.5 + sklv * 0.1 ) * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
	defer_def = Def ( DEFER ) 
	defer_resist = Resist ( DEFER ) 
	dmg = Phy_Dmg ( atk, defer_def , defer_resist ) 
	Hp_Endure_Dmg ( DEFER , dmg )  
	BeatBack ( ATKER , DEFER , back_dis )
	--LG( "Hxqj", "Astro Strike Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 

end 


--技能幻影斩——————————————————————————————————————————————————————————————————————————


function SkillSp_Hyz ( sklv )										--技能"Illusion Slash"的sp消耗公式
   local sp_reduce = 20 
	return sp_reduce 
end 

function SkillCooldown_Hyz( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_Hyz_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Hyz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Hyz_End ( ATKER , DEFER , sklv ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Hyz_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Hyz_End : DEFER as null" ) 
		return 
	end 
	local aspd = Aspd ( ATKER )
	local dmg = ( ( 1.5 + 0.1 * sklv ) ) * (math.min(3,( math.max ( 1, math.floor( aspd / 70  ) )  ))) * Atk_Dmg ( ATKER , DEFER )
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local agi_atker = Agi(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
				dmg = ( ( 1 + 0.1 * sklv ) ) * (math.min(3,( math.max ( 1, math.floor( aspd / 70  ) )  ))) * Atk_Dmg ( ATKER , DEFER )
	--			Notice ( "dmg="..dmg)
			end
		end
	Hp_Endure_Dmg ( DEFER , dmg )  

	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 

--技能重击——————————————————————————————————————————————————————————————————————————


function SkillSp_Zj ( sklv )										--技能"Mighty Strike"的sp消耗公式
   local sp_reduce = 8 + sklv * 1  
	return sp_reduce 
end 

function SkillCooldown_Zj( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Zj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Zj ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Zj_End ( ATKER , DEFER , sklv ) 
	atk_rad = 1.2 + sklv * 0.05 
	hpdmg = Atk_Raise ( atk_rad , ATKER , DEFER )	
	Hp_Endure_Dmg ( DEFER , hpdmg )  
	--LG( "Zj", "Mighty Strike Skill Level= " , sklv , "Skill Damage= " , dmg , '\n" ) 
	Check_Ys_Rem ( ATKER ,DEFER )						--判断是否隐身
end 
--技能奋起--------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SkillSp_Fnq ( sklv )										--技能"Rousing"的sp消耗公式
	local sp_reduce = 25 
	return sp_reduce 
end 

function SkillCooldown_Fnq( sklv )
	local Cooldown = 25000
	return Cooldown
end

function Skill_Fnq_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Fnq ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Fnq_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 20
----boss使用技能处理
	if GetChaTypeID( ATKER ) == 983 then
		statetime = 120
		statelv = 10
	end
----boss使用技能处理结束

	AddState( ATKER , DEFER , STATE_FNQ, statelv , statetime ) 
	--LG( "Fnq", "Rousing Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Fnq_Add ( role , statelv ) 
	--LG("state_Fnq" , "function State_Fnq_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local aspd_dif = 10 + 1 * statelv 
	local aspdsb = ( AspdSb(role) + aspd_dif ) 
	SetCharaAttr( aspdsb , role , ATTR_STATEV_ASPD ) 
	ALLExAttrSet(role)  
end 

function State_Fnq_Rem ( role , statelv ) 
	--LG("state_Fnq" , "function State_Fnq_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local aspd_dif = 10 + 1 * statelv 
	local aspdsb = ( AspdSb(role) - aspd_dif ) 
	SetCharaAttr( aspdsb , role , ATTR_STATEV_ASPD ) 
	ALLExAttrSet(role)  
end

--技能狂暴——————————————————————————————————————————————————————————————————————————————————


function SkillSp_Kb ( sklv )										--技能"Berserk"的sp消耗公式
	local sp_reduce = 15 
	return sp_reduce 
end 

function SkillCooldown_Kb( sklv )
	local Cooldown = 35000
	return Cooldown
end

function Skill_Kb_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Kb ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Kb_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 20  
	AddState( ATKER , DEFER , STATE_KB, statelv , statetime ) 
	--LG( "Kb", "Berserk Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Kb_Add ( role , statelv ) 
	--LG("state_kb" , "function State_Kb_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local aspdsa_dif = 0.2 + statelv * 0.015
	local aspdsa = ( AspdSa(role) + aspdsa_dif) * ATTR_RADIX
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	ALLExAttrSet(role)  
end 

function State_Kb_Rem ( role , statelv ) 
	--LG("state_kb" , "function State_Kb_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local aspdsa_dif = 0.2 + statelv * 0.015
	local aspdsa = ( AspdSa(role) - aspdsa_dif) * ATTR_RADIX
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	ALLExAttrSet(role)  
end 

--技能兽王击——————————————————————————————————————————————————————————————————————————


function SkillSp_Swzq ( sklv )										--技能"Primal Fist"的sp消耗公式
   local sp_reduce = 50+sklv*3  
	return sp_reduce 
end 

function SkillCooldown_Swzq( sklv )
	local Cooldown = 60000
	return Cooldown
end

function Skill_Swzq_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Swzq ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Swzq_End ( ATKER , DEFER , sklv ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Swzq_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Swzq_End : DEFER as null" ) 
		return 
	end 
	
	dmg = ( 3 +  sklv * 0.5 ) * Atk_Dmg ( ATKER ,DEFER ) 
	local Check_Heilong  = CheckItem_Heilong ( ATKER )
	if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.3 )
			if Percentage == 1 then
				  dmg =  dmg*3
				SystemNotice ( ATKER , "Obtained power from Black Dragon set. Attack increases")
			end
	end
	if IsPlayer ( DEFER ) == 1 and IsPlayer ( ATKER ) == 1 then
			local Lv_Check = ReCheck_PK_Lv ( ATKER ,DEFER )
			local Ran = math.min ( 90 , math.max ( 1 ,( 30 + Lv_Check * 2 )))
			local map_name_ATKER = GetChaMapName ( ATKER )
			local map_name_DEFER = GetChaMapName ( DEFER )
			local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
			local SwordLv = GetSkillLv (ATKER,67)
				if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
					Ran = Ran*(1+SwordLv*0.1)
			--		Notice("Ran="..Ran)
				end
			local Check_Heilong  = CheckItem_Heilong ( ATKER )
			if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.5 )
			if Percentage == 1 then
				  Ran =  Ran*1.5
				SystemNotice ( ATKER , "Obtained power from Black Dragon set. Hit rate increases")
			end
	end
			local Dmg_Max = math.floor( dmg * (2/3) )
			local Dmg_Min = math.floor( dmg / 8 )
			dmg = ReCheck_Skill_Dmg ( Dmg_Max , Dmg_Min , Ran )
			if dmg == Dmg_Min then
				SystemNotice ( ATKER , "Primal rage unable to Hit Rate" )
			end
	end
	Hp_Endure_Dmg ( DEFER , dmg )  

		--LG( "Swzq", "Primal Fist Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" )
	local statelv = sklv 
	local statetime = 1    
	local Check_Heilong  = CheckItem_Heilong ( ATKER )
	if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.5 )
			if Percentage == 1 then
				  statetime =  statetime*3
				SystemNotice ( ATKER , "Obtain power from Black Dragon set. Knock out duration extended")
			end
	end
	local hp_defer = Hp ( DEFER ) 
	AddState ( ATKER , DEFER , STATE_XY , statelv , statetime )
end 

function State_Xy_Add ( role , statelv )

end

function State_Xy_Rem ( role , statelv )

end



--技能复活——————————————————————————————————————————————————————————————————————

function SkillSp_Fh ( sklv )										--技能"Revival"的sp消耗公式
   local sp_reduce = 50   
	return sp_reduce 
end 

function SkillCooldown_Fh( sklv )
	local Cooldown = 60000 - sklv * 1500
	return Cooldown
end

function Skill_Fh_Begin ( role , sklv ) 
	local map_name_ATKER = GetChaMapName ( role )
	if map_name_ATKER == "garner2" then
			SystemNotice ( role , "Unable to use Revival skills here." )
	SkillUnable(role)   
		end
	
	local item_count = CheckBagItem ( role , ITEM_RELIFE ) 
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , ITEM_RELIFE , 1 ) 
end 


function Skill_Fh_End ( ATKER , DEFER , sklv ) 
	local ChaName = GetChaDefaultName ( ATKER )
--	SystemNotice ( role , "aaaaa" ) 
	SetRelive ( ATKER , DEFER ,  sklv , "Player"..ChaName.."\n\n wish to revive you. Accept?" ) 
--	local mxhp = GetChaAttr(DEFER,ATTR_MXHP)
--	local hp ＝ mxhp * 0.05 * sklv
--	SetCharaAttr(hp, DEFER, ATTR_HP) 
end 


--冰箱----------------------------------------------
function SkillSp_BingX ( sklv )										--技能"Skill Icy Fairy Enticement"的sp消耗公式
   local sp_reduce = 40 + sklv * 4 
	return sp_reduce 
end 

function SkillCooldown_BingX( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_BingX_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_BingX ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_BingX_End ( ATKER , DEFER , sklv ) 
	local i = CheckBagItem( ATKER , 3463 )
	if i <= 0 then
		SystemNotice ( ATKER , "Each summon requires 1 Icy Crystal")
		return
	end
	local j = DelBagItem(ATKER,3463,1)
	if j == 1 then
		local statelv = sklv 
		local statetime =  8 + sklv * 2
		local map_name_ATKER = GetChaMapName ( ATKER )
		local map_name_DEFER = GetChaMapName ( DEFER )
		local sta_atker = Sta(ATKER)
		local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
			if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
				if Can_Pk_Garner2 == 0 then
					 statetime =math.max(8,math.floor(sta_atker/15))+sklv*2
		--			Notice ( "statetime="..statetime)
				end
			end
		AddState ( ATKER , DEFER , STATE_BIW , statelv , statetime )	
	else
		LG("Skill_Item","Delete Icy Crystal failed")
	end


	 
end











--技能石化皮肤————————————————————————————————————————————————————————————————————


function SkillSp_Shpf ( sklv )										--技能"Skill Harden"的sp消耗公式
   local sp_reduce = 40 + sklv * 4 
	return sp_reduce 
end 

function SkillCooldown_Shpf( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Shpf_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Shpf ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Shpf_End ( ATKER , DEFER , sklv ) 
 
	local statelv = sklv 
	local statetime =  180    
	AddState ( ATKER , DEFER , STATE_SHPF , statelv , statetime ) 
	--LG("skill_Shpf", "function Skill_Def_Shpf : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
end 


function State_Shpf_Add ( role , statelv ) 
	--LG("state", "function State_Shpf_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = 10 + statelv * 4  
	local def = DefSb(role) + def_dif 
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 



function State_Shpf_Rem ( role , statelv ) 
--	LG("state", "function State_Shpf_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = 10 + statelv * 4 
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 


----技能魔力催化---------------------------------------------------------------

function SkillSp_Mlch ( sklv )										
   local sp_reduce = 40 + sklv * 4 
	return sp_reduce 
end 

function SkillCooldown_Mlch( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Mlch_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Mlch ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Mlch_End ( ATKER , DEFER , sklv ) 
	local i = CheckBagItem( ATKER , 3462 )
	if i <= 0 then
		SystemNotice ( ATKER , "Intensify requires one Magical Clover")
		return
	end
	local b = ( sklv - 1 ) * 0.05
	local a = Percentage_Random ( b )
	local j = 0
	if a == 0 then
		j = DelBagItem(ATKER,3462,1)
	elseif a == 1 then
		j = 1
		SystemNotice ( ATKER , "Entering skill discharge, does not consume a Magical Clover" )
	end
	if j == 1 then
		local statelv = sklv 
		local statetime =  90 + 90 * sklv   
		AddState ( ATKER , DEFER , STATE_MLCH , statelv , statetime ) 	
	else
		LG("Skill_Item","Delete Magical Clover failed")
	end

end 


function State_Mlch_Add ( role , statelv ) 
end 



function State_Mlch_Rem ( role , statelv ) 
end

function Cuihua_Mofa ( dmg , statelv ) 
	
		local dmg_fin = math.floor ( dmg * ( 1.4 + statelv * 0.02 ) + statelv * 30 ) 
		return dmg_fin 
	 


end 
 

--技能钢铁意志————————————————————————————————————————————————————————————————————


function SkillSp_Gtyz ( sklv )										--技能"Skill Will of Steel"的sp消耗公式
   local sp_reduce = 15  
	return sp_reduce 
end 

function SkillCooldown_Gtyz( sklv )
	local Cooldown = 15000
	return Cooldown
end

function Skill_Gtyz_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Gtyz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Gtyz_End ( ATKER , DEFER , sklv ) 
 
	local statelv = sklv 
	local statetime =  15    
	AddState ( ATKER , DEFER , STATE_GTYZ , statelv , statetime ) 
	--LG("skill_Gtyz", "function Skill_Def_Gtyz : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


function State_Gtyz_Add ( role , statelv ) 
	--LG("state", "function State_GTYZ_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = statelv * 3
	local def = DefSb(role) + def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 



function State_Gtyz_Rem ( role , statelv ) 
--	LG("state", "function State_Gtyz_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = statelv * 3
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 




--技能破甲——————————————————————————————————————————————————————————————————————————


function SkillSp_Pj ( sklv )										--技能"Skill Break Armor"的sp消耗公式
   local sp_reduce = 25  
	return sp_reduce 
end 

function SkillCooldown_Pj( sklv )
	local Cooldown = 25000
	return Cooldown
end

function Skill_Pj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Pj ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Pj_End ( ATKER , DEFER , sklv ) 
		local statelv = sklv 
		local statetime =  15    
		local map_name_ATKER = GetChaMapName ( ATKER )
		local map_name_DEFER = GetChaMapName ( DEFER )
		local agi_atker = Agi(ATKER)
		local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0  then
				statetime = agi_atker/10
				if statetime<1 then
					statetime =1
		--		Notice ( "statetime="..statetime)
				end
			end
		end
		AddState ( ATKER , DEFER , STATE_PJ , statelv , statetime ) 
		--LG("skill_Pj", "function Skill_Def_Pj : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
		Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

		--LG( "sk_pj", "Break Armor Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Pj_Add ( role , statelv ) 
	--LG("state", "function State_Pj_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = statelv * 4
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 



function State_Pj_Rem ( role , statelv ) 
--	LG("state", "function State_Pj_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = statelv * 4
	local def = DefSb(role) + def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 

------------------------精灵破甲
function State_JLPj_Add ( role , statelv ) 
	--LG("state", "function State_Pj_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = statelv * 60
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 

function State_JLPj_Rem ( role , statelv ) 
--	LG("state", "function State_Pj_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = statelv * 60
	local def = DefSb(role) + def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 
--技能刺杀————————————————————————————————————————————————————————————————————————————————

function SkillSp_Bc ( sklv )										--技能"assassinate"的sp消耗公式
	local sp_reduce = 15 + sklv * 2  
	return sp_reduce 
end 

function SkillCooldown_Bc( sklv )
	local Cooldown = 60000
	return Cooldown
end

function Skill_Bc_Begin ( role , sklv )								--技能“刺杀”的施放阶段
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Bc ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Bc_End ( ATKER , DEFER , sklv )									--技能“刺杀”的效果阶段
	local atk_rad = 1+ sklv * 0.05
	local atk_dire = GetObjDire ( ATKER ) 
	local def_dire = GetObjDire ( DEFER ) 
	dif_dire = atk_dire - def_dire 
	if math.abs(dif_dire) < 90 or math.abs(dif_dire) > 180 then 
		hpdmg = MxatkIb(role) * sklv * 0.3 
	else
		hpdmg = Atk_Raise ( atk_rad , ATKER , DEFER ) 
	end
	Hp_Endure_Dmg ( DEFER , hpdmg ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身

end 

--技能鬼舞斩————————————————————————————————————————————————————————————————————————————————

function SkillSp_Guz ( sklv )										--技能"Shadow Slash"的sp消耗公式
	local sp_reduce = 20 + sklv * 3  
	return sp_reduce 
end 

function SkillCooldown_Guz( sklv )
	local Cooldown = 30000
	return Cooldown
end

function Skill_Guz_Begin ( role , sklv )								--技能“鬼舞斩”的施放阶段
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Guz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 

end 

function Skill_Guz_End ( ATKER , DEFER , sklv )									--技能“鬼舞斩”的效果阶段
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Guz_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Guz_End : DEFER as null" ) 
		return 
	end 
	local a = 1 
	local hpdmg = ( 1 +  sklv * 0.1 ) * Atk_Dmg( ATKER , DEFER )  
	local statelv = sklv 
	local statetime = 3 + math.floor ( sklv * 0.5 ) 
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local agi_atker = Agi(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	--	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
	--		if Can_Pk_Garner2 == 0 then
	--			statetime = statetime*agi_atker/200
	--			Notice ( "statetime="..statetime)
	--		end
	--	end
	local atk_dire = GetObjDire ( ATKER ) 
	local def_dire = GetObjDire ( DEFER ) 
	dif_dire = atk_dire - def_dire 
	if math.abs(dif_dire) < 90 or math.abs(dif_dire) > 180 then 
		statetime = statetime * 2  
	end 
	local hp_defer =Mxhp ( DEFER ) 
	if hp_defer >= 100000 then 
		a = Percentage_Random ( 0.8 ) 
		statetime = math.floor ( statetime / 2 ) + 1 
	end 
	local Check_Heilong  = CheckItem_Heilong ( ATKER )
	if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.5 )
			if Percentage == 1 then
				 statetime = statetime * 2
				SystemNotice ( ATKER , "Obtain power from Black Dragon set. Skill effect enhanced")
			end
	end
	if  a == 1 then
		----boss使用技能处理
		if GetChaTypeID( ATKER ) == 979 then
			statetime = 8
		end

	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSXYSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSXYSJ[GetChaTypeID( DEFER )] = BOSSXYSJ[GetChaTypeID( DEFER )] -1
		end
	end
		----boss使用技能处理结束
		Hp_Endure_Dmg ( DEFER , hpdmg ) 
		AddState( ATKER , DEFER , STATE_XY, statelv , statetime ) 
	else 
		SetSus( DEFER , 0 ) 
	end 
	Check_Ys_Rem ( ATKER ,DEFER )						--判断是否隐身

end 
--技能毒箭——————————————————————————————————————————————————————————————————————————————————

function SkillSp_Dj ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end

function SkillCooldown_Dj( sklv )
	local Cooldown = 25000
	return Cooldown
end

function Skill_Dj_Begin ( role , sklv ) 
	--LG( "skill_dj", "enter function Skill_Atk_Dj : " , "\n" ) 
	--LG("skill_dj", "function Skill_Atk_Dj : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Dj ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Dj_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_db", "enter function Skill_Def_Dj : " , "\n" ) 
	local statelv = sklv 
	local statetime =  11 + sklv * 1    
	AddState ( ATKER , DEFER , STATE_DJ , statelv , statetime ) 
	--LG("skill_dj", "function Skill_Def_Dj : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


function State_Dj_Add ( role , statelv ) 
	--LG("state_Dj" , "function State_Dj_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local hpdmg = 10 + statelv * 2   
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_Dj_Rem ( role , statelv ) 
	--LG("state_Dj" , "function State_Dj_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
end 

--技能毒镖 ——————————————————————————————————————————————————————————————————————————————————

function SkillSp_Db ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end

function SkillCooldown_Db( sklv )
	local Cooldown = 20000
	return Cooldown
end

function Skill_Db_Begin ( role , sklv ) 
	--LG( "skill_db", "enter function Skill_Atk_Db : " , "\n" ) 
	--LG("skill_db", "function Skill_Atk_Db : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Db ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Db_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_db", "enter function Skill_Def_Db : " , "\n" ) 
	local statelv = sklv 
	local statetime =  5 + sklv * 4    
	AddState ( ATKER , DEFER , STATE_ZD , statelv , statetime ) 
	--LG("skill_db", "function Skill_Def_Db : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


function State_Zd_Add ( role , statelv ) 
	--LG("state_Zd" , "function State_Zd_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local hpdmg = 10 + statelv * 2  
	local map_name_ATKER = GetChaMapName ( role )
	local agi_atker = Agi(role)
	local Can_Pk_Garner2 = Is_NormalMonster (role)
		if map_name_ATKER == "garner2"  then 
			if Can_Pk_Garner2 == 0 then
			hpdmg = math.max(5,320)
	--		Notice ( "hpdmg="..hpdmg)
			end
		
		end
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_Zd_Rem ( role , statelv ) 
	--LG("state_Zd" , "function State_Zd_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
end 

--技能麻痹术————————————————————————————————————————————————————————————————————————————————－
--function SkillSp_Mb ( sklv )										
--	local sp_reduce = 10 
--	return sp_reduce 
--end

--function Skill_Mb_Begin ( role , sklv ) 
--	LG( "skill_mb", "enter function Skill_Atk_Mb : " , "\n" ) 
--	LG("skill_mb", "function Skill_Atk_Mb : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
--	local sp = Sp(role) 
--	local sp_reduce = SkillSp_Mb ( sklv ) 
--  	if sp - sp_reduce < 0 then 
--		SkillUnable(role)   
--		return 
--	end 
--	Sp_Red (role , sp_reduce ) 
--end 
--
--  function Skill_Mb_End ( ATKER , DEFER , sklv ) 
--	LG( "skill_mb", "enter function Skill_Def_Mb : " , "\n" ) 
--	local statelv = sklv 
--	local statetime = 5  
--	AddState ( ATKER , DEFER , STATE_MB , statelv , statetime ) 
--	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
--  	LG("skill_mb", "function Skill_Def_Mb : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
--end 
--
--

function SkillCooldown_Mb( sklv )
	local Cooldown = 20000
	return Cooldown
end

function State_Mb_Add ( role , statelv ) 
--	LG("state_Mb" , "function State_Mb_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local aspdsa_dif = (-1) * (  0.1 + statelv * 0.03   ) 
	local mspdsa_dif = (-1) * (  0.2 +statelv * 0.03 ) 

	local aspdsa = math.floor ( ( AspdSa( role ) + aspdsa_dif ) * ATTR_RADIX )  
	local mspdsa = math.floor ( ( MspdSa( role ) + mspdsa_dif ) * ATTR_RADIX  ) 

  	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 

	ALLExAttrSet(role)  
end 



function State_Mb_Rem ( role , statelv ) 
--	LG("state_Mb" , "function State_Mb_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local aspdsa_dif = (-1) * (  0.1 + statelv * 0.03   ) 
	local mspdsa_dif = (-1) * (  0.2 +statelv * 0.03 ) 
	local aspdsa = math.floor ( ( AspdSa( role ) - aspdsa_dif ) * ATTR_RADIX )  
	local mspdsa = math.floor ( ( MspdSa( role ) - mspdsa_dif ) * ATTR_RADIX  ) 
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 


--技能飓风——————————————————————————————————————————————————————————————————
function SkillSp_Jf ( sklv )										
	local sp_reduce = 25 + sklv * 2   
	return sp_reduce 
end 

function SkillCooldown_Jf( sklv )
	local Cooldown = 12000
	return Cooldown
end

function SkillEnergy_Jf ( sklv )										
	local energy_reduce = math.floor ( 1 + sklv * 0.25 )    
	return energy_reduce 
end 

function Skill_Jf_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Jf ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Jf_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = math.floor ( 3 + sklv * 0.5 ) 
	local a = 1 
	local hp_defer = Hp ( DEFER ) 
	local MxHp_defer = Mxhp ( DEFER )
	
	if MxHp_defer >= 100000 then
		SetSus( DEFER , 0 )
		return
	end

	if hp_defer >= 50000 then 
		a = Percentage_Random ( 0.2 ) 
		statetime = math.floor ( statetime / 2 ) + 1 
	end 
	if  a == 1 then
	----boss使用技能处理
	if GetChaTypeID( ATKER ) == 986 then
		statetime = 12
		statelv = 10
	end
	----boss使用技能处理结束
		AddState ( ATKER , DEFER , STATE_JF , statelv , statetime ) 
	else 
		SetSus( DEFER , 0 ) 
	end 
end 

function State_Jf_Add ( role , statelv ) 
end 

function State_jf_Rem ( role , statelv ) 
end 



--技能雷击——————————————————————————————————————————————————————————————————

function SkillSp_Lj ( sklv )										
	local sp_reduce = 25 + sklv * 2   
	return sp_reduce 
end

function SkillCooldown_Lj( sklv )
	local Cooldown = 8400 - sklv * 400
	return Cooldown
end

function SkillEnergy_Lj ( sklv )										
	local energy_reduce = math.floor ( 3 + sklv * 0.5 )    
	return energy_reduce 
end 

function Skill_Lj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Lj ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Lj_End ( ATKER , DEFER , sklv ) 
	local statelv = 2  
	local statetime = 3 
	local atk_role = TurnToCha ( ATKER ) 
	local def_role = TurnToCha ( DEFER ) 
	local sta_atk= Sta ( ATKER ) 
	local sta_def = Sta ( DEFER )
	local Lv = Lv( ATKER )
	local AddStateLv = 0
	AddStateLv = GetChaStateLv ( ATKER , STATE_MLCH )
	
	local dmg = math.floor ( 80 + sklv*10 +sta_atk * 6 ) + 3 * Lv

	local map_name_DEFER = GetChaMapName ( DEFER )
	local agi_atker = Agi(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
			
			dmg = math.floor(MAGIC_Atk_Dmg(ATKER,DEFER)*math.pow(sklv,1/2))

			end
		end

	local Check_Heilong  = CheckItem_Heilong ( ATKER )
	if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.8 )
			if Percentage == 1 then
				  dmg =  dmg*1.5 
				SystemNotice ( ATKER , "Obtain power from Black Dragon set. Damage bonus")
			end
	end
	local dmg_fin = Cuihua_Mofa ( dmg , AddStateLv )
	local dmg_ElfSkill = ElfSkill_MagicAtk ( dmg , ATKER )
	dmg_fin = dmg_fin + dmg_ElfSkill
	AddState ( ATKER , DEFER , STATE_MB , statelv , statetime ) 
	Hp_Endure_Dmg ( DEFER , dmg_fin ) 
end 







--技能猎刀刺——————————————————————————————————————————————————————————————————————————


function SkillSp_Ldc ( sklv )										--技能"Hunter Strike"的sp消耗公式
	local sp_reduce = 10  
	return sp_reduce 
end 

function SkillCooldown_Ldc( sklv )
	local Cooldown = 30000
	return Cooldown
end

function Skill_Ldc_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Ldc ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Ldc_End ( ATKER , DEFER , sklv ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Ldc_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Ldc_End : DEFER as null" ) 
		return 
	end 
		dmg = ( 2 +  sklv * 0.2 ) * Atk_Dmg ( ATKER ,DEFER ) 
		Hp_Endure_Dmg ( DEFER , dmg )  

end 

--技能小治愈——————————————————————————————————————————————————————————————————
function SkillSp_Xzy ( sklv )							
	local sp_reduce = 30 + sklv * 4    
	return sp_reduce 
end

function SkillCooldown_Xzy( sklv ) 
	local Cooldown = 7000 - sklv * 300 
	return Cooldown 
end

function Skill_Xzy_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Xzy ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Xzy_End ( ATKER , DEFER , sklv ) 
	local sta = Sta( ATKER ) 
	local exp = Exp( ATKER ) 
	local hpdmg = ( -1 ) * math.floor ( 50 + 15 * sklv + sta * 7 ) 
	local mxhp_def = Mxhp( DEFER ) 
	local hp_def = Hp( DEFER ) 
	local hp_recover = math.max( math.min ( ( mxhp_def - hp_def ) , (-1) * hpdmg ) , 0 )
	local exp_add = hp_recover / 8 
	local Lv = Lv( ATKER )
		if Lv >= 80 then
			exp_add = exp_add / 50
		end
	local rolemode_defer = IsPlayer ( DEFER ) 
	local ChaList = {}
	local i = 0
	local Hate = 0
	local role = ATKER
	local HateNum = 3
	local HateAddNum = 0
	if rolemode_defer == 1 and DEFER ~= ATKER then 
		exp = exp + exp_add 
		SetCharaAttr ( exp , ATKER , ATTR_CEXP )  
	end 
	Hp_Endure_Dmg ( DEFER , hpdmg ) 
	ChaList[1] , ChaList[2] , ChaList[3] , ChaList[4] , ChaList[5] , ChaList[6] , ChaList[7] , ChaList[8] , ChaList[9] , ChaList[10] , ChaList[11] , ChaList[12] = GetChaSetByRange ( DEFER , 0 ,0 ,800 , 0)
	Hate = math.floor ( hpdmg / -2 )
	for i = 1 , 12 , 1 do
		if ChaList[i] ~= nil then
			role = GetChaTarget ( ChaList[i] )
			if role == DEFER then
				if HateAddNum < HateNum then
					AddHate ( ChaList[i] , ATKER , Hate )
					HateAddNum = HateAddNum + 1
				end

			end
		end
	end

end 


--技能回复术——————————————————————————————————————————————————————————————————————————————————————————

function SkillSp_Hfs ( sklv )										--技能"Recover"的sp消耗公式
	local sp_reduce = 20    
	return sp_reduce 
end 

function SkillCooldown_Hfs( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Hfs_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Hfs ( sklv ) 
	local hp_recover = sklv * 50 + 100 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	local hp = Hp ( role ) + hp_recover 
	SetCharaAttr ( hp , role , ATTR_HP ) 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Hfs_End ( ATKER , DEFER , sklv ) 
		Rem_State_Unnormal ( DEFER ) 
		--LG( "Hfs", "Recover Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 


--技能心灵冲撞——————————————————————————————————————————————————————————————————————————————————————————

function SkillSp_Xlcz ( sklv )										--技能"Spiritual Bolt"的sp消耗公式
	local sp_reduce = 30 + sklv * 2   
	return sp_reduce 
end 

function SkillCooldown_Xlcz( sklv ) 
	local Cooldown = 6000 - sklv * 300
	return Cooldown
end

function Skill_Xlcz_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Xlcz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Xlcz_End ( ATKER , DEFER , sklv ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Xlcz_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Xlcz_End : DEFER as null" ) 
		return 
	end 
--	local atkdmg = Atk_Dmg ( ATKER , DEFER )
	local lv_atker = Lv ( TurnToCha ( ATKER ) ) 
	local lv_defer = Lv ( TurnToCha ( DEFER ) ) 
	local sta_atker = Sta(ATKER) 
	local sta_defer = Sta(DEFER) 
	local lv_dif = math.max ( ( - 1 ) * 10 , math.min ( 10 , lv_atker - lv_defer ) ) 
	local AddStateLv = 0
	AddStateLv = GetChaStateLv ( ATKER , STATE_MLCH )

	hpdmg = math.floor (( 10 + sta_atker * 2 ) * ( 1 + sklv * 0.25 ) * ( 1 +  lv_dif * 0.025 ))
		local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local agi_atker = Agi(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
			
		local dmg = MAGIC_Atk_Dmg(ATKER,DEFER)

		hpdmg = math.floor (dmg * ( 1 + sklv * 0.1 ) )
	--			Notice ( "statetime="..statetime)
			end
		end
	local dmg_fin = Cuihua_Mofa ( hpdmg ,AddStateLv )
	local dmg_ElfSkill = ElfSkill_MagicAtk ( hpdmg , ATKER )
	dmg_fin = dmg_fin + dmg_ElfSkill
	Hp_Endure_Dmg ( DEFER, dmg_fin )  
--	LG( "xlcz", "Spiritual Bolt Skill Level=" , sklv ,"Attacker sta=", sta ,"Normal attack damage=", atkdmg , "Skill Damage= " , dmg , "\n" ) 
end 

function MAGIC_Atk_Dmg(a,b) --[[计算普通攻击的基本正常伤害]]--

	local job = GetChaAttr(a, ATTR_JOB) --不同职业采用不同的属性成长率
	local sta_atker = Sta(a) 
	local sta_defer = Sta(b) 
	local atk_mnatk = math.floor (MnatkIb(a) + sta_atker*Magic_rate1[job] +  Magic_rate2[job] * math.pow(math.floor( sta_atker*4/20), 2 ))
	local atk_mxatk = math.floor (MxatkIb(a)  + sta_atker*Magic_rate1[job] + Magic_rate2[job] * math.pow(math.floor( sta_atker*4/20), 2 ))
	local defer_mgic_def = sta_defer * 2  
	local defer_resist = Resist(b)  
	local atker_lv = Lv( a ) 
	local defer_lv = Lv( b ) 
	local lv_dis = atker_lv - defer_lv 
	local lv_eff = 1 
	if math.abs (lv_dis) >= 1 then 
		lv_eff =math.min (  math.max ( 0.5 , 1 + 0.025 * lv_dis ) , 1.5 )  
	end 
		
	local atk = math.random( atk_mnatk , atk_mxatk ) 
	local dmg = Magic_Dmg ( atk, defer_mgic_def , defer_resist )  --[[计算正常伤害值]]--
	local mndmg = math.floor(  Lv(a) * 0.25 + Mnatk(a) * 0 ) + 1 --[[计算最小伤害值]]--
	dmg =math.max(  lv_eff * dmg , mndmg ) 

	return dmg 
end 

function Magic_Dmg (atk, def, resist )					--[[物理攻击计算]]--
	local magic_atk = atk 
	local magic_def = def 
	local magic_resist = resist 
--	LuaPrint ( " Physical Attack= "..phy_atk.." Physical Defense= "..phy_def.."Physical Resist= "..phy_resist ) 
--	LuaPrint (\n) 
--	LG ( " Damage" , "Physical attack= ", phy_atk, "Physical Resist= " , phy_def, " Physical Resist= " , phy_resist, "\n" ) 
	dmg = math.floor( (magic_atk   - magic_def ) * (1 - math.min (0.85 , magic_resist/100 )  ))
	return dmg 
end 


	Magic_rate1 = {} 
	Magic_rate2 = {} 

Magic_rate1[	JOB_TYPE_XINSHOU	]=	1
Magic_rate1[	JOB_TYPE_JIANSHI	]=	1
Magic_rate1[	JOB_TYPE_LIEREN	]=	1
Magic_rate1[	JOB_TYPE_SHUISHOU	]=	1
Magic_rate1[	JOB_TYPE_MAOXIANZHE	]=	1.5
Magic_rate1[	JOB_TYPE_QIYUANSHI	]=	1.5
Magic_rate1[	JOB_TYPE_JISHI	]=	1
Magic_rate1[	JOB_TYPE_SHANGREN	]=	1
Magic_rate1[	JOB_TYPE_JUJS	]=	1
Magic_rate1[	JOB_TYPE_SHUANGJS	]=	1
Magic_rate1[	JOB_TYPE_JIANDUNSHI	]=	1
Magic_rate1[	JOB_TYPE_XUNSHOUSHI	]=	1
Magic_rate1[	JOB_TYPE_JUJISHOU	]=	1
Magic_rate1[	JOB_TYPE_SHENGZHIZHE	]=	2
Magic_rate1[	JOB_TYPE_FENGYINSHI	]=	3
Magic_rate1[	JOB_TYPE_CHUANZHANG	]=	1
Magic_rate1[	JOB_TYPE_HANGHAISHI	]=	2
Magic_rate1[	JOB_TYPE_BAOFAHU	]=	1
Magic_rate1[	JOB_TYPE_GONGCHENGSHI	]=	1

Magic_rate2[	JOB_TYPE_XINSHOU	]=	0.4
Magic_rate2[	JOB_TYPE_JIANSHI	]=	0.4
Magic_rate2[	JOB_TYPE_LIEREN	]=	0.4
Magic_rate2[	JOB_TYPE_SHUISHOU	]=	0.4
Magic_rate2[	JOB_TYPE_MAOXIANZHE	]=	0.3
Magic_rate2[	JOB_TYPE_QIYUANSHI	]=	0.3
Magic_rate2[	JOB_TYPE_JISHI	]=	0.4
Magic_rate2[	JOB_TYPE_SHANGREN	]=	0.4
Magic_rate2[	JOB_TYPE_JUJS	]=	0.4
Magic_rate2[	JOB_TYPE_SHUANGJS	]=	0.4
Magic_rate2[	JOB_TYPE_JIANDUNSHI	]=	0.4
Magic_rate2[	JOB_TYPE_XUNSHOUSHI	]=	0.4
Magic_rate2[	JOB_TYPE_JUJISHOU	]=	0.4
Magic_rate2[	JOB_TYPE_SHENGZHIZHE	]=	0.35
Magic_rate2[	JOB_TYPE_FENGYINSHI	]=	0.45
Magic_rate2[	JOB_TYPE_CHUANZHANG	]=	0.4
Magic_rate2[	JOB_TYPE_HANGHAISHI	]=	0.35
Magic_rate2[	JOB_TYPE_BAOFAHU	]=	0.4
Magic_rate2[	JOB_TYPE_GONGCHENGSHI	]=	0.4

--技能心灵之火——————————————————————————————————————————————————————————————
function SkillSp_Xlzh ( sklv )										
	local sp_reduce = 45  + math.floor ( sklv * 3 )  
	return sp_reduce 
end

function SkillCooldown_Xlzh( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Xlzh_Begin ( role , sklv ) 
	local sp = Sp( role ) 
	local sp_reduce = SkillSp_Xlzh ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Xlzh_End ( ATKER , DEFER , sklv )  
	local statelv = sklv 
	local statetime = 180 + sklv * 20 
	--LG( "Xlzh", "Spiritual Fire Skill Level=" , sklv , "\n" ) 
	AddState( ATKER , DEFER , STATE_XLZH, statelv , statetime )
	--LG("skill_Xlzh", "function Skill_Oper_Xlzh: " , "add state Xlzh " , "\n" ) 
end 

function State_Xlzh_Add ( role , statelv ) 
	--LG("state_xlzh" , "function State_xlzh_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mnatksa_dif =0.1 + 0.01 * statelv 
	local mxatksa_dif =0.1 + 0.01 * statelv
	local mnatksa = math.floor ( (MnatkSa(role) + mnatksa_dif ) * ATTR_RADIX) 
	local mxatksa = math.floor ( (MxatkSa(role) + mxatksa_dif ) * ATTR_RADIX) 
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK ) 
	ALLExAttrSet(role)  
end 



function State_Xlzh_Rem ( role , statelv ) 
	--LG("state_xlzh" , "function State_xlzh_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mnatksa_dif =0.1 + 0.01 * statelv 
	local mxatksa_dif =0.1 + 0.01 * statelv
	local mnatksa = math.floor ( (MnatkSa(role) - mnatksa_dif ) * ATTR_RADIX) 
	local mxatksa = math.floor ( (MxatkSa(role) - mxatksa_dif ) * ATTR_RADIX) 
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK ) 
	ALLExAttrSet(role)  
end 

--技能风之领主——————————————————————————————————————————————————————————————
function SkillSp_Fzlz ( sklv )										
	local sp_reduce = 40  + sklv * 4
	return sp_reduce 
end

function SkillCooldown_Fzlz( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Fzlz_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Fzlz(sklv)  
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Fzlz_End ( ATKER , DEFER , sklv )  
	local statelv = sklv 
	local statetime = 180 + sklv * 18 
	--LG( "Fzlz", "Tempest Boost Skill Level=" , sklv , "\n" ) 
	----boss使用技能处理
	if GetChaTypeID( ATKER ) == 984 then
		statetime = 360
		statelv = 10
	end
	----boss使用技能处理结束

	AddState( ATKER , DEFER , STATE_FZLZ, statelv , statetime )
	--LG("skill_Fzlz", "function Skill_Oper_Fzlz: " , "add state Fzlz " , "\n" ) 
end 

function State_Fzlz_Add ( role , statelv ) 
	--LG("state_Fzlz" , "function State_Fzlz_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mspdsa_dif = 0.05 + 0.01 * statelv 
	local aspdsa_dif = 0.05 + 0.01 * statelv 
	local mspdsa = math.floor ( (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX) 
	local aspdsa = math.floor ( (AspdSa(role) + aspdsa_dif ) * ATTR_RADIX)
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD )
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )
	ALLExAttrSet(role)  
end 

function State_Fzlz_Rem ( role , statelv ) 
	--LG("state_fzlz" , "function State_fzlz_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mspdsa_dif =0.05 + 0.01 * statelv 
	local aspdsa_dif = 0.05 + 0.01 * statelv 
	local mspdsa = math.floor ( (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX) 
	local aspdsa = math.floor ( (AspdSa(role) - aspdsa_dif ) * ATTR_RADIX)
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD )
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )
	ALLExAttrSet(role)  
end 

--技能冰冻箭——————————————————————————————————————————————————————————————————————————

function SkillSp_Bdj ( sklv )										--技能"Frozen Arrow"的sp消耗公式
   local sp_reduce = 15   
	return sp_reduce 
end 

function SkillCooldown_Bdj( sklv )
	local Cooldown = 15000
	return Cooldown
end

function Skill_Bdj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Bdj ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Bdj_End ( ATKER , DEFER , sklv ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Bdj_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Bdj_End : DEFER as null" ) 
		return 
	end 
	local hpdmg =1.2 * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , hpdmg )  
	local statelv = sklv 
	local statetime = 5 
	----boss使用技能处理
	if GetChaTypeID( ATKER ) == 983 then
		statelv = 10
	end
	----boss使用技能处理结束
	AddState ( ATKER , DEFER , STATE_BDJ , statelv , statetime ) 
	
end 

function State_Bdj_Add ( role , statelv ) 
	--LG("state_Bdj" , "function State_Bdj_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mspdsa_dif = 0.2 + statelv * 0.03
	local mspdsa = ( MspdSa(role) - mspdsa_dif ) * ATTR_RADIX  
	SetCharaAttr ( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

function State_Bdj_Rem ( role , statelv ) 
	--LG("state_Bdj" , "function State_Bdj_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mspdsa_dif = 0.2 + statelv * 0.03
	local mspdsa =( MspdSa(role) + mspdsa_dif ) * ATTR_RADIX  
	SetCharaAttr ( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 


--技能腿狙公式——————————————————————————————————————————————————————————————————
function SkillSp_Tj ( sklv )										
	local sp_reduce = 10 + sklv * 0.5  
	return sp_reduce 
end

function SkillCooldown_Tj( sklv )
	local Cooldown = 8000 - sklv * 200  
	return Cooldown 
end 

function Skill_Tj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Tj ( sklv )
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Tj_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 5 + sklv * 0.5 
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local agi_atker = Agi(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	--	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
	--		if Can_Pk_Garner2 == 0 then
	--		 statetime =math.max(3,math.floor(agi_atker/20))+sklv*0.5
	--			Notice ( "statetime="..statetime)
	--		end
	--	end
	local hp_defer = Mxhp ( DEFER ) 
	if hp_defer >= 100000 then 
		statetime = math.floor ( statetime / 3 ) + 1 
	end 
 	dmg = ( 1 + sklv * 0.05 ) * Atk_Dmg ( ATKER , DEFER )  
	Hp_Endure_Dmg ( DEFER , dmg )  

----boss使用技能处理

	if GetChaTypeID( ATKER ) == 980 then
		statetime = 5
	end
	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSTJSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSTJSJ[GetChaTypeID( DEFER )] = BOSSTJSJ[GetChaTypeID( DEFER )] -1
		end
	end

----boss使用技能处理结束

	AddState( ATKER , DEFER , STATE_TJ, statelv , statetime ) 

end 

function State_Tj_Add ( role , statelv ) 
	--LG("state_Tj" , "function State_Tj_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local fleesa_dif = (-1) * 0.2 
	local mspdsa_dif = (-1) * ( 0.5 + 0.025 * statelv ) 
	local fleesa = (FleeSa(role) + fleesa_dif ) * ATTR_RADIX
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( fleesa , role , ATTR_STATEC_FLEE ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

function State_Tj_Rem ( role , statelv ) 
	--LG("state_tj" , "function State_Tj_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local fleesa_dif = (-1) * 0.2 
	local mspdsa_dif = (-1) * ( 0.5 + 0.025 * statelv ) 
	local fleesa = (FleeSa(role) - fleesa_dif ) * ATTR_RADIX
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( fleesa , role , ATTR_STATEC_FLEE ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 


--技能手狙公式——————————————————————————————————————————————————————————————————
function SkillSp_Sj ( sklv )										
	local sp_reduce = 25 + sklv * 1   
	return sp_reduce 
end

function SkillCooldown_Sj( sklv )
	local Cooldown = 15000
	return Cooldown
end

function Skill_Sj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Sj ( sklv )
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Sj_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 5 + math.floor ( sklv * 0.5  ) 
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local agi_atker = Agi(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	--	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
	--		if Can_Pk_Garner2 == 0 then
	--		 statetime =math.max(5,math.floor(agi_atker/20))+sklv
	--			Notice ( "statetime="..statetime)
	--		end
	--	end
	local a = 1 
 	local dmg = math.floor( 100 + sklv * 10  )  
	Hp_Endure_Dmg ( DEFER , dmg )  
	--LG( "Sj", "Enfeeble Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
	local hp_defer = Mxhp ( DEFER ) 
	if hp_defer >= 100000 then 
		local a = Percentage_Random (1)
		if a == 1 then
			statetime = math.floor ( 3 + sklv * 0.3 ) 
		else
			SetSus( DEFER , 0 )
			SystemNotice ( ATKER , "Enfeeble has been evaded completely" ) 
			return
		end
	end 
----boss使用技能处理
	if GetChaTypeID( ATKER ) == 980 then
		statetime = 5
	end
	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSSJSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSSJSJ[GetChaTypeID( DEFER )] = BOSSSJSJ[GetChaTypeID( DEFER )] -1
		end
	end

----boss使用技能处理结束
	AddState( ATKER , DEFER , STATE_SJ, statelv , statetime ) 
	AddState( ATKER , DEFER , STATE_JNJZ, statelv , statetime ) 
	--LG( "Sj", "Enfeeble Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 

end 

function State_Sj_Add ( role , statelv ) 
	--LG("state_sj" , "function State_Sj_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mnatksa_dif = (-1) * 0.2 
	local mxatksa_dif = (-1) * 0.2  
	local mnatksa = (MnatkSa(role) + mnatksa_dif ) * ATTR_RADIX
	local mxatksa = (MxatkSa(role) + mxatksa_dif ) * ATTR_RADIX 
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK ) 
	ALLExAttrSet(role)  
end 

function State_Sj_Rem ( role , statelv ) 
	--LG("state_sj" , "function State_Sj_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mnatksa_dif = (-1) * 0.2 
	local mxatksa_dif = (-1) * 0.2  
	local mnatksa = (MnatkSa(role) - mnatksa_dif ) * ATTR_RADIX 
	local mxatksa = (MxatkSa(role) - mxatksa_dif ) * ATTR_RADIX 
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK ) 
	ALLExAttrSet(role)  
end 


--技能暴头————————————————————————————————————————————————————————————————————

function SkillSp_Bt ( sklv )										--技能"Headshot"的sp消耗公式
	local sp_reduce = sklv * 2 + 30  
	return sp_reduce 
end 

function SkillCooldown_Bt( sklv )
	local Cooldown = 25000
	return Cooldown
end

function Skill_Bt_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Bt ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Bt_End ( ATKER , DEFER , sklv ) 
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	local 	dmg = math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.005 * sklv) ) 
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local dex_atker = Dex(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
				dmg = math.floor ( dex_atker*2 + 30 * sklv +hp * ( 0.05 +0.005 * sklv) ) 
	--			Notice ( "dmg="..dmg)
			end
		end
	if dmg > 2500 then
		dmg = 2500
	end
	local Check_Heilong  = CheckItem_Heilong ( ATKER )
	if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.1 )
			if Percentage == 1 then
				  dmg =  dmg*10 
				SystemNotice ( ATKER , "Obtain power from Black Dragon set. Damage bonus")
			end
	end
	hp = hp - dmg 
	SetCharaAttr ( hp , DEFER , ATTR_HP ) 
end 

--技能天使护盾————————————————————————————————————————————————————————————————————
function SkillSp_Tshd ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end

function SkillCooldown_Tshd( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_Tshd_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Tshd ( sklv )	
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Tshd_End ( ATKER , DEFER , sklv )  
	local statelv = sklv 
	local statetime = 30 + sklv * 3  
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local sta_atker = Sta(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (ATKER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
			 statetime =math.max(30,math.floor(sta_atker/5))+sklv*3
		--		Notice ( "statetime="..statetime)
			end
		end
	----boss使用技能处理
	if GetChaTypeID( ATKER ) == 984 then
		statetime = 360
		statelv = 10
	end
	----boss使用技能处理结束
        AddState( ATKER , DEFER , STATE_TSHD, statelv , statetime )
	--LG("skill_Tshd", "function Skill_Oper_Tshd: " , "add state tshd " , "\n" ) 
end 

function State_Tshd_Add ( role , statelv ) 
	--LG("state_tshd" , "function State_Tshd_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local defsa_dif = 0.03 * statelv 
	local defsa = math.floor ( ( DefSa(role) + defsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	ALLExAttrSet(role)  
end 

function State_Tshd_Rem ( role , statelv ) 
	--LG("state_xlzh" , "function State_Tshd_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local defsa_dif = 0.03 * statelv 
	local defsa = math.floor ( ( DefSa(role) - defsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	ALLExAttrSet(role)  
end 

--技能心灵屏障————————————————————————————————————————————————————————————————————
function SkillSp_Xlpz ( sklv )										
	local sp_reduce = 0  
	return sp_reduce 
end

function SkillCooldown_Xlpz( sklv )
	local Cooldown = 1000
	return Cooldown
end

function Skill_Xlpz_Begin ( role , sklv ) 
	local sp = Sp( role ) 
	local sp_reduce = SkillSp_Xlpz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Xlpz_End ( ATKER , DEFER , sklv )  
	local statelv = sklv 
	local statetime = -1  
	----boss使用技能处理
	if GetChaTypeID( ATKER ) == 984 then
		statelv = 10
	end
	----boss使用技能处理结束
        AddState( ATKER , DEFER , STATE_MFD, statelv , statetime )
	--LG("skill_Xlpz", "function Skill_Oper_Xlpz: " , "add state xlpz " , "\n" ) 
end 

--技能潜行————————————————————————————————————————————————————————————————————————————————

function SkillSp_Ys ( sklv ) 
	local sp_reduce = 10  
	return sp_reduce 
end 

function SkillCooldown_Ys( sklv ) 
	local Cooldown = 30000 
	return Cooldown 
end 

function Skill_Ys_Begin ( role , sklv ) 
	--LG( "skill_ys", "enter function Skill_Atk_Ys : " , "\n" ) 
	--LG("skill_ys", "function Skill_Atk_Ys : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Ys ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Ys_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_ys", "enter function Skill_Def_Ys : " , "\n" ) 
	local statelv = sklv 
	local statetime = 20 + sklv * 10
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local agi_atker = Agi(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
		if Can_Pk_Garner2 == 0 then
			statetime = 20 + agi_atker/4 + sklv*5
	--		Notice ( "statetime="..statetime)
		end
	end
	AddState ( ATKER , DEFER , STATE_YS , statelv , statetime ) 
	--LG("skill_ys", "function Skill_Def_Ys : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
end 



function State_Ys_Add ( role , statelv ) 
	--LG("state_Ys" , "function State_Ys_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = 10 - math.floor ( statelv * 0.5  ) 
--	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( role )
	local agi_atker = Agi(role)
	local Can_Pk_Garner2 = Is_NormalMonster (role)
--	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
--		if Can_Pk_Garner2 == 0 then
--			local mspdsa_dif = 0.02 + 0.005 * statelv 
--			local aspdsa_dif = 0.02 + 0.005 * statelv 
--			local mspdsa = math.floor ( (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX) 
--	--		local aspdsa = math.floor ( (AspdSa(role) + aspdsa_dif ) * ATTR_RADIX)
--			SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD )
--			SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )
--			ALLExAttrSet(role) 
--			local sp_reduce = 12 - agi_atker/60 
--		end
--	end
	sp = sp - sp_reduce 
	if sp <= 0 then			--sp不足时移除隐身状态 
		RemoveState ( role , STATE_YS ) 
		return 
	end 
	SetCharaAttr ( sp , role , ATTR_SP ) 
end 

function State_Ys_Rem ( role , statelv ) 
	local map_name_DEFER = GetChaMapName ( role )
	local agi_atker = Agi(role)
	local Can_Pk_Garner2 = Is_NormalMonster (role)
--	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
--		if Can_Pk_Garner2 == 0 then
--			local mspdsa_dif = 0.02 + 0.005 * statelv 
--			Notic("State_Ys_Rem")
--			local aspdsa_dif = 0.02 + 0.005 * statelv 
--			local mspdsa = math.floor ( (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX) 
--	--		local aspdsa = math.floor ( (AspdSa(role) - aspdsa_dif ) * ATTR_RADIX)
--			SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD )
--			SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )
--			ALLExAttrSet(role) 
--		end
--	end
end 



--技能海藻缠绕——————————————————————————————————————————————————————————————————————
function SkillSp_Hzcr ( sklv )										
	local sp_reduce = 20 + sklv * 1  
	return sp_reduce 
end

function SkillCooldown_Hzcr( sklv )
	local Cooldown = 12000
	return Cooldown
end

function Skill_Hzcr_Begin ( role , sklv ) 
	--LG( "skill_hzcr", "enter function Skill_Atk_Hzcr : " , "\n" ) 
	--LG("skill_hzcr", "function Skill_Atk_Hzcr : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Hzcr ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Hzcr_End ( ATKER , DEFER , sklv ) 
--	LG( "skill_hzcr", "enter function Skill_Def_Hzcr : " , "\n" ) 
--	a = ChaIsBoat ( ATKER ) 
--	if a == 1 then 
--		LG ( "skill_hzcr" , " ATKER character status type as ship= " , a ) 
--	else 
--		LG ( "skill_hzcr" , " ATKER character status type as character= " , a ) 
--	end 
--	b = ChaIsBoat ( DEFER ) 
--	if b == 1 then 
--		LG ( "skill_hzcr" , " DEFER character status type as ship= " , b ) 
--	else 
--		LG ( "skill_hzcr" , " DEFER character status type as character= " , b ) 
--	end 
	local statelv = sklv 
	local statetime =math.floor ( 6 + sklv * 0.5 ) 
	local role1 = TurnToCha ( ATKER )
	local Check_Heilong  = CheckItem_Heilong ( role1)
		if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.8 )
			if Percentage == 1 then
				  statetime =  statetime*2
				SystemNotice ( ATKER , "Obtain power from Black Dragon set. Duration of skill extended")
			end
	end
	local hp_defer = Mxhp ( DEFER ) 
	if hp_defer >= 1000000 then 
		local a = Percentage_Random (0.5)
		if a == 1 then
			statetime = math.floor ( 6 + sklv * 0.5 ) 
		else
			SetSus( DEFER , 0 )
			SystemNotice ( ATKER , "Alga Entanglement failed" ) 
			return
		end
	end 

	AddState ( ATKER , DEFER , STATE_HZCR , statelv , statetime ) 
--	LG("skill_hzcr", "function Skill_Def_Hzcr : " , "ATKER = " , ATKER , "DEFER = ", DEFER , "sklv =  " , sklv , "\n" ) 
end 


function State_Hzcr_Add ( role , statelv ) 
	local dmg = 10 + statelv * 2 
	Endure_Dmg ( role , dmg ) 
end 

function State_Hzcr_Rem ( role , statelv ) 
end
-------------技能嘲讽---------------------------------------------------------------------------------------------------------------
function SkillSp_CHF ( sklv )										
	local sp_reduce = 10  
	return sp_reduce 
end 

function SkillCooldown_CHF( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_CHF_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_CHF ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_CHF_End ( ATKER , DEFER , sklv )

	local statelv = sklv 
	local statetime = 10 + sklv  
        local mxhp = Mxhp ( DEFER )
	local hate = mxhp
	
	if ValidCha ( ATKER ) == 0 then
		LG("Skill_CHF" , "Attacker as null")
		SkillUnable( ATKER )   
		return
	end
	
	if ValidCha ( DEFER ) == 0 then
		LG("Skill_CHF" , "Attacked target as nil")
		SkillUnable( ATKER )   
		return
	end
	
	if IsPlayer( DEFER ) == 1 then
		LG("Skill_CHF" , "Victim as")
		SkillUnable( ATKER )   
		return
	end
	AddState( ATKER , DEFER , STATE_CHF, statelv , statetime )
	AddHate ( DEFER , ATKER , hate )


	Check_Ys_Rem ( ATKER , DEFER)
end 

function State_Chf_Add ( role , statelv )
		local map_name_DEFER = GetChaMapName ( role )
		local Can_Pk_Garner2 = Is_NormalMonster (role)
		
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
		local sklv =math.floor(statelv)-1
		local CfLv = (statelv - sklv)*10
		--	if Can_Pk_Garner2 == 0 then
				if CfLv ~= 0 then
				--	local statelv = sklv  
					local defsa_dif = 0.02 * CfLv 
					local defsa = math.floor ( (DefSa(role) - defsa_dif ) * ATTR_RADIX )
					SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
					ALLExAttrSet(role)
				end	
	--		end
		end

end

function State_Chf_Rem ( role , statelv )
	local HateList = {}
	local Hate = {}
	local i = 0
	local HateMax = 0
	local ATKER = role
	local mxhp = Mxhp ( role )
	local hate = mxhp * -1
		local map_name_DEFER = GetChaMapName ( role )
		local Can_Pk_Garner2 = Is_NormalMonster (role)
		
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
		local sklv =math.floor(statelv)-1
		local CfLv = (statelv - sklv)*10
		-- Notice("CfLv ="..CfLv)
		--	if Can_Pk_Garner2 == 0 then
				if CfLv ~= 0 then
				--	local statelv = sklv  
					local defsa_dif = 0.02 * CfLv 
					local defsa = math.floor ( (DefSa(role) + defsa_dif ) * ATTR_RADIX )
					SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
					ALLExAttrSet(role)
				end	
	--		end
		end
	for i = 1 , 5 , 1 do
		HateList[i] , Hate[i] = GetChaHateByNo ( role , i-1 )
			
	end
	for i = 1 , 5 , 1 do
		if Hate[i] > HateMax then
			HateMax = Hate[i]
		end
	end
	for i = 1 , 5 , 1 do
		if Hate[i] == HateMax then
			ATKER = HateList[i]
		end
	end
	
	if ValidCha ( role ) == 0 then
		LG("Skill_CHF" , "Target as null")
		SkillUnable( role )   
		return
	end

	if ValidCha ( ATKER ) == 0 then
		LG("Skill_CHF" , "Target vengeance list as null")
--		SkillUnable( role )   
		return
	end
	
	
	AddHate ( role  , ATKER , hate )

end 

-----------技能咆哮---------------------------------------------------------------------------------------------------------------

function SkillArea_Circle_Pax ( sklv )										
	local side = 200 + 20 * sklv 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Pax( sklv )
	local Cooldown = 4000 - sklv * 200
	return Cooldown
end

function SkillPre_Pax ( sklv )									
end 

function SkillSp_Pax ( sklv )										
	local sp_reduce = 20
	return sp_reduce 
end 


function Skill_Pax_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Pax ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Pax_End ( ATKER , DEFER , sklv ) 
	
	local HateList = {}
	local Hate = {}
	local i = 0
	local HateMax = 0
	local Hate_dif = 0
	local Hate_fin = 0
	local statelv = sklv
	local statetime = 3
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	local CfLv = GetSkillLv (ATKER,242)
	local PxLv = GetSkillLv (ATKER,243)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			statelv = sklv + CfLv/10
		end
	if ValidCha ( ATKER ) == 0 then
			LG("Skill_PAX" , "Attacker as null")
			SkillUnable( ATKER )   
			return
	end
	
	if ValidCha ( DEFER ) == 0 then
			LG("Skill_PAX" , "Attacked target as nil")
			SkillUnable( ATKER )   
			return
	end
	
	if  IsPlayer( DEFER ) == 0 then
		for i = 1 , 5 , 1 do
			HateList[i] , Hate[i] = GetChaHateByNo ( DEFER , i-1 )
				
		end
		for i = 1 , 5 , 1 do
			if Hate[i] > HateMax then
				HateMax = Hate[i]
			end
		end
		for i = 1 , 5 , 1 do
			if HateList[i] == ATKER then
				Hate_dif = Hate[i]
			end
		end
		
		local mxhp = Mxhp ( DEFER )
		local hate = mxhp

		
		
		AddState( ATKER , DEFER , STATE_CHF, statelv , statetime )
		
		AddHate( DEFER , ATKER , hate )

		Check_Ys_Rem ( ATKER , DEFER)
	end
end 























--技能盾牌熟练——————————————————————————————————————————————————————————————————————————————————－－－－


function Skill_Dpsl_Use( role , sklv ) 
	--LG("skill_dpsl", "enter function Skill_Oper_Dpsl:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local defsb_dif = 3 * statelv 
	local resistsb_dif = 1 * statelv 
	local mspdsa_dif = (-1) * 0.02 * statelv 
	local defsb = DefSb(role) + defsb_dif  
	local resistsb = ResistSb(role) + resistsb_dif 
	local mspdsa = MspdSa(role) + mspdsa_dif 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF ) 
	SetCharaAttr( resistsb , role , ATTR_STATEV_PDEF ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )
	ALLExAttrSet(role)  
end 



function Skill_Dpsl_Unuse( role , sklv ) 
	local statelv = sklv 
	local defsb_dif = 3 * statelv 
	local resistsb_dif = 1 * statelv 
	local mspdsa_dif = (-1) *  0.02 * statelv 
	local defsb = DefSb(role) - defsb_dif  
	local resistsb = ResistSb(role) - resistsb_dif 
	local mspdsa = MspdSa(role) - mspdsa_dif 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF ) 
	SetCharaAttr( resistsb , role , ATTR_STATEV_PDEF ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

--function State_Dpsl_Add ( role , statelv ) 
--	LG("state", "function State_Dpsl_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 



--function State_Dpsl_Rem ( role , statelv ) 
--	LG("state", "function State_Dpsl_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 



--技能巨剑熟练————————————————————————————————————————————————————————————————————


function Skill_Jjsl_Use( role , sklv ) 
	--LG("skill_jjslsl", "enter function Skill_Oper_Jjsl:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local atksb_dif = 7 * statelv 
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	local map_name_ATKER = GetChaMapName ( role )
--	local map_name_DEFER = GetChaMapName ( DEFER )
--	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	local JianLv = GetSkillLv (role,62)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			local hitsa_dif = (1) * (  0.02 * JianLv ) 
			local hitsa = math.floor (  (HitSa(role) + hitsa_dif ) * ATTR_RADIX ) 
			SetCharaAttr( hitsa , role , ATTR_STATEC_HIT ) 
		end
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
	--LG("skill_jjsl", "function Skill_Oper_Jjsl: " , "add state jjsl " , "\n" ) 
end 



function Skill_Jjsl_Unuse( role , sklv ) 
	local statelv = sklv 
	local atksb_dif = 7 * statelv 
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
		local map_name_ATKER = GetChaMapName ( role )
--	local map_name_DEFER = GetChaMapName ( DEFER )
--	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	local JianLv = GetSkillLv (role,62)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			local hitsa_dif = (1) * (  0.02 * JianLv ) 
			local hitsa = math.floor (  (HitSa(role) - hitsa_dif ) * ATTR_RADIX ) 
			SetCharaAttr( hitsa , role , ATTR_STATEC_HIT ) 
		end
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 

--function State_Jjsl_Add ( role , statelv ) 
--	LG("state", "function State_Jjsl_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 



--function State_Jjsl_Rem ( role , statelv ) 
--	LG("state", "function State_Jjsl_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 

--end 


--技能剑术熟练————————————————————————————————————————————————————————————————————


function Skill_Jssl_Use( role , sklv ) 
	--LG("skill_jssl", "enter function Skill_Oper_Jssl:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local atksb_dif = 4 * statelv 
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
	--LG("skill_jssl", "function Skill_Oper_Jssl: " , "add state Jssl " , "\n" ) 
end 



function Skill_Jssl_Unuse( role , sklv ) 
	local statelv = sklv 
	local atksb_dif = 4 * statelv 
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 

--function State_Jssl_Add ( role , statelv ) 
--	LG("state", "function State_Jssl_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 



--function State_Jssl_Rem ( role , statelv ) 
--	LG("state", "function State_Jssl_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 

--end 




--技能兽化体质————————————————————————————————————————————————————————————————————————————
function Skill_Shtz_Use( role , sklv ) 
	--LG("skill_shtz", "enter function Skill_Oper_Shtz:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local mxhpsb_dif = 50 * statelv 
	local mxhpsb = MxhpSb(role) + mxhpsb_dif  
	SetCharaAttr( mxhpsb , role , ATTR_STATEV_MXHP ) 
	ALLExAttrSet(role)  
	--LG("skill_shtz", "function Skill_Oper_Shtz: " , "add state shtz " , "\n" ) 
end 

function Skill_Shtz_Unuse( role , sklv ) 
	local statelv = sklv 
	local mxhpsb_dif = 50 * statelv 
	local mxhpsb = MxhpSb(role) - mxhpsb_dif  
	SetCharaAttr( mxhpsb , role , ATTR_STATEV_MXHP ) 
	ALLExAttrSet(role)  
	--LG( " Luaerror " , " Skill - Beast Strength transfer mode error" ,  "transfer mode tranxwer_type = " , tranxwer_type , "\n" ) 
end 

--function State_Shtz_Add ( role , statelv ) 
--	LG("state", "function State_Shtz_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Shtz_Rem ( role , statelv ) 
--	LG("state", "function State_Shtz_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--技能强化体质————————————————————————————————————————————————————————————————————————————
function Skill_Qhtz_Use( role , sklv ) 
	--LG("skill_qhtz", "enter function Skill_Oper_Qhtz:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local mxhpsb_dif = 20 * statelv + Con(role) * 3 
	local mxhpsb = MxhpSb(role) + mxhpsb_dif  
	local map_name_ATKER = GetChaMapName ( role )
	--local map_name_DEFER = GetChaMapName ( DEFER )
	--local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			local GTYZ_Lv = GetSkillLv(role,63)
			local  resistsb_dif = 1 * GTYZ_Lv
			local resistsb = ResistSb(role) + resistsb_dif
			SetCharaAttr( resistsb , role , ATTR_STATEV_PDEF )
		end
	
	SetCharaAttr( mxhpsb , role , ATTR_STATEV_MXHP ) 
	ALLExAttrSet(role)  
	--LG("skill_qhtz", "function Skill_Oper_Qhtz: " , "add state qhtz " , "\n" ) 
end 

function Skill_Qhtz_Unuse( role , sklv ) 
	local statelv = sklv 
	local mxhpsb_dif = 20 * statelv + Con(role) * 3 
	local mxhpsb = MxhpSb(role) - mxhpsb_dif  
	local map_name_ATKER = GetChaMapName ( role )
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			local GTYZ_Lv = GetSkillLv(role,63)
			local  resistsb_dif = 1 * GTYZ_Lv
			local resistsb = ResistSb(role) - resistsb_dif
			SetCharaAttr( resistsb , role , ATTR_STATEV_PDEF )
		end
	SetCharaAttr( mxhpsb , role , ATTR_STATEV_MXHP ) 
	ALLExAttrSet(role)  
	--LG( " Luaerror " , " Skill--Strengthen transfer mode error" ,  "transfer mode tranxwer_type = " , tranxwer_type , "\n" ) 
end 

--function State_Qhtz_Add ( role , statelv ) 
--	LG("state", "function State_Qhtz_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Qhtz_Rem ( role , statelv ) 
--	LG("state", "function State_Qhtz_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 


--技能灵巧回避————————————————————————————————————————————————————————————————————————————
function Skill_Lqhb_Use( role , sklv ) 
	--LG("skill_lqhb", "enter function Skill_Oper_Lqhb:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local fleesb_dif = 3 * statelv 
	local fleesb = FleeSb(role) + fleesb_dif  
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE ) 
	ALLExAttrSet(role)  
	--LG("skill_lqhb", "function Skill_Oper_Lqhb: " , "add state lqhb " , "\n" ) 
end 

function Skill_Lqhb_Unuse( role , sklv ) 
	local statelv = sklv 
	local fleesb_dif = 3 * statelv 
	local fleesb = FleeSb(role) - fleesb_dif  
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE ) 
	ALLExAttrSet(role)  
	--LG( " Luaerror " , " Skill - Beast Strength transfer mode error" ,  "transfer mode tranxwer_type = " , tranxwer_type , "\n" ) 
end 

--function State_Lqhb_Add ( role , statelv ) 
--	LG("state", "function State_Lqhb_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Lqhb_Rem ( role , statelv ) 
--	LG("state", "function State_Lqhb_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 


--技能剑道专注————————————————————————————————————————————————————————————————————————————
function Skill_Jdzz_Use( role , sklv ) 
	--LG("skill_jdzz", "enter function Skill_Oper_Jdzz:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local hitsb_dif = 1 * statelv 
	local hitsb = HitSb(role) + hitsb_dif  
	SetCharaAttr( hitsb , role , ATTR_STATEV_HIT ) 
	ALLExAttrSet(role)  
	--LG("skill_jdzz", "function Skill_Oper_Jdzz: " , "add state jdzz " , "\n" ) 
end 

function Skill_Jdzz_Unuse( role , sklv ) 
	local statelv = sklv 
	local hitsb_dif = 1 * statelv 
	local hitsb = HitSb(role) - hitsb_dif  
	SetCharaAttr( hitsb , role , ATTR_STATEV_HIT ) 
	ALLExAttrSet(role)  
	--LG( " Luaerror " , " Skill - Beast Strength transfer mode error" ,  "transfer mode tranxwer_type = " , tranxwer_type , "\n" ) 
end 

--function State_Jdzz_Add ( role , statelv ) 
--	LG("state", "function State_Jdzz_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Jdzz_Rem ( role , statelv ) 
--	LG("state", "function State_Jdzz_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 


--技能蛮牛热血————————————————————————————————————————————————————————————————————————————
function Skill_Mnrx_Use( role , sklv ) 
	--LG("skill_mnrx", "enter function Skill_Oper_Mnrx:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local mxhpsa_dif = 0.1 + 0.02 * statelv 
	local defsa_dif = 0.1 + 0.02 * statelv 
	local mxhpsa = math.floor ( (MxhpSa(role) + mxhpsa_dif ) * ATTR_RADIX )
	local defsa = math.floor ( (DefSa(role) + defsa_dif ) * ATTR_RADIX )	
	local map_name_ATKER = GetChaMapName ( role )
--	local map_name_DEFER = GetChaMapName ( DEFER )
--	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	local GangTieLv = GetSkillLv (role,63)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			local hrecsb_dif =  10 * GangTieLv  
			local hrecsb = math.floor ( ( HrecSb ( role ) + hrecsb_dif )  ) 
			SetCharaAttr( hrecsb , role , ATTR_STATEV_HREC ) 
		end
	SetCharaAttr( mxhpsa , role , ATTR_STATEC_MXHP ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 

	ALLExAttrSet(role)  
	--LG("skill_mnrx", "function Skill_Oper_Mnrx: " , "add state mnrx " , "\n" ) 
end 
 
function Skill_Mnrx_Unuse( role , sklv ) 
	local statelv = sklv 
	local mxhpsa_dif = 0.1 + 0.02 * statelv 
	local defsa_dif = 0.1 + 0.02 * statelv 
	local mxhpsa = math.floor ( (MxhpSa(role) - mxhpsa_dif ) * ATTR_RADIX )
	local defsa = math.floor ( (DefSa(role) - defsa_dif ) * ATTR_RADIX )
		local map_name_ATKER = GetChaMapName ( role )
--	local map_name_DEFER = GetChaMapName ( DEFER )
--	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
	local GangTieLv = GetSkillLv (role,63)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			local hrecsb_dif =  10 * GangTieLv  
			local hrecsb = math.floor ( ( HrecSb ( role ) + hrecsb_dif )  ) 
			SetCharaAttr( hrecsb , role , ATTR_STATEV_HREC ) 
		end
	SetCharaAttr( mxhpsa , role , ATTR_STATEC_MXHP ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	ALLExAttrSet(role)  
end 

--function State_Mnrx_Add ( role , statelv ) 
--	LG("state", "function State_Mnrx_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Mnrx_Rem ( role , statelv ) 
--	LG("state", "function State_Mnrx_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 
--技能幻影闪————————————————————————————————————————————————————————————————————————————
function Skill_Hys_Use( role , sklv ) 
	--LG("skill_hys", "enter function Skill_Oper_Hys:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local fleesb_dif =4 * statelv 
	local fleesb = math.floor ( ( FleeSb(role) + fleesb_dif  )    )  
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE ) 
	ALLExAttrSet(role)  
	--LG("skill_hys", "function Skill_Oper_Hys: " , "add state hys " , "\n" ) 
end 

function Skill_Hys_Unuse( role , sklv ) 
	local statelv = sklv 
	local fleesb_dif = 4 * statelv 
	local fleesb = math.floor ( ( FleeSb(role) - fleesb_dif  )  )  
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE ) 
	ALLExAttrSet(role)  
end 

--function State_Hys_Add ( role , statelv ) 
--	LG("state", "function State_Hys_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Hys_Rem ( role , statelv ) 
--	LG("state", "function State_Hys_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 


--技能破血狂攻————————————————————————————————————————————————————————————————————————————
function Skill_Pxkg_Use( role , sklv ) 
	--LG("skill_pxkg", "enter function Skill_Oper_Pxkg:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv 
	local aspdsa_dif =  ( 0.1 + 0.01 * statelv ) 
	local map_name_ATKER = GetChaMapName ( role )
--	local map_name_DEFER = GetChaMapName ( DEFER )
	local str_atker = Str(role)
	--local Can_Pk_Garner2 = Is_NormalMonster (role)
	--	if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
	--		if Can_Pk_Garner2 == 0 then
	--			aspdsa_dif = ( 0.1 + str_atker/20000 * statelv ) 
		--		Notice ( "statetime="..statetime)
	--		end
	--	end
	local aspdsa = math.floor ( ( AspdSa(role) + aspdsa_dif  ) * ATTR_RADIX   )  
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	ALLExAttrSet(role)  
	--LG("skill_pxkg", "function Skill_Oper_Pxkg: " , "add state pxkg " , "\n" ) 
end 

function Skill_Pxkg_Unuse( role , sklv ) 
	local statelv = sklv 
	local aspdsa_dif =  ( 0.1 + 0.01 * statelv ) 
	local aspdsa = math.floor ( ( AspdSa(role) - aspdsa_dif  ) * ATTR_RADIX   )  
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	ALLExAttrSet(role)  
end 

--function State_Pxkg_Add ( role , statelv ) 
--	LG("state", "function State_Pxkg_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Pxkg_Rem ( role , statelv ) 
--	LG("state", "function State_Pxkg_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--技能体质回复————————————————————————————————————————————————————————————————————————————
function Skill_Tzhf_Use( role , sklv ) 
	--LG("skill_tzhf", "enter function Skill_Oper_tzhf:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local hrecsb_dif =  statelv  
	local hrecsb = math.floor ( ( HrecSb(role) + hrecsb_dif  ) * ATTR_RADIX   )  
	SetCharaAttr( hrecsb , role , ATTR_STATEV_HREC ) 
	ALLExAttrSet(role)  
	--LG("skill_tzhf", "function Skill_Oper_tzhf: " , "add state tzhf " , "\n" ) 
end 

function Skill_Tzhf_Unuse( role , sklv ) 
	local statelv = sklv 
	local hrecsb_dif =  statelv  
	local hrecsb = math.floor ( ( HrecSb(role) - hrecsb_dif  ) * ATTR_RADIX   )  
	SetCharaAttr( hrecsb , role , ATTR_STATEV_HREC ) 
	ALLExAttrSet(role)  
end 

--function State_Tzhf_Add ( role , statelv ) 
--	LG("state", "function State_tzhf_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Tzhf_Rem ( role , statelv ) 
--	LG("state", "function State_tzhf_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--技能荆棘之盾————————————————————————————————————————————————————————————————————————————

function Skill_Zjft_Use( role , sklv ) 
	--LG("skill_zjft", "enter function Skill_Oper_Zjft:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	AddState ( role , role , STATE_ZJFT , statelv , -1 ) 
	--LG("skill_zjft", "function Skill_Oper_Zjft: " , "add state zjft " , "\n" ) 
end 


function Skill_Zjft_Unuse( role , sklv ) 
	local statelv = sklv 
	RemoveState ( role , STATE_ZJFT ) 
	--LG( " Luaerror" , " Skill - heavy armor reflect transfer mode error" ,  "transfer mode tranxwer_type = " , tranxwer_type , "\n" ) 
end 

--技能弓箭熟练公式————————————————————————————————————————————————————

function Skill_Gjsl_Use( role , sklv ) 
	--LG("skill_gjsl", "enter function Skill_Oper_Gjsl:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local mnatksb_dif = 2 * statelv 
	local mxatksb_dif = 2 * statelv 
	local mnatksb = MnatkSb(role) + mnatksb_dif 
	local mxatksb = MxatkSb(role) + mxatksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
	--LG("skill_gjsl", "function Skill_Oper_Gjsl: " , "add state gjsl " , "\n" ) 
end 



function Skill_Gjsl_Unuse( role , sklv ) 
	local statelv = sklv 
	local mnatksb_dif = 2 * statelv 
	local mxatksb_dif = 2 * statelv 
	local mnatksb = MnatkSb(role) - mnatksb_dif 
	local mxatksb = MxatkSb(role) - mxatksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
	--LG( " Luaerror" , " Skill - Archery transfer mode error" ,  "transfer mode tranxwer_type = " , tranxwer_type , "\n" ) 
end 

--function State_Gjsl_Add ( role , statelv ) 
--	LG("state", "function State_Gjsl_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Gjsl_Rem ( role , statelv ) 
--	LG("state", "function State_Gjsl_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--技能疾风步————————————————————————————————————————————————————————————————————————————
function Skill_Jfb_Use( role , sklv ) 
	--LG("skill_jfb", "enter function Skill_Oper_jfb:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local mspdsa_dif =  statelv * 0.02   
	local mspdsa = (MspdSa(role) + mspdsa_dif) * ATTR_RADIX  
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
	--LG("skill_jfb", "function Skill_Oper_jfb: " , "add state jfb " , "\n" ) 
end 

function Skill_Jfb_Unuse( role , sklv ) 
	local statelv = sklv 
	local mspdsa_dif =  statelv * 0.02 
	local mspdsa = (MspdSa(role) - mspdsa_dif) *  ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

--function State_Jfb_Add ( role , statelv ) 
--	LG("state", "function State_jfb_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Jfb_Rem ( role , statelv ) 
--	LG("state", "function State_jfb_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--技能精神加持——————————————————————————————————————————————————————————————————————

function Skill_Jsjc_Use( role , sklv ) 
	--LG("skill_jsjc", "enter function Skill_Oper_jsjc:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local mxspsb_dif =  statelv * 40    
	local mxspsb = math.floor ( MxspSb(role) + mxspsb_dif  )  
	SetCharaAttr( mxspsb , role , ATTR_STATEV_MXSP ) 
	ALLExAttrSet(role)  
	--LG("skill_jsjc", "function Skill_Oper_jsjc: " , "add state jsjc " , "\n" ) 
end 

function Skill_Jsjc_Unuse( role , sklv ) 
	local statelv = sklv 
	local mxspsb_dif =  statelv * 40    
	local mxspsb = math.floor ( MxspSb(role) - mxspsb_dif  )  
	SetCharaAttr( mxspsb , role , ATTR_STATEV_MXSP ) 
	ALLExAttrSet(role)  
end 

--function State_Jsjc_Add ( role , statelv ) 
--	LG("state", "function State_jsjc_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Jsjc_Rem ( role , statelv ) 
--	LG("state", "function State_jsjc_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--技能神佑————————————————————————————————————————————————————————————————

function Skill_Sy_Use( role , sklv ) 
	--LG("skill_sy", "enter function Skill_Oper_Sy:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local srecsb_dif = 1+statelv*1   
	local srecsb = SrecSb(role) + srecsb_dif
	SetCharaAttr( srecsb , role , ATTR_STATEV_SREC ) 
	ALLExAttrSet(role)  
	--LG("skill_sy", "function Skill_Oper_Sy: " , "add state sy " , "\n" ) 
end 



function Skill_Sy_Unuse( role , sklv ) 
	local statelv = sklv 
	local srecsb_dif = 2+statelv*1  
	local srecsb = SrecSb(role) - srecsb_dif
	SetCharaAttr( srecsb , role , ATTR_STATEV_SREC ) 
	ALLExAttrSet(role)  
end 

--function State_Sy_Add ( role , statelv ) 
--	LG("state", "function State_Sy_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--function State_Sy_Rem ( role , statelv ) 
--	LG("state", "function State_Sy_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

--end 



--技能坚韧————————————————————————————————————————————————————————————————

function Skill_Jr_Use( role , sklv ) 
	--LG("skill_jr", "enter function Skill_Oper_Jr:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local srecsb_dif = 1+statelv*1   
	local srecsb = SrecSb(role) + srecsb_dif
	SetCharaAttr( srecsb , role , ATTR_STATEV_SREC ) 
	ALLExAttrSet(role)  
	--LG("skill_jr", "function Skill_Oper_Jr: " , "add state jr " , "\n" ) 
end 



function Skill_Jr_Unuse( role , sklv ) 
	local statelv = sklv 
	local srecsb_dif = 1+statelv*1  
	local srecsb = SrecSb(role) - srecsb_dif
	SetCharaAttr( srecsb , role , ATTR_STATEV_SREC ) 
	ALLExAttrSet(role)  
end 




--技能顺流————————————————————————————————————————————————————————————————

function Skill_Sl_Use( role , sklv ) 
--	LG("skill_sl", "enter function Skill_Oper_Sl:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_mspdsa_dif = 0.05 + statelv * 0.01    
	local ship_mspdsa = ( Ship_MspdSa ( role ) + ship_mspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( ship_mspdsa , role , ATTR_BOAT_SKILLC_MSPD ) 
	ALLExAttrSet(role)  
end 



function Skill_Sl_Unuse( role , sklv ) 
--	LG("skill_sl", "enter function Skill_Sl_Unuse:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_mspdsa_dif = 0.05 + statelv * 0.01    
	local ship_mspdsa = ( Ship_MspdSa ( role ) - ship_mspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( ship_mspdsa , role , ATTR_BOAT_SKILLC_MSPD ) 
	ALLExAttrSet(role)  
end 

--技能贝壳装甲------------------------------------------------------------————————————————————————————————————————————————————————
function Skill_Bkzj_Use( role , sklv ) 
--	LG("skill_Bkzj", "enter function Skill_Oper_Bkzj:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_defsb_dif = statelv * 8    
	local ship_defsb = ( Ship_DefSb ( role ) + ship_defsb_dif )
	SetCharaAttr( ship_defsb , role , ATTR_BOAT_SKILLV_DEF ) 
	ALLExAttrSet(role)  
end 



function Skill_Bkzj_Unuse( role , sklv ) 
--	LG("skill_Bkzj", "enter function Skill_Oper_Bkzj:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_defsb_dif = statelv * 8    
	local ship_defsb = ( Ship_DefSb ( role ) - ship_defsb_dif )
	SetCharaAttr( ship_defsb , role , ATTR_BOAT_SKILLV_DEF ) 
	ALLExAttrSet(role)  
end 


--技能火炮熟练------------------------------------------------------------————————————————————————————————————————————————————————
function Skill_Hpsl_Use( role , sklv ) 
--	LG("skill_Hpsl", "enter function Skill_Oper_Hpsl:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_mxatk_dif = statelv * 25
	local ship_mnatk_dif = statelv * 25
	local ship_mxatk = ( Ship_Mxatk ( role ) + ship_mxatk_dif ) 
	local ship_mnatk = ( Ship_Mnatk ( role ) + ship_mnatk_dif )
	SetCharaAttr( ship_mxatk , role , ATTR_BOAT_SKILLV_MXATK ) 
	SetCharaAttr( ship_mnatk , role , ATTR_BOAT_SKILLV_MNATK ) 
	ALLExAttrSet(role)  
end 



function Skill_Hpsl_Unuse( role , sklv ) 
--	LG("skill_Bkzj", "enter function Skill_Oper_Bkzj:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_mxatk_dif = statelv * 25
	local ship_mnatk_dif = statelv * 25
	local ship_mxatk = ( Ship_Mxatk ( role ) - ship_mxatk_dif ) 
	local ship_mnatk = ( Ship_Mnatk ( role ) - ship_mnatk_dif )
	SetCharaAttr( ship_mxatk , role , ATTR_BOAT_SKILLV_MXATK ) 
	SetCharaAttr( ship_mnatk , role , ATTR_BOAT_SKILLV_MNATK ) 
	ALLExAttrSet(role)  
end 



--技能甲板加固------------------------------------------------------------————————————————————————————————————————————————————————
function Skill_Jbjg_Use( role , sklv ) 
	LG("skill_Jbjg", "enter function Skill_Oper_Jbjg:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_def_dif = statelv * 12    
	local ship_def = ( Ship_Def ( role ) + ship_def_dif )  
	SetCharaAttr( ship_def , role , ATTR_BOAT_SKILLV_DEF ) 
	ALLExAttrSet(role)  
end 



function Skill_Jbjg_Unuse( role , sklv ) 
	LG("skill_Jbjg", "enter function Skill_Oper_Jbjg:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_def_dif = statelv * 12    
	local ship_def = ( Ship_Def ( role ) - ship_def_dif )  
	SetCharaAttr( ship_def , role , ATTR_BOAT_SKILLV_DEF ) 
	ALLExAttrSet(role)  
end 


--技能操帆术------------------------------------------------------------————————————————————————————————————————————————————————
function Skill_Cfs_Use( role , sklv ) 
	LG("skill_Cfs", "enter function Skill_Oper_Cfs:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_aspdsa_dif = 0.1 + statelv * 0.02    
	local ship_aspdsa = ( Ship_AspdSa ( role ) + ship_aspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( ship_aspdsa , role , ATTR_BOAT_SKILLC_ASPD ) 
	ALLExAttrSet(role)  
end 



function Skill_Cfs_Unuse( role , sklv ) 
	LG("skill_Cfs", "enter function Skill_Oper_Cfs:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_aspdsa_dif = 0.1 + statelv * 0.02    
	local ship_aspdsa = ( Ship_AspdSa ( role ) - ship_aspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( ship_aspdsa , role , ATTR_BOAT_SKILLC_ASPD ) 
	ALLExAttrSet(role)  
end 


--技能船体强化------------------------------------------------------------————————————————————————————————————————————————————————
function Skill_Ctqh_Use( role , sklv ) 
	LG("skill_Ctqh", "enter function Skill_Oper_Ctqh:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_hp_dif = statelv * 400    
	local ship_hp = ( Ship_Mxhp ( role ) + ship_hp_dif ) 
	SetCharaAttr( ship_hp , role , ATTR_BOAT_SKILLV_MXUSE ) 
	ALLExAttrSet(role)  
end 



function Skill_Ctqh_Unuse( role , sklv ) 
	LG("skill_Ctqh", "enter function Skill_Oper_Ctqh:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_hp_dif = statelv * 400    
	local ship_hp = ( Ship_Mxhp ( role ) - ship_hp_dif ) 
	SetCharaAttr( ship_hp , role , ATTR_BOAT_SKILLV_MXUSE ) 
	ALLExAttrSet(role)  
end 


--技能补给扩容------------------------------------------------------------————————————————————————————————————————————————————————
function Skill_Bjcr_Use( role , sklv ) 
	LG("skill_Bjcr", "enter function Skill_Oper_Bjcr:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_sp_dif = statelv * 30    
	local ship_sp = ( Ship_Mxsp ( role ) + ship_sp_dif ) 
	SetCharaAttr( ship_sp , role , ATTR_BOAT_SKILLV_MXSPLY ) 
	ALLExAttrSet(role)  
end 



function Skill_Bjcr_Unuse( role , sklv ) 
	LG("skill_Bjcr", "enter function Skill_Oper_Bjcr:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local ship_sp_dif = statelv * 30    
	local ship_sp = ( Ship_Mxsp ( role ) - ship_sp_dif ) 
	SetCharaAttr( ship_sp , role , ATTR_BOAT_SKILLV_MXSPLY ) 
	ALLExAttrSet(role)  
end 


--技能丛林行者——————————————————————————————————————————————————————————————————————————————

function Skill_Clxz_Use( role , sklv )										--技能丛林行者的激活
	--LG("skill_clxz", "enter function Skill_Oper_Clxz:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local fleesb_dif = 3 * statelv 
	local fleesb =  FleeSb(role) + fleesb_dif  
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE ) 
	ALLExAttrSet(role)  
	--LG("skill_clxz", "function Skill_Oper_Clxz: " , "add state clxz " , "\n" ) 
end 



function Skill_Clxz_Unuse( role , sklv )									--技能丛林行者的消除
	local statelv = sklv 
	local fleesb_dif = 3 * statelv 
	local fleesb =  FleeSb(role) - fleesb_dif  
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE ) 
	ALLExAttrSet(role)  
	--LG( " Luaerror" , " Skill - Traversing transfer mode error" ,  "transfer mode tranxwer_type = " , tranxwer_type , "\n" ) 
end 

--function State_Clxz_Add ( role , statelv )								--状态丛林行者的效果激活
--	LG("state", "function State_Clxz_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 



--function State_Clxz_Rem ( role , statelv )								--状态丛林行者的效果消除
--	LG("state", "function State_Clxz_Rem : " ," role = ", role, "statelv = " , statelv , "\n" ) 

	
--end 



--技能猎人伪装——————————————————————————————————————————————————————————————————————————————————－－－－


function Skill_Lrwz_Use( role , sklv ) 
	--LG("skill_lrwz", "enter function Skill_Oper_Lrwz:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local fleesb_dif = 2 * statelv 
	local fleesb = FleeSb(role) + fleesb_dif  
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE ) 
	ALLExAttrSet(role)  
	--LG("skill_lrwz", "function Skill_Oper_Lrwz: " , "add state lrwz " , "\n" ) 
end 



function Skill_Lrwz_Unuse( role , sklv ) 
	local statelv = sklv 
	local fleesb_dif = 2 * statelv 
	local fleesb = FleeSb(role) - fleesb_dif  
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE ) 
	ALLExAttrSet(role)  
end 

--function State_Lrwz_Add ( role , statelv ) 
--	LG("state", "function State_Lrwz_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 



--function State_Lrwz_Rem ( role , statelv ) 
--	LG("state", "function State_Lrwz_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 

--技能火枪熟练————————————————————————————————————————————————————————————————————————————

function Skill_Hqsl_Use( role , sklv ) 
	--LG("skill_hqsl", "enter function Skill_Oper_Hqsl:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local mnatksb_dif = 6 * statelv 
	local mxatksb_dif = 10 * statelv 
	local mnatksb = MnatkSb(role) + mnatksb_dif  
	local mxatksb = MxatkSb(role) + mxatksb_dif  
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
	--LG("skill_hqsl", "function Skill_Oper_Hqsl: " , "add state hqsl " , "\n" ) 
end 


function Skill_Hqsl_Unuse( role , sklv ) 
	local statelv = sklv  
	local mnatksb_dif = 6 * statelv 
	local mxatksb_dif = 10 * statelv 
	local mnatksb = MnatkSb(role) - mnatksb_dif  
	local mxatksb = MxatkSb(role) - mxatksb_dif  
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
	--LG( " Luaerror" , " Skill - Firegun Mastery transfer mode error" ,  "transfer mode tranxwer_type = " , tranxwer_type , "\n" ) 
end 

--function State_Hqsl_Add ( role , statelv ) 
--	LG("state", "function State_Hqsl_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 



--function State_Hqsl_Rem ( role , statelv ) 
--	LG("state", "function State_Hqsl_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 

--end 


--技能双手剑加成————————————————————————————————————————————————————————————————————————————


function Skill_Fsz_Use( role , sklv ) 
	--LG("skill_fsz", "enter function Skill_Oper_Fsz:", "sklv = ", sklv ,"role = ", role , "\n") 
	local statelv = sklv  
	local lefthand_rad_dif = statelv * 8 
	local lefthand_rad = GetChaAttr ( role , ATTR_LHAND_ITEMV ) + lefthand_rad_dif 
	SetCharaAttr ( lefthand_rad , role , ATTR_LHAND_ITEMV ) 
	--LG("skill_fsz", "function Skill_Oper_Fsz: " , "add state fsz " , "\n" ) 

end 

function Skill_Fsz_Unuse( role , sklv ) 
	local statelv = sklv 
	local lefthand_rad_dif = statelv * 8 
	local lefthand_rad = GetChaAttr ( role , ATTR_LHAND_ITEMV ) - lefthand_rad_dif 
	SetCharaAttr ( lefthand_rad , role , ATTR_LHAND_ITEMV ) 

end 

--function State_Fsz_Add ( role , statelv ) 
--	LG("state", "function State_Fsz_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 


--end 



--function State_Fsz_Rem ( role , statelv ) 
--	LG("state", "function State_Fsz_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 


--end 





--技能坐下——————————————————————————————————————————————————————————————————————————————

function Skill_Zx_Use( role , sklv ) 
	--LG("skill_zx", "enter function Skill_Oper_Zx:", "sklv = ", sklv ,"role = ", role , "\n") 
	local ys_statelv = GetChaStateLv ( role , STATE_YS ) 
	if ys_statelv >= 1 then  
		RemoveState( role , STATE_YS ) 
	end 
	local hrecsb_dif = 15  
	local hrecsa_dif = 5    
	local hrecsa = math.floor ( (HrecSa(role) + hrecsa_dif )  * ATTR_RADIX) 
	local hrecsb = math.floor ( ( HrecSb ( role ) + hrecsb_dif )  ) 
	--LG("skill_zx" , " form_hrecsa = " , HrecSa(role) , "\n" ) 
	--LG("skill_zx", "hrecsa = ", hrecsa, "\n") 
	--LG("skill_hrecsa" , " form_hrecsa = " , HrecSa(role) , "\n" ) 
	--LG("skill_hrecsa", "hrecsa = ", hrecsa, "\n") 
	SetCharaAttr( hrecsa , role , ATTR_STATEC_HREC ) 
	SetCharaAttr ( hrecsb , role , ATTR_STATEV_HREC ) 

	local srecsb_dif = 5 
	local srecsa_dif = 5    
	local srecsa = math.floor ( (SrecSa(role) + srecsa_dif ) * ATTR_RADIX ) 
	local srecsb = math.floor ( (SrecSb(role) + srecsb_dif )  ) 

	--LG("skill_zx" , " form_srecsa = " , SrecSa(role) , "\n" ) 
	--LG("skill_zx", "srecsa = ", srecsa, "\n") 
	--LG("skill_srecsa" , " form_srecsa = " , SrecSa(role) , "\n" ) 
	--LG("skill_srecsa", "srecsa = ", srecsa, "\n") 
	SetCharaAttr( srecsa , role , ATTR_STATEC_SREC ) 
	SetCharaAttr ( srecsb , role , ATTR_STATEV_SREC ) 
	Check_Ys_Rem ( role , role)
	ALLExAttrSet(role)
end 

function Skill_Zx_Unuse( role , sklv ) 
	--LG("skill_zx", "enter function Skill_Oper_Zx:", "sklv = ", sklv ,"role = ", role , "\n") 

	local hrecsb_dif = 15 
	local hrecsa_dif = 5    
	local hrecsa = math.floor ( (HrecSa(role) - hrecsa_dif )  * ATTR_RADIX) 
	local hrecsb = math.floor ( ( HrecSb ( role ) - hrecsb_dif ) ) 
	--LG("skill_zx" , " form_hrecsa = " , HrecSa(role) , "\n" ) 
	--LG("skill_zx", "hrecsa = ", hrecsa, "\n") 
	--LG("skill_hrecsa" , " form_hrecsa = " , HrecSa(role) , "\n" ) 
	--LG("skill_hrecsa", "hrecsa = ", hrecsa, "\n") 
	SetCharaAttr( hrecsa , role , ATTR_STATEC_HREC ) 
	SetCharaAttr ( hrecsb , role , ATTR_STATEV_HREC ) 

	local srecsb_dif = 5  
	local srecsa_dif = 5    
	local srecsa = math.floor ( (SrecSa(role) - srecsa_dif ) * ATTR_RADIX ) 
	local srecsb = math.floor ( (SrecSb(role) - srecsb_dif )  ) 

	--LG("skill_zx" , " form_srecsa = " , SrecSa(role) , "\n" ) 
	--LG("skill_zx", "srecsa = ", srecsa, "\n") 
	--LG("skill_srecsa" , " form_srecsa = " , SrecSa(role) , "\n" ) 
	--LG("skill_srecsa", "srecsa = ", srecsa, "\n") 
	SetCharaAttr( srecsa , role , ATTR_STATEC_SREC ) 
	SetCharaAttr ( srecsb , role , ATTR_STATEV_SREC ) 

	ALLExAttrSet(role)
end 










--技能流星箭雨——————————————————————————————————————————————————————————————————————————————


function SkillArea_Square_Lxjy ( sklv )										--技能“流星箭雨"的技能区域公式
	local side = 400 
	SetSkillRange ( 4 , side )  	
end 

function SkillPre_Lxjy ( sklv )										--技能"Meteor Shower"的技能前期准备
end 

function SkillCooldown_Lxjy( sklv )
	local Cooldown = 25000
	return Cooldown
end

function SkillSp_Lxjy ( sklv )										--技能"Meteor Shower"的sp消耗公式
	local sp_reduce = 26 + sklv * 2     
	return sp_reduce 
end 


function Skill_Lxjy_Begin ( role , sklv ) 
--   	Check_State ( role , nil ) 
	--LG( "skill_lxjy", "enter function Skill_Atk_Lxjy : " , "\n" ) 
	--LG("skill_lxjy", "function Skill_Atk_Lxjy : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Lxjy ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Lxjy_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_lxjy", "enter function Skill_Def_Lxjy : " , "\n" ) 
	--LG("skill_lxjy", "function Skill_Def_Lxjy : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local hp = Hp( DEFER ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Lxjy_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Lxjy_End : DEFER as null" ) 
		return 
	end 
	local dmg = ( 0.5 +sklv * 0.1 ) * Atk_Dmg ( ATKER , DEFER )  
	Hp_Endure_Dmg ( DEFER , dmg )  
	--LG( "Lxjy", "Meteor Shower Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

--技能狼嚎——————————————————————————————————————————————————————————————————————————————————————


function SkillArea_Circle_Lh ( sklv )										--技能“狼嚎"的技能区域公式
	--LG( "skarea_lh", " enter function SkillArea_Circle_Lh : " , "sklv = " ,sklv ) 
	local side = 300 + math.floor ( sklv * 20 ) 
	--LG( "skarea_lh" , " side = " , side ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Lh( sklv )
	local Cooldown = 5000
	return Cooldown
end

function SkillPre_Lh ( sklv )										--技能"Howl"的技能前期准备
end 

function SkillSp_Lh ( sklv )										--技能"Howl"的sp消耗公式
	local sp_reduce = 20 - math.floor ( sklv * 0.5 ) 
	return sp_reduce 
end 


function Skill_Lh_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Lh ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Lh_End ( ATKER , DEFER , sklv ) 
	--LG( "sk_lh" , "function Skill_Lh_End : "  , " Attacker: " , GetChaName(ATKER) , "Victim: " , GetChaName(DEFER), "sklv = " , sklv ) 
	local hp = Hp( DEFER ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Lh_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Lh_End : DEFER as null" ) 
		return 
	end 
	dmg = ( 1+sklv*0.05 ) * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , dmg )  
	--LG( "Lh", "Howl Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
	Check_Ys_Rem ( ATKER , DEFER)						--判断是否隐身
end 


--技能回旋盾击——————————————————————————————————————————————————————————
function SkillArea_Sector_Hxdj ( sklv )										--技能“回旋盾击"的技能区域公式
	local radius = 400 + math.floor ( sklv * 10 ) 
	local angle = 100 + math.floor ( sklv / 5 ) * 20 
	SetSkillRange ( 2 , radius , angle  )  
end 

function SkillCooldown_Hxdj( sklv )
	local Cooldown = 5000
	return Cooldown
end

function SkillPre_Hxdj ( sklv )										--技能"Parry"的技能前期准备
end 

function SkillSp_Hxdj ( sklv )										--技能"Parry"的sp消耗公式
	local sp_reduce = 20 + sklv * 2  
	return sp_reduce 
end 


function Skill_Hxdj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Hxdj ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Hxdj_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 5  
	local back_dis = 500 
	dmg = math.floor(150 + sklv * 20 )  
	Hp_Endure_Dmg ( DEFER , dmg )  
	AddState ( ATKER , DEFER , STATE_XY , statelv , statetime ) 
	BeatBack(ATKER , DEFER , back_dis) 
	--LG( "Hxdj", "Parry Skill Level= " , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

--技能野蛮碎裂————————————————————————————————————————————————————————————————————————


function SkillArea_Circle_Ymsl ( sklv )										--技能“野蛮碎裂"的技能区域公式
	--LG( "skarea_ymsl", " enter function SkillArea_Circle_Ymsl : " , "sklv = " ,sklv ) 
	local side = 200 + math.floor ( sklv * 10 ) 
	--LG( "skarea_ymsl" , " side = " , side ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Ymsl( sklv )
	local Cooldown = 5000
	return Cooldown
end

function SkillPre_Ymsl ( sklv )										--技能"Barbaric Crush"的技能前期准备
end 

function SkillSp_Ymsl ( sklv )										--技能"Barbaric Crush"的sp消耗公式
	local sp_reduce = 10 + sklv * 1  
	return sp_reduce 
end 


function Skill_Ymsl_Begin ( role , sklv ) 
	local sp = Sp( role ) 
	local sp_reduce = SkillSp_Ymsl ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		--LG("skill_ymsl", "function Skill_Atk_Ymsl : ", "SP insufficient to cast Barbaric Crush" , "\n" ) 
		return 
	end 
end 

function Skill_Ymsl_End ( ATKER , DEFER , sklv ) 
	local hp = Hp( DEFER ) 
	--LG("ymsl" , "enter defer_mod " ) 
	atk_rad = 1.5+sklv*0.1 
	hpdmg = Atk_Raise ( atk_rad , ATKER , DEFER )
	Hp_Endure_Dmg ( DEFER , hpdmg )  
	--LG( "Ymsl", "Barbaric Crush Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
 end


--技能大治愈——————————————————————————————————————————————————————————————————————————————

function SkillArea_Circle_Dzy ( sklv )									--技能“大治愈"的技能区域公式
	local side = 300 + math.floor ( sklv * 30 ) 
	SetSkillRange ( 4 , side )   
end 

function SkillPre_Dzy ( sklv )										--技能"Greater Heal"的技能前期准备
end 

function SkillCooldown_Dzy( sklv )
	local Cooldown = 10000
	return Cooldown
end

function SkillSp_Dzy ( sklv )										--技能"Greater Heal"的sp消耗公式
	local sp_reduce = 30 + sklv * 1 
	return sp_reduce 
end 


function Skill_Dzy_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Dzy (sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Dzy_End ( ATKER , DEFER , sklv ) 
	local dmg = ( -1 ) * math.floor(10 + 15 * sklv + math.floor ( Sta(ATKER)*0.5     )  )
	Hp_Endure_Dmg ( DEFER , dmg )  
	--LG( "Dzy", "Greater Heal Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 


--技能大回复术————————————————————————————————————————————————————————————————————————————————

function SkillArea_Circle_Dhfs ( sklv )									--技能“大回复术"的技能区域公式
	local side = 300 + math.floor ( sklv * 30 ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Dhfs( sklv )
	local Cooldown = 5000
	return Cooldown
end

function SkillPre_Dhfs ( sklv )										--技能"Greater Recover"的技能前期准备
end 

function SkillSp_Dhfs ( sklv )										--技能"Greater Recover"的sp消耗公式
	local sp_reduce = 15 + math.floor ( sklv*0.5 ) 
	return sp_reduce 
end 


function Skill_Dhfs_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Dhfs (sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Dhfs_End ( ATKER , DEFER , sklv ) 
		dmg = ( -1 ) * ( 5 + sklv * 3  ) 
		Hp_Endure_Dmg ( DEFER , dmg )  
		Rem_State_Unnormal ( DEFER ) 
		--LG( "Hfs", "Greater Recover Skill Level= " , sklv , "Skill Damage= " , dmg , '\n" ) 
end 


--技能贝壳冲击——————————————————————————————————————————————————————————————————

function SkillArea_Line_Bkcj ( sklv )										--技能"Conch Ray"的技能区域公式
	local lenth = 500 + sklv * 30  
	local width = 100 + sklv * 10 
	SetSkillRange ( 1 , lenth , width  )  
end

function SkillCooldown_Bkcj( sklv )
	local Cooldown = 7000 - sklv * 500
	return Cooldown
end

function SkillSp_Bkcj ( sklv )										
	local sp_reduce = 20+ sklv * 3   
	return sp_reduce 
end


function SkillEnergy_Bkcj ( sklv )										
	local energy_reduce = math.floor ( 3 + sklv * 0.5 )    
	return energy_reduce 
end 

function Skill_Bkcj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Bkcj ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Bkcj_End ( ATKER , DEFER , sklv ) 
	local sta_atk= Sta ( ATKER ) 
	local sta_def = Sta ( DEFER ) 
	local AddStateLv = 0
	AddStateLv = GetChaStateLv ( ATKER , STATE_MLCH ) 

	local dmg = math.floor( 200 + sklv*30 +sta_atk*6 ) 

	local map_name_DEFER = GetChaMapName ( DEFER )
	local agi_atker = Agi(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then


			dmg = math.floor(MAGIC_Atk_Dmg(ATKER,DEFER)+sklv*200)
			local rate =math.random(1,200)

				if rate >= Con(DEFER) then
					local statetime = sklv/4
					local statelv = sklv
					AddState ( ATKER , DEFER , STATE_XY , statelv , statetime ) 
				end
			end
		end


	local dmg_fin = Cuihua_Mofa ( dmg , AddStateLv ) 
	local dmg_ElfSkill = ElfSkill_MagicAtk ( dmg , ATKER ) 
	dmg_fin = dmg_fin + dmg_ElfSkill
	Hp_Endure_Dmg ( DEFER , dmg_fin ) 
end 

--技能顺风——————————————————————————————————————————————————————————

function SkillArea_Circle_Sf ( sklv )										--技能"Tail Wind"的技能区域公式
	local side = 1000  
	SetSkillRange ( 3 , side  )  
end

function SkillCooldown_Sf( sklv )
	local Cooldown = 10000
	return Cooldown
end

function SkillSp_Sf ( sklv )										
	local sp_reduce = 20+ sklv * 3   
	return sp_reduce 
end


function SkillEnergy_Sf ( sklv )										
	local energy_reduce = math.floor ( 3 + sklv * 0.5 )    
	return energy_reduce 
end 

function Skill_Sf_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Sf ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Sf_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 150 + sklv * 10 
	AddState ( ATKER , DEFER , STATE_SF , statelv , statetime ) 
end 

function State_Sf_Add ( role , statelv ) 
	local mspdsa_dif = 0.05 + statelv * 0.01    
	local mspdsa = ( MspdSa ( role ) + mspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

function State_Sf_Rem ( role , statelv ) 
	local mspdsa_dif = 0.05 + statelv * 0.01    
	local mspdsa = ( MspdSa ( role ) - mspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role) 
end 












--技能燃烧弹————————————————————————————————————————————————————————————————————————


function SkillPre_Rsd ( sklv )														--技能"Magma Bullet"的技能前期准备
end 

function SkillArea_Square_Rsd ( sklv )												--技能“燃烧弹"的技能区域公式
	local side = 250 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Rsd( sklv )
	local Cooldown = 15000
	return Cooldown
end

function SkillArea_State_Rsd ( sklv )										
	local statetime = 10 
	local statelv = sklv 
	--LG("SkillPre_Rsd" , " fucntion SkillPre_Rsd :" , " statelv = " , statelv , "statetime " , statetime ) 
	SetRangeState ( STATE_RS , statelv  , statetime ) 									--添加地面“燃烧”状态
end 

function SkillSp_Rsd ( sklv )														--技能“燃烧弹”的sp消耗公式
	local sp_reduce = sklv * 2 + 15   
	return sp_reduce 
end 

function Skill_Rsd_Begin ( role , sklv )												--技能"Magma Bullet"的技能施放公式
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Rsd ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		--LG("skill_Rsd", "function Skill_Atk_Rsd : ", "SP insufficient to cast Magma Bullet" , "\n" ) 
		return 
	end 
	Sp_Red ( role , sp_reduce ) 
	--LG( "Rsd", "Magma Bullet Skill Level=" , sklv , "Skill SP Consumption= " , sp_reduce , '\n" ) 
end 

function Skill_Rsd_End ( ATKER , DEFER , sklv ) 
--	local hpdmg = sklv * 3 
--	local hp = GetChaAttr(DEFER) 
--	if role == DEFER then 
--		Hp_Endure_Dmg( DEFER , hpdmg ) 
--	end 
end 

function State_Rs_Add ( role , statelv ) 
	--LG("state_rs" , "function State_Rs_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local arealv = GetAreaStateLevel ( role , STATE_RS ) 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hpdmg = 10 
	if arealv >= 1 then 
		hpdmg = arealv * 3 + 30  
	end 
	Hp_Endure_Dmg ( role , hpdmg ) 
end 

function State_Rs_Rem ( role , statelv ) 
end 


function State_Rs_Tran ( statelv ) 
	return 10   
end 


--技能诅咒之火————————————————————————————————————————————————————————————————————————－－
function SkillSp_Zzzh ( sklv )										
	local sp_reduce = 20   
	return sp_reduce 
end

function SkillCooldown_Zzzh( sklv )
	local Cooldown = 30000
	return Cooldown
end

function SkillArea_Square_Zzzh ( sklv )										--技能“诅咒之火"的技能区域公式
	local side = 300 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_Zzzh ( sklv )										
	local statetime = 5 + sklv  * 1  
	local map_name_ATKER = GetChaMapName ( ATKER )
	local map_name_DEFER = GetChaMapName ( DEFER )
	local sta_atker = Sta(ATKER)
	local Can_Pk_Garner2 = Is_NormalMonster (DEFER)
		if map_name_ATKER == "garner2" or map_name_DEFER == "garner2" then
			if Can_Pk_Garner2 == 0 then
			 statetime =math.max(5,math.floor(sta_atker/30))+sklv
		--		Notice ( "statetime="..statetime)
			end
		end
	local statelv = sklv 
	--LG("SkillPre_Zzzh" , " fucntion SkillPre_Zzzh :" , " statelv = " , statelv , "statetime " , statetime ) 
	SetRangeState ( STATE_ZZZH , statelv  , statetime ) 									--添加地面“诅咒之火”状态
end 

function Skill_Zzzh_Begin ( role , sklv ) 
	--LG( "skill_Zzzh", "enter function Skill_Atk_Zzzh : " , "\n" ) 
	--LG("skill_Zzzh", "function Skill_Atk_Zzzh : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce 
	sp_reduce = SkillSp_Zzzh ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		--LG("skill_zzzh", "function Skill_Atk_zzzh : ", "Insufficient SP to cast Cursed Fire" , "\n" ) 
		return 
	end 
	
	Sp_Red (role , sp_reduce ) 
	--LG( "Zzzh", "Cursed Fire Skill Level=" , sklv , "Skill SP Consumption= " , sp_reduce , '\n" ) 
end 

function Skill_Zzzh_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_zzzh", "enter function Skill_Def_Zzzh : " , "\n" ) 
	--LG("skill_zzzh", "function Skill_Def_Zzzh : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
end 

function State_Zzzh_Add ( role , statelv ) 
	--LG("state_Zzzh" , "function State_Zzzh_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local defsa_dif = (-1) * ( 0.1 + 0.02 * statelv ) 
	local defsa = math.floor (  (DefSa(role) + defsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	ALLExAttrSet(role)  
end 



function State_Zzzh_Rem ( role , statelv ) 
	--LG("state_zzzh" , "function State_Zzzh_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local defsa_dif = (-1) * ( 0.1 + 0.02 * statelv ) 
	local defsa = math.floor (  (DefSa(role) - defsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	ALLExAttrSet(role)  
end 

function  State_Zzzh_Tran ( statelv ) 
	local statetime = 20 + sklv * 2    
	return statetime 
end 

--技能闪躲壁障————————————————————————————————————————————————————————————————————————－－
function SkillSp_Sdbz ( sklv )										
	local sp_reduce = 20   
	return sp_reduce 
end

function SkillCooldown_Sdbz( sklv )
	local Cooldown = 20000
	return Cooldown
end

function SkillArea_Square_Sdbz ( sklv )										--技能“闪躲壁障"的技能区域公式
	local side = 300 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_Sdbz ( sklv )										
	local statetime = 5    
	local statelv = sklv 
	--LG("SkillPre_Sdbz" , " fucntion SkillPre_Sdbz :" , " statelv = " , statelv , "statetime " , statetime ) 
	SetRangeState ( STATE_SDBZ , statelv  , statetime ) 									--添加地面“闪躲壁障”状态
end 

function Skill_Sdbz_Begin ( role , sklv ) 
	--LG( "skill_Sdbz", "enter function Skill_Atk_Sdbz : " , "\n" ) 
	--LG("skill_Sdbz", "function Skill_Atk_Sdbz : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce 
	sp_reduce = SkillSp_Sdbz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		--LG("skill_sdbz", "function Skill_Atk_sdbz : ", "SP insufficient to cast Counterguard" , "\n" ) 
		return 
	end 
	
	Sp_Red (role , sp_reduce ) 
	--LG( "Sdbz", "Counterguard Skill Level= " , sklv , "Skill SP Consumption= " , sp_reduce , '\n" ) 
end 

function Skill_Sdbz_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_sdbz", "enter function Skill_Def_Sdbz : " , "\n" ) 
	--LG("skill_sdbz", "function Skill_Def_Sdbz : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
end 

function State_Sdbz_Add ( role , statelv ) 
	--LG("state_Sdbz" , "function State_Sdbz_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local hitsa_dif = (-1) * (  0.02 * statelv ) 
	local hitsa = math.floor (  (HitSa(role) + hitsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( hitsa , role , ATTR_STATEC_HIT ) 
	ALLExAttrSet(role)  
end 



function State_Sdbz_Rem ( role , statelv ) 
	--LG("state_sdbz" , "function State_Sdbz_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local hitsa_dif = (-1) * (  0.02 * statelv ) 
	local hitsa = math.floor (  (HitSa(role) - hitsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( hitsa , role , ATTR_STATEC_HIT ) 
	ALLExAttrSet(role)  
end 

function  State_Sdbz_Tran ( statelv ) 
	local statetime = 30 + sklv * 3    
	return statetime 
end 

--技能深渊泥沼————————————————————————————————————————————————————————————————————————－－
function SkillSp_Synz ( sklv )										
	local sp_reduce = sklv * 5 + 50  
	return sp_reduce 
end

function SkillCooldown_Synz( sklv )
	local Cooldown = 30000
	return Cooldown
end

function SkillArea_Square_Synz ( sklv )										--技能“深渊泥沼"的技能区域公式
	local side = 500 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_Synz ( sklv )										
	local statetime = 20 + sklv * 2     
	local statelv = sklv 
	--LG("SkillPre_Synz" , " fucntion SkillPre_Synz :" , " statelv = " , statelv , "statetime " , statetime ) 
	----boss使用技能处理
	if GetChaTypeID( ATKER ) == 985 then
		statetime = 40
		statelv = 10
	end
	----boss使用技能处理结束

	SetRangeState ( STATE_SYNZ , statelv  , statetime ) 									--添加地面“深渊泥沼”状态
end 

function Skill_Synz_Begin ( role , sklv ) 
	--LG( "skill_Synz", "enter function Skill_Atk_Synz : " , "\n" ) 
	--LG("skill_Synz", "function Skill_Atk_Synz : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce 
	sp_reduce = SkillSp_Synz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		--LG("skill_synz", "function Skill_Atk_synz : ", "SP insufficient to cast Counterguard" , "\n" ) 
		return 
	end 
	
	Sp_Red (role , sp_reduce ) 
	--LG( "Synz", "Abyss Mire Skill Level= " , sklv , "Skill SP Consumption= " , sp_reduce , '\n" ) 
end 

function Skill_Synz_End ( ATKER , DEFER , sklv ) 
	--LG( "skill_synz", "enter function Skill_Def_Synz : " , "\n" ) 
	--LG("skill_synz", "function Skill_Def_Synz : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
end 

function State_Synz_Add ( role , statelv ) 
	--LG("state_Synz" , "function State_Synz_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mspdsa_dif = (-1) * ( 0.20 + 0.015 * statelv ) 
	local mspdsa = math.floor (  (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX ) 

	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 



function State_Synz_Rem ( role , statelv ) 
	--LG("state_synz" , "function State_Synz_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mspdsa_dif = (-1) * ( 0.20 + 0.015 * statelv ) 
	local mspdsa = math.floor (  (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

function  State_Synz_Tran ( statelv ) 
	local statetime = 3   
	return statetime 
end 


--技能回复温泉公式————————————————————————————————————————————————————————————－
function SkillSp_Hfwq ( sklv )										
	local sp_reduce = sklv * 2 + 30  
	return sp_reduce 
end

function SkillCooldown_Hfwq( sklv )
	local Cooldown = 30000
	return Cooldown
end

function SkillArea_Square_Hfwq ( sklv )										--技能“回复温泉"的技能区域公式
	local side = 400 + sklv * 40 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_Hfwq ( sklv )										
	local statetime = 15 + sklv * 2 
	local statelv = sklv 
	--LG("Skillarea_state_Hfwq" , " fucntion SkillArea_State_Hfwq :" , " statelv = " , statelv , "statetime " , statetime ) 
	SetRangeState ( STATE_HFWQ , statelv  , statetime ) 									--添加地面“回复温泉”状态
end 

function Skill_Hfwq_Begin ( role , sklv ) 
	--LG( "skill_Hfwq", "enter function Skill_Atk_Hfwq : " , "\n" ) 
	--LG("skill_Hfwq", "function Skill_Atk_Hfwq : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce 
	sp_reduce = SkillSp_Hfwq ( sklv )	
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		--LG("skill_Hfwq", "function Skill_Atk_Hfwq : ", "SP insufficient to cast Healing Spring" , "\n" ) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
	--LG( "Hfwq", "Healing Spring Skill Level= " , sklv , "Skill SP Consumption= " , sp_reduce , '\n" ) 
end 

function Skill_Hfwq_End ( ATKER , DEFER , sklv ) 
end 

function State_Hfwq_Add ( role , statelv ) 
	
	local dmg = -1 * ( 50 + statelv * 15 )
	Hp_Endure_Dmg ( role , dmg ) 
end 

function State_Hfwq_Rem ( role , statelv ) 

end 

function State_Hfwq_Tran ( statelv ) 
	return 3    
end 


--技能圣眼之翼公式————————————————————————————————————————————————————————————－
function SkillSp_Syzy ( sklv )										
	local sp_reduce = 10 + sklv * 3    
	return sp_reduce 
end

function SkillCooldown_Syzy( sklv )
	local Cooldown = 5000
	return Cooldown
end

function SkillArea_Square_Syzy ( sklv )										--技能“圣眼之翼"的技能区域公式
	local side = 600 + sklv * 20 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_Syzy ( sklv )										
	local statetime = 90 + sklv *9   
	local statelv = sklv 
	--LG("Skillarea_state_Syzy" , " fucntion SkillArea_State_Syzy :" , " statelv = " , statelv , "statetime " , statetime ) 
	SetRangeState ( STATE_SYZY , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 

function Skill_Syzy_Begin ( role , sklv ) 
	--LG( "skill_Syzy", "enter function Skill_Atk_Syzy : " , "\n" ) 
	--LG("skill_Syzy", "function Skill_Atk_Syzy : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Syzy ( sklv )	
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
	--LG( "Syzy", "True Sight Skill Level=" , sklv , "Skill SP Consumption= " , sp_reduce , '\n" ) 
end 

function Skill_Syzy_End ( ATKER , DEFER , sklv ) 
end 

function State_Syzy_Add ( role , statelv ) 

end 

function State_Syzy_Rem ( role , statelv ) 

end 

function State_Syzy_Tran ( statelv ) 
	return 1     
end 


--技能漩涡————————————————————————————————————————————————————————————————————
function SkillArea_Circle_Xw ( sklv )										--技能"Whirlpool"的技能区域公式
	local side = 300  
	SetSkillRange ( 3 , side  )  
end

function SkillCooldown_Xw( sklv )
	local Cooldown = 10000
	return Cooldown
end

function SkillSp_Xw ( sklv )										
	local sp_reduce = 20+ sklv * 1    
	return sp_reduce 
end

function SkillArea_State_Xw ( sklv )										
	local statetime = 20 + sklv * 1    
	local statelv = sklv 
	SetRangeState ( STATE_XW , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 


function Skill_Xw_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Xw ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Xw_End ( ATKER , DEFER , sklv ) 
end 

function State_Xw_Add ( role , statelv ) 
	local mspdsa_dif = 0.1 + statelv * 0.02 
	local aspdsa_dif = 0.05 + statelv * 0.01 
	local mspdsa = ( MspdSa ( cha_role ) - mspdsa_dif )  * ATTR_RADIX
	local aspdsa = ( AspdSa ( cha_role ) - aspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	ALLExAttrSet( role )  
end 

function State_Xw_Rem ( role , statelv ) 
	local mspdsa_dif = 0.1 + statelv * 0.02 
	local aspdsa_dif = 0.05 + statelv * 0.01 
	local mspdsa = ( MspdSa ( cha_role ) + mspdsa_dif )  * ATTR_RADIX
	local aspdsa = ( AspdSa ( cha_role ) + aspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	ALLExAttrSet( role )  
end 

function State_Xw_Tran ( statelv ) 
	return 1     
end


--技能迷雾————————————————————————————————————————————————————————————————————
function SkillArea_Circle_Mw ( sklv )										--技能"Fog"的技能区域公式
	local side = 300 + sklv * 50  
	SetSkillRange ( 3 , side  )  
end

function SkillCooldown_Mw( sklv )
	local Cooldown = 10000
	return Cooldown
end

function SkillSp_Mw ( sklv )										
	local sp_reduce = 20+ sklv * 1    
	return sp_reduce 
end

function SkillArea_State_Mw ( sklv )										
	local statetime = 20    
	local statelv = sklv 
	SetRangeState ( STATE_MW , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 

function SkillEnergy_Mw ( sklv )										
	local energy_reduce = math.floor ( 3 + sklv * 0.5 )    
	return energy_reduce 
end

function Skill_Mw_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Mw ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Mw_End ( ATKER , DEFER , sklv ) 
end 

function State_Mw_Add ( role , statelv ) 
	local mnatksa_dif = 0.05 + statelv * 0.01 
	local mxatksa_dif = 0.05 + statelv * 0.01 
	local mnatksa = ( MnatkSa ( role ) - mnatksa_dif )  * ATTR_RADIX 
	local mxatksa = ( MxatkSa ( role ) - mxatksa_dif )  * ATTR_RADIX 
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK ) 
	ALLExAttrSet( role )  
end 

function State_Mw_Rem ( role , statelv ) 
	local mnatksa_dif = 0.05 + statelv * 0.01 
	local mxatksa_dif = 0.05 + statelv * 0.01 
	local mnatksa = ( MnatkSa ( role ) + mnatksa_dif )  * ATTR_RADIX 
	local mxatksa = ( MxatkSa ( role ) + mxatksa_dif )  * ATTR_RADIX 
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK ) 
	ALLExAttrSet( role )  
end 

function State_Mw_Tran ( statelv ) 
	return 1     
end




--技能雷幕——————————————————————————————————————————————————————————————————－

function SkillArea_Circle_Lm ( sklv )										--技能"Lightning Curtain"的技能区域公式
	local side = 300  
	SetSkillRange ( 3 , side  )  
end

function SkillCooldown_Lm( sklv )
	local Cooldown = 10000
	return Cooldown
end

function SkillSp_Lm ( sklv )										
	local sp_reduce = 20+ sklv * 1    
	return sp_reduce 
end

function SkillEnergy_Lm ( sklv )										
	local energy_reduce = math.floor ( 3 + sklv * 0.5 )    
	return energy_reduce 
end 

function SkillArea_State_Lm ( sklv )										
	local statetime = 15 + sklv * 1    
	local statelv = sklv 
	SetRangeState ( STATE_LM , statelv  , statetime ) 									--添加地面“雷幕”状态
end 

function Skill_Lm_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Lm ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Lm_End ( ATKER , DEFER , sklv ) 
end 

function State_Lm_Add ( role , statelv ) 
	local dmg = 160 + statelv * 20 
	Hp_Endure_Dmg ( role , dmg ) 
end 

function State_Lm_Rem ( role , statelv ) 

end 

function State_Lm_Tran ( statelv ) 
	return 1     
end










--技能穿透弹————————————————————————————————————————————————————————————————————————－－

function SkillArea_Line_Ctd ( sklv )										--技能"Penetrating Bullet"的技能区域公式
	local lenth = 1500 + sklv * 50  
	local width = 50 
	SetSkillRange ( 1 , lenth , width  )  
end

function SkillCooldown_Ctd( sklv )
	local Cooldown = 5000
	return Cooldown
end

function SkillPre_Ctd ( sklv )										--技能"Penetrating Bullet"的技能前期准备
end 

function SkillSp_Ctd ( sklv )										--技能"Penetrating Bullet"的sp消耗公式
	local sp_reduce = 10 + sklv * 1 
	return sp_reduce 
end 



function Skill_Ctd_Begin ( role , sklv ) 
	--LG("line", "step 1 : skill_atk_ctd")
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Ctd ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Ctd_End ( ATKER , DEFER , sklv ) 
	--LG("line", "step 3 : skill_atk_ctd")
	local hp = Hp( DEFER ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Ctd_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Ctd_End : DEFER as null" ) 
		return 
	end 
	dmg = ( 1+sklv * 0.2  ) * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , dmg )  
end 








--技能散射弹————————————————————————————————————————————————————————————————————————————


function SkillArea_Sector_Ssd ( sklv )										--技能“散射弹"的技能区域公式
	local radius = 600 + math.floor ( sklv * 20 ) 
	local angle = 90 + math.floor ( sklv / 5 ) * 15 
	SetSkillRange ( 2 , radius , angle  )  
end 

function SkillCooldown_Ssd( sklv )
	local Cooldown = 15000
	return Cooldown
end

function SkillPre_Ssd ( sklv )										--技能"Dispersion Bullet"的技能前期准备
end 

function SkillSp_Ssd ( sklv )										--技能"Dispersion Bullet"的sp消耗公式
	local sp_reduce = sklv * 1 + 15 
	return sp_reduce 
end 


function Skill_Ssd_Begin ( role , sklv ) 
	local sp = Sp( role ) 
	local sp_reduce = SkillSp_Ssd ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		--LG("skill_Ssd", "function Skill_Atk_Ssd : ", "SP insufficient. Unable to cast Dispersion Bullet" , "\n" ) 
		return 
	end 
	Sp_Red ( role , sp_reduce ) 
	--LG( "Ssd", "Dispersion Bullet Skill Level= " , sklv , "Skill SP Consumption= " , sp_reduce , '\n" ) 
end 

function Skill_Ssd_End ( ATKER , DEFER , sklv ) 

		atk_rad = 1.2 + sklv * 0.15 
		dmg = Atk_Raise ( atk_rad , ATKER , DEFER ) 
		Hp_Endure_Dmg ( DEFER, dmg )  
		--LG( "Ssd", "Dispersion Bullet Skill Level= " , sklv , "Skill Damage= " , dmg , '\n" ) 
		--LG( "Ssd" , "disperse bullet skill does not damage to attacker" , "\n" ) 
end 




--海面区域状态----------------------------------------------------------------------------------------------------------------------------------------------------

--雷区----------
function State_Larea_Tran ( statelv ) 
	return 1 
end 

function State_Larea_Add ( role , statelv ) 
	LG ( "LeiQu" , " role = " , role , " statelv = " , statelv ) 
	local role_type = IsPlayer ( role ) 
	if role_type == 0 then 
		return 
	end 
	local hp = Hp ( role ) 
	dmg = 5 + statelv * 1  
	Hp_Endure_Dmg ( role , dmg ) 
	local cha_role = TurnToCha ( role ) 
	local a = AddEquipEnergy ( cha_role , enumEQUIP_HAND1 , 29 , 50 ) 
end  

function State_Larea_Rem ( role , statelv ) 
end 

--雾区-----------

function State_Warea_Tran ( statelv ) 
	return 1 
end 

function State_Warea_Add ( role , statelv ) 
	local cha_role = TurnToCha ( role ) 
	local a = AddEquipEnergy ( cha_role , enumEQUIP_HAND2 , 29 , 50 ) 

--	LG ( "WuiQu" , " role = " , role , " statelv = " , statelv ) 
--	local ship_mnatksa_dif = -1 * ( 0.05+0.02 * statelv ) 
--	local ship_mnatksa = math.floor ( ( Ship_MnatkSa ( role ) + ship_mnatksa_dif ) * ATTR_RADIX ) 
--	SetCharaAttr( hrecsa , role , ATTR_BOAT_SKILLC_MNATK ) 
--	ALLExAttrSet(role)  
end 

function State_Warea_Rem ( role , statelv ) 
--	LG ( "WuiQu" , " role = " , role , " statelv = " , statelv ) 
--	local ship_mnatksa_dif = -1 * ( 0.05+0.02 * statelv ) 
--	local ship_mnatksa = math.floor ( ( Ship_MnatkSa ( role ) + ship_mnatksa_dif ) * ATTR_RADIX ) 
--	SetCharaAttr( hrecsa , role , ATTR_BOAT_SKILLC_MNATK ) 
--	ALLExAttrSet(role)  
end 

--风区--------------

function State_Farea_Tran ( statelv ) 
	return 1 
end 

function State_Farea_Add ( role , statelv ) 
	local cha_role = TurnToCha ( role ) 
	local a = AddEquipEnergy ( cha_role , enumEQUIP_NECK , 29 , 50 ) 

--	LG ( "WuiQu" , " role = " , role , " statelv = " , statelv ) 
--	local ship_mnatksa_dif = -1 * ( 0.05+0.02 * statelv ) 
--	local ship_mnatksa = math.floor ( ( Ship_MnatkSa ( role ) + ship_mnatksa_dif ) * ATTR_RADIX ) 
--	SetCharaAttr( hrecsa , role , ATTR_BOAT_SKILLC_MNATK ) 
--	ALLExAttrSet(role)  
end 

function State_Farea_Rem ( role , statelv ) 
--	LG ( "WuiQu" , " role = " , role , " statelv = " , statelv ) 
--	local ship_mnatksa_dif = -1 * ( 0.05+0.02 * statelv ) 
--	local ship_mnatksa = math.floor ( ( Ship_MnatkSa ( role ) + ship_mnatksa_dif ) * ATTR_RADIX ) 
--	SetCharaAttr( hrecsa , role , ATTR_BOAT_SKILLC_MNATK ) 
--	ALLExAttrSet(role)  
end 

	
----------------怪物技能cooldown计算---------------------------------------------------------------------------------------------------------------
function SkillCooldown_Gwptjn( sklv )
	local Cooldown = 2500
	return Cooldown
end

function SkillCooldown_Zcmtl( sklv )
	local Cooldown = 2000
	return Cooldown
end

---------------怪物技能-----------------------------------------------------------------------------------------------------------------------------


-----死亡嘲笑-------------------------------------------------

function SkillSp_Swcx ( sklv )										--技能"Death Shriek"的sp消耗公式
   local sp_reduce = 50  
	return sp_reduce 
end 

function SkillCooldown_Swcx( sklv )
	local Cooldown = 6000
	return Cooldown
end

function Skill_Swzq_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Swcx ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Swcx_End ( ATKER , DEFER , sklv ) 
	
	Hp_Endure_Dmg ( DEFER , dmg )  
	local statelv = sklv 
	local statetime = 30    
	AddState ( ATKER , DEFER , STATE_SWCX , statelv , statetime )
end 

function State_Swcx_Add ( role , statelv )

end

function State_Swcx_Rem ( role , statelv )

end


----血怒------------------------------------------------------
function SkillSp_Xn ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end

function SkillCooldown_Xn( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Xn_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Xn ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Xn_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_XN , statelv , statetime )
	
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


function State_Xn_Add ( role , statelv ) 
	local hpdmg = 300   
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_Xn_Rem ( role , statelv )
			
end 

-----泥潭------------------------------------------------------------------
function SkillSp_Nt ( sklv )										
	local sp_reduce = 40
	return sp_reduce 
end

function SkillCooldown_Nt( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Nt_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Nt(sklv)  
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Nt_End ( ATKER , DEFER , sklv )  
	local statelv = sklv 
	local statetime = 60 
	local hpdmg = 3 * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , hpdmg )  
	AddState( ATKER , DEFER , STATE_NT, statelv , statetime )
end 

function State_Nt_Add ( role , statelv ) 
	local mspdsa_dif = 0.5
	local hitsa_dif = 0.5 
	local mspdsa = math.floor ( (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX) 
	local hitsa = math.floor ( (HitSa(role) - hitsa_dif ) * ATTR_RADIX) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )
	SetCharaAttr( hitsa , role , ATTR_STATEC_HIT )
	ALLExAttrSet(role)  
end 

function State_Nt_Rem ( role , statelv ) 
	local mspdsa_dif = 0.5
	local hitsa_dif = 0.5 
	local mspdsa = math.floor ( (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX) 
	local hitsa = math.floor ( (HitSa(role) + hitsa_dif ) * ATTR_RADIX) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )
	SetCharaAttr( hitsa , role , ATTR_STATEC_HIT )
	ALLExAttrSet(role)  
	ALLExAttrSet(role)  
end 

----地震--------------------------------------------------------------------
function SkillSp_DiZ ( sklv )										
	local sp_reduce = sklv * 5 + 50  
	return sp_reduce 
end

function SkillCooldown_DiZ( sklv )
	local Cooldown = 3000
	return Cooldown
end

function SkillArea_Square_DiZ ( sklv )										
	local side = 1000 
	SetSkillRange ( 4 , side ) 	
end 

function SkillArea_State_DiZ ( sklv )										
	local statetime = 20   
	local statelv = sklv 
	SetRangeState ( STATE_DIZ , statelv  , statetime ) 									
end 

function Skill_DiZ_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce 
	sp_reduce = SkillSp_DiZ ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	
	Sp_Red (role , sp_reduce ) 
end 

function Skill_DiZ_End ( ATKER , DEFER , sklv )
	local statetime = 20
	local statelv = 10
	AddState ( ATKER , DEFER , STATE_DIZ , statelv , statetime )
	AddState ( ATKER , DEFER , STATE_XY , statelv , 10 )

end 

function State_DiZ_Add ( role , statelv ) 
	local mspdsa_dif = (-1) * 0.30 
	local mspdsa = math.floor (  (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 



function State_DiZ_Rem ( role , statelv ) 
	local mspdsa_dif = (-1) * 0.30
	local mspdsa = math.floor (  (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

function  State_DiZ_Tran ( statelv ) 
	local statetime = 10   
	return statetime 
end 

-----凶砍-------------------------------------------------------------------------------------

function SkillSp_XiK ( sklv )										
   local sp_reduce = 20 
	return sp_reduce 
end 

function SkillCooldown_Xik( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Xik_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Xik ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Xik_End ( ATKER , DEFER , sklv ) 

	local aspd = Aspd ( ATKER )
	local dmg = 20 * Atk_Dmg ( ATKER , DEFER )   
	Hp_Endure_Dmg ( DEFER , dmg )  

	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


----冰吻-------------------------------------------------------------------------------------

function SkillSp_Biw ( sklv )										
   local sp_reduce = 50  
	return sp_reduce 
end 

function SkillCooldown_Biw( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Biw_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Swcx ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Biw_End ( ATKER , DEFER , sklv ) 
	
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_BIW , statelv , statetime )
end 

function State_Biw_Add ( role , statelv )

end

function State_Biw_Rem ( role , statelv )

end

----风刃--------------------------------------------------------------------

function SkillArea_Circle_Fer ( sklv )										
	local side = 1000
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Fer( sklv )
	local Cooldown = 5000
	return Cooldown
end

function SkillPre_Fer ( sklv )										
end 

function SkillSp_Fer ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end 


function Skill_Fer_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Fer ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Fer_End ( ATKER , DEFER , sklv ) 
	local hp = Hp( DEFER ) 
	dmg = 2 * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , dmg )  
	Check_Ys_Rem ( ATKER , DEFER)						
end 

----技能复制------------------------------------------------------------------------------------------
function SkillSp_Fuz ( sklv )										
	local sp_reduce = 10  
	return sp_reduce 
end

function SkillCooldown_Fuz( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_Fuz_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Fuz ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Fuz_End ( ATKER , DEFER , sklv ) 

end 

--技能海藻突袭-------------------------------------------------------------------------------------------


function SkillArea_Circle_Hztx ( sklv )									
	local side = 300 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_Hztx( sklv )
	local Cooldown = 2000
	return Cooldown
end


function SkillSp_Hztx ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end 

function Skill_Hx_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Hztx ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Hztx_End ( ATKER , DEFER , sklv ) 
	local statelv = 10 
	local statetime = 30
	AddState( ATKER , DEFER , STATE_HZCR, statelv , statetime ) 
end 

--技能水母电击---------------------------------------------------------------------------------------------

function SkillArea_Circle_Smdj ( sklv )										
	local side = 400  
	SetSkillRange ( 3 , side  )  
end

function SkillCooldown_Smdj( sklv )
	local Cooldown = 1000
	return Cooldown
end

function SkillSp_Smdj ( sklv )										
	local sp_reduce = 20    
	return sp_reduce 
end



function SkillArea_State_Smdj ( sklv )										
	local statetime = 25   
	local statelv = 10 
	SetRangeState ( STATE_LM , statelv  , statetime ) 									
end 

function Skill_Smdj_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_Smdj ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Smdj_End ( ATKER , DEFER , sklv ) 
end 


---技能乌贼旋风-------------------------------------------------------------------------------------------------------



function SkillArea_Circle_Wzxf ( sklv )										
	local side = 400
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Wzxf( sklv )
	local Cooldown = 1000
	return Cooldown
end

function SkillPre_Wzxf ( sklv )										
end 

function SkillSp_Wzxf ( sklv )										
	local sp_reduce = 20 - math.floor ( sklv * 0.5 ) 
	return sp_reduce 
end 


function Skill_Wzxf_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Wzxf ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Wzxf_End ( ATKER , DEFER , sklv ) 
	local hp = Hp( DEFER ) 
	dmg = 3 * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , dmg )  
end 



-----鲨鱼致命一击----------------------------------------------------------------------------------------------

function SkillSp_Syzm ( sklv )										--技能"Headshot"的sp消耗公式
	local sp_reduce = sklv * 2 + 30  
	return sp_reduce 
end 

function SkillCooldown_Syzm( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_Syzm_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Syzm ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Syzm_End ( ATKER , DEFER , sklv ) 
	local Mxhp = Mxhp ( DEFER )
	local dmg = math.floor ( Mxhp / 2 )
	Hp_Endure_Dmg ( DEFER , dmg ) 

end


---技能蝌蚪自爆-----------------------------------------------------------------------------------------------------

function SkillArea_Circle_Kdzb ( sklv )										
	local side = 400
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Kdzb( sklv )
	local Cooldown = 1000
	return Cooldown
end

function SkillPre_Kdzb ( sklv )										
end 

function SkillSp_Kdzb ( sklv )										
	local sp_reduce = 20 - math.floor ( sklv * 0.5 ) 
	return sp_reduce 
end 


function Skill_Kdzb_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Wzxf ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_Kdzb_End ( ATKER , DEFER , sklv ) 
	local hp = Hp( DEFER ) 
	dmg = 3 * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , dmg )  
end 


function SkillCooldown_Sgjn1( sklv )
	local Cooldown = 6000
	return Cooldown
end

function SkillCooldown_Sgjn2( sklv )
	local Cooldown = 2500
	return Cooldown
end


--技能水雷自暴————————————————————————————————————

function State_Slzb_Add ( role , statelv ) 
--	LG ( "bomb" , "Check Water Mine going to explode?" ) 
--	Notice ( "Check Water Mine going to explode?") 
	local hp = Hp ( role ) 
	if hp <= 0 then 
		RemoveState ( role , STATE_BOMB ) 
	end 
end 

function State_Slzb_Rem ( role , statelv ) 
--	LG ( "bomb" , "Water Mine is going to explode?" ) 
--	Notice ( "Water Mine is going to explode") 
	local x , y = GetChaPos ( role  ) 
	ChaUseSkill2 ( role , SK_BOMB , 1 , x, y ) 
	Notice ( "after use skill" ) 
	DelCha ( role ) 
	Notice ( "after delcha" ) 
end 


function SkillArea_Circle_Slzb ( sklv )										--技能“狼嚎"的技能区域公式
	--LG( "skarea_lh", " enter function SkillArea_Circle_Lh : " , "sklv = " ,sklv ) 
	local side = 1200 + math.floor ( sklv * 20 ) 
	--LG( "skarea_lh" , " side = " , side ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Slzb( sklv )
	local Cooldown = 1000
	return Cooldown
end

function SkillPre_Slzb ( sklv )										
end 

function SkillSp_Slzb ( sklv )										
	local sp_reduce = 0 
	return sp_reduce 
end 


function Skill_Slzb_Begin ( role , sklv ) 

end 

function Skill_Slzb_End ( ATKER , DEFER , sklv ) 
	local atker_type = GetChaTypeID ( ATKER ) 
	local defer_type = GetChaTypeID ( DEFER ) 
--	LG ( "bomb" , "Water Mine has really exploded" ) 

--	Notice ( "Water Mine has really exploded") 
--	Notice ( "atker_type = "..atker_type) 
--	Notice ( "defer_type = "..defer_type) 
	local hp = Hp( DEFER ) 
	Notice ( "defer_hp = "..hp )
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Slzb_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Slzb_End : DEFER as null" ) 
		return 
	end 
	dmg = 1500 
	Hp_Endure_Dmg ( DEFER , dmg )  
	SetCharaAttr ( -1 , ATKER , ATTR_HP ) 
--	Notice ( "Water Mine finished bombing") 
end 


---PK岛特殊状态------------------
---弹药库没啦--------------------
function State_PKDYK_Add ( role , statelv ) 
	local mnatksa_dif = -0.8 
	local mxatksa_dif = -0.8
	local mnatksa = math.floor ( (MnatkSa(role) + mnatksa_dif ) * ATTR_RADIX) 
	local mxatksa = math.floor ( (MxatkSa(role) + mxatksa_dif ) * ATTR_RADIX) 
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK ) 
	ALLExAttrSet(role)  
end 



function State_PKDYK_Rem ( role , statelv ) 
	local mnatksa_dif = -0.8
	local mxatksa_dif = -0.8
	local mnatksa = math.floor ( (MnatkSa(role) - mnatksa_dif ) * ATTR_RADIX) 
	local mxatksa = math.floor ( (MxatkSa(role) - mxatksa_dif ) * ATTR_RADIX) 
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK ) 
	ALLExAttrSet(role)  
end

---粮仓没啦-----------------------------

function State_PKLC_Add ( role , statelv ) 
	local def_dif = -200  
	local def = DefSb(role) + def_dif
	local Res_sa = ResistSa(role)
	local Res_sa_dif = -0.5
	local Res = Res_sa + Res_sa_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	SetCharaAttr( Res , role , ATTR_STATEC_PDEF )
	ALLExAttrSet(role)

end 



function State_PKLC_Rem ( role , statelv ) 
	local def_dif = -200  
	local def = DefSb(role) - def_dif
	local Res_sa = ResistSa(role)
	local Res_sa_dif = -0.5
	local Res = Res_sa - Res_sa_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	SetCharaAttr( Res , role , ATTR_STATEC_PDEF )
	ALLExAttrSet(role)
	ALLExAttrSet(role)
end 

----修理建筑物-------------------------------
function SkillSp_PKXL ( sklv ) 
	return 0 
end 

function SkillCooldown_PKXL( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PKXL_Begin  ( role , sklv ) 
end 

function Skill_PKXL_End ( ATKER , DEFER , sklv ) 
	local i = CheckBagItem( ATKER , 4661 )
	if i <= 0 then
		SystemNotice ( ATKER , "Does not have wood to repair...what do you use?")
		return
	end
	local j = DelBagItem(ATKER,4661,1)
	if j == 1 then
		SystemNotice ( ATKER , "Repairing..." ) 
		local hpdmg = 200 + sklv * 20 
		local hp = Hp(DEFER) + hpdmg 
		SetCharaAttr(hp , DEFER , ATTR_HP )
	else
		LG("PK_repair","Delete Wood failed")
	end
	
end 

----PK岛道具---------------------------------

--蛮牛药水----------------------------------
function State_PKMNYS_Add ( role ,statelv )
	local MxhpSb_dif = 1000
	local MxhpSb = MxhpSb( role ) + MxhpSb_dif
	SetCharaAttr( MxhpSb , role , ATTR_STATEV_MXHP )
	ALLExAttrSet(role)
end

function State_PKMNYS_Rem ( role , statelv )
	local MxhpSb_dif = 1000
	local MxhpSb = MxhpSb( role ) - MxhpSb_dif
	SetCharaAttr( MxhpSb , role , ATTR_STATEV_MXHP )
	ALLExAttrSet(role)
end

--战斗药水----------------------------------
function State_PKZDYS_Add ( role , statelv )
	local atksb_dif = 150
	if statelv == 1 then
		atksb_dif = 30
	end
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)
end

function State_PKZDYS_Rem ( role , statelv )
	local atksb_dif = 150
	if statelv == 1 then
		atksb_dif = 30
	end
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)
end
------狂战术 大幅提高攻击力小幅降低防御力的道具持续时间15分钟

function State_KUANGZ_Add ( role , statelv )
	local atksb_dif = 50	
	local def_dif = 25
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	local defsb = DefSb( role ) - def_dif
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end

function State_KUANGZ_Rem ( role , statelv )
	local atksb_dif = 50	
	local def_dif = 25
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	local defsb = DefSb( role ) + def_dif
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end
--狂暴药水----------------------------------
function State_PKKBYS_Add ( role , statelv )
	local aspd_dif = 140
	local aspdsb = ( AspdSb(role) + aspd_dif ) 
	SetCharaAttr( aspdsb , role , ATTR_STATEV_ASPD ) 
	ALLExAttrSet(role)
end

function State_PKKBYS_Rem ( role , statelv )
	local aspd_dif = 140
	local aspdsb = ( AspdSb(role) - aspd_dif ) 
	SetCharaAttr( aspdsb , role , ATTR_STATEV_ASPD ) 
	ALLExAttrSet(role)
end

--精神药水--------------------------------------
function State_PKJSYS_Add ( role , statelv )
	local sta_dif = 30
	local stasb = StaSb( role ) + sta_dif
	SetCharaAttr( stasb , role , ATTR_STATEV_STA )
	ALLExAttrSet(role)
end

function State_PKJSYS_Rem ( role , statelv )
	local sta_dif = 30
	local stasb = StaSb( role ) - sta_dif
	SetCharaAttr( stasb , role , ATTR_STATEV_STA )
	ALLExAttrSet(role)
end

--石肤药水-------------------------------------
function State_PKSFYS_Add ( role , statelv )
	local def_dif = 150
	if statelv == 1 then
		def_dif = 30
	end
	local defsb = DefSb(role) + def_dif
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end

function State_PKSFYS_Rem ( role , statelv )
	local def_dif = 150
	if statelv == 1 then
		def_dif = 30
	end
	local defsb = DefSb(role) - def_dif
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end
----全身装甲 大幅提高防御力小幅降低攻击力的道具持续时间15分钟

function State_QUANS_Add ( role , statelv )
	local def_dif = 70
	local atksb_dif = 30
	local defsb = DefSb( role ) + def_dif
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)
end

function State_QUANS_Rem ( role , statelv )
	local def_dif = 70
	local atksb_dif = 30
	local defsb = DefSb( role ) - def_dif
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)
end
--精准药水--------------------------------------
function State_PKJZYS_Add ( role , statelv )
	local hit_dif = 30
	local hitsb  = HitSb( role ) + hit_dif
	SetCharaAttr( hitsb , role , ATTR_STATEV_HIT )
	ALLExAttrSet(role)
end

function State_PKJZYS_Rem ( role , statelv )
	local hit_dif = 30
	local hitsb  = HitSb( role ) - hit_dif
	SetCharaAttr( hitsb , role , ATTR_STATEV_HIT )
	ALLExAttrSet(role)
end

--艾草（闪避药水）----------------------------------
function State_PKSBYS_Add ( role ,statelv )
	local Flee_dif = 10
	if statelv == 1 then
		Flee_dif = 10
	end
	local Flee = FleeSb( role ) + Flee_dif
	SetCharaAttr( Flee , role , ATTR_STATEV_FLEE )
	ALLExAttrSet(role)
end

function State_PKSBYS_Rem ( role , statelv )
	local Flee_dif = 10
	if statelv == 1 then
		Flee_dif = 10
	end
	local Flee = FleeSb( role ) - Flee_dif
	SetCharaAttr( Flee , role , ATTR_STATEV_FLEE )
	ALLExAttrSet(role)
end


--无敌状态---------------------------------------
function SkillCooldown_Wudiyaoshui( sklv )
	local Cooldown = 20000 
	return Cooldown
end
function Skill_Wudiyaoshui_Begin ( role , sklv ) 
		--SystemNotice( role , "Skill_Wudiyaoshui_Begin")
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 1860 ) --无敌药水
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 1860 , 1 ) 
end 

function Skill_Wudiyaoshui_End( ATKER , DEFER , sklv )
		--SystemNotice( ATKER , "Skill_Wudiyaoshui_End")
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local statelv = 10
	local statetime = 5
		--SystemNotice( ATKER , "STATE_PKWD_Begin")
	AddState( ATKER , DEFER , STATE_PKWD , statelv , statetime )
		--SystemNotice( ATKER , "STATE_PKWD_End")
	local cha_name = GetChaDefaultName ( ATKER ) 
	local message = cha_name.."Entering invincible mode for 5 secs"  
	Notice ( message )
end 

function State_PKWd_Add ( role , statelv )

end

function State_PKWd_Rem ( role , statelv )

end




--药水力量强化

function State_YSLLQH_Add ( role , statelv )
	local str_dif = 5
	local strsb = StrSb( role ) + str_dif
	SetCharaAttr( strsb , role , ATTR_STATEV_STR )
	ALLExAttrSet(role)
end

function State_YSLLQH_Rem ( role , statelv )
	local str_dif = 5
	local strsb = StrSb( role ) - str_dif
	SetCharaAttr( strsb , role , ATTR_STATEV_STR )
	ALLExAttrSet(role)
end


--药水敏捷强化

function State_YSMJQH_Add ( role , statelv )
	local agi_dif = 5
	local agisb = AgiSb( role ) + agi_dif
	SetCharaAttr( agisb , role , ATTR_STATEV_AGI )
	ALLExAttrSet(role)
end

function State_YSMJQH_Rem ( role , statelv )
	local agi_dif = 5
	local agisb = AgiSb( role ) - agi_dif
	SetCharaAttr( agisb , role , ATTR_STATEV_AGI )
	ALLExAttrSet(role)
end

--药水专注强化

function State_YSLQQH_Add ( role , statelv )
	local dex_dif = 5
	local dexsb = DexSb( role ) + dex_dif
	SetCharaAttr( dexsb , role , ATTR_STATEV_DEX )
	ALLExAttrSet(role)
end

function State_YSLQQH_Rem ( role , statelv )
	local dex_dif = 5
	local dexsb = DexSb( role ) - dex_dif
	SetCharaAttr( dexsb , role , ATTR_STATEV_DEX )
	ALLExAttrSet(role)
end

--药水体质强化

function State_YSTZQH_Add ( role , statelv )
	local con_dif = 5
	local consb = ConSb( role ) + con_dif
	SetCharaAttr( consb , role , ATTR_STATEV_CON )
	ALLExAttrSet(role)
end

function State_YSTZQH_Rem ( role , statelv )
	local con_dif = 5
	local consb = ConSb( role ) - con_dif
	SetCharaAttr( consb , role , ATTR_STATEV_CON )
	ALLExAttrSet(role)
end


--药水精神强化

function State_YSJSQH_Add ( role , statelv )
	local sta_dif = 5
	local stasb = StaSb( role ) + sta_dif
	SetCharaAttr( stasb , role , ATTR_STATEV_STA )
	ALLExAttrSet(role)
end

function State_YSJSQH_Rem ( role , statelv )
	local sta_dif = 5
	local stasb = StaSb( role ) - sta_dif
	SetCharaAttr( stasb , role , ATTR_STATEV_STA )
	ALLExAttrSet(role)
end

--药水速度强化

function State_YSMspd_Add ( role , statelv )
	local mspdsa_dif = 0
	if statelv == 1 then								--加速药水
		mspdsa_dif = 0.15
	end
	local mspdsa = MspdSa ( role )
	local mspdsa_fin = ( mspdsa + mspdsa_dif ) * ATTR_RADIX
	SetCharaAttr( mspdsa_fin , role , ATTR_STATEC_MSPD )
	ALLExAttrSet(role)
end

function State_YSMspd_Rem ( role , statelv )
	local mspdsa_dif = 0
	if statelv == 1 then
		mspdsa_dif = 0.15
	end
	local mspdsa = MspdSa ( role )
	local mspdsa_fin = ( mspdsa - mspdsa_dif ) * ATTR_RADIX
	SetCharaAttr( mspdsa_fin , role , ATTR_STATEC_MSPD )
	ALLExAttrSet(role)
end

--轻装药水 大幅提高行走速度小幅降低防御的道具持续时间15分钟

function State_QINGZ_Add ( role , statelv )
	local mspdsa_dif = 0.3
	local def_dif = 50
	local mspdsa = MspdSa ( role )
	local mspdsa_fin = ( mspdsa + mspdsa_dif ) * ATTR_RADIX
	local defsb = DefSb( role ) - def_dif
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	SetCharaAttr( mspdsa_fin , role , ATTR_STATEC_MSPD )
	ALLExAttrSet(role)
end

function State_QINGZ_Rem ( role , statelv )
	local mspdsa_dif = 0.3
	local def_dif = 50
	local mspdsa = MspdSa ( role )
	local mspdsa_fin = ( mspdsa - mspdsa_dif ) * ATTR_RADIX
	local defsb = DefSb( role ) + def_dif
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	SetCharaAttr( mspdsa_fin , role , ATTR_STATEC_MSPD )
	ALLExAttrSet(role)
end

--药水船只速度强化

function State_YSBoatMspd_Add ( role , statelv )
	local mspdsa_dif = 0
	if statelv == 1 then								--三角帆
		mspdsa_dif = 0.15
	end
	local mspdsa = ( MspdSa ( role ) + mspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)
end

function State_YSBoatMspd_Rem ( role , statelv )
	local mspdsa_dif = 0    
	if statelv == 1 then								
		mspdsa_dif = 0.15
	end
	local mspdsa = ( MspdSa ( role ) - mspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)
end


--药水船只防御强化

function State_YSBoatDEF_Add ( role , statelv )
	local defsb_dif = 0
	if statelv == 1 then								--强化装甲
		defsb_dif = 200
	end
	local defsb = ( DefSb ( role ) + defsb_dif )
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF ) 
	ALLExAttrSet(role)
end

function State_YSBoatDEF_Rem ( role , statelv )
	local defsb_dif = 0
	if statelv == 1 then								--强化装甲
		defsb_dif = 200
	end
	local defsb = ( DefSb ( role ) - defsb_dif )
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF ) 
	ALLExAttrSet(role)
end


-- 灯笼
function State_DengLong_Add ( role , statelv )
	local def_dif = 50
	local defsb = DefSb( role ) + def_dif
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end

function State_DengLong_Rem ( role , statelv )
	local def_dif = 50
	local defsb = DefSb( role ) - def_dif
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end

--僵尸带毒攻击--------------------------------------
function SkillSp_JSDD ( sklv )										
	local sp_reduce = 5 
	return sp_reduce 
end

function SkillCooldown_JSDD( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_JSDD_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_JSDD ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_JSDD_End ( ATKER , DEFER , sklv ) 
	local statelv = 1 
	local statetime =  30    
	dmg = Atk_Dmg( ATKER , DEFER )					--[[计算普通攻击的正常攻击伤害]]--
	sus,dmgsa = Check_MisorCrt( ATKER, DEFER )		--[[是否miss或crt]]--
	SetSus(DEFER , sus)							--设置暴击和miss 
--	dmgsa = Check_Zmyj ( ATKER , dmgsa )		--判断暴击伤害倍数
	hpdmg = math.floor( dmg*dmgsa ) 			--[[取正常伤害和最小伤害中的最大值,及miss和暴击伤害]]--
	Hp_Endure_Dmg( DEFER , hpdmg )					--[[设置受击者扣血]]--
	local StateLv = GetChaStateLv ( DEFER , STATE_TTISW )
	if StateLv ~= 4 then	
		AddState ( ATKER , DEFER , STATE_JSDD , statelv , statetime )
	end
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


function State_JSDD_Add ( role , statelv )
	if statelv == 3 then
		--尸毒
	end
	if statelv == 4 then
		--酋长中毒
	end
	local hpdmg = 100 * statelv   
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_JSDD_Rem ( role , statelv ) 
	--LG("state_JSDD" , "function State_JSDD_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
end 

--僵尸魔法攻击--------------------------------------
function SkillSp_JSMF ( sklv )										--技能"Zombie Sorcery Attack"的sp消耗公式
	local sp_reduce = 3 + sklv * 2   
	return sp_reduce 
end 

function SkillArea_Line_JSMF ( sklv )										--技能"Corpse Attack Wave"的技能区域公式
	local lenth = 800   
	local width = 200 + sklv * 10 
	SetSkillRange ( 1 , lenth , width  )  
end


function SkillCooldown_JSMF( sklv ) 
	local Cooldown = 2000
	return Cooldown
end


function Skill_JSMF_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_JSMF ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_JSMF_End ( ATKER , DEFER , sklv ) 
	local Sta_role = Sta ( DEFER ) 

	hpdmg =  math.max ( 1 ,math.max ( 30 , math.floor ( ( 150 - Sta_role ) ) * 2.8 ) ) 
	
	Hp_Endure_Dmg ( DEFER, hpdmg )  

end 

--狐道士魔法攻击--------------------------------------

function SkillSp_HDSMF ( sklv )										--技能"Fox Sorcery Attack"的sp消耗公式
	local sp_reduce = 30 + sklv * 2   
	return sp_reduce 
end 

function SkillCooldown_HDSMF( sklv ) 
	local Cooldown = 3000 
	return Cooldown
end

function Skill_HDSMF_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_HDSMF ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_HDSMF_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg =  math.max ( 1 , math.max ( 30 , ( 150 - Sta_role ) ) * 4 ) 
	Hp_Endure_Dmg ( DEFER, hpdmg )
end 
--狐妖魔法攻击--------------------------------------
function SkillSp_HYMF ( sklv )										--技能"Fox Sorcery Attack"的sp消耗公式
	local sp_reduce = 10 + sklv * 2   
	return sp_reduce 
end

function SkillCooldown_HYMF( sklv ) 
	local Cooldown = 3000 
	return Cooldown
end

function Skill_HYMF_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_HYMF ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_HYMF_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg = math.max ( 1 ,  math.floor (  math.max ( 50 , ( 150 - Sta_role ) ) * 3.5 ) ) 
	Hp_Endure_Dmg ( DEFER, hpdmg )
end 



--狐妖魅惑--------------------------------------
--男性角色一定时间无法移动、攻击、释放技能
function SkillSp_HYMH ( sklv )										--技能"Fascinate"的sp消耗公式
	local sp_reduce = 50 + sklv * 2   
	return sp_reduce 
end 

function SkillCooldown_HYMH( sklv ) 
	local Cooldown = 2000
	return Cooldown
end

function Skill_HYMH_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_HYMH ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

	--local cha_type = GetChaTypeID ( cha ) 

function Skill_HYMH_End ( ATKER , DEFER , sklv ) 
        local cha_type = GetChaTypeID ( DEFER )
	local statelv = sklv 
	local statetime =  6 + sklv * 1  

	if cha_type == 1 or cha_type == 2 then
		AddState ( ATKER , DEFER , STATE_HYMH , statelv , statetime ) 
		Check_Ys_Rem ( ATKER , DEFER )					--判断是否隐身
	end
end 

function State_HYMH_Add ( role , statelv ) 

end 

function State_HYMH_Rem ( role , statelv ) 

end 

--狐仙魔法攻击

function SkillSp_FoxMagic ( sklv )										--技能"Fox Sorcery Attack"的sp消耗公式
	local sp_reduce = 10 + sklv * 2   
	return sp_reduce 
end

function SkillCooldown_FoxMagic( sklv ) 
	local Cooldown = 3000 
	return Cooldown
end

function Skill_FoxMagic_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_FoxMagic ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_FoxMagic_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg =   math.max ( 50 , ( 150 - Sta_role ) )  * 10
	Hp_Endure_Dmg ( DEFER, hpdmg )
end 


--狐仙范围魔法攻击

function SkillArea_Circle_FoxSquareMagic ( sklv )										
	local side = 100 
	SetSkillRange ( 4 , side ) 	
end

function SkillCooldown_FoxSquareMagic( sklv )
	local Cooldown = 7000 - sklv * 500
	return Cooldown
end

function SkillSp_FoxSquareMagic ( sklv )										
	local sp_reduce = 20+ sklv * 3   
	return sp_reduce 
end


function Skill_FoxSquareMagic_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_FoxSquareMagic ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_FoxSquareMagic_End ( ATKER , DEFER , sklv ) 
	
	local Sta_role = Sta ( DEFER ) 
	hpdmg =  math.max( 30 , ( 150 - math.floor ( Sta_role / 2  ) ) ) * 5 + 300 
	Hp_Endure_Dmg ( DEFER, hpdmg )

end

--土著祭师魔法

function SkillSp_TZJSMagic ( sklv )										--技能"Fox Sorcery Attack"的sp消耗公式
	local sp_reduce = 10 + sklv * 2   
	return sp_reduce 
end

function SkillCooldown_TZJSMagic( sklv ) 
	local Cooldown = 3000 
	return Cooldown
end

function Skill_TZJSMagic_Begin ( role , sklv ) 
	local sp = Sp( role ) 
	local sp_reduce = SkillSp_TZJSMagic ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable( role )   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_TZJSMagic_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg =  math.max ( 50 , ( 150 - Sta_role ) ) * 5
	Hp_Endure_Dmg ( DEFER, hpdmg )
end 

--酋长魔法

function SkillArea_Circle_TZQZMagic ( sklv )										
	local side = 100 
	SetSkillRange ( 4 , side ) 	
end


function SkillSp_TZQZMagic ( sklv )										--技能"Fox Sorcery Attack"的sp消耗公式
	local sp_reduce = 10 + sklv * 2   
	return sp_reduce 
end

function SkillCooldown_TZQZMagic( sklv ) 
	local Cooldown = 3000 
	return Cooldown
end

function Skill_TZQZMagic_Begin ( role , sklv ) 
	local sp = Sp( role ) 
	local sp_reduce = SkillSp_TZQZMagic ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable( role )   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_TZQZMagic_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	local statelv = 4
	local statetime = 15
	hpdmg =   math.max ( 50 , ( 150 - Sta_role ) )  * 5
	Hp_Endure_Dmg ( DEFER, hpdmg )
	AddState ( ATKER , DEFER , STATE_JSDD , statelv , statetime ) 

end


--技能犬啸——————————————————————————————————————————————————————————————————————————————

function SkillSp_QuanX ( sklv )										
	local sp_reduce = sklv * 5 + 50  
	return sp_reduce 
end

function SkillCooldown_QuanX( sklv )
	local Cooldown = 3000
	return Cooldown
end

function SkillArea_Circle_QuanX ( sklv )										
	local side = 1000 
	SetSkillRange ( 4 , side ) 	
end 

function Skill_QuanX_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce 
	sp_reduce = SkillSp_QuanX ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	
	Sp_Red (role , sp_reduce ) 
end 

function Skill_QuanX_End ( ATKER , DEFER , sklv )
	local statetime = 5
	local statelv = 10
	AddState ( ATKER , DEFER , STATE_XY , statelv , statetime )
	local hpdmg =   200 
	Hp_Endure_Dmg ( DEFER, hpdmg )

end 

--尸毒攻击--------------------------------------
function SkillSp_SD ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end

function SkillCooldown_SD( sklv )
	local Cooldown = 20000
	return Cooldown
end

function Skill_SD_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_SD ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_SD_End ( ATKER , DEFER , sklv ) 
	local statelv = 3
	local statetime =  60   
	local hpdmg =   300
	Hp_Endure_Dmg ( DEFER, hpdmg )
	AddState ( ATKER , DEFER , STATE_JSDD , statelv , statetime ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 

--机械巨兵

--巨兵范围

function SkillArea_Line_JXJBFW ( sklv )										--技能"Conch Ray"的技能区域公式
	local lenth = 500
	local width = 200
	SetSkillRange ( 1 , lenth , width  )  
end

function SkillCooldown_JXJBFW( sklv )
	local Cooldown = 2000
	return Cooldown
end

function SkillSp_JXJBFW ( sklv )										
	local sp_reduce = 20+ sklv * 3   
	return sp_reduce 
end

function Skill_JXJBFW_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_JXJBFW ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_JXJBFW_End ( ATKER , DEFER , sklv ) 

	local dmg = 150
	Hp_Endure_Dmg ( DEFER , dmg ) 
end 


--旋转手臂

function SkillArea_Circle_JBXZSB ( sklv )										--技能“旋转手臂"的技能区域公式
	
	local side = 300  
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_JBXZSB( sklv )
	local Cooldown = 5000
	return Cooldown
end

function SkillPre_JBXZSB ( sklv )										--技能"Swirling Arm"的技能前期准备
end 

function SkillSp_JBXZSB ( sklv )										--技能"Swirling Arm"的sp消耗公式
	local sp_reduce = 20 - math.floor ( sklv * 0.5 ) 
	return sp_reduce 
end 


function Skill_JBXZSB_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_JBXZSB ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_JBXZSB_End ( ATKER , DEFER , sklv ) 
	local hp = Hp( DEFER ) 

	dmg =  Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , dmg )
	Check_Ys_Rem ( ATKER , DEFER)										--判断是否隐身
end 


--长绒蟹束缚

function SkillSp_CRXSF ( sklv )										--技能"Fascinate"的sp消耗公式
	local sp_reduce = 50 + sklv * 2   
	return sp_reduce 
end 

function SkillCooldown_CRXSF( sklv ) 
	local Cooldown = 2000
	return Cooldown
end

function Skill_CRXSF_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_CRXSF ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_CRXSF_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 15 
	local StateLv = GetChaStateLv ( DEFER , STATE_TTISW )
	if StateLv ~= 3 then
		AddState ( ATKER , DEFER , STATE_CRXSF , statelv , statetime ) 
	end

	Check_Ys_Rem ( ATKER , DEFER )					--判断是否隐身
end 

function State_CRXSF_Add ( role , statelv ) 

end 

function State_CRXSF_Rem ( role , statelv ) 

end

--水仙子诅咒

function SkillSp_SXZZZ ( sklv )										--技能"Fascinate"的sp消耗公式
	local sp_reduce = 50 + sklv * 2   
	return sp_reduce 
end 

function SkillCooldown_SXZZZ( sklv ) 
	local Cooldown = 2000
	return Cooldown
end

function Skill_SXZZZ_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_SXZZZ ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_SXZZZ_End ( ATKER , DEFER , sklv ) 
	local statelv = 10
	local statetime = 180
	local StateLv = GetChaStateLv ( DEFER , STATE_TTISW )
	if StateLv ~= 2 then
		AddState ( ATKER , DEFER , STATE_ZZZH , statelv , statetime )
	end
	Check_Ys_Rem ( ATKER , DEFER )					--判断是否隐身
end 


--小冰龙冰冻

function SkillSp_XBLBD ( sklv )										--技能"Fascinate"的sp消耗公式
	local sp_reduce = 50 + sklv * 2   
	return sp_reduce 
end 

function SkillCooldown_XBLBD( sklv ) 
	local Cooldown = 2000
	return Cooldown
end

function Skill_XBLBD_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_XBLBD ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_XBLBD_End ( ATKER , DEFER , sklv ) 
	local statelv = 5
	local statetime = 180 
	local StateLv = GetChaStateLv ( DEFER , STATE_TTISW )
	if StateLv ~= 1 then
		AddState ( ATKER , DEFER , STATE_BDJ , statelv , statetime )
	end
	Check_Ys_Rem ( ATKER , DEFER )					--判断是否隐身
end 




--冰龙攻击--------------------------------------

function SkillSp_BLGJ ( sklv )										--技能"Icy Dragon Strike"的sp消耗公式
   local sp_reduce = 15   
	return sp_reduce 
end 

function SkillArea_Sector_BLGJ ( sklv )										--技能"Icy Dragon Strike"的技能区域公式
	local angle = 120  
	local radius = 800 
	SetSkillRange ( 2 , radius , angle  )  
end

function SkillCooldown_BLGJ( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_BLGJ_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_BLGJ ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_BLGJ_End ( ATKER , DEFER , sklv ) 
	
	local hpdmg = 1.5 * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , hpdmg )
	
end 


--冰龙冰冻

function SkillArea_Circle_BHSD ( sklv )										--技能“冰龙冰冻"的技能区域公式
	
	local side = 300
	SetSkillRange ( 4 , side )   
end

function SkillSp_BHSD ( sklv )	
	local sp_reduce = 20   
	return sp_reduce 
end 

function SkillCooldown_BHSD( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_BHSD_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_BHSD ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 


function Skill_BHSD_End ( ATKER , DEFER , sklv ) 
	local statelv = 10 
	local statetime = 15 
	AddState ( ATKER , DEFER , STATE_BDJ , statelv , statetime )
	local hpdmg = 500 
	Hp_Endure_Dmg ( DEFER , hpdmg )
	
end

--黑龙恐惧--------------------------------------

function SkillSp_HLKJ ( sklv )	
	local sp_reduce = 200
	return sp_reduce 
end 

function SkillCooldown_HLKJ( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_HLKJ_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_HLKJ ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 


function Skill_HLKJ_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 30 
	AddState ( ATKER , DEFER , STATE_HLKJ , statelv , statetime ) 
	
end 


function State_HLKJ_Add ( role , statelv ) 
	--不能移动
end 


function State_HLKJ_Rem ( role , statelv ) 
end 


--黑龙龙息

function SkillSp_BlackDrgDeadHit ( sklv )										--技能"Icy Dragon Strike"的sp消耗公式
   local sp_reduce = 15   
	return sp_reduce 
end 

function SkillArea_Sector_BlackDrgDeadHit ( sklv )										--技能"Icy Dragon Strike"的技能区域公式
	local angle = 120  
	local radius = 600
	SetSkillRange ( 2 , radius , angle  )  
end

function SkillCooldown_BlackDrgDeadHit( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_BlackDrgDeadHit_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_BlackDrgDeadHit ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_BlackDrgDeadHit_End ( ATKER , DEFER , sklv ) 
	local hpdmg = 1.5 * Atk_Dmg ( ATKER , DEFER ) 
	Hp_Endure_Dmg ( DEFER , hpdmg )
	
end 


---黑龙龙鸣-----------------------------------


function SkillArea_Circle_HLLM ( sklv )										
	local side = 500
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_HLLM( sklv )
	local Cooldown = 1000
	return Cooldown
end

function SkillPre_HLLM ( sklv )										
end 

function SkillSp_HLLM ( sklv )										
	local sp_reduce = 20 - math.floor ( sklv * 0.5 ) 
	return sp_reduce 
end 


function Skill_HLLM_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_HLLM ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_HLLM_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 120 
	AddState ( ATKER , DEFER , STATE_HLLM , statelv , statetime ) 
	
end 

function State_HLLM_Add ( role , statelv ) 
	local mxatksa_dif = 0.5
	local mnatksa_dif = 0.5
	local mxatksa = ( MxatkSa(role) - mxatksa_dif ) 
	local mnatksa = ( MnatkSa(role) - mnatksa_dif ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK )
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK )
	ALLExAttrSet(role)  
end 

function State_HLLM_Rem ( role , statelv ) 
	local mxatksa_dif = 0.5
	local mnatksa_dif = 0.5
	local mxatksa = ( MxatkSa(role) + mxatksa_dif ) 
	local mnatksa = ( MnatkSa(role) + mnatksa_dif ) 
	SetCharaAttr( mxatksa , role , ATTR_STATEC_MXATK )
	SetCharaAttr( mnatksa , role , ATTR_STATEC_MNATK )
	ALLExAttrSet(role)
end

--黑龙龙翼攻击

function SkillArea_Circle_BlackDrgWing ( sklv )										
	local side = 3000
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_BlackDrgWing( sklv )
	local Cooldown = 1000
	return Cooldown
end

function SkillPre_BlackDrgWing ( sklv )										
end 

function SkillSp_BlackDrgWing ( sklv )										
	local sp_reduce = 20 - math.floor ( sklv * 0.5 ) 
	return sp_reduce 
end 


function Skill_BlackDrgWing_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_BlackDrgWing ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_BlackDrgWing_End ( ATKER , DEFER , sklv ) 
	local Sta_role = Sta ( DEFER ) 
	hpdmg =  math.max ( 100 , ( 150 - Sta_role ) ) * 15
	Hp_Endure_Dmg ( DEFER, hpdmg )
end 



--起死回生

function SkillSp_BlackHeal ( sklv )							
	local sp_reduce = 30 + sklv * 4    
	return sp_reduce 
end

function SkillCooldown_BlackHeal( sklv ) 
	local Cooldown = 7000 - sklv * 300 
	return Cooldown 
end

function Skill_BlackHeal_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_BlackHeal ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_BlackHeal_End ( ATKER , DEFER , sklv ) 
	
	local hpdmg = -50000 
	Hp_Endure_Dmg ( DEFER , hpdmg ) 

end 



--三月精灵

function State_MarchElf_Add ( role , statelv )
	local def_dif = 50
	local srecsb_dif = 20  
	local defsb = DefSb( role ) + def_dif
 	local srecsb = SrecSb(role) + srecsb_dif
	SetCharaAttr( srecsb , role , ATTR_STATEV_SREC ) 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end

function State_MarchElf_Rem ( role , statelv )
	local def_dif = 50
	local srecsb_dif = 20  
	local defsb = DefSb( role ) - def_dif
 	local srecsb = SrecSb(role) - srecsb_dif
	SetCharaAttr( srecsb , role , ATTR_STATEV_SREC ) 
	SetCharaAttr( defsb , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end

--黑龙虎啸

 function SkillArea_Circle_BlackHx( sklv )									--技能“虎啸"的技能区域公式	
	local side = 5000 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_BlackHx( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_BlackHx_End ( ATKER , DEFER , sklv ) 
	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 10
	AddState( ATKER , DEFER , STATE_BlackHX, statelv , statetime ) 
	dmg = 0.8 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

function State_BlackHx_Add ( role , statelv ) 
	--LG("state_hx" , "function State_Hx_Add : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	local aspda_dif =0.3
	local aspdsa =(AspdSa(role)-aspda_dif) * ATTR_RADIX 
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 



function State_BlackHx_Rem ( role , statelv ) 
	--LG("state_hx" , "function State_Hx_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	local aspda_dif =0.3
	local aspdsa =(AspdSa(role) + aspda_dif) * ATTR_RADIX 
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 


--黑龙雷击
function SkillCooldown_BlackLj( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_BlackLj_End( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime = 3 
	local Sta_role = Sta ( DEFER ) 
	local statelv = 4
	hpdmg =1000 +  math.max ( 50 , ( 150 - Sta_role ) )  * 10
	Hp_Endure_Dmg ( DEFER, hpdmg )
	AddState ( ATKER , DEFER , STATE_HLKJ , statelv , statetime ) 
	
end 


function State_BlackLj_Add ( role , statelv ) 
	--不能移动
end 


function State_BlackLj_Rem ( role , statelv ) 
end 


---黑龙幻影斩
 function SkillCooldown_BlackHyz( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_BlackHyz_End ( ATKER , DEFER , sklv ) 
	 atk = 2 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
	defer_def = Def ( DEFER ) 
	defer_resist = Resist ( DEFER ) 
	dmg = Phy_Dmg ( atk, defer_def , defer_resist )
	dmg1 = math.max (20,dmg)
	Hp_Endure_Dmg ( DEFER , dmg1 )  
	 

	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


----黑龙炎球
 function SkillCooldown_BlackYq( sklv ) 
	local Cooldown = 10000 
	return Cooldown
end

 function Skill_BlackYq_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg = 2500 +  math.max ( 50 , ( 150 - Sta_role ) )  * 20
	Hp_Endure_Dmg ( DEFER, hpdmg )
end 

-------黑龙召唤
 function SkillCooldown_BlackZh( sklv )
	local Cooldown = 1200000
	return Cooldown
end

function SkillArea_Circle_BlackZh( sklv )									
	local side = 1000 
	SetSkillRange ( 4 , side  )  
end

function Skill_BlackZh_End( ATKER , DEFER , sklv )
	local x, y = GetChaPos(ATKER)
		local x1 = x
		local x2 = x +700
		local x3 = x -700
		local y1 = y + 700
		local y2 = y - 700
		local y3 = y -700
		local new1 = CreateCha(791, x1, y1, 145, 50)
		local new2 = CreateCha(793, x2, y2, 145, 50)
		local new3 = CreateCha(794, x3, y3, 145, 50)
		SetChaLifeTime(new1, 900000)
		SetChaLifeTime(new2, 900000)
		SetChaLifeTime(new3, 900000)
end
---------------------------------精灵毒噬
function State_JLDS_Add ( role , statelv )
	local hpdmg = 30 * statelv   
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_JLDS_Rem ( role , statelv ) 
	--LG("state_JSDD" , "function State_JSDD_Rem : " , "role =  " , role , "statelv = " , statelv, "\n" ) 
end 
--超人棒棒糖-------------------------------------
function State_CJBBT_Add ( role , statelv )
	local str = GetChaAttr( role , ATTR_STR )
	SetCharaAttr(str ,role , ATTR_STATEV_STR)
	ALLExAttrSet(role)
end
function State_CJBBT_Rem ( role , statelv )
	SetCharaAttr(0 ,role , ATTR_STATEV_STR)
	ALLExAttrSet(role)
end
--巨人巧克力-------------------------------------
function State_JRQKL_Add ( role , statelv )
	local con = GetChaAttr( role , ATTR_CON ) 
	SetCharaAttr( con , role , ATTR_STATEV_CON )
	ALLExAttrSet(role)
end
function State_JRQKL_Rem ( role , statelv )
	SetCharaAttr(0 ,role , ATTR_STATEV_CON)
	ALLExAttrSet(role)
end


--------------------亡灵燃烧弹
function SkillCooldown_wlrsd( sklv ) 
	local Cooldown = 2000 
	return Cooldown
end


function Skill_wlrsd_End( ATKER , DEFER , sklv )
	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 6
	AddState( ATKER , DEFER , STATE_WLRSD, statelv , statetime ) 
	dmg = 2 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
	Hp_Endure_Dmg ( DEFER , dmg) 
end 

function State_wlrsd_Add ( role , statelv ) 
	local hpdmg = 60   
		Hp_Endure_Dmg ( role , hpdmg ) 
		ALLExAttrSet(role)  
end 

function State_wlrsd_Rem ( role , statelv ) 
end

----------------------------亡灵加速
function SkillCooldown_wljs( sklv )
	local Cooldown = 2000 
	return Cooldown
end

function Skill_wljs_End ( ATKER , DEFER , sklv )
	local statelv = sklv 
	local statetime = 6
	local statelv = 4
	AddState( ATKER , DEFER , STATE_WLJS, statelv , statetime ) 
 end

function  State_wljs_Add ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_wljs_Rem  ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

-----------------------------------火枪攻击
function SkillCooldown_hqgj( sklv )
	local Cooldown = 3000 
	return Cooldown
end

function Skill_hqgj_End ( ATKER , DEFER , sklv ) 
	local	 atk = 1.5 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
	local	defer_def = Def ( DEFER ) 
	local	defer_resist = Resist ( DEFER ) 
	dmg = Phy_Dmg ( atk, defer_def , defer_resist )
	dmg1 = math.max (20,dmg)
	Hp_Endure_Dmg ( DEFER , dmg1 )  
end 


-----------------------------亡灵击晕
function SkillCooldown_wljy( sklv )
	local Cooldown = 2000 
	return Cooldown
end

function Skill_wljy_End ( ATKER , DEFER , sklv )
	local statelv = sklv 
	local statetime = 3 
	local statelv = 4
	local Sta_role = Sta ( DEFER ) 
	hpdmg =400 +  math.max ( 50 , ( 150 - Sta_role ) )  * 8
	Hp_Endure_Dmg ( DEFER, hpdmg )
	AddState ( ATKER , DEFER , STATE_WLJY , statelv , statetime ) 
 end
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     
function State_wljy_Add ( role , statelv )

 end 

function State_wljy_Rem ( role , statelv )
 end 


--------------------------------- 激光束
function SkillCooldown_jgs( sklv )
	local Cooldown = 5000 
	return Cooldown
end

function Skill_jgs_End ( ATKER , DEFER , sklv )
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	local 	dmg = math.floor ( 500 +hp *0.05) 
	if dmg > 2000 then
		dmg = 2000
	end
	hp = hp - dmg 
	SetCharaAttr ( hp , DEFER , ATTR_HP ) 
end 


--------------------------------- 亡灵毒镖
function SkillCooldown_wldb ( sklv )
	local Cooldown = 2000
	return Cooldown
end

function Skill_wldb_End ( ATKER , DEFER , sklv )
	local statelv = sklv 
	local statetime =  10  

	local	defer_def = Def ( DEFER )
	--hpdmg = 300 +  math.max ( 50 , ( 300 - defer_def ) )  * 5
	Hp_Endure_Dmg ( DEFER, hpdmg )
	AddState ( ATKER , DEFER , STATE_WLDB , statelv , statetime ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 


function State_wldb_Add ( role , statelv ) 
	local hpdmg = 160 
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_wldb_Rem ( role , statelv ) 
end 


----------------------------------------- 远程爆破
function SkillCooldown_ycbp ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end

function Skill_ycbp_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg = 1000 +  math.max ( 50 , ( 150 - Sta_role ) )  * 20
	Hp_Endure_Dmg ( DEFER, hpdmg )
end 


-------------------------------------------- 烟雾攻击
function SkillArea_Circle_ywgj ( sklv )										--技能"Fog"的技能区域公式
	local side = 300    
	SetSkillRange ( 3 , side  )  
end

function SkillCooldown_ywgj( sklv )
	local Cooldown = 2000
	return Cooldown
end


function SkillArea_State_ywgj ( sklv )										
	local statetime = 20    
	local statelv = sklv 
	SetRangeState ( STATE_MW , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 


function Skill_ywgj_End ( ATKER , DEFER , sklv ) 
end 

function State_ywgj_Add ( role , statelv ) 
	local  agisb =  AgiSb( role ) 
	local hitsb_dif = 10 + math.floor (math.max(5, agisb/20) )
	local hitsb = HitSb(role) - hitsb_dif 
	SetCharaAttr ( hitsb , role , ATTR_STATEV_HIT ) 
	ALLExAttrSet(role)  
end 

function State_ywgj_Rem ( role , statelv ) 
	local  agisb =  AgiSb( role ) 
	local hitsb_dif = 10 + math.floor (math.max(5, agisb/20) )
	local hitsb = HitSb(role) + hitsb_dif 
	SetCharaAttr ( hitsb , role , ATTR_STATEV_HIT ) 
	ALLExAttrSet(role)  
end 

function State_ywgj_Tran ( statelv ) 
	return 1     
end


-----------------------------------------骷髅缠身
function SkillCooldown_klcs ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

function Skill_klcs_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =6
	AddState ( ATKER , DEFER , STATE_KLCS , statelv , statetime ) 
end 


function State_klcs_Add ( role , statelv ) 
	local dmg = math.random (60,100) 
	Endure_Dmg ( role , dmg ) 
end 

function State_klcs_Rem ( role , statelv ) 
end

-----------------------------------------------------------灵异移动
function SkillCooldown_lyyd ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

function Skill_lyyd_End ( ATKER , DEFER , sklv ) 
	local x, y = GetChaPos(DEFER)
	local map_name = GetChaMapName (DEFER)
	local x = math.floor (x/100)
	local y = math.floor (y/100)
	GoTo(ATKER, x,y, map_name)
 end

-----------------------------------------------------------------骷髅护盾
function SkillCooldown_klhd ( ATKER , DEFER , sklv )
	local Cooldown = 5000 
	return Cooldown
end 

function  Skill_klhd_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =10
	AddState ( ATKER , DEFER , STATE_KLHD , statelv , statetime ) 
end 

function State_klhd_Add ( role , statelv ) 
	local defsa_dif = 0.8 
	local defsa = math.floor ( ( DefSa(role) + defsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	ALLExAttrSet(role)  
end 

function State_klhd_Rem ( role , statelv ) 
	local defsa_dif = 0.8 
	local defsa = math.floor ( ( DefSa(role) - defsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	ALLExAttrSet(role)  
end 

-------------------------------------------------------- 邪恶攻击
function SkillCooldown_xegj ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

function Skill_xegj_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local Sta_role = Sta ( DEFER ) 
	hpdmg =400 +  math.max ( 50 , ( 150 - Sta_role ) )  * 5
	Hp_Endure_Dmg ( DEFER, hpdmg )
 end


-----------------------------------------------------------亡灵乱砍
function SkillCooldown_wllk ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

function Skill_wllk_End ( ATKER , DEFER , sklv )
	 atk =  math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
	defer_def = Def ( DEFER ) 
	defer_resist = Resist ( DEFER ) 
	dmg = Phy_Dmg ( atk, defer_def , defer_resist )
	dmg1 = math.max (20,dmg)
	Hp_Endure_Dmg ( DEFER , dmg1 ) 
end 

------------------------------------------------------------炸弹投掷
function SkillCooldown_zdtz ( ATKER , DEFER , sklv )
	local Cooldown = 4000 
	return Cooldown
end 

function Skill_zdtz_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg =500 +  math.max ( 50 , ( 100 - Sta_role ) )  * 8
		Hp_Endure_Dmg ( DEFER, hpdmg )
end 

---------------------------------------------------------------亡灵怒吼


function SkillCooldown_wlnh ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

function  Skill_wlnh_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =10
	AddState ( ATKER , DEFER , STATE_WLNH , statelv , statetime ) 
end 

function State_wlnh_Add ( role , statelv )  
	local atksb_dif = 800	
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)
end

function State_wlnh_Rem ( role , statelv ) 
		local atksb_dif = 800	
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)
end


------------------------------------------------------------亡灵嘲笑
function SkillCooldown_wlcx ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

 function SkillArea_Circle_wlcx( sklv )									 
	local side = 2000 
	SetSkillRange ( 4 , side  )  
end 

function Skill_wlcx_End ( ATKER , DEFER , sklv )
	local statelv = sklv 
	local statetime =10
	AddState ( ATKER , DEFER , STATE_WLCX , statelv , statetime ) 
end 


function State_wlcx_Add ( role , statelv ) 
	local hitsb_dif = 30
	local hitsb = HitSb(role) - hitsb_dif  
	local flee_dif = 10
	local fleesb = FleeSb( role ) -  flee_dif
	SetCharaAttr( hitsb , role , ATTR_STATEV_HIT ) 
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE )  
	
	ALLExAttrSet(role)  
end 

function State_wlcx_Rem ( role , statelv ) 
	local hitsb_dif = 30
	local hitsb = HitSb(role) + hitsb_dif  
	local flee_dif = 10
	local fleesb = FleeSb( role ) +  flee_dif
	SetCharaAttr( hitsb , role , ATTR_STATEV_HIT ) 
	SetCharaAttr( fleesb , role , ATTR_STATEV_FLEE )  
	
	ALLExAttrSet(role)  
end 

----------------------------------------------------------------------------- 诅咒之血
function SkillCooldown_zzzx ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

 function SkillArea_Circle_zzzx( sklv )									 
	local side = 2000 
	SetSkillRange ( 4 , side  )  
end 



function  Skill_zzzx_End ( ATKER , DEFER , sklv )
	local statelv = sklv 
	local statetime =10
	AddState ( ATKER , DEFER , STATE_ZZZX , statelv , statetime ) 
end 

function State_wlcx_Add  ( role , sklv ) 
	local hpdmg = 100
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_wlcx_Rem  ( role , sklv ) 
	ALLExAttrSet(role)  
end 

-------------------------------------------------------------月光恢复
function SkillCooldown_yghf ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

function Skill_yghf_End ( ATKER , DEFER , sklv )
	local hp = Hp( ATKER ) 
	local mxhp = Mxhp (ATKER)
	local hp_dif = mxhp - hp
	local hp_rec = hp_dif * 0.2
	local hp_now = hp + hp_rec
	if hp_now < 100000 then
	local	hp_rec = 100000
	end
	SetCharaAttr( hp_now , ATKER , ATTR_HP )  
end

--------------------------------------------------------------------------亡灵水箭
function SkillCooldown_yghf ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

function Skill_wlsj_End ( ATKER , DEFER , sklv )
	 atk = 800 +  math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
	defer_def = Def ( DEFER ) 
	defer_resist = Resist ( DEFER ) 
	dmg = Phy_Dmg ( atk, defer_def , defer_resist )
	dmg1 = math.max (20,dmg)
	Hp_Endure_Dmg ( DEFER , dmg1 )  
end 

------------------------------------------------------------------ 亡灵漩涡
function SkillCooldown_wlxw ( ATKER , DEFER , sklv )
	local Cooldown = 2000 
	return Cooldown
end 

function SkillArea_Circle_wlxw ( sklv )										--技能"Whirlpool"的技能区域公式
	local side = 1000  
	SetSkillRange ( 3 , side  )  
end

function SkillArea_State_wlxw ( sklv )										
	local statetime = 10    
	local statelv = sklv 
	SetRangeState ( STATE_XW , statelv  , statetime ) 									--添加地面“圣眼之翼”状态

end 

function Skill_wlxw_End ( ATKER , DEFER , sklv ) 
	
end 

function State_wlxw_Add ( role , statelv ) 
	local mspdsa_dif = 0.5 
	local aspdsa_dif = 0.3
	local mspdsa = ( MspdSa ( cha_role ) - mspdsa_dif )  * ATTR_RADIX
	local aspdsa = ( AspdSa ( cha_role ) - aspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	ALLExAttrSet( role )  
end 

function State_wlxw_Rem ( role , statelv ) 
	local mspdsa_dif = 0.5 
	local aspdsa_dif = 0.3 
	local mspdsa = ( MspdSa ( cha_role ) + mspdsa_dif )  * ATTR_RADIX
	local aspdsa = ( AspdSa ( cha_role ) + aspdsa_dif )  * ATTR_RADIX
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	SetCharaAttr( aspdsa , role , ATTR_STATEC_ASPD ) 
	ALLExAttrSet( role )  
end 

function State_wlxw_Tran ( statelv ) 
	return 1     
end 

--------------------------------------------------------------------亡灵雷幕
function SkillArea_Circle_wllm ( sklv )										--技能"Lightning Curtain"的技能区域公式
	local side = 500  
	SetSkillRange ( 3 , side  )  
end

function SkillCooldown_wllm( sklv )
	local Cooldown = 2000
	return Cooldown
end

function SkillArea_State_wllm ( sklv )										
	local statetime = 15      
	local statelv = 7 
	SetRangeState ( STATE_LM , statelv  , statetime ) 									--添加地面“雷幕”状态
end 

function Skill_wllm_End ( ATKER , DEFER , sklv ) 
end 

function State_Lm_Add ( role , statelv ) 
	local dmg = 160 + statelv * 20
	Hp_Endure_Dmg ( role , dmg ) 
end 

function State_Lm_Rem ( role , statelv ) 
end 

function State_Lm_Tran ( statelv ) 
	return 1     
end


---------------------------------亡灵召唤
function SkillCooldown_wlzh ( sklv )
	local Cooldown = 500000
	return Cooldown
end

function SkillArea_Circle_wlzh( sklv )									
	local side = 1000 
	SetSkillRange ( 4 , side  )  
end

function Skill_wlzh_End( ATKER , DEFER , sklv )
	local x, y = GetChaPos(ATKER)
		local x1 = x + 200
		local x2 = x + 200
		local x3 = x - 200
		local x4 = x - 200
		local y1 = y + 200
		local y2 = y - 200
		local y3 = y + 200
		local y4 = y - 200
		local new1 = CreateCha(799, x1, y1, 145, 50)
		local new2 = CreateCha(799, x2, y2, 145, 50)
		local new3 = CreateCha(799, x3, y3, 145, 50)
		local new4 = CreateCha(799, x4, y4, 145, 50)
		SetChaLifeTime(new1, 900000)
		SetChaLifeTime(new2, 900000)
		SetChaLifeTime(new3, 900000)
		SetChaLifeTime(new4, 900000)
end

-----------------------------------物理飞刀
function SkillCooldown_wlfd( sklv )
	local Cooldown = 1000 
	return Cooldown
end

function Skill_wlfd_End ( ATKER , DEFER , sklv ) 
	local	 atk = math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
	local	defer_def = Def ( DEFER ) 
	local	defer_resist = Resist ( DEFER ) 
	dmg = Phy_Dmg ( atk, defer_def , defer_resist )
	dmg1 = math.max (20,dmg)
	Hp_Endure_Dmg ( DEFER , dmg1 )  
end 

---------------------------------精神飞刀
function SkillCooldown_jsfd ( ATKER , DEFER , sklv )
	local Cooldown = 1000 
	return Cooldown
end 

function Skill_jsfd_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg =500 +  math.max ( 50 , ( 100 - Sta_role ) )  * 8
		Hp_Endure_Dmg ( DEFER, hpdmg )
end 

--精灵附体-------------------------------------
function SkillCooldown_JLFT( sklv )
	local Cooldown = 180000
	return Cooldown
end
function SkillSp_JLFT ( sklv )										--技能"Fairy body"的sp消耗公式
	local sp_reduce = 20 
	return sp_reduce 
end 
function Skill_JLFT_BEGIN( role , sklv )			
		--SystemNotice ( role , "Skill_JLFT_BEGIN" ) 
	local item_elf = GetChaItem(role , 2, 1)			--获取背包第2格道具指针
	local item_elf_type = GetItemType ( item_elf )			--获取背包第2格道具类型
	local item_elf_maxhp = GetItemAttr(item_elf,ITEMATTR_MAXURE)	--获取精灵最大hp	
	local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)		--获取精灵当前hp
	local role_hp = GetChaAttr(role, ATTR_HP)
	local role_mxhp = GetChaAttr(role, ATTR_MXHP)
	local Num_JL = GetItemForgeParam ( item_elf , 1 )
	local Part1 = GetNum_Part1 ( Num_JL )	--Get Num Part 1 到 Part 7
		--SystemNotice ( role , "item_elf_type=="..item_elf_type ) 
		--SystemNotice ( role , "item_elf_hp=="..item_elf_hp ) 
		--SystemNotice ( role , "Part1=="..Part1 ) 

	if item_elf_type ~= 59 or Part1~=1 then
		SkillUnable(role) 
		SystemNotice ( role , "Current skill is only available if the new generation of pet is equipped!" ) 
		return 
	end
	local str = GetItemAttr( item_elf ,ITEMATTR_VAL_STR )			--力量 
	local con = GetItemAttr( item_elf ,ITEMATTR_VAL_CON )		 ---体质 
	local agi = GetItemAttr( item_elf ,ITEMATTR_VAL_AGI )			--敏捷 
	local dex = GetItemAttr( item_elf ,ITEMATTR_VAL_DEX )		 --专注 
	local sta = GetItemAttr( item_elf ,ITEMATTR_VAL_STA )			 --精神 
	local lv_JL = str + con + agi + dex + sta	----一个精灵的等级
	if item_elf_hp<5000 then
		SkillUnable(role) 
		SystemNotice ( role , "Fairy needs to have at least 100 stamina to activate this skill!" ) 
		return 
	end
	item_elf_hp=item_elf_hp-(6*lv_JL/sklv)*50
	SetItemAttr ( item_elf , ITEMATTR_URE , item_elf_hp ) 
end 
function Skill_JLFT_End ( ATKER , DEFER , sklv )
	local statelv = sklv 
	local statetime = 190 - sklv * 10 
	local item_elf = GetChaItem(ATKER , 2, 1)			--获取背包第2格道具指针
	local item_elf_type = GetItemType ( item_elf )			--获取背包第2格道具类型
	local Item_ID = GetItemID ( item_elf )	--取ID
		--SystemNotice ( ATKER , "Item_ID=="..Item_ID ) 

	if Item_ID==231 then------运之精灵
			--SystemNotice ( ATKER , "Fairy of Luck=="..Item_ID ) 

		AddState( ATKER , ATKER , STATE_JLFT1, statelv , statetime ) 
	elseif Item_ID==232 then---------力之精灵
			--SystemNotice ( ATKER , "Item_ID=="..Item_ID ) 

		AddState( ATKER , ATKER , STATE_JLFT2, statelv , statetime ) 
	elseif Item_ID==233 then---------体之精灵
			--SystemNotice ( ATKER , "Fairy of Strength=="..Item_ID ) 

		AddState( ATKER , ATKER , STATE_JLFT3, statelv , statetime ) 
	elseif Item_ID==234 then---------神之精灵
			--SystemNotice ( ATKER , "Fairy of Spirit=="..Item_ID ) 

		AddState( ATKER , ATKER , STATE_JLFT4, statelv , statetime ) 
	elseif Item_ID==235 then---------专之精灵
			--SystemNotice ( ATKER , "Fairy of Accuracy=="..Item_ID ) 

		AddState( ATKER , ATKER , STATE_JLFT5, statelv , statetime ) 
	elseif Item_ID==236 then---------敏之精灵
			--SystemNotice ( ATKER , "Fairy of Agility=="..Item_ID ) 

		AddState( ATKER , ATKER , STATE_JLFT6, statelv , statetime ) 
	elseif Item_ID==237 then---------邪之精灵
			--SystemNotice ( ATKER , "Fairy of Evil=="..Item_ID ) 

		AddState( ATKER , ATKER , STATE_JLFT7, statelv , statetime ) 
	elseif Item_ID==681 then---------摩二
			--SystemNotice ( ATKER , "Mor 2="..Item_ID ) 

		AddState( ATKER , ATKER , STATE_JLFT8, statelv , statetime ) 
	end
end 
function State_JLFT_Add ( role , sklv )
	local Item_bg = GetChaItem ( role , 2 , 1  ) --取角色背包第二栏的指针
	local Get_Item_Type = GetItemType ( Item_bg ) --调用程序接口获得Item道具类型
		--SystemNotice ( role , "Get_Item_Type=="..Get_Item_Type ) 

	if Get_Item_Type==59 then --------判断是否为精灵并且体力大于100
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
		local Part4 = GetNum_Part4 ( Num_JL )
		local Part5 = GetNum_Part5 ( Num_JL )
		local Part6 = GetNum_Part6 ( Num_JL )
		local Part7 = GetNum_Part7 ( Num_JL)
		--SystemNotice ( role , "State_JLFT_Add_URE=="..URE ) 
		--SystemNotice ( role , "State_JLFT_Add_Part1=="..Part1 ) 
		if Part1 ==1 then ------判断二转精灵
			local star=0
			local statelv=lv_JL*0.025*(sklv+1)*0.05 ----lv*1/40*(skilllv+1)/2*0.1
			if Item_ID ==232 then -------------力之精灵
				--local star = GetChaAttr( role , ATTR_BSTR )*statelv
				local star = lv_JL
				SetCharaAttr(star ,role , ATTR_STATEV_STR)
			end	
			if Item_ID ==233 then -------------体之精灵
				--local star = GetChaAttr( role , ATTR_BCON )*statelv
				local star = lv_JL
				SetCharaAttr(star ,role , ATTR_STATEV_CON)
			end
			if Item_ID ==234 then -------------神之精灵
				--local star = GetChaAttr( role , ATTR_BSTA )*statelv
				local star = lv_JL
				SetCharaAttr(star ,role , ATTR_STATEV_STA)
			end
			if Item_ID ==235 then -------------专之精灵
				--local star = GetChaAttr( role , ATTR_BDEX )*statelv
				local star = lv_JL
				SetCharaAttr(star ,role , ATTR_STATEV_DEX)
			end
			if Item_ID ==236 then -------------敏之精灵
				--local star = GetChaAttr( role , ATTR_BAGI )*statelv
				local star = lv_JL
				SetCharaAttr(star ,role , ATTR_STATEV_AGI)
			end
			--if Item_ID ==237 then -------------邪之精灵
			--end
			if Item_ID ==231 or  Item_ID ==681 then -------------运之精灵和摩豆小子二世
				--local star = lv_JL
				local star1 = GetChaAttr( role , ATTR_BMF )
				local star = GetChaAttr( role , ATTR_BMF )*lv_JL*0.02
				local star2=star+star1
				--SystemNotice ( role , "Character current MF is "..star1 ) 
				--SystemNotice ( role , "Character current MF set as "..star2 ) 
				SetCharaAttr(star ,role , ATTR_STATEV_MF)
			end
			if Item_ID ==681 then -------------摩豆小子二世
				if str~=nil and str~=0 then
					SetCharaAttr(str ,role , ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					SetCharaAttr(con ,role , ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					SetCharaAttr(sta ,role , ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					SetCharaAttr(dex ,role , ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					SetCharaAttr(agi  ,role , ATTR_STATEV_AGI)
				end
			end
			--URE=URE-4500
		end
		--SetItemAttr ( Item_bg , ITEMATTR_URE , URE ) 	
	end
	ALLExAttrSet(role)
end
function State_JLFT_Rem ( role , sklv )
	SetCharaAttr(0 ,role , ATTR_STATEV_STR)
	SetCharaAttr(0 ,role , ATTR_STATEV_CON)
	SetCharaAttr(0 ,role , ATTR_STATEV_STA)
	SetCharaAttr(0 ,role , ATTR_STATEV_DEX)
	SetCharaAttr(0 ,role , ATTR_STATEV_AGI)
	SetCharaAttr(0 ,role , ATTR_STATEV_MF)
	ALLExAttrSet(role)
end


---------------------------------精灵自暴
function SkillCooldown_jlzb ( sklv )
	local Cooldown = 180000
	return Cooldown
end

function SkillArea_Circle_jlzb( sklv )									
	local side = 1500 
	SetSkillRange ( 4 , side  )  
end

function Skill_jlzb_Begin( role , sklv )	
	local item_elf = GetChaItem(role , 2, 1)			--获取背包第2格道具指针
	local item_elf_type = GetItemType ( item_elf )			--获取背包第2格道具类型
	local elf_str =  GetItemAttr( item_elf ,ITEMATTR_VAL_STR )		--力量
	local elf_con =  GetItemAttr( item_elf ,ITEMATTR_VAL_CON )		--体质
	local elf_agi =  GetItemAttr( item_elf ,ITEMATTR_VAL_AGI )		--专注
	local elf_dex =  GetItemAttr( item_elf ,ITEMATTR_VAL_DEX )		--敏捷
	local elf_sta =  GetItemAttr( item_elf ,ITEMATTR_VAL_STA )		--精神
	local elf_lv = elf_str + elf_con + elf_agi + elf_dex + elf_sta		--等级
	local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)		--获取精灵当前hp
	local Num_JL = GetItemForgeParam ( item_elf , 1 )
	local Part1 = GetNum_Part1 ( Num_JL )	--Get Num Part 1 到 Part 7
	if item_elf_type ~= 59 or Part1~=1 then
		SkillUnable(role) 
		SystemNotice ( role , "Current skill is only available if the new generation of pet is equipped!" ) 
		return 
	end

	if item_elf_hp<50 then
		SkillUnable(role) 
		SystemNotice ( role , "Fairy's HP must be more than 0 to use this skill" ) 
		return 
	end
	item_elf_hp = item_elf_hp - (9 *elf_lv/sklv)*50
	--if item_elf_hp<0 then
	--	item_elf_hp=0
	--end
	SetItemAttr(item_elf,ITEMATTR_URE,item_elf_hp)	
end 

function Skill_jlzb_End( ATKER , DEFER , sklv )
	local dmg_fin = 1
	local item_elf = GetChaItem(ATKER , 2, 1)
	local item_elf_type = GetItemType ( item_elf )
	local ptnRoleType = GetChaAttr(DEFER, ATTR_CHATYPE)
	if ptnRoleType == 1 or ptnRoleType ==5 or ptnRoleType == 17 then   --陨石，树木规避
		if item_elf_type == 59 then
			local elf_str =  GetItemAttr( item_elf ,ITEMATTR_VAL_STR )		--力量
			local elf_con =  GetItemAttr( item_elf ,ITEMATTR_VAL_CON )		--体质
			local elf_agi =  GetItemAttr( item_elf ,ITEMATTR_VAL_AGI  )		--专注
			local elf_dex =  GetItemAttr( item_elf ,ITEMATTR_VAL_DEX )		--敏捷
			local elf_sta =  GetItemAttr( item_elf ,ITEMATTR_VAL_STA )		--精神
			local elf_lv = elf_str + elf_con + elf_agi + elf_dex + elf_sta		--等级
			local elf_ure=GetItemAttr(item_elf,ITEMATTR_URE )*-1			 ---------取精灵体力
			local elf_maxure=GetItemAttr(item_elf,ITEMATTR_MAXURE )			 ---------取精灵体力
			
			local str = GetChaAttr( DEFER , ATTR_STR )
			local con = GetChaAttr( DEFER , ATTR_CON ) 
			local sta = GetChaAttr( DEFER , ATTR_STA )
			local agi = GetChaAttr( DEFER , ATTR_AGI)
			local dex = GetChaAttr( DEFER , ATTR_DEX )
			local Defer_Sum =  str+con+sta+agi+dex

			 dmg_fin = elf_lv * 200 - (Defer_Sum * Defer_Sum * Defer_Sum/10000)		--伤害计算
			 if dmg_fin < 0 then
				dmg_fin = 0
			 end

			if is_friend(ATKER,DEFER) ~= 1 then								--友军判断
				Hp_Endure_Dmg ( DEFER , dmg_fin )
			end
			
			local statetime = 20      
			local statelv = 10 		--无特殊效果
			local atker_hp = GetChaAttr( ATKER , ATTR_HP ) 
	
			if dmg_fin>=atker_hp then
				AddState ( ATKER , ATKER , STATE_XY , statelv , statetime )
			else
			
			local star_hp_differ=atker_hp-dmg_fin
			SetCharaAttr(star_hp_differ,ATKER, ATTR_HP) 
			end
		end
	end
end


function State_5MBS_Add(role , sklv)
	local role_mxhp = GetChaAttr(role, ATTR_MXHP)
	Hp_Endure_Dmg ( role , role_mxhp*0.95 )
	SystemNotice (role,"The Almighty is angry with your actions! Prepare to be punished!")
end


function State_5MBS_Rem(role , sklv)

end

------------------------------------精灵特效通用函数
function JLTX_usu(role)
	local item_elf = GetChaItem(role , 2, 1)
	local item_elf_type = GetItemType (item_elf )	
	if item_elf_type ~= 59 then				--检查有没有精灵
		SkillUnable(role)
		SystemNotice ( role , "You need to equip a pet Fairy" )  
		return 0
	end
	local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)		--获取精灵当前hp
	local item_elf_endure = item_elf_hp - 100			--精灵特效技能消耗精灵体力值
	if item_elf_hp<50 then
		SkillUnable(role) 
		SystemNotice ( role , "Fairy's HP must be more than 0 to use this skill" ) 
		return 
	end
	local item_count = CheckBagItem ( role , 855 )		--检查有没有精灵硬币
	if item_count <= 0 then    
		SkillUnable(role)
		SystemNotice ( role , "You do not have the required Fairy Coin to use the skill" ) 
		return 0
	end 
	
	local a = DelBagItem ( role , 855 , 1 ) 
	SetItemAttr(item_elf,ITEMATTR_URE,item_elf_endure)	--扣除精灵相应体力
	return 1
end

------------------------------------精灵精灵特效技能1
function SkillCooldown_Jltx1( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Jltx1_Begin ( role , sklv ) 
	local ret= JLTX_usu(role)
end 

function Skill_Jltx1_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_JLTX1 , statelv , statetime ) 
end 

function State_jltx1_Add(role , sklv)

end

function State_jltx1_Rem(role , sklv)

end

------------------------------------精灵精灵特效技能2
function SkillCooldown_Jltx2( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Jltx2_Begin ( role , sklv ) 
	local ret= JLTX_usu(role)
end 

function Skill_Jltx2_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_JLTX2 , statelv , statetime ) 
end 

function State_jltx2_Add(role , sklv)

end

function State_jltx2_Rem(role , sklv)

end
------------------------------------精灵精灵特效技能3
function SkillCooldown_Jltx3( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Jltx3_Begin ( role , sklv ) 
	local ret= JLTX_usu(role)
end 

function Skill_Jltx3_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60   
	AddState ( ATKER , DEFER , STATE_JLTX3 , statelv , statetime ) 
end 

function State_jltx3_Add(role , sklv)

end

function State_jltx3_Rem(role , sklv)

end
------------------------------------精灵精灵特效技能4
function SkillCooldown_Jltx4( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Jltx4_Begin ( role , sklv ) 
	local ret= JLTX_usu(role)
end 

function Skill_Jltx4_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_JLTX4 , statelv , statetime ) 
end 

function State_jltx4_Add(role , sklv)

end

function State_jltx4_Rem(role , sklv)

end

------------------------------------精灵精灵特效技能5
function SkillCooldown_Jltx5( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Jltx5_Begin ( role , sklv ) 
	local ret= JLTX_usu(role)
end 

function Skill_Jltx5_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_JLTX5 , statelv , statetime ) 
end 

function State_jltx5_Add(role , sklv)

end

function State_jltx5_Rem(role , sklv)

end
------------------------------------精灵精灵特效技能6
function SkillCooldown_Jltx6( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Jltx6_Begin ( role , sklv ) 
	local ret= JLTX_usu(role)
end 

function Skill_Jltx6_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_JLTX6 , statelv , statetime ) 
end

function State_jltx6_Add(role , sklv)

end

function State_jltx6_Rem(role , sklv)

end
------------------------------------精灵精灵特效技能7
function SkillCooldown_Jltx7( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Jltx7_Begin ( role , sklv ) 
	local ret= JLTX_usu(role)
end 

function Skill_Jltx7_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_JLTX7 , statelv , statetime ) 
end 

function State_jltx7_Add(role , sklv)

end

function State_jltx7_Rem(role , sklv)

end
------------------------------------精灵精灵特效技能8
function SkillCooldown_Jltx8( sklv )
	local Cooldown = 10000
	return Cooldown
end

function Skill_Jltx8_Begin ( role , sklv ) 
	local ret= JLTX_usu(role)
end 

function Skill_Jltx8_End ( ATKER , DEFER , sklv ) 
	local statelv = sklv 
	local statetime =  60    
	AddState ( ATKER , DEFER , STATE_JLTX8 , statelv , statetime ) 
end

function State_jltx8_Add(role , sklv)

end

function State_jltx8_Rem(role , sklv)

end

------------------------------------纯真之心
function State_CZZX_Add ( role , statelv )
	local str = GetChaAttr( role , ATTR_STR )
	local con = GetChaAttr( role , ATTR_CON ) 
	local sta = GetChaAttr( role , ATTR_STA )
	local agi = GetChaAttr( role , ATTR_AGI)
	local dex = GetChaAttr( role , ATTR_DEX )
	str=math.floor(str*0.3)
	con=math.floor(con*0.3)
	sta=math.floor(sta*0.3)
	agi=math.floor(agi*0.3)
	dex=math.floor(dex*0.3)
	SetCharaAttr(str ,role , ATTR_STATEV_STR)
	SetCharaAttr(con ,role , ATTR_STATEV_CON)
	SetCharaAttr(sta ,role , ATTR_STATEV_STA)
	SetCharaAttr(agi ,role , ATTR_STATEV_AGI)
	SetCharaAttr(dex ,role , ATTR_STATEV_DEX)
	ALLExAttrSet(role)
end
function State_CZZX_Rem ( role , statelv )
	SetCharaAttr(0 ,role , ATTR_STATEV_STR)
	SetCharaAttr(0 ,role , ATTR_STATEV_CON)
	SetCharaAttr(0 ,role , ATTR_STATEV_STA)
	SetCharaAttr(0 ,role , ATTR_STATEV_AGI)
	SetCharaAttr(0 ,role , ATTR_STATEV_DEX)
	ALLExAttrSet(role)
end
--卡拉的胜利-------------------------------------
function State_KALA_Add ( role , statelv )
	local sta = GetChaAttr( role , ATTR_STA )
	SetCharaAttr(sta ,role , ATTR_STATEV_STA)
	ALLExAttrSet(role)
end
function State_KALA_Rem ( role , statelv )
	SetCharaAttr(0 ,role , ATTR_STATEV_STA)
	ALLExAttrSet(role)
end
--+最大HP及+物理抵抗类-------------------------------------
function State_XUEYU_Add ( role , statelv )
	local star=statelv*statelv*100
	local eleven=1
	if statelv==2 or statelv==3 then
		eleven=2
	elseif statelv==4 or statelv==5 then
		eleven=3
	elseif statelv==6  then
		eleven=4
	elseif statelv==7  then
		eleven=5
	elseif statelv==8 or statelv==9 then
		eleven=6
	elseif statelv==10 then
		eleven=8
	end
	SetCharaAttr(eleven ,role , ATTR_STATEV_PDEF)
	SetCharaAttr(star ,role , ATTR_STATEV_MXHP)
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	mxhp=mxhp+star
	--SystemNotice (role, "mxhp=="..mxhp)
	SetCharaAttr(mxhp, role, ATTR_HP) 
	ALLExAttrSet(role)
end
function State_XUEYU_Rem ( role , statelv )
	SetCharaAttr(0 ,role , ATTR_STATEV_PDEF)
	SetCharaAttr(0 ,role , ATTR_STATEV_MXHP)
	ALLExAttrSet(role)
end
------馒头类+攻击力
function State_MANTOU_Add ( role , statelv )
	local atksb_dif = 50+(statelv-1)*100	
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)
end
function State_MANTOU_Rem ( role , statelv )
	local atksb_dif = 50+(statelv-1)*100	
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)
end
--女儿红类+精神-------------------------------------
function State_NVER_Add ( role , statelv )
	local sta = statelv*5
	SetCharaAttr(sta ,role , ATTR_STATEV_STA)
	ALLExAttrSet(role)
end
function State_NVER_Rem ( role , statelv )
	SetCharaAttr(0 ,role , ATTR_STATEV_STA)
	ALLExAttrSet(role)
end
--鞋之乱舞-------------------------------------
function Skill_xzlw_End( ATKER , DEFER , sklv )
	local dmg =math.random(15,35)
	Hp_Endure_Dmg ( DEFER , dmg )  
end 

--烹饪
function Skill_Cooking_End( ATKER , DEFER , sklv )
end


--制造
function Skill_Making_End( ATKER , DEFER , sklv )
end


--铸造
function Skill_Founding_End( ATKER , DEFER , sklv )
end

--分解
function Skill_Dismissing_End( ATKER , DEFER , sklv )
end




--技能幻影斩幻象——————————————————————————————————————————————————————————————————————————

function SkillCooldown_HyzHX( sklv )
	local Cooldown = 1000
	return Cooldown
end



function Skill_HyzHX_End ( ATKER , DEFER , sklv ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Hyz_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Hyz_End : DEFER as null" ) 
		return 
	end 
	local aspd = Aspd ( ATKER )
	local  sklv = 10
	local dmg = ( ( 1.5 + 0.1 * sklv ) ) * (math.min(3,( math.max ( 1, math.floor( aspd / 70  ) )  ))) * Atk_Dmg ( ATKER , DEFER )   
	Hp_Endure_Dmg ( DEFER , dmg )  

	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身
end 

--技能贝壳冲击幻象——————————————————————————————————————————————————————————————————

function SkillArea_Line_BkcjHX ( sklv )										--技能"Conch Ray"的技能区域公式
	local sklv = 8
	local lenth = 500 + sklv * 30  
	local width = 100 + sklv * 10 
	SetSkillRange ( 1 , lenth , width  )  
end

function SkillCooldown_BkcjHX( sklv )
	local Cooldown = 2000
	return Cooldown
end



function Skill_BkcjHX_End ( ATKER , DEFER , sklv ) 
	local sklv = 8
	local sta_atk= Sta ( ATKER ) 
	local sta_def = Sta ( DEFER ) 
	local AddStateLv = 0
	AddStateLv = GetChaStateLv ( ATKER , STATE_MLCH ) 

	local dmg = math.floor( 200 + sklv*30 +sta_atk*6 ) 
	local dmg_fin = Cuihua_Mofa ( dmg , AddStateLv ) 
	local dmg_ElfSkill = ElfSkill_MagicAtk ( dmg , ATKER ) 
	dmg_fin = dmg_fin + dmg_ElfSkill
	Hp_Endure_Dmg ( DEFER , dmg_fin ) 
end 

--技能暴头————————————————————————————————————————————————————————————————————



function SkillCooldown_BtHX( sklv )
	local Cooldown = 5000
	return Cooldown
end



function Skill_BtHX_End ( ATKER , DEFER , sklv ) 
	local sklv = 10
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	local 	dmg = math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.005 * sklv) ) 
	if dmg > 2500 then
		dmg = 2500
	end
	local Check_Heilong  = CheckItem_Heilong ( ATKER )
	if Check_Heilong == 1 then
			local Percentage = Percentage_Random ( 0.1 )
			if Percentage == 1 then
				  dmg =  dmg*10 
				SystemNotice ( ATKER , "Obtain power from Black Dragon set. Damage bonus")
			end
	end
	hp = hp - dmg 
	SetCharaAttr ( hp , DEFER , ATTR_HP ) 
end 

--技能心灵冲撞——————————————————————————————————————————————————————————————————————————————————————————

function SkillCooldown_XlczHX( sklv ) 
	local Cooldown = 2000
	return Cooldown
end



function Skill_XlczHX_End ( ATKER , DEFER , sklv ) 
	if ValidCha(ATKER) == 0 then 
		LG ( "luascript_err" , "function Skill_Xlcz_End : ATKER as null" ) 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		LG ( "luascript_err" , "function Skill_Xlcz_End : DEFER as null" ) 
		return 
	end 
--	local atkdmg = Atk_Dmg ( ATKER , DEFER )
	local lv_atker = Lv ( TurnToCha ( ATKER ) ) 
	local lv_defer = Lv ( TurnToCha ( DEFER ) ) 
	local sta_atker = Sta(ATKER) 
	local sklv = 10
	local sta_defer = Sta(DEFER) 
	local lv_dif = math.max ( ( - 1 ) * 10 , math.min ( 10 , lv_atker - lv_defer ) ) 
	local AddStateLv = 0
	AddStateLv = GetChaStateLv ( ATKER , STATE_MLCH )

	hpdmg = math.floor (( 10 + sta_atker * 2 ) * ( 1 + sklv * 0.7 ) * ( 1 +  lv_dif * 0.025 ))
	local dmg_fin = Cuihua_Mofa ( hpdmg ,AddStateLv )
	local dmg_ElfSkill = ElfSkill_MagicAtk ( hpdmg , ATKER )
	dmg_fin = dmg_fin + dmg_ElfSkill
	Hp_Endure_Dmg ( DEFER, dmg_fin )  
--	LG( "xlcz", "Spiritual Bolt Skill Level=" , sklv ,"Attacker sta=", sta ,"Normal attack damage=", atkdmg , "Skill Damage= " , dmg , "\n" ) 
end 


----------------手雷1


function SkillCooldown_Shoulei1( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_Shoulei1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 1135 ) --手雷
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 1135 , 1 ) 
end 


function Skill_Shoulei1_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 1
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	dmg = 4*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-1200
	if dmg > 1000 then
		dmg = 1000
	end
	Hp_Endure_Dmg ( DEFER , dmg )

--	 r1 = RemoveChaItem ( ATKER , 1135 , 1 , 2 , -1, 2 , 1  )
--	 Notice("11")
--		if r1== 0 then
--		LG( "Delete item failed" )
--		return
--	end
end



---------------闪光弹1

 function SkillArea_Circle_ShanGD1( sklv )									--技能“虎啸"的技能区域公式	
	local side = 800 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_ShanGD1( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_ShanGD1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 1136 ) --闪光弹1
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 1136 , 1 ) 
end 


function Skill_ShanGD1_End ( ATKER , DEFER , sklv ) 
--	r2 = RemoveChaItem ( ATKER , 1136 , 1 , 2 , -1, 2 , 1  )
--		if r2== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 1
	local statelv = sklv 
	local statetime = sklv
	local hp_defer = Mxhp ( DEFER ) 
	if hp_defer >= 1000000 then 
		SystemNotice ( ATKER , "Flash Bomb loses effect" ) 
		return
	end 
		----boss使用技能处理
		if GetChaTypeID( ATKER ) == 979 then
			statetime = 8
		end

	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSXYSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSXYSJ[GetChaTypeID( DEFER )] = BOSSXYSJ[GetChaTypeID( DEFER )] -1
		end
	end
		----boss使用技能处理结束

	AddState( ATKER , DEFER , STATE_ShanGD, statelv , statetime ) 
--	dmg = 0.8 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
--	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

function State_ShanGD_Add ( role , statelv )

 end 

function State_ShanGD_Rem ( role , statelv )
 end 

 ------------------------辐射1

 function SkillArea_Circle_FuShe1( sklv )									--技能“虎啸"的技能区域公式	
	local  sklv = 1
	local side = 800 + sklv*100
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_FuShe1( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_FuShe1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 1137 ) --辐射1
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 1137 , 1 ) 
end 

function Skill_FuShe1_End( ATKER , DEFER , sklv ) 
--	 r3 = RemoveChaItem ( ATKER , 1137 , 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 1
	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 15+sklv*2
	AddState( ATKER , DEFER , STATE_ZD, statelv , statetime ) 
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	local 	dmg = 2*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-600
	if dmg > 500 then
		dmg = 500
	end

	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

function State_FuShe_Add ( role , statelv ) 
	local hpdmg = 20
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_FuShe_Rem ( role , statelv ) 
end 

---------------------幽灵探测器1

function SkillCooldown_YouL1( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_YouL1 ( sklv )--技能“圣眼之翼"的技能区域公式
	local  sklv = 1
	local side = 600 + sklv * 20 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_YouL1 ( sklv )	
	local  sklv = 1
-- r3 = RemoveChaItem ( ATKER , 1138, 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 40 + sklv *9   
	local statelv = sklv 
	SetRangeState ( STATE_SYZY , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 

function Skill_YouL1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		SkillUnable(role)   
		return 0
	end
	local item_count = CheckBagItem ( role , 1138 ) --幽灵探测器1
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 1138 , 1 ) 
end 

function Skill_YouL1_End ( ATKER , DEFER , sklv ) 
end 

function State_Syzy_Add ( role , statelv ) 

end 

function State_Syzy_Rem ( role , statelv ) 

end 

function State_Syzy_Tran ( statelv ) 
	return 1     
end 
----------------------------船只加速器1
function SkillCooldown_JiaSuQi( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_JiaSuQi1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 1139 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem (atk_role , 1139 , 1 ) 
end 

function Skill_JiaSuQi1_End ( ATKER , DEFER , sklv )
--	r5 = RemoveChaItem ( ATKER , 1139 , 1 , 2 , -1, 2 , 1  )
--		if r5== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 1
	local statelv = sklv
	local statetime = 30+sklv*20
	AddState( ATKER , DEFER , STATE_WLJS, statelv , statetime ) 
 end

function  State_wljs_Add ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_wljs_Rem  ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

----------------------------船只喷射器1
function SkillCooldown_PengSheQi1( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_PengSheQi1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 1140 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 1140 , 1 ) 
end 

function Skill_PengSheQi1_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 1
--	 r6 = RemoveChaItem ( ATKER , 1140 , 1 , 2 , -1, 2 , 1  )
--		if r6== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 3+sklv*2
	local statelv = sklv
	AddState( ATKER , DEFER , STATE_PSQ, statelv , statetime ) 
end

function  State_PengSheQi_Add ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_PengSheQi_Rem  ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

--技能破甲1——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoJiaDan( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoJiaDan1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 1141 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 1141 , 1 ) 
end 


function Skill_PoJiaDan1_End ( ATKER , DEFER , sklv ) 
		local  sklv = 1
--	r7= RemoveChaItem ( ATKER , 1141 , 1 , 2 , -1, 2 , 1  )
--	if r7== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end	
	local statelv = sklv 
	local statetime = 10 + sklv  
	dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
	Hp_Endure_Dmg ( DEFER , dmg) 
	AddState ( ATKER , DEFER , STATE_PJ , statelv , statetime ) 
	--LG("skill_Pj", "function Skill_Def_Pj : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

	--LG( "sk_pj", "Break Armor Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Pj_Add ( role , statelv ) 
	--LG("state", "function State_Pj_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = 30
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 



function State_Pj_Rem ( role , statelv ) 
--	LG("state", "function State_Pj_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = 30
	local def = DefSb(role) + def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 

--破刃弹——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoRenDan1( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoRenDan1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 1142 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 1142 , 1 )  
end 


function Skill_PoRenDan1_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 1
--	 r8 = RemoveChaItem ( ATKER , 1142 , 1 , 2 , -1, 2 , 1  )
--		if r8== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statelv = sklv 
	local statetime = 10 + sklv  
	dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
	Hp_Endure_Dmg ( DEFER , dmg) 
	AddState ( ATKER , DEFER , STATE_PRD , statelv , statetime ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

end 



function State_PoRenDan_Add( role , sklv ) 
	local statelv = sklv  
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 



function State_PoRenDan_Rem( role , sklv ) 
	local statelv = sklv 
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 


-------船只燃烧弹1
function SkillCooldown_RanShaoDan1( sklv ) 
	local Cooldown = 1500 
	return Cooldown
end

function Skill_RanShaoDan1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 1143 ) --船只燃烧弹1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 1143 , 1 ) 
end 

function Skill_RanShaoDan1_End( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 1
--	 r9 = RemoveChaItem ( ATKER , 1143 , 1 , 2 , -1, 2 , 1  )
--		if r9== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 4 + sklv*2
	AddState( ATKER , DEFER , STATE_CZRSD, statelv , statetime ) 
	dmg =  math.random ( 100 , 200 )*(1+sklv*0.5)
	Hp_Endure_Dmg ( DEFER , dmg) 
end 

function State_RanShaoDan_Add ( role , statelv ) 
	local hpdmg = 150  
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_RanShaoDan_Rem ( role , statelv ) 
end


----------------手雷2


function SkillCooldown_Shoulei2( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_Shoulei2_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2719 ) --手雷
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2719 , 1 ) 
end 


function Skill_Shoulei2_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 2
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	dmg = 4*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-1200
	if dmg > 2000 then
		dmg = 2000
	end
	Hp_Endure_Dmg ( DEFER , dmg )
--	 r1 = RemoveChaItem ( ATKER , 1135 , 1 , 2 , -1, 2 , 1  )
--	 Notice("11")
--		if r1== 0 then
--		LG( "Delete item failed" )
--		return
--	end
end



---------------闪光弹2

 function SkillArea_Circle_ShanGD2( sklv )									--技能“虎啸"的技能区域公式	
	local side = 800 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_ShanGD2( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_ShanGD2_Begin ( role , sklv )
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2720 ) --闪光弹2
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2720 , 1 ) 
end 


function Skill_ShanGD2_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	r2 = RemoveChaItem ( ATKER , 1136 , 1 , 2 , -1, 2 , 1  )
--		if r2== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local  sklv = 2
	local statelv = sklv 
	local statetime = sklv
	local hp_defer = Mxhp ( DEFER ) 
	if hp_defer >= 1000000 then 
		SystemNotice ( ATKER , "Flash Bomb loses effect" ) 
		return
	end

		----boss使用技能处理
		if GetChaTypeID( ATKER ) == 979 then
			statetime = 8
		end

	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSXYSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSXYSJ[GetChaTypeID( DEFER )] = BOSSXYSJ[GetChaTypeID( DEFER )] -1
		end
	end
		----boss使用技能处理结束

	AddState( ATKER , DEFER , STATE_ShanGD, statelv , statetime ) 
--	dmg = 0.8 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
--	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

function State_ShanGD_Add ( role , statelv )

 end 

function State_ShanGD_Rem ( role , statelv )
 end 

 ------------------------辐射2

 function SkillArea_Circle_FuShe2( sklv )									--技能“虎啸"的技能区域公式	
	local  sklv = 2
	local side = 800 + sklv*100
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_FuShe2( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_FuShe2_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2721 ) --辐射2
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2721 , 1 ) 
end 

function Skill_FuShe2_End( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	 r3 = RemoveChaItem ( ATKER , 1137 , 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local  sklv = 2
	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 15+sklv*2
	AddState( ATKER , DEFER , STATE_ZD, statelv , statetime ) 
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	local 	dmg = 2*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-600
	if dmg > 1000 then
		dmg = 1000
	end
	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

--function State_FuShe_Add ( role , statelv ) 
--	local hpdmg = 20
--	Hp_Endure_Dmg ( role , hpdmg ) 
--	ALLExAttrSet(role)  
--end 
--
--function State_FuShe_Rem ( role , statelv ) 
--end 

---------------------幽灵探测器2
function SkillCooldown_YouL2( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_YouL2 ( sklv )--技能“圣眼之翼"的技能区域公式
	local  sklv = 2
	local side = 600 + sklv * 20 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_YouL2 ( sklv )	
	local  sklv = 2
-- r3 = RemoveChaItem ( ATKER , 1138, 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 40 + sklv *9   
	local statelv = sklv 
	SetRangeState ( STATE_SYZY , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 

function Skill_YouL2_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		SkillUnable(role)   
		return 0
	end
	local item_count = CheckBagItem ( role , 2722 ) --幽灵探测器2
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2722 , 1 ) 
end 

function Skill_YouL2_End ( ATKER , DEFER , sklv ) 
end 

function State_Syzy_Add ( role , statelv ) 

end 

function State_Syzy_Rem ( role , statelv ) 

end 

function State_Syzy_Tran ( statelv ) 
	return 1     
end 
----------------------------船只加速器2
function SkillCooldown_JiaSuQi2( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_JiaSuQi2_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2723 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2723 , 1 ) 
end 

function Skill_JiaSuQi2_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	r5 = RemoveChaItem ( ATKER , 1139 , 1 , 2 , -1, 2 , 1  )
--		if r5== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local  sklv = 2
	local statelv = sklv
	local statetime = 30+sklv*20
	AddState( ATKER , DEFER , STATE_WLJS, statelv , statetime ) 
 end

function  State_wljs_Add ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_wljs_Rem  ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

----------------------------船只喷射器2
function SkillCooldown_PengSheQi2( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_PengSheQi2_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2724 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2724 , 1 ) 
end 

function Skill_PengSheQi2_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 2
--	 r6 = RemoveChaItem ( ATKER , 1140 , 1 , 2 , -1, 2 , 1  )
--		if r6== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 3+sklv*2
	local statelv = sklv
	AddState( ATKER , DEFER , STATE_PSQ, statelv , statetime ) 
end

function  State_PengSheQi_Add ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_PengSheQi_Rem  ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

--技能破甲2——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoJiaDan2( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoJiaDan2_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2725 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2725 , 1 )  
end 


function Skill_PoJiaDan2_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
		local  sklv = 2
--	r7= RemoveChaItem ( ATKER , 1141 , 1 , 2 , -1, 2 , 1  )
--	if r7== 0 then
--		LG( "Delete item failed" )
--		return
--	end
		local statelv = sklv 
		local statetime = 10 + sklv  
		dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
		Hp_Endure_Dmg ( DEFER , dmg) 
		AddState ( ATKER , DEFER , STATE_PJ , statelv , statetime ) 
		--LG("skill_Pj", "function Skill_Def_Pj : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
		Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

		--LG( "sk_pj", "Break Armor Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Pj_Add ( role , statelv ) 
	--LG("state", "function State_Pj_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = 30
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 



function State_Pj_Rem ( role , statelv ) 
--	LG("state", "function State_Pj_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = 30
	local def = DefSb(role) + def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 

--破刃弹2——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoRenDan2( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoRenDan2_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2726 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2726 , 1 ) 
end 


function Skill_PoRenDan2_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
		local  sklv = 2
--	 r8 = RemoveChaItem ( ATKER , 1142 , 1 , 2 , -1, 2 , 1  )
--		if r8== 0 then
--		LG( "Delete item failed" )
--		return
--	end
		local statelv = sklv 
		local statetime = 10 + sklv  
		dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
		Hp_Endure_Dmg ( DEFER , dmg) 
		AddState ( ATKER , DEFER , STATE_PRD , statelv , statetime ) 
		Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

end 



function State_PoRenDan_Add( role , sklv ) 
	local statelv = sklv  
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 



function State_PoRenDan_Rem( role , sklv ) 
	local statelv = sklv 
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 


-------船只燃烧弹2
function SkillCooldown_RanShaoDan1( sklv ) 
	local Cooldown = 1500 
	return Cooldown
end

function Skill_RanShaoDan2_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2727 ) --船只喷射器1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2727 , 1 ) 
end 

function Skill_RanShaoDan2_End( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 2
--	 r9 = RemoveChaItem ( ATKER , 1143 , 1 , 2 , -1, 2 , 1  )
--		if r9== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 4 + sklv*2
	AddState( ATKER , DEFER , STATE_CZRSD, statelv , statetime ) 
	dmg =  math.random ( 100 , 200 )*(1+sklv*0.5)
	Hp_Endure_Dmg ( DEFER , dmg) 
end 

function State_RanShaoDan_Add ( role , statelv ) 
	local hpdmg = 150  
		Hp_Endure_Dmg ( role , hpdmg ) 
		ALLExAttrSet(role)  
end 

function State_RanShaoDan_Rem ( role , statelv ) 
end


----------------手雷3


function SkillCooldown_Shoulei3( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_Shoulei3_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2743 ) --手雷3
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2743 , 1 ) 
end 


function Skill_Shoulei3_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 3
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	dmg = 4*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-1200
	if dmg > 3000 then
		dmg = 3000
	end
	Hp_Endure_Dmg ( DEFER , dmg )
--	 r1 = RemoveChaItem ( ATKER , 1135 , 1 , 2 , -1, 2 , 1  )
--	 Notice("11")
--		if r1== 0 then
--		LG( "Delete item failed" )
--		return
--	end
end



---------------闪光弹3

 function SkillArea_Circle_ShanGD3( sklv )									--技能“虎啸"的技能区域公式	
	local side = 800 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_ShanGD3( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_ShanGD3_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2744 ) --闪光弹3
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2744 , 1 ) 
end 


function Skill_ShanGD3_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	r2 = RemoveChaItem ( ATKER , 1136 , 1 , 2 , -1, 2 , 1  )
--		if r2== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local  sklv = 3
	local statelv = sklv 
	local statetime = sklv
	local hp_defer = Mxhp ( DEFER ) 
	if hp_defer >= 1000000 then 
		SystemNotice ( ATKER , "Flash Bomb loses effect" ) 
		return
	end 

		----boss使用技能处理
		if GetChaTypeID( ATKER ) == 979 then
			statetime = 8
		end

	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSXYSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSXYSJ[GetChaTypeID( DEFER )] = BOSSXYSJ[GetChaTypeID( DEFER )] -1
		end
	end
		----boss使用技能处理结束

	AddState( ATKER , DEFER , STATE_ShanGD, statelv , statetime ) 
--	dmg = 0.8 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
--	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

function State_ShanGD_Add ( role , statelv )

 end 

function State_ShanGD_Rem ( role , statelv )
 end 

 ------------------------辐射3

 function SkillArea_Circle_FuShe3( sklv )									--技能“虎啸"的技能区域公式	
	local  sklv = 3
	local side = 800 + sklv*100
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_FuShe3( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_FuShe3_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2745 ) --辐射3
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2745 , 1 ) 
end 

function Skill_FuShe3_End( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	 r3 = RemoveChaItem ( ATKER , 1137 , 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local  sklv = 3
	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 15+sklv*2
	AddState( ATKER , DEFER , STATE_ZD, statelv , statetime ) 
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	local 	dmg = 2*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-600
	if dmg > 1500 then
		dmg = 1500
	end
	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

--function State_FuShe_Add ( role , statelv ) 
--	local hpdmg = 20
--	Hp_Endure_Dmg ( role , hpdmg ) 
--	ALLExAttrSet(role)  
--end 
--
--function State_FuShe_Rem ( role , statelv ) 
--end 

---------------------幽灵探测器3

function SkillCooldown_YouL3( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_YouL3 ( sklv )--技能“圣眼之翼"的技能区域公式
	local  sklv = 3
	local side = 600 + sklv * 20 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_YouL3 ( sklv )	
	local  sklv = 3
-- r3 = RemoveChaItem ( ATKER , 1138, 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 40 + sklv *9   
	local statelv = sklv 
	SetRangeState ( STATE_SYZY , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 

function Skill_YouL3_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		SkillUnable(role)   
		return 0
	end
	local item_count = CheckBagItem ( role , 2746 ) --幽灵探测器2
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2746 , 1 ) 
end 

function Skill_YouL3_End ( ATKER , DEFER , sklv ) 
end 

function State_Syzy_Add ( role , statelv ) 

end 

function State_Syzy_Rem ( role , statelv ) 

end 

function State_Syzy_Tran ( statelv ) 
	return 1     
end 
----------------------------船只加速器3
function SkillCooldown_JiaSuQi3( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_JiaSuQi3_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2747 ) --船只加速器3
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2747 , 1 ) 
end 

function Skill_JiaSuQi3_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	r5 = RemoveChaItem ( ATKER , 1139 , 1 , 2 , -1, 2 , 1  )
--		if r5== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local  sklv = 3
	local statelv = sklv
	local statetime = 30+sklv*20
	AddState( ATKER , DEFER , STATE_WLJS, statelv , statetime ) 
 end

function  State_wljs_Add ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_wljs_Rem  ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

----------------------------船只喷射器3
function SkillCooldown_PengSheQi3( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_PengSheQi3_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2748 ) --船只喷射器3
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2748 , 1 ) 
end 

function Skill_PengSheQi3_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 3
--	 r6 = RemoveChaItem ( ATKER , 1140 , 1 , 2 , -1, 2 , 1  )
--		if r6== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 3+sklv*2
	local statelv = sklv
	AddState( ATKER , DEFER , STATE_PSQ, statelv , statetime ) 
end

function  State_PengSheQi_Add ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_PengSheQi_Rem  ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

--技能破甲3——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoJiaDan3( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoJiaDan3_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2749 ) --能破甲3
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2749 , 1 )  
end 


function Skill_PoJiaDan3_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
		local  sklv = 3
--	r7= RemoveChaItem ( ATKER , 1141 , 1 , 2 , -1, 2 , 1  )
--	if r7== 0 then
--		LG( "Delete item failed" )
--		return
--	end
		local statelv = sklv 
		local statetime = 10 + sklv  
		dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
		Hp_Endure_Dmg ( DEFER , dmg) 
		AddState ( ATKER , DEFER , STATE_PJ , statelv , statetime ) 
		--LG("skill_Pj", "function Skill_Def_Pj : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
		Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

		--LG( "sk_pj", "Break Armor Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Pj_Add ( role , statelv ) 
	--LG("state", "function State_Pj_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = 30
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 



function State_Pj_Rem ( role , statelv ) 
--	LG("state", "function State_Pj_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = 30
	local def = DefSb(role) + def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 

--破刃弹3——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoRenDan3( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoRenDan3_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2750 ) --破刃弹3
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2750 , 1 ) 
end 


function Skill_PoRenDan3_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
		local  sklv = 3
--	 r8 = RemoveChaItem ( ATKER , 1142 , 1 , 2 , -1, 2 , 1  )
--		if r8== 0 then
--		LG( "Delete item failed" )
--		return
--	end
		local statelv = sklv 
		local statetime = 10 + sklv  
		dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
		Hp_Endure_Dmg ( DEFER , dmg) 
		AddState ( ATKER , DEFER , STATE_PRD , statelv , statetime ) 
		Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

end 



function State_PoRenDan_Add( role , sklv ) 
	local statelv = sklv  
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 



function State_PoRenDan_Rem( role , sklv ) 
	local statelv = sklv 
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 


-------船只燃烧弹3
function SkillCooldown_RanShaoDan3( sklv ) 
	local Cooldown = 1500 
	return Cooldown
end

function Skill_RanShaoDan3_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2751 ) --船只燃烧弹3
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2751 , 1 ) 
end 

function Skill_RanShaoDan3_End( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 3
--	 r9 = RemoveChaItem ( ATKER , 1143 , 1 , 2 , -1, 2 , 1  )
--		if r9== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 4 + sklv*2
	AddState( ATKER , DEFER , STATE_CZRSD, statelv , statetime ) 
	dmg =  math.random ( 100 , 200 )*(1+sklv*0.5)
	Hp_Endure_Dmg ( DEFER , dmg) 
end 

function State_RanShaoDan_Add ( role , statelv ) 
	local hpdmg = 150  
		Hp_Endure_Dmg ( role , hpdmg ) 
		ALLExAttrSet(role)  
end 

function State_RanShaoDan_Rem ( role , statelv ) 
end

----------------手雷4


function SkillCooldown_Shoulei4( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_Shoulei4_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2767 ) --手雷4
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2767 , 1 ) 
end 


function Skill_Shoulei4_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 4
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	dmg = 4*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-1200
	if dmg > 4000 then
		dmg = 4000
	end
	Hp_Endure_Dmg ( DEFER , dmg )
--	 r1 = RemoveChaItem ( ATKER , 1135 , 1 , 2 , -1, 2 , 1  )
--	 Notice("11")
--		if r1== 0 then
--		LG( "Delete item failed" )
--		return
--	end
end



---------------闪光弹4

 function SkillArea_Circle_ShanGD4( sklv )									--技能“虎啸"的技能区域公式	
	local side = 800 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_ShanGD4( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_ShanGD4_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2768 ) --闪光弹4
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2768 , 1 ) 
end 


function Skill_ShanGD4_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	r2 = RemoveChaItem ( ATKER , 1136 , 1 , 2 , -1, 2 , 1  )
--		if r2== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local  sklv = 4
	local statelv = sklv 
	local statetime = sklv
	local hp_defer = Mxhp ( DEFER ) 
	if hp_defer >= 1000000 then 
		SystemNotice ( ATKER , "Flash Bomb loses effect" ) 
		return
	end 

		----boss使用技能处理
		if GetChaTypeID( ATKER ) == 979 then
			statetime = 8
		end

	if GetChaAIType( DEFER ) >= 21 then    --21以上为BossAI，如果是Boss根据boss不同，设定可以被加状态的次数
		if BOSSXYSJ[GetChaTypeID( DEFER )] == 0 then
			SystemNotice ("As a Boss, how can I be defeated by ths same skill. Beware warriors!")
			return
		else
			BOSSXYSJ[GetChaTypeID( DEFER )] = BOSSXYSJ[GetChaTypeID( DEFER )] -1
		end
	end
		----boss使用技能处理结束

	AddState( ATKER , DEFER , STATE_ShanGD, statelv , statetime ) 
--	dmg = 0.8 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
--	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

function State_ShanGD_Add ( role , statelv )

 end 

function State_ShanGD_Rem ( role , statelv )
 end 

 ------------------------辐射4

 function SkillArea_Circle_FuShe4( sklv )									--技能“虎啸"的技能区域公式	
	local  sklv = 4
	local side = 800 + sklv*100
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_FuShe4( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_FuShe4_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2769 ) --辐射4
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2769 , 1 ) 
end 

function Skill_FuShe4_End( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	 r3 = RemoveChaItem ( ATKER , 1137 , 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local  sklv = 4
	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 15+sklv*2
	AddState( ATKER , DEFER , STATE_ZD, statelv , statetime ) 
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	local 	dmg = 2*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-600
	if dmg > 2000 then
		dmg = 2000
	end
	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

--function State_FuShe_Add ( role , statelv ) 
--	local hpdmg = 20
--	Hp_Endure_Dmg ( role , hpdmg ) 
--	ALLExAttrSet(role)  
--end 
--
--function State_FuShe_Rem ( role , statelv ) 
--end 

---------------------幽灵探测器4

function SkillCooldown_YouL4( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_YouL4 ( sklv )--技能“圣眼之翼"的技能区域公式
	local  sklv = 4
	local side = 600 + sklv * 20 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_YouL4 ( sklv )	
	local  sklv = 4
-- r3 = RemoveChaItem ( ATKER , 1138, 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 40 + sklv *9   
	local statelv = sklv 
	SetRangeState ( STATE_SYZY , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 

function Skill_YouL4_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		SkillUnable(role)   
		return 0
	end
	local item_count = CheckBagItem ( role , 2770 ) --幽灵探测器4
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2770 , 1 ) 
end 

function Skill_YouL4_End ( ATKER , DEFER , sklv ) 
end 

function State_Syzy_Add ( role , statelv ) 

end 

function State_Syzy_Rem ( role , statelv ) 

end 

function State_Syzy_Tran ( statelv ) 
	return 1     
end 
----------------------------船只加速器4
function SkillCooldown_JiaSuQi4( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_JiaSuQi4_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2771 ) --船只加速器4
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2771 , 1 ) 
end 

function Skill_JiaSuQi4_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	r5 = RemoveChaItem ( ATKER , 1139 , 1 , 2 , -1, 2 , 1  )
--		if r5== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local  sklv = 4
	local statelv = sklv
	local statetime = 30+sklv*20
	AddState( ATKER , DEFER , STATE_WLJS, statelv , statetime ) 
 end

function  State_wljs_Add ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_wljs_Rem  ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

----------------------------船只喷射器4
function SkillCooldown_PengSheQi4( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_PengSheQi4_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2772 ) --船只喷射器4
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2772 , 1 ) 
end 

function Skill_PengSheQi4_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 4
--	 r6 = RemoveChaItem ( ATKER , 1140 , 1 , 2 , -1, 2 , 1  )
--		if r6== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 3+sklv*2
	local statelv = sklv
	AddState( ATKER , DEFER , STATE_PSQ, statelv , statetime ) 
end

function  State_PengSheQi_Add ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_PengSheQi_Rem  ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

--技能破甲4——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoJiaDan4( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoJiaDan4_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2773 ) --能破甲4
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2773 , 1 )  
end 


function Skill_PoJiaDan4_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
		local  sklv = 4
--	r7= RemoveChaItem ( ATKER , 1141 , 1 , 2 , -1, 2 , 1  )
--	if r7== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statelv = sklv 
	local statetime = 10 + sklv  
	dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
	Hp_Endure_Dmg ( DEFER , dmg) 
	AddState ( ATKER , DEFER , STATE_PJ , statelv , statetime ) 
	--LG("skill_Pj", "function Skill_Def_Pj : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

	--LG( "sk_pj", "Break Armor Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Pj_Add ( role , statelv ) 
	--LG("state", "function State_Pj_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = 30
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 



function State_Pj_Rem ( role , statelv ) 
--	LG("state", "function State_Pj_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = 30
	local def = DefSb(role) + def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 

--破刃弹4——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoRenDan4( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoRenDan4_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2774 ) --破刃弹4
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2774 , 1 ) 
end 


function Skill_PoRenDan4_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
		local  sklv = 4
--	 r8 = RemoveChaItem ( ATKER , 1142 , 1 , 2 , -1, 2 , 1  )
--		if r8== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statelv = sklv 
	local statetime = 10 + sklv  
	dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
	Hp_Endure_Dmg ( DEFER , dmg) 
	AddState ( ATKER , DEFER , STATE_PRD , statelv , statetime ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

end 



function State_PoRenDan_Add( role , sklv ) 
	local statelv = sklv  
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 



function State_PoRenDan_Rem( role , sklv ) 
	local statelv = sklv 
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 


-------船只燃烧弹4
function SkillCooldown_RanShaoDan4( sklv ) 
	local Cooldown = 1500 
	return Cooldown
end

function Skill_RanShaoDan4_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2775 ) --船只燃烧弹4
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2775 , 1 ) 
end 

function Skill_RanShaoDan4_End( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 4
--	 r9 = RemoveChaItem ( ATKER , 1143 , 1 , 2 , -1, 2 , 1  )
--		if r9== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 4 + sklv*2
	AddState( ATKER , DEFER , STATE_CZRSD, statelv , statetime ) 
	dmg =  math.random ( 100 , 200 )*(1+sklv*0.5)
	Hp_Endure_Dmg ( DEFER , dmg) 
end 

function State_RanShaoDan_Add ( role , statelv ) 
	local hpdmg = 150  
		Hp_Endure_Dmg ( role , hpdmg ) 
		ALLExAttrSet(role)  
end 

function State_RanShaoDan_Rem ( role , statelv ) 
end


----------------手雷5


function SkillCooldown_Shoulei5( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_Shoulei5_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2791 ) --手雷5
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2791 , 1 ) 
end 


function Skill_Shoulei5_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 5
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	dmg = 4*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-1200
	if dmg > 5000 then
		dmg = 5000
	end
	Hp_Endure_Dmg ( DEFER , dmg )
--	 r1 = RemoveChaItem ( ATKER , 1135 , 1 , 2 , -1, 2 , 1  )
--	 Notice("11")
--		if r1== 0 then
--		LG( "Delete item failed" )
--		return
--	end
end



---------------闪光弹5

 function SkillArea_Circle_ShanGD5( sklv )									--技能“虎啸"的技能区域公式	
	local side = 800 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_ShanGD5( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_ShanGD5_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2792 ) --闪光弹5
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2792 , 1 ) 
end 


function Skill_ShanGD5_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	r2 = RemoveChaItem ( ATKER , 1136 , 1 , 2 , -1, 2 , 1  )
--		if r2== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local  sklv = 5
	local statelv = sklv 
	local statetime = sklv
	local hp_defer = Mxhp ( DEFER ) 
	if hp_defer >= 1000000 then 
		SystemNotice ( ATKER , "Flash Bomb loses effect" ) 
		return
	end 
	AddState( ATKER , DEFER , STATE_ShanGD, statelv , statetime ) 
--	dmg = 0.8 * math.random ( Mnatk( ATKER ) , Mxatk ( ATKER ) ) 
--	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

function State_ShanGD_Add ( role , statelv )

 end 

function State_ShanGD_Rem ( role , statelv )
 end 

 ------------------------辐射5

 function SkillArea_Circle_FuShe5( sklv )									--技能“虎啸"的技能区域公式	
	local  sklv = 5
	local side = 800 + sklv*100
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_FuShe5( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_FuShe5_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2793 ) --辐射5
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2793 , 1 ) 
end 

function Skill_FuShe5_End( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	 r3 = RemoveChaItem ( ATKER , 1137 , 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local  sklv = 5
	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 15+sklv*2
	AddState( ATKER , DEFER , STATE_ZD, statelv , statetime ) 
	local 	hp = GetChaAttr ( DEFER , ATTR_HP ) 
	local 	dmg = 2*math.floor ( 320 + 30 * sklv +hp * ( 0.05 +0.008 * sklv) )-600
	if dmg > 2500 then
		dmg = 2500
	end
	Hp_Endure_Dmg ( DEFER , dmg) 
end 
 

---------------------幽灵探测器5

function SkillCooldown_YouL5( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_YouL5 ( sklv )--技能“圣眼之翼"的技能区域公式
	local  sklv = 5
	local side = 600 + sklv * 20 
	SetSkillRange ( 3 , side ) 	
end 

function SkillArea_State_YouL5 ( sklv )	
	local  sklv = 5
-- r3 = RemoveChaItem ( ATKER , 1138, 1 , 2 , -1, 2 , 1  )
--		if r3== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 40 + sklv *9   
	local statelv = sklv 
	SetRangeState ( STATE_SYZY , statelv  , statetime ) 									--添加地面“圣眼之翼”状态
end 

function Skill_YouL5_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		SkillUnable(role)   
		return 0
	end
	local item_count = CheckBagItem ( role , 2794 ) --幽灵探测器5
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2794 , 1 ) 
end 

function Skill_YouL5_End ( ATKER , DEFER , sklv ) 
end 

function State_Syzy_Add ( role , statelv ) 

end 

function State_Syzy_Rem ( role , statelv ) 

end 

function State_Syzy_Tran ( statelv ) 
	return 1     
end 
----------------------------船只加速器5
function SkillCooldown_JiaSuQi5( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_JiaSuQi5_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2795 ) --船只加速器5
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2795 , 1 ) 
end 

function Skill_JiaSuQi5_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
--	r5 = RemoveChaItem ( ATKER , 1139 , 1 , 2 , -1, 2 , 1  )
--		if r5== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local  sklv = 5
	local statelv = sklv
	local statetime = 30+sklv*20
	AddState( ATKER , DEFER , STATE_WLJS, statelv , statetime ) 
 end

function  State_wljs_Add ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_wljs_Rem  ( role , statelv )
	local mspdsa_dif = 1
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

----------------------------船只喷射器5
function SkillCooldown_PengSheQi5( sklv )
	local Cooldown = 1500 
	return Cooldown
end

function Skill_PengSheQi5_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2796 ) --船只喷射器5
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2796 , 1 ) 
end 

function Skill_PengSheQi5_End ( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 5
--	 r6 = RemoveChaItem ( ATKER , 1140 , 1 , 2 , -1, 2 , 1  )
--		if r6== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statetime = 3+sklv*2
	local statelv = sklv
	AddState( ATKER , DEFER , STATE_PSQ, statelv , statetime ) 
end

function  State_PengSheQi_Add ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

function State_PengSheQi_Rem  ( role , statelv )
	local mspdsa_dif = 3
	local mspdsa = (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD )  
	 
	ALLExAttrSet(role)  
end 

--技能破甲5——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoJiaDan5( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoJiaDan5_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2797 ) --能破甲5
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2797 , 1 )  
end 


function Skill_PoJiaDan5_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 5
--	r7= RemoveChaItem ( ATKER , 1141 , 1 , 2 , -1, 2 , 1  )
--	if r7== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statelv = sklv 
	local statetime = 10 + sklv  
	dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
	Hp_Endure_Dmg ( DEFER , dmg) 
	AddState ( ATKER , DEFER , STATE_PJ , statelv , statetime ) 
	--LG("skill_Pj", "function Skill_Def_Pj : " , "role = " , role , "sklv =  " , sklv , "\n" ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

	--LG( "sk_pj", "Break Armor Skill Level=" , sklv , "Skill Damage= " , dmg , '\n" ) 
end 

function State_Pj_Add ( role , statelv ) 
	--LG("state", "function State_Pj_Add : " , " role = ", role, "statelv = " , statelv , "\n" ) 
	local def_dif = 30
	local def = DefSb(role) - def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )	
	ALLExAttrSet(role)

end 



function State_Pj_Rem ( role , statelv ) 
--	LG("state", "function State_Pj_Rem : " ,"statelv = " , statelv , " role = ", role, "\n" ) 
	local def_dif = 30
	local def = DefSb(role) + def_dif
	SetCharaAttr( def , role , ATTR_STATEV_DEF )
	ALLExAttrSet(role)
end 

--破刃弹5——————————————————————————————————————————————————————————————————————————



function SkillCooldown_PoRenDan5( sklv )
	local Cooldown = 1500
	return Cooldown
end

function Skill_PoRenDan5_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2798 ) --破刃弹5
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2798 , 1 ) 
end 


function Skill_PoRenDan5_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 5
--	 r8 = RemoveChaItem ( ATKER , 1142 , 1 , 2 , -1, 2 , 1  )
--		if r8== 0 then
--		LG( "Delete item failed" )
--		return
--	end
	local statelv = sklv 
	local statetime = 10 + sklv  
	dmg = math.random ( 400 , 500 )*( 1 + sklv * 0.5 )
	Hp_Endure_Dmg ( DEFER , dmg) 
	AddState ( ATKER , DEFER , STATE_PRD , statelv , statetime ) 
	Check_Ys_Rem ( ATKER , DEFER )						--判断是否隐身 

end 



function State_PoRenDan_Add( role , sklv ) 
	local statelv = sklv  
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) - atksb_dif  
	local mxatksb = MxatkSb(role ) - atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 



function State_PoRenDan_Rem( role , sklv ) 
	local statelv = sklv 
	local atksb_dif = 50*sklv
	local mnatksb = MnatkSb(role) + atksb_dif  
	local mxatksb = MxatkSb(role ) + atksb_dif 
	SetCharaAttr( mnatksb , role , ATTR_STATEV_MNATK ) 
	SetCharaAttr( mxatksb , role , ATTR_STATEV_MXATK ) 
	ALLExAttrSet(role)  
end 


-------船只燃烧弹5
function SkillCooldown_RanShaoDan5( sklv ) 
	local Cooldown = 1500 
	return Cooldown
end

function Skill_RanShaoDan5_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( atk_role , 2799 ) --船只燃烧弹5
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2799 , 1 ) 
end 

function Skill_RanShaoDan5_End( ATKER , DEFER , sklv )
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local  sklv = 5
--	 r9 = RemoveChaItem ( ATKER , 1143 , 1 , 2 , -1, 2 , 1  )
--		if r9== 0 then
--		LG( "Delete item failed" )
--		return
--	end
--	local hp = Hp( DEFER ) 
	local statelv = sklv 
	local statetime = 4 + sklv*2
	AddState( ATKER , DEFER , STATE_CZRSD, statelv , statetime ) 
	dmg =  math.random ( 100 , 200 )*(1+sklv*0.5)
	Hp_Endure_Dmg ( DEFER , dmg) 
end 

function State_RanShaoDan_Add ( role , statelv ) 
	local hpdmg = 150  
		Hp_Endure_Dmg ( role , hpdmg ) 
		ALLExAttrSet(role)  
end 

function State_RanShaoDan_Rem ( role , statelv ) 
end
----------------------------------------------小雪球 
function SkillCooldown_Xiaoxueqiu ( sklv )
	local Cooldown = 3000
	return Cooldown
end
function Skill_Xiaoxueqiu_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( role , "Inventory has been binded")
		return 0
	end
	local item_count = CheckBagItem ( role , 2896 ) 
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2896 , 1 ) 

end 
function Skill_Xiaoxueqiu_End ( ATKER , DEFER , sklv ) 
	local NocLock =	KitbagLock( ATKER, 0 )
	if NocLock == LUA_FALSE then
		SystemNotice( ATKER , "Inventory has been binded")
		return 0
	end
	local statetime = 1 
	local statelv = 10 
	local rad_star = math.random ( 1, 20 )
	if rad_star==1 then
		AddState ( ATKER , DEFER , STATE_XY , statelv , statetime )
	end
end

--腐蚀之球LV1——————————————————————————————————————————————————————————————————————————
function SkillCooldown_FuShiZhiQiu1( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_FuShiZhiQiu1_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(atk_role)
			return 0
		end
	local item_count = CheckBagItem ( atk_role , 1146 ) --腐蚀之球LV1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 1146 , 1 ) 
end 

function Skill_FuShiZhiQiu1_End ( ATKER , DEFER , sklv ) 
		local sklv = 1 
		local statelv=sklv
		local statetime = 5 + 4 *  sklv
		AddState ( ATKER , DEFER , STATE_FSZQ , statelv , statetime )  
end 


function State_FuShiZhiQiu_Add ( role , statelv ) 
	
	local bd=GetChaAttr(role, ATTR_BPDEF)
	local defsa_dif = (-1) * ( 0.03 * statelv ) 
	local defsa = math.floor (  (DefSa(role) + defsa_dif ) * ATTR_RADIX ) 
	local bd_dif = (-1) * ( 0.02 * statelv )
	local bd_fin = math.floor (  (ResistSa(role) + bd_dif ) * ATTR_RADIX ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	SetCharaAttr( bd_fin , role , ATTR_STATEC_PDEF ) 
	ALLExAttrSet(role)  
end 

function State_FuShiZhiQiu_Rem ( role , statelv )  
	
	local bd=GetChaAttr(role, ATTR_BPDEF)
	local defsa_dif = (-1) * ( 0.03 * statelv ) 
	local defsa = math.floor (  (DefSa(role) - defsa_dif ) * ATTR_RADIX ) 
	local bd_dif = (-1) * ( 0.02 * statelv )
	local bd_fin = math.floor (  (ResistSa(role) - bd_dif ) * ATTR_RADIX ) 
	SetCharaAttr( defsa , role , ATTR_STATEC_DEF ) 
	SetCharaAttr( bd_fin , role , ATTR_STATEC_PDEF ) 
	ALLExAttrSet(role)  
end 
--腐蚀之球LV2——————————————————————————————————————————————————————————————————————————
function SkillCooldown_FuShiZhiQiu2( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_FuShiZhiQiu2_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(atk_role)
			return 0
		end
	local item_count = CheckBagItem ( atk_role , 2730 ) --腐蚀之球LV2
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2730 , 1 ) 
end 

function Skill_FuShiZhiQiu2_End ( ATKER , DEFER , sklv ) 
		local sklv = 2 
		local statelv=sklv
		local statetime = 5 + 4 *  sklv
		AddState ( ATKER , DEFER , STATE_FSZQ , statelv , statetime )  
end 





--腐蚀之球LV3——————————————————————————————————————————————————————————————————————————
function SkillCooldown_FuShiZhiQiu3( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_FuShiZhiQiu3_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(atk_role)
			return 0
		end
	local item_count = CheckBagItem ( atk_role , 2754 ) --腐蚀之球LV3
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2754 , 1 ) 
end 

function Skill_FuShiZhiQiu3_End ( ATKER , DEFER , sklv ) 
		local sklv = 3
		local statelv=sklv
		local statetime = 5 + 4 *  sklv
		AddState ( ATKER , DEFER , STATE_FSZQ , statelv , statetime )  
end 


--腐蚀之球LV4——————————————————————————————————————————————————————————————————————————
function SkillCooldown_FuShiZhiQiu4( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_FuShiZhiQiu4_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(atk_role)
			return 0
		end
	local item_count = CheckBagItem ( atk_role , 2778 ) --腐蚀之球LV4
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2778 , 1 ) 
end 

function Skill_FuShiZhiQiu4_End ( ATKER , DEFER , sklv ) 
		local sklv =  4
		local statelv=sklv
		local statetime = 5 + 4 *  sklv
		AddState ( ATKER , DEFER , STATE_FSZQ , statelv , statetime )  
end 




--腐蚀之球LV5——————————————————————————————————————————————————————————————————————————
function SkillCooldown_FuShiZhiQiu5( sklv )
	local Cooldown = 5000
	return Cooldown
end

function Skill_FuShiZhiQiu5_Begin ( role , sklv ) 
	local atk_role = TurnToCha ( role ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(atk_role)
			return 0
		end
	local item_count = CheckBagItem ( atk_role , 2802 ) --腐蚀之球LV5
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2802 , 1 ) 
end 

function Skill_FuShiZhiQiu5_End ( ATKER , DEFER , sklv ) 
		local sklv =  5
		local statelv=sklv
		local statetime = 5 + 4 *  statelv
		AddState ( ATKER , DEFER , STATE_FSZQ , statelv , statetime )  
end 



--噪音制造器LV1——————————————————————————————————————————————————————————————————————————

function SkillCooldown_ZaoYinZhiZao1( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_ZaoYinZhiZao1( sklv )
        local sklv = 1
	local side = 550 + sklv * 40
        SetSkillRange ( 4 , side  )  
end 

function SkillArea_State_ZaoYinZhiZao1 ( sklv )
        local sklv = 1
	local statetime = 15 + sklv * 2 
	local statelv = sklv 
	SetRangeState ( STATE_ZYZZ , statelv  , statetime )									
end 

function Skill_ZaoYinZhiZao1_Begin ( role , sklv ) 

local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 1147 ) --噪音制造器Lv1
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 1147 , 1 ) 
end 


function Skill_ZaoYinZhiZao1_End ( ATKER , DEFER , sklv )
end
 
function State_ZaoYinZhiZao_Add ( role , statelv )

        
	local sp_sum = -15*statelv
        local sp = GetChaAttr(role, ATTR_SP) 
	sp=sp+sp_sum
	if sp < 0 
	then    
	   sp = 0                       
        end 
	SetCharaAttr ( sp , role , ATTR_SP ) 
	ALLExAttrSet(role)
        
--       local sta_dif = (-1) * ( 0.05 + 0.1 * statelv )
--       local sta = math.floor(  (StaSa(role) + sta_dif) * ATTR_RADIX ) ----------------减15%的最大精神
--       SetCharaAttr( sta , role , ATTR_STATEC_STA )	
--       ALLExAttrSet(role)

end 

function State_ZaoYinZhiZao_Rem ( role , statelv )

       
--       local sta_dif = (-1) * ( 0.05 + 0.1 * statelv )
--       local sta = math.floor(  (StaSa(role) - sta_dif) * ATTR_RADIX ) 
--       SetCharaAttr( sta , role , ATTR_STATEC_STA )	
--       ALLExAttrSet(role)

end  

function State_ZaoYinZhiZao_Tran ( statelv ) 
         return 1
end
--噪音制造器LV2——————————————————————————————————————————————————————————————————————————

function SkillCooldown_ZaoYinZhiZao2( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_ZaoYinZhiZao2( sklv )
        local sklv = 2
	local side = 550 + sklv * 40
        SetSkillRange ( 4 , side  )  
end 

function SkillArea_State_ZaoYinZhiZao2 ( sklv )
        local sklv = 2
	local statetime = 15 + sklv * 2 
	local statelv = sklv 
	SetRangeState ( STATE_ZYZZ , statelv  , statetime )									
end 

function Skill_ZaoYinZhiZao2_Begin ( role , sklv ) 

local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 2731 ) --噪音制造器Lv2
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2731 , 1 ) 
end 


function Skill_ZaoYinZhiZao2_End ( ATKER , DEFER , sklv )
end
 


--噪音制造器LV3——————————————————————————————————————————————————————————————————————————

function SkillCooldown_ZaoYinZhiZao3( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_ZaoYinZhiZao3( sklv )
        local sklv = 1
	local side = 550 + sklv * 40
        SetSkillRange ( 4 , side  )  
end 

function SkillArea_State_ZaoYinZhiZao3 ( sklv )
        local sklv = 3
	local statetime = 15 + sklv * 2 
	local statelv = sklv 
	SetRangeState ( STATE_ZYZZ , statelv  , statetime )									
end 

function Skill_ZaoYinZhiZao3_Begin ( role , sklv ) 

local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 2755 ) --噪音制造器Lv3
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2755 , 1 ) 
end 


function Skill_ZaoYinZhiZao3_End ( ATKER , DEFER , sklv )
end
 


--噪音制造器LV4——————————————————————————————————————————————————————————————————————————

function SkillCooldown_ZaoYinZhiZao4( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_ZaoYinZhiZao4( sklv )
        local sklv = 1
	local side = 550 + sklv * 40
        SetSkillRange ( 4 , side  )  
end 

function SkillArea_State_ZaoYinZhiZao4 ( sklv )
        local sklv = 4
	local statetime = 15 + sklv * 2 
	local statelv = sklv 
	SetRangeState ( STATE_ZYZZ , statelv  , statetime )									
end 

function Skill_ZaoYinZhiZao4_Begin ( role , sklv ) 

local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 2779 ) --噪音制造器Lv4
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2779 , 1 ) 
end 


function Skill_ZaoYinZhiZao4_End ( ATKER , DEFER , sklv )
end
 


--噪音制造器LV5——————————————————————————————————————————————————————————————————————————

function SkillCooldown_ZaoYinZhiZao5( sklv )
	local Cooldown = 1500
	return Cooldown
end

function SkillArea_Square_ZaoYinZhiZao5( sklv )
        local sklv = 5
	local side = 550 + sklv * 40
        SetSkillRange ( 4 , side  )  
end 

function SkillArea_State_ZaoYinZhiZao5 ( sklv )
        local sklv = 5
	local statetime = 15 + sklv * 2 
	local statelv = sklv 
	SetRangeState ( STATE_ZYZZ , statelv  , statetime )									
end 

function Skill_ZaoYinZhiZao5_Begin ( role , sklv ) 

local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 2803 ) --噪音制造器Lv5
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2803 , 1 ) 
end 


function Skill_ZaoYinZhiZao5_End ( ATKER , DEFER , sklv )
end
 




--地震发生器LV1——————————————————————————————————————————————————————————————————————————

function SkillCooldown_DiZhenFaSheng1( sklv )
	local Cooldown = 3000
	return Cooldown
end

function SkillArea_Circle_DiZhenFaSheng1 ( sklv )
        local sklv = 1
	local side = 550 + sklv * 40 
	SetSkillRange ( 4 , side ) 	
end 

function SkillArea_State_DiZhenFaSheng1 ( sklv )
        local sklv = 1
	local statetime = 10 + sklv * 2     
	local statelv = sklv  
	SetRangeState ( STATE_DZFS , statelv  , statetime ) 									
end 

function Skill_DiZhenFaSheng1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		    then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 1148 ) --地震发生器Lv1
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 1148 , 1 ) 
end 
	
 

function Skill_DiZhenFaSheng1_End ( ATKER , DEFER , sklv ) 
end 

function State_DiZhenFaSheng_Add ( role , statelv ) 
      
	
	local mspdsa_dif = (-1) * ( 0.2 * statelv + 0.1 ) 
	local mspdsa = math.floor (  (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX ) 
        SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

function State_DiZhenFaSheng_Rem ( role , statelv ) 

        
        local mspdsa_dif = (-1) * ( 0.2 * statelv + 0.1 )  
	local mspdsa = math.floor (  (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX ) 
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

function State_DiZhenFaSheng_Tran ( statelv ) 
         return 1
end 
--地震发生器LV2——————————————————————————————————————————————————————————————————————————

function SkillCooldown_DiZhenFaSheng2( sklv )
	local Cooldown = 3000
	return Cooldown
end

function SkillArea_Circle_DiZhenFaSheng2 ( sklv )
        local sklv = 2
	local side = 550 + sklv * 40 
	SetSkillRange ( 4 , side ) 	
end 

function SkillArea_State_DiZhenFaSheng2 ( sklv )
        local sklv = 2
	local statetime = 10 + sklv * 2     
	local statelv = sklv  
	SetRangeState ( STATE_DZFS , statelv  , statetime ) 									
end 

function Skill_DiZhenFaSheng2_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		    then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 2732 ) --地震发生器Lv2
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2732 , 1 ) 
end 
	
 

function Skill_DiZhenFaSheng2_End ( ATKER , DEFER , sklv ) 
end 



--地震发生器LV3——————————————————————————————————————————————————————————————————————————

function SkillCooldown_DiZhenFaSheng3( sklv )
	local Cooldown = 3000
	return Cooldown
end

function SkillArea_Circle_DiZhenFaSheng3 ( sklv )
        local sklv = 3
	local side = 550 + sklv * 40 
	SetSkillRange ( 4 , side ) 	
end 

function SkillArea_State_DiZhenFaSheng3 ( sklv )
        local sklv = 3
	local statetime = 10 + sklv * 2     
	local statelv = sklv  
	SetRangeState ( STATE_DZFS , statelv  , statetime ) 									
end 

function Skill_DiZhenFaSheng3_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		    then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 2756 ) --地震发生器Lv3
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2756 , 1 ) 
end 
	
 

function Skill_DiZhenFaSheng3_End ( ATKER , DEFER , sklv ) 
end 



--地震发生器LV4——————————————————————————————————————————————————————————————————————————

function SkillCooldown_DiZhenFaSheng4( sklv )
	local Cooldown = 3000
	return Cooldown
end

function SkillArea_Circle_DiZhenFaSheng4 ( sklv )
        local sklv = 4
	local side = 550 + sklv * 40 
	SetSkillRange ( 4 , side ) 	
end 

function SkillArea_State_DiZhenFaSheng4 ( sklv )
        local sklv = 4
	local statetime = 10 + sklv * 2     
	local statelv = sklv  
	SetRangeState ( STATE_DZFS , statelv  , statetime ) 									
end 

function Skill_DiZhenFaSheng4_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		    then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 2780 ) --地震发生器Lv4
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2780 , 1 ) 
end 
	
 

function Skill_DiZhenFaSheng4_End ( ATKER , DEFER , sklv ) 
end 



--地震发生器LV5——————————————————————————————————————————————————————————————————————————

function SkillCooldown_DiZhenFaSheng5( sklv )
	local Cooldown = 3000
	return Cooldown
end

function SkillArea_Circle_DiZhenFaSheng5 ( sklv )
        local sklv = 5
	local side = 550 + sklv * 40 
	SetSkillRange ( 4 , side ) 	
end 

function SkillArea_State_DiZhenFaSheng5 ( sklv )
        local sklv = 5
	local statetime = 10 + sklv * 2     
	local statelv = sklv  
	SetRangeState ( STATE_DZFS , statelv  , statetime ) 									
end 

function Skill_DiZhenFaSheng5_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		    then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local item_count = CheckBagItem ( role , 2804 ) --地震发生器Lv5
	if item_count <= 0 then  
		SkillUnable(role)   
		SystemNotice ( role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( role , 2804 , 1 ) 
end 
	
 

function Skill_DiZhenFaSheng5_End ( ATKER , DEFER , sklv ) 
end 




--链弹LV1——————————————————————————————————————————————————————————————————————————
function SkillCooldown_LianDan1( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_LianDan1_Begin ( role , sklv ) 

local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2677 ) --链弹1
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2677 , 1 )  
end 

function Skill_LianDan1_End ( ATKER , DEFER , sklv ) 

		local  sklv = 1
	        local statelv = sklv
	        local statetime = 30+sklv*20  
		AddState ( ATKER , DEFER , STATE_LD , statelv , statetime ) 
end 

function State_LianDan_Add( role , statelv ) 
        
    
	local mspdsa_dif =  0.3 + 0.09 * statelv 
	--local mspdsa_dif = 1 
	local mspdsa = math.floor (  (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX ) 
	
	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end 

function State_LianDan_Rem( role , statelv ) 
       
	local mspdsa_dif =  0.3 + 0.09 * statelv 
	--local mspdsa_dif = 1
	local mspdsa = math.floor (  (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX ) 
        SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
	ALLExAttrSet(role)  
end

--链弹LV2——————————————————————————————————————————————————————————————————————————
function SkillCooldown_LianDan2( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_LianDan2_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2741 ) --链弹2
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2741 , 1 )  
end 

function Skill_LianDan2_End ( ATKER , DEFER , sklv ) 
		local  sklv = 2
	        local statelv = sklv
	        local statetime = 30+sklv*20   
		AddState ( ATKER , DEFER , STATE_LD , statelv , statetime ) 
end 


--链弹LV3——————————————————————————————————————————————————————————————————————————
function SkillCooldown_LianDan3( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_LianDan3_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2765 ) --链弹3
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2765 , 1 )  
end 

function Skill_LianDan3_End ( ATKER , DEFER , sklv ) 
		local  sklv = 3
	        local statelv = sklv
	        local statetime = 30+sklv*20  
		AddState ( ATKER , DEFER , STATE_LD , statelv , statetime ) 
end 



--链弹LV4——————————————————————————————————————————————————————————————————————————
function SkillCooldown_LianDan4( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_LianDan4_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2789 ) --链弹4
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2789 , 1 )  
end 

function Skill_LianDan4_End ( ATKER , DEFER , sklv ) 
		local  sklv = 4
	        local statelv = sklv
	        local statetime = 30+sklv*20  
		AddState ( ATKER , DEFER , STATE_LD , statelv , statetime ) 
end 



--链弹LV5——————————————————————————————————————————————————————————————————————————
function SkillCooldown_LianDan5( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_LianDan5_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2813 ) --链弹5
	if item_count <= 0 then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2813 , 1 )  
end 

function Skill_LianDan5_End ( ATKER , DEFER , sklv ) 
		local  sklv = 5
	        local statelv = sklv
	        local statetime = 30+sklv*20   
		AddState ( ATKER , DEFER , STATE_LD , statelv , statetime ) 
end 



--幻影发生器LV1——————————————————————————————————————————————————————————————————————————

function SkillCooldown_HuanYinFaSheng1( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_HuanYinFaSheng1_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2673 ) --幻影发生器1
	if item_count <= 0 
	then  
		SkillUnable(atk_role) 
		SystemNotice ( atk_role , "Does not possess required item to use skill" )
		return 0
		
	end 
	local a = DelBagItem ( atk_role , 2673 , 1 )  
end 

function Skill_HuanYinFaSheng1_End ( ATKER , DEFER , sklv ) 
		local sklv = 1 
		local statelv = sklv
		local statetime =  2 + sklv*3    
		AddState ( ATKER , DEFER , STATE_HYFS , statelv , statetime )  
end 
function State_HuanYinFaSheng_Add( role , statelv ) 
	 
end 
function State_HuanYinFaSheng_Add( role , statelv ) 
end 
--幻影发生器LV2——————————————————————————————————————————————————————————————————————————

function SkillCooldown_HuanYinFaSheng2( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_HuanYinFaSheng2_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2737 ) --幻影发生器2
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" )
		return 0
	end 
	local a = DelBagItem ( atk_role , 2737 , 1 )  
end 

function Skill_HuanYinFaSheng2_End ( ATKER , DEFER , sklv ) 
		local sklv = 2 
		local statelv = sklv
		local statetime =  2 + sklv*3    
		AddState ( ATKER , DEFER , STATE_HYFS , statelv , statetime )  
end 

--幻影发生器LV3——————————————————————————————————————————————————————————————————————————

function SkillCooldown_HuanYinFaSheng3( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_HuanYinFaSheng3_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2761 ) --幻影发生器1
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return 0
	end 
	local a = DelBagItem ( atk_role , 2761 , 1 )  
end 

function Skill_HuanYinFaSheng3_End ( ATKER , DEFER , sklv ) 
		local sklv = 3 
		local statelv = sklv
		local statetime =  2 + sklv*3    
		AddState ( ATKER , DEFER , STATE_HYFS , statelv , statetime )  
end 

--幻影发生器LV4——————————————————————————————————————————————————————————————————————————

function SkillCooldown_HuanYinFaSheng4( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_HuanYinFaSheng4_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2785 ) --幻影发生器1
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return 0
	end 
	local a = DelBagItem ( atk_role , 2785 , 1 )  
end 

function Skill_HuanYinFaSheng4_End ( ATKER , DEFER , sklv ) 
		local sklv = 4 
		local statelv = sklv
		local statetime =  2 + sklv*3    
		AddState ( ATKER , DEFER , STATE_HYFS , statelv , statetime )  
end 

--幻影发生器LV5——————————————————————————————————————————————————————————————————————————

function SkillCooldown_HuanYinFaSheng5( sklv )
	local Cooldown = 3000
	return Cooldown
end

function Skill_HuanYinFaSheng5_Begin ( role , sklv ) 
local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2809 ) --幻影发生器1
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return 0
	end 
	local a = DelBagItem ( atk_role , 2809 , 1 )  
end 

function Skill_HuanYinFaSheng5_End ( ATKER , DEFER , sklv ) 
		local sklv = 5 
		local statelv = sklv
		local statetime =  2 + sklv*3    
		AddState ( ATKER , DEFER , STATE_HYFS , statelv , statetime )  
end 



--船只潜行LV1——————————————————————————————————————————————————————————————————————————
function SkillCooldown_ChuanZhiQianXing1( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function Skill_ChuanZhiQianXing1_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0

		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2675 ) --潜行1
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2675 , 1 )  
	 
end
function Skill_ChuanZhiQianXing1_End ( ATKER , DEFER , sklv )
        local sklv = 1
	local statelv = sklv 
	local statetime = 5 + sklv * 15  
	AddState ( ATKER , DEFER , STATE_CZQX , statelv , statetime )  
end

function State_ChuanZhiQianXing_Add ( role , statelv ) 
	
end
function State_ChuanZhiQianXing_Rem  ( role , statelv ) 
end
--船只潜行LV2——————————————————————————————————————————————————————————————————————————
function SkillCooldown_ChuanZhiQianXing2( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function Skill_ChuanZhiQianXing2_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2739 ) --潜行2
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2739 , 1 )  
	 
end
function Skill_ChuanZhiQianXing2_End ( ATKER , DEFER , sklv ) 
        local sklv = 2
	local statelv = sklv 
	local statetime = 5 + sklv * 15  
	AddState ( ATKER , DEFER , STATE_CZQX , statelv , statetime )  
end



--船只潜行LV3——————————————————————————————————————————————————————————————————————————
function SkillCooldown_ChuanZhiQianXing3( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function Skill_ChuanZhiQianXing3_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2763 ) --潜行3
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2763 , 1 )  
	 
end
function Skill_ChuanZhiQianXing3_End ( ATKER , DEFER , sklv ) 
        local sklv = 3
	local statelv = sklv 
	local statetime = 5 + sklv * 15  
	AddState ( ATKER , DEFER , STATE_CZQX , statelv , statetime )  
end



--船只潜行LV4——————————————————————————————————————————————————————————————————————————
function SkillCooldown_ChuanZhiQianXing4( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function Skill_ChuanZhiQianXing4_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2787 ) --潜行4
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2787 , 1 )  
	 
end
function Skill_ChuanZhiQianXing4_End ( ATKER , DEFER , sklv ) 
        local sklv = 4
	local statelv = sklv 
	local statetime = 5 + sklv * 15  
	AddState ( ATKER , DEFER , STATE_CZQX , statelv , statetime )  
end



--船只潜行LV5——————————————————————————————————————————————————————————————————————————
function SkillCooldown_ChuanZhiQianXing5( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function Skill_ChuanZhiQianXing5_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2811 ) --潜行5
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
	end 
	local a = DelBagItem ( atk_role , 2811 , 1 )  
	 
end
function Skill_ChuanZhiQianXing5_End ( ATKER , DEFER , sklv ) 
        local sklv = 5
	local statelv = sklv 
	local statetime = 5 + sklv * 15  
	AddState ( ATKER , DEFER , STATE_CZQX , statelv , statetime )  
end




--雷达LV1————————————————————————————————————————————————————————————－
function SkillCooldown_LeiDa1( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function SkillArea_Square_LeiDa1( sklv )
      
        local sklv = 1
	local side = 50 + sklv * 300
	SetSkillRange ( 3 , side ) 	
end 
function SkillArea_State_LeiDa1 ( sklv )
     
        local sklv = 1
	local statetime = 15 + sklv *55   
	local statelv = sklv 
	SetRangeState ( STATE_LEIDA , statelv  , statetime ) 						
end 
function Skill_LeiDa1_Begin ( role , sklv ) 
   
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SkillUnable(role)
			SystemNotice( role , "Inventory has been binded")
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2676 ) --雷达1
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		
	end 
	local a = DelBagItem ( atk_role , 2676 , 1 )  
	 
end
function Skill_LeiDa1_End ( ATKER , DEFER , sklv ) 
end 
function State_LeiDa_Add ( role , statelv ) 
end 
function State_LeiDa_Rem ( role , statelv ) 
end 
function State_LeiDa_Tran ( statelv ) 
	return 1     
end
--雷达LV2————————————————————————————————————————————————————————————－
function SkillCooldown_LeiDa2( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function SkillArea_Square_LeiDa2( sklv )
        local sklv = 2
	local side = 50 + sklv * 300 
	SetSkillRange ( 3 , side ) 	
end 
function SkillArea_State_LeiDa2 ( sklv )
        local sklv = 2
	local statetime = 15 + sklv *55   
	local statelv = sklv 
	SetRangeState ( STATE_LEIDA , statelv  , statetime ) 						
end 
function Skill_LeiDa2_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SkillUnable(role)
			SystemNotice( role , "Inventory has been binded")
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2740 ) --雷达2
	if item_count <= 0 
	then  
		SkillUnable(atk_role)  
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		
	end 
	local a = DelBagItem ( atk_role , 2740 , 1 )  
	 
end
function Skill_LeiDa2_End ( ATKER , DEFER , sklv ) 
end 

--雷达LV3————————————————————————————————————————————————————————————－
function SkillCooldown_LeiDa3( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function SkillArea_Square_LeiDa3( sklv )
        local sklv = 3
	local side = 50 + sklv * 300 
	SetSkillRange ( 3 , side ) 	
end 
function SkillArea_State_LeiDa3 ( sklv )
        local sklv = 3
	local statetime = 15 + sklv *55   
	local statelv = sklv 
	SetRangeState ( STATE_LEIDA , statelv  , statetime ) 						
end 
function Skill_LeiDa3_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SkillUnable(role)
			SystemNotice( role , "Inventory has been binded")
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2764 ) --雷达3
	if item_count <= 0 
	then  
		SkillUnable(atk_role)  
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		
	end 
	local a = DelBagItem ( atk_role , 2764 , 1 )  
	 
end
function Skill_LeiDa3_End ( ATKER , DEFER , sklv ) 
end 

--雷达LV4————————————————————————————————————————————————————————————－
function SkillCooldown_LeiDa4( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function SkillArea_Square_LeiDa4( sklv )
        local sklv = 4
	local side = 50 + sklv * 300 
	SetSkillRange ( 3 , side ) 	
end 
function SkillArea_State_LeiDa4 ( sklv )
        local sklv = 4
	local statetime = 15 + sklv *55   
	local statelv = sklv 
	SetRangeState ( STATE_LEIDA , statelv  , statetime ) 						
end 
function Skill_LeiDa4_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SkillUnable(role)
			SystemNotice( role , "Inventory has been binded")
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2788 ) --雷达4
	if item_count <= 0 
	then  
		SkillUnable(atk_role)  
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		
	end 
	local a = DelBagItem ( atk_role , 2788 , 1 )  
	 
end
function Skill_LeiDa4_End ( ATKER , DEFER , sklv ) 
end 

--雷达LV5————————————————————————————————————————————————————————————－
function SkillCooldown_LeiDa5( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 
function SkillArea_Square_LeiDa5( sklv )
        local sklv = 5
	local side = 50 + sklv * 300 
	SetSkillRange ( 3 , side ) 	
end 
function SkillArea_State_LeiDa5 ( sklv )
        local sklv = 5
	local statetime = 15 + sklv *55   
	local statelv = sklv 
	SetRangeState ( STATE_LEIDA , statelv  , statetime ) 						
end 
function Skill_LeiDa5_Begin ( role , sklv ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE 
		then
			SkillUnable(role)
			SystemNotice( role , "Inventory has been binded")
			return 0
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2812 ) --雷达5
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		
	end 
	local a = DelBagItem ( atk_role , 2812 , 1 )  
	 
end
function Skill_LeiDa5_End ( ATKER , DEFER , sklv ) 
end 


--船体修复LV1--------------------------------------------------------------------------
function SkillCooldown_ChuanTiXiuFu1( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ChuanTiXiuFu1_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 1150 ) --船体修复1
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 1150 , 1 )  
	 
end
function Skill_ChuanTiXiuFu1_End ( ATKER , DEFER , sklv ) 
        local sklv = 1
	local hpdmg = -math.random ( 450 , 650 )*( sklv * 1.5 )   
	Hp_Endure_Dmg ( DEFER , hpdmg ) 
	ALLExAttrSet(role)
end
function State_ChuanTiXiuFu_Add ( role , statelv )
end 
function State_ChuanTiXiuFu_Rem ( role , statelv ) 
end

--船体修复LV2--------------------------------------------------------------------------
function SkillCooldown_ChuanTiXiuFu2( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ChuanTiXiuFu2_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2734 ) --船体修复2
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2734 , 1 )  
	 
end
function Skill_ChuanTiXiuFu2_End ( ATKER , DEFER , sklv ) 
        local sklv = 2
	local hpdmg = -math.random ( 450 , 650 )*( sklv * 1.5 )   
	Hp_Endure_Dmg ( DEFER , hpdmg ) 
	ALLExAttrSet(role)
end

--船体修复LV3--------------------------------------------------------------------------
function SkillCooldown_ChuanTiXiuFu3( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ChuanTiXiuFu3_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2758 ) --船体修复3
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2758 , 1 )  
	 
end
function Skill_ChuanTiXiuFu3_End ( ATKER , DEFER , sklv ) 
        local sklv = 3
	local hpdmg = -math.random ( 450 , 650 )*( sklv * 1.5 )   
	Hp_Endure_Dmg ( DEFER , hpdmg ) 
	ALLExAttrSet(role)
end

--船体修复LV4--------------------------------------------------------------------------
function SkillCooldown_ChuanTiXiuFu4( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ChuanTiXiuFu4_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2782 ) --船体修复4
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2782 , 1 )  
	 
end
function Skill_ChuanTiXiuFu4_End ( ATKER , DEFER , sklv ) 
        local sklv = 4
	local hpdmg = -math.random ( 450 , 650 )*( sklv * 1.5 )  
	Hp_Endure_Dmg ( DEFER , hpdmg ) 
	ALLExAttrSet(role)
end


--船体修复LV5--------------------------------------------------------------------------
function SkillCooldown_ChuanTiXiuFu5( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ChuanTiXiuFu5_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2806 ) --船体修复5
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2806 , 1 )  
	 
end
function Skill_ChuanTiXiuFu5_End ( ATKER , DEFER , sklv ) 
        local sklv = 5
	local hpdmg = -math.random ( 450 , 650 )*( sklv * 1.5 )   
	Hp_Endure_Dmg ( DEFER , hpdmg ) 
	ALLExAttrSet(role)
end


--食物再生LV1--------------------------------------------------------------------------

function SkillCooldown_ShiWuZaiSheng1( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ShiWuZaiSheng1_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 1151 ) --食物再生1
	if item_count <= 0 
	then  
		SkillUnable(atk_role)  
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 1151 , 1 )  
	 
end

function Skill_ShiWuZaiSheng1_End ( ATKER , DEFER , sklv ) 
        local sklv = 1
	local sp_sum = 650 * sklv
        local sp = GetChaAttr(DEFER, ATTR_SP) 
	sp=sp+sp_sum
	mxsp = GetChaAttr(DEFER,ATTR_MXSP) 
	if sp > mxsp 
	then    
	   sp = mxsp                       --加超过最大sp时返回为最大sp
        end 
	SetCharaAttr ( sp , DEFER , ATTR_SP ) 
end
	
function State_ShiWuZaiSheng_Add ( role , statelv ) 
end 
function State_ShiWuZaiSheng_Rem ( role , statelv ) 
end
--食物再生LV2--------------------------------------------------------------------------

function SkillCooldown_ShiWuZaiSheng2( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ShiWuZaiSheng2_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2735 ) --食物再生2
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2735 , 1 )  
	 
end

function Skill_ShiWuZaiSheng2_End ( ATKER , DEFER , sklv ) 
        local sklv = 2
	local sp_sum = 650 * sklv
        local sp = GetChaAttr(DEFER, ATTR_SP) 
	sp=sp+sp_sum
	mxsp = GetChaAttr(DEFER,ATTR_MXSP) 
	if sp > mxsp 
	then    
	   sp = mxsp                       --加超过最大sp时返回为最大sp
        end 
	SetCharaAttr ( sp , DEFER , ATTR_SP ) 
end
	

--食物再生LV3--------------------------------------------------------------------------

function SkillCooldown_ShiWuZaiSheng3( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ShiWuZaiSheng3_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2759 ) --食物再生3
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2759 , 1 )  
	 
end

function Skill_ShiWuZaiSheng3_End ( ATKER , DEFER , sklv ) 
        local sklv = 3
	local sp_sum = 650 * sklv
        local sp = GetChaAttr(DEFER, ATTR_SP) 
	sp=sp+sp_sum
	mxsp = GetChaAttr(DEFER,ATTR_MXSP) 
	if sp > mxsp 
	then    
	   sp = mxsp                       --加超过最大sp时返回为最大sp
        end 
	SetCharaAttr ( sp , DEFER , ATTR_SP ) 
end
	

--食物再生LV4--------------------------------------------------------------------------

function SkillCooldown_ShiWuZaiSheng4( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ShiWuZaiSheng4_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2783 ) --食物再生4
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2783 , 1 )  
	 
end

function Skill_ShiWuZaiSheng4_End ( ATKER , DEFER , sklv ) 
        local sklv = 4
	local sp_sum = 650 * sklv
        local sp = GetChaAttr(DEFER, ATTR_SP) 
	sp=sp+sp_sum
	mxsp = GetChaAttr(DEFER,ATTR_MXSP) 
	if sp > mxsp 
	then    
	   sp = mxsp                       --加超过最大sp时返回为最大sp
        end 
	SetCharaAttr ( sp , DEFER , ATTR_SP ) 
end
	

--食物再生LV5--------------------------------------------------------------------------

function SkillCooldown_ShiWuZaiSheng5( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_ShiWuZaiSheng5_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2807 ) --食物再生5
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2807 , 1 )  
	 
end

function Skill_ShiWuZaiSheng5_End ( ATKER , DEFER , sklv ) 
        local sklv = 5
	local sp_sum = 650 * sklv
        local sp = GetChaAttr(DEFER, ATTR_SP) 
	sp=sp+sp_sum
	mxsp = GetChaAttr(DEFER,ATTR_MXSP) 
	if sp > mxsp 
	then    
	   sp = mxsp                       --加超过最大sp时返回为最大sp
        end 
	SetCharaAttr ( sp , DEFER , ATTR_SP ) 
end
	


--腐蚀弹LV1--------------------------------------------------------------------------

function SkillCooldown_FuShiDan1( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_FuShiDan1_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 1152 ) --腐蚀弹1
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 1152 , 1 )  
	 
end

function Skill_FuShiDan1_End ( ATKER , DEFER , sklv ) 
        local sklv = 1    
	local statelv = sklv
	local statetime = 2 + sklv*8
        AddState ( ATKER , DEFER , STATE_FSD , statelv , statetime )
end
	
function State_FuShiDan_Add ( role , statelv ) 
        
	local sp_sum = -80
        local sp = GetChaAttr(role, ATTR_SP) 
	sp=sp+sp_sum
	if sp < 0 
	then    
	   sp = 0                       
        end 
	SetCharaAttr ( sp , role , ATTR_SP ) 
	ALLExAttrSet(role)
end 

function State_FuShiDan_Rem ( role , statelv ) 
end
--腐蚀弹LV2--------------------------------------------------------------------------

function SkillCooldown_FuShiDan2( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_FuShiDan2_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2736 ) --腐蚀弹2
	if item_count <= 0 
	then  
		SkillUnable(atk_role)  
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2736 , 1 )  
	 
end

function Skill_FuShiDan2_End ( ATKER , DEFER , sklv ) 
        local sklv = 2    
	local statelv = sklv
	local statetime = 2 + sklv*8
        AddState ( ATKER , DEFER , STATE_FSD , statelv , statetime )
end
	

--腐蚀弹LV3--------------------------------------------------------------------------

function SkillCooldown_FuShiDan3( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_FuShiDan3_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2760 ) --腐蚀弹3
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2760 , 1 )  
	 
end

function Skill_FuShiDan3_End ( ATKER , DEFER , sklv ) 
        local sklv = 3    
	local statelv = sklv
	local statetime = 2 + sklv*8
        AddState ( ATKER , DEFER , STATE_FSD , statelv , statetime )
end
	

--腐蚀弹LV4--------------------------------------------------------------------------

function SkillCooldown_FuShiDan4( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_FuShiDan4_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2784 ) --腐蚀弹4
	if item_count <= 0 
	then  
		SkillUnable(atk_role)  
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2784 , 1 )  
	 
end

function Skill_FuShiDan4_End ( ATKER , DEFER , sklv ) 
        local sklv = 4    
	local statelv = sklv
	local statetime = 2 + sklv*8
        AddState ( ATKER , DEFER , STATE_FSD , statelv , statetime )
end
	

--腐蚀弹LV5--------------------------------------------------------------------------

function SkillCooldown_FuShiDan5( sklv ) 
	local Cooldown = 3000 
	return Cooldown 
end 

function Skill_FuShiDan5_Begin ( role , Item ) 
	local NocLock =	KitbagLock( role, 0 )
		if NocLock == LUA_FALSE then
			SystemNotice( role , "Inventory has been binded")
			SkillUnable(role)
			return
		end
	local atk_role = TurnToCha ( role ) 
	local item_count = CheckBagItem ( atk_role , 2808 ) --腐蚀弹5
	if item_count <= 0 
	then  
		SkillUnable(atk_role)   
		SystemNotice ( atk_role , "Does not possess required item to use skill" ) 
		return
	end 
	local a = DelBagItem ( atk_role , 2808 , 1 )  
	 
end

function Skill_FuShiDan5_End ( ATKER , DEFER , sklv ) 
        local sklv = 5    
	local statelv = sklv
	local statetime = 2 + sklv*8
        AddState ( ATKER , DEFER , STATE_FSD , statelv , statetime )
end
	



--船只水雷LV1--------------------------------------------------------------------------
function SkillArea_Circle_Czsl1 ( sklv )
        local sklv=1
	local side = 650 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Czsl1( sklv )
	local Cooldown = 6000
	return Cooldown
end

--function SkillArea_State_Czsl1 ( sklv )
--
--        local sklv = 1
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Slrs , statelv  , statetime ) 									
--end  
function Skill_Czsl1_Begin ( role , sklv ) 

end 

function Skill_Czsl1_End ( ATKER , DEFER , sklv ) 
 
        local sklv=1
	local statetime = sklv + 3
	local statelv = sklv
	if ValidCha(ATKER) == 0 then 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		return 
	end 
	local dmg = 20 
	Hp_Endure_Dmg ( DEFER , dmg ) 
	SetCharaAttr ( 4 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Slrs , statelv , statetime ) 
	AddState ( ATKER , DEFER , STATE_Slrs , statelv , statetime )
end 
function State_Slrs_Add ( role , statelv ) 
        
	local hpdmg =  statelv * 2 
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role) 
	
end 
function State_Slrs_Rem ( role , statelv ) 
end 
function State_Slrs_Tran ( statelv ) 
	return 1
end

--船只水雷LV2--------------------------------------------------------------------------
function SkillArea_Circle_Czsl2 ( sklv )
        local sklv=2
	local side = 650 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Czsl2( sklv )
	local Cooldown = 6000
	return Cooldown
end

--function SkillArea_State_Czsl2 ( sklv )
--
--        local sklv = 2
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Slrs , statelv  , statetime ) 									
--end  
function Skill_Czsl2_Begin ( role , sklv ) 

end 

function Skill_Czsl2_End ( ATKER , DEFER , sklv ) 
 
        local sklv=2
	local statetime = sklv + 3
	local statelv = sklv
	if ValidCha(ATKER) == 0 then 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		return 
	end 
	local dmg = 40
	Hp_Endure_Dmg ( DEFER , dmg ) 
	SetCharaAttr ( 8 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Slrs , statelv , statetime ) 
	AddState ( ATKER , DEFER , STATE_Slrs , statelv , statetime ) 
end 



--船只水雷LV3--------------------------------------------------------------------------
function SkillArea_Circle_Czsl3 ( sklv )
        local sklv=3
	local side = 650 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Czsl3( sklv )
	local Cooldown = 6000
	return Cooldown
end

--function SkillArea_State_Czsl3 ( sklv )
--
--        local sklv = 3
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Slrs , statelv  , statetime ) 									
--end  
function Skill_Czsl3_Begin ( role , sklv ) 

end 

function Skill_Czsl3_End ( ATKER , DEFER , sklv ) 
 
        local sklv=3
	local statetime = sklv + 3
	local statelv = sklv
	if ValidCha(ATKER) == 0 then 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		return 
	end 
	local dmg = 60 
	Hp_Endure_Dmg ( DEFER , dmg ) 
	SetCharaAttr ( 12 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Slrs , statelv , statetime ) 
	AddState ( ATKER , DEFER , STATE_Slrs , statelv , statetime ) 
end 




--船只水雷LV4--------------------------------------------------------------------------
function SkillArea_Circle_Czsl4 ( sklv )
        local sklv=4
	local side = 650 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Czsl4( sklv )
	local Cooldown = 6000
	return Cooldown
end

--function SkillArea_State_Czsl4 ( sklv )
--
--        local sklv = 4
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Slrs , statelv  , statetime ) 									
--end  
function Skill_Czsl4_Begin ( role , sklv ) 

end 

function Skill_Czsl4_End ( ATKER , DEFER , sklv ) 
 
        local sklv=4
	local statetime = sklv + 3
	local statelv = sklv
	if ValidCha(ATKER) == 0 then 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		return 
	end 
	local dmg = 80
	Hp_Endure_Dmg ( DEFER , dmg ) 
	SetCharaAttr ( 16 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Slrs , statelv , statetime ) 
	AddState ( ATKER , DEFER , STATE_Slrs , statelv , statetime )
end 



--船只水雷LV5--------------------------------------------------------------------------
function SkillArea_Circle_Czsl5 ( sklv )
        local sklv=5
	local side = 650 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )   
end 

function SkillCooldown_Czsl5( sklv )
	local Cooldown = 6000
	return Cooldown
end

--function SkillArea_State_Czsl5 ( sklv )
--
--        local sklv = 5
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Slrs , statelv  , statetime ) 									
--end  
function Skill_Czsl5_Begin ( role , sklv ) 

end 

function Skill_Czsl5_End ( ATKER , DEFER , sklv ) 
 
        local sklv=5
	local statetime = sklv + 3
	local statelv = sklv

	if ValidCha(ATKER) == 0 then 
		return 
	end 
	if ValidCha(DEFER) == 0 then 
		return 
	end 
	local dmg = 100
	Hp_Endure_Dmg ( DEFER , dmg ) 
	SetCharaAttr ( 20 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Slrs , statelv , statetime ) 
	AddState ( ATKER , DEFER , STATE_Slrs , statelv , statetime ) 
end 
----------------自爆绵羊LV1

function SkillSp_Myzb1 ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end 

function SkillArea_Circle_Myzb1 ( sklv )
        
	local sklv=1
	local side = 550 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )  
end

--function SkillArea_State_Myzb1 ( sklv )
--        local sklv = 1
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Myrs , statelv  , statetime ) 	
--	       
--end  

function SkillCooldown_Myzb1( sklv )
	local Cooldown = 6000
	return Cooldown
end

function Skill_Myzb1_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Myzb1 ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 
		

function Skill_Myzb1_End ( ATKER , DEFER , sklv )
        
	local sklv = 1
	local statetime = sklv + 3
	local statelv = sklv  
	local dmg = 20 
	Hp_Endure_Dmg ( DEFER , dmg )
        SetCharaAttr ( 2 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Myrs , statelv , statetime )
	AddState ( ATKER , DEFER , STATE_Myrs , statelv , statetime )
	 
end 

function State_Myrs_Add ( role , statelv ) 

	local hpdmg = statelv * 2  
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role) 

end 
function State_Myrs_Rem ( role , statelv ) 
end 
function State_Myrs_Tran ( statelv ) 
	return 1   
end 
----------------自爆绵羊LV2

function SkillSp_Myzb2 ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end 

function SkillArea_Circle_Myzb2 ( sklv )
        
	local sklv=2
	local side = 550 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )  
end

--function SkillArea_State_Myzb2 ( sklv )
--        local sklv = 2
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Myrs , statelv  , statetime ) 									
--end  

function SkillCooldown_Myzb2( sklv )
	local Cooldown = 6000
	return Cooldown
end

function Skill_Myzb2_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Myzb1 ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 
		

function Skill_Myzb2_End ( ATKER , DEFER , sklv )
        
	local sklv = 2
	local statetime = sklv + 3
	local statelv = sklv  
	local dmg = 40 
	Hp_Endure_Dmg ( DEFER , dmg )
        SetCharaAttr ( 8 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Myrs , statelv , statetime )
	AddState ( ATKER , DEFER , STATE_Myrs , statelv , statetime )
end 


------------------自爆绵羊LV3

function SkillSp_Myzb3 ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end 

function SkillArea_Circle_Myzb3 ( sklv )
        
	local sklv=3
	local side = 550 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )  
end

--function SkillArea_State_Myzb3 ( sklv )
--        local sklv = 3
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Myrs , statelv  , statetime ) 									
--end  

function SkillCooldown_Myzb3( sklv )
	local Cooldown = 6000
	return Cooldown
end

function Skill_Myzb3_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Myzb1 ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 
		

function Skill_Myzb3_End ( ATKER , DEFER , sklv )
        
	local sklv = 3
	local statetime = sklv + 3
	local statelv = sklv  
	local dmg = 60
	Hp_Endure_Dmg ( DEFER , dmg )
        SetCharaAttr ( 12 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Myrs , statelv , statetime )
	AddState ( ATKER , DEFER , STATE_Myrs , statelv , statetime )
end 
 
----------------自爆绵羊LV4

function SkillSp_Myzb4 ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end 

function SkillArea_Circle_Myzb4 ( sklv )
        
	local sklv=4
	local side = 550 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )  
end

--function SkillArea_State_Myzb4 ( sklv )
--        local sklv = 4
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Myrs , statelv  , statetime ) 									
--end  

function SkillCooldown_Myzb4( sklv )
	local Cooldown = 6000
	return Cooldown
end

function Skill_Myzb4_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Myzb1 ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 
		

function Skill_Myzb4_End ( ATKER , DEFER , sklv )
        
	local sklv = 4
	local statetime = sklv + 3
	local statelv = sklv  
	local dmg = 80
	Hp_Endure_Dmg ( DEFER , dmg )
        SetCharaAttr ( 16 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Myrs , statelv , statetime )
	AddState ( ATKER , DEFER , STATE_Myrs , statelv , statetime )
end 


----------------自爆绵羊LV5

function SkillSp_Myzb5 ( sklv )										
	local sp_reduce = 20 
	return sp_reduce 
end 

function SkillArea_Circle_Myzb5 ( sklv )
        
	local sklv=5
	local side = 400 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )  
end

--function SkillArea_State_Myzb5 ( sklv )
--        local sklv = 5
--	local statetime = sklv + 3
--	local statelv = sklv  
--	SetRangeState ( STATE_Myrs , statelv  , statetime ) 									
--end  

function SkillCooldown_Myzb5( sklv )
	local Cooldown = 6000
	return Cooldown
end

function Skill_Myzb5_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_Myzb1 ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 
		

function Skill_Myzb5_End ( ATKER , DEFER , sklv )
        
	local sklv = 5
	local statetime = sklv + 3
	local statelv = sklv  
	local dmg = 100
	Hp_Endure_Dmg ( DEFER , dmg )
        SetCharaAttr ( 20 , ATKER , ATTR_HP ) 
	AddState ( ATKER , ATKER , STATE_Myrs , statelv , statetime )
	AddState ( ATKER , DEFER , STATE_Myrs , statelv , statetime )
end 



----------减速塔——————————————————————————————————————————————————————————————————————————
--
--function Skill_JST_End ( ATKER , DEFER , sklv ) 
--
--		local  sklv = 1
--	        local statelv = sklv
--	        local statetime = 3 
--		AddState ( ATKER , DEFER , STATE_LST , statelv , statetime ) 
--end 
--
--function State_JST_Add( role , statelv ) 
--        
--        local statelv = 1
--	local mspdsa_dif =  0.5 * statelv
--	--local mspdsa_dif = 1 
--	local mspdsa = math.floor (  (MspdSa(role) - mspdsa_dif ) * ATTR_RADIX ) 
--	
--	SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
--	ALLExAttrSet(role)  
--end 
--
--function State_JST_Rem( role , statelv ) 
--        local statelv = 1
--	local mspdsa_dif =  0.5 * statelv
--	--local mspdsa_dif = 1
--	local mspdsa = math.floor (  (MspdSa(role) + mspdsa_dif ) * ATTR_RADIX ) 
--        SetCharaAttr( mspdsa , role , ATTR_STATEC_MSPD ) 
--	ALLExAttrSet(role)  
--end
--
-----------吸魔塔--------------------------------------------------------------------------
--
--function Skill_XMT_End ( ATKER , DEFER , sklv ) 
--         
--	--local statelv = 1
--	--local statetime = 1
--	local sklv = 1
--	local sp_sum = -50
--        local sp = GetChaAttr(DEFER, ATTR_SP) 
--	sp=sp+sp_sum
--	if sp < 0 
--	then    
--	   sp = 0                       
--        end 
--	SetCharaAttr ( sp , DEFER , ATTR_SP ) 
--	ALLExAttrSet(DEFER)
--        --AddState ( ATKER , DEFER , STATE_FSD , statelv , statetime )
--end
--
--
------飞蛇出击-------------------------------------------------------------------------------------
--
--function Skill_FeiShe_End ( ATKER , DEFER , sklv ) 
--	
--	
--	local dmg = 2000
--	Hp_Endure_Dmg ( DEFER , dmg )  
--
--end 

 ---精神鞭挞------------------------------------------------------------

function Skill_JSBT_End ( ATKER , DEFER , sklv )
	local Sta_role = Sta ( DEFER ) 
	hpdmg =300 +  math.max ( 50 , ( 150 - Sta_role ) )  * 10
		Hp_Endure_Dmg ( DEFER, hpdmg )
end 
 
----------------恶魔诅咒

function SkillSp_EmoYuYan ( sklv )										
	local sp_reduce = 155
	return sp_reduce
end 

function SkillArea_Circle_EmoYuYan ( sklv )
       
	--local sklv=1
	local side = 550 + math.floor ( sklv * 50 ) 
	SetSkillRange ( 4 , side )  
end


function SkillCooldown_EmoYuYan( sklv )
	local Cooldown = 30000
	return Cooldown
end

function Skill_EmoYuYan_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce = SkillSp_EmoYuYan ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 
		

function Skill_EmoYuYan_End ( ATKER , DEFER , sklv )
        
	
	
	--local sklv = 1
	local statetime = 25
	local statelv = sklv 
	local dmg = 150 
	Hp_Endure_Dmg ( DEFER , dmg )
	AddState ( ATKER , DEFER , STATE_EMYY , statelv , statetime )
	 
end 

function State_EmoYuYan_Add ( role , statelv ) 

	local hpdmg = 20 + statelv * 15 
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role) 

end 
function State_EmoYuYan_Rem ( role , statelv ) 
end

--------------------神圣审判--------------------------------

function SkillArea_Circle_SSSP( sklv )								
	local side = 1000 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_SSSP( sklv )
	local Cooldown = 30000
	return Cooldown
end

function SkillSp_SSSP ( sklv )										
	local sp_reduce = 120 + sklv * 20     
	return sp_reduce 
end 



function Skill_SSSP_Begin ( role , sklv ) 
   
        

	local sp = Sp(role) 
	local sp_reduce = SkillSp_SSSP ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_SSSP_End ( ATKER , DEFER , sklv )
	local dmg_1 = 500 + sklv*150
	local dmg_2 = -200 - sklv*150
	local reg1 = 0
	reg1 =IsChaInRegion( ATKER, 2 )
	if reg1 == 1 then
		dmg_1 = 0
	end
	local reg2 = 0
	reg2 =IsChaInRegion( DEFER, 2 )
	if reg2 == 1 then
		dmg_1 = 0
	end
	if is_friend(ATKER, DEFER) == 0 then
	   Hp_Endure_Dmg ( DEFER , dmg_1 ) 
	else
	   Hp_Endure_Dmg ( DEFER , dmg_2 )
	end 

end 

------------------百兽击--------------------------

function SkillSp_ShouWangS ( sklv )										
	local sp_reduce = 125  
	return sp_reduce 
end

function SkillCooldown_ShouWangS( sklv )
	local Cooldown = 30000
	return Cooldown
end

function SkillArea_Circle_ShouWangS ( sklv )					
	local side = 800
	SetSkillRange ( 4 , side  ) 	
end 

function Skill_ShouWangS_Begin ( role , sklv ) 
	
	local sp = Sp(role) 
	local sp_reduce 
	sp_reduce = SkillSp_ShouWangS ( sklv )	
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		
		return 
	end 
	Sp_Red (role , sp_reduce ) 
	
end 

function Skill_ShouWangS_End ( ATKER , DEFER , sklv ) 


        local dmg = math.random ( 350 , 650 )
	Hp_Endure_Dmg ( DEFER , dmg ) 
end 

-------红雷炮————————————————————————————————

function SkillArea_Line_ArfGX ( sklv )										
	local lenth = 900 + sklv * 30  
	local width = 250 + sklv * 10 
	SetSkillRange ( 1 , lenth , width  )  
end

function SkillCooldown_ArfGX( sklv )
	local Cooldown = 30000
	return Cooldown
end

function SkillSp_ArfGX ( sklv )										
	local sp_reduce = 105   
	return sp_reduce 
end


function Skill_ArfGX_Begin ( role , sklv ) 
	local sp = Sp(role) 
	local sp_reduce  = SkillSp_ArfGX ( sklv )  
	if sp - sp_reduce < 0 then 
		SkillUnable(role) 
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_ArfGX_End ( ATKER , DEFER , sklv ) 

        local dmg = math.random ( 350 , 650 ) 
        Hp_Endure_Dmg ( DEFER , dmg ) 
end 
--------------------无影斩--------------------------------

 function SkillArea_Circle_WuYin( sklv )							
	local side = 800 
	SetSkillRange ( 4 , side  )  
end 

function SkillCooldown_WuYin( sklv )
	local Cooldown = 30000
	return Cooldown
end

function SkillSp_WuYin ( sklv )										
	local sp_reduce = 125  
	return sp_reduce 
end 

function Skill_WuYin_Begin ( role , sklv ) 

	local sp = Sp(role) 
	local sp_reduce = SkillSp_WuYin ( sklv ) 
	if sp - sp_reduce < 0 then 
		SkillUnable(role)   
		return 
	end 
	Sp_Red (role , sp_reduce ) 
end 

function Skill_WuYin_End ( ATKER , DEFER , sklv ) 

        local dmg = math.random ( 350 , 650 )
	Hp_Endure_Dmg ( DEFER , dmg ) 

end 


------------------超意念--------------------------

function SkillSp_XYSYF ( sklv )										
	local sp_reduce = 160  
	return sp_reduce 
end

function SkillCooldown_XYSYF( sklv )
	local Cooldown = 30000
	return Cooldown
end

function SkillArea_Circle_XYSYF ( sklv )					
	local side = 800 
	SetSkillRange ( 4 , side  ) 	
end 

function SkillArea_State_XYSYF ( sklv )										
	local statetime = 15 
	local statelv = sklv 
	--Notice("come here")
	SetRangeState ( STATE_YNZL , statelv  , statetime ) 									
end 

function Skill_XYSYF_Begin ( role , sklv ) 
	
	local sp = Sp(role) 
	local sp_reduce 
	sp_reduce = SkillSp_XYSYF ( sklv )	
	if sp - sp_reduce < 0 then 
		SkillUnable(role)  
		
		return 
	end 
	Sp_Red (role , sp_reduce )
	
end 

function Skill_XYSYF_End ( ATKER , DEFER , sklv ) 
end 

function State_XYSYF_Add ( role , statelv ) 
	
	local dmg =  150 + statelv * 30 
	Hp_Endure_Dmg ( role , dmg ) 
end 

function State_XYSYF_Rem ( role , statelv ) 

end 

function State_XYSYF_Tran ( statelv )
	return 3
end