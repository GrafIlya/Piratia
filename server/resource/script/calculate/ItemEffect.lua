print( "Loading ItemEffect.lua")

function hp_med_min( role , Item ) --[[迷你hp回复药品公式]]--
	--LuaPrint("Enter function hp_med_min() --[[mini HP recovery potion formula]]--") 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local con = Con(role)
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then --人物死亡时不可使用
		--LuaPrint("Character dead or illegal HP value")  
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
		return 
	end 
	hp_resume = 20 +con*5 
	hp = hp + hp_resume 
	mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		 hp = mxhp 
		 --LG("Potion Usage", "Max HP cap reached", "\n" ) 
	 end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_min() --[[mini HP recovery potion formula]]--") 
end 

function hp_med_small(role, Item ) --[[小型血瓶公式]]--
	--LuaPrint("Enter function hp_med_small() --[[small HP potion formula]]--") 
	local hp = GetChaAttr(role, ATTR_HP)
	local con = Con(role)
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 20+ con*5  
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small() --[[small HP potion formula]]--") 
end 





----[[面包公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_BREAD (role, Item ) --[[面包公式]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 80    
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small() --[[Elven Fruit formula]]--") 
end 

----[[苹果公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_APPLE ( role , Item )  --[[苹果公式]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 20    
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 

------[[碗仔翅公式]]--————————————————————————————————————————————————————————————————————————————
--
--function ItemUse_WANZICHI ( role , Item )  --[[碗仔饭公式]]--
--	local hp = GetChaAttr(role, ATTR_HP) 
--	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
--	if hp <= 0 then 
--		--LuaPrint("Character dead or illegal HP value")  return 
--		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
--	end 
--	hp_resume = 400    
--	hp = hp + hp_resume 
--	mxhp = GetChaAttr(role,ATTR_MXHP) 
--	if hp > mxhp then --加超过最大hp时返回为最大hp
--		hp = mxhp 
--		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
--	end 
--		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
--	SetCharaAttr(hp, role, ATTR_HP) 
--	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
--end 
----[[蛋糕公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_CAKE ( role , Item )  --[[蛋糕公式]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 180   
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 
--function ItemUse_CAKE ( role )
--	local str = GetChaAttr( role , ATTR_BSTR )
--	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "strength before edit is"..str )
--	SystemNotice ( role , "attribute before editing is"..ap )
--	if str <= 5 then 
--		SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
--		return
--	end
--	local str_dif = 1
--	local ap_dif = 1
--	str = str - str_dif
--	ap = ap + 1
--	
--	SystemNotice ( role , "strength before edit is"..str )
--	SystemNotice ( role , "attribute point edited as"..ap )
--	SetCharaAttr ( str , role , ATTR_BSTR )
--	SetCharaAttr ( ap , role , ATTR_AP )
--end

-- function ItemUse_CAKE ( role )  --[[蛋糕公式]]--
--	local cha = TurnToCha ( cha ) 
--	local x_give = 0 
--	local y_give = 0 
--	local script_count = CheckBagItem ( cha , 887 )					--检查背包中兑换券数量
--	local DiamondId = Roll_DiamondId ( cha )						--随机兑换宝石的种类
--	if script_count >= 1 then 
--		x_del = DelBagItem ( cha , 887 , 1 ) 
--		if x_del == 1 then 
--			x_give = GiveItem ( cha , 0 , DiamondId , 1 , 101 )				--兑换宝石
--
--			y_give = GiveItem ( cha , 0 , 885 , 1 , 101 )					--兑换精炼石
--
--
--		else 
--			SystemNotice ( cha , "Unable to deduct Gem Voucher" ) 
--		end 
--	else 
--		SystemNotice ( cha , "You need to have a Lv 1 Gem Voucher in order to redeem"  ) 
--	end 
--	if x_give == 1 and y_give ==1 then 
--		return 1 
--	else 
--		return 0 
--	end 
--end 
--
--
--



----[[精灵果公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_JLG( role , Item )  --[[精灵果公式]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 15   
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 


function ItemUse_SZ ( role , Item )  --[[沙枣]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 20   
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 



function ItemUse_MG ( role , Item )  --[[蘑菇]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 35  
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 




function ItemUse_MTLG ( role , Item )  --[[曼陀罗果]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 40  
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 


function ItemUse_BG ( role , Item )  --[[冰果]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 50 
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 



function ItemUse_WCG( role , Item )  --[[五彩果]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 108 
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 


function ItemUse_JLGZ( role , Item )  --[[精灵果汁]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 250 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 

function ItemUse_SZC( role , Item )  --[[沙枣茶]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 300
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 



function ItemUse_MGT( role , Item )  --[[蘑菇汤]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 350 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 

function ItemUse_MTLGZ( role , Item )  --[[曼陀罗果汁]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 400
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 


function ItemUse_BQL( role , Item )  --[[冰激凌]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 450
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 


function ItemUse_WCLLZ( role , Item )  --[[五彩琉璃汁]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 500 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 


function ItemUse_ZHGZ( role , Item )  --[[综合果汁]]--
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 550
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[Elven Fruit formula]]--") 
end 







function ItemUse_YYCY( role , Item )  --[[药用草叶]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 4 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 



function ItemUse_MHHB( role , Item )  --[[梦幻花瓣]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 8 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 



function ItemUse_QYGS( role , Item )  --[[奇异果实]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 18 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 


function ItemUse_BFCY( role , Item )  --[[冰封草芽]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 22 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 


function ItemUse_GCYS( role , Item )  --[[甘草药水]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 33  
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 


function ItemUse_XSHC( role , Item )  --[[醒神花茶]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 38 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 


function ItemUse_MZQYG( role , Item )  --[[秘制奇异膏]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 41 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 


function ItemUse_BYS( role , Item )  --[[冰芽酥]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 59 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 


function ItemUse_TMLGZ( role , Item )  --[[提马拉果子]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 100 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 


function ItemUse_SMG( role , Item )  --[[神秘果]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 111 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 



function ItemUse_TSJ( role , Item )  --[[提神剂]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 141 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 



function ItemUse_MHYS( role , Item )  --[[魔幻药水]]--
	local sp = GetChaAttr(role, ATTR_SP) 
	--LG("Potion Usage", "Current SP= ", sp , "\n" ) 
	sp_resume = 201 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
		--LG("Potion Usage", "Reached Max SP cap", "\n" ) 
	end 
		--LG("Potion Usage", "SP recovered to", sp ,"\n" ) 
	SetCharaAttr(sp, role, ATTR_SP) 
end 

function ItemUse_TZCMB ( role , Item )  --[[特制草莓饼]]--
	tempt_monster( role ,  99 )			--招引巨兽

end 











function hp_med_middle( role , Item )  --[[中型血瓶公式]]--
	--LuaPrint("Enter function hp_med_small( role )  --[[medium HP potion formula]]--") 
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	hp_resume = 800 
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	 if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
		--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[medium HP potion formula]]--") 
end 

function hp_med_large( role , Item )  --[[大型血瓶公式]]--
	--LuaPrint("Enter function hp_med_small( role )  --[[Big HP potion formula]]--") 
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	local mxhp = GetChaAttr(role, ATTR_MXHP) 
	hp_resume = 0.2 * mxhp 
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
	--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[big HP potion formula]]--") 
end 

function hp_med_super( role , Item )  --[[超级血瓶公式]]--
	--LuaPrint("Enter function hp_med_small( role )  --[[super HP potion formula]]--") 
	local hp = GetChaAttr(role, ATTR_HP) 
	--LG("Potion Usage", "Current HP= ", hp , "\n" ) 
	if hp <= 0 then 
		--LuaPrint("Character dead or illegal HP value")  return 
		--LG("Potion Usage", "Character dead or illegal HP value","\n" )  
	end 
	local mxhp = GetChaAttr(role, ATTR_MXHP) 
	hp_resume = 0.8 * mxhp  
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
		--LG("Potion Usage", "Max HP cap reached", "\n" ) 
	end 
	--LG("Potion Usage", "HP recovered to", hp ,"\n" ) 
	SetCharaAttr(hp, role, ATTR_HP) 
	--LuaPrint("Out function hp_med_small( role )  --[[super HP potion formula]]--") 
end 










function Sk_Script_Dpsl ( role , Item ) 											--技能卷轴“盾牌熟练”的使用公式
	local sk_add = SK_DPSL
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Lzj ( role , Item ) 											--技能卷轴“连珠箭”的使用公式
										
	local sk_add = SK_LZJ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Lxjy ( role , Item ) 								--技能卷轴“流星箭雨”的使用公式
	local sk_add = SK_LXJY 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Lh ( role , Item ) 								--技能卷轴“狼嚎”的使用公式
	local sk_add = SK_LH 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Ssd ( role , Item )  								--技能卷轴“散射弹”的使用公式
	local sk_add = SK_SSD  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Ctd ( role , Item ) 								--技能卷轴“穿透弹”的使用公式
	local sk_add = SK_CTD 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Dzy ( role , Item ) 								--技能卷轴“大治愈”的使用公式
	local sk_add = SK_DZY 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Hx ( role , Item ) 											
	local sk_add = SK_HX 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Rsd ( role , Item ) 											
	local sk_add =SK_RSD 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 




function Sk_Script_Jssl ( role , Item ) 											
	local sk_add = SK_JSSL 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Gtyz ( role , Item ) 											
	local sk_add = SK_GTYZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Qhtz ( role , Item ) 											
	local sk_add = SK_QHTZ
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Lqhb ( role , Item ) 											
	local sk_add = SK_LQHB 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Jdzz ( role , Item ) 											
	local sk_add = SK_JDZZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Hyz ( role , Item ) 											
	local sk_add = SK_HYZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	--LG( " learn sk " , " Sk_Script_Hyz ()	: " , "sever determine return= " , a ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Zj ( role , Item ) 											
	local sk_add = SK_ZJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Jjsl ( role , Item ) 											
	local sk_add = SK_JJSL 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Ymsl ( role , Item ) 											
	local sk_add = SK_YMSL 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Kb ( role , Item ) 											
	local sk_add = SK_KB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	--LG( " learn sk " , " function Sk_Script_Kb ()	: " , "sever determine return= " , a ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Ttcb ( role , Item ) 											
	local sk_add = SK_TTCB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Mnrx ( role , Item ) 											
	local sk_add = SK_MNRX 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Swzq ( role , Item ) 											
	local sk_add = SK_SWZQ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Ssjjc ( role , Item ) 											
	local sk_add = SK_FSZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Hys ( role , Item ) 											
	local sk_add = SK_HYS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Pxkg ( role , Item ) 											
	local sk_add = SK_PXKG 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Qx ( role , Item ) 											
	local sk_add = SK_YS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Bc ( role , Item ) 											
	local sk_add = SK_BC  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Guz ( role , Item ) 											
	local sk_add = SK_GWZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	--LG( " learn sk " , " function Sk_Script_Guz ()	: " , "sever determine return= " , a ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Db ( role , Item ) 											
	local sk_add = SK_DB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Mb ( role , Item ) 											
	local sk_add = SK_MB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Shtz ( role , Item ) 											
	local sk_add = SK_SHTZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Tzhf ( role , Item ) 											
	local sk_add = SK_TZHF  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Gjsl ( role , Item ) 											
	local sk_add = SK_GJSL  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Jfb ( role , Item ) 											
	local sk_add = SK_JFB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Yy ( role , Item ) 											
	local sk_add = SK_YY 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Hqsl ( role , Item ) 											
	local sk_add = SK_HQSL  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Lxjy ( role , Item ) 											
	local sk_add = SK_LXJY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Dyjj ( role , Item ) 											
	local sk_add = SK_DYJJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Tj ( role , Item ) 											
	local sk_add = SK_TJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Sj ( role , Item ) 											
	local sk_add = SK_SJ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Bt ( role , Item ) 											
	local sk_add = SK_BT  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Jsjc ( role , Item ) 											
	local sk_add = SK_JSJC  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Xzys ( role , Item ) 											
	local sk_add = SK_XZY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Hfs ( role , Item ) 											
	local sk_add = SK_HFS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Xlcz ( role , Item ) 											
	local sk_add = SK_XLCZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Syzy ( role , Item ) 											
	local sk_add = SK_SYZY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 




function Sk_Script_Dzy( role , Item ) 											
	local sk_add = SK_DZY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 




function Sk_Script_Dhfs ( role , Item ) 											
	local sk_add = SK_DHFS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Xlzh ( role , Item ) 											
	local sk_add = SK_XLZH  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Fzlz ( role , Item ) 											
	local sk_add = SK_FZLZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Sy ( role , Item ) 											
	local sk_add = SK_SY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Fh ( role , Item ) 											
	local sk_add = SK_FH  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Jsfb ( role , Item ) 											
	local sk_add = SK_JSFB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Tshd ( role , Item ) 											
	local sk_add = SK_TSHD  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Xzfy ( role , Item ) 											
	local sk_add = SK_XZFY  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Ayzz ( role , Item ) 											
	local sk_add = SK_AYZZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Zzzh ( role , Item ) 											
	local sk_add = SK_ZZZH  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Sdbz ( role , Item ) 											
	local sk_add = SK_SDBZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Nzs ( role , Item ) 											
	local sk_add = SK_SYNZ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Xlpz ( role , Item ) 											
	local sk_add = SK_XLPZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Hfwq ( role , Item ) 											
	local sk_add = SK_HFWQ  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Ks	( role , Item ) 
	local sk_add = SK_KS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
----------------制造
function Sk_Script_ZhiZao( role , Item ) 
	local star_lv=GetItemID(Item)-2678
	local sk_add = SK_ZHIZAO  
	local form_sklv = GetSkillLv( role , sk_add ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need at least 1 empty slot to learn this skill")
		UseItemFailed ( role )
		return
	end
	if form_sklv ~= star_lv-1  then 
		UseItemFailed ( role )  
		return 
	end 
	local el_sklv = GetSkillLv( role , SK_KS ) 
	if el_sklv <star_lv  then 	
		SystemNotice ( role , "Requires you to master "..star_lv.."Lv woodcutting skill to read this book" ) 
		UseItemFailed ( role )
		return
	end 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if star_lv==1 and Item_CanGet < 1 then
		SystemNotice(role ,"You need at least 1 empty slot to learn this skill")
		UseItemFailed ( role )
		return
	end
	a = AddChaSkill ( role , sk_add, star_lv , 1 , 1 ) 
	if a== 0 then 
		SystemNotice ( role , "Not enough LifeSkill points. Please try to complete more story quest." ) 
		UseItemFailed ( role )  
		return 
	end 
	if star_lv==1 then
		local m1 = -1
		local m2 = -1
		m1, m2 = MakeItem ( role , 1068  , 1 , 4 )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)--设置工具等级为1
		SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)--设置工具最大能量
		SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)--设置工具当前能量
	end
end 
----------------铸造
function Sk_Script_ZhuZao( role , Item ) 
	local star_lv=GetItemID(Item)-2698
	local sk_add = SK_ZHUZAO  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= star_lv-1  then 
		UseItemFailed ( role )  
		return 
	end 
	local el_sklv = GetSkillLv( role , SK_WK ) 
	if el_sklv <star_lv  then 	
		SystemNotice ( role ,  "Requires you to master "..star_lv.."Lv mining skill to read this book" ) 
		UseItemFailed ( role )
		return
	end 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if star_lv==1 and Item_CanGet < 1 then
		SystemNotice(role ,"You need at least 1 empty slot to learn this skill")
		UseItemFailed ( role )
		return
	end
	a = AddChaSkill ( role , sk_add, star_lv , 1 , 1 ) 
	if a== 0 then 
		SystemNotice ( role , "Not enough LifeSkill points. Please try to complete more story quest." ) 
		UseItemFailed ( role )  
		return 
	end
	if star_lv==1 then
		local m1 = -1
		local m2 = -1
		m1, m2 = MakeItem ( role , 1069  , 1 , 4 )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)--设置工具等级为1
		SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)--设置工具最大能量
		SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)--设置工具当前能量
	end
end 
----------------烹饪
function Sk_Script_PengRen( role , Item ) 
	local star_lv=GetItemID(Item)-2688
	local sk_add = SK_PENGREN  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= star_lv-1  then 
		UseItemFailed ( role )  
		return 
	end 
	local el_sklv = GetSkillLv( role , SK_BY ) 
	if el_sklv <star_lv  then 	
		SystemNotice ( role ,  "Requires you to master "..star_lv.."Lv Fishing to be able to read this book." ) 
		UseItemFailed ( role )
		return
	end 
	a = AddChaSkill ( role , sk_add, star_lv , 1 , 1 ) 
	if a== 0 then 
		SystemNotice ( role , "Not enough LifeSkill points. Please try to complete more story quest." ) 
		UseItemFailed ( role )  
		return 
	end 
	if star_lv==1 then
		local m1 = -1
		local m2 = -1
		m1, m2 = MakeItem ( role , 1067  , 1 , 4 )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)--设置工具等级为1
		SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)--设置工具最大能量
		SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)--设置工具当前能量
	end
end 
----------------分解
function Sk_Script_FenJie( role , Item ) 
	local star_lv=GetItemID(Item)-2708
	local sk_add = SK_FENJIE  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= star_lv-1  then 
		UseItemFailed ( role )  
		return 
	end 
	local el_sklv = GetSkillLv( role , SK_DL ) 
	if el_sklv <star_lv  then 	
		SystemNotice ( role , "Requires you to master "..star_lv.." Salvage to read current book" ) 
		UseItemFailed ( role )
		return
	end 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if star_lv==1 and Item_CanGet < 1 then
		SystemNotice(role ,"You need at least 1 empty slot to learn this skill")
		UseItemFailed ( role )
		return
	end
	a = AddChaSkill ( role , sk_add, star_lv , 1 , 1 ) 
	if a== 0 then 
		SystemNotice ( role , "Not enough LifeSkill points. Please try to complete more story quest." ) 
		UseItemFailed ( role )  
		return 
	end
	if star_lv==1 then
		local m1 = -1
		local m2 = -1
		m1, m2 = MakeItem ( role , 1070  , 1 , 4 )
		local Itemfinal = GetChaItem ( role , 2 , m2 )
		SetItemAttr(Itemfinal, ITEMATTR_VAL_STR ,1)--设置工具等级为1
		SetItemAttr(Itemfinal, ITEMATTR_MAXENERGY ,10000)--设置工具最大能量
		SetItemAttr(Itemfinal, ITEMATTR_ENERGY ,1)--设置工具当前能量
	end
end 
function Sk_Script_Wk	( role , Item ) 
	local sk_add = SK_WK  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Jr	( role , Item ) 
	local sk_add = SK_JR  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Sl	( role , Item ) 
	local sk_add = SK_SL  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Bkzj ( role , Item ) 
	local sk_add = SK_BKZJ   
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Jf ( role , Item ) 
	local sk_add = SK_JF   
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Lj ( role , Item ) 
	local sk_add = SK_LJ    
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Hzcr ( role , Item ) 
	local sk_add = SK_HZCR     
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Bkcj ( role , Item ) 
	local sk_add = SK_BKCJ      
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Sf ( role , Item ) 
	local sk_add = SK_SF       
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 



function Sk_Script_Xw ( role , Item ) 
	local sk_add = SK_XW        
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 


function Sk_Script_Mw ( role , Item ) 
	local sk_add = SK_MW        
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Lm ( role , Item ) 
	local sk_add = SK_LM         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Pj ( role , Item ) 
	local sk_add = SK_PJ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Fnq ( role , Item ) 
	local sk_add = SK_FNQ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Bdj ( role , Item ) 
	local sk_add = SK_BDJ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Dj ( role , Item ) 
	local sk_add = SK_DJ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Shpf ( role , Item ) 
	local sk_add = SK_SHPF         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Cf ( role , Item )
	local sk_add = SK_CHF         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

function Sk_Script_Px ( role , Item )
	local sk_add = SK_PAX         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

function Sk_Script_MLCH ( role , Item )
	local sk_add = SK_MLCH         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end


function Sk_Script_BLYZ ( role , Item )
	local sk_add = SK_BLYZ         
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end


function AddSailSkill ( role , i , sk_add , sailexp_req ) 
	LG ( "AddSailSkill" , "__add a new sailsk________________________ "  ) 

	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= i - 1  then 
		SystemNotice ( role , "This book is unable to raise your current skill level" ) 
		UseItemFailed ( role )  
		return 
	end 

	local sail_exp_remain = GetChaAttr ( role , ATTR_CLEFT_SAILEXP ) 
	if sail_exp_remain < sailexp_req  then 
		SystemNotice ( role , "Remaining Navigation experience insufficient. Unable to raise skill level. Please try harder!" ) 
		UseItemFailed ( role )  
		return 
	end 
	LG ( "AddSailSkill" , "Skill ID" ,  sk_add , "  Skill Level  " , i  ) 
	LG ( "AddSailSkill" , " Exisiting Navigation EXP  " , sail_exp_remain , "  Navigation EXP consumed " , sailexp_req ) 
	sail_exp_remain = sail_exp_remain - sailexp_req 
	LG ( "AddSailSkill" , " Remaining Navigation EXP  " , sail_exp_remain ) 

	SetCharaAttr ( sail_exp_remain , role , ATTR_CLEFT_SAILEXP ) 
	SystemNotice ( role , "Consumes Navigation experience" .. sailexp_req ) 

	a = AddChaSkill ( role , sk_add, 1 , 0 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

function Sk_Script_Hpsl1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 

end


function Sk_Script_Hpsl2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end


function Sk_Script_Hpsl3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end


function Sk_Script_Hpsl6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Hpsl10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_HPSL         
	local sailexp_req = sk_hpsl [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Jbjg10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_JBJG         
	local sailexp_req = sk_jbjg [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Cfs10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_CFS         
	local sailexp_req = sk_cfs [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 

end

function Sk_Script_Ctqh5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Ctqh10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_CTQH         
	local sailexp_req = sk_ctqh [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr1 ( role , Item ) 
	local i = 1 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr2 ( role , Item ) 
	local i = 2 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr3 ( role , Item ) 
	local i = 3 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr4 ( role , Item ) 
	local i = 4 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr5 ( role , Item ) 
	local i = 5 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr6 ( role , Item ) 
	local i = 6 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr7 ( role , Item ) 
	local i = 7 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr8 ( role , Item ) 
	local i = 8 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr9 ( role , Item ) 
	local i = 9 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_Bjkr10 ( role , Item ) 
	local i = 10 
	local sk_add = SK_BJKR         
	local sailexp_req = sk_bjkr [ i ]  
	AddSailSkill ( role , i , sk_add , sailexp_req ) 
end

function Sk_Script_By ( role , Item )										--技能捕鱼
	local sk_add = SK_BY         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end


function Sk_Script_Dl ( role , Item )											--技能打捞
	local sk_add = SK_DL         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

function Sk_Script_Btjn ( role , Item )										---技能摆摊
	local sk_add = SK_BAT         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

function Sk_Script_Pkqx ( role , Item )
	local sk_add = SK_PKQX         
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end

----回城卷轴-----------------------------------------------------------------------------------------------------------------------------------------

function Jz_Script_hc(role, Item )
	local i = CheckBagItem(role,3141)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3141,1)
			if j == 1 then
				MoveCity(role,"")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
	
end
----白银传送卷轴-------------------------------------------------------------------------------------------------------------------------------------
function Jz_Script_bycs(role, Item )
	local i = CheckBagItem(role,4602)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,4602,1)
			if j == 1 then
				MoveCity(role,"Argent City")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
----沙岚传送卷轴--------------------------------------------------------------------------------------------------------------------------------------
function Jz_Script_slcs(role, Item )
	local i = CheckBagItem(role,4603)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,4603,1)
			if j == 1 then
				MoveCity(role,"Shaitan City")
				return
			end
		end
	else
		UseItemFailed ( role )
	end

end
----冰狼传送卷轴--------------------------------------------------------------------------------------------------------------------------------------
function Jz_Script_blbcs(role, Item )
	local i = CheckBagItem(role,4604)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,4604,1)
			if j == 1 then
				MoveCity(role,"Icicle Castle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end

end
----春风镇送卷轴-------------------------------------------------------------------------------------------------------------------------------------
function Jz_Script_cfzs(role, Item )
	local i = CheckBagItem(role,332)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,332,1)
			if j == 1 then
				MoveCity(role,"Spring Town")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--木材捆使用效果------------------------------------------------------------------------------------------------------------------

function ItemUse_Wood ( role , Item ) 
	local k = ChaIsBoat ( role ) 
	if k == 0 then 
		UseItemFailed ( role ) 
		SystemNotice ( role , "Item can only be used while sailing" )
		return 
	end 
	local hp = GetChaAttr ( role , ATTR_HP ) 
	local mxhp = GetChaAttr ( role, ATTR_MXHP ) 
	if hp < 0 then 
		UseItemFailed ( role ) 
		SystemNotice ( role , "Ship has sunken. Unable to use item" ) 
	end 
	local statelv = 1
	local statetime = 63
	AddState ( role , role , STATE_MCK , statelv , statetime )
	
 

end 

function State_MCK_Add ( role , statelv ) 
	local hpdmg = -100   
	Hp_Endure_Dmg ( role , hpdmg ) 
	ALLExAttrSet(role)  
end 

function State_MCK_Rem ( role , statelv ) 
end

--鱼肉使用效果------------------------------------------------------------------------------------------------------------------

function ItemUse_Fish ( role , Item ) 
	local k = ChaIsBoat ( role ) 
	if k == 0 then 
		UseItemFailed ( role ) 
		SystemNotice ( role , "Item can only be used while sailing" )
		return 
	end 
	local sp = GetChaAttr ( role , ATTR_SP ) 
	local mxsp = GetChaAttr ( role, ATTR_MXSP ) 
	local hp = GetChaAttr ( role , ATTR_HP ) 
	local mxhp = GetChaAttr ( role, ATTR_MXHP ) 
	if hp < 0 then 
		UseItemFailed ( role ) 
		SystemNotice ( role , "Ship has sunken. Unable to use item" ) 
	end 
	local sp_resume = 50 
	sp = math.min ( mxsp , sp + sp_resume  ) 
	SetCharaAttr ( sp , role , ATTR_SP ) 
end 

----月饼使用效果------------------------------------------------------------------------------------------------------------------
function ItemUse_YB ( role , Item )
	local exp = Exp ( role )
	local charLv=Lv ( role )
	local exp_new = 0
	if charLv >= 80 then
		exp_new = exp + 6
	else
		exp_new = exp + 300		
	end
	SetCharaAttr ( exp_new , role , ATTR_CEXP )
end
--华丽宝箱————————————————————————————————————————————————————————————————

function ItemUse_HLBX ( role , Item )
	local item_type = BaoXiang_HLBX 
	local item_type_rad = BaoXiang_HLBX_Rad 
	local item_type_count = BaoXiang_HLBX_Count 
	local maxitem = BaoXiang_HLBX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_HLBX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	--local itemname = GetItemName ( ItemId ) 
	--local cha_name = GetChaDefaultName ( role ) 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	--Notice ( message )
end 


--神秘宝箱————————————————————————————————————————————————————————————————

function ItemUse_SMBX ( role , Item )
	local item_type = BaoXiang_SMBX 
	local item_type_rad = BaoXiang_SMBX_Rad 
	local item_type_count = BaoXiang_SMBX_Count 
	local maxitem = BaoXiang_SMBX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_SMBX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	--local itemname = GetItemName ( ItemId ) 
	--local cha_name = GetChaDefaultName ( role ) 
	--local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	--Notice ( message )
end 


--宠宠宝箱----------------------------------------------------------------

function ItemUse_SYBOX ( role , Item )
	local item_type = BaoXiang_SYBOX 
	local item_type_rad = BaoXiang_SYBOX_Rad 
	local item_type_count = BaoXiang_SYBOX_Count 
	local maxitem = BaoXiang_SYBOX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_SYBOX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	 if   ItemId >= 0183 and  ItemId <= 0199   then
	 
		local itemname = GetItemName ( ItemId ) 
		local cha_name = GetChaDefaultName ( role ) 
		local message = cha_name.." opens a treasure chest and obtained   "..itemname  
 		Notice ( message )
	end
end




----物资箱----------------------------------------------------------------------------------------------

function ItemUse_WZX ( role , Item )
	local item_type = BaoXiang_WZX 
	local item_type_rad = BaoXiang_WZX_Rad 
	local item_type_count = BaoXiang_WZX_Count 
	local maxitem = BaoXiang_WZX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_WZX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
--	local itemname = GetItemName ( ItemId ) 
--	local cha_name = GetChaDefaultName ( role ) 
--	local message = cha_name.." opens a treasure chest and obtained"..itemname  
--	Notice ( message )
end

--骷髅之剑士宝箱————————————————————————————————————————————————————————————————

function ItemUse_KLJS ( role , Item )
	local item_type = BaoXiang_KLJS 
	local item_type_rad = BaoXiang_KLJS_Rad 
	local item_type_count = BaoXiang_KLJS_Count 
	local maxitem = BaoXiang_KLJS_Mxcount						-- 终结编号
	local item_quality = BaoXiang_KLJS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end 

--骷髅之猎人宝箱————————————————————————————————————————————————————————————————

function ItemUse_KLLR ( role , Item )
	local item_type = BaoXiang_KLLR 
	local item_type_rad = BaoXiang_KLLR_Rad 
	local item_type_count = BaoXiang_KLLR_Count 
	local maxitem = BaoXiang_KLLR_Mxcount						-- 终结编号
	local item_quality = BaoXiang_KLLR_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end 

--骷髅之医生宝箱————————————————————————————————————————————————————————————————

function ItemUse_KLYS ( role , Item )
	local item_type = BaoXiang_KLYS 
	local item_type_rad = BaoXiang_KLYS_Rad 
	local item_type_count = BaoXiang_KLYS_Count 
	local maxitem = BaoXiang_KLYS_Mxcount						-- 终结编号
	local item_quality = BaoXiang_KLYS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--骷髅之冒险者宝箱————————————————————————————————————————————————————————————————

function ItemUse_KLMX ( role , Item )
	local item_type = BaoXiang_KLMX 
	local item_type_rad = BaoXiang_KLMX_Rad 
	local item_type_count = BaoXiang_KLMX_Count 
	local maxitem = BaoXiang_KLMX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_KLMX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--咒术之双剑士装备箱————————————————————————————————————————————————————————————————

function ItemUse_ZSSJ ( role , Item )
	local item_type = BaoXiang_ZSSJ 
	local item_type_rad = BaoXiang_ZSSJ_Rad 
	local item_type_count = BaoXiang_ZSSJ_Count 
	local maxitem = BaoXiang_ZSSJ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_ZSSJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--咒术之巨剑士装备箱————————————————————————————————————————————————————————————————

function ItemUse_ZSJS ( role , Item )
	local item_type = BaoXiang_ZSJS 
	local item_type_rad = BaoXiang_ZSJS_Rad 
	local item_type_count = BaoXiang_ZSJS_Count 
	local maxitem = BaoXiang_ZSJS_Mxcount						-- 终结编号
	local item_quality = BaoXiang_ZSJS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--咒术之狙击手装备箱————————————————————————————————————————————————————————————————

function ItemUse_ZSJJ ( role , Item )
	local item_type = BaoXiang_ZSJJ
	local item_type_rad = BaoXiang_ZSJJ_Rad 
	local item_type_count = BaoXiang_ZSJJ_Count 
	local maxitem = BaoXiang_ZSJJ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_ZSJJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--咒术之圣职者装备箱————————————————————————————————————————————————————————————————

function ItemUse_ZSSZ ( role , Item )
	local item_type = BaoXiang_ZSSZ
	local item_type_rad = BaoXiang_ZSSZ_Rad 
	local item_type_count = BaoXiang_ZSSZ_Count 
	local maxitem = BaoXiang_ZSSZ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_ZSSZ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--咒术之封印师装备箱————————————————————————————————————————————————————————————————

function ItemUse_ZSFY ( role , Item )
	local item_type = BaoXiang_ZSFY
	local item_type_rad = BaoXiang_ZSFY_Rad 
	local item_type_count = BaoXiang_ZSFY_Count 
	local maxitem = BaoXiang_ZSFY_Mxcount						-- 终结编号
	local item_quality = BaoXiang_ZSFY_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--咒术之航海士装备箱————————————————————————————————————————————————————————————————

function ItemUse_ZSHH ( role , Item )
	local item_type = BaoXiang_ZSHH
	local item_type_rad = BaoXiang_ZSHH_Rad 
	local item_type_count = BaoXiang_ZSHH_Count 
	local maxitem = BaoXiang_ZSHH_Mxcount						-- 终结编号
	local item_quality = BaoXiang_ZSHH_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--幻灵之双剑士装备箱————————————————————————————————————————————————————————————————

function ItemUse_HLSJ ( role , Item )
	local item_type = BaoXiang_HLSJ
	local item_type_rad = BaoXiang_HLSJ_Rad 
	local item_type_count = BaoXiang_HLSJ_Count 
	local maxitem = BaoXiang_HLSJ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_HLSJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--幻灵之巨剑士装备箱————————————————————————————————————————————————————————————————

function ItemUse_HLJS ( role , Item )
	local item_type = BaoXiang_HLJS
	local item_type_rad = BaoXiang_HLJS_Rad 
	local item_type_count = BaoXiang_HLJS_Count 
	local maxitem = BaoXiang_HLJS_Mxcount						-- 终结编号
	local item_quality = BaoXiang_HLJS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--幻灵之狙击手装备箱————————————————————————————————————————————————————————————————

function ItemUse_HLJJ ( role , Item )
	local item_type = BaoXiang_HLJJ
	local item_type_rad = BaoXiang_HLJJ_Rad 
	local item_type_count = BaoXiang_HLJJ_Count 
	local maxitem = BaoXiang_HLJJ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_HLJJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--幻灵之圣职者装备箱————————————————————————————————————————————————————————————————

function ItemUse_HLSZ ( role , Item )
	local item_type = BaoXiang_HLSZ
	local item_type_rad = BaoXiang_HLSZ_Rad 
	local item_type_count = BaoXiang_HLSZ_Count 
	local maxitem = BaoXiang_HLSZ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_HLSZ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--幻灵之封印师装备箱————————————————————————————————————————————————————————————————

function ItemUse_HLFY ( role , Item )
	local item_type = BaoXiang_HLFY
	local item_type_rad = BaoXiang_HLFY_Rad 
	local item_type_count = BaoXiang_HLFY_Count 
	local maxitem = BaoXiang_HLFY_Mxcount						-- 终结编号
	local item_quality = BaoXiang_HLFY_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--幻灵之航海士装备箱————————————————————————————————————————————————————————————————

function ItemUse_HLHH ( role , Item )
	local item_type = BaoXiang_HLHH
	local item_type_rad = BaoXiang_HLHH_Rad 
	local item_type_count = BaoXiang_HLHH_Count 
	local maxitem = BaoXiang_HLHH_Mxcount						-- 终结编号
	local item_quality = BaoXiang_HLHH_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--迷之双剑士装备箱————————————————————————————————————————————————————————————————

function ItemUse_MSJ ( role , Item )
	local item_type = BaoXiang_MSJ
	local item_type_rad = BaoXiang_MSJ_Rad 
	local item_type_count = BaoXiang_MSJ_Count 
	local maxitem = BaoXiang_MSJ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_MSJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--迷之巨剑士装备箱————————————————————————————————————————————————————————————————

function ItemUse_MJS ( role , Item )
	local item_type = BaoXiang_MJS
	local item_type_rad = BaoXiang_MJS_Rad 
	local item_type_count = BaoXiang_MJS_Count 
	local maxitem = BaoXiang_MJS_Mxcount						-- 终结编号
	local item_quality = BaoXiang_MJS_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--迷之狙击手装备箱————————————————————————————————————————————————————————————————

function ItemUse_MJJ ( role , Item )
	local item_type = BaoXiang_MJJ
	local item_type_rad = BaoXiang_MJJ_Rad 
	local item_type_count = BaoXiang_MJJ_Count 
	local maxitem = BaoXiang_MJJ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_MJJ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--迷之圣职者装备箱————————————————————————————————————————————————————————————————

function ItemUse_MSZ ( role , Item )
	local item_type = BaoXiang_MSZ
	local item_type_rad = BaoXiang_MSZ_Rad 
	local item_type_count = BaoXiang_MSZ_Count 
	local maxitem = BaoXiang_MSZ_Mxcount						-- 终结编号
	local item_quality = BaoXiang_MSZ_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--迷之封印师装备箱————————————————————————————————————————————————————————————————

function ItemUse_MFY ( role , Item )
	local item_type = BaoXiang_MFY
	local item_type_rad = BaoXiang_MFY_Rad 
	local item_type_count = BaoXiang_MFY_Count 
	local maxitem = BaoXiang_MFY_Mxcount						-- 终结编号
	local item_quality = BaoXiang_MFY_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--迷之航海士装备箱————————————————————————————————————————————————————————————————

function ItemUse_MHH ( role , Item )
	local item_type = BaoXiang_MHH
	local item_type_rad = BaoXiang_MHH_Rad 
	local item_type_count = BaoXiang_MHH_Count 
	local maxitem = BaoXiang_MHH_Mxcount						-- 终结编号
	local item_quality = BaoXiang_MHH_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--废灵宝箱————————————————————————————————————————————————————————————————

function ItemUse_FLBX ( role , Item )
	local item_type = BaoXiang_FLBX
	local item_type_rad = BaoXiang_FLBX_Rad 
	local item_type_count = BaoXiang_FLBX_Count 
	local maxitem = BaoXiang_FLBX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_FLBX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--沼泽宝箱————————————————————————————————————————————————————————————————

function ItemUse_ZZBX ( role , Item )
	local item_type = BaoXiang_ZZBX
	local item_type_rad = BaoXiang_ZZBX_Rad 
	local item_type_count = BaoXiang_ZZBX_Count 
	local maxitem = BaoXiang_ZZBX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_ZZBX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end

--魔方宝箱————————————————————————————————————————————————————————————————

function ItemUse_MFBX ( role , Item )
	local item_type = BaoXiang_MFBX
	local item_type_rad = BaoXiang_MFBX_Rad 
	local item_type_count = BaoXiang_MFBX_Count 
	local maxitem = BaoXiang_MFBX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_MFBX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--迷之宝箱-------------------------------------------------------------------------

function ItemUse_MZBX ( role , Item )
	local item_type = BaoXiang_MZBX
	local item_type_rad = BaoXiang_MZBX_Rad 
	local item_type_count = BaoXiang_MZBX_Count 
	local maxitem = BaoXiang_MZBX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_MZBX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens a treasure chest and obtained   "..itemname  
	Notice ( message )
end


--水雷施放——————————————————————————————————————————————————

function  ItemUse_BOMB ( role , Item ) 
	local bomb = SummonCha ( role , 1 , 704 ) 
	local statetime = 10 
	local statelv = 1 
	AddState ( role , bomb , STATE_BOMB , statelv , statetime ) 
	AddChaSkill ( bomb , SK_BOMB , 1 , 1 , 0 ) 
	SystemNotice ( role , "mount Water Mine successful" ) 
end 



---PK特殊药品---------------------------------------------------------------------------------------------------

--蛮牛药水--------
function ItemUse_PKMNYS ( role , Item )
	local statelv = 10
	local statetime = 1800
	AddState( role , role , STATE_PKMNYS , statelv , statetime )
end


--战斗药水--------
function ItemUse_PKZDYS ( role , Item )
	local statelv = 10
	local statetime = 150
	AddState( role , role , STATE_PKZDYS , statelv , statetime )
end

--狂暴药水--------
function ItemUse_PKKBYS ( role , Item )
	local statelv = 10
	local statetime = 20
	AddState( role , role , STATE_PKKBYS , statelv , statetime )
end

--精神药水---------
function ItemUse_PKJSYS ( role , Item )
	local statelv = 10
	local statetime = 180
	AddState( role , role , STATE_PKJSYS , statelv , statetime )
end

--石肤药水---------
function ItemUse_PKSFYS ( role , Item )
	local statelv = 10
	local statetime = 300
	AddState( role , role , STATE_PKSFYS , statelv , statetime )
end

--精准药水--------
function ItemUse_PKJZYS ( role , Item )
	local statelv = 10
	local statetime = 900
	AddState( role , role , STATE_PKJZYS , statelv , statetime )
end

--神佑药水--------
function ItemUse_PKWDYS ( role , Item )
	local statelv = 10
	local statetime = 15
	AddState( role , role , STATE_PKWD , statelv , statetime )
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." becomes invunerable for 15 seconds"  
	Notice ( message )
end

--高级木材捆-------
function ItemUse_PKMCK ( role , Item )
	local map_name = GetChaMapName ( role )
	if map_name == "secretgarden" then
		local hpdmg = -500   
		Hp_Endure_Dmg ( role , hpdmg ) 
		ALLExAttrSet(role)
	else
		SystemNotice ( role , "Item can only be used in Garden of Edel" )
	end
end



--------新增商品-------------------------------------------------------------------------------------------
--雷霆堡机票

function Jz_Script_ltcs(role, Item )
	local i = CheckBagItem(role,3828)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3828,1)
			if j == 1 then
				MoveCity(role,"Thundoria Castle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end



--雷霆堡军港机票
function Jz_Script_ltjgcs(role, Item )
	local i = CheckBagItem(role,3829)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3829,1)
			if j == 1 then
				MoveCity(role,"Thundoria Harbor")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end


--圣雪山机票

function Jz_Script_sxscs(role, Item )
	local i = CheckBagItem(role,3830)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3830,1)
			if j == 1 then
				MoveCity(role,"Sacred Snow Mountain")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--赖安森林补给站机票

function Jz_Script_laslcs(role, Item )
	local i = CheckBagItem(role,3831)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3831,1)
			if j == 1 then
				MoveCity(role,"Andes Forest Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--沙泉补给站机票
function Jz_Script_sqcs(role, Item )
	local i = CheckBagItem(role,3832)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3832,1)
			if j == 1 then
				MoveCity(role,"Oasis Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--冰极补给站机票

function Jz_Script_bjcs(role, Item )
	local i = CheckBagItem(role,3833)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3833,1)
			if j == 1 then
				MoveCity(role,"Icespire Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--寂寞之塔入口机票

function Jz_Script_jmztcs(role, Item )
	local i = CheckBagItem(role,3834)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3834,1)
			if j == 1 then
				MoveCity(role,"Lone Tower Entrace")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--沙窟入口机票
function Jz_Script_scrkcs(role, Item )
	local i = CheckBagItem(role,3835)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3835,1)
			if j == 1 then
				MoveCity(role,"Barren Cavern Entrance")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--废矿2层机票

function Jz_Script_fk2cs(role, Item )
	local i = CheckBagItem(role,3836)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3836,1)
			if j == 1 then
				MoveCity(role,"Abandon Mine 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--银矿2层机票

function Jz_Script_yk2cs(role, Item )
	local i = CheckBagItem(role,3837)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3837,1)
			if j == 1 then
				MoveCity(role,"Silver Mine 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--银矿3层机票

function Jz_Script_yk3cs(role, Item )
	local i = CheckBagItem(role,3838)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3838,1)
			if j == 1 then
				MoveCity(role,"Silver Mine 3")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--寂寞之塔2机票

function Jz_Script_jmzt2cs(role, Item )
	local i = CheckBagItem(role,3839)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3839,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--寂寞之塔3机票

function Jz_Script_jmzt3cs(role, Item )
	local i = CheckBagItem(role,3840)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3840,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 3")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--寂寞之塔4机票
function Jz_Script_jmzt4cs(role, Item )
	local i = CheckBagItem(role,3841)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3841,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 4")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--寂寞之塔5机票

function Jz_Script_jmzt5cs(role, Item )
	local i = CheckBagItem(role,3842)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3842,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 5")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--寂寞之塔6机票
function Jz_Script_jmzt6cs(role, Item )
	local i = CheckBagItem(role,3843)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3843,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 6")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--废矿1层机票

function Jz_Script_fk1cs(role, Item )
	local i = CheckBagItem(role,3847)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3847,1)
			if j == 1 then
				MoveCity(role,"Abandon Mine 1")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end




--经验果子
function ItemUse_MoreExpGz( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
end


--组队经验果子
function ItemUse_ZD_MoreExpGz( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_ZDSBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_ZDSBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_ZDSBJYGZ , statelv , statetime )
	end
end


--掉料果子
function ItemUse_MoreItemGz( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
end

--经验果子2级
function ItemUse_MoreExpGzLv2( role , Item )
	local Lv = Lv( role )
	if Lv < 40 then
		SystemNotice(role ,"Only players Lv 40 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 2
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"Feel the effect of Special Mystic Fruit" )
end

--掉料果子2级
function ItemUse_MoreItemGzLv2( role , Item )
	local Lv = Lv( role )
	if Lv < 40 then
		SystemNotice(role ,"Only players Lv 40 and above may use")
		UseItemFailed ( role )
		return
	end


	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
	SystemNotice ( role ,"Feels the effect of Special Lucky Fruit" )
end

--经验果子3级
function ItemUse_MoreExpGzLv3( role , Item )
	local Lv = Lv( role )
	if Lv < 60 then
		SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 3
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"Feels the effect of Super Mystic Fruit" )
end

--掉料果子3级
function ItemUse_MoreItemGzLv3( role , Item )
	local Lv = Lv( role )
	if Lv < 60 then
		SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end


	local statelv = 3	
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
	SystemNotice ( role ,"Feel the effect of Super Lucky Fruit" )
end




--奇迹果子
function ItemUse_MoreItemAndExpGz( role , Item )
	local Lv = Lv( role )
	if Lv < 30 then
		SystemNotice(role ,"Only players Lv 30 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
end

--体力恢复剂
function ItemUse_TLHFJ( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	hp_resume = 800 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大sp时返回为最大sp
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP)
end


-----洗点------------------------------------------------------------------

--力量1点
function ItemUse_XD_Str1 ( role , Item )
	local str = GetChaAttr( role , ATTR_BSTR )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "strength before edit is"..str )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if str <= 5 then 
		SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local str_dif = 1
	local ap_dif = 1
	str = str - str_dif
	ap = ap + 1

	SystemNotice ( role , "Reset 1 Strength point to increases 1 stat point" )
--	SystemNotice ( role , "strength before edit is"..str )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( str , role , ATTR_BSTR )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--体质1点
function ItemUse_XD_Con1 ( role , Item )
	local con = GetChaAttr( role , ATTR_BCON )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "constitution before edit is"..con )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if con <= 5 then 
		SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local con_dif = 1
	local ap_dif = 1
	con = con - con_dif
	ap = ap + 1

	SystemNotice ( role , "Reset 1 Constitution point to increase 1 Stat point" )
	
--	SystemNotice ( role , "constitution edited to"..con )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( con , role , ATTR_BCON )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--敏捷1点
function ItemUse_XD_Agi1 ( role , Item )
	local agi = GetChaAttr( role , ATTR_BAGI )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "agility before edit is"..agi )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if agi <= 5 then 
		SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local agi_dif = 1
	local ap_dif = 1
	agi = agi - agi_dif
	ap = ap + 1

	SystemNotice ( role , "Reset 1 Agility point to increases 1 stat point" )
	
--	SystemNotice ( role , "Agility edited to"..agi )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( agi , role , ATTR_BAGI )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--专注1点
function ItemUse_XD_Dex1 ( role , Item )
	local dex = GetChaAttr( role , ATTR_BDEX )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "Accuracy edited to"..dex )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if dex <= 5 then 
		SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local dex_dif = 1
	local ap_dif = 1
	dex = dex - dex_dif
	ap = ap + 1

	SystemNotice ( role , "Reset 1 Accuracy point to increase 1 Stat point" )
	
--	SystemNotice ( role , "accuracy edit as"..dex )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( dex , role , ATTR_BDEX )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--精神1点
function ItemUse_XD_Sta1 ( role , Item )
	local sta = GetChaAttr( role , ATTR_BSTA )
	local ap = GetChaAttr( role , ATTR_AP )
--	SystemNotice ( role , "spirit before edit is"..sta )
--	SystemNotice ( role , "attribute before editing is"..ap )
	if sta <= 5 then 
		SystemNotice ( role , "You do not have enough points to reset. Reset failed" )
		UseItemFailed ( role )
		return
	end
	local sta_dif = 1
	local ap_dif = 1
	sta = sta - sta_dif
	ap = ap + 1

	SystemNotice ( role , "Reset 1 Spirit point to increase 1 Stat point" )
	
--	SystemNotice ( role , "Spirit edited as "..sta )
--	SystemNotice ( role , "attribute point edited as"..ap )
	SetCharaAttr ( sta , role , ATTR_BSTA )
	SetCharaAttr ( ap , role , ATTR_AP )
end

--商品属性药剂

--灵猴药剂( agi )
function ItemUse_SPLhyj( role , Item )
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSLQQH )
	State [1] = GetChaStateLv ( role , STATE_YSTZQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end
	
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSMJQH , statelv , statetime )

end

--鹰眼药剂( dex )
function ItemUse_SPYyyj( role , Item )
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSTZQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSLQQH , statelv , statetime )

end

--蛮牛药剂( con )
function ItemUse_SPMnyj( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSTZQH , statelv , statetime )

end

--圣灵药剂( sta )
function ItemUse_SPSlyj( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSTZQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end


	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSJSQH , statelv , statetime )

end

--雄狮药剂( str )
function ItemUse_SPXsyj( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSTZQH )
	State [3] = GetChaStateLv ( role , STATE_YSJSQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end	

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 3600
	AddState( role , role , STATE_YSLLQH , statelv , statetime )

end


--蓝色锻造果
function ItemUse_LSDZG ( role , Item )
	local statelv = 4
	local statetime = 60
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_JLGLJB , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--红色锻造果

function ItemUse_HSDZG ( role , Item )
	local statelv = 2
	local statetime = 60
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_HCGLJB , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--圣诞道具

--丢失的圣诞帽子

function ItemUse_DSSDM ( role , Item )
	local statelv = 1
	local statetime = 300
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_PKSFYS , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--邪恶之角

function ItemUse_XEZJ ( role , Item )
	local statelv = 1
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_PKZDYS , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--狂战术 大幅提高攻击力小幅降低防御力的道具持续时间15分钟
function ItemUse_XEZJB ( role , Item )
	Rem_State_StarUnnormal ( role )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		Rem_State_StarUnnormal ( role )
		AddState( role , role , STATE_KUANGZ , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--圣诞糖果

function ItemUse_SDTG ( role , Item )
	
	local hp = GetChaAttr(role, ATTR_HP) 
	local sp = GetChaAttr(role, ATTR_SP) 
	
	hp_resume = 30 
	sp_resume = 10
	
	hp = hp + hp_resume 
	sp = sp + sp_resume 

	mxhp = GetChaAttr(role,ATTR_MXHP) 
	mxsp = GetChaAttr(role,ATTR_MXSP) 

	if hp > mxhp then 
		hp = mxhp 
	end 

	if sp > mxsp then 
		sp = mxsp 
	end 

	SetCharaAttr(hp, role, ATTR_HP)
	SetCharaAttr(sp, role, ATTR_SP) 

end

--圣诞袜子

function ItemUse_SDWZBOX ( role , Item )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	
	if CheckDateNum < 122423  then
		SystemNotice ( role , "Please be patient. Santa Claus will be very punctual with his gift. Please use the item between 24th December 11.00pm and 25th December 6.00am" )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 122506 then
		SystemNotice ( role , "Santa Claus has left. Please wait for next year" )
		UseItemFailed ( role )
		return
	end
	
	local item_type = BaoXiang_SDWZBOX
	local item_type_rad = BaoXiang_SDWZBOX_Rad 
	local item_type_count = BaoXiang_SDWZBOX_Count 
	local maxitem = BaoXiang_SDWZBOX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_SDWZBOX_Qua
	local General = 0  
	local ItemId = 0 
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

		d = item_type_rad [ k ] + b

		 if a <= d and a > b then
			c = k

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
end

--圣诞礼盒

function ItemUse_SDLHBOX ( role , Item )
	local Check = math.random ( 1, 100 )
	if Check <= 35 then

		local exp = Exp ( role )
		local exp_dif = math.random ( 100 , 300 )
		if Lv ( TurnToCha ( role )  )  >= 80 then 
			exp_dif = math.floor ( exp_dif / 50  ) 
		end 
		local exp_new = exp + exp_dif
	
		SetCharaAttr ( exp_new , role , ATTR_CEXP )

	elseif Check > 35 and Check <= 70 then
		local Money_add = math.random ( 200 , 600 )
		AddMoney ( role , 0 , Money_add )
	else
		local item_type = BaoXiang_SDLHBOX
		local item_type_rad = BaoXiang_SDLHBOX_Rad 
		local item_type_count = BaoXiang_SDLHBOX_Count 
		local maxitem = BaoXiang_SDLHBOX_Mxcount						-- 终结编号
		local item_quality = BaoXiang_SDLHBOX_Qua
		local General = 0  
		local ItemId = 0 
		
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		
		if Item_CanGet <= 0 then
			SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
			UseItemFailed ( role )
			return
		end
		for i = 1 , maxitem , 1 do 
			General = item_type_rad [ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local c = -1							--命中物品编号
		for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

			d = item_type_rad [ k ] + b

			 if a <= d and a > b then
				c = k

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
	end
end

--好运包
function ItemUse_HYBOX ( role , Item )

--	local Item_CanGet = GetChaFreeBagGridNum ( role )
--	if Item_CanGet <= 1 then
--		SystemNotice(role ,"Insufficient slots in inventory to open Lucky Packet")
--		UseItemFailed ( role )
--		return
--	end
	
	local Money_Add = 8
	local exp_dif = 0
	local exp_random = math.random( 1 , 1000 )
	if exp_random == 1000 then
		Money_Add = 8888
		exp_dif = 66600
	else
		
		exp_dif = math.random ( 2 , 6 )
		exp_dif = exp_dif * 50
	end
	
	local exp = Exp ( role )
	if Lv ( TurnToCha ( role )  )  >= 80 then 
		exp_dif = math.floor ( exp_dif / 50  ) 
	end 
	local exp_new = exp + exp_dif
	
	AddMoney ( role , 0 , Money_Add )
	SetCharaAttr ( exp_new , role , ATTR_CEXP )
	
        local zmbox_random = math.random( 1 , 500 )
        if  zmbox_random == 500 then

	    local item_type = BaoXiang_HYBOX 
	    local item_type_rad = BaoXiang_HYBOX_Rad 
	    local item_type_count = BaoXiang_HYBOX_Count 
	    local maxitem = BaoXiang_HYBOX_Mxcount						-- 终结编号
	    local item_quality = BaoXiang_HYBOX_Qua
	    local General = 0  
	    local ItemId = 0 
	    for i = 1 , maxitem , 1 do 
	  	    General = item_type_rad [ i ] + General		
	    end 
	    local a = math.random ( 1, General )
	    local b = 0
	    local d = 0 
	    local c = -1							--命中物品编号
	    for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
       end
	  GiveItem ( role , 0 , 3904 , 1 , 5 ) 
--	local itemname = GetItemName ( ItemId ) 
--	local cha_name = GetChaDefaultName ( role ) 
--	local message = cha_name.." opens a Lucky Packet and obtained "..itemname  
--	Notice ( message )
end 


--富贵包
function ItemUse_FGBOX ( role , Item )
	
	AddMoney ( role , 0 , 88 )	
	local item_type = BaoXiang_FGBOX 
	local item_type_rad = BaoXiang_FGBOX_Rad 
	local item_type_count = BaoXiang_FGBOX_Count 
	local maxitem = BaoXiang_FGBOX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_FGBOX_Qua
	local General = 0  
	local ItemId = 0 
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
--	if Item_CanGet <= 1 then
--		SystemNotice(role ,"Insufficient space in inventory. Unable to use Fortune Packet")
--		UseItemFailed ( role )
--		return
--	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	GiveItem ( role , 0 , 3904 , 1 , item_quality )

	
	if ItemId == 878 then
		local itemname = GetItemName ( ItemId ) 
		local cha_name = GetChaDefaultName ( role ) 
		local message = cha_name.." opens a Fortune Packet and obtained  "..itemname  
		Notice ( message )
	end
end 

--鸿运包
function ItemUse_HYUNBOX ( role , Item )
	
	AddMoney ( role , 0 , 888 )
	local item_type = BaoXiang_HYUNBOX 
	local item_type_rad = BaoXiang_HYUNBOX_Rad 
	local item_type_count = BaoXiang_HYUNBOX_Count 
	local maxitem = BaoXiang_HYUNBOX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_HYUNBOX_Qua
	local General = 0  
	local ItemId = 0 
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
--	if Item_CanGet <= 1 then
--		SystemNotice(role ,"Insufficient space in inventory. Unable to use Prosperous Packet")
--		UseItemFailed ( role )
--		return
--	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	GiveItem ( role , 0 , 3904 , 1 , item_quality )

	local GoodItem = {}
	GoodItem[0] = 3844
	GoodItem[1] = 3845
	GoodItem[2] = 899
	GoodItem[3] = 900
	GoodItem[4] = 901
	GoodItem[5] = 902
	GoodItem[6] = 903

	local Good_C = 0
	for Good_C = 0 , 6 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." opens a Prosperous Packet and obtained "..itemname  
			Notice ( message )
		end
	end
end 

--暗淡的许愿石
function ItemUse_ADBOX ( role , Item )
	local item_type = BaoXiang_ADBOX 
	local item_type_rad = BaoXiang_ADBOX_Rad 
	local item_type_count = BaoXiang_ADBOX_Count 
	local maxitem = BaoXiang_ADBOX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_ADBOX_Qua
	local General = 0  
	local ItemId = 0 
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
--	if Item_CanGet <= 0 then
--		SystemNotice(role ,"Insufficient space in inventory. Unable to use Wishing Stone")
--		UseItemFailed ( role )
--		return
--	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
--	local itemname = GetItemName ( ItemId ) 
--	local cha_name = GetChaDefaultName ( role ) 
--	local message = cha_name.."rubbed a Wishing Stone and obtained"..itemname  
--	Notice ( message )
end 

--闪光的许愿石
function ItemUse_SGBOX ( role , Item )
	local item_type = BaoXiang_SGBOX 
	local item_type_rad = BaoXiang_SGBOX_Rad 
	local item_type_count = BaoXiang_SGBOX_Count 
	local maxitem = BaoXiang_SGBOX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_SGBOX_Qua
	local General = 0  
	local ItemId = 0 
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
--	if Item_CanGet <= 0 then
--		SystemNotice(role ,"Insufficient space in inventory. Unable to use Wishing Stone")
--		UseItemFailed ( role )
--		return
--	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	
	GoodItem[0] = 879
	GoodItem[1] = 880
	GoodItem[2] = 881
	GoodItem[3] = 882
	GoodItem[4] = 883
	GoodItem[5] = 884
	GoodItem[6] = 885
	GoodItem[7] = 887
	GoodItem[8] = 7
	GoodItem[9] = 42
	GoodItem[10] = 18
	GoodItem[11] = 1375
	GoodItem[12] = 1384
	GoodItem[13] = 1394
	GoodItem[14] = 1411
	GoodItem[15] = 1421
	GoodItem[16] = 4198
	GoodItem[17] = 4200
	GoodItem[18] = 4202
	GoodItem[19] = 4204
	GoodItem[20] = 4206
	GoodItem[21] = 4208
	

	local Good_C = 0
	for Good_C = 0 , 21 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.."uses a Sparking Wishing Stone and obtained "..itemname  
			Notice ( message )
		end
	end
end 
--精灵礼品盒

function ItemUse_JingLingBOX ( role, Item )
	local item_type = BaoXiang_JingLingBOX 
	local item_type_rad = BaoXiang_JingLingBOX_Rad 
	local item_type_count = BaoXiang_JingLingBOX_Count 
	local maxitem = BaoXiang_JingLingBOX_Mxcount						-- 终结编号
	local item_quality = BaoXiang_JingLingBOX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use Fairy Box")
		UseItemFailed ( role )
		return
	end

	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end   
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号--k 从 1 到 7

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
end

--食神水饺
function ItemUse_SSSJ ( role , Item )

  	local hp = GetChaAttr(role, ATTR_HP) 
	local mxhp = GetChaAttr(role,ATTR_MXHP) 	
	hp = hp + 0.3*mxhp 

	if hp > mxhp then 
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP)

end




--超级糖葫芦

function ItemUse_CJTHL ( role , Item )
      
	GiveItem ( role , 0 , 3911 , 1 , 5 ) 	
  	local hp = GetChaAttr(role, ATTR_HP) 
	local sp = GetChaAttr(role, ATTR_SP) 
	
	hp_resume = 100 
	sp_resume = 100
	
	hp = hp + hp_resume 
	sp = sp + sp_resume 

	mxhp = GetChaAttr(role,ATTR_MXHP) 
	mxsp = GetChaAttr(role,ATTR_MXSP) 

	if hp > mxhp then 
		hp = mxhp 
	end 

	if sp > mxsp then 
		sp = mxsp 
	end 

	SetCharaAttr(hp, role, ATTR_HP)
	SetCharaAttr(sp, role, ATTR_SP)    


end

--灯笼
function ItemUse_Denglong ( role , Item )
	local statelv = 1
	local statetime = 600
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_DENGLONG , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

	
--玫瑰
function ItemUse_MeiGui ( role , Item )
	local statelv = 1
	local statetime = 600
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_MEIGUI , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--爆竹
function ItemUse_BZ ( role , Item )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	local Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )

	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
end 


function ItemUse_SaintCloth ( role , Item ) 
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"Requires 4 slots in inventory to open Chest of Kylin")
		UseItemFailed ( role )
		return
	end
	if cha_type == 4 then 
		GiveItem ( cha , 0 , 828 , 1 , 0 )	
	end 
	GiveItem ( cha , 0 , 825 , 1 , 0 )	
	GiveItem ( cha , 0 , 826 , 1 , 0 )	
	GiveItem ( cha , 0 , 827 , 1 , 0 )	
end 


--商城装备宝箱

function ItemUse_SCBoxYXTZ ( role , Item )		--夜行套装
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 2 then
		SystemNotice(role ,"To open the chest requires 3 empty slots")
		UseItemFailed ( role )
		return
	end

	if cha_type == 1 then
		GiveItem ( cha , 0 , 0395 , 1 , 95 )	
		GiveItem ( cha , 0 , 0587 , 1 , 95 )	
		GiveItem ( cha , 0 , 0747 , 1 , 95 )	
	else
		SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end
end

function ItemUse_SCBoxLSTZ ( role , Item )		--力士套装
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open treasure chest")
		UseItemFailed ( role )
		return
	end
	if cha_type == 2 then
		GiveItem ( cha , 0 , 0397 , 1 , 95 )
		GiveItem ( cha , 0 , 0829 , 1 , 95 )
		GiveItem ( cha , 0 , 0603 , 1 , 95 )
	else
		SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end

end

function ItemUse_SCBoxHYTZ ( role , Item )		--后裔套装
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 2 then
		SystemNotice(role ,"To open the chest requires 3 empty slots")
		UseItemFailed ( role )
		return
	end

	if cha_type == 1 or cha_type == 3 then
		GiveItem ( cha , 0 , 0399 , 1 , 95 )
		GiveItem ( cha , 0 , 0589 , 1 , 95 )
		GiveItem ( cha , 0 , 0749 , 1 , 95 )
	else
		SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end

end

function ItemUse_SCBoxFYSTZ ( role , Item )		--封印职业套装
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"Lack of 4 inventory slots. Unable to open chest.")
		UseItemFailed ( role )
		return
	end
	
	if cha_type == 3 then
		GiveItem ( cha , 0 , 0401 , 1 , 95 )
		GiveItem ( cha , 0 , 0591 , 1 , 95 )
		GiveItem ( cha , 0 , 0751 , 1 , 95 )
	elseif cha_type == 4 then
		GiveItem ( cha , 0 , 0403 , 1 , 95 )
		GiveItem ( cha , 0 , 0593 , 1 , 95 )
		GiveItem ( cha , 0 , 0753 , 1 , 95 )
		GiveItem ( cha , 0 , 2218 , 1 , 95 )
	else
		SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	
end

function ItemUse_SCBoxSZZTZ ( role , Item )		--圣职者套装
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"Lack of 4 inventory slots. Unable to open chest.")
		UseItemFailed ( role )
		return
	end
	
	if cha_type == 3 then
		GiveItem ( cha , 0 , 0405 , 1 , 95 )
		GiveItem ( cha , 0 , 0595 , 1 , 95 )
		GiveItem ( cha , 0 , 0755 , 1 , 95 )
	elseif cha_type == 4 then
		GiveItem ( cha , 0 , 0407 , 1 , 95 )
		GiveItem ( cha , 0 , 0597 , 1 , 95 )
		GiveItem ( cha , 0 , 0757 , 1 , 95 )
		GiveItem ( cha , 0 , 2220 , 1 , 95 )
	else
		SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end
end

function ItemUse_SCBoxHHSTZ ( role , Item )		--航海士套装
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet <= 3 then
		SystemNotice(role ,"Lack of 4 inventory slots. Unable to open chest.")
		UseItemFailed ( role )
		return
	end
	
	if cha_type == 1 or cha_type == 3 then
		GiveItem ( cha , 0 , 0409 , 1 , 95 )
		GiveItem ( cha , 0 , 0599 , 1 , 95 )
		GiveItem ( cha , 0 , 0759 , 1 , 95 )
	elseif cha_type == 4 then
		GiveItem ( cha , 0 , 0412 , 1 , 95 )
		GiveItem ( cha , 0 , 0601 , 1 , 95 )
		GiveItem ( cha , 0 , 0761 , 1 , 95 )
		GiveItem ( cha , 0 , 2222 , 1 , 95 )
	else
		SystemNotice(role ,"Body size does not match. Unable to open chest")
		UseItemFailed ( role )
		return
	end
end


function ItemUse_SCBoxRYBZ ( role , Item )		--如意宝杖
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0109 , 1 , 95 )
end

function ItemUse_SCBoxXMC ( role , Item )		--降魔杵
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0111 , 1 , 95 )
end

function ItemUse_SCBoxLQJ ( role , Item )		--龙泉剑
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0113 , 1 , 95 )
end

function ItemUse_SCBoxLYJ ( role , Item )		--裂岩剑
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0115 , 1 , 95 )
end

function ItemUse_SCBoxFHG ( role , Item )		--飞虹
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0117 , 1 , 95 )
end

function ItemUse_SCBoxLXHZ ( role , Item )		--流星火珠
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0119 , 1 , 95 )
end

function ItemUse_SCBoxYCJ ( role , Item )		--鱼肠
	local cha = TurnToCha ( role ) 
	local cha_type = GetChaTypeID ( cha ) 

	local Item_CanGet = GetChaFreeBagGridNum ( cha )

	if Item_CanGet == 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	GiveItem ( cha , 0 , 0150 , 1 , 95 )
end

--羊皮卷 

function ItemUse_Map_YPJ ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local Has_GoldenMap = CheckBagItem ( role , 1093 )
	if Has_GoldenMap >= 1 then
		SystemNotice ( role , "You can only bring 1 Treasure Map at a time" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1093 , 1 , 0 )
end

--新式羊皮卷
function ItemUse_Map_JLBYPJ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local Has_GoldenMap = CheckBagItem ( role , 682 )
	local lv= GetChaAttr(role, ATTR_LV) 
	if Has_GoldenMap >= 1 then
		SystemNotice ( role , "You can only bring 1 Treasure Map at a time" )
		UseItemFailed ( role )
		return
	end
	if lv <15 or  lv >40 then
		SystemNotice ( role , "Only characters between Lv 15 to Lv 40 can use New Sheepskin Scroll" )
		UseItemFailed ( role )
		return	
	end
	GiveItem ( role , 0 , 682 , 1 , 0 )
end
-- 藏宝图

function ItemUse_GoldenMap ( role , Item )
 	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local Has_GoldenMap = CheckBagItem ( role , 1093 )
	if Has_GoldenMap >= 2 then
		SystemNotice ( role , "Brought more than 1 Treasure Map. Digging failed" )
		UseItemFailed ( role )
		return
	end
	local Item = GetChaItem2 ( role , 2 , 1093 )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Item_MAXENERGY = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
	local pos_x = Item_MAXURE
	local pos_y = Item_MAXENERGY
	local Themap = Item_URE
--	SystemNotice ( role , "pos_x"..pos_x )
--	SystemNotice ( role , "pos_y"..pos_y )
--	SystemNotice ( role , "Themap"..Themap )
	
	local MapList = { }
	
	MapList [0] = "NoMap"
	MapList [1] = "garner"
	MapList [2] = "magicsea"
	MapList [3] = "darkblue"

	local MapNameList = { }
	
	MapNameList [0] = "No map"
	MapNameList [1] = "Ascaron"
	MapNameList [2] = "Magical Ocean"
	MapNameList [3] = "Deep Blue"
	if pos_x == 0 or pos_y == 0 or Themap == 0 then
		pos_x , pos_y , Themap = GetTheMapPos ( role , 1 )		
--		pos_x,pos_y,Themap = GetMapRanPos ( role )
		Item_MAXURE = pos_x
		Item_URE = Themap
		Item_MAXENERGY = pos_y
		
		SetItemAttr ( Item , ITEMATTR_MAXENERGY , Item_MAXENERGY )
		SetItemAttr ( Item , ITEMATTR_MAXURE , Item_MAXURE )
		SetItemAttr ( Item , ITEMATTR_URE , Item_URE )
--		SystemNotice ( role , "Themap"..Themap )
--		Item_MAXENERGY = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
--		SystemNotice ( role , "Item_MAXENERGY"..Item_MAXENERGY )
	end
	local GetPos = CheckGetMapPos ( role , pos_x , pos_y , MapList[Themap] )
--	SystemNotice ( role , "CheckPosOver"..GetPos ) 
	if GetPos == 0 then
		SystemNotice ( role , "Treasure is hidden at "..MapNameList[Themap].."Region"..pos_x..","..pos_y.." nearby" )
		UseItemFailed ( role )
		return
	elseif GetPos == 1 then
		local getrandom = math.random ( 1 , 3 )
		if getrandom == 1 then
			GiveGoldenMapItem ( role )
		else
			SystemNotice ( role , "Looks like nothing is dug out. Look again nearby" )
			UseItemFailed ( role )
			return
		end
	end
end

-- 加勒比藏宝图
function ItemUse_JLB_GoldenMap ( role , Item )
 	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv <15 or  lv >40 then
		SystemNotice ( role , "Characters lower than Lv 15 or higher than Lv 40 cannot use this treasure map" )
		UseItemFailed ( role )
		return	
	end
	local Has_GoldenMap = CheckBagItem ( role , 682 )
	if Has_GoldenMap >= 2 then
		SystemNotice ( role , "You can only have 1 treasure map in inventory to seek for treasure. Please deposit the rest into your vault" )
		UseItemFailed ( role )
		return
	end
	local Item = GetChaItem2 ( role , 2 , 682 )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Item_MAXENERGY = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
	local pos_x = Item_MAXURE
	local pos_y = Item_MAXENERGY
	local Themap = Item_URE
	local MapList = { }	
	MapList [0] = "NoMap"
	MapList [1] = "jialebi"
	local MapNameList = { }
	MapNameList [0] = "No map"
	MapNameList [1] = "Treasure Gulf"
	if pos_x == 0 or pos_y == 0 or Themap == 0 then
		pos_x , pos_y , Themap = GetTheMapPos_JLB ( role , 1 )	
		Item_MAXURE = pos_x
		Item_URE = Themap
		Item_MAXENERGY = pos_y
		SetItemAttr ( Item , ITEMATTR_MAXENERGY , Item_MAXENERGY )
		SetItemAttr ( Item , ITEMATTR_MAXURE , Item_MAXURE )
		SetItemAttr ( Item , ITEMATTR_URE , Item_URE )
	end
	local GetPos = CheckGetMapPos ( role , pos_x , pos_y , MapList[Themap] )
	if GetPos == 0 then
		SystemNotice ( role , "Treasure is hidden at "..MapNameList[Themap].."Region"..pos_x..","..pos_y.." nearby" )
		UseItemFailed ( role )
		return
	elseif GetPos == 1 then
		local getrandom = math.random ( 1 , 3 )
		if getrandom == 1 then
			GiveGoldenMapItem_JLB ( role )
		else
			SystemNotice ( role , "Looks like nothing is dug out. Look again nearby" )
			UseItemFailed ( role )
			return
		end
	end
end




--生日蛋糕
function ItemUse_BirthCake ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		local attr_ap = Attr_ap( role )
		local ap_extre = 3
		attr_ap = attr_ap + ap_extre 
		SetCharaAttr( attr_ap, role, ATTR_AP )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end
------------------------假期欢乐杂志
function ItemUse_HappyBook ( role , Item )
	local Cha_Boat = 0
	local charLv=Lv ( role )
	local dif_exp_one = DEXP[charLv+1]
	local dif_exp_three = DEXP[charLv+3]
	local dif_exp_five = DEXP[charLv+5]
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )----------当前等级经验
	local dif_exp_half = (DEXP[charLv+1] - DEXP[charLv])*0.5 +  Exp_star +10
	local dif_exp_thalf = (DEXP[charLv+1] - DEXP[charLv])*0.3  +  Exp_star + 10
	local dif_exp_thalf_b = dif_exp_thalf - DEXP[charLv+1]
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	elseif charLv>=1 and charLv<=9 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_five )
	elseif charLv>=10 and charLv<=29 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_three )
	elseif charLv>=30 and charLv<=59 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_one )
	elseif charLv>=60 and charLv<=75 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_half )
	elseif charLv>=76 and charLv<=85 and charLv~=79  then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b<=0 then 
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b>0 then 
			dif_exp_thalf = dif_exp_thalf_b*0.02 + DEXP[charLv+1]
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv>=86 then
		SystemNotice( role , "Your level is too high to use" )
		UseItemFailed ( role )
		return
	end
end
------------三月精灵

function ItemUse_MarchElf ( role , Item )
	local statelv = 1
	local statetime = 600
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		local cha_type = GetChaTypeID ( role )
		if cha_type == 3 or cha_type == 4 then
			AddState( role , role , STATE_MarchElf , statelv , statetime )
		else
			SystemNotice ( role , "Fairy March can only be used by female" )
			UseItemFailed ( role )
			return
		end
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

end

--加速药水

function ItemUse_MspdYS ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )


	if Cha_Boat ==  nil then
		AddState( role , role , STATE_YSMspd , statelv , statetime )
		SystemNotice( role , "A" )

	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

end

--三角帆

function ItemUse_SanJiaoFan ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~=  nil then
		AddState( Cha_Boat , Cha_Boat , STATE_YSBoatMspd , statelv , statetime )
	else
		SystemNotice( role , "Only can be used while sailing" )
		UseItemFailed ( role )
		return
	end

end

--高级装甲

function ItemUse_GJZhuangJia ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~=  nil then
		AddState( Cha_Boat , Cha_Boat , STATE_YSBoatDEF , statelv , statetime )
	else
		SystemNotice( role , "Only can be used while sailing" )
		UseItemFailed ( role )
		return
	end

end

--抽签

--财运签

function ItemUse_SuanmingMoney ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		
		
		local Has_GoldenMap = CheckBagItem ( role , 3336 )
		if Has_GoldenMap >= 1 then
			SystemNotice ( role , "Used Mystic Clover" )
			SuanmingTeshu_Money ( role )
			DelBagItem( role , 3336 , 1 )
		else
			Suanming_Money ( role )
		end
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

	
end

--事业钱

function ItemUse_SuanmingWork ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		local lv = Lv ( role )
		local exp = Exp(role) 
		local clexp = GetChaAttrI ( role , ATTR_CLEXP )
		if exp < clexp then
			SystemNotice ( role , "Experience lower than level. Unable to use lot." )
			UseItemFailed ( role )
			return
		end
		
		local Has_GoldenMap = CheckBagItem ( role , 3336 )
		if Has_GoldenMap >= 1 then
			SystemNotice ( role , "Used Mystic Clover" )
			SuanmingTeshu_Work ( role )
			DelBagItem( role , 3336 , 1 )	
		else
			Suanming_Work ( role )
		end
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end



--火绒

function ItemUse_HuoRongSW ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		RemoveState( role , STATE_BDJ )
		AddState ( role , role , STATE_TTISW , 1 , 300 )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	
end

--咒骨

function ItemUse_ZhouGUSW ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		RemoveState( role , STATE_ZZZH )
		AddState ( role , role , STATE_TTISW , 2 , 300 )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	
end

--水芒

function ItemUse_ShuiMangSW ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		RemoveState( role , STATE_CRXSF )
		AddState ( role , role , STATE_TTISW , 3 , 300 )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	
end

--护符

function ItemUse_HuFuSW ( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		RemoveState( role , STATE_JSDD )
		AddState ( role , role , STATE_TTISW , 4 , 1200 )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	
end
--28格背包GetKbCap
----[[28背包公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_28BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 28 then
		SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 

----[[32背包公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_32BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 32 then
		SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 24 then
		SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 
----[[36背包公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_36BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 36 then
		SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 28 then
		SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 
----[[40背包公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_40BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 40 then
		SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 32 then
		SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 
----[[44背包公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_44BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 44 then
		SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 36 then
		SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 
----[[48背包公式]]--————————————————————————————————————————————————————————————————————————————

function ItemUse_48BeiBao( role , Item ) 
	local bagnum = GetKbCap(role) 
	if bagnum >= 48 then
		SystemNotice(role ,"Cannot use item repeatedly")
		UseItemFailed ( role )
		return
	end
	if bagnum <= 40 then
		SystemNotice(role ,"Cannot use item above your level")
		UseItemFailed ( role )
		return
	end
	AddKbCap(role, 4) 
end 
----[[表情]]--------------------------------------
function ItemUse_BQ ( role , Item )

end 
----[[饲料内容]]--------------------------------------

function ItemUse_SiLiao ( role , Item , Item_Traget )
	
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end      
		local Item_Traget_URE=GetItemAttr(Item_Traget,ITEMATTR_URE)  --取当前耐久
		local Item_Traget_MAXURE=GetItemAttr(Item_Traget,ITEMATTR_MAXURE)--取最大耐久
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Num = 2500

		if Item_type == 57 and Item_Traget_Type == 59 then
				if Item_Traget_URE < Item_Traget_MAXURE then
				   Give_ElfURE ( role , Item_Traget , Num )
   	 			else
                                        SystemNotice(role , "Fairy is full" ) 
					UseItemFailed ( role )
					return
				end
		end 

end

----[[宠物饲料内容]]--------------------------------------给宠物增加少许体力

function ItemUse_CWSiLiao ( role , Item , Item_Traget )
	
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end      
		local Item_Traget_URE=GetItemAttr(Item_Traget,ITEMATTR_URE)  --取当前耐久
		local Item_Traget_MAXURE=GetItemAttr(Item_Traget,ITEMATTR_MAXURE)--取最大耐久
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Num = 250

		if Item_type == 57 and Item_Traget_Type == 59 then
				if Item_Traget_URE < Item_Traget_MAXURE then
				   Give_ElfURE ( role , Item_Traget , Num )
   	 			else
                                        SystemNotice(role , "Fairy is full" ) 
					UseItemFailed ( role )
					return
				end
		end 

end


----[[零食内容]]--------------------------------------

--圣雪山龙果
function ItemUse_LS_longguo ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
		--SystemNotice(role ,Elf_MaxEXP )

		if Item_type == 58 and Item_Traget_Type == 59 then
				Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
				if Check_Exp == 0 then
					SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
					UseItemFailed ( role )
				else
				   Lvup_Str ( role , Item_Num , Item_Traget ) --根据具体道具选择不同属性的成长函数 ( 例中为str )
				end 
		end 
end

--冰极爽口梅
function ItemUse_LS_koumei ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

		if Item_type == 58 and Item_Traget_Type == 59 then
				Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
				if Check_Exp == 0 then
					SystemNotice(role , "Growth rate is not full. Unable to feed pet with Icespire Plum" ) 
					UseItemFailed ( role )
				else
				   Lvup_Agi ( role , Item_Num , Item_Traget ) --根据具体道具选择不同属性的成长函数 ( 例中为str )
				end 
		end 
end

--海风鳕鱼丝
function ItemUse_LS_yusi ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

		if Item_type == 58 and Item_Traget_Type == 59  then
				Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
				if Check_Exp == 0 then
					SystemNotice(role , "Growth rate is not full. Unable to feed pet with Zephyr Fish Floss" ) 
					UseItemFailed ( role )
				else
				   Lvup_Dex ( role , Item_Num , Item_Traget ) --根据具体道具选择不同属性的成长函数 ( 例中为str )
				end 
		end 
end

--白银城果脯
function ItemUse_LS_guopu ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

		if Item_type == 58 and Item_Traget_Type == 59 then
				Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
				if Check_Exp == 0 then
					SystemNotice(role , "Growth rate is not full. Unable to feed pet with Argent Mango" ) 
					UseItemFailed ( role )
				else
				   Lvup_Con ( role , Item_Num , Item_Traget ) --根据具体道具选择不同属性的成长函数 ( 例中为str )
				end 
		end 
end

--新沙岚米饼
function ItemUse_LS_mibing ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local Item_Num = GetItemID ( Item )
		local Check_Exp = 0
		local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

		if Item_type == 58 and Item_Traget_Type == 59  then
				Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
				if Check_Exp == 0 then
					SystemNotice(role , "Growth rate is not full. Unable to feed pet with Shaitan Biscuit" ) 
					UseItemFailed ( role )
				else
				   Lvup_Sta ( role , Item_Num , Item_Traget ) --根据具体道具选择不同属性的成长函数 ( 例中为str )
				end  
			        --local Item_MAXENERGY = Elf_MaxEXP + 20
				--SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )				
		end 
end
----------------------------------------------------
function ItemUse_HuDun_CJ ( role , Item , Item_Traget )   --初级护盾术
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 1		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end
----------------------------------------------------
function ItemUse_HuDun_ZJ ( role , Item , Item_Traget )   --中级护盾术
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 1		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end

----------------------------------------------------
function ItemUse_HuDun_GJ ( role , Item , Item_Traget )   --高级护盾术
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
--		local SkillType = 3		--要增加的 Skill 类型
--		local SkillNum = 1		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )
--
--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

--			if Check == 1 then
--				SystemNotice(role , "have target skill, usage failed" ) 
--				UseItemFailed ( role )
--			else
		        --SystemNotice( role , "AddElfSkill" )

--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )
--			end
--		end

end


----------------------------------------------------
function ItemUse_BaoJi_CJ ( role , Item , Item_Traget )   --初级暴击
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 2		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end

----------------------------------------------------
function ItemUse_BaoJi_ZJ ( role , Item , Item_Traget )   --中级暴击
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 2		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end


----------------------------------------------------
function ItemUse_BaoJi_GJ ( role , Item , Item_Traget )   --高级暴击
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
--		local SkillType = 3		--要增加的 Skill 类型
--		local SkillNum = 2		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
--
--			if Check == 1 then
--				SystemNotice(role , "have target skill, usage failed" ) 
--				UseItemFailed ( role )
--			else
--		       -- SystemNotice( role , "AddElfSkill" )
--
--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
--		        --SystemNotice( role , "skill has been added" )
--
--			end
--		end
--
end


----------------------------------------------------
function ItemUse_MoLi_CJ ( role , Item , Item_Traget )   --初级魔力
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 3		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end


----------------------------------------------------
function ItemUse_MoLi_ZJ ( role , Item , Item_Traget )   --中级魔力
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 3		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end

----------------------------------------------------
function ItemUse_MoLi_GJ ( role , Item , Item_Traget )   --高级魔力
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
--		local SkillType = 3		--要增加的 Skill 类型
--		local SkillNum = 3		--要增加的Skill 编号
--				--SystemNotice( role , SkillType )
--				--SystemNotice( role , SkillNum )
--
--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
--
--			if Check == 1 then
--				SystemNotice(role , "have target skill, usage failed" ) 
--				UseItemFailed ( role )
--			else
--		        --SystemNotice( role , "AddElfSkill" )
--
--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
--		        --SystemNotice( role , "skill has been added" )
--
--			end
--		end

end

----------------------------------------------------
function ItemUse_HuiFu_CJ ( role , Item , Item_Traget )   --初级恢复
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 4		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end

----------------------------------------------------
function ItemUse_HuiFu_ZJ ( role , Item , Item_Traget )   --中级恢复
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 4		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end


----------------------------------------------------
function ItemUse_HuiFu_GJ ( role , Item , Item_Traget )   --高级恢复
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
--		local SkillType = 3		--要增加的 Skill 类型
--		local SkillNum = 4		--要增加的Skill 编号
--				--SystemNotice( role , SkillType )
--				--SystemNotice( role , SkillNum )
--
--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
--
--			if Check == 1 then
--				SystemNotice(role , "have target skill, usage failed" ) 
--				UseItemFailed ( role )
--			else
--		        --SystemNotice( role , "AddElfSkill" )
--
--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
--		        --SystemNotice( role , "skill has been added" )

--			end
--		end

end

----------------------------------------------------
function ItemUse_ChenSi_CJ ( role , Item , Item_Traget )   --初级沉思
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 5		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end

----------------------------------------------------
function ItemUse_ChenSi_ZJ ( role , Item , Item_Traget )   --中级沉思
			--SystemNotice( role , "s" )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 5		--要增加的Skill 编号
				--SystemNotice( role , SkillType )
				--SystemNotice( role , SkillNum )

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )

			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
		        --SystemNotice( role , "AddElfSkill" )

			AddElfSkill ( Item_Traget , SkillType , SkillNum )
		        --SystemNotice( role , "skill has been added" )

			end
		end

end


----------------------------------------------------
function ItemUse_ChenSi_GJ ( role , Item , Item_Traget )   --高级沉思
			--SystemNotice( role , "s" )

--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
--	if Cha_Boat ~= nil then 
--		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
--		return 
--	end 
--		local Item_type =  GetItemType ( Item )
--		local Item_Traget_Type =  GetItemType ( Item_Traget )
--		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
--		local SkillType = 3		--要增加的 Skill 类型
--		local SkillNum = 5		--要增加的Skill 编号
--				--SystemNotice( role , SkillType )
--				--SystemNotice( role , SkillNum )
--
--		if Item_type == 58 and Item_Traget_Type == 59 then
--			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
--
--			if Check == 1 then
--				SystemNotice(role , "have target skill, usage failed" ) 
--				UseItemFailed ( role )
--			else
--		        --SystemNotice( role , "AddElfSkill" )
--
--			AddElfSkill ( Item_Traget , SkillType , SkillNum )
--		        --SystemNotice( role , "skill has been added" )
--
--			end
--		end

end

-----------------------------------------------------------
--怪物召唤

function ItemUse_MonsterSummon ( role , Item , Item_Traget )

	local Monster_GetID = {}
	Monster_GetID[1] = math.random ( 40 , 80 )
	Monster_GetID[2] = math.random ( 98 , 146 )
	Monster_GetID[3] = math.random ( 194, 241 )
	Monster_GetID[4] = math.random ( 500, 571 )
	Monster_GetID[5]= 789

	local ID_Get = math.random ( 1 , 5 )
	local x, y = GetChaPos( role )
	local MonsterID = Monster_GetID [ ID_Get ]
	local Refresh = 50					--重生时间，秒单位
	local life = 40000					--生命时间，毫秒单位
	local new = CreateCha( MonsterID , x , y , 145 , Refresh )
	SetChaLifeTime( new, life )

end


----------------------------------------------------------

--除草剂
function ItemUse_Ant_Hzcr ( role , Item , Item_Traget )

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		RemoveState( Cha_Boat , STATE_HZCR )
	else
		SystemNotice( role , "Unable to use on the shore" )
		UseItemFailed ( role )
		return
	end

end


--命之精灵蛋

function ItemUse_MINGZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 183  , 1 , 4 ) 
end

--罚之精灵蛋

function ItemUse_FAZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 184  , 1 , 4 ) 
end

--谦之精灵蛋

function ItemUse_QIANZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 185  , 1 , 4 ) 
end

--恒之精灵蛋

function ItemUse_HENGZJLD( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 186  , 1 , 4 )  
end

--誉之精灵蛋

function ItemUse_YUZJLD( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 187  , 1 , 4 )  
end
--血之精灵蛋

function ItemUse_XUEZJLD( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 188  , 1 , 4 )  
end

--信之精灵蛋

function ItemUse_XINGZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 189  , 1 , 4 )  
end

--悔之精灵蛋

function ItemUse_HUIZJLD( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 190  , 1 , 4 )  

end

--爱之精灵蛋

function ItemUse_AIZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 191  , 1 , 4 )  
end

--心之精灵蛋

function ItemUse_XINGZHIJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end

	GiveItem ( role , 0 , 199  , 1 , 4 )  
end
-------------------------------新人宝箱
function ItemUse_XRBOX( role, Item )
--	SystemNotice(role ,"Function has not been released")
--	UseItemFailed ( role )
--	return
	local lv = GetChaAttr(role, ATTR_LV)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Newbie Chest requires 4 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 5 then
		SystemNotice(role ,"Currently lower than Lv 5. Unable to use item!")
		UseItemFailed ( role )	
	else
		GiveItem ( role , 0 , 437  , 1 , 4 )
		GiveItem ( role , 0 , 9  , 1 , 95 )
		GiveItem ( role , 0 , 4308  , 1 , 95 )
		GiveItem ( role , 0 , 444  , 1 , 4 )
	--	GiveItem ( role , 0 , 0985  , 1 , 4 )--------------35至尊豪礼
	end
end


-------------------------------35至尊宝箱------------10级
function ItemUse_SANWUBOX( role, Item )

	local lv = GetChaAttr(role, ATTR_LV)
	local job = GetChaAttr( role, ATTR_JOB) --取职业
	local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Newbie Chest requires 4 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 10 then
		SystemNotice(role ,"Currently lower than Lv 10. Unable to use item!")
		UseItemFailed ( role )
		return
	end
	if cha_type ~= 2 and job==4 then
		GiveItem ( role , 0 , 0803 , 1 , 4 )--------------海妖披风		
		GiveItem ( role , 0 , 0986 , 1 , 4 )--------------45至尊宝箱
	elseif cha_type ~= 2 and job==16 then
		GiveItem ( role , 0 , 0803 , 1 , 4 )--------------海妖披风		
		GiveItem ( role , 0 , 0986 , 1 , 4 )--------------45至尊宝箱
	elseif cha_type == 2  and job~=0 then
		GiveItem ( role , 0 , 0763  , 1 , 4 )----------------幽灵铠甲
		GiveItem ( role , 0 , 0986  , 1 , 4 )--------------45至尊宝箱
	elseif cha_type ~= 2 and  cha_type ~= 4 and job==2 then
		GiveItem ( role , 0 , 0777  , 1 , 4 )-----------------亡灵短袍
		GiveItem ( role , 0 , 0986  , 1 , 4 )--------------45至尊宝箱
	elseif cha_type ~= 2 and  cha_type ~= 4 and job==12 then
		GiveItem ( role , 0 , 0777  , 1 , 4 )-----------------亡灵短袍
		GiveItem ( role , 0 , 0986  , 1 , 4 )--------------45至尊宝箱
	elseif cha_type ~= 1 and  cha_type ~= 2 and job==5 then
	        GiveItem ( role , 0 , 0789  , 1 , 4 )-------------巫毒法袍
		GiveItem ( role , 0 , 0986  , 1 , 4 )--------------45至尊宝箱
	elseif cha_type ~= 1 and  cha_type ~= 2 and job==13 then
	        GiveItem ( role , 0 , 0789  , 1 , 4 )-------------巫毒法袍
		GiveItem ( role , 0 , 0986  , 1 , 4 )--------------45至尊宝箱
	elseif cha_type ~= 1 and  cha_type ~= 2 and job==14 then
	        GiveItem ( role , 0 , 0789  , 1 , 4 )-------------巫毒法袍
		GiveItem ( role , 0 , 0986  , 1 , 4 )--------------45至尊宝箱
	elseif cha_type == 1 and  job==1 then
	        GiveItem ( role , 0 , 1928  , 1 , 4 )-------------大地战甲
		GiveItem ( role , 0 , 0986  , 1 , 4 )--------------45至尊宝箱
	else 
		SystemNotice(role ,"Cannot be used right now, please find the class instructors to change class.")
		UseItemFailed ( role )
		return
	end
end


-------------------------------45至尊宝箱-----------35级
function ItemUse_SIWUBOX( role, Item )

	local lv = GetChaAttr(role, ATTR_LV)
	local job = GetChaAttr( role, ATTR_JOB) --取职业
	local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Newbie Chest requires 4 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 35 then
		SystemNotice(role ,"Currently lower than Lv 35. Unable to use item!")
		UseItemFailed ( role )
		return
	end
	if cha_type == 1 and job==9 then
		GiveItem ( role , 0 , 0767 , 1 , 4 )----------------诅咒之灵钢甲	
		GiveItem ( role , 0 , 0987 , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 2 and job==8 then
		GiveItem ( role , 0 , 0764  , 1 , 4 )-----------------武士之诅咒纹身
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 1 and job==12 then
		GiveItem ( role , 0 , 778  , 1 , 4 )-------------咒纹紧身衣
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 3 and job==12 then
		GiveItem ( role , 0 , 778  , 1 , 4 )-------------咒纹紧身衣
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 4 and job==13 then
		GiveItem ( role , 0 , 0790  , 1 , 4 )-------------符文外衣
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 3  and job==13 then
		GiveItem ( role , 0 , 0790  , 1 , 4 )-------------符文外衣
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 3  and job==14 then
		GiveItem ( role , 0 , 0796  , 1 , 4 )-------------咒文之袍
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 4 and job==14 then
		GiveItem ( role , 0 , 0796  , 1 , 4 )-------------咒文之袍
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 3 and job==16 then
		GiveItem ( role , 0 , 0804  , 1 , 4 )-------------咒火斗篷
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type == 1 and job==16 then
		GiveItem ( role , 0 , 0804  , 1 , 4 )-------------咒火斗篷
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	elseif cha_type ==4 and job==16 then
		GiveItem ( role , 0 , 0804  , 1 , 4 )-------------咒火斗篷
		GiveItem ( role , 0 , 0987  , 1 , 4 )--------------55至尊宝箱
	else 
		SystemNotice(role ,"Cannot be used right now, please find the class instructors to change class.")
		UseItemFailed ( role )
		return
	end
end

-------------------------------55至尊宝箱-----------45级
function ItemUse_WUWUBOX( role, Item )

	local lv = GetChaAttr(role, ATTR_LV)
	local job = GetChaAttr( role, ATTR_JOB) --取职业
	local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Newbie Chest requires 4 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 45 then
		SystemNotice(role ,"Current level is below 45, failed to use item!")
		UseItemFailed ( role )
		return
	end
	if cha_type == 1 and job==9 then
		GiveItem ( role , 0 , 0768 , 1 , 4 )----------------幻灵战甲		
		GiveItem ( role , 0 , 0988 , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 2 and job==8 then
		GiveItem ( role , 0 , 0765  , 1 , 4 )-----------------幻灵纹身
		GiveItem ( role , 0 , 0988  , 1 , 4 )-------------65至尊宝箱
	elseif cha_type == 3 and job==12 then
		GiveItem ( role , 0 , 0779  , 1 , 4 )----------------幻灵外套
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 1 and job==12 then
		GiveItem ( role , 0 , 0779  , 1 , 4 )----------------幻灵外套
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 3 and job==13 then
	        GiveItem ( role , 0 , 0791  , 1 , 4 )----------------幻法之袍
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 4 and job==13 then
	        GiveItem ( role , 0 , 0791  , 1 , 4 )----------------幻法之袍
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 3 and job==14 then
	        GiveItem ( role , 0 , 0797  , 1 , 4 )----------------幻咒之袍
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 4 and job==14 then
	        GiveItem ( role , 0 , 0797  , 1 , 4 )----------------幻咒之袍
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 1 and job==16 then
	        GiveItem ( role , 0 , 0805  , 1 , 4 )----------------幻灵披风
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 3 and job==16 then
	        GiveItem ( role , 0 , 0805  , 1 , 4 )----------------幻灵披风
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	elseif cha_type == 4 and job==16 then
	        GiveItem ( role , 0 , 0805  , 1 , 4 )----------------幻灵披风
		GiveItem ( role , 0 , 0988  , 1 , 4 )--------------65至尊宝箱
	else 
		SystemNotice(role ,"Cannot be used right now, please find the class instructors to change class.")
		UseItemFailed ( role )
		return
	end
end

-------------------------------65至尊宝箱-----------55级
function ItemUse_LIUWUBOX( role, Item )

	local lv = GetChaAttr(role, ATTR_LV)
	local job = GetChaAttr( role, ATTR_JOB) --取职业
	local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Newbie Chest requires 4 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 55 then
		SystemNotice(role ,"Current level below 55, unable to use item!")
		UseItemFailed ( role )
		return
	end
	if cha_type == 1 and job==9 then
		GiveItem ( role , 0 , 0769 , 1 , 4 )----------------迷之战甲		
	elseif cha_type == 2 and job==8 then
		GiveItem ( role , 0 , 0766  , 1 , 4 )-----------------迷之纹身
	elseif cha_type == 3 and job==12 then
		GiveItem ( role , 0 , 0780  , 1 , 4 )----------------迷之斗篷
	elseif cha_type == 1 and job==12 then
		GiveItem ( role , 0 , 0780  , 1 , 4 )----------------迷之斗篷
	elseif cha_type == 3 and job==13 then
	        GiveItem ( role , 0 , 0792  , 1 , 4 )----------------迷之法袍
	elseif cha_type == 4 and job==13 then
	        GiveItem ( role , 0 , 0792  , 1 , 4 )----------------迷之法袍
	elseif cha_type == 3 and job==14 then
	        GiveItem ( role , 0 , 0798  , 1 , 4 )----------------迷咒法袍
	elseif cha_type == 4 and job==14 then
	        GiveItem ( role , 0 , 0798  , 1 , 4 )----------------迷咒法袍
	elseif cha_type == 1 and job==16 then
	        GiveItem ( role , 0 , 0806  , 1 , 4 )----------------迷幻斗篷
	elseif cha_type == 3 and job==16 then
	        GiveItem ( role , 0 , 0806  , 1 , 4 )----------------迷幻斗篷
	elseif cha_type == 4 and job==16 then
	        GiveItem ( role , 0 , 0806  , 1 , 4 )----------------迷幻斗篷
	else 
		SystemNotice(role ,"Cannot be used right now, please find the class instructors to change class.")
		UseItemFailed ( role )
		return
	end
end


----------------------------------+1新人宝箱
function ItemUse_XRBOX1( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 7 then
		SystemNotice(role ,"To open a Newbie Chest requires 7 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 10 then
		SystemNotice(role ,"Currently lower than Lv 10. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 438  , 1 , 4 ) 
		GiveItem ( role , 0 , 10  , 1 , 95 ) 
		GiveItem ( role , 0 , 296  , 1 , 95 )
		GiveItem ( role , 0 , 4602  , 1 , 4 )
		GiveItem ( role , 0 , 4603  , 1 , 4 )
		GiveItem ( role , 0 , 4604  , 1 , 4 )
		GiveItem ( role , 0 , 445  , 1 , 4 ) 
	elseif job == 2 then   
		GiveItem ( role , 0 , 438  , 1 , 4 ) 
		GiveItem ( role , 0 , 32  , 1 , 95 ) 
		GiveItem ( role , 0 , 311  , 1 , 95 )
		GiveItem ( role , 0 , 4602  , 1 , 4 )
		GiveItem ( role , 0 , 4603  , 1 , 4 )
		GiveItem ( role , 0 , 4604  , 1 , 4 )
		GiveItem ( role , 0 , 445  , 1 , 4 ) 
	elseif job == 4 then  
		GiveItem ( role , 0 , 4602  , 1 , 4 )
		GiveItem ( role , 0 , 4603  , 1 , 4 )
		GiveItem ( role , 0 , 4604  , 1 , 4 )
		GiveItem ( role , 0 , 445  , 1 , 4 ) 
		GiveItem ( role , 0 , 438  , 1 , 4 ) 
		GiveItem ( role , 0 , 80  , 1 , 95 ) 
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 336  , 1 , 95 ) 
		else 
			GiveItem ( role , 0 , 351  , 1 , 95 ) 
		end
	elseif job == 5 then   
		GiveItem ( role , 0 , 4602  , 1 , 4 ) 
		GiveItem ( role , 0 , 4603  , 1 , 4 ) 
		GiveItem ( role , 0 , 4604  , 1 , 4 ) 
		GiveItem ( role , 0 , 445  , 1 , 4 ) 
		GiveItem ( role , 0 , 438  , 1 , 4 ) 
		GiveItem ( role , 0 , 104  , 1 , 95 ) 
		if cha_type == 3 then 
			GiveItem ( role , 0 , 372  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 359  , 1 , 95 ) 
		end
	else 
		SystemNotice(role ,"Class mismatch. Item can only be used after basic class selection!")
		UseItemFailed ( role )	
	end
end
----------------------------------+2新人宝箱
function ItemUse_XRBOX2( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 6 then
		SystemNotice(role ,"To open a Newbie Chest requires 6 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 15 then
		SystemNotice(role ,"Currently lower than Lv 15. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 2  , 1 , 95 ) 
		GiveItem ( role , 0 , 291  , 1 , 95 )
		GiveItem ( role , 0 , 4264  , 1 , 4 )
		GiveItem ( role , 0 , 3351  , 1 , 4 )
		GiveItem ( role , 0 , 446  , 1 , 4 ) 
		GiveItem ( role , 0 , 439  , 1 , 4 ) 
	elseif job == 2 then   
		GiveItem ( role , 0 , 26  , 1 , 95 ) 
		GiveItem ( role , 0 , 306  , 1 , 95 )
		GiveItem ( role , 0 , 4264  , 1 , 4 )
		GiveItem ( role , 0 , 3352  , 1 , 4 )
		GiveItem ( role , 0 , 446  , 1 , 4 ) 
		GiveItem ( role , 0 , 439  , 1 , 4 ) 
	elseif job == 4 then  
		GiveItem ( role , 0 , 4264  , 1 , 4 )
		GiveItem ( role , 0 , 3353  , 1 , 4 )
		GiveItem ( role , 0 , 446  , 1 , 4 ) 
		GiveItem ( role , 0 , 74  , 1 , 95 ) 
		GiveItem ( role , 0 , 439  , 1 , 4 ) 
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 338  , 1 , 95 )
		else
			GiveItem ( role , 0 , 386  , 1 , 95 ) 
		end
	elseif job == 5 then
		GiveItem ( role , 0 , 4264  , 1 , 4 )
		GiveItem ( role , 0 , 3352  , 1 , 4 )
		GiveItem ( role , 0 , 446  , 1 , 4 ) 
		GiveItem ( role , 0 , 439  , 1 , 4 ) 
		GiveItem ( role , 0 , 98  , 1 , 95 ) 
		if cha_type == 3 then 
			GiveItem ( role , 0 , 366  , 1 , 95 ) 
		else 
			GiveItem ( role , 0 , 381  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"Class mismatch. Item can only be used after basic class selection!")
		UseItemFailed ( role )	
	end
end
----------------------------------+3新人宝箱
function ItemUse_XRBOX3( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 5 then
		SystemNotice(role ,"To open a Newbie Chest requires 5 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 20 then
		SystemNotice(role ,"Currently lower than Lv 20. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 14  , 1 , 95 ) 
		GiveItem ( role , 0 , 297  , 1 , 95 )
		GiveItem ( role , 0 , 3844  , 1 , 4 )
		GiveItem ( role , 0 , 447  , 1 , 4 ) 
		GiveItem ( role , 0 , 440  , 1 , 4 ) 
	elseif job == 2 then  
		GiveItem ( role , 0 , 33  , 1 , 95 ) 
		GiveItem ( role , 0 , 313  , 1 , 95 )
		GiveItem ( role , 0 , 3844  , 1 , 4 )
		GiveItem ( role , 0 , 447  , 1 , 4 ) 
		GiveItem ( role , 0 , 440  , 1 , 4 ) 
	elseif job == 4 then  
		GiveItem ( role , 0 , 3844  , 1 , 4 )
		GiveItem ( role , 0 , 447  , 1 , 4 ) 
		GiveItem ( role , 0 , 440  , 1 , 4 ) 
		GiveItem ( role , 0 , 81  , 1 , 95 ) 
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 337  , 1 , 95 )
		else
			GiveItem ( role , 0 , 352  , 1 , 95 ) 
		end
	elseif job == 5 then 
		GiveItem ( role , 0 , 3844  , 1 , 4 )
		GiveItem ( role , 0 , 447  , 1 , 4 ) 
		GiveItem ( role , 0 , 440  , 1 , 4 ) 
		GiveItem ( role , 0 , 105  , 1 , 95 )
		if cha_type == 3 then 
			GiveItem ( role , 0 , 373  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 360  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"Class mismatch. Item can only be used after basic class selection!")
		UseItemFailed ( role )	
	end
end
----------------------------------+4新人宝箱
function ItemUse_XRBOX4( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	--local r1,r2 =MakeItem ( role , 0 , 3  , 1 , 11 )

	if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Newbie Chest requires 4 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 25 then
		SystemNotice(role ,"Currently lower than Lv 25. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 1 then   ----剑士
		local r1,r2 =MakeItem ( role , 3  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
		GiveItem ( role , 0 , 293  , 1 , 95 )
		GiveItem ( role , 0 , 448  , 1 , 95 )
		GiveItem ( role , 0 , 441  , 1 , 4 ) 
	elseif job == 2 then  
		local r1,r2 =MakeItem ( role , 27  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
		GiveItem ( role , 0 , 307  , 1 , 95 )
		GiveItem ( role , 0 , 448  , 1 , 95 )
		GiveItem ( role , 0 , 441  , 1 , 4 ) 
	elseif job == 4 then 
		GiveItem ( role , 0 , 448  , 1 , 95 )
		GiveItem ( role , 0 , 441  , 1 , 4 ) 
		local r1,r2 =MakeItem ( role , 75  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
		if cha_type == 1 or cha_type == 3 then
			GiveItem ( role , 0 , 340  , 1 , 95 ) 
		else
			GiveItem ( role , 0 , 350  , 1 , 95 ) 
		end
	elseif job == 5 then 
		GiveItem ( role , 0 , 448  , 1 , 95 )
		GiveItem ( role , 0 , 441  , 1 , 4 ) 
		local r1,r2 =MakeItem ( role , 99  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
		if cha_type == 3 then
			GiveItem ( role , 0 , 368  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 389  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"Class mismatch. Item can only be used after basic class selection!")
		UseItemFailed ( role )	
	end
end
----------------------------------+5新人宝箱
function ItemUse_XRBOX5( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Newbie Chest requires 4 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 30 then
		SystemNotice(role ,"Currently lower than Lv 30. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 1 then  
		GiveItem ( role , 0 , 12  , 1 , 95 ) 
		GiveItem ( role , 0 , 298  , 1 , 95 )
		GiveItem ( role , 0 , 449  , 1 , 95 )
		GiveItem ( role , 0 , 442  , 1 , 4 ) 
	elseif job == 2 then 
		GiveItem ( role , 0 , 34  , 1 , 95 ) 
		GiveItem ( role , 0 , 314  , 1 , 95 )
		GiveItem ( role , 0 , 449  , 1 , 95 )
		GiveItem ( role , 0 , 442  , 1 , 4 ) 
	elseif job == 4 then  
		GiveItem ( role , 0 , 449  , 1 , 95 )
		GiveItem ( role , 0 , 442  , 1 , 4 )
		GiveItem ( role , 0 , 82  , 1 , 95 )
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 339  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 354  , 1 , 95 ) 
		end
	elseif job == 5 then
		GiveItem ( role , 0 , 449  , 1 , 95 )
		GiveItem ( role , 0 , 442  , 1 , 4 ) 
		GiveItem ( role , 0 , 106  , 1 , 95 )
		if cha_type == 3 then
			GiveItem ( role , 0 , 374  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 361  , 1 , 95 )
		end
	else 
		SystemNotice(role ,"Class mismatch. Item can only be used after basic class selection!")
		UseItemFailed ( role )	
	end
end
----------------------------------+6新人宝箱
function ItemUse_XRBOX6( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 2 then
		SystemNotice(role ,"To open a Newbie Chest requires 2 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 35 then
		SystemNotice(role ,"Currently lower than Lv 35. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 1 or job == 2 or job == 4 or job == 5 then
		GiveItem ( role , 0 , 443  , 1 , 4 ) 
		GiveItem ( role , 0 , 451  , 1 , 4 ) 
		AddMoney ( role , 0 , 20000 ) 
	else 
		SystemNotice(role ,"Class mismatch. Item can only be used after basic class selection!")
		UseItemFailed ( role )	
	end
end
----------------------------------+7新人宝箱
function ItemUse_XRBOX7( role, Item )
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
        local cha_type = GetChaTypeID ( role )
        local cha_type = GetChaTypeID ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 5 then
		SystemNotice(role ,"To open a Newbie Chest requires 5 empty slots")
		UseItemFailed ( role )
		return
	end
	if lv < 40 then
		SystemNotice(role ,"Currently lower than Lv 40. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 9 then 
		GiveItem ( role , 0 , 450  , 1 , 4 ) 
		GiveItem ( role , 0 , 295  , 1 , 95 )
		GiveItem ( role , 0 , 4  , 1 , 95 ) 
		GiveItem ( role , 0 , 302  , 1 , 95 )
		local r1,r2 =MakeItem ( role , 22  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
	elseif job == 8 then   
		GiveItem ( role , 0 , 450  , 1 , 4 ) 
		GiveItem ( role , 0 , 300  , 1 , 95 )
		GiveItem ( role , 0 , 15  , 1 , 95 ) 
		GiveItem ( role , 0 , 301  , 1 , 95 )
		local r1,r2 =MakeItem ( role , 20  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
	elseif job == 12 then 
		GiveItem ( role , 0 , 39  , 1 , 95 ) 
		GiveItem ( role , 0 , 310  , 1 , 95 )
		local r1,r2 =MakeItem ( role , 44  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
		GiveItem ( role , 0 , 315  , 1 , 95 )
		GiveItem ( role , 0 , 450  , 1 , 4 ) 
	elseif job == 16 then 
		GiveItem ( role , 0 , 450  , 1 , 95 )
		GiveItem ( role , 0 , 76  , 1 , 95 ) 
		local r1,r2 =MakeItem ( role , 83  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
		if cha_type == 1 or cha_type == 3 then 
			GiveItem ( role , 0 , 341  , 1 , 95 )
			GiveItem ( role , 0 , 342  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 353  , 1 , 95 )
			GiveItem ( role , 0 , 356  , 1 , 95 )
		end
	elseif job == 13 then    
		GiveItem ( role , 0 , 450  , 1 , 4 ) 
		GiveItem ( role , 0 , 100  , 1 , 95 )
		local r1,r2 =MakeItem ( role , 1440  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
		if cha_type == 3 then 
			GiveItem ( role , 0 , 370  , 1 , 95 )
			GiveItem ( role , 0 , 378  , 1 , 95 )
		else 
			GiveItem ( role , 0 , 392  , 1 , 95 ) 
			GiveItem ( role , 0 , 388  , 1 , 95 ) 
		end
	elseif job == 14 then    
		GiveItem ( role , 0 , 450  , 1 , 4 ) 
		GiveItem ( role , 0 , 101  , 1 , 95 ) 
		local r1,r2 =MakeItem ( role , 107  , 1 , 11 )
		local Item1 = GetChaItem ( role , 2 , r2 )			--取精炼武器道具指针
		if cha_type == 3 then 
			GiveItem ( role , 0 , 367  , 1 , 95 ) 
			GiveItem ( role , 0 , 375  , 1 , 95 ) 
		else  
			GiveItem ( role , 0 , 390  , 1 , 95 ) 
			GiveItem ( role , 0 , 362  , 1 , 95 ) 
		
		end
	else 
		SystemNotice(role ,"Class mismatch. Item can only be used after second class advancement!")
		UseItemFailed ( role )	
	end
end
-------------------------------------------------------- --[[粽子公式]]--
function ItemUse_ZhongZi ( role , Item ) 
	local hp = GetChaAttr(role, ATTR_HP)  
	if hp <= 0 then   
	end 
	hp_resume = 1000   
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大hp时返回为最大hp
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP) 
end 
------------------------------------------------------------ --[[雄黄酒公式]]--
function ItemUse_XiongHJ ( role , Item ) 
	local statelv = 1
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_PKSFYS , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end 
---------------------------------------------------------- --[[艾草公式]]--
function ItemUse_AiCao ( role , Item )  
	local statelv = 1
	local statetime = 180
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_PKSBYS , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end 



------------------------------------------- 风雷宝箱
function ItemUse_FLeiBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local BNUM = B1+B2+B3+B4+B5+B6+B7+B8+B9+B10+B11+B12+B13+B14+B15
	if Item_CanGet < BNUM then
		SystemNotice(role ,"To open a Tempest Chest requires"..BNUM.."space ")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , A1 , B1 , 4 )
	GiveItem ( role , 0 , A2 , B2 , 4 )
	GiveItem ( role , 0 , A3 , B3 , 4 )
	GiveItem ( role , 0 , A4 , B4 , 4 )
	GiveItem ( role , 0 , A5 , B5 , 4 )
	GiveItem ( role , 0 , A6 , B6 , 4 )
	GiveItem ( role , 0 , A7 , B7 , 4 )
	GiveItem ( role , 0 , A8 , B8 , 4 )
	GiveItem ( role , 0 , A9 , B9 , 4 )
	GiveItem ( role , 0 , A10 , B10 , 4 )
	GiveItem ( role , 0 , A11 , B11 , 4 )
	GiveItem ( role , 0 , A12 , B12 , 4 )
	GiveItem ( role , 0 , A13 , B13 , 4 )
	GiveItem ( role , 0 , A14 , B14 , 4 )
	GiveItem ( role , 0 , A15 , B15 , 4 )
	GiveItem ( role , 0 , A16 , B16 , 4 )
	GiveItem ( role , 0 , A17 , B17 , 4 )
	GiveItem ( role , 0 , A18 , B18 , 4 )
	GiveItem ( role , 0 , A19 , B19 , 4 )
	GiveItem ( role , 0 , A20 , B20 , 4 )
	GiveItem ( role , 0 , A21 , B21 , 4 )
	GiveItem ( role , 0 , A22 , B22 , 4 )
	GiveItem ( role , 0 , A23 , B23 , 4 )
	GiveItem ( role , 0 , A24 , B24 , 4 )
end
	 
----------------------------------------------超级宠物宝箱
function ItemUse_CJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <1 then
		SystemNotice(role ,"To open a Chest requires 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local r1,r2 =MakeItem ( role , C1  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	local Item_newJLID = GetItemID ( Item_newJL )			--取新精灵道具指针


	local str_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_STR )       --力量
	local con_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_CON )       --体质
	local agi_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_AGI )       --专注
	local dex_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_DEX )       --敏捷
	local sta_JLone = GetItemAttr( Item_newJL ,ITEMATTR_VAL_STA )       --精神

	local Num_JL = GetItemForgeParam ( Item_newJL , 1 )
	Num_JL = TansferNum ( Num_JL )
	local Part1_JL = GetNum_Part1 ( Num_JL )	--Get Num Part 1 到 Part 7
	local Part2_JL = GetNum_Part2 ( Num_JL )	
	local Part3_JL = GetNum_Part3 ( Num_JL )
	local Part4_JL = GetNum_Part4 ( Num_JL )
	local Part5_JL = GetNum_Part5 ( Num_JL )
	local Part6_JL = GetNum_Part6 ( Num_JL )
	local Part7_JL = GetNum_Part7 ( Num_JL )
	if Item_newJLID==231 or Item_newJLID==232 or Item_newJLID==233 or Item_newJLID==234 or Item_newJLID==235  or Item_newJLID==236  or Item_newJLID==237  or Item_newJLID==681 then
		Part1_JL=1
		Num_JL = SetNum_Part1 ( Num_JL , 1 ) ----------二转标记
		SetItemForgeParam ( Item_newJL , 1 , Num_JL )
	end
	str_JLone	= N1
	con_JLone = N2
	agi_JLone	= N3
	dex_JLone = N4
	sta_JLone	= N5
	local new_lv=N1+N2+N3+N4+N5
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		new_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		new_MAXURE = 32000
	end
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_STR , str_JLone )
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_CON , con_JLone )
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_AGI , agi_JLone )
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_DEX , dex_JLone)
	SetItemAttr ( Item_newJL ,ITEMATTR_VAL_STA , sta_JLone)
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
	SetItemAttr ( Item_newJL , ITEMATTR_ENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_URE , new_MAXURE )
	local cha_name = GetChaDefaultName ( role )
	--LG( "star_JLZS_lg" ,cha_name,Item_JLone_ID , lv_JLone , str_JLone , con_JLone , agi_JLone , dex_JLone , sta_JLone , Item_JLother_ID , lv_JLother  , str_JLother , con_JLother , agi_JLother , dex_JLother , sta_JLother )
	LG( "star_CJBOX" ,cha_name, C1 , N1 , N2 ,  N3 , N4 , N5 )

end

----------------------------------------------勇者宝箱
function ItemUse_YZheBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 8 then
		SystemNotice(role ,"To open a Champion's Chest requires 8 empty slots")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 453 , 1 , 4 )
	GiveItem ( role , 0 , 454 , 1 , 4 )
	GiveItem ( role , 0 , 455 , 1 , 4 )
	GiveItem ( role , 0 , 456 , 1 , 4 )
	local rad = math.random ( 1, 8 )
	if rad == 1 then
	GiveItem ( role , 0 , 5013  , 1 , 4 ) 
	GiveItem ( role , 0 , 5021  , 1 , 4 ) 
	GiveItem ( role , 0 , 5029  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 5014  , 1 , 4 ) 
	GiveItem ( role , 0 , 5022  , 1 , 4 ) 
	GiveItem ( role , 0 , 5030  , 1 , 4 ) 
	elseif rad == 3 then
	GiveItem ( role , 0 , 5015  , 1 , 4 ) 
	GiveItem ( role , 0 , 5023  , 1 , 4 ) 
	GiveItem ( role , 0 , 5031  , 1 , 4 ) 
	elseif rad == 4 then
	GiveItem ( role , 0 , 5016  , 1 , 4 ) 
	GiveItem ( role , 0 , 5024  , 1 , 4 ) 
	GiveItem ( role , 0 , 5032  , 1 , 4 ) 
	GiveItem ( role , 0 , 5037  , 1 , 4 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 5017  , 1 , 4 ) 
	GiveItem ( role , 0 , 5025  , 1 , 4 ) 
	GiveItem ( role , 0 , 5033  , 1 , 4 )
	elseif rad == 6 then
	GiveItem ( role , 0 , 5018  , 1 , 4 ) 
	GiveItem ( role , 0 , 5026  , 1 , 4 ) 
	GiveItem ( role , 0 , 5034  , 1 , 4 )
	elseif rad == 7 then
	GiveItem ( role , 0 , 5019  , 1 , 4 ) 
	GiveItem ( role , 0 , 5027  , 1 , 4 ) 
	GiveItem ( role , 0 , 5035  , 1 , 4 )
	elseif rad == 8 then
	GiveItem ( role , 0 , 5020  , 1 , 4 ) 
	GiveItem ( role , 0 , 5028  , 1 , 4 ) 
	GiveItem ( role , 0 , 5036  , 1 , 4 )
	GiveItem ( role , 0 , 5038  , 1 , 4 )
	end
end

----------------------------------------努力增幅器
function ItemUse_MoreExpGzA( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
end

----------------------------------------高级努力增幅器
function ItemUse_MoreExpGzLv3A( role , Item )
	local Lv = Lv( role )
	if Lv < 60 then
		SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 3
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"Feel the effect of Hi-Amplifier of Strive" )
end


--ItemUse_MoreItemGz
-------------------------------财富增幅器
function ItemUse_MoreItemGzA( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
end

----------------------------------------高级财富增幅器
function ItemUse_MoreItemGzLv3A( role , Item )
	local Lv = Lv( role )
	if Lv < 60 then
		SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end


	local statelv = 3	
	
	local ChaStateLv = GetChaStateLv ( role , STATE_SBBLGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBBLGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBBLGZ , statelv , statetime )
	end
	SystemNotice ( role ,"Feels the effect of Hi-Amplifier of Luck" )
end
-------------------------------------强力体力恢复剂
function ItemUse_TLHFJA( role , Item )
	local hp = GetChaAttr(role, ATTR_HP) 
	hp_resume = 1000 
	
	hp = hp + hp_resume 
	mxhp = GetChaAttr(role,ATTR_MXHP) 
	if hp > mxhp then --加超过最大sp时返回为最大sp
		hp = mxhp 
	end 
	SetCharaAttr(hp, role, ATTR_HP)
end
------------------------------------SP神仙水
function ItemUse_TMLGZA( role , Item ) 
	local sp = GetChaAttr(role, ATTR_SP) 
	sp_resume = 150 
	
	sp = sp + sp_resume 
	mxsp = GetChaAttr(role,ATTR_MXSP) 
	if sp > mxsp then --加超过最大sp时返回为最大sp
		sp = mxsp 
	end 
	SetCharaAttr(sp, role, ATTR_SP) 
end 
---------------------------------------------雄狮模拟药剂( str )
function ItemUse_SPXsyjA( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSTZQH )
	State [3] = GetChaStateLv ( role , STATE_YSJSQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end	

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSLLQH , statelv , statetime )

end
-----------------------------------------------灵猴模拟药剂( agi )
function ItemUse_SPLhyjA( role , Item )
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSLQQH )
	State [1] = GetChaStateLv ( role , STATE_YSTZQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end
	
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSMJQH , statelv , statetime )

end

------------------------------------------------鹰眼模拟药剂( dex )
function ItemUse_SPYyyjA( role , Item )
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSTZQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSLQQH , statelv , statetime )

end

-----------------------------------------------------蛮牛模拟药剂( con )
function ItemUse_SPMnyjA( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSJSQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end



	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSTZQH , statelv , statetime )

end

------------------------------------------------圣灵模拟药剂( sta )
function ItemUse_SPSlyjA( role , Item )
	
	local OtherStateLv = 0
	local i = 0
	local State_Num = 3
	local State = {}
	State [0] = GetChaStateLv ( role , STATE_YSMJQH )
	State [1] = GetChaStateLv ( role , STATE_YSLQQH )
	State [2] = GetChaStateLv ( role , STATE_YSTZQH )
	State [3] = GetChaStateLv ( role , STATE_YSLLQH )

	for i = 0 , State_Num , 1 do
		if State[i] >= 1 then
			OtherStateLv = OtherStateLv + 1
		end
	end


	if OtherStateLv > 0 then
		SystemNotice(role ,"Potions effect for attribute bonus cannot be stacked")
		UseItemFailed ( role )
		return
	end

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end


	local statelv = 1
	local statetime = 5400
	AddState( role , role , STATE_YSJSQH , statelv , statetime )

end

--------------------------------行走润滑剂

function ItemUse_MspdYSA ( role , Item )
	local statelv = 1
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_YSMspd , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

end
--------------------------------轻装药水 大幅提高行走速度小幅降低防御的道具持续时间15分钟
function ItemUse_MspdYSB ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		Rem_State_StarUnnormal ( role )
		AddState( role , role , STATE_QINGZ , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end
-------------------------------------战船装甲
function ItemUse_GJZhuangJiaA ( role , Item )
	local statelv = 1
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~=  nil then
		AddState( Cha_Boat , Cha_Boat , STATE_YSBoatDEF , statelv , statetime )
	else
		SystemNotice( role , "Only can be used while sailing" )
		UseItemFailed ( role )
		return
	end

end
-----------------------------------元宵走马灯
function ItemUse_DenglongA ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_DENGLONG , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end
-----------------------------------全身装甲 大幅提高防御力小幅降低攻击力的道具持续时间15分钟
function ItemUse_DenglongB ( role , Item )
	local statelv = 1
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		Rem_State_StarUnnormal ( role )
		AddState( role , role , STATE_QUANS , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

--雷霆堡机票

function Jz_Script_ltcsA(role, Item )
	local i = CheckBagItem(role,3048)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3048,1)
			if j == 1 then
				MoveCity(role,"Thundoria Castle")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end



--雷霆堡军港机票
function Jz_Script_ltjgcsA(role, Item )
	local i = CheckBagItem(role,3049)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3049,1)
			if j == 1 then
				MoveCity(role,"Thundoria Harbor")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end


--圣雪山机票

function Jz_Script_sxscsA(role, Item )
	local i = CheckBagItem(role,3050)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3050,1)
			if j == 1 then
				MoveCity(role,"Sacred Snow Mountain")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--赖安森林补给站机票

function Jz_Script_laslcsA(role, Item )
	local i = CheckBagItem(role,3051)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3051,1)
			if j == 1 then
				MoveCity(role,"Andes Forest Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--沙泉补给站机票
function Jz_Script_sqcsA(role, Item )
	local i = CheckBagItem(role,3052)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3052,1)
			if j == 1 then
				MoveCity(role,"Oasis Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--冰极补给站机票

function Jz_Script_bjcsA(role, Item )
	local i = CheckBagItem(role,3053)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3053,1)
			if j == 1 then
				MoveCity(role,"Icespire Haven")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--寂寞之塔入口机票

function Jz_Script_jmztcsA(role, Item )
	local i = CheckBagItem(role,3054)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3054,1)
			if j == 1 then
				MoveCity(role,"Lone Tower Entrace")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--沙窟入口机票
function Jz_Script_scrkcsA(role, Item )
	local i = CheckBagItem(role,3055)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3055,1)
			if j == 1 then
				MoveCity(role,"Barren Cavern Entrance")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--废矿2层机票

function Jz_Script_fk2csA(role, Item )
	local i = CheckBagItem(role,3056)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3056,1)
			if j == 1 then
				MoveCity(role,"Abandon Mine 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--银矿2层机票

function Jz_Script_yk2csA(role, Item )
	local i = CheckBagItem(role,3057)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3057,1)
			if j == 1 then
				MoveCity(role,"Silver Mine 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--银矿3层机票

function Jz_Script_yk3csA(role, Item )
	local i = CheckBagItem(role,3058)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3058,1)
			if j == 1 then
				MoveCity(role,"Silver Mine 3")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--寂寞之塔2机票

function Jz_Script_jmzt2csA(role, Item )
	local i = CheckBagItem(role,3059)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3059,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 2")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--寂寞之塔3机票

function Jz_Script_jmzt3csA(role, Item )
	local i = CheckBagItem(role,3060)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3060,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 3")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--寂寞之塔4机票
function Jz_Script_jmzt4csA(role, Item )
	local i = CheckBagItem(role,3070)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3070,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 4")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--寂寞之塔5机票

function Jz_Script_jmzt5csA(role, Item )
	local i = CheckBagItem(role,3071)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3071,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 5")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--寂寞之塔6机票
function Jz_Script_jmzt6csA(role, Item )
	local i = CheckBagItem(role,3072)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3072,1)
			if j == 1 then
				MoveCity(role,"Lone Tower 6")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--废矿1层机票

function Jz_Script_fk1csA(role, Item )
	local i = CheckBagItem(role,3073)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3073,1)
			if j == 1 then
				MoveCity(role,"Abandon Mine 1")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
----春风镇送卷轴-------------------------------------------------------------------------------------------------------------------------------------
function Jz_Script_cfzsA(role, Item )
	local i = CheckBagItem(role,3076)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3076,1)
			if j == 1 then
				MoveCity(role,"Spring Town")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
---------------黑龙箱子使用-------------------
function ItemUse_CiChang( role, Item )
	local Elf_URE = GetItemAttr(Item,ITEMATTR_URE) --当前耐久记录剩余封印点数
	local Elf_EXP = GetItemAttr(Item,ITEMATTR_ENERGY) --最大能量记录诅咒点数
	if Elf_URE ~= 0 then
		SystemNotice(role ,"Seal has not been broken")
		UseItemFailed ( role )
		return
	end
	if Elf_EXP >9 then
		SystemNotice(role ,"Cursed points higher than 9. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use item")
		UseItemFailed ( role )
		return
	end
	local sta = GetItemAttr( Item ,ITEMATTR_VAL_STA )       --精神
	if sta == 0 then
		SystemNotice(role ,"Not yet put in target item, use item failed.")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	if sta == 1 then ---核心一866黑龙之心----------给黑龙之躯
		if Elf_EXP == 0 then
		GiveItem ( role , 0 , 845  , 1 , 20  )  		
		end
		if Elf_EXP == 1 then
		GiveItem ( role , 0 , 845  , 1 , 19  )  		
		end
		if Elf_EXP == 2 then
		GiveItem ( role , 0 , 845  , 1 , 18  )  		
		end
		if Elf_EXP == 3 then
		GiveItem ( role , 0 , 845  , 1 , 17  )  		
		end
		if Elf_EXP == 4 then
		GiveItem ( role , 0 , 845  , 1 , 16  )  		
		end
		if Elf_EXP == 5 then
		GiveItem ( role , 0 , 845  , 1 , 15  )  		
		end
		if Elf_EXP == 6 then
		GiveItem ( role , 0 , 845  , 1 , 14  )  		
		end
		if Elf_EXP == 7 then
		GiveItem ( role , 0 , 845  , 1 , 13  )  		
		end
		if Elf_EXP == 8 then
		GiveItem ( role , 0 , 845  , 1 , 12  )  		
		end
		if Elf_EXP == 9 then
		GiveItem ( role , 0 , 845  , 1 , 12  )  		
		end
		local message ="Black Dragon Altar has been unsealed! ".. cha_name.." obtains Black Dragon Torso!"  
		Notice ( message )
		LG("HeiLongJiTan","Character name as",cha_name,"'s Cursed points is now",Elf_EXP," Under this situation, you open the Black Dragon Altar and obtain Black Dragon Torso")
	end
	if sta == 2 then ---核心二865黑龙之魂---------------给黑龙之翼
		if Elf_EXP == 0 then
		GiveItem ( role , 0 , 847  , 1 , 20  )  		
		end
		if Elf_EXP == 1 then
		GiveItem ( role , 0 , 847  , 1 , 19  )  		
		end
		if Elf_EXP == 2 then
		GiveItem ( role , 0 , 847  , 1 , 18  )  		
		end
		if Elf_EXP == 3 then
		GiveItem ( role , 0 , 847  , 1 , 17  )  		
		end
		if Elf_EXP == 4 then
		GiveItem ( role , 0 , 847  , 1 , 16  )  		
		end
		if Elf_EXP == 5 then
		GiveItem ( role , 0 , 847  , 1 , 15  )  		
		end
		if Elf_EXP == 6 then
		GiveItem ( role , 0 , 847  , 1 , 14  )  		
		end
		if Elf_EXP == 7 then
		GiveItem ( role , 0 , 847  , 1 , 13  )  		
		end
		if Elf_EXP == 8 then
		GiveItem ( role , 0 , 847  , 1 , 12  )  		
		end
		if Elf_EXP == 9 then
		GiveItem ( role , 0 , 847  , 1 , 2  )  		
		end
		local message ="Black Dragon Altar has been unsealed! ".. cha_name.."obtained Black Dragon Wings!"  
		Notice ( message )
		LG("HeiLongJiTan","Character name as",cha_name,"'s Cursed points is now",Elf_EXP,"Under this situation, you opened Black Dragon Altar and obtain Black Dragon Wings")
	end
	if sta == 3 then ---核心三864黑龙之瞳---------------给黑龙之爪
		if Elf_EXP == 0 then
		GiveItem ( role , 0 , 846  , 1 , 20  )  		
		end
		if Elf_EXP == 1 then
		GiveItem ( role , 0 , 846  , 1 , 19  )  		
		end
		if Elf_EXP == 2 then
		GiveItem ( role , 0 , 846  , 1 , 18  )  		
		end
		if Elf_EXP == 3 then
		GiveItem ( role , 0 , 846  , 1 , 17  )  		
		end
		if Elf_EXP == 4 then
		GiveItem ( role , 0 , 846  , 1 , 16  )  		
		end
		if Elf_EXP == 5 then
		GiveItem ( role , 0 , 846  , 1 , 15  )  		
		end
		if Elf_EXP == 6 then
		GiveItem ( role , 0 , 846  , 1 , 14  )  		
		end
		if Elf_EXP == 7 then
		GiveItem ( role , 0 , 846  , 1 , 13  )  		
		end
		if Elf_EXP == 8 then
		GiveItem ( role , 0 , 846  , 1 , 12  )  		
		end
		if Elf_EXP == 9 then
		GiveItem ( role , 0 , 846  , 1 , 2  )  		
		end
		local message ="Black Dragon Altar has been unsealed! ".. cha_name.." obtains Black Dragon Claw!"  
		Notice ( message )
		LG("HeiLongJiTan","Character name as",cha_name,"'s Cursed points is now",Elf_EXP,"Under this situation, you open Black Dragon Altar and obtain Black Dragon Claw")
	end
	if sta == 4 then ---核心三给黑龙之首
		if Elf_EXP == 0 then
		GiveItem ( role , 0 , 848  , 1 , 20  )  		
		end
		if Elf_EXP == 1 then
		GiveItem ( role , 0 , 848  , 1 , 19  )  		
		end
		if Elf_EXP == 2 then
		GiveItem ( role , 0 , 848  , 1 , 18  )  		
		end
		if Elf_EXP == 3 then
		GiveItem ( role , 0 , 848  , 1 , 17  )  		
		end
		if Elf_EXP == 4 then
		GiveItem ( role , 0 , 848  , 1 , 16  )  		
		end
		if Elf_EXP == 5 then
		GiveItem ( role , 0 , 848  , 1 , 15  )  		
		end
		if Elf_EXP == 6 then
		GiveItem ( role , 0 , 848  , 1 , 14  )  		
		end
		if Elf_EXP == 7 then
		GiveItem ( role , 0 , 848  , 1 , 13  )  		
		end
		if Elf_EXP == 8 then
		GiveItem ( role , 0 , 848  , 1 , 12  )  		
		end
		if Elf_EXP == 9 then
		GiveItem ( role , 0 , 848  , 1 , 2  )  		
		end
		local message ="Black Dragon Altar has been unsealed! ".. cha_name.." obtains Black Dragon Helm!"  
		Notice ( message )
		LG("HeiLongJiTan","Character name as",cha_name,"'s Cursed points is now",Elf_EXP,"Under this situation, you open the Black Dragon Altar and obtain Black Dragon Helm")
	end
	if Elf_EXP ~=0 then
		SystemNotice(role ,"Remaining Cursed points has damage the quality of Black Dragon equipment")
	end
end
---------------核心使用-----------------------sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       --精神
function ItemUse_hexin ( role , Item , Item_Traget ) 
	local Item_Traget_ID = GetItemID ( Item_Traget )
	local Item_ID = GetItemID ( Item )		
	local sta = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STA )       --精神
	if Item_Traget_ID ~= 266 then
		SystemNotice(role ,"Please place the sacrificial item on the altar")
		UseItemFailed ( role )
		return
	end
	if sta==1 and Item_ID == 866 then
		SystemNotice(role ,"You have used a Heart of Black Dragon as a sacrificial item")
		UseItemFailed ( role )
		return	
	end
	if sta==2 and Item_ID == 865 then
		SystemNotice(role ,"You have used Soul of Black Dragon as a sacrificial item")
		UseItemFailed ( role )
		return	
	end
	if sta==3 and Item_ID == 864 then
		SystemNotice(role ,"You have used Eye of Black Dragon as a sacrificial item")
		UseItemFailed ( role )
		return	
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		local cha_name = GetChaDefaultName ( role ) 
		if Item_type == 49 and Item_Traget_Type == 65 then
				if Item_ID == 866 then						---核心A
				sta =1
				SystemNotice( role , "Use Heart of Black Dragon as a sacrificial item and obtain Black Dragon Torso" )
				LG("HeiLongJiTan_HeXin","Character name as",cha_name,"player used Heart of Black Dragon as sacrificial item")
				elseif Item_ID == 865 then						---核心B
				sta =2
				SystemNotice( role , "Use Soul of Black Dragon as a sacrificial item and obtain Black Dragon Wings" )
				LG("HeiLongJiTan_HeXin","Character name as",cha_name,"player used Soul of Black Dragon as a sacrificial item")
				elseif Item_ID == 864 then						---核心C
				sta =3
				SystemNotice( role , "Use Eye of Black Dragon as a sacrificial item to obtain Black Dragon Claw" )
				LG("HeiLongJiTan_HeXin","Character name as",cha_name,"player used Eye of Black Dragon as a sacrificial item")
				elseif Item_ID == 275 then						---核心D
				sta =4
				else 
						UseItemFailed ( role )
						return
				end
				SetItemAttr( Item_Traget ,ITEMATTR_VAL_STA ,sta )
		end 
end
---------------炎之力使用--------------------------str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       --力量
function ItemUse_HZLi ( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"Please place the Power of Flame on the altar")
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		if Item_type == 66 and Item_Traget_Type == 65  then
				local str = GetItemAttr( Item_Traget ,ITEMATTR_VAL_STR )       --力量
				if str >= 5 then
					UseItemFailed ( role )
				return
				end
				local rad = math.random ( 1, 100 )
				 if rad<=50 then
					local Elf_URE = GetItemAttr(Item_Traget,ITEMATTR_URE) --当前耐久记录剩余封印点数
					str = str + 1
					if Elf_URE >= 50 then
					Elf_URE = Elf_URE-50
					end
					SetItemAttr( Item_Traget ,ITEMATTR_VAL_STR ,str )
					SetItemAttr( Item_Traget ,ITEMATTR_URE ,Elf_URE )
				else 
				local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) --最大能量记录诅咒点数
				local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY) --最大能量记录诅咒点数
					Elf_MaxEXP = Elf_MaxEXP + 1
					Elf_EXP = Elf_EXP + 1
					SystemNotice( role , "Unfortunately, the Altar has been cursed by the soul of the black dragon" ) 
					SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_MaxEXP )
					SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
				end 
		end 
end


---------------冰之力使用-------------------------con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       --体质

function ItemUse_BZLi ( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"Place Power of Frost on the altar")
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		if Item_type == 66 and Item_Traget_Type == 65 then
				local con = GetItemAttr( Item_Traget ,ITEMATTR_VAL_CON )       --体质
				if con >= 5 then
					UseItemFailed ( role )
				return
				end
				local rad = math.random ( 1, 100 )
				 if rad<=50 then
					local Elf_URE = GetItemAttr(Item_Traget,ITEMATTR_URE) --当前耐久记录剩余封印点数
					con = con + 1
					if Elf_URE >= 50 then
					Elf_URE = Elf_URE-50
					end
					SetItemAttr( Item_Traget ,ITEMATTR_VAL_CON ,con )
					SetItemAttr( Item_Traget ,ITEMATTR_URE ,Elf_URE )
				else 
				local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) --最大能量记录诅咒点数
				local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY) --最大能量记录诅咒点数
					Elf_MaxEXP = Elf_MaxEXP + 1
					Elf_EXP = Elf_EXP + 1
					SystemNotice( role , "Unfortunately, the Altar has been cursed by the soul of the black dragon" ) 
					SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_MaxEXP )
					SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
				end 
		end 
end
----------------风之力使用---------------------------agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       --敏捷
function ItemUse_FZLi( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"Please place the Power of Wind on the altar")
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		if Item_type == 66 and Item_Traget_Type == 65 then
				local agi = GetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI )       --敏捷
					if agi >= 5 then
					UseItemFailed ( role )
					return
					end
				local rad = math.random ( 1, 100 )
				 if rad<=50 then
					local Elf_URE = GetItemAttr(Item_Traget,ITEMATTR_URE) --当前耐久记录剩余封印点数
					agi = agi + 1
					if Elf_URE >= 50 then
					Elf_URE = Elf_URE-50
					end
					SetItemAttr( Item_Traget ,ITEMATTR_VAL_AGI ,agi )
					SetItemAttr( Item_Traget ,ITEMATTR_URE ,Elf_URE )
				else 
				local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) --最大能量记录诅咒点数
				local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY) --最大能量记录诅咒点数
					Elf_MaxEXP = Elf_MaxEXP + 1
					Elf_EXP = Elf_EXP + 1
					SystemNotice( role , "Unfortunately, the Altar has been cursed by the soul of the black dragon" ) 
					SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_MaxEXP )
					SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
				end 
		end 
end

----------------雷之力使用---------------------------dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       --专注
function ItemUse_LZli ( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"Please place Power of Thunder on the altar")
		UseItemFailed ( role )
		return
	end
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type = GetItemType ( Item )
		local Item_Traget_Type = GetItemType ( Item_Traget )
		if Item_type == 66 and Item_Traget_Type == 65 then
				local dex = GetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX )       --力量
					if dex >= 5 then
					UseItemFailed ( role )
					return
					end
				local rad = math.random ( 1, 100 )
				 if rad<=50 then
					local Elf_URE = GetItemAttr(Item_Traget,ITEMATTR_URE) --当前耐久记录剩余封印点数
					dex = dex + 1
					if Elf_URE >= 50 then
					Elf_URE = Elf_URE-50
					end
					SetItemAttr( Item_Traget ,ITEMATTR_VAL_DEX ,dex )
					SetItemAttr( Item_Traget ,ITEMATTR_URE ,Elf_URE )
				else 
				local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) --最大能量记录诅咒点数
				local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY) --最大能量记录诅咒点数
					Elf_MaxEXP = Elf_MaxEXP + 1
					Elf_EXP = Elf_EXP + 1
					SystemNotice( role , "Unfortunately, the Altar has been cursed by the soul of the black dragon" ) 
					SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_MaxEXP )
					SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
				end 
		end 
end
----------------天使骰子使用-------------------------
function ItemUse_ZhuFu ( role , Item , Item_Traget ) 
	local Item_ID = GetItemID ( Item_Traget )
	if Item_ID ~= 266 then
		SystemNotice(role ,"Please confirm to use Angelic Dice")
		UseItemFailed ( role )
		return
	end
	local Elf_EXP = GetItemAttr(Item_Traget,ITEMATTR_ENERGY) --当前能量记录诅咒点数
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) --最大能量记录诅咒点数

	if Elf_EXP ==0 then
		UseItemFailed ( role )
		
		return
	end
	local rad = math.random ( 1, 100 )

	if Elf_EXP <= 5 and Elf_EXP >= 1 then
		if rad <= 30 then
			Elf_EXP = Elf_EXP -1
		else
			SystemNotice(role ,"The angelic dice you used was of bad quality, the curse was not lifted.")
		end
	end

	if Elf_EXP <= 10 and Elf_EXP >= 6 then
		if rad <= 50 then
			Elf_EXP = Elf_EXP -1
		else
			SystemNotice(role ,"The angelic dice you used was of bad quality, the curse was not lifted.")
		end
	end

	if Elf_EXP <= 15 and Elf_EXP >= 11 then
		if rad <= 80 then
			Elf_EXP = Elf_EXP -1
		else
			SystemNotice(role ,"The angelic dice you used was of bad quality, the curse was not lifted.")
		end
	end

	if Elf_EXP >= 16  then
		Elf_EXP = Elf_EXP -1
	end

	SetItemAttr( Item_Traget ,ITEMATTR_ENERGY ,Elf_EXP )
	SetItemAttr( Item_Traget ,ITEMATTR_MAXENERGY ,Elf_EXP )
end

--一元好礼包
function ItemUse_YiYuanHaoYunBOX ( role , Item )
	local Percentage = Percentage_Random ( 0.1 )
			if Percentage == 1 then
				 AddMoney ( role , 0 , 50000 )
			else	
				local item_type = BoxXiang_YiYuanBOX
				local item_type_rad = BoxXiang_YiYuanBOX_Rad 
				local item_type_count = BoxXiang_YiYuanBOX_Count 
				local maxitem = BoxXiang_YiYuanBOX_Mxcount						-- 终结编号
				local item_quality = BoxXiang_YiYuanBOX_Qua
				local General = 0  
				local ItemId = 0 
			--	local Item_CanGet = GetChaFreeBagGridNum ( role )
				
			--	if Item_CanGet <= 1 then
			--		SystemNotice(role ,"Insufficient space in inventory. Unable to use Prosperous Packet")
			--		UseItemFailed ( role )
			--		return
			--	end
				for i = 1 , maxitem , 1 do 
					General = item_type_rad [ i ] + General		
				end 
				local a = math.random ( 1, General )
				local b = 0
				local d = 0 
				local c = -1							--命中物品编号
				for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
				GoodItem[0] = 3336
				GoodItem[1] = 3885
				GoodItem[2] = 430
				GoodItem[3] = 3886
				GoodItem[4] = 3113
				GoodItem[5] = 3111
				GoodItem[6] = 3093
				GoodItem[7] = 3090
				GoodItem[8] =0860
				GoodItem[9] =0861
				GoodItem[10] =0862
				GoodItem[11] =0863
				GoodItem[12] =179
				GoodItem[13] =3084
				GoodItem[14] =3085


				local Good_C = 0
				for Good_C = 0 , 14 , 1 do
					if ItemId == GoodItem[Good_C] then
						local itemname = GetItemName ( ItemId ) 
						local cha_name = GetChaDefaultName ( role ) 
						local message = cha_name.." opens a Lucky Packet and obtain"..itemname  
						Notice ( message )
					end
				end
			end 
	end

---------------特等奖
function ItemUse_tedengjiang ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 3 then
		SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 845  , 1 , 16  )  
	GiveItem ( role , 0 , 846  , 1 , 16  )  
	GiveItem ( role , 0 , 847  , 1 , 16  ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens the Grand Prize and obtain Black Dragon set"
		Notice ( message )
end


-----------------------一等奖
function ItemUse_yidengjiang ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0853  , 1 , 4 ) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens the First Prize and obtain a Happy Holiday Magazine" 
		Notice ( message )
end

---------------------------二等奖
function ItemUse_erdengjiang ( role , Item )
local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 14 then
		SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0456  , 10 , 4  ) 
	local rad = math.random ( 1, 8 )
	if rad == 1 then
	GiveItem ( role , 0 , 5013  , 1 , 4 ) 
	GiveItem ( role , 0 , 5021  , 1 , 4 ) 
	GiveItem ( role , 0 , 5029  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 5014  , 1 , 4 ) 
	GiveItem ( role , 0 , 5022  , 1 , 4 ) 
	GiveItem ( role , 0 , 5030  , 1 , 4 ) 
	elseif rad == 3 then
	GiveItem ( role , 0 , 5015  , 1 , 4 ) 
	GiveItem ( role , 0 , 5023  , 1 , 4 ) 
	GiveItem ( role , 0 , 5031  , 1 , 4 ) 
	elseif rad == 4 then
	GiveItem ( role , 0 , 5020  , 1 , 4 ) 
	GiveItem ( role , 0 , 5024  , 1 , 4 ) 
	GiveItem ( role , 0 , 5032  , 1 , 4 ) 
	GiveItem ( role , 0 , 5037  , 1 , 4 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 5017  , 1 , 4 ) 
	GiveItem ( role , 0 , 5025  , 1 , 4 ) 
	GiveItem ( role , 0 , 5033  , 1 , 4 )
	elseif rad == 6 then
	GiveItem ( role , 0 , 5018  , 1 , 4 ) 
	GiveItem ( role , 0 , 5026  , 1 , 4 ) 
	GiveItem ( role , 0 , 5034  , 1 , 4 )
	elseif rad == 7 then
	GiveItem ( role , 0 , 5019  , 1 , 4 ) 
	GiveItem ( role , 0 , 5027  , 1 , 4 ) 
	GiveItem ( role , 0 , 5035  , 1 , 4 )
	elseif rad == 8 then
	GiveItem ( role , 0 , 5016  , 1 , 4 ) 
	GiveItem ( role , 0 , 5028  , 1 , 4 ) 
	GiveItem ( role , 0 , 5036  , 1 , 4 )
	GiveItem ( role , 0 , 5038  , 1 , 4 )
	end
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens the Second Prize and obtain 10 Strengthening Crystal and 1 set of Apparel"   
		Notice ( message )
end

	
--------------------------三等奖
function ItemUse_sandengjiang ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"Insufficient slots in inventory")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 2 )
	if rad == 1 then
		GiveItem ( role , 0 , 3094  , 1 , 4 ) 
		GiveItem ( role , 0 , 3096  , 1 , 4 )
	else
		GiveItem ( role , 0 , 1094  , 1 , 4 ) 
	end
end

--99爆炸包
function ItemUse_BaoZhaBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount						-- 终结编号
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	--if Item_CanGet <= 1 then
		--SystemNotice(role ,"Insufficient space in inventory. Unable to use Prosperous Packet")
		--UseItemFailed ( role )
		--return
	--end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号
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
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] =3084
	GoodItem[9] =3085
	GoodItem[10] =0244
	GoodItem[11] =0250
	GoodItem[12] =0253
	GoodItem[13] =0260
	GoodItem[14] =0860
	GoodItem[15] =0861
	GoodItem[16] =0862
	GoodItem[17] =3458
	GoodItem[18] =0247
	GoodItem[19] =0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." opens a 99 Parcel and obtain "..itemname  
			Notice ( message )
		end
	end
end

-------------------------------------阴阳五行轮回塔
function ItemUse_wxlh( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <1 then
		SystemNotice(role ,"To open a Chest requires 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local r1,r2 =MakeItem ( role , SI  , SN , SE )
	local Item_star = GetChaItem ( role , 2 , r2 )			--取道具指针
	local num={}
	local numAttr={}
	local b = 0
	local a = {}
	for b=1,5,1 do
		num [b]=0
		numAttr [b]=0
	end
	b = 0
	for i=1,47,1 do		---------------取到道具的全部实例化属性
	    a [i]=GetItemAttr ( Item_star , i )
		if a [i]~=0 then
	--		SystemNotice( role , a [i] )
				b = b + 1
				num [b]=i    -------------num [b]记录实例华属性的编号
				numAttr [b]=a[i] ------------现有的各实例化属性值
		end
	end
	SetItemAttr ( Item_star ,num [1] , SA1 )
	SetItemAttr ( Item_star ,num [2] , SA2 )
	SetItemAttr ( Item_star ,num [3] , SA3 )
	SetItemAttr ( Item_star ,num [4] , SA4)
	SetItemAttr ( Item_star ,num [5] , SA5)

end
----------------------------------高级戒指兑换
function ItemUse_Sjz( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"Inventory requires at least 5 empty slots to use Unique Ring Voucher")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 5 )
	if rad ==1 then
	--卫兵的坚持
	--古树球根
	--力量封印
	--雷之锤
	--比特的呼唤
	GiveItem ( role , 0 , 281  , 1 , 4 )	
	GiveItem ( role , 0 , 286  , 1 , 4 )	
	GiveItem ( role , 0 , 324  , 1 , 4 )	
	GiveItem ( role , 0 , 334  , 1 , 4 )	
	GiveItem ( role , 0 , 387  , 1 , 4 )	
	end
	if rad ==2 then
	--盗贼的窥探
	--五月之风
	--幽狼环扣
	--闪电之眼
	--艾维尔之吻
	GiveItem ( role , 0 , 282  , 1 , 4 )	
	GiveItem ( role , 0 , 287  , 1 , 4 )	
	GiveItem ( role , 0 , 327  , 1 , 4 )	
	GiveItem ( role , 0 , 346  , 1 , 4 )	
	GiveItem ( role , 0 , 414  , 1 , 4 )		
	end
	if rad ==3 then
	--猎手之力
	--精灵的依恋
	--龙翼指环
	--光之翼
	--雷欧的愤怒
	GiveItem ( role , 0 , 283  , 1 , 4 )	
	GiveItem ( role , 0 , 288  , 1 , 4 )	
	GiveItem ( role , 0 , 328  , 1 , 4 )	
	GiveItem ( role , 0 , 347  , 1 , 4 )	
	GiveItem ( role , 0 , 415  , 1 , 4 )	
	end
	if rad ==4 then
	--信徒之环
	--苦行僧
	--独角兽的祝福
	--晨钟
	--小山车的歉意
	GiveItem ( role , 0 , 284  , 1 , 4 )	
	GiveItem ( role , 0 , 524  , 1 , 4 )	
	GiveItem ( role , 0 , 329  , 1 , 4 )	
	GiveItem ( role , 0 , 348  , 1 , 4 )	
	GiveItem ( role , 0 , 416  , 1 , 4 )		
	end
	if rad ==5 then
	--灵环
	--圣环
	--天使的悲鸣
	--天籁
	--圣女的奉献
	GiveItem ( role , 0 , 285  , 1 , 4 )	
	GiveItem ( role , 0 , 321  , 1 , 4 )	
	GiveItem ( role , 0 , 330  , 1 , 4 )	
	GiveItem ( role , 0 , 349  , 1 , 4 )	
	GiveItem ( role , 0 , 417  , 1 , 4 )			
	end
end
----------------------------------高级项链兑换
function ItemUse_Sxl( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"Inventory requires at least 5 empty slots to use Unique Necklace Voucher")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 2 )
	if rad ==1 then
	--太阳石坠子
	--黑耀石的闪光
	--突风
	--快步冒险者
	--心灵永动机
	GiveItem ( role , 0 , 418  , 1 , 4 )	
	GiveItem ( role , 0 , 420  , 1 , 4 )	
	GiveItem ( role , 0 , 739  , 1 , 4 )	
	GiveItem ( role , 0 , 462  , 1 , 4 )	
	GiveItem ( role , 0 , 495  , 1 , 4 )		
	end
	if rad ==2 then
	--白金项链
	--风之信使
	--冰晶仙子
	--迷宫探索者
	--天佑的达人
	GiveItem ( role , 0 , 419  , 1 , 4 )	
	GiveItem ( role , 0 , 421  , 1 , 4 )	
	GiveItem ( role , 0 , 461  , 1 , 4 )	
	GiveItem ( role , 0 , 463  , 1 , 4 )	
	GiveItem ( role , 0 , 497  , 1 , 4 )		
	end
end
----------------------------------高级贝壳兑换
function ItemUse_Sbk( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"Inventory requires at least 5 empty slots to use Unique Coral Voucher")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 2 )
	if rad ==1 then
	--学徒用雷贝
	--通用型雷贝
	--中级雷之贝
	--高级雷之贝
	--雷神贝2006
	GiveItem ( role , 0 , 498  , 1 , 4 )	
	GiveItem ( role , 0 , 503  , 1 , 4 )	
	GiveItem ( role , 0 , 504  , 1 , 4 )	
	GiveItem ( role , 0 , 505  , 1 , 4 )	
	GiveItem ( role , 0 , 506  , 1 , 4 )		
	end
	if rad ==2 then
	--学徒用风贝  
	--通用型风贝  
	--中级风之贝  
	--高级风之贝  
	--风神贝2006 
	GiveItem ( role , 0 , 508  , 1 , 4 )	
	GiveItem ( role , 0 , 509  , 1 , 4 )	
	GiveItem ( role , 0 , 510  , 1 , 4 )	
	GiveItem ( role , 0 , 522  , 1 , 4 )	
	GiveItem ( role , 0 , 523  , 1 , 4 )		
	end
end
----夏岛飞机票-------------------------------------------------------------------------------------------------------------------------------------
function Jz_Script_xdfjp(role, Item )
	local i = CheckBagItem(role,563)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,563,1)
			if j == 1 then
				MoveCity(role,"Summer Island")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

----秋岛飞机票-------------------------------------------------------------------------------------------------------------------------------------
function Jz_Script_qdfjp(role, Item )
	local i = CheckBagItem(role,583)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,583,1)
			if j == 1 then
				MoveCity(role,"Autumn Island")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
----超人棒棒糖-------------------------------------------------------------------------------------------------------------------------------------
function ItemUse_Crbbt(role, Item )
--	SystemNotice(role ,"The item has gone rusty and has lost its effect, don't be too sad")
	local statelv = 1
	local statetime = 20
	AddState( role , role , STATE_CJBBT , statelv , statetime )
end
----巨人巧克力-------------------------------------------------------------------------------------------------------------------------------------
function ItemUse_Jrqkl(role, Item )
--	SystemNotice(role ,"The item has gone rusty and has lost its effect, don't be too sad")
	local statelv = 1
	local statetime = 20
	AddState( role , role , STATE_JRQKL , statelv , statetime )
end
--周岁生日
function ItemUse_ZhouSuiBOX ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 2 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open Birthday Package")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1097 , 1 , 0 )
	local item_type = BoxXiang_ZhousSuiBOX
	local item_type_rad = BoxXiang_ZhousSuiBOX_Rad 
	local item_type_count = BoxXiang_ZhousSuiBOX_Count 
	local maxitem = BoxXiang_ZhouSui_Mxcount						-- 终结编号
	local item_quality = BoxXiang_ZhouSui_Qua
	local General = 0  
	local ItemId = 0 
	
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	if ItemId ==  0853 then
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens Anniversary Chest and obtain Happy Holiday Magazine" 
	Notice ( message )
	end
end
-------------------------------百万大钞ItemUse_CZHe
function ItemUse_CZHe( role , Item ) 							
 	local Money_add = 1000000
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Have>=999900000 then
		SystemNotice (role, "Your account is saturated. Unable to use item")
		UseItemFailed ( role )
		return	
	end
	AddMoney ( role , 0 , Money_add )
end 
-----------------------------------摩豆小子精灵蛋ItemUse_MDXZJLD
function ItemUse_MDXZJLD ( role, Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use pet egg")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 680  , 1 , 4 ) 
end
----加勒比观光票-------------------------------------------------------------------------------------------------------------------------------------
function Jz_Script_jialebi(role, Item )
	local i = CheckBagItem(role,2445)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2445,1)
			if j == 1 then
				MoveCity(role,"Caribbean")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
----------------------------------运之精灵蛋
function ItemUse_YZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Luck")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 到 Part 7
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 231  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
----------------------------------体之精灵蛋
function ItemUse_TZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Constitution")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 到 Part 7
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 233  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
----------------------------------力之精灵蛋
function ItemUse_LZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Strength")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 到 Part 7
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 232  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
----------------------------------神之精灵蛋
function ItemUse_SZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Spirit")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 到 Part 7
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 234  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
----------------------------------专之精灵蛋
function ItemUse_ZZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Accuracy")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 到 Part 7
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 235  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
----------------------------------敏之精灵蛋
function ItemUse_MZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Agility")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 到 Part 7
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 236  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
----------------------------------邪之精灵蛋
function ItemUse_XZJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Evil")
		UseItemFailed ( role )
		return
	end
	local Num_newJL = GetItemForgeParam ( Item , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 到 Part 7
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )

	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  

	local rad = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 ) 
	end
	if Part3_newJL==2 then
		if rad <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 95 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	if Part3_newJL==1 then
		if rad <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 ) 
		elseif rad > 90 and rad <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 ) 
		elseif rad > 98 and rad <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 ) 
		end
	end
	local r1,r2 =MakeItem ( role , 237  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
-----------摩豆小子二世精灵蛋
function ItemUse_MDXZESJLD( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Egg of Mordo")
		UseItemFailed ( role )
		return
	end
	local new_str=GetItemAttr ( Item , ITEMATTR_VAL_STR )      
	local new_dex=GetItemAttr( Item , ITEMATTR_VAL_DEX  )	  
	local new_sta=GetItemAttr ( Item , ITEMATTR_VAL_STA  )    
	local new_agi=GetItemAttr( Item , ITEMATTR_VAL_AGI )       
	local new_con=GetItemAttr ( Item , ITEMATTR_VAL_CON )  
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		Item_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		Item_MAXURE_NUM = 32000
	end	  
	GiveItem ( role , 0 , 609  , 1 , 4 ) 
	local r1,r2 =MakeItem ( role , 681  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )	 
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con ) 
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY ) 	
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
-----------------------------------------初级精灵附体
function Sk_Script_CJJLFT( role , Item ) 							
 	local sk_add = SK_JLFT  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
 -----------------------------------------中级精灵附体
function Sk_Script_ZJJLFT ( role , Item ) 							
  	local sk_add = SK_JLFT  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 2 then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 2 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
 -----------------------------------------高级精灵附体
function Sk_Script_GJJLFT( role , Item ) 							
   	local sk_add = SK_JLFT  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 3 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
--高级圣雪山龙果
function ItemUse_CJ_longguo( role , Item , Item_Traget ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 
	--SystemNotice(role ,Elf_MaxEXP )

	if Item_type == 58 and Item_Traget_Type == 59 then
			Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
			if Check_Exp == 0 then
				SystemNotice(role , "Growth rate is not full. Unable to feed pet with Snow Dragon Fruit" ) 
				UseItemFailed ( role )
			else
			Lvup_Str_1 ( role , Item_Num , Item_Traget ) --力量属性的成长函数
			end 
	end 
end

--高级冰极爽口梅
function ItemUse_CJ_koumei ( role , Item , Item_Traget ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

	if Item_type == 58 and Item_Traget_Type == 59 then
			Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
			if Check_Exp == 0 then
				SystemNotice(role , "Growth rate is not full. Unable to feed pet with Icespire Plum" ) 
				UseItemFailed ( role )
			else
			   Lvup_Agi_1 ( role , Item_Num , Item_Traget ) --敏捷属性的成长函数 
			end 
	end 
end
--高级海风鳕鱼丝
function ItemUse_CJ_yusi ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

	if Item_type == 58 and Item_Traget_Type == 59  then
			Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
			if Check_Exp == 0 then
				SystemNotice(role , "Growth rate is not full. Unable to feed pet with Zephyr Fish Floss" ) 
				UseItemFailed ( role )
			else
			   Lvup_Dex_1 ( role , Item_Num , Item_Traget ) --专注属性的成长函数 
			end 
	end 
end
--高级白银城果脯
function ItemUse_CJ_guopu ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

	if Item_type == 58 and Item_Traget_Type == 59 then
			Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
			if Check_Exp == 0 then
				SystemNotice(role , "Growth rate is not full. Unable to feed pet with Argent Mango" ) 
				UseItemFailed ( role )
			else
			   Lvup_Con_1 ( role , Item_Num , Item_Traget ) --体质属性的成长函数 
			end 
	end 
end

--高级新沙岚米饼
function ItemUse_CJ_mibing ( role , Item , Item_Traget ) 

	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local Item_type = GetItemType ( Item )
	local Item_Traget_Type = GetItemType ( Item_Traget )
	local Item_Num = GetItemID ( Item )
	local Check_Exp = 0
	local Elf_MaxEXP = GetItemAttr(Item_Traget,ITEMATTR_MAXENERGY) 

	if Item_type == 58 and Item_Traget_Type == 59  then
			Check_Exp = CheckElf_EXP ( role , Item_Traget ) --精灵exp是否满足升级条件
			if Check_Exp == 0 then
				SystemNotice(role , "Growth rate is not full. Unable to feed pet with Shaitan Biscuit" ) 
				UseItemFailed ( role )
			else
			   Lvup_Sta_1 ( role , Item_Num , Item_Traget ) --精神属性的成长函数 
			end  
		        --local Item_MAXENERGY = Elf_MaxEXP + 20
			--SetItemAttr ( Item_Traget , ITEMATTR_MAXENERGY , Item_MAXENERGY )				
	end 
end
--加速成长果子
function ItemUse_JLJSGz( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_JLJSGZ)
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 900
	--local Cha_Boat = 0
	--Cha_Boat = GetCtrlBoat ( role )
	AddState( role , role , STATE_JLJSGZ , statelv , statetime )
end
---------------------70级封印紫武宝箱
function ItemUse_70FYZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Seal Master Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4204  , 1 , 22) 
end
---------------------70级巨剑紫武宝箱
function ItemUse_70JJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Champion Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1375 , 1 , 22) 
end
---------------------70级双剑紫武宝箱
function ItemUse_70SJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Crusader Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1394 , 1 , 22) 
end
---------------------70级狙击紫武宝箱

function ItemUse_70JUJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Sharpshooter Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 42 , 1 , 22) 
end

---------------------70级航海紫武宝箱
function ItemUse_70HHZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Voyager Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1421 , 1 , 22) 
end
---------------------70级圣职紫武宝箱
function ItemUse_70SZZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Cleric Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4198 , 1 , 22) 
end
---------------------50级双剑宝箱
function ItemUse_50SJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Crusader Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0299 , 1 , 22) 
	GiveItem ( role , 0 , 0475 , 1 , 22) 
	GiveItem ( role , 0 , 0651 , 1 , 22) 
end
--------------------60级双剑宝箱
function ItemUse_60SJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Crusader Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0304 , 1 , 22) 
	GiveItem ( role , 0 , 0480 , 1 , 22) 
	GiveItem ( role , 0 , 0656 , 1 , 22) 
end
--------------------70级双剑宝箱
function ItemUse_70SJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Crusader Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4150 , 1 , 22) 
	GiveItem ( role , 0 , 4166 , 1 , 22) 
	GiveItem ( role , 0 , 4182 , 1 , 22) 
end
--------------------50级巨剑宝箱
function ItemUse_50JJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Champion Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0229 , 1 , 22) 
	GiveItem ( role , 0 , 653 , 1 , 22)  
end
--------------------60级巨剑宝箱
function ItemUse_60JJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Champion Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0230 , 1 , 22) 
	GiveItem ( role , 0 , 477 , 1 , 22)  
end
--------------------70级巨剑宝箱
function ItemUse_70JJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Champion Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4148 , 1 , 22) 
	GiveItem ( role , 0 , 653 , 1 , 22)  
	GiveItem ( role , 0 , 477 , 1 , 22)
end
--------------------50级圣职宝箱
function ItemUse_50SZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0371 , 1 , 22) 
	GiveItem ( role , 0 , 0547 , 1 , 22)  
	GiveItem ( role , 0 , 0723 , 1 , 22) 
end
--------------------60级圣职宝箱
function ItemUse_60SZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0394 , 1 , 22) 
	GiveItem ( role , 0 , 0570 , 1 , 22)  
	GiveItem ( role , 0 , 0746 , 1 , 22) 
end
--------------------70级圣职宝箱
function ItemUse_70SZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4159 , 1 , 22) 
	GiveItem ( role , 0 , 4175 , 1 , 22)  
	GiveItem ( role , 0 , 4191 , 1 , 22) 
end
--------------------50级艾米圣职宝箱
function ItemUse_50AMSZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Ami Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0382 , 1 , 22) 
	GiveItem ( role , 0 , 0558 , 1 , 22)  
	GiveItem ( role , 0 , 0734 , 1 , 22) 
	GiveItem ( role , 0 , 2204 , 1 , 22) 
end
--------------------60级艾米圣职宝箱
function ItemUse_60AMSZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60Ami Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0393 , 1 , 22) 
	GiveItem ( role , 0 , 0569 , 1 , 22)  
	GiveItem ( role , 0 , 0745 , 1 , 22) 
	GiveItem ( role , 0 , 2215 , 1 , 22) 
end
--------------------70级艾米圣职宝箱
function ItemUse_70AMSZBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Ami Cleric Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4160 , 1 , 22) 
	GiveItem ( role , 0 , 4176 , 1 , 22)  
	GiveItem ( role , 0 , 4192 , 1 , 22)  
end
--------------------50级艾米封印宝箱
function ItemUse_50AMFYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Ami Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0385 , 1 , 22) 
	GiveItem ( role , 0 , 0561 , 1 , 22)  
	GiveItem ( role , 0 , 0737 , 1 , 22) 
	GiveItem ( role , 0 , 2207 , 1 , 22) 
end
--------------------60级艾米封印宝箱
function ItemUse_60AMFYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Ami Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0364 , 1 , 22) 
	GiveItem ( role , 0 , 0540 , 1 , 22)  
	GiveItem ( role , 0 , 0716 , 1 , 22) 
	GiveItem ( role , 0 , 2201 , 1 , 22) 
end
--------------------70级艾米封印宝箱
function ItemUse_70AMFYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Ami Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4164 , 1 , 22) 
	GiveItem ( role , 0 , 4180 , 1 , 22)  
	GiveItem ( role , 0 , 4196 , 1 , 22) 
end
--------------------50级艾航海印宝箱
function ItemUse_50AMHHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Ami Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0355 , 1 , 22) 
	GiveItem ( role , 0 , 0531 , 1 , 22)  
	GiveItem ( role , 0 , 0707 , 1 , 22) 
	GiveItem ( role , 0 , 2192 , 1 , 22) 
end
--------------------60级艾航海印宝箱
function ItemUse_60AMHHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Ami Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0358 , 1 , 22) 
	GiveItem ( role , 0 , 0534 , 1 , 22)  
	GiveItem ( role , 0 , 0710 , 1 , 22) 
	GiveItem ( role , 0 , 2195 , 1 , 22) 
end
--------------------70级艾航海印宝箱
function ItemUse_70AMHHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Ami Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4156 , 1 , 22) 
	GiveItem ( role , 0 , 4172 , 1 , 22)  
	GiveItem ( role , 0 , 4188 , 1 , 22)  
end
--------------------50级狙击宝箱
function ItemUse_50JUJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Sharpshooter Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0312 , 1 , 22) 
	GiveItem ( role , 0 , 0488 , 1 , 22)  
	GiveItem ( role , 0 , 0664 , 1 , 22) 
end
--------------------60级狙击宝箱
function ItemUse_60JUJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Sharpshooter Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0317 , 1 , 22) 
	GiveItem ( role , 0 , 0493 , 1 , 22)  
	GiveItem ( role , 0 , 0669 , 1 , 22) 
end
--------------------70级狙击宝箱
function ItemUse_70JUJBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Sharpshooter Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4152 , 1 , 22) 
	GiveItem ( role , 0 , 4168 , 1 , 22)  
	GiveItem ( role , 0 , 4184 , 1 , 22) 
end
--------------------50级航海宝箱
function ItemUse_50HHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0345 , 1 , 22) 
	GiveItem ( role , 0 , 0521 , 1 , 22)  
	GiveItem ( role , 0 , 0697 , 1 , 22) 
end
--------------------60级航海宝箱
function ItemUse_60HHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0344 , 1 , 22) 
	GiveItem ( role , 0 , 0520 , 1 , 22)  
	GiveItem ( role , 0 , 0696 , 1 , 22) 
end
--------------------70级航海宝箱
function ItemUse_70HHBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Voyager Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4155 , 1 , 22) 
	GiveItem ( role , 0 , 4171 , 1 , 22)  
	GiveItem ( role , 0 , 4187 , 1 , 22) 
end
--------------------50级封印宝箱
function ItemUse_50FYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0369 , 1 , 22) 
	GiveItem ( role , 0 , 0545 , 1 , 22)  
	GiveItem ( role , 0 , 0721 , 1 , 22) 
end
--------------------60级封印宝箱
function ItemUse_60FYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0377 , 1 , 22) 
	GiveItem ( role , 0 , 0553 , 1 , 22)  
	GiveItem ( role , 0 , 0729 , 1 , 22) 
end
--------------------70级封印宝箱
function ItemUse_70FYBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 2 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 70 Seal Master Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4163 , 1 , 22) 
	GiveItem ( role , 0 , 4179 , 1 , 22)  
	GiveItem ( role , 0 , 4195 , 1 , 22) 
end
--98天堂包
function ItemUse_98BOX ( role , Item )
			local item_type = BaoXiang_98BOX
			local item_type_rad = BaoXiang_98BOX_Rad 
			local item_type_count = BaoXiang_98BOX_Count 
			local maxitem = BaoXiang_98BOX_Mxcount						-- 终结编号
			local item_quality = BaoXiang_98BOX_Qua
			local General = 0  
			local ItemId = 0 
			
		local Item_CanGet = GetChaFreeBagGridNum ( role )
		
		if Item_CanGet <= 0 then
			SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
			UseItemFailed ( role )
			return
		end
				for i = 1 , maxitem , 1 do 
					General = item_type_rad [ i ] + General		
				end 
				local a = math.random ( 1, General )
				local b = 0
				local d = 0 
				local c = -1							--命中物品编号
				for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
				GoodItem[0] = 3074
				GoodItem[1] = 0937
				GoodItem[2] = 3885
				GoodItem[3] = 0680
				GoodItem[4] = 0938
				GoodItem[5] = 2488
				GoodItem[6] = 2489
				GoodItem[7] = 2490
				GoodItem[8] =2436
				GoodItem[9] =3075

				local Good_C = 0
				for Good_C = 0 , 9 , 1 do
					if ItemId == GoodItem[Good_C] then
						local itemname = GetItemName ( ItemId ) 
						local cha_name = GetChaDefaultName ( role ) 
						local message = cha_name.." opens a Paradise Pouch and obtain "..itemname  
						Notice ( message )
					end
				end
	
	end
--------------------烈炎石兑换券
function ItemUse_lieyanBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Fiery Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0878 , 1 , 4) 
end
--------------------炙焰石兑换券
function ItemUse_zhiyanBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Furious Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0879 , 1 , 4) 
end
--------------------火药石兑换券
function ItemUse_huoyaoBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Explosive Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0880 , 1 , 4) 
end
--------------------玛瑙石兑换券
function ItemUse_manaoBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lustrious Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0881 , 1 , 4) 
end
--------------------圣光石兑换券
function ItemUse_shengguangBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Spirit Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0887 , 1 , 4) 
end
--------------------月之心兑换券
function ItemUse_yuezhixinBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Shining Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0883 , 1 , 4) 
end
--------------------寒玉兑换券
function ItemUse_hanyuBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Glowing Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0882 , 1 , 4) 
end
--------------------风灵石兑换券
function ItemUse_fenglingBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Gem of the Wind Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0860 , 1 , 4) 
end
--------------------仙灵石兑换券
function ItemUse_xianlingBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Shadow Gem Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0884 , 1 , 4) 
end
--------------------鹰眼石兑换券
function ItemUse_yingyanBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Gem of Striking Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0861 , 1 , 4) 
end
--------------------岩玉兑换券
function ItemUse_yanyuBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Gem of Colossus Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0862 , 1 , 4) 
end
--------------------炎玉兑换券
function ItemUse_tanyuBook( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Gem of Rage Voucher")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0863 , 1 , 4) 
end
--------------------50级双剑紫武宝箱
function ItemUse_50SJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Crusader Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1392 , 1 , 22) 
end
--------------------50级巨剑紫武宝箱
function ItemUse_50JJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Champion Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1373 , 1 , 22) 
end
--------------------50级狙击紫武宝箱
function ItemUse_50JUJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Sharpshooter Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0040 , 1 , 22) 
end
--------------------50级航海紫武宝箱
function ItemUse_50HHZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Voyager Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1419 , 1 , 22) 
end
--------------------50级圣职紫武宝箱
function ItemUse_50SZZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Cleric Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0103 , 1 , 22) 
end
--------------------50级封印紫武宝箱
function ItemUse_50FYZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 50 Seal Master Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0102 , 1 , 22) 
end



--------------------60级双剑紫武宝箱
function ItemUse_60SJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Crusader Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1393 , 1 , 22) 
end
--------------------60级巨剑紫武宝箱
function ItemUse_60JJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Champion Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1374 , 1 , 22) 
end
--------------------60级狙击紫武宝箱
function ItemUse_60JUJZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Sharpshooter Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0041 , 1 , 22) 
end
--------------------60级航海紫武宝箱
function ItemUse_60HHZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Voyager Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1420 , 1 , 22) 
end
--------------------60级圣职紫武宝箱
function ItemUse_60SZZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Cleric Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4303 , 1 , 22) 
end
--------------------60级封印紫武宝箱
function ItemUse_60FYZWBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to use Lv 60 Seal Master Chest of Magenta")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 4300 , 1 , 22) 
end
--------------------纯真之心，重生之心
function ItemUse_CZZX( role , Item )
	local statelv = 1
	local statetime = 30
	local Item_ID=GetItemID(Item)
	AddState( role , role , STATE_CZZX , statelv , statetime )
	if Item_ID~=1013 then
		GiveItem ( role , 0 , 1010 , 1 , 4)
	end
--		SystemNotice( role , "该物品已被病毒腐蚀,不能使用." )
--		UseItemFailed ( role )
end
--------------------辉煌礼炮
function ItemUse_HHLP( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	local star = 0


	if CheckDateNum >= 10122  and CheckDateNum <= 10123 then
		ItemUse_XNBOX ( role , Item )


	--if CheckDateNum >= 100122  and CheckDateNum <= 100123 then
		--star=1
	--end
	--if CheckDateNum >= 100622  and CheckDateNum <= 100623 then
		--star=1
	--end
	--if star ==1 then
		--ItemUse_BaoZhaBOX ( role , Item )	
	end
end
--------------------嘎纳之神
function ItemUse_GNZS( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		local attr_sta = GetChaAttr( role , ATTR_STA )
		local sta_extre = 5
		attr_sta = attr_sta + sta_extre 
		SetCharaAttr( attr_sta, role, ATTR_STA )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end
--------------------技能精灵蛋
function ItemUse_JNJLD( role , Item )
	local star=math.random ( 1, 10 )
	local r1 = 0
	local r2 = 0
	if star==1 then
		r1,r2=MakeItem( role , 183 , 1 , 4)
	elseif  star==2 then
		r1,r2=MakeItem( role , 184 , 1 , 4)
	elseif  star==3 then
		r1,r2=MakeItem( role , 185 , 1 , 4)
	elseif  star==4 then
		r1,r2=MakeItem( role , 186 , 1 , 4)
	elseif  star==5 then
		r1,r2=MakeItem( role , 187 , 1 , 4)
	elseif  star==6 then
		r1,r2=MakeItem( role , 188 , 1 , 4)
	elseif  star==7 then
		r1,r2=MakeItem( role , 189 , 1 , 4)
	elseif  star==8 then
		r1,r2=MakeItem( role , 190 , 1 , 4)
	elseif  star==9 then
		r1,r2=MakeItem( role , 191 , 1 , 4)
	else  
		r1,r2=MakeItem( role , 199 , 1 , 4)
	end
	local Item_newJL = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
	local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )	--Get Num Part 1 到 Part 7
	local Part2_newJL = GetNum_Part2 ( Num_newJL )	
	local Part3_newJL = GetNum_Part3 ( Num_newJL )
	local Part4_newJL = GetNum_Part4 ( Num_newJL )
	local Part5_newJL = GetNum_Part5 ( Num_newJL )
	local Part6_newJL = GetNum_Part6 ( Num_newJL )
	local Part7_newJL= GetNum_Part7 ( Num_newJL )
	local t={}
		t[0]=1
		t[1]=2
		t[2]=3
		t[3]=4
		t[4]=5
	local eleven=math.random ( 1,3 )
	Part2_newJL=t[eleven-1]
	Part4_newJL=t[eleven]
	Part6_newJL=t[eleven+1]
	Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
	Num_newJL = SetNum_Part3 ( Num_newJL , 1 )
	Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
	Num_newJL = SetNum_Part5 ( Num_newJL , 1 )
	Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
	Num_newJL = SetNum_Part7 ( Num_newJL , 1 )
	SetItemForgeParam ( Item_newJL , 1 , Num_newJL )
end
-----------------------------------------------------------
--怪物召唤
function ItemUse_NSSN ( role , Item  )
	local cha_name = GetChaDefaultName ( role )
	LG( "KaiXiaoBaoDeSB" ,cha_name )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local star = 0
	star =IsChaInRegion( role, 2 )
	if star == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 857
	local Refresh = 3700					--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end
-----------------------------------------------------------
--女神的小包
function ItemUse_NSDXB ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient slot in inventory. Failed to activate Goddess's Pouch")
		UseItemFailed ( role )
		return
	end
	local star=math.random ( 1, 12 )
	local r1 = 0
	local r2 = 0
	if star==1 then
		r1,r2=MakeItem( role , 619 , 1 , 4)
	elseif star==2 then
		r1,r2=MakeItem( role , 625 , 1 , 4)
	elseif  star==3 then
		r1,r2=MakeItem( role , 628 , 1 , 4)
	elseif  star==4 then
		r1,r2=MakeItem( role , 631 , 1 , 4)
	elseif  star==5 then
		r1,r2=MakeItem( role , 634 , 1 , 4)
	elseif  star==6 then
		r1,r2=MakeItem( role , 674 , 1 , 4)
	elseif  star==7 then
		r1,r2=MakeItem( role , 698 , 1 , 4)
	elseif  star==8 then
		r1,r2=MakeItem( role , 701 , 1 , 4)
	else 
		local eleven =math.random ( 2530, 2548 )
		r1,r2=MakeItem( role , eleven , 1 , 4)
	end
	local Item_new = GetChaItem ( role , 2 , r2 )			--取道具指针
	local Item_ID = GetItemID ( Item_new )
	local itemname = GetItemName (Item_ID) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens Goddess's Pouch and obtain "..itemname  
	Notice ( message )
end
----加纳宝箱
function ItemUse_JaNaBox ( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 1012 , 1 , 4) 			
	local itemname = GetItemName (1012) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.." opens Chest of Ascaron and obtain "..itemname  
	Notice ( message )
end


--------黑市商人黑市装备--Leo
function gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local cha_name = GetChaDefaultName ( role ) 
	local General = 0  
	local ItemId = 0 
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号

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
	if ItemId==0845 or ItemId==0846 or ItemId==0847 or ItemId==0848 then
		local check_rad = math.random ( 1, 100 )
		local heilong_rad = math.random ( 1, 1000 )
		if check_rad==99 and heilong_rad>=999 then
			item_quality=16
		elseif  check_rad==99 and  heilong_rad>=900 then 
			item_quality=15
		elseif  check_rad==99 and  heilong_rad>=500 then 
			item_quality=14
		elseif  check_rad==99 and  heilong_rad>=200 then 
			item_quality=13
		elseif  check_rad==99 then  
			item_quality=12
		else 
			ItemId=0266
		end
	end	
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality )
	local GoodItem = {}
	GoodItem[0] = 0845
	GoodItem[1] = 0846
	GoodItem[2] = 0847
	GoodItem[3] = 0848
	GoodItem[4] = 0266
	local Good_C = 0
	for Good_C = 0 , 4 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local message = cha_name.." opens a Black Market Equipment and obtain "..itemname  
			Notice ( message )
		end
	end
	--LG( "HeiShiZhangBei_XinXi" , cha_name , ItemId )

	return 1
end

--游龙宝箱24型
function ItemUse_jsyla( role , Item )
	local item_quality =BaoXiang_jsyla_Qua
	local maxitem = BaoXiang_jsyla_Mxcount
	local item_type = BaoXiang_jsyla
	local item_type_rad =BaoXiang_jsyla_Rad

	local item_type_count =BaoXiang_jsyla_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--游龙宝箱23型
function ItemUse_jsylb( role , Item )
	local item_quality =BaoXiang_jsylb_Qua
	local maxitem =BaoXiang_jsylb_Mxcount
	local item_type = BaoXiang_jsylb
	local item_type_rad =BaoXiang_jsylb_Rad

	local item_type_count =BaoXiang_jsylb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷之利刃宝箱24型
function ItemUse_jsmzlra( role , Item )
	local item_quality =BaoXiang_jsmzlra_Qua
	local maxitem =BaoXiang_jsmzlra_Mxcount
	local item_type = BaoXiang_jsmzlra
	local item_type_rad =BaoXiang_jsmzlra_Rad

	local item_type_count =BaoXiang_jsmzlra_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷之利刃宝箱23型
function ItemUse_jsmzlrb( role , Item )
	local item_quality =BaoXiang_jsmzlrb_Qua
	local maxitem =BaoXiang_jsmzlrb_Mxcount
	local item_type = BaoXiang_jsmzlrb
	local item_type_rad =BaoXiang_jsmzlrb_Rad

	local item_type_count =BaoXiang_jsmzlrb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--巨阙宝箱24型
function ItemUse_jsjqa( role , Item )
	local item_quality =BaoXiang_jsjqa_Qua
	local maxitem =BaoXiang_jsjqa_Mxcount
	local item_type = BaoXiang_jsjqa
	local item_type_rad =BaoXiang_jsjqa_Rad

	local item_type_count =BaoXiang_jsjqa_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--巨阙宝箱23型
function ItemUse_jsjqb( role , Item )
	local item_quality =BaoXiang_jsjqb_Qua
	local maxitem =BaoXiang_jsjqb_Mxcount
	local item_type = BaoXiang_jsjqb
	local item_type_rad =BaoXiang_jsjqb_Rad

	local item_type_count =BaoXiang_jsjqb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷之裁决宝箱24型
function ItemUse_jsmzcja( role , Item )
	local item_quality =BaoXiang_jsmzcja_Qua
	local maxitem =BaoXiang_jsmzcja_Mxcount
	local item_type = BaoXiang_jsmzcja
	local item_type_rad =BaoXiang_jsmzcja_Rad

	local item_type_count =BaoXiang_jsmzcja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷之裁决宝箱23型
function ItemUse_jsmzcjb( role , Item )
	local item_quality =BaoXiang_jsmzcjb_Qua
	local maxitem =BaoXiang_jsmzcjb_Mxcount
	local item_type = BaoXiang_jsmzcjb
	local item_type_rad =BaoXiang_jsmzcjb_Rad

	local item_type_count =BaoXiang_jsmzcjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--双剑盔甲宝箱24型
function ItemUse_jssjkja( role , Item )
	local item_quality =BaoXiang_jssjkja_Qua
	local maxitem =BaoXiang_jssjkja_Mxcount
	local item_type = BaoXiang_jssjkja
	local item_type_rad =BaoXiang_jssjkja_Rad

	local item_type_count =BaoXiang_jssjkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--双剑盔甲宝箱23型
function ItemUse_jssjkjb( role , Item )
	local item_quality =BaoXiang_jssjkjb_Qua
	local maxitem =BaoXiang_jssjkjb_Mxcount
	local item_type = BaoXiang_jssjkjb
	local item_type_rad =BaoXiang_jssjkjb_Rad

	local item_type_count =BaoXiang_jssjkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--狙击盔甲宝箱24型
function ItemUse_jszjkja( role , Item )
	local item_quality =BaoXiang_jszjkja_Qua
	local maxitem =BaoXiang_jszjkja_Mxcount
	local item_type = BaoXiang_jszjkja
	local item_type_rad =BaoXiang_jszjkja_Rad

	local item_type_count =BaoXiang_jszjkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--狙击盔甲宝箱23型
function ItemUse_jszjkjb( role , Item )
	local item_quality =BaoXiang_jszjkjb_Qua
	local maxitem =BaoXiang_jszjkjb_Mxcount
	local item_type = BaoXiang_jszjkjb
	local item_type_rad =BaoXiang_jszjkjb_Rad

	local item_type_count =BaoXiang_jszjkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--圣职盔甲宝箱24型
function ItemUse_jsszkja( role , Item )
	local item_quality =BaoXiang_jsszkja_Qua
	local maxitem =BaoXiang_jsszkja_Mxcount
	local item_type = BaoXiang_jsszkja
	local item_type_rad =BaoXiang_jsszkja_Rad

	local item_type_count =BaoXiang_jsszkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--圣职盔甲宝箱23型
function ItemUse_jsszkjb( role , Item )
	local item_quality =BaoXiang_jsszkjb_Qua
	local maxitem =BaoXiang_jsszkjb_Mxcount
	local item_type = BaoXiang_jsszkjb
	local item_type_rad =BaoXiang_jsszkjb_Rad

	local item_type_count =BaoXiang_jsszkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--封印盔甲宝箱24型
function ItemUse_jsfykja( role , Item )
	local item_quality =BaoXiang_jsfykja_Qua
	local maxitem =BaoXiang_jsfykja_Mxcount
	local item_type = BaoXiang_jsfykja
	local item_type_rad =BaoXiang_jsfykja_Rad

	local item_type_count =BaoXiang_jsfykja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--封印盔甲宝箱23型
function ItemUse_jsfykjb( role , Item )
	local item_quality =BaoXiang_jsfykjb_Qua
	local maxitem =BaoXiang_jsfykjb_Mxcount
	local item_type = BaoXiang_jsfykjb
	local item_type_rad =BaoXiang_jsfykjb_Rad

	local item_type_count =BaoXiang_jsfykjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--航海盔甲宝箱24型
function ItemUse_jshhkja( role , Item )
	local item_quality =BaoXiang_jshhkja_Qua
	local maxitem =BaoXiang_jshhkja_Mxcount
	local item_type = BaoXiang_jshhkja
	local item_type_rad =BaoXiang_jshhkja_Rad

	local item_type_count =BaoXiang_jshhkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--航海盔甲宝箱23型
function ItemUse_jshhkjb( role , Item )
	local item_quality =BaoXiang_jshhkjb_Qua
	local maxitem =BaoXiang_jshhkjb_Mxcount
	local item_type = BaoXiang_jshhkjb
	local item_type_rad =BaoXiang_jshhkjb_Rad

	local item_type_count =BaoXiang_jshhkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--巨剑盔甲宝箱24型
function ItemUse_jsjjkja( role , Item )
	local item_quality =BaoXiang_jsjjkja_Qua
	local maxitem =BaoXiang_jsjjkja_Mxcount
	local item_type = BaoXiang_jsjjkja
	local item_type_rad =BaoXiang_jsjjkja_Rad

	local item_type_count =BaoXiang_jsjjkja_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--巨剑盔甲宝箱23型
function ItemUse_jsjjkjb( role , Item )
	local item_quality =BaoXiang_jsjjkjb_Qua
	local maxitem =BaoXiang_jsjjkjb_Mxcount
	local item_type = BaoXiang_jsjjkjb
	local item_type_rad =BaoXiang_jsjjkjb_Rad

	local item_type_count =BaoXiang_jsjjkjb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--黑龙之躯宝箱24型
function ItemUse_jshlza( role , Item )
	local item_quality =BaoXiang_jshlza_Qua
	--local 
	local maxitem =BaoXiang_jshlza_Mxcount
	local item_type = BaoXiang_jshlza
	local item_type_rad =BaoXiang_jshlza_Rad

	local item_type_count =BaoXiang_jshlza_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--黑龙之躯宝箱23型
function ItemUse_jshlzb( role , Item )
	local item_quality =BaoXiang_jshlzb_Qua
	local maxitem =BaoXiang_jshlzb_Mxcount
	local item_type = BaoXiang_jshlzb
	local item_type_rad =BaoXiang_jshlzb_Rad

	local item_type_count =BaoXiang_jshlzb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--黑龙之首宝箱24型
function ItemUse_jshlta( role , Item )
	local item_quality =BaoXiang_jshlta_Qua
	local maxitem =BaoXiang_jshlta_Mxcount
	local item_type = BaoXiang_jshlta
	local item_type_rad =BaoXiang_jshlta_Rad

	local item_type_count =BaoXiang_jshlta_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--黑龙之爪宝箱24型
function ItemUse_jshlsa( role , Item )
	local item_quality =BaoXiang_jshlsa_Qua
	local maxitem =BaoXiang_jshlsa_Mxcount
	local item_type = BaoXiang_jshlsa
	local item_type_rad =BaoXiang_jshlsa_Rad

	local item_type_count =BaoXiang_jshlsa_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--黑龙之爪宝箱23型
function ItemUse_jshlsb( role , Item )
	local item_quality =BaoXiang_jshlsb_Qua
	local maxitem =BaoXiang_jshlsb_Mxcount
	local item_type = BaoXiang_jshlsb
	local item_type_rad =BaoXiang_jshlsb_Rad

	local item_type_count =BaoXiang_jshlsb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--黑龙之翼宝箱24型
function ItemUse_jshlya( role , Item )
	local item_quality =BaoXiang_jshlya_Qua
	local maxitem =BaoXiang_jshlya_Mxcount
	local item_type = BaoXiang_jshlya
	local item_type_rad =BaoXiang_jshlya_Rad

	local item_type_count =BaoXiang_jshlya_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--黑龙之翼宝箱23型
function ItemUse_jshlyb( role , Item )
	local item_quality =BaoXiang_jshlyb_Qua
	local maxitem =BaoXiang_jshlyb_Mxcount
	local item_type = BaoXiang_jshlyb
	local item_type_rad =BaoXiang_jshlyb_Rad

	local item_type_count =BaoXiang_jshlyb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷幻之刺宝箱24型
function ItemUse_jsmhzca( role , Item )
	local item_quality =BaoXiang_jsmhzca_Qua
	local maxitem =BaoXiang_jsmhzca_Mxcount
	local item_type = BaoXiang_jsmhzca
	local item_type_rad =BaoXiang_jsmhzca_Rad

	local item_type_count =BaoXiang_jsmhzca_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷幻之刺宝箱23型
function ItemUse_jsmhzcb( role , Item )
	local item_quality =BaoXiang_jsmhzcb_Qua
	local maxitem =BaoXiang_jsmhzcb_Mxcount
	local item_type = BaoXiang_jsmhzcb
	local item_type_rad =BaoXiang_jsmhzcb_Rad

	local item_type_count =BaoXiang_jsmhzcb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷咒法杖宝箱24型
function ItemUse_jsmzfza( role , Item )
	local item_quality =BaoXiang_jsmzfza_Qua
	local maxitem =BaoXiang_jsmzfza_Mxcount
	local item_type = BaoXiang_jsmzfza
	local item_type_rad =BaoXiang_jsmzfza_Rad

	local item_type_count =BaoXiang_jsmzfza_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷咒法杖宝箱23型
function ItemUse_jsmzfzb( role , Item )
	local item_quality =BaoXiang_jsmzfzb_Qua
	local maxitem =BaoXiang_jsmzfza_Mxcount
	local item_type = BaoXiang_jsmzfzb
	local item_type_rad =BaoXiang_jsmzfzb_Rad

	local item_type_count =BaoXiang_jsmzfzb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷法之杖宝箱24型
function ItemUse_jsmfzza( role , Item )
	local item_quality =BaoXiang_jsmfzza_Qua
	local maxitem =BaoXiang_jsmfzza_Mxcount
	local item_type = BaoXiang_jsmfzza
	local item_type_rad =BaoXiang_jsmfzza_Rad

	local item_type_count =BaoXiang_jsmfzza_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷法之杖宝箱23型
function ItemUse_jsmfzzb( role , Item )
	local item_quality =BaoXiang_jsmfzzb_Qua
	local maxitem =BaoXiang_jsmfzzb_Mxcount
	local item_type = BaoXiang_jsmfzzb
	local item_type_rad =BaoXiang_jsmfzzb_Rad

	local item_type_count =BaoXiang_jsmfzzb_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷之长枪宝箱24型
function ItemUse_jsmzcqa( role , Item )
	local item_quality =BaoXiang_jsmzcqa_Qua
	local maxitem =BaoXiang_jsmzcqa_Mxcount
	local item_type = BaoXiang_jsmzcqa
	local item_type_rad =BaoXiang_jsmzcqa_Rad

	local item_type_count =BaoXiang_jsmzcqa_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end

--迷之长枪宝箱23型
function ItemUse_jsmzcqa( role , Item )
	local item_quality =BaoXiang_jsmzcqa_Qua
	local maxitem =BaoXiang_jsmzcqa_Mxcount
	local item_type = BaoXiang_jsmzcqa
	local item_type_rad =BaoXiang_jsmzcqa_Rad

	local item_type_count =BaoXiang_jsmzcqa_Count
	local ret = gogogo(role,Item,item_type,item_type_rad,item_type_count,maxitem,item_quality)
end


--迷你黑龙包
function ItemUse_minibh( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 10000 )
	if star==1 then
		GiveItem ( role , 0 , 272  , 1 , 4  )
		local message = cha_name.." opens a Mini Black Dragon Bag and obtained the Grand Prize: Black Dragon Set" 
		Notice ( message )
	elseif star>1 and star<=51 then
		GiveItem ( role , 0 , 273  , 1 , 4  ) 
		local message1 = cha_name.." opens a Mini Black Dragon Bag and obtained the First Prize: Happy Holiday Magazine" 
		Notice ( message1 )
	elseif star>51 and star<1652 then
		GiveItem ( role , 0 , 274  , 1 , 4  ) 
	else
		GiveItem ( role , 0 , 275  , 1 , 4  ) 
	end
end
--卡拉的胜利
function ItemUse_kala( role , Item )
--	SystemNotice(role ,"The time has lots its effect after being abandon for too long, don't be too sad.")
	local statelv = 1
	local statetime = 20
	AddState( role , role , STATE_KALA , statelv , statetime )
end
-----------------------------------------------------------
--怪物召唤
function ItemUse_MHDYSD ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local star = 0
	star =IsChaInRegion( role, 2 )
	if star == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	--local pet_num = GetPetNum(role)
	--if pet_num > 1 then
	--	SystemNotice( role , "You have reached the maximum number of pets!" )
	--	return
	--end
	local x, y = GetChaPos(role)
	local MonsterID = 858
	local Refresh = 190					--重生时间，秒单位
	local life = 180000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	--SetChaHost(new,role)
	SetChaLifeTime( new, life )
	--SetChaTarget(new, role)
end
----------魔幻女神卡
function ItemUse_mohuan( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 1000 )
	SystemNotice(role ,"star=="..star)
	if star<=8 then
		GiveItem ( role , 0 , 1014  , 1 , 4  )
		local message = cha_name.." opens a Enchanting Goddess Card and obtained Goddess's Trainee Ceremony" 
		Notice ( message )
	elseif star>=9 and star<=17 then
		GiveItem ( role , 0 , 271, 1 , 4  ) 
		local message1 = cha_name.." opens an Enchanting Goddess Card and obtained Angelic Dice" 
		Notice ( message1 )
	elseif star>=18 and star<=27 then
		GiveItem ( role , 0 , 1012, 1 , 4  ) 
		local message3 = cha_name.." opens Enchanting Goddess Card and obtain a Gem of Soul" 
		Notice ( message3 )
	elseif star>=28 and star<=227 then
		GiveItem ( role , 0 , 3886, 1 , 4  ) 
	else
		GiveItem ( role , 0 , 3830, 5 , 4  ) 
	end
end
----------魔幻字母卡宝箱
function ItemUse_MoHuanBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local star=math.random ( 1, 4663 )
	if star>=1 and star<=3 then
		GiveItem ( role , 0 , 3866, 1 , 4  ) 	
	elseif star>=4 and star<=14 then
		GiveItem ( role , 0 , 3864, 1 , 4  ) 		
	elseif star>=15 and star<=65 then
		GiveItem ( role , 0 , 3858, 1 , 4  )		
	else
		local star=math.random ( 3850, 3875 )
		if star==3858 or star==3864 or star==3866  then
			GiveItem ( role , 0 , 3850  , 1 , 4  )
		else 
			GiveItem ( role , 0 , star  , 1 , 4  ) 			
		end
	end
end
-----------------------------------------初级精灵自爆
function Sk_Script_CJJLZB( role , Item ) 							
 	local sk_add = SK_JLZB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
 -----------------------------------------中级精灵自爆
function Sk_Script_ZJJLZB ( role , Item ) 							
  	local sk_add = SK_JLZB
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 2 then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 2 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
 -----------------------------------------高级精灵自爆
function Sk_Script_GJJLZB( role , Item ) 							
   	local sk_add = SK_JLZB  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 3  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 3 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
---------------------------模糊的图纸
function ItemUse_MHDTZ( role , Item ) 							
 	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"To open Blurry Blueprint requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end  	
	local r1 = 0
	local r2 = 0
	local item_ID=GetItemID(Item)
	local Itemnew_ID=2300
	local rad_ID=math.random ( 1, 100 )
	if rad_ID<=40 then
		Itemnew_ID=2300  --------制造图纸
	elseif rad_ID>=41 and rad_ID<=81 then
		Itemnew_ID=2302  --------烹饪图纸
	else
		Itemnew_ID=2301  --------铸造图纸
	end
	r1, r2 = MakeItem ( role , Itemnew_ID  , 1 , 4 )
	local Itemnew = GetChaItem ( role , 2 , r2 )


	local rad_energy=math.random ( 1, 100 )
	local energy = 1--------新手级图纸
	if item_ID==1000 then-------新手级模糊图纸
		energy=1
	elseif item_ID==1001 then -------初级模糊图纸
		if rad_energy<=5 then
			energy=4
		elseif  rad_energy<=30 and rad_energy>=6 then
			energy=3
		else
			energy=2
		end
	elseif item_ID==1002 then -------中级模糊图纸
		if rad_energy<=5 then
			energy=6
		elseif  rad_energy<=30 and rad_energy>=6 then
			energy=5
		else
			energy=4
		end
	elseif item_ID==1003 then -------高级模糊图纸
		if rad_energy<=5 and Itemnew_ID~=2301 then------------铸造不产出80级物品
			energy=8
		elseif  rad_energy<=30 and rad_energy>=6 then
			energy=7
		else
			energy=6
		end
	end	
	--SystemNotice(role ,"item_ID=="..item_ID)
	--SystemNotice(role ,"rad_energy=="..rad_energy)
	--SystemNotice(role ,"energy=="..energy)

	local final_ID=1849 --------默认蛋糕
	local final_LV=20 --------默认20
	local final_ID1=3116 --------默认精灵果
	local final_ID2=3116 --------默认精灵果
	local final_ID3=3116 --------默认精灵果
	------首先取到生成物品的ID
	local General = 0  
	local ItemId =3124
	if Itemnew_ID==2300 then -----制造
		local STAR_BEGIN=ZHIZAO_Mxcount*(energy-1)/10+1
		local STAR_END=ZHIZAO_Mxcount*energy/10
	--SystemNotice(role ,"STAR_BEGIN=="..STAR_BEGIN)
	--SystemNotice(role ,"STAR_END=="..STAR_END)

		for i = STAR_BEGIN , STAR_END , 1 do 
		    General = ZHIZAO__Rad[ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local k = 0 
		local c = -1									--命中物品编号
		for k = STAR_BEGIN , STAR_END , 1 do				-- 随机出添加的前缀编号
			d = ZHIZAO__Rad[ k ] + b
			if a <= d and a > b then
				c = k
				break 
			end 
			b = d 
		end 
		if c == -1 then
			c =STAR_BEGIN
		end
	--SystemNotice(role ,"c=="..c)

		--local rad_num1=math.random ( 1, 280 )
		final_ID=ZHIZAO_ID[c]
		final_LV=ZHIZAO_LV[c]
		final_ID1=ZHIZAO_ID1[c]
		final_ID2=ZHIZAO_ID2[c]
		final_ID3=ZHIZAO_ID3[c]

	end
	if Itemnew_ID==2301 then -----铸造
		local STAR_BEGIN=1
		local STAR_END=77
		if energy==1 then
			STAR_BEGIN=1
			STAR_END=77
		elseif energy==2 then
			STAR_BEGIN=78
			STAR_END=166
		elseif energy==3 then
			STAR_BEGIN=167
			STAR_END=278
		elseif energy==4 then
			STAR_BEGIN=279
			STAR_END=434
		elseif energy==5 then
			STAR_BEGIN=435
			STAR_END=596
		elseif energy==6 then
			STAR_BEGIN=597
			STAR_END=732
		elseif energy==7 then
			STAR_BEGIN=733
			STAR_END=871--------872以后目前有问题
		elseif energy==8 then
			STAR_BEGIN=895
			STAR_END=902
		end
		--SystemNotice( role ,"energy=="..energy)
		--SystemNotice( role ,"STAR_BEGIN=="..STAR_BEGIN)
		--SystemNotice( role ,"STAR_END=="..STAR_END)

		for i = STAR_BEGIN , STAR_END , 1 do 
		    General = ZHUZAO__Rad[ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local k = 0 
		local c = -1									--命中物品编号
		for k = STAR_BEGIN , STAR_END , 1 do				-- 随机出添加的前缀编号
			d = ZHUZAO__Rad[ k ] + b
			if a <= d and a > b then
				c = k
				break 
				end 
			b = d 
		end 
		if c == -1 then
			c =STAR_BEGIN
		end
		--local rad_num2=math.random ( 1, 906 )
		final_ID=ZHUZAO_ID[c]
		final_LV=ZHUZAO_LV[c]
		final_ID1=ZHUZAO_ID1[c]
		final_ID2=ZHUZAO_ID2[c]
		final_ID3=ZHUZAO_ID3[c]		
		local final_type=GetItemType2(final_ID)
		local check=0
		local i = 0
		for i = 0 , Item_CanJinglian_Num  , 1 do
			if final_type == Item_CanJinglian_ID [i] then
				check=1
			end
		end
		--SystemNotice( role ,"check=="..check)

		if  check==1 then-----------------铸造武器或装备时
			local check_rad=math.random ( 1, 1000 )
			if check_rad==1 then
				final_LV=70
			elseif check_rad>=2 and check_rad<=11 then
				final_LV=60
			elseif check_rad>=12 and check_rad<=21 then
				final_LV=50
			elseif check_rad>=22 and check_rad<=221 then
				final_LV=40
			elseif check_rad>=222 and check_rad<=421 then
				final_LV=30
			elseif check_rad>=422 and check_rad<=621 then
				final_LV=20
			else
				final_LV=10				
			end
			if final_LV>70 then
				final_LV=70
			end
			--SystemNotice( role ,"check_energy=="..energy)

			if final_LV~=10 and final_LV~=0 then
				local tmd=(energy-1)*6+final_LV*0.1-1
			--SystemNotice( role ,"tmd=="..tmd)
				final_ID3=TESHU_ID[tmd]
			--SystemNotice( role ,"TESHU_ID[tmd]=="..TESHU_ID[tmd])
			end
		end
	end
	if Itemnew_ID==2302 then -----烹饪
		local STAR_BEGIN=1
		local STAR_END=80
		if energy==1 then
			STAR_BEGIN=1
			STAR_END=7
		elseif energy==2 then
			STAR_BEGIN=8
			STAR_END=12
		elseif energy==3 then
			STAR_BEGIN=13
			STAR_END=17
		elseif energy==4 then
			STAR_BEGIN=18
			STAR_END=26
		elseif energy==5 then
			STAR_BEGIN=27
			STAR_END=31
		elseif energy==6 then
			STAR_BEGIN=32
			STAR_END=36
		else
			STAR_BEGIN=energy+30
			STAR_END=energy+30             
		end
		for i = STAR_BEGIN , STAR_END , 1 do 
		    General = ZHIZAO__Rad[ i ] + General		
		end 
		local a = math.random ( 1, General )
		local b = 0
		local d = 0 
		local k = 0 
		local c = -1									--命中物品编号
		for k = STAR_BEGIN , STAR_END , 1 do				-- 随机出添加的前缀编号
			d = PENGREN__Rad[ k ] + b
			if a <= d and a > b then
				c = k
				break 
			end 
			b = d 
		end 
		if c == -1 then
			c =STAR_BEGIN
		end
		--local rad_num3=math.random ( 1, 40 )
		final_ID=PENGREN_ID[c]
		final_LV=PENGREN_LV[c]
		final_ID1=PENGREN_ID1[c]
		final_ID2=PENGREN_ID2[c]
		final_ID3=PENGREN_ID3[c]		
	end
	--SystemNotice(role ,"Blueprint level energy=="..energy)

	local star_number=energy*10
	local yingbi_num=math.random ( 10, star_number )
	if energy<=3 then
		SetItemAttr(Itemnew, ITEMATTR_MAXURE, energy )--精灵硬币需求
		SetItemAttr(Itemnew, ITEMATTR_URE, energy )--图纸等级		
	else
		SetItemAttr(Itemnew, ITEMATTR_MAXURE, yingbi_num )--精灵硬币需求
		SetItemAttr(Itemnew, ITEMATTR_URE, energy )--图纸等级
	end
	local sta =math.random ( 1, 10 )
	if Itemnew_ID==2301 then-------------铸造图纸使用次数减半
		sta=sta*0.5
		sta=math.max(1,sta)
	end
	SetItemAttr(Itemnew, ITEMATTR_VAL_STA, sta )--图纸使用次数
	--SetItemAttr(Itemnew, ITEMATTR_MAXURE, maxure )--图纸使用次数
	local qulity=math.floor(final_LV*0.1)+100
	SetItemAttr(Itemnew, ITEMATTR_MAXENERGY, qulity )--质量

	local ure=10-final_LV*0.1-------------要显示成百分比
	SetItemAttr(Itemnew, ITEMATTR_ENERGY, ure )--基本成功率
	--SetItemAttr(Itemnew, ITEMATTR_URE, ure )--基本成功率

	SetItemAttr(Itemnew, ITEMATTR_VAL_STR, final_ID1 )--需求道具1ID
	SetItemAttr(Itemnew, ITEMATTR_VAL_CON, final_ID2 )--需求道具2ID
	SetItemAttr(Itemnew, ITEMATTR_VAL_DEX, final_ID3 )--需求道具3ID
	SetItemAttr(Itemnew, ITEMATTR_VAL_AGI, final_ID )--生成物品ID

	local Num_new = GetItemForgeParam ( Itemnew , 1 )
	local Part2_new = GetNum_Part2 ( Num_new )	
	local Part4_new = GetNum_Part4 ( Num_new )
	local Part6_new = GetNum_Part6 ( Num_new )
	Part2_new = math.random ( 3, 20 )					--需求道具1数量 
	Part4_new = math.random ( 2, 9 )					--需求道具2数量
	Part6_new = math.random ( 1, 3 )					--需求道具3数量
	Part6_new = Part6_new*math.max(1,(energy-2))					--需求道具3数量
	Num_new = SetNum_Part2 ( Num_new , Part2_new )
	Num_new = SetNum_Part4 ( Num_new , Part4_new )
	Num_new = SetNum_Part6 ( Num_new , Part6_new )
	SetItemForgeParam ( Itemnew , 1 , Num_new )

end 
--Sk_Script_GS
--Sk_Script_NK
--Sk_Script_JQ
-----------------------------------------Sk_Script_DBs
function Sk_Script_DBs( role , Item ) 							
 	local sk_add = SK_JLTX1  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
-----------------------------------------Sk_Script_NKs
function Sk_Script_NKs( role , Item ) 							
 	local sk_add = SK_JLTX2  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
-----------------------------------------Sk_Script_XZs
function Sk_Script_XZs( role , Item ) 							
 	local sk_add = SK_JLTX3  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
-----------------------------------------Sk_Script_JQs
function Sk_Script_JQs( role , Item ) 							
 	local sk_add = SK_JLTX4  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
-----------------------------------------Sk_Script_BCs
function Sk_Script_BCs( role , Item ) 							
 	local sk_add = SK_JLTX5  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
-----------------------------------------Sk_Script_BSs
function Sk_Script_BSs( role , Item ) 							
 	local sk_add = SK_JLTX6  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
-----------------------------------------Sk_Script_PZs
function Sk_Script_PZs( role , Item ) 							
 	local sk_add = SK_JLTX7  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
-----------------------------------------Sk_Script_SZs
function Sk_Script_SZs( role , Item ) 							
 	local sk_add = SK_JLTX8  
	local form_sklv = GetSkillLv( role , sk_add ) 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
--------------------------团队之星
function ItemUse_TunDuiZhiXing( role , Item ) 							
   	local r1 = 0
	local r2 = 0
	r1, r2 = MakeItem ( role , 1034 , 1 , 4 )
	local Itemnew = GetChaItem ( role , 2 , r2 )
	--SetItemAttr(Itemnew, ITEMATTR_ENERGY, 100 )--当前存储经验
	--SetItemAttr(Itemnew, ITEMATTR_MAXENERGY, 201000 )--最高存储经验
	SetItemAttr(Itemnew, ITEMATTR_URE, 100 )--当前存储经验
	SetItemAttr(Itemnew, ITEMATTR_MAXURE, 20100 )--最高存储经验
end 
----------------------微型努力征服器
function ItemUse_WeiXing( role , Item )
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end
	local lv_star = GetChaAttr( role , ATTR_LV) 
	if lv_star > 40 then
		SystemNotice ( role , "Effective only for those below Lv 40" )
		UseItemFailed ( role )
		return
	end
	local statetime = 60+5*(lv_star-1)
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
end
----------------------------------------------------
function ItemUse_JLZhiZ_CJ ( role , Item , Item_Traget )   --初级精灵制造术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 13		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLZhiZ_ZJ ( role , Item , Item_Traget )   --中级精灵制造术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 13		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLZhiZ_GJ ( role , Item , Item_Traget )   --高级精灵制造术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 3		--要增加的 Skill 类型
		local SkillNum = 13		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLZhuZ_CJ ( role , Item , Item_Traget )   --初级精灵铸造术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 14		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLZhuZ_ZJ ( role , Item , Item_Traget )   --中级精灵铸造术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 14		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLZhuZ_GJ ( role , Item , Item_Traget )   --高级精灵铸造术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 3		--要增加的 Skill 类型
		local SkillNum = 14		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLFenJ_CJ ( role , Item , Item_Traget )   --初级精灵分解术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 15		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLFenJ_ZJ ( role , Item , Item_Traget )   --中级精灵分解术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 15		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLFenJ_GJ ( role , Item , Item_Traget )   --高级精灵分解术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 3		--要增加的 Skill 类型
		local SkillNum = 15		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLPengR_CJ ( role , Item , Item_Traget )   --初级精灵烹饪术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 1		--要增加的 Skill 类型
		local SkillNum = 16		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLPengR_ZJ ( role , Item , Item_Traget )   --中级精灵烹饪术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 2		--要增加的 Skill 类型
		local SkillNum = 16		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------------------------
function ItemUse_JLPengR_GJ ( role , Item , Item_Traget )   --高级精灵烹饪术
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
		local Item_type =  GetItemType ( Item )
		local Item_Traget_Type =  GetItemType ( Item_Traget )
		local Num = GetItemForgeParam ( Item_Traget , 1 )	 --精灵32位技能信息数据
		local SkillType = 3		--要增加的 Skill 类型
		local SkillNum = 16		--要增加的Skill 编号

		if Item_type == 58 and Item_Traget_Type == 59 then
			local Check = CheckElfHaveSkill ( Num , SkillType , SkillNum )
			if Check == 1 then
				SystemNotice(role , "have target skill, usage failed" ) 
				UseItemFailed ( role )
			else
				AddElfSkill ( Item_Traget , SkillType , SkillNum )
			end
		end
end
----------------------------------乱斗宝盒
function ItemUse_FightingBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"You need at least 2 empty inventory slots to open the Chaos Chest")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2610  , 1 , 4 )
	local rad = math.random ( 1, 3 )
	if rad ==1 then
	GiveItem ( role , 0 , 1124  , 1 , 15 )	
	end
	
	if rad ==2 then
	GiveItem ( role , 0 , 1125  , 1 , 15 )	
	end
	
	if rad ==3 then
	GiveItem ( role , 0 , 1126  , 1 , 15 )	
	end
end
---------------------------------鳕鱼闷闷锅：最大HP+100，物力抵抗+1，时间15分钟
function ItemUse_XUEYU( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 900
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------翠竹花脸鲟：最大HP+400，物力抵抗+2，时间10分钟
function ItemUse_CUIZHU( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 600
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------回香射水鱼：最大HP+900，物力抵抗+2，时间10分钟
function ItemUse_HUIXIANG( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 3
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 600
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------映月鲟鱼汤：最大HP+1600，物力抵抗+3，时间8分钟
function ItemUse_YINGYUE( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime =480
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------浪贝煨煎羹：最大HP+2500，物力抵抗+3，时间8分钟
function ItemUse_LANGBEI( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv =5
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 480
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------小小跳虾饺：最大HP+3600，物力抵抗+4，时间6分钟
function ItemUse_XIAOXIAO( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 6
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 360
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------虎皮鱼骨酥：最大HP+4900，物力抵抗+5，时间5分钟
function ItemUse_HUPI( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv =7
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 300
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------银鲛海鲜饭：最大HP+6400，物力抵抗+6，时间3分钟
function ItemUse_YINJIAO( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 8
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 180
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------陶土网纹鰧：最大HP+8100，物力抵抗+6，时间3分钟
function ItemUse_TAOTU( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 9
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 180
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------百万烤鱼翅：最大HP+10000，物力抵抗+8，时间1分钟
function ItemUse_BAIWANG( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local statelv = 10
	local ChaStateLv = GetChaStateLv ( role , STATE_XUEYU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime =60
	AddState( role , role , STATE_XUEYU , statelv , statetime )
end 
---------------------------------- 馒头：HP+200，攻击力+50，时间15分钟
function ItemUse_MANTOU( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 200 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 900
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 
---------------------------------包子：HP+400，攻击力+150，时间10分钟
function ItemUse_BAOZI( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 400 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime =600
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 
---------------------------------大饼：HP+600，攻击力+250，时间7分钟
function ItemUse_DABING( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 600 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 3
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 420
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 
---------------------------------油条：HP+800，攻击力+350，时间5分钟
function ItemUse_YOUTIAO( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 800 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime =300
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 
---------------------------------春卷：HP+1000，攻击力+450，时间2分钟
function ItemUse_CHUNJUAN( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local hp = GetChaAttr( role , ATTR_HP ) 
	local hp_resume = 1000 
	hp = hp + hp_resume 
	local mxhp = GetChaAttr( role , ATTR_MXHP) 
	if hp > mxhp then 
		 hp = mxhp 
	 end 
	SetCharaAttr(hp, role, ATTR_HP) 
	local statelv = 5
	local ChaStateLv = GetChaStateLv ( role , STATE_MANTOU )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 120
	AddState( role , role , STATE_MANTOU , statelv , statetime )
end 
---------------------------------女儿红：SP+100，精神+5，时间15分钟
function ItemUse_NVER( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 100 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 900
	AddState( role , role , STATE_NVER , statelv , statetime )
end 
---------------------------------状元红：SP+200，精神+10，时间10分钟
function ItemUse_ZHUANGYUAN( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 200 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 600
	AddState( role , role , STATE_NVER , statelv , statetime )
end 
---------------------------------杜康：SP+300，精神+15，时间7分钟
function ItemUse_DUKANG( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 300 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 3
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 420
	AddState( role , role , STATE_NVER , statelv , statetime )
end 
---------------------------------茅台：SP+400，精神+20，时间5分钟
function ItemUse_MAOTAI( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 400 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 300
	AddState( role , role , STATE_NVER , statelv , statetime )
end 
---------------------------------人参酒：SP+500，精神+25，时间3分钟
function ItemUse_RENSHEN( role , Item )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 500 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 5
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 180
	AddState( role , role , STATE_NVER , statelv , statetime )
end 
---------------------------------虎骨酒：SP+600，精神+30，时间2分钟
function ItemUse_HUGU( role , Item ) 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~= nil then 
		SystemNotice( role , "Cannot use while sailing" ) 
		UseItemFailed ( role ) 
		return 
	end 
	local sp = GetChaAttr( role , ATTR_SP ) 
	local sp_resume = 600 
	sp = sp + sp_resume 
	local mxsp = GetChaAttr( role , ATTR_MXSP) 
	if sp > mxsp then 
		 sp = mxsp 
	 end 
	SetCharaAttr(sp, role, ATTR_SP) 
	local statelv = 6
	local ChaStateLv = GetChaStateLv ( role , STATE_NVER )
	if ChaStateLv > statelv then
		SystemNotice ( role , "You have used a higher level item of the same kind. Please try again later" )
		UseItemFailed ( role )
		return
	end
	local statetime = 120
	AddState( role , role , STATE_NVER , statelv , statetime )
end 
-------------------新式摩力酷装宝箱
function ItemUse_MOLIBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 4 empty inventory slots to open the Chest")
		UseItemFailed ( role )
		return
	end
	local rad = math.random ( 1, 12 )
	if rad == 1 then
	GiveItem ( role , 0 , 5107  , 1 , 4 ) 
	GiveItem ( role , 0 , 5108  , 1 , 4 ) 
	GiveItem ( role , 0 , 5109  , 1 , 4 ) 
	elseif rad == 2 then
	GiveItem ( role , 0 , 5111  , 1 , 4 ) 
	GiveItem ( role , 0 , 5112  , 1 , 4 ) 
	GiveItem ( role , 0 , 5113  , 1 , 4 ) 
	elseif rad == 3 then
	GiveItem ( role , 0 , 5115  , 1 , 4 ) 
	GiveItem ( role , 0 , 5116  , 1 , 4 ) 
	GiveItem ( role , 0 , 5117  , 1 , 4 ) 
	elseif rad == 4 then
	GiveItem ( role , 0 , 5119  , 1 , 4 ) 
	GiveItem ( role , 0 , 5120  , 1 , 4 ) 
	GiveItem ( role , 0 , 5121  , 1 , 4 ) 
	elseif rad == 5 then
	GiveItem ( role , 0 , 5123  , 1 , 4 ) 
	GiveItem ( role , 0 , 5124  , 1 , 4 ) 
	GiveItem ( role , 0 , 5125  , 1 , 4 )
	elseif rad == 6 then
	GiveItem ( role , 0 , 5127  , 1 , 4 ) 
	GiveItem ( role , 0 , 5128  , 1 , 4 ) 
	GiveItem ( role , 0 , 5129  , 1 , 4 )
	elseif rad == 7 then
	GiveItem ( role , 0 , 5130  , 1 , 4 ) 
	GiveItem ( role , 0 , 5131  , 1 , 4 ) 
	GiveItem ( role , 0 , 5132  , 1 , 4 )
	GiveItem ( role , 0 , 5133  , 1 , 4 )
	elseif rad == 8 then
	GiveItem ( role , 0 , 5134  , 1 , 4 ) 
	GiveItem ( role , 0 , 5135  , 1 , 4 ) 
	GiveItem ( role , 0 , 5136  , 1 , 4 )
	GiveItem ( role , 0 , 5137  , 1 , 4 )
	elseif rad == 9 then
	GiveItem ( role , 0 , 5138  , 1 , 4 ) 
	GiveItem ( role , 0 , 5139  , 1 , 4 ) 
	GiveItem ( role , 0 , 5140  , 1 , 4 )
	GiveItem ( role , 0 , 5141  , 1 , 4 )
	elseif rad == 10 then
	GiveItem ( role , 0 , 5143  , 1 , 4 ) 
	GiveItem ( role , 0 , 5144  , 1 , 4 ) 
	GiveItem ( role , 0 , 5145  , 1 , 4 ) 
	elseif rad == 11 then
	GiveItem ( role , 0 , 5147  , 1 , 4 ) 
	GiveItem ( role , 0 , 5148  , 1 , 4 ) 
	GiveItem ( role , 0 , 5149  , 1 , 4 )
	elseif rad == 12 then
	GiveItem ( role , 0 , 5151  , 1 , 4 ) 
	GiveItem ( role , 0 , 5152  , 1 , 4 ) 
	GiveItem ( role , 0 , 5153  , 1 , 4 )
	end
	--local cha_name = GetChaDefaultName ( role ) 
	--local message = cha_name.." opens Apparel Chest and obtain 1 apparel set"   
	--Notice ( message )
end

function ItemUse_IDBOX(role, Item )
	local lv = GetChaAttr(role, ATTR_LV)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	local cha_name = GetChaDefaultName ( role ) 
	local count = 1
	
	if lv < 60 then
		SystemNotice( role ,"Currently lower then Lv 60. Item usage failed!")
		UseItemFailed ( role )	
	else
		SystemNotice(role,"Event have ended, Thank You for your participation. Please refer to Pirate King Online official website for future events!")
	end
end 

---------------------荣誉加点书
function ItemUse_HonorPoint (role, Item )
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( role,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( role , "You do not have Mark of Honor")
		return 0
		end
	local Book2 =  GetChaItem2 ( role , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
	
	local HonorPoint_X=HonorPoint+100
	SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
	
end
-------------------------乱斗加点书
function ItemUse_FightingPoint (role, Item )
	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( role,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( role , "You do not have Mark of Honor")
		return 0
		end
	local Book2 =  GetChaItem2 ( role , 2 , 3849 )
	local FightingPoint=GetItemAttr ( Book2 , ITEMATTR_MAXENERGY)
	
	local FightingPoint_X=FightingPoint+100
	SetItemAttr ( Book2 , ITEMATTR_MAXENERGY,FightingPoint_X)
	
end
----------------------------[[美味火鸡肉]]--
function ItemUse_MWHJ ( role , Item )  
	local el_exp = GetChaAttr(role, ATTR_CEXP)
	local exp1=el_exp
	local charLv=Lv ( role )
	local exp_resume = 5000
	local	exp_resume_1= 100
	el_exp = el_exp + exp_resume
	 if charLv>=80 then	
		el_exp = exp1 + exp_resume_1
	end
	SetCharaAttr(el_exp, role, ATTR_CEXP) 
end 
------------------------圣诞大餐
function ItemUse_SDDC ( role , Item )
	local Cha_Boat = 0
	local charLv=Lv ( role )
	local dif_exp_one = DEXP[charLv+1]
	local dif_exp_three = DEXP[charLv+3]
	local dif_exp_five = DEXP[charLv+5]
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )----------当前等级经验
	local dif_exp_half = (DEXP[charLv+1] - DEXP[charLv])*0.5 +  Exp_star +10
	local dif_exp_thalf = (DEXP[charLv+1] - DEXP[charLv])*0.3  +  Exp_star + 10
	local dif_exp_thalf_b = dif_exp_thalf - DEXP[charLv+1]
	local dif_exp_thalf_c = (DEXP[charLv+1] - DEXP[charLv])*0.01+Exp_star ----------------
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	elseif charLv>=1 and charLv<=9 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_five )
	elseif charLv>=10 and charLv<=29 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_three )
	elseif charLv>=30 and charLv<=59 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_one )
	elseif charLv>=60 and charLv<=75 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_half )
	elseif charLv>=76 and charLv<=85 and charLv~=79  then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b<=0 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b>0 then 
			dif_exp_thalf = dif_exp_thalf_b*0.02 + DEXP[charLv+1]
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv>=86 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_c )-------------
		--SystemNotice( role , "Players above Lv 86 will obtain 1% experience upon usage" )--------------
	end
end
------------------------------------怪物召唤券--双击获得四个召唤券
function ItemUse_GWZHQ ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <=3 then
		SystemNotice(role ,"Not enough slots. You need at least 4 empty slots. Failed to open Posh Christmas Box")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2888  , 1 , 4) 
	GiveItem ( role , 0 , 2889  , 1 , 4)
	GiveItem ( role , 0 , 2890  , 1 , 4)
	GiveItem ( role , 0 , 2891  , 1 , 4)
end
---------------------------------火鸡召唤券--双击召唤火鸡宠物
function ItemUse_HJZHQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Not usable on the sea." )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 5 then
		SystemNotice( role , "Max of limit of 5 pets reached. Please try again later!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID =930     -------------------没毛火鸡
	local Refresh = 1800					--重生时间，秒单位
	local life = 1800000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

------------------------------麋鹿召唤券--双击召唤麋鹿

function ItemUse_MLZHQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Not usable on the sea." )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 5 then
		SystemNotice( role , "Max of limit of 5 pets reached. Please try again later!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID =931-----------------------麋鹿
	local Refresh = 3600					--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end
-----------------------------------雪人召唤券--双击召唤雪人
function ItemUse_XRZHQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Not usable on the sea." )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 5 then
		SystemNotice( role , "Max of limit of 5 pets reached. Please try again later!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID =932-----------------------------圣诞老人
	local Refresh = 7200					--重生时间，秒单位
	local life = 7200000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end

--------------------------------------------------圣诞老人召唤券--双击召唤圣诞老人

function ItemUse_SDZHQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Not usable on the sea." )
		UseItemFailed ( role )
		return
	end
	local pet_num = GetPetNum(role)
	if pet_num >= 5 then
		SystemNotice( role , "Max of limit of 5 pets reached. Please try again later!" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	x_resume = 5
	y_resume = 5
	x = x + x_resume
	y = y + y_resume
	local MonsterID =929-----------------------------圣诞老人
	local Refresh = 10800					--重生时间，秒单位
	local life = 10800000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaHost(new,role)
	SetChaLifeTime( new, life )
	SetChaTarget(new, role)
	PlayEffect( new, 361 )
end
---------------------------------------------圣诞大礼包--双击获得一系列道具
function ItemUse_SDDLB ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <=5 then
		SystemNotice(role ,"You require at least 6 empty inventory slots. Failed to open Christmas Box.")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2894  , 1 , 4) 
	GiveItem ( role , 0 , 2893  , 10 , 4) 
	GiveItem ( role , 0 , 2889  , 1 , 4) 
	GiveItem ( role , 0 , 2890 , 1 , 4) 
	GiveItem ( role , 0 , 2891  , 1 , 4) 
	GiveItem ( role , 0 , 2896  , 99 , 4) 
end


--------------------------------------------------------台湾机票1
function TW_Ticket_Script1(role, Item )
	local i = CheckBagItem(role,2446)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2446,1)
			if j == 1 then
				GoTo( role,  2816, 3255, "darkblue")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--------------------------------------------------------台湾机票2
function TW_Ticket_Script2(role, Item )
	local i = CheckBagItem(role,2447)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2447,1)
			if j == 1 then
				GoTo( role,  609 , 624 , "jialebi")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--------------------------------------------------------台湾机票3
function TW_Ticket_Script3(role, Item )
	local i = CheckBagItem(role,2491)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2491,1)
			if j == 1 then
				GoTo( role,  1080 , 210 , "jialebi" )
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end

--精美的圣诞礼盒
function ItemUse_JMSDBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount						-- 终结编号
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Not enough slots. Fail to open Posh Christmas Box")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号
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
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] =3084
	GoodItem[9] =3085
	GoodItem[10] =0244
	GoodItem[11] =0250
	GoodItem[12] =0253
	GoodItem[13] =0260
	GoodItem[14] =0860
	GoodItem[15] =0861
	GoodItem[16] =0862
	GoodItem[17] =3458
	GoodItem[18] =0247
	GoodItem[19] =0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." opens a Posh Christmas Box and obtained "..itemname  
			Notice ( message )
		end
	end
end



----------------------------------------------------------------------------------新年礼炮
function ItemUse_XNLP( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	local star = 0
	if CheckDateNum >= 10122  and CheckDateNum <= 10123 then
		ItemUse_XINBOX ( role , Item )	
	end
end
function ItemUse_XINBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount						-- 终结编号
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory slot. Usage of Grandiose Salute failed.")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号
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
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] =3084
	GoodItem[9] =3085
	GoodItem[10] =0244
	GoodItem[11] =0250
	GoodItem[12] =0253
	GoodItem[13] =0260
	GoodItem[14] =0860
	GoodItem[15] =0861
	GoodItem[16] =0862
	GoodItem[17] =3458
	GoodItem[18] =0247
	GoodItem[19] =0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." uses Grandiose Salute and obtained "..itemname  
			Notice ( message )
		end
	end
end

-------------------新年宝箱
function ItemUse_XNBOX( role , Item )
		
	local lv = GetChaAttr(role, ATTR_LV)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if lv < 40 then
		SystemNotice( role ,"Currently lower than Lv 40. Unable to use item!")
		UseItemFailed ( role )	
	return
	end
	if Item_CanGet < 1 then
		SystemNotice(role ,"You need at least 1 free slot to open chest")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 30000 )
	if  el>=29700 and el<30000 then
	GiveItem ( role , 0 , 2240  , 1 , 4 ) 
	elseif el>=28700 and el<29700 then
	GiveItem ( role , 0 , 2237  , 1 , 4 ) 
	elseif el>=25700 and el<28700 then
	GiveItem ( role , 0 , 2239  , 1 , 4 ) 
	elseif el>=15700 and el<25700 then
	GiveItem ( role , 0 , 2241  , 1 , 4 )
	else
	local EID = math.random ( 2242, 2245 )
	GiveItem ( role , 0 , EID  , 1 , 4 ) 	
	end
end

------------------------------------数字发
function ItemUse_SZF ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet <1 then
		SystemNotice(role ,"Unable to use Pirate Voucher 8. Requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2306  , 1 , 4)
	local cha_name = GetChaDefaultName ( role ) 
			local message ="Congratulations" ..cha_name.."Obtained 3k RMB worth of IPOD prizes" 
			Notice ( message )
	
end
----------------------------------------------石头记
function ItemUse_ShiTouJi( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <1 then
		SystemNotice(role ,"To open a Chest requires 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local r1,r2 =MakeItem ( role , STONE_ID  , 1 , 4 )
	local Item_newJL = GetChaItem ( role , 2 , r2 )			
	local Item_newJLID = GetItemID ( Item_newJL )		
	if STONE_LV>8 then
		STONE_LV=8
	end
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_BaoshiLV , STONE_LV )
	local cha_name = GetChaDefaultName ( role )
	LG( "star_stonebox" ,cha_name, STONE_ID , STONE_LV )
end

-------------------练习用沙包Lv1
function ItemUse_ShaBao1(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 937
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end


-------------------练习用沙包Lv2
function ItemUse_ShaBao2(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
	        local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 938
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end


-------------------练习用沙包Lv3

function ItemUse_ShaBao3(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
	        local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 939
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh , role )
		SetChaLifeTime( new, life )
end


-------------------练习用沙包Lv4
function ItemUse_ShaBao4(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 940
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end


-------------------练习用沙包Lv5
function ItemUse_ShaBao5(role , Item)
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Training in Safe Zone? Dream on!" )
		UseItemFailed ( role )
                return
	end
		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
		local MonsterID = 941
                local Refresh = 1900000				        
		local life = 1800000						
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end

------------------邪恶发生器Lv1
function ItemUse_FaSheng1(role,Item)
local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
        local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
	      SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
	      UseItemFailed ( role )
	return
	end
	local radID = math.random ( 1,8 )
	local MonsterID = 0
--	local Monster_GetID = {}
--		Monster_GetID[1] = 841
--		Monster_GetID[2] = 842
--		Monster_GetID[3] = 843
--		Monster_GetID[4] = 844
--		Monster_GetID[5] = 845
--		Monster_GetID[6] = 846
--		Monster_GetID[7] = 229
--		Monster_GetID[8] = 274
--        

	  if radID == 1   then
	       MonsterID = 841
	       
	  elseif radID == 2 then
	       MonsterID = 842
	           
	  elseif radID == 3 then
	       MonsterID = 843

	  elseif radID == 4 then
	       MonsterID = 843

	  elseif radID == 5 then
	       MonsterID = 845
	  elseif radID == 6 then
	       MonsterID = 846
	  elseif radID == 7 then
	       MonsterID = 229
	  elseif radID == 8 then
	       MonsterID = 274

	  end
		
		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
                local Refresh = 3700000			                --重生时间，秒单位
		local life =  3600000					--生命时间，毫秒单位
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
		SetChaLifeTime( new, life )
end
------------------邪恶发生器Lv2

function ItemUse_FaSheng2(role,Item)
local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
        local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then	
	      SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
	      UseItemFailed ( role )
	return
	end
	local radID = math.random ( 1,15 )
	local MonsterID = 0
--	local Monster_GetID = {}
--
--                Monster_GetID[1] = 847      
--		Monster_GetID[2] = 848
--		Monster_GetID[3] = 849
--		Monster_GetID[4] = 850
--		Monster_GetID[5] = 851
--		Monster_GetID[6] = 852
--		Monster_GetID[7] = 211
--		Monster_GetID[8] = 706
--		Monster_GetID[9] = 673
--		Monster_GetID[10] = 690
--		Monster_GetID[11] = 691
--		Monster_GetID[12] = 692
--		Monster_GetID[13] = 693
--		Monster_GetID[14] = 106
--		Monster_GetID[15] = 289

		local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
	  if radID == 1 then
	      MonsterID = 847
	  elseif radID == 2 then
	      MonsterID = 848
	  elseif radID == 3 then 
	      MonsterID = 849
	  elseif radID == 4 then 
	      MonsterID = 850
          elseif radID == 5 then
	      MonsterID = 851
	    elseif radID == 6 then
	      MonsterID = 852
	    elseif radID == 7 then
	      MonsterID = 211
	    elseif radID == 8 then
	      MonsterID = 706
	    elseif radID == 9 then
	      MonsterID = 673
	    elseif radID == 10 then
	      MonsterID = 690
	    elseif radID == 11 then
	      MonsterID = 691
	    elseif radID == 12 then
	      MonsterID = 692
	    elseif radID == 13 then
	      MonsterID = 693
	    elseif radID == 14 then
	      MonsterID = 106
	    elseif radID == 15 then
	      MonsterID = 289
	  end
		local Refresh = 3700000				        --重生时间，秒单位
		local life = 3600000					--生命时间，毫秒单位
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end
------------------邪恶发生器Lv3
function ItemUse_FaSheng3(role,Item)
local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
        local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then	
	      SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
	      UseItemFailed ( role )
	return
	end
	local radID = math.random ( 1,7 )
	local MonsterID = 0
--	local Monster_GetID = {}
--		Monster_GetID[1] = 757
--		Monster_GetID[2] = 679
--		Monster_GetID[3] = 678
--		Monster_GetID[4] = 707
--		Monster_GetID[5] = 708
--		Monster_GetID[6] = 776
--		Monster_GetID[7] = 74
		 
                local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
	  if radID == 1 then
	       MonsterID = 757       
	  elseif radID == 2 then
	       MonsterID = 679                          
	  elseif radID == 3 then                    
	       MonsterID = 678                           
	  elseif radID == 4 then                    
	       MonsterID = 707      
	  elseif radID == 5 then
	       MonsterID = 708                          
          elseif radID == 6 then
	       MonsterID = 776                           
          elseif radID == 7 then
	       MonsterID = 74   
	  end
		local Refresh = 7300000				        --重生时间，秒单位
		local life = 7200000     				--生命时间，毫秒单位
		local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
		SetChaLifeTime( new, life )
end
------------------邪恶发生器Lv4
function ItemUse_FaSheng4(role,Item)
local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
        local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then	
	      SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
	      UseItemFailed ( role )
	return
	end
	local radID = math.random ( 1,5 )
	local MonsterID = 0
	local Refresh = 0
	local life = 0
--	local Monster_GetID = {}
--		Monster_GetID[1] = 952
--		Monster_GetID[2] = 805
--		Monster_GetID[3] = 807
--		Monster_GetID[4] = 786
--		Monster_GetID[5] = 788
--		
                local x, y = GetChaPos(role)
		local x_move=5
		local y_move=5
		x=x_move+x
		y=y_move+y
	  if radID == 1 then
	      MonsterID = 952        
	  elseif radID == 2 then
	      MonsterID = 805                          
	  elseif radID == 3 then                    
	      MonsterID = 807                           
	  elseif radID == 4 then                    
	      MonsterID = 786      
	  elseif radID == 5 then
	      MonsterID = 788                           
	  end
	       
	       if MonsterID == 952 then 
	          Refresh = 10900000
	          life = 10800000
	       else
		  Refresh = 7300000     			        --重生时间，秒单位
		  life = 7200000					--生命时间，毫秒单位
	       end
	          local new = CreateChaX( MonsterID , x , y , 145 , Refresh ,role)
		SetChaLifeTime( new, life )
end

--------------------邪恶发生器Lv5
--function ItemUse_FaSheng5(role,Item)
--local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	if Cha_Boat ~=  nil then
--		SystemNotice( role , "Cannot use while sailing" )
--		UseItemFailed ( role )
--		return
--	end
--        local reg = 0
--	      reg =IsChaInRegion( role, 2 )
--	if reg == 1 then	
--	      SystemNotice( role , "Summon a monster in a safe zone? Please be considerate!" )
--	      UseItemFailed ( role )
--	return
--	end
--	local radID = math.random ( 1,30 )
--	local MonsterID = 0
--	local Refresh = 0
--	local life = 0
--	local Monster_GetID = {}
--		Monster_GetID[1] = 229 
--		Monster_GetID[2] = 211
--		Monster_GetID[3] = 99
--		Monster_GetID[4] = 673
--		Monster_GetID[5] = 786
--		Monster_GetID[6] = 757
--		Monster_GetID[7] = 263
--		Monster_GetID[8] = math.random ( 678 , 679 )
--                Monster_GetID[9] = math.random ( 841 , 852 )
--		Monster_GetID[10] = math.random ( 690 , 693 )
--		Monster_GetID[11] = math.random ( 706, 708 )
--		Monster_GetID[12] = 952
--		Monster_GetID[13] = 805
--		Monster_GetID[14] = 807
--		
--                local x, y = GetChaPos(role)
--		local x_move=5
--		local y_move=5
--		x=x_move+x
--		y=y_move+y
--	  if radID == 1 or  radID ==2 then
--	      MonsterID = Monster_GetID[8]        ----------5%
--	  elseif radID == 3 or  radID ==4 then
--	      MonsterID = 786                          
--	  elseif radID == 5 or  radID ==6 then                    
--	      MonsterID = 673                           
--	  elseif radID == 7 or  radID ==8 then                    
--	      MonsterID = 757      
--	  elseif radID == 9 or  radID ==10 then
--	      MonsterID = 263                           ----------10%
--          elseif radID == 11 or  radID ==12 then
--	      MonsterID = 211                           
--          elseif radID == 13 or  radID ==14 then
--	      MonsterID = 99
--	  elseif radID == 15 or  radID ==16 then
--	      MonsterID = 229
--	  elseif radID == 17 or  radID ==18 or  radID ==19 then            ----------15%
--              MonsterID = Monster_GetID[9]
--	  elseif radID == 20 or  radID ==21 then
--	      MonsterID = Monster_GetID[10]
--          elseif radID == 22 or radID ==23 or radID ==24 then
--	      MonsterID = Monster_GetID[11]
--	  elseif radID == 25 or  radID ==26 then
--	      MonsterID = Monster_GetID[12]
--	  elseif radID == 27 or  radID ==28 then
--	      MonsterID = Monster_GetID[13]
--          elseif radID == 29 or  radID ==30 then
--	      MonsterID = Monster_GetID[14]
--	  end
--	       
--	       if MonsterID == Monster_GetID[12] then 
--	          Refresh = 10900000
--	          life = 10800000
--	       else
--		  Refresh = 7300000     			        --重生时间，秒单位
--		  life = 7200000					--生命时间，毫秒单位
--	       end
--	          local new = CreateChaX( MonsterID , x , y , 145 , Refresh ,role)
--		SetChaLifeTime( new, life )
--end

--水雷LV1-----------------------------------------------------------

function ItemUse_SL1 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y

	local MonsterID = 942
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )
	SetChaLifeTime( new, life )
end
--水雷LV2-----------------------------------------------------------

function ItemUse_SL2 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 943
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )
	SetChaLifeTime( new, life )
end
--水雷LV3-----------------------------------------------------------

function ItemUse_SL3 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 944
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )
	SetChaLifeTime( new, life )
end
--水雷LV4-----------------------------------------------------------

function ItemUse_SL4 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y

	local MonsterID = 945
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )
	SetChaLifeTime( new, life )
end
--水雷LV5-----------------------------------------------------------

function ItemUse_SL5 ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		SystemNotice( role , "Can only be used on the sea." )
		UseItemFailed ( role )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	local x,y = GetChaPos(Cha_Boat)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 1200
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=1200
	       y_move=-1200
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-1000
	 elseif fx_move == 4 then
	       x_move=-1000
	       y_move=-1000
	 elseif fx_move == 5 then
	       x_move=1000
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-1000
	       y_move=1000
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=1000
	 else  x_move=1000
	       y_move=1000
	 end
	      x =x_move + x
	      y =y_move + y

	local MonsterID = 946
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,Cha_Boat )

	SetChaLifeTime( new, life )
end

--自爆绵羊LV1-----------------------------------------------------------

function ItemUse_ZBML1 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 947
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end
--自爆绵羊LV2-----------------------------------------------------------

function ItemUse_ZBML2 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 948
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end
--自爆绵羊LV3-----------------------------------------------------------

function ItemUse_ZBML3 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 949
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end
--自爆绵羊LV4-----------------------------------------------------------

function ItemUse_ZBML4 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 950
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end
--自爆绵羊LV5-----------------------------------------------------------

function ItemUse_ZBML5 ( role , Item  )
 
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
	
	local x,y = GetChaPos(role)
	local x_move=0
	local y_move=0
        local fx_move = math.random ( 1,8 )
	   if  fx_move == 1 then
	       x_move = 800
	       y_move = 0
	 elseif fx_move == 2 then
	       x_move=800
	       y_move=-800
	 elseif fx_move == 3 then
	       x_move=0
	       y_move=-800
	 elseif fx_move == 4 then
	       x_move=-800
	       y_move=-800
	 elseif fx_move == 5 then
	       x_move=800
	       y_move=0
	 elseif fx_move == 6 then
	       x_move=-800
	       y_move=800
	 elseif fx_move == 7 then
	       x_move=0
	       y_move=800
	 else  x_move=800
	       y_move=800
	 end
	      x =x_move + x
	      y =y_move + y
	local MonsterID = 951
	local Refresh = 700000					--重生时间，秒单位
	local life = 600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
end

----------------------------------情缘宝盒
function ItemUse_LoveBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need at least 1 free slot to open Chest of Fate")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	local count = 0
	if cha_type == 3 or cha_type == 4 then 
	       count =1
	end
	if cha_type == 1 or cha_type == 2 then
	       count =2
	end
	local el = math.random ( 1, 35 )
	if   count == 1 then
		if el==35 then
			local r1 = 0
			local r2 = 0	
			r1,r2 =MakeItem ( role , 2902  , 1 , 4 )
			local Item_girl = GetChaItem ( role , 2 , r2 )			--取女性道具指针
			local new_el=math.random ( 1, 200 )
			SetItemAttr ( Item_girl , ITEMATTR_VAL_STR , new_el )	
		else
			local el1 = math.random ( 1, 12 )
			if el1==1  then
				GiveItem ( role , 0 , 3343  , 1 , 4 ) ---------------玫瑰花
			elseif el1==2 then
				GiveItem ( role , 0 , 3077  , 1 , 4 )------------甜蜜巧克力	
			else
				local EID = math.random ( 4264, 4273 )----------10个表情
				GiveItem ( role , 0 , EID  , 1 , 4 )
			end
		end
	end
	local el2= math.random ( 1, 7 )
	if   count == 2 then
			--SystemNotice(role ,"count=="..count)
		if el2==7 then
			local r1 = 0
			local r2 = 0	
				r1,r2 =MakeItem ( role , 2903  , 1 , 4 )
			local Item_boy = GetChaItem ( role , 2 , r2 )			--取男性道具指针
			local new_el=math.random ( 1, 1000 )
			--SystemNotice(role ,"new_el=="..new_el)
			SetItemAttr( Item_boy , ITEMATTR_VAL_STR , new_el )
		else
			local el3 = math.random ( 1, 12 )
			if el3==1  then
				GiveItem ( role , 0 , 3343  , 1 , 4 ) ---------------玫瑰花
			elseif el3==2 then
				GiveItem ( role , 0 , 3077  , 1 , 4 )------------甜蜜巧克力	
			else
				local EID = math.random ( 4264, 4273 )----------10个表情
				GiveItem ( role , 0 , EID  , 1 , 4 )
			end
		end
	end
end


------------------------礼服宝箱：双击，根据角色给予道具

function ItemUse_MarryBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"you need at least 4 free slot to open Chest of Gown")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 3  then 
	       GiveItem ( role , 0 , 5244  , 1 , 4 )
	       GiveItem ( role , 0 , 5245  , 1 , 4 )
	       GiveItem ( role , 0 , 5246  , 1 , 4 )
	       GiveItem ( role , 0 , 5247  , 1 , 4 )
	elseif cha_type == 4  then 
	       GiveItem ( role , 0 , 5252  , 1 , 4 )
	       GiveItem ( role , 0 , 5253  , 1 , 4 )
	       GiveItem ( role , 0 , 5254  , 1 , 4 )
	       GiveItem ( role , 0 , 5255  , 1 , 4 )
	elseif cha_type == 1 then 
	       GiveItem ( role , 0 , 5221  , 1 , 4 )
	       GiveItem ( role , 0 , 5222  , 1 , 4 )
	       GiveItem ( role , 0 , 5223  , 1 , 4 )
	elseif cha_type == 2 then 
	       GiveItem ( role , 0 , 5238  , 1 , 4 )
	       GiveItem ( role , 0 , 5239  , 1 , 4 )
	       GiveItem ( role , 0 , 5240  , 1 , 4 )
	end
end
		----------------------------------佳人动情礼盒
function ItemUse_JRDQBox( role , Item )
--	local Now_Day = os.date("%d")
--	local Now_Month = os.date("%m")
--	local Now_Time = os.date("%H")
--	local NowTimeNum = tonumber(Now_Time)
--	local NowDayNum = tonumber(Now_Day)
--	local NowMonthNum = tonumber(Now_Month)
--	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
--	
--	if CheckDateNum < 021609  then
--		SystemNotice ( role , "Please use the item between 16th Febuary 9.00am and 16th Febuary 24.00pm" )
--		UseItemFailed ( role )
--		return
--	end
--	
--	if CheckDateNum > 021700 then
--		SystemNotice ( role , "Santa Claus has left. Please wait for next year" )
--		UseItemFailed ( role )
--		return
--	end
--
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 10 then
		SystemNotice(role ,"To open Gift of the Beauty requires at least 10 empty inventory slots")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	 if cha_type ==1 or cha_type ==2 then
	 SystemNotice(role ,"Gift of the Beauty can only be opened by female")
	UseItemFailed ( role )
		return
	end 
	
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=20 then
	GiveItem ( role , 0 , 3343  , 1 , 4 )----------玫瑰花
	elseif  el>=21 and el<=40 then
	GiveItem ( role , 0 , 3354  , 1 , 4 )
	GiveItem ( role , 0 , 3355  , 1 , 4 )
	GiveItem ( role , 0 , 3356  , 1 , 4 )
	GiveItem ( role , 0 , 3357  , 1 , 4 )
	GiveItem ( role , 0 , 3358  , 1 , 4 )
	GiveItem ( role , 0 , 3359  , 1 , 4 )----------心型礼花 
	elseif el>=41 and el<=45 then
	GiveItem ( role , 0 , 937  , 1 , 4 ) -----------天使之翼
	elseif el>=46 and el<=65 then
	GiveItem ( role , 0 , 4264  , 1 , 4 )
	GiveItem ( role , 0 , 4265  , 1 , 4 )
	GiveItem ( role , 0 , 4266  , 1 , 4 )
	GiveItem ( role , 0 , 4267  , 1 , 4 )
	GiveItem ( role , 0 , 4268  , 1 , 4 )
	GiveItem ( role , 0 , 4269  , 1 , 4 )
	GiveItem ( role , 0 , 4270  , 1 , 4 )
	GiveItem ( role , 0 , 4271  , 1 , 4 )
	GiveItem ( role , 0 , 4272  , 1 , 4 )
	GiveItem ( role , 0 , 4273  , 1 , 4 )---------------10个表情
	elseif el>=66 and el<=75 then
	GiveItem ( role , 0 , 3094  , 3 , 4 )------------努力增幅器3个
	elseif el>=76 and el<=85 then
	GiveItem ( role , 0 , 855  , 10 , 4 ) -----------精灵硬币
	elseif el>=86 and el<87 then
	GiveItem ( role , 0 , 1012  , 1 , 4 ) -----------加纳之神1个
	elseif el>=87 and el<89 and cha_type == 3  then 
	GiveItem ( role , 0 , 5244  , 1 , 4 )
	GiveItem ( role , 0 , 5245  , 1 , 4 )
	GiveItem ( role , 0 , 5246  , 1 , 4 )
	GiveItem ( role , 0 , 5247  , 1 , 4 ) -----------新娘装
	elseif el>=89 and el<=90 and cha_type == 4 then
	GiveItem ( role , 0 , 5252  , 1 , 4 )
	GiveItem ( role , 0 , 5253  , 1 , 4 )
	GiveItem ( role , 0 , 5254  , 1 , 4 )
	GiveItem ( role , 0 , 5255  , 1 , 4 ) -----------婚娘装
	else
	local EID = math.random ( 1808, 1811 )----------发型书
	GiveItem ( role , 0 , EID  , 1 , 4 )
	end
end


----------------------------------才俊动情礼盒
function ItemUse_CJDQBox( role , Item )

--	local Now_Day = os.date("%d")
--	local Now_Month = os.date("%m")
--	local Now_Time = os.date("%H")
--	local NowTimeNum = tonumber(Now_Time)
--	local NowDayNum = tonumber(Now_Day)
--	local NowMonthNum = tonumber(Now_Month)
--	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
--	
--	if CheckDateNum < 021609  then
--		SystemNotice ( role , "Please use the item between 16th Febuary 9.00am and 16th Febuary 24.00pm" )
--		UseItemFailed ( role )
--		return
--	end
--	
--	if CheckDateNum > 021700 then
--		SystemNotice ( role , "Please wait for next year" )
--		UseItemFailed ( role )
--		return
--	end
	
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 10 then
		SystemNotice(role ,"you need at least 10 free slot to open Gift of the Hunk")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	 if cha_type ==3 or cha_type ==4 then
		SystemNotice(role ,"Gift of the Hunk can only be opened by male characters")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=20 then
	GiveItem ( role , 0 , 3077  , 1 , 4 )----------甜蜜巧克力
	elseif  el>=21 and el<=40 then
	GiveItem ( role , 0 , 3354  , 1 , 4 )
	GiveItem ( role , 0 , 3355  , 1 , 4 )
	GiveItem ( role , 0 , 3356  , 1 , 4 )
	GiveItem ( role , 0 , 3357  , 1 , 4 )
	GiveItem ( role , 0 , 3358  , 1 , 4 )
	GiveItem ( role , 0 , 3359  , 1 , 4 )----------心型礼花 
	elseif el>=41 and el<=45 then
	GiveItem ( role , 0 , 0936  , 1 , 4 ) -----------蝶翼
	elseif el>=46 and el<=65 then
	GiveItem ( role , 0 , 4264  , 1 , 4 )
	GiveItem ( role , 0 , 4265  , 1 , 4 )
	GiveItem ( role , 0 , 4266  , 1 , 4 )
	GiveItem ( role , 0 , 4267  , 1 , 4 )
	GiveItem ( role , 0 , 4268  , 1 , 4 )
	GiveItem ( role , 0 , 4269  , 1 , 4 )
	GiveItem ( role , 0 , 4270  , 1 , 4 )
	GiveItem ( role , 0 , 4271  , 1 , 4 )
	GiveItem ( role , 0 , 4272  , 1 , 4 )
	GiveItem ( role , 0 , 4273  , 1 , 4 )---------------10个表情
	elseif el>=66 and el<=75 then
	GiveItem ( role , 0 , 3094  , 3 , 4 )------------努力增幅器3个
	elseif el>=76 and el<=85 then
	GiveItem ( role , 0 , 855  , 10 , 4 ) -----------精灵硬币
	elseif el>=86 and el<87 then
	GiveItem ( role , 0 , 0862  , 1 , 4 ) -----------岩玉1个
	elseif el>=87 and el<89 and cha_type == 1  then 
	GiveItem ( role , 0 , 5221  , 1 , 4 )
	GiveItem ( role , 0 , 5222  , 1 , 4 )
	GiveItem ( role , 0 , 5223  , 1 , 4 ) -----------夜贵族装
	elseif el>=89 and el<=90 and cha_type == 2 then
	GiveItem ( role , 0 , 5238  , 1 , 4 )
	GiveItem ( role , 0 , 5239  , 1 , 4 )
	GiveItem ( role , 0 , 5240  , 1 , 4 )-----------黑金装
	else
	local EID = math.random ( 1808, 1811 )----------发型书
	GiveItem ( role , 0 , EID  , 1 , 4 )
	end
end
---------------------------------喜糖
function ItemUse_XTBOX ( role , Item )
	local item_type = BoxXiang_BaoZhaBOX
	local item_type_rad = BoxXiang_BaoZhaBOX_Rad
	local item_type_count = BoxXiang_BaoZhaBOX_Count
	local maxitem = BoxXiang_baozhabao_Mxcount						-- 终结编号
	local item_quality = BoxXiang_baozhabao_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
		
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory slots. Failed to use Wedding Candy")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General		
	end 
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1							--命中物品编号
	for k = 1 , maxitem , 1 do				-- 随机出添加的前缀编号
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
	GoodItem[0] = 3111
	GoodItem[1] = 3110
	GoodItem[2] = 3112
	GoodItem[3] = 3886
	GoodItem[4] = 3093
	GoodItem[5] = 3090
	GoodItem[6] = 430
	GoodItem[7] = 179
	GoodItem[8] =3084
	GoodItem[9] =3085
	GoodItem[10] =0244
	GoodItem[11] =0250
	GoodItem[12] =0253
	GoodItem[13] =0260
	GoodItem[14] =0860
	GoodItem[15] =0861
	GoodItem[16] =0862
	GoodItem[17] =3458
	GoodItem[18] =0247
	GoodItem[19] =0271
	local Good_C = 0
	for Good_C = 0 , 19 , 1 do
		if ItemId == GoodItem[Good_C] then
			local itemname = GetItemName ( ItemId ) 
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.." uses a Wedding Candy and obtained "..itemname  
			Notice ( message )
		end
	end
end

-------------------婚庆大礼盒
function ItemUse_HQBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 3 free slots to open Wedding Gift Parcel")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=20 then
	GiveItem ( role , 0 , 1012  , 1 , 4 ) -------------加纳之神
	elseif el>=21 and el<=40 then
	GiveItem ( role , 0 , 1016  , 1 , 4 ) ---------------女神小包
	elseif el>=41 and el<60 then
	GiveItem ( role , 0 , 0333  , 1 , 4 ) ----------------高级宝石兑换券
	elseif el>=61 and el<=100 then
	GiveItem ( role , 0 , 0273  , 1 , 4 )-----------------一等奖	
	end
end

-----------------------------------幸运猪宝箱：岩玉、炎玉、鹰眼石、凤灵石、加纳之神、女神小包

function ItemUse_XYPIGBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need at least 4 empty slots to open Lucky Piggy Chest")
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=4 then
	GiveItem ( role , 0 , 1012  , 1 , 4 ) -------------加纳之神
	elseif el==5  then
	GiveItem ( role , 0 , 1016  , 1 , 4 ) ---------------女神小包
	elseif el>=6 and el<=30 then
	GiveItem ( role , 0 , 0861  , 1 , 4 ) ----------------鹰眼石
	elseif el>=31 and el<=60 then
	GiveItem ( role , 0 , 885  , 1 , 4 )-----------------精炼石
	elseif el>=61 and el<=75 then
	GiveItem ( role , 0 , 0860  , 1 , 4 ) ---------------凤灵石
	elseif el>=76 and el<=88 then
	GiveItem ( role , 0 , 0862  , 1 , 4 ) ----------------岩玉
	elseif el>=89 and el<=100 then
	GiveItem ( role , 0 , 0863  , 1 , 4 )-----------------炎玉
	end
end


-----------------------------压岁包：压岁包只有在除夕夜（2月17日晚23:00--2月18日凌晨１点）打开才会有效
----------------------------------------------------------------------------------压岁包
function ItemUse_YSB( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need at least 1 empty slots to open Auspicious Bag")
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 10000 + NowDayNum * 100 + NowTimeNum
	local star = 0
	if CheckDateNum >= 21723  and CheckDateNum <= 21801 then
		ItemUse_YSBOX ( role , Item )
	else 
		SystemNotice(role ,"It is not time yet. Do not try to cheat!")
		UseItemFailed ( role )
		return
	end
end
function ItemUse_YSBOX ( role , Item )
	local el = math.random ( 1, 1000 )
	if  el>=1 and el<=5 then
		GiveItem ( role , 0 , 1012  , 1 , 4 ) -------------加纳之神        0.5
	elseif el>=6 and el<=10 then
		GiveItem ( role , 0 , 1016  , 1 , 4 ) ---------------女神小包       0.5
	elseif el>=11 and el<=20 then
		GiveItem ( role , 0 , 0860  , 1 , 4 ) ---------------风灵         1
	elseif el>=21 and el<=30 then
		GiveItem ( role , 0 , 0861  , 1 , 4 ) ----------------鹰眼石     1
	elseif el>=31 and el<40 then
		GiveItem ( role , 0 , 0862  , 1 , 4 ) ----------------岩玉       1
	elseif el>=41 and el<=50 then
		GiveItem ( role , 0 , 0863  , 1 , 4 )-----------------炎玉       1
	elseif el>=51 and el<=270 then
		GiveItem ( role , 0 , 855  , 99 , 4 )-----------------精灵硬币       22
	elseif el>=271 and el<=500 then
		GiveItem ( role , 0 , 0227  , 5 , 4 )-----------------守护精灵饲料    23
	elseif el>=501 and el<=750 then
		GiveItem ( role , 0 , 3096  , 3 , 4 )-----------------财富增幅器3个   25
	elseif el>=751 and el<=1000 then
		GiveItem ( role , 0 , 3094  , 3 , 4 )-----------------努力增幅器3个   25
	end
end
function ItemUse_Hadisi( role , Item )		----------哈迪斯遗物
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 3 empty slots to open Chest of Hardin")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2817  , 1 , 4 )
	GiveItem ( role , 0 , 2818  , 1 , 4 )
	GiveItem ( role , 0 , 2819  , 1 , 4 )
end
function ItemUse_Anhei( role , Item )		----------暗黑盒子
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 3 empty slots to open Chest of Darkness")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2820  , 1 , 4 )
	GiveItem ( role , 0 , 2821  , 1 , 4 )
	GiveItem ( role , 0 , 2822  , 1 , 4 )
end
function ItemUse_Diyu( role , Item )		----------地狱包袱
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Chest of Abaddon requires at least 3 empty inventory slots")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2823  , 1 , 4 )
	GiveItem ( role , 0 , 2824  , 1 , 4 )
	GiveItem ( role , 0 , 2825  , 1 , 4 )
end
function ItemUse_Xiuluo( role , Item )		----------修罗箱子
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 3 free slots to open Chest of Asura")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2826  , 1 , 4 )
	GiveItem ( role , 0 , 2827  , 1 , 4 )
	GiveItem ( role , 0 , 2828  , 1 , 4 )
end
function ItemUse_Youming( role , Item )	----------幽冥宝藏
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 3 empty slots to open Chest of Abyss")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2829  , 1 , 4 )
	GiveItem ( role , 0 , 2830  , 1 , 4 )
	GiveItem ( role , 0 , 2831  , 1 , 4 )
end
function ItemUse_Minghe( role , Item )		----------冥河小包
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 3 empty inventory slots to open Chest of Styx")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2832  , 1 , 4 )
	GiveItem ( role , 0 , 2833  , 1 , 4 )
	GiveItem ( role , 0 , 2834  , 1 , 4 )
end
function ItemUse_Sishen( role , Item )		----------死神藏尸处
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"To open the Carcass of Death requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr(role, ATTR_JOB)
	local lv = GetChaAttr(role, ATTR_LV) 
	local star_rad=math.random ( 1, 2 )
	if lv < 40 then
		SystemNotice(role ,"Currently lower than Lv 40. Unable to use item!")
		UseItemFailed ( role )	
	elseif job == 9 then 
		if star_rad==1 then
			GiveItem ( role , 0 , 2331  , 1 , 4 ) 
		else
			GiveItem ( role , 0 , 2332  , 1 , 4 ) 
		end
	elseif job == 8 then   
		if star_rad==1 then
			GiveItem ( role , 0 , 2333  , 1 , 4 ) 
		else
			GiveItem ( role , 0 , 2334  , 1 , 4 ) 
		end
	elseif job == 12 then 
		local eleven_rad=math.random ( 1, 4 )
		if eleven_rad==1 then
			GiveItem ( role , 0 , 2337  , 1 , 4 ) 
		elseif eleven_rad==2 then
			GiveItem ( role , 0 , 2338  , 1 , 4 ) 
		elseif eleven_rad==3 then
			GiveItem ( role , 0 , 2339  , 1 , 4 ) 
		else
			GiveItem ( role , 0 , 2340  , 1 , 4 ) 
		end
	elseif job == 16 then 
		if star_rad==1 then
			GiveItem ( role , 0 , 2335  , 1 , 4 ) 
		else
			GiveItem ( role , 0 , 2336  , 1 , 4 ) 
		end
	elseif job == 13 then    
		if star_rad==1 then
			GiveItem ( role , 0 , 2341  , 1 , 4 ) 
		else
			GiveItem ( role , 0 , 2342  , 1 , 4 ) 
		end
	elseif job == 14 then    
		if star_rad==1 then
			GiveItem ( role , 0 , 2343  , 1 , 4 ) 
		else
			GiveItem ( role , 0 , 2344  , 1 , 4 ) 
		end
	else 
		SystemNotice(role ,"Class mismatch. Item can only be used after second class advancement!")
		UseItemFailed ( role )	
	end
end
function ItemUse_Zhenheilong( role , Item )	----------真黑龙宝箱
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 5 then
		SystemNotice(role ,"You need at least 4 empty slots to open Rightful Chest of Black Dragon")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2367  , 1 , 16 ) 
	GiveItem ( role , 0 , 2368  , 1 , 16 ) 
	GiveItem ( role , 0 , 2369  , 1 , 16 )
        local cha_type = GetChaTypeID ( role )
	if cha_type == 4 then 
		GiveItem ( role , 0 , 2370  , 1 , 16 )		
	end
end
--地狱四层机票
function Jz_Script_4thDy(role, Item )
	local i = CheckBagItem(role,2844)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2844,1)
			if j == 1 then
				MoveCity(role,"Caribbean Abaddon 4")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
--死神的行囊A
function ItemUse_DathBagA(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 4 )
	if star_rad==4 then
		GiveItem ( role , 0 , 2846  , 1 , 16 ) 
	else
		GiveItem ( role , 0 , 2928  , 1 , 16 ) 
	end
end
--死神的行囊B
function ItemUse_DathBagB(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 4 )
	if star_rad==4 then
		GiveItem ( role , 0 , 2847  , 1 , 16 ) 
	else
		GiveItem ( role , 0 , 2929  , 1 , 16 ) 
	end
end
--死神的行囊C
function ItemUse_DathBagC(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 4 )
	if star_rad==4 then
		GiveItem ( role , 0 , 2848  , 1 , 16 ) 
	else
		GiveItem ( role , 0 , 2927  , 1 , 16 ) 
	end
end
--死神的行囊D
function ItemUse_DathBagD(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 4 )
	if star_rad==4 then
		GiveItem ( role , 0 , 2849  , 1 , 16 ) 
	else
		GiveItem ( role , 0 , 2927  , 1 , 16 ) 
	end
end
--死神的行囊E
function ItemUse_DathBagE(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 4 )
	if star_rad==4 then
		GiveItem ( role , 0 , 2850  , 1 , 16 ) 
	else
		GiveItem ( role , 0 , 2929  , 1 , 16 ) 
	end
end
--死神的行囊F
function ItemUse_DathBagF(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 4 )
	if star_rad==4 then
		GiveItem ( role , 0 , 2851  , 1 , 16 ) 
	else
		GiveItem ( role , 0 , 2931  , 1 , 16 ) 
	end
end
--死神的行囊G
function ItemUse_DathBagG(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 4 )
	if star_rad==4 then
		GiveItem ( role , 0 , 2852  , 1 , 16 ) 
	else
		GiveItem ( role , 0 , 2932  , 1 , 16 ) 
	end
end
--死神的行囊H
function ItemUse_DathBagH(role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 2 then
		SystemNotice(role ,"you need at least 1 free slot to open Death's Burden")
		UseItemFailed ( role )
		return
	end
	local star_rad=math.random ( 1, 4 )
	if star_rad==4 then
		GiveItem ( role , 0 , 2930  , 1 , 16 ) 
	else
		GiveItem ( role , 0 , 2930  , 1 , 16 ) 
	end
end
----转生卡
function ItemUse_ZSCard(role, Item )
	local i = CheckBagItem(role,2941)
	local k = ChaIsBoat(role)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"To use a Rebirth Card requires at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,2941,1)
			if j == 1 then
				SystemNotice(role, "Use of Rebirth Card successful, you can now speak with the Reibrth angel to directly rebirth.")
				GiveItem ( role , 0 , 2235 , 1 , 42)
				GoTo( role,  1750 , 909 , "jialebi")
				return
			end
		end
	else
		UseItemsFailed ( role )
	end
		
end
-----------海军海盗守护神召唤券--------------------
function ItemUse_SummonBigBOSS(role, Item )
local map_name_role = GetChaMapName ( role )
local Cha_Boat = 0
      Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	end
	local reg = 0
	      reg =IsChaInRegion( role, 2 )
	if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	end
   if  map_name_role == "guildwar" then
	local x,y = GetChaPos(role)
	if GetChaGuildID(role) <= 100 and GetChaGuildID(role) > 0 then
	local MonsterID = 1007
	local Refresh = 1300					--重生时间，秒单位
	local life = 1200000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
	SetChaSideID(new,1)
	end

	if GetChaGuildID(role) > 100 and GetChaGuildID(role) <= 200 then
	local MonsterID = 1008
	local Refresh = 1300					--重生时间，秒单位
	local life = 1200000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
	SetChaSideID(new,2)
	end
   elseif map_name_role == "guildwar2" then 

    local x,y = GetChaPos(role)
	if GetChaGuildID(role) <= 100 and GetChaGuildID(role) > 0 then
	local MonsterID = 1007
	local Refresh = 1300					--重生时间，秒单位
	local life = 12600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
	SetChaSideID(new,1)
	end

	if GetChaGuildID(role) > 100 and GetChaGuildID(role) <= 200 then
	local MonsterID = 1008
	local Refresh = 1300					--重生时间，秒单位
	local life = 1200000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh,role )
	SetChaLifeTime( new, life )
	SetChaSideID(new,2)
	end
    else 
        SystemNotice( role , "This ticket can only be used in Sacred War map" )
        UseItemFailed ( role )
        return
    end

end


----------------------雕像机票---------------------
function ItemUse_moveDX(role, Item)
local i = CheckBagItem(role,2986)
--local k = ChaIsBoat(role)
 local Cha_Boat = 0
       Cha_Boat = GetCtrlBoat ( role )
	 if Cha_Boat ~=  nil then
		SystemNotice( Cha_Boat , "Not usable on the sea" )
		UseItemFailed ( Cha_Boat )
		return
	 end
	 local reg = 0
	      reg =IsChaInRegion( role, 2 )
	 if reg == 1 then
		SystemNotice( role , "Unable to use in Safe Zone" )
		UseItemFailed ( role )
                return
	 end


 if GetChaGuildID(role) == 0 then
    SystemNotice( role , "You do not have a guild. Unable to use the pass" )
    UseItemFailed ( role )
    return
 end

local map_name_role = GetChaMapName ( role )
if map_name_role =="guildwar" then
	 if GetChaGuildID(role) <= 100 and GetChaGuildID(role) > 0 and map_name_role =="guildwar" then
			if i > 0 then
				local j = DelBagItem(role,2986,1)
				if j == 1 then
					MoveTo( role,  305, 87,  "guildwar" )
					return
				end
			end
								 

	 elseif GetChaGuildID(role) > 100 and GetChaGuildID(role) <= 200 and map_name_role =="guildwar" then
			 if i > 0 then
				local j = DelBagItem(role,2986,1)
				if j == 1 then
					MoveTo( role,  309, 539,  "guildwar" )
					return
				end
			end
	 
	 else
			UseItemFailed ( role )
			    
	 end

elseif map_name_role =="guildwar2" then

	 if GetChaGuildID(role) <= 100 and GetChaGuildID(role) > 0 and map_name_role =="guildwar2"  then
		       if i > 0 then
				local j = DelBagItem(role,2986,1)
				if j == 1 then
					MoveTo( role,  305, 87,  "guildwar2" )
					return
				end
			end
			
	 elseif GetChaGuildID(role) > 100 and GetChaGuildID(role) <= 200 and map_name_role =="guildwar2"  then
			 if i > 0 then
				local j = DelBagItem(role,2986,1)
				if j == 1 then
					 MoveTo( role,  309, 539,  "guildwar2" )
					return
				end
			end
	 
	 else
			UseItemFailed ( role )
		
   
         end

else
        SystemNotice( role , "This ticket can only be used in Sacred War map" )
        UseItemFailed ( role )
        return
   end        
end


------------------------白羊船长宝箱：双击，根据角色给予道具

function ItemUse_CZBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"To open a Aries Apparel Chest requires at least 4 empty inventory slots")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 3  then 
	     
	       GiveItem ( role , 0 , 5349  , 1 , 4 )
	       GiveItem ( role , 0 , 5350  , 1 , 4 )
	       GiveItem ( role , 0 , 5351  , 1 , 4 )
	elseif cha_type == 4  then 
	       GiveItem ( role , 0 , 5352  , 1 , 4 )
	       GiveItem ( role , 0 , 5353  , 1 , 4 )
	       GiveItem ( role , 0 , 5354  , 1 , 4 )
	       GiveItem ( role , 0 , 5355  , 1 , 4 )
	elseif cha_type == 1 then 
	      
	       GiveItem ( role , 0 , 5341  , 1 , 4 )
	       GiveItem ( role , 0 , 5342  , 1 , 4 )
	       GiveItem ( role , 0 , 5343  , 1 , 4 )
	elseif cha_type == 2 then 
	       
	       GiveItem ( role , 0 , 5345  , 1 , 4 )
	       GiveItem ( role , 0 , 5346  , 1 , 4 )
	       GiveItem ( role , 0 , 5347  , 1 , 4 )
	end
end


------------------------愚人节礼物----------2953----------itemeffect
function ItemUse_Foolish ( role , Item )
	local charLv=Lv ( role )
	local Cha_Boat = 0
		Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Exp_el=GetChaAttr (  role , ATTR_CEXP )----------当前等级经验
	local dif_exp_thalf_c = (DEXP[charLv+1] - DEXP[charLv])*0.03+Exp_el ----------------
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_c )-------------
		--SystemNotice( role , "Use April's Fool Gift to obtain 3 percent experience points" )--------------
end
---------------------------召唤白羊守护者
function ItemUse_BYSHJZ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local star = 0
	star =IsChaInRegion( role, 2 )
	if star == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1009
	local Refresh = 3700					--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

--------双剑士转职技能书
function Sk_Script_Wyz ( role , Item ) 											
	local sk_add = SK_WYZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------巨剑士转职技能书
function Sk_Script_Bsj ( role , Item ) 											
	local sk_add = SK_BSJ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------封印师转职技能书
function Sk_Script_Emzz ( role , Item ) 											
	local sk_add = SK_EMZZ 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
--------圣职者转职技能书
function Sk_Script_Sssp ( role , Item ) 											
	local sk_add = SK_SSSP 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------航海士转职技能书
function Sk_Script_Cyn ( role , Item ) 											
	local sk_add = SK_CYN 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

--------狙击手转职技能书
function Sk_Script_Hlp ( role , Item ) 											
	local sk_add = SK_HLP 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 
-------------------------品牌蛋糕
function ItemUse_NiceCake (role, Item )

	local HonorBook_Num = 0
	local HonorBook_Num = CheckBagItem( role,3849 )
		if HonorBook_Num < 1 then
		SystemNotice( role , "You do not have Mark of Honor")
		UseItemFailed ( role )
		return 0
		end
	local Book2 =  GetChaItem2 ( role , 2 , 3849 )
	local HonorPoint=GetItemAttr ( Book2 , ITEMATTR_VAL_STR)
	local el_fame = GetChaAttr(role, ATTR_FAME)
	
		if HonorPoint < 27000 and el_fame < 99990001 then
		local HonorPoint_X=HonorPoint+3000
		SetItemAttr ( Book2 , ITEMATTR_VAL_STR,HonorPoint_X)
		
		local fame_resume = 9999
		el_fame = el_fame + fame_resume
		SetCharaAttr(el_fame, role, ATTR_FAME) 

		else 
		SystemNotice( role , "Your Honor or Reputation points are too high. This cake can no longer satisfied you")
		UseItemFailed ( role )
		end
end

-------------------QQ宝箱
--function ItemUse_QQBOX( role , Item )
	
	--local cha_name = GetChaDefaultName ( role )
	--local cha_num = GetActName(role)	
	--local lv = GetChaAttr(role, ATTR_LV)
	--local Item_CanGet = GetChaFreeBagGridNum ( role )
	--if lv < 40 then
		--SystemNotice( role ,"Currently lower than Lv 40. Unable to use item!")
		--UseItemFailed ( role )	
	--return
	--end
	
	--local BorG = 0 
	--local cha_type = GetChaTypeID ( role ) 
	--if cha_type == 1  or cha_type == 2 then 
		--BorG=1
	--elseif cha_type == 3  or cha_type == 4 then
		--BorG=2
	--end
	
	--LG( "QQ" , "Player"..cha_name.."Open QQ Chest", "yes"..BorG.."character","Account is"..cha_num)
--end

----------------------------------------------嘉宾宝箱
--function ItemUse_JBBOX( role , Item )
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
--	if Item_CanGet <1 then
--		SystemNotice(role ,"To open a Chest requires 1 empty slot")
--		UseItemFailed ( role )
--		return
--	end
--	local r1,r2 =MakeItem ( role , 3078  , 1 , 4 )-------请柬
--	local Item_el = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针
--
--	local item_old = GetChaItem2 ( role , 2 , 3066 )---------教堂使用证书
--
--	local old_month = GetItemAttr(item_old, ITEMATTR_VAL_STA)		-------------月 	
--	local old_day = GetItemAttr(item_old, ITEMATTR_VAL_STR)			-------------日  
--	local old_hour = GetItemAttr(item_old, ITEMATTR_VAL_CON)			-------------时   
--	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)		-------------分   
--	
--	--SystemNotice ( role , "old_month=="..old_month )
--	--SystemNotice ( role , "old_day=="..old_day )       
--	--SystemNotice ( role , "old_hour=="..old_hour )    
--	--SystemNotice ( role , "old_miniute=="..old_miniute)
--
--	SetItemAttr(Item_el, ITEMATTR_VAL_STA, old_month )	-------------月 	
--	SetItemAttr(Item_el, ITEMATTR_VAL_STR, old_day )		-------------日  
--	SetItemAttr(Item_el, ITEMATTR_VAL_CON, old_hour )		-------------时 
--	SetItemAttr(Item_el, ITEMATTR_VAL_DEX, old_miniute )	-------------分
--
--	local old_month2 = GetItemAttr(Item_el, ITEMATTR_VAL_STA)		-------------月 	
--	local old_day2 = GetItemAttr(Item_el, ITEMATTR_VAL_STR)			-------------日  
--	local old_hour2 = GetItemAttr(Item_el, ITEMATTR_VAL_CON)			-------------时   
--	local old_miniute2 = GetItemAttr(Item_el, ITEMATTR_VAL_DEX)		-------------分 
--
--	--SystemNotice ( role , "old_month2=="..old_month2 )
--	--SystemNotice ( role , "old_day2=="..old_day2 )       
--	--SystemNotice ( role , "old_hour2=="..old_hour2 )    
--	--SystemNotice ( role , "old_miniute2=="..old_miniute2)
--
--	SynChaKitbag(role,13)
--
--end
--
--
--------------------浪漫烟花
--function ItemUse_LMYH ( role , Item )
--	local Cha_Boat = GetCtrlBoat ( role )
--	if Cha_Boat ~=  nil then
--		SystemNotice( role , "Cannot use while sailing" )
--		UseItemFailed ( role )
--		return
--	end
--end
--
--------------------巨响烟花
--function ItemUse_JXYH ( role , Item )
--	local Cha_Boat = GetCtrlBoat ( role )
--	if Cha_Boat ~=  nil then
--		SystemNotice( role , "Cannot use while sailing" )
--		UseItemFailed ( role )
--		return
--	end
--end
--
--------------------豪华烟花
--function ItemUse_HHLH ( role , Item )
--	local Cha_Boat = GetCtrlBoat ( role )
--	if Cha_Boat ~=  nil then
--		SystemNotice( role , "Cannot use while sailing" )
--		UseItemFailed ( role )
--		return
--	end
--end
--
---------教堂使用证书
--function Jz_Script_jtsyzs (role, Item )
--	--SystemNotice ( role , "Invitation Invitation Invitation" )
--	local Now_Day = os.date("%d")
--	local Now_Month = os.date("%m")
--	local Now_Time = os.date("%H")
--	--SystemNotice ( role , "Wahaha" )
--	local NowMniuteNum= os.date("%M")	-------------分
--	local NowMiniuteNum= tonumber(Now_Miniute)	 	-------------分
--	local NowTimeNum = tonumber(Now_Time)
--	--SystemNotice ( role , "huhuhuhu" )
--	local NowDayNum = tonumber(Now_Day)
--	--SystemNotice ( role , "hehehehe" )
--	local NowMonthNum = tonumber(Now_Month)
--	--SystemNotice ( role , "kekekeke" )
--	local CheckDateNum = NowMonthNum * 1000000 + NowDayNum * 10000 + NowTimeNum*100+NowMniuteNum
--	--SystemNotice ( role , "timing is now"..CheckDateNum)
--	--local old_type = GetItemAttr(item_old, ITEMATTR_MAXENERGY)	----------------法式教堂
--
--	local item_old = GetChaItem2 ( role , 2 , 3078 )---------请柬
--	local old_month = GetItemAttr(item_old, ITEMATTR_VAL_STA)		-------------月 	
--	local old_day = GetItemAttr(item_old, ITEMATTR_VAL_STR)			-------------日  
--	local old_hour = GetItemAttr(item_old, ITEMATTR_VAL_CON)			-------------时 
--	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)  
--	 
--
--	local CheckBook1Num = old_month * 1000000 + old_day * 10000 + old_hour*100+old_miniute
--	--SystemNotice ( role , "CheckBook1Num"..CheckBook1Num)
--	local CheckBook2Num = old_month * 1000000 + old_day * 10000 + (old_hour+2)*100+old_miniute
--	--SystemNotice ( role , "CheckBook2Num"..CheckBook2Num)
--	
--	if CheckDateNum < CheckBook1Num then
--		SystemNotice ( role , "Please be patient, Church is not opened yet. Please come back according to the time listed" )
--		UseItemFailed ( role )
--		return
--	end
--	--SystemNotice ( role , "Mother")
--	if CheckDateNum > CheckBook2Num then
--		SystemNotice ( role , "The wedding you want to visit is already finished, too bad" )
--		UseItemFailed ( role )
--		return
--	end
--	--SystemNotice ( role , "Father")
--
--	local i = CheckBagItem(role,3066)----教堂使用证书
--	local k = ChaIsBoat(role)
--	local hp = Hp(role)
--	local mxhp = Mxhp(role)
--	local sp = Sp(role)
--	local mxsp = Mxsp(role)
--	if sp < mxsp or hp < mxhp then 
--		SystemNotice (role, "Visiting the church is a tiring process, please keep your hp and sp at 100%")
--		UseItemFailed ( role )
--		return
--	end 
--	if k == 0 then
--		if i > 0 then
--			local j = DelBagItem(role,3066,1)-------教堂使用证书
--			--if j == 1 and old_type=1 then
--				--MoveCity(role,"French Wedding Hall")
--			--elseif	j == 1 and old_type=2 then
--				--MoveCity(role,"Chinese style church")
--			if j == 1 then-------------elseif	j == 1 and old_type=3 then
--				MoveCity(role,"Church")
--				--SystemNotice ( role , "Grandfather")
--			--elseif	j == 1 and old_type=4 then
--				--MoveCity(role,"Ground type Church")
--			end
--		end
--	else
--		UseItemFailed ( role )
--	end
--	--SystemNotice ( role , "Granny")	
--end
--
--
--------------请柬
--function Jz_Script_qj (role, Item )
--	--SystemNotice ( role , "Invitation Invitation Invitation" )
--	local Now_Day = os.date("%d")
--	local Now_Month = os.date("%m")
--	local Now_Time = os.date("%H")
--	--SystemNotice ( role , "Wahaha" )
--	local NowMniuteNum= os.date("%M")	-------------分
--	local NowMiniuteNum= tonumber(Now_Miniute)	 	-------------分
--	local NowTimeNum = tonumber(Now_Time)
--	--SystemNotice ( role , "huhuhuhu" )
--	local NowDayNum = tonumber(Now_Day)
--	--SystemNotice ( role , "hehehehe" )
--	local NowMonthNum = tonumber(Now_Month)
--	--SystemNotice ( role , "kekekeke" )
--	local CheckDateNum = NowMonthNum * 1000000 + NowDayNum * 10000 + NowTimeNum*100+NowMniuteNum
--	--SystemNotice ( role , "timing is now"..CheckDateNum)
--	--local old_type = GetItemAttr(item_old, ITEMATTR_MAXENERGY)	----------------法式教堂
--
--	local item_old = GetChaItem2 ( role , 2 , 3078 )-----请柬
--	local old_month = GetItemAttr(item_old, ITEMATTR_VAL_STA)		-------------月 	
--	local old_day = GetItemAttr(item_old, ITEMATTR_VAL_STR)			-------------日  
--	local old_hour = GetItemAttr(item_old, ITEMATTR_VAL_CON)			-------------时 
--	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)  
--	 
--
--	local CheckBook1Num = old_month * 1000000 + old_day * 10000 + old_hour*100+old_miniute
--	--SystemNotice ( role , "CheckBook1Num"..CheckBook1Num)
--	local CheckBook2Num = old_month * 1000000 + old_day * 10000 + (old_hour+2)*100+old_miniute
--	--SystemNotice ( role , "CheckBook2Num"..CheckBook2Num)
--	
--	if CheckDateNum < CheckBook1Num then
--		SystemNotice ( role , "Please be patient, Church is not opened yet. Please come back according to the time listed" )
--		UseItemFailed ( role )
--		return
--	end
--	--SystemNotice ( role , "Mother")
--	if CheckDateNum > CheckBook2Num then
--		SystemNotice ( role , "The wedding you want to visit is already finished, too bad" )
--		UseItemFailed ( role )
--		return
--	end
--	--SystemNotice ( role , "Father")
--
--	local i = CheckBagItem(role,3078)
--	local k = ChaIsBoat(role)
--	local hp = Hp(role)
--	local mxhp = Mxhp(role)
--	local sp = Sp(role)
--	local mxsp = Mxsp(role)
--	if sp < mxsp or hp < mxhp then 
--		SystemNotice (role, "Visiting the church is a tiring process, please keep your hp and sp at 100%")
--		UseItemFailed ( role )
--		return
--	end 
--	if k == 0 then
--		if i > 0 then
--			local j = DelBagItem(role,3078,1)
--			--if j == 1 and old_type=1 then
--				--MoveCity(role,"French Wedding Hall")
--			--elseif	j == 1 and old_type=2 then
--				--MoveCity(role,"Chinese style church")
--			if j == 1 then-------------elseif	j == 1 and old_type=3 then
--				MoveCity(role,"Church")
--				--SystemNotice ( role , "Grandfather")
--			--elseif	j == 1 and old_type=4 then
--				--MoveCity(role,"Ground type Church")
--			end
--		end
--	else
--		UseItemFailed ( role )
--	end
--	--SystemNotice ( role , "Granny")	
--end
-----------------------------召唤婚礼淘气鬼
--function ItemUse_FLOWER ( role , Item  )
--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	if Cha_Boat ~=  nil then
--		SystemNotice( role , "Cannot use while sailing" )
--		UseItemFailed ( role )
--		return
--	end
--
--	local el = 0
--	el =IsChaInRegion( role, 2 )
--	if el == 1 then
--		SystemNotice( role , "Unable to summon monster in Safe Zone" )
--		UseItemFailed ( role )
--		return
--	end
--	local x, y = GetChaPos(role)
--	local MonsterID = 1037
--	local Refresh = 7300					--重生时间，秒单位
--	local life = 7200000					--生命时间，毫秒单位
--	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
--	SetChaLifeTime( new, life )
--end
--
--
-----------------------------气球游戏券
--function ItemUse_QQ ( role , Item  )
--	local Cha_Boat = 0
--	Cha_Boat = GetCtrlBoat ( role )
--	if Cha_Boat ~=  nil then
--		SystemNotice( role , "Cannot use while sailing" )
--		UseItemFailed ( role )
--		return
--	end
--
--	local el = 0
--	el =IsChaInRegion( role, 2 )
--	if el == 1 then
--		SystemNotice( role , "Unable to summon monster in Safe Zone" )
--		UseItemFailed ( role )
--		return
--	end
--	local x, y = GetChaPos(role)
--	local MonsterID = 1036
--	local Refresh = 60					--重生时间，秒单位
--	local life = 7200000					--生命时间，毫秒单位
--	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
--	SetChaLifeTime( new, life )
--end
----伊式教堂参观门票
--function Jz_Script_yszs (role, Item )
--	
--	local Now_Week = os.date("%w")
--	local Now_WeekNum = tonumber(Now_Week)
--	local Now_Time = os.date("%H")
--	local Now_TimeNum = tonumber(Now_Time)
--	local Now_Miniute= os.date("%M")	
--	local Now_Miniute= tonumber(Now_Miniute)
--	local CheckDateNum = Now_WeekNum * 10000 + Now_TimeNum * 100+Now_Miniute
--
--	if CheckDateNum < 11700  then
--		SystemNotice ( role , "Please be patient, church is not opened yet. Please come back on Monday night from 17:00 ~ 17:30pm" )
--		UseItemFailed ( role )
--		return
--	end
--	
--	if CheckDateNum > 11730 then
--		SystemNotice ( role , "Church is now closed, please wait until next Monday night" )
--		UseItemFailed ( role )
--		return
--	end
--
--	local i = CheckBagItem(role,3024)
--	local k = ChaIsBoat(role)
--	local hp = Hp(role)
--	local mxhp = Mxhp(role)
--	local sp = Sp(role)
--	local mxsp = Mxsp(role)
--	if sp < mxsp or hp < mxhp then 
--		SystemNotice (role, "Visiting the church is a tiring process, please keep your hp and sp at 100%")
--		UseItemFailed ( role )
--		return
--	end 
--	if k == 0 then
--		if i > 0 then
--			local j = DelBagItem(role,3024,1)
--			if j == 1 then
--				MoveCity(role,"Church")
--				return
--			end
--		end
--	else
--		UseItemFailed ( role )
--	end
--		
--end
-------------------------------红包：红包只有在（每周六\日晚18:00--22：10）打开才会有效
--
--function ItemUse_RedBox( role , Item )
--	local Cha_Boat = GetCtrlBoat ( role )
--	if Cha_Boat ~=  nil then
--		SystemNotice( role , "Cannot use while sailing" )
--		UseItemFailed ( role )
--		return
--	end
--	local Item_CanGet = GetChaFreeBagGridNum ( role )
--	 if Item_CanGet < 1 then
--		SystemNotice(role ,"You need at least 1 empty slots to open Auspicious Bag")
--		UseItemFailed ( role )
--		return
--	end
--	local now_week= os.date("%w")		-------------星期几（十进制） 
--	local now_hour= os.date("%H")		-------------时 
--	local now_miniute= os.date("%M")	-------------分
--	now_week= tonumber(now_week)
--	now_hour= tonumber(now_hour)		
--	now_miniute= tonumber(now_miniute)
--	local CheckDateNum = now_hour*100 +now_miniute
--	--Notice("CheckDateNum = "..CheckDateNum)
--      if now_week==6 or now_week==0 then
--		
--		if 1800<=CheckDateNum and  CheckDateNum<=2210 then
--		--SystemNotice( role , "Use YSBOX" )
--		ItemUse_YSBOX ( role , Item )
--		else 
--		SystemNotice(role ,"It is not time yet. Do not try to cheat!")
--		UseItemFailed ( role )
--		return
--		end
--	end
--end

------------------------升级推进器
function ItemUse_TJQ ( role , Item )
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv >70 then
		SystemNotice ( role , "Characters above Level 70 cannot use Leveling Generator" )
		UseItemFailed ( role )
		return	
	end
	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	if ChaStateLv > statelv then
		SystemNotice ( role , "already using a higher grade leveling item, please wait a while to use" )
		UseItemFailed ( role )
		return
	end
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

------------------------金牛船长宝箱：双击，根据角色给予道具

function ItemUse_JNCZBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"You need at least 4 space to use the Taurus Apparel Chest")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 3  then 
	     
	       GiveItem ( role , 0 , 5364  , 1 , 4 )
	       GiveItem ( role , 0 , 5365  , 1 , 4 )
	       GiveItem ( role , 0 , 5366  , 1 , 4 )
	       GiveItem ( role , 0 , 5367  , 1 , 4 )
	elseif cha_type == 4  then 

	       GiveItem ( role , 0 , 5368  , 1 , 4 )
	       GiveItem ( role , 0 , 5369  , 1 , 4 )
	       GiveItem ( role , 0 , 5370  , 1 , 4 )
	       GiveItem ( role , 0 , 5371  , 1 , 4 )
	elseif cha_type == 1 then 
	      
	       GiveItem ( role , 0 , 5356  , 1 , 4 )
	       GiveItem ( role , 0 , 5357  , 1 , 4 )
	       GiveItem ( role , 0 , 5358  , 1 , 4 )
	       GiveItem ( role , 0 , 5359  , 1 , 4 )
	elseif cha_type == 2 then 

	       GiveItem ( role , 0 , 5360  , 1 , 4 )
	       GiveItem ( role , 0 , 5361  , 1 , 4 )
	       GiveItem ( role , 0 , 5362  , 1 , 4 )
	       GiveItem ( role , 0 , 5363  , 1 , 4 )
	end
end


---------------------------召唤金牛守护者
function ItemUse_JNSHZ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1038
	local Refresh = 10900					--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

--糯米粽
function ItemUse_NMZ ( role , Item )
	SystemNotice(role ,"The item has gone rusty and has lost its effect, don't be too sad")
  	--local hp = GetChaAttr(role, ATTR_HP) 
	--local mxhp = GetChaAttr(role,ATTR_MXHP) 	
	--hp = hp + 0.35*mxhp 

	--if hp > mxhp then 
		--hp = mxhp 
	--end 
	--SetCharaAttr(hp, role, ATTR_HP)

end


------------------------------豆沙粽：行走速度在15分钟内有较大提升效果
function ItemUse_DSZ ( role , Item )
	SystemNotice(role ,"The item has gone rusty and has lost its effect, don't be too sad")
	--local statelv = 1
	--local statetime = 900
	--local Cha_Boat = 0
	--Cha_Boat = GetCtrlBoat ( role )
	--if Cha_Boat ==  nil then
		--Rem_State_StarUnnormal ( role )----------
		--AddState( role , role , STATE_DSZ , statelv , statetime )
	--else
		--SystemNotice( role , "Cannot use while sailing" )
		--UseItemFailed ( role )
		--return
	--end
end

-------------------------------蛋黄粽: 防御力在10分钟内提升60点
function ItemUse_DHZ ( role , Item )
	SystemNotice(role ,"The item has gone rusty and has lost its effect, don't be too sad")
	--local statelv = 1
	--local statetime = 600
	--local Cha_Boat = 0
	--Cha_Boat = GetCtrlBoat ( role )

	--if Cha_Boat ==  nil then
		--AddState( role , role , STATE_DHZ , statelv , statetime )
	--else
		--SystemNotice( role , "Cannot use while sailing" )
		--UseItemFailed ( role )
		--return
	--end
end
----------------------------温情粽子
function ItemUse_WQZZ ( role , Item )
	SystemNotice(role ,"The item has gone rusty and has lost its effect, don't be too sad")
	--local el_exp = GetChaAttr(role, ATTR_CEXP)
	--local exp1=el_exp
	--local charLv=Lv ( role )
	--local exp_resume = 50
	--local	exp_resume_1= 1
	--el_exp = el_exp + exp_resume
	-- if charLv>=80 then	
		--el_exp = exp1 + exp_resume_1
	--end
	--SetCharaAttr(el_exp, role, ATTR_CEXP) 
end 

---------------------------召唤黑龙幻体
function ItemUse_HLHT ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 952---------黑龙幻影
	local Refresh = 9000					--重生时间，秒单位
	local life =9000000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

---------------------------召唤蜥蜴战士统领
function ItemUse_XYZSTL ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 786---------蜥蜴战士统领
	local Refresh = 9000					--重生时间，秒单位
	local life = 9000000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

---------------------------召唤邪恶的土著酋长
function ItemUse_XETZQZ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 788---------邪恶的土著酋长
	local Refresh = 9000					--重生时间，秒单位
	local life = 9000000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

---------------------------召唤海盗船长零零发
function ItemUse_HDCZ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 757---------海盗船长零零发
	local Refresh = 9000					--重生时间，秒单位
	local life = 9000000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end

---------------------------召唤狐妖
function ItemUse_HY ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 761---------狐妖
	local Refresh = 9000					--重生时间，秒单位
	local life = 9000000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end
----------幸运字母卡宝箱
function ItemUse_XingYunBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local el=math.random ( 1, 241920 )
	if el==1 then
		GiveItem ( role , 0 , 0961, 1 , 4  ) -------------c	
	elseif el==2 then
		GiveItem ( role , 0 , 0969, 1 , 4  ) -----------k		
	elseif el>=3 and el<=4 then
		GiveItem ( role , 0 , 0973, 1 , 4  )	-------------p	
	elseif el>=5 and el<=6 then
		GiveItem ( role , 0 , 0980, 1 , 4  )	-------------v
	elseif el>=7 and el<=8 then
		GiveItem ( role , 0 , 0979, 1 , 4  )	-------------u
	else
		local el=math.random ( 0959, 0984 )
		if el==0961 or el==0969 or el==0973 or el==0980 or el==0979 then
			GiveItem ( role , 0 , 0959  , 1 , 4  ) 
		else 
			GiveItem ( role , 0 , el , 1 , 4  ) 			
		end
	end
end

------------------------超级助推器
function ItemUse_CJZTQ ( role , Item )
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv >49 then
		SystemNotice ( role , "Characters above 49 cannot use Super booster" )
		UseItemFailed ( role )
		return	
	end
	local statelv = 5
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	if ChaStateLv > statelv then
		SystemNotice ( role , "already using a higher grade leveling item, please wait a while to use" )
		UseItemFailed ( role )
		return
	end
	local statetime = 900
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

----------世纪辉煌彩票
function ItemUse_SJHHCP( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local star=math.random ( 1, 1000000 )
	local el=math.random ( 1, 100 )

	--SystemNotice(role ,"star=="..star)
	--SystemNotice(role ,"el=="..el)
	if  star==1 then
		if el>=1 and el<=40 then
		GiveItem ( role , 0 , 1115  , 1 , 4  )
		elseif el>=41 and el<=65 then
		GiveItem ( role , 0 , 1117  , 1 , 4  )
		elseif el>=65 and el<=90 then
		GiveItem ( role , 0 , 1118  , 1 , 4  )
		elseif el>=91 and el<=100 then
		GiveItem ( role , 0 , 1116  , 1 , 4  ) 
		end
	elseif star>1 and star<=9999 then
		GiveItem ( role , 0 , 0273, 1 , 4  ) 
	elseif star>=10000 and star<170000 then
		GiveItem ( role , 0 , 2312, 30 , 4  ) 
	elseif star>=170000 and star<=1000000 then
		GiveItem ( role , 0 , 3877, 1 , 4  ) 
	end
end


----------至尊年兽彩票
function ItemUse_ZZNSCP( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local star=math.random ( 1, 1000000 )
	local el=math.random ( 1, 100 )

	--SystemNotice(role ,"star=="..star)
	--SystemNotice(role ,"el=="..el)
	if  star==1 then
		if el>=1 and el<=40 then
		GiveItem ( role , 0 , 2552  , 1 , 4  )
		elseif el>=41 and el<=65 then
		GiveItem ( role , 0 , 2550  , 1 , 4  )
		elseif el>=65 and el<=90 then
		GiveItem ( role , 0 , 2551  , 1 , 4  )
		elseif el>=91 and el<=100 then
		GiveItem ( role , 0 , 2549  , 1 , 4  ) 
		end
	elseif star>1 and star<=9999 then
		GiveItem ( role , 0 , 0273, 1 , 4  ) 
	elseif star>=10000 and star<170000 then
		GiveItem ( role , 0 , 2312, 30 , 4  ) 
	elseif star>=170000 and star<=1000000 then
		GiveItem ( role , 0 , 3877, 1 , 4  ) 
	end
end

----------真·黑龙彩票
function ItemUse_ZHLCP( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local star=math.random ( 1, 1000000 )
	local el=math.random ( 1, 100 )

	--SystemNotice(role ,"star=="..star)
	--SystemNotice(role ,"el=="..el)
	if  star==1 then
		if el>=1 and el<=40 then
		GiveItem ( role , 0 , 2370  , 1 , 4  )
		elseif el>=41 and el<=65 then
		GiveItem ( role , 0 , 2368  , 1 , 4  )
		elseif el>=65 and el<=90 then
		GiveItem ( role , 0 , 2369  , 1 , 4  )
		elseif el>=91 and el<=100 then
		GiveItem ( role , 0 , 2367  , 1 , 4  ) 
		end
	elseif star>1 and star<=9999 then
		GiveItem ( role , 0 , 0273, 1 , 4  ) 
	elseif star>=10000 and star<170000 then
		GiveItem ( role , 0 , 2312, 30 , 4  ) 
	elseif star>=170000 and star<=1000000 then
		GiveItem ( role , 0 , 3877, 1 , 4  ) 
	end
end




----------惊世转生彩票------rock要的
function ItemUse_JSZSCP( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local star=math.random ( 1, 1000 )

	if  star==1 then
		GiveItem ( role , 0 , 2941, 1 , 4  ) 
		local cha_name = GetChaDefaultName ( role ) 
		local message = "Player"..cha_name.."人品爆发,打开惊世转生彩票惊喜地获得1张转生卡." 
		Notice ( message )
	elseif star>1 and star<=10 then
		GiveItem ( role , 0 , 3016, 1 , 4  ) 
		local cha_name = GetChaDefaultName ( role ) 
		local message = "Player"..cha_name.."人品爆发,打开惊世转生彩票惊喜地获得1张黑龙幻体召唤卷." 
		Notice ( message )
	elseif star>=11 and star<190 then
		GiveItem ( role , 0 , 0992, 1 , 4  ) 
	elseif star>=190 and star<=1000 then
		GiveItem ( role , 0 , 3885, 1 , 4  ) 
	end
end
-------------------祝福宝珠
function ItemUse_ZFBZ( role , Item )
	local statelv = 1
	local statetime = 15
	AddState( role , role , STATE_CZZX , statelv , statetime )
end
------------------------成长快餐
function ItemUse_CZKC ( role , Item )
	local Cha_Boat = 0
	local charLv=Lv ( role )
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )----------当前等级经验
	local dif_exp_thalf_c = (DEXP[charLv+1] - DEXP[charLv])*0.01+Exp_star
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	if charLv<86 then
		SystemNotice( role , "86级以下角色不能使用" )
		UseItemFailed ( role )
		return
	end
	if charLv>=86 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_c )
        end
end
------------------------双子船长宝箱：双击，根据角色给予道具

function ItemUse_SZCZBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"使用双子酷装宝箱最少需要4个空位")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 3  then 
	     
	       GiveItem ( role , 0 , 5380  , 1 , 4 )
	       GiveItem ( role , 0 , 5381  , 1 , 4 )
	       GiveItem ( role , 0 , 5382  , 1 , 4 )
	       GiveItem ( role , 0 , 5383  , 1 , 4 )
	elseif cha_type == 4  then 

	       GiveItem ( role , 0 , 5384  , 1 , 4 )
	       GiveItem ( role , 0 , 5385  , 1 , 4 )
	       GiveItem ( role , 0 , 5386  , 1 , 4 )
	       GiveItem ( role , 0 , 5387  , 1 , 4 )
	elseif cha_type == 1 then 
	      
	       GiveItem ( role , 0 , 5372  , 1 , 4 )
	       GiveItem ( role , 0 , 5373  , 1 , 4 )
	       GiveItem ( role , 0 , 5374  , 1 , 4 )
	       GiveItem ( role , 0 , 5375  , 1 , 4 )
	elseif cha_type == 2 then 

	       GiveItem ( role , 0 , 5376  , 1 , 4 )
	       GiveItem ( role , 0 , 5377  , 1 , 4 )
	       GiveItem ( role , 0 , 5378  , 1 , 4 )
	       GiveItem ( role , 0 , 5379  , 1 , 4 )
	end
end



---------------------------召唤双子守护者
function ItemUse_SZSHZ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1039
	local Refresh = 10900					--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end


----------毕业证书使用
function ItemUse_byzm ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 100 )
	SystemNotice(role ,"star=="..star)
	if star<=5 then
		GiveItem ( role , 0 , 1028  , 1 , 4  )
		local message = cha_name.."打开毕业证书惊喜地获得 1颗摩力符石" 
		Notice ( message )
	elseif star>=6 and star<=20 then
		GiveItem ( role , 0 , 885, 1 , 4  ) 
		local message1 = cha_name.."打开毕业证书惊喜地获得 1颗精炼石" 
		Notice ( message1 )
	elseif star>=21 and star<=50 then
		GiveItem ( role , 0 , 3039, 5 , 4  ) 
		local message2 = cha_name.."打开毕业证书惊喜地获得 5个升级推进器" 
		Notice ( message2 )
	else
		GiveItem ( role , 0 , 227, 10 , 4  )
		local message3 = cha_name.."打开毕业证书惊喜地获得 10个守护精灵饲料" 
		Notice ( message3 )
	end
end
------------------------开学大礼包：双击，根据角色给予道具

function ItemUse_kxdlb ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"使用开学大礼包最少需要4个空位")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 3  then 
	       GiveItem ( role , 0 , 5396  , 1 , 4 )
	       GiveItem ( role , 0 , 5397  , 1 , 4 )
	       GiveItem ( role , 0 , 5398  , 1 , 4 )
	       GiveItem ( role , 0 , 5399  , 1 , 4 )
	elseif cha_type == 4  then 
	       GiveItem ( role , 0 , 5400  , 1 , 4 )
	       GiveItem ( role , 0 , 5401  , 1 , 4 )
	       GiveItem ( role , 0 , 5402  , 1 , 4 )
	       GiveItem ( role , 0 , 5403  , 1 , 4 )
	elseif cha_type == 1 then 
	       GiveItem ( role , 0 , 5388  , 1 , 4 )
	       GiveItem ( role , 0 , 5389  , 1 , 4 )
	       GiveItem ( role , 0 , 5390  , 1 , 4 )
	       GiveItem ( role , 0 , 5391  , 1 , 4 )
	elseif cha_type == 2 then 
	       GiveItem ( role , 0 , 5392  , 1 , 4 )
	       GiveItem ( role , 0 , 5393  , 1 , 4 )
	       GiveItem ( role , 0 , 5394  , 1 , 4 )
	       GiveItem ( role , 0 , 5395  , 1 , 4 )
	end
end


-------------------------------胜利宝箱
function ItemUse_SLBox ( role , Item )
	local a = math.random ( 1 , 100 )
	local Item_ID = 0
	if a >= 1 and a <= 50 then
		Item_ID = 1012
	elseif a > 50 and a <= 80 then
		Item_ID = 271
	else
		Item_ID = 885
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"使用胜利宝箱最少需要1个空位")
		UseItemFailed ( role )
		return
	else
		GiveItem ( role , 0 , Item_ID , 1 , 4 )
	end
end

--------------------------------65BOSS装备箱
function ItemUse_65BBBox ( role , Item )
	local job = GetChaAttr( role, ATTR_JOB) --取职业
        local cha_type = GetChaTypeID ( role )
	if job == 0 then
		SystemNotice ( role , "只有一转以上的角色才可以使用本宝箱")
		UseItemFailed ( role )
		return
	else
		if job == 12 or job == 2 then		--猎人或狙击
			GiveItem( role , 0 , 780  , 1 , 4 )
		elseif job == 9	then			--双剑
			GiveItem( role , 0 , 769  , 1 , 4 )
		elseif job == 16 or job == 4 then	--冒险或航海
			GiveItem( role , 0 , 806  , 1 , 4 )
		elseif job == 8	then			--巨剑
			GiveItem( role , 0 , 766  , 1 , 4 )
		elseif job == 13 or job == 5 then	--圣职或药师
			GiveItem( role , 0 ,792  , 1 , 4 )
		elseif job == 14 then			--封印
			GiveItem( role , 0 , 798  , 1 , 4 )
		elseif job == 1 then
			if cha_type == 1 then
				GiveItem( role , 0 , 769  , 1 , 4 )
			elseif cha_type == 2 then
				GiveItem( role , 0 , 766  , 1 , 4 )
			end
		end
	
	end
end


---------------------巨蟹船长宝箱：双击，根据角色给予道具

function ItemUse_JXBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 4 then
		SystemNotice(role ,"使用巨蟹酷装宝箱最少需要4个空位")
		UseItemFailed ( role )
		return
	end
	local cha_type = GetChaTypeID ( role ) 
	if cha_type == 3  then 
	     
	       GiveItem ( role , 0 , 5464  , 1 , 4 )
	       GiveItem ( role , 0 , 5465  , 1 , 4 )
	       GiveItem ( role , 0 , 5466  , 1 , 4 )
	       GiveItem ( role , 0 , 5467  , 1 , 4 )
	elseif cha_type == 4  then 

	       GiveItem ( role , 0 , 5468  , 1 , 4 )
	       GiveItem ( role , 0 , 5469  , 1 , 4 )
	       GiveItem ( role , 0 , 5470  , 1 , 4 )
	       GiveItem ( role , 0 , 5471  , 1 , 4 )
	elseif cha_type == 1 then 
	      
	       GiveItem ( role , 0 , 5456  , 1 , 4 )
	       GiveItem ( role , 0 , 5457  , 1 , 4 )
	       GiveItem ( role , 0 , 5458  , 1 , 4 )
	       GiveItem ( role , 0 , 5459  , 1 , 4 )
	elseif cha_type == 2 then 

	       GiveItem ( role , 0 , 5460  , 1 , 4 )
	       GiveItem ( role , 0 , 5461  , 1 , 4 )
	       GiveItem ( role , 0 , 5462  , 1 , 4 )
	       GiveItem ( role , 0 , 5463  , 1 , 4 )
	end
end

---------------------------召唤巨蟹守护者
function ItemUse_JXSHZ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1040
	local Refresh = 10900					--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end


--------------------------------------------------kokora--------------------------------------------------
--------------------------------金秋十月活动之毛蟹食用效果
function ItemUse_littlecrab ( role , Item )
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv >86 then
		SystemNotice ( role , "86级以上角色不能使用！" )
		UseItemFailed ( role )
		return	
	end

	local statelv = 4
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "已使用更高等级的同类物品，请稍候再用" )
		UseItemFailed ( role )
		return
	end
	local statetime = 120
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"感受到食用毛蟹的效果" )
end


--------------------------------金秋十月活动之大闸蟹食用效果
function ItemUse_bigcrab ( role , Item )
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv >86 then
		SystemNotice ( role , "86级以上角色不能使用！" )
		UseItemFailed ( role )
		return	
	end

	local statelv = 6
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "已使用更高等级的同类物品，请稍候再用" )
		UseItemFailed ( role )
		return
	end
	local statetime = 120
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"感受到食用大闸蟹的效果" )
end

--------------------------------金秋十月活动之蟹苗食用效果
function ItemUse_babycrab ( role , Item )  
	local el_exp = GetChaAttr(role, ATTR_CEXP)
	local exp1=el_exp
	local charLv=Lv ( role )
	local exp_resume = 1000
	local	exp_resume_1= 20
	el_exp = el_exp + exp_resume
	 if charLv>=80 then	
		el_exp = exp1 + exp_resume_1
	end
	SetCharaAttr(el_exp, role, ATTR_CEXP) 
end 
--------------------------------金秋十月活动之蟹王食用效果
function ItemUse_kingcrab ( role , Item )
	local Cha_Boat = 0
	local charLv=Lv ( role )
	local dif_exp_one = DEXP[charLv+1]
	local dif_exp_three = DEXP[charLv+3]
	local dif_exp_five = DEXP[charLv+5]
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )----------当前等级经验
	local dif_exp_half = (DEXP[charLv+1] - DEXP[charLv])*0.5 +  Exp_star +10
	local dif_exp_thalf = (DEXP[charLv+1] - DEXP[charLv])*0.3  +  Exp_star + 10
	local dif_exp_thalf_b = dif_exp_thalf - DEXP[charLv+1]
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	elseif charLv>=1 and charLv<=9 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_five )
	elseif charLv>=10 and charLv<=29 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_three )
	elseif charLv>=30 and charLv<=59 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_one )
	elseif charLv>=60 and charLv<=75 then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_half )
	elseif charLv>=76 and charLv<=85 and charLv~=79  then
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b<=0 then 
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv==79 and dif_exp_thalf_b>0 then 
			dif_exp_thalf = dif_exp_thalf_b*0.02 + DEXP[charLv+1]
			SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
	elseif charLv>=86 then
		SystemNotice( role , "Your level is too high to use" )
		UseItemFailed ( role )
		return
	end
end


------------------------------------------------kokora--------------------------------------------------
----------天使宝藏
function ItemUse_TSBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 100 )
	--SystemNotice(role ,"star=="..star)
	if star<=20 then
		GiveItem ( role , 0 , 3457  , 1 , 4  )
		local message = cha_name.."打开天使宝藏惊喜地获得 纳卡符石" 
		Notice ( message )
	elseif star>=21 and star<=70 then
		GiveItem ( role , 0 ,3433, 1 , 4  ) 
		local message1 = cha_name.."打开天使宝藏惊喜地获得 费诺符石" 
		Notice ( message1 )
	else
		GiveItem ( role , 0 , 0271, 1 , 4  ) 
		local message2 = cha_name.."打开天使宝藏惊喜地获得 天使骰子" 
		Notice ( message2 )
	end
end


----------黄金圣斗士宝藏
function ItemUse_SDSBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 100 )
	--SystemNotice(role ,"star=="..star)
	if star<=25 then
		GiveItem ( role , 0 , 2955  , 1 , 4  )
		local message = cha_name.."打开黄金圣斗士宝藏惊喜地获得 白羊船长酷装宝箱" 
		Notice ( message )
	elseif star>=26 and star<=50 then
		GiveItem ( role , 0 ,3035, 1 , 4  ) 
		local message1 = cha_name.."打开黄金圣斗士宝藏惊喜地获得 金牛船长酷装宝箱" 
		Notice ( message1 )
	elseif star>=51 and star<=75 then
		GiveItem ( role , 0 ,1881, 1 , 4  ) 
		local message2 = cha_name.."打开黄金圣斗士宝藏惊喜地获得 双子船长酷装宝箱" 
		Notice ( message2 )
	else
		GiveItem ( role , 0 , 2575, 1 , 4  ) 
		local message3 = cha_name.."打开黄金圣斗士宝藏惊喜地获得 巨蟹船长酷装宝箱" 
		Notice ( message3 )
	end
end


----------神龙宝藏
function ItemUse_ShenLongBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 100 )
	--SystemNotice(role ,"star=="..star)
	if star<=20 then
		GiveItem ( role , 0 , 0864  , 1 , 4  )
		local message = cha_name.."打开神龙宝藏惊喜地获得 黑龙之瞳" 
		Notice ( message )
	elseif star>=21 and star<=40 then
		GiveItem ( role , 0 ,0865, 1 , 4  ) 
		local message1 = cha_name.."打开神龙宝藏惊喜地获得 黑龙之魂" 
		Notice ( message1 )
	elseif star>=41 and star<=60 then
		GiveItem ( role , 0 ,0866, 1 , 4  ) 
		local message2 = cha_name.."打开神龙宝藏惊喜地获得 黑龙之心" 
		Notice ( message2 )
	else
		GiveItem ( role , 0 , 1012, 1 , 4  ) 
		local message3 = cha_name.."打开神龙宝藏惊喜地获得 加纳之神" 
		Notice ( message3 )
	end
end


----------极速宝藏
function ItemUse_JSBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0992 , 99 , 4) 			
	local itemname = GetItemName (0992) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."打开极速宝藏惊喜地获得99个"..itemname  
	Notice ( message )
end

----------恶魔宝藏
function ItemUse_EMBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2842 , 1 , 4) 			
	local itemname = GetItemName (2842) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."打开恶魔宝藏惊喜地获得"..itemname  
	Notice ( message )
end

----------年兽宝藏
function ItemUse_NSBox( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 0192 , 1 , 4) 			
	local itemname = GetItemName (0192) 
	local cha_name = GetChaDefaultName ( role ) 
	local message = cha_name.."打开年兽宝藏惊喜地获得"..itemname  
	Notice ( message )
end
--------------------------------死神宝藏
function ItemUse_SSBox ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"Inventory requires at least 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local job = GetChaAttr( role, ATTR_JOB) --取职业
        local cha_type = GetChaTypeID ( role )
	if job == 0 or job ==1   or job ==2  or job ==4   or job ==5  then
		SystemNotice ( role , "只有二转角色才可以使用本宝箱")
		UseItemFailed ( role )
		return
	else
		if job == 12 then			--狙击
			GiveItem( role , 0 , 2838  , 1 , 4 )
			local cha_name = GetChaDefaultName ( role ) 
			local message = cha_name.."打开死神宝藏惊喜地获得 地狱包袱"  
			Notice ( message )
		elseif job == 9	then			--双剑
			GiveItem( role , 0 , 2837  , 1 , 4 )
			local cha_name = GetChaDefaultName ( role ) 
			local message1 = cha_name.."打开死神宝藏惊喜地获得 暗黑盒子"  
			Notice ( message1 )
		elseif job == 16 then			--航海
			GiveItem( role , 0 , 2839  , 1 , 4 )
			local cha_name = GetChaDefaultName ( role ) 
			local message2 = cha_name.."打开死神宝藏惊喜地获得 修罗箱子"  
			Notice ( message2 )
		elseif job == 8	then			--巨剑
			GiveItem( role , 0 , 2836  , 1 , 4 )
			local cha_name = GetChaDefaultName ( role ) 
			local message3 = cha_name.."打开死神宝藏惊喜地获得 哈迪斯遗物"  
			Notice ( message3 )
		elseif job == 13 then			--圣职
			GiveItem( role , 0 ,2840  , 1 , 4 )
			local cha_name = GetChaDefaultName ( role ) 
			local message4 = cha_name.."打开死神宝藏惊喜地获得 幽冥宝藏"  
			Notice ( message4 )
		elseif job == 14 then			--封印
			GiveItem( role , 0 , 2841  , 1 , 4 )
			local cha_name = GetChaDefaultName ( role ) 
			local message5 = cha_name.."打开死神宝藏惊喜地获得 冥河小包"  
			Notice ( message5 )
		
		end
	
	end
end

--洛克藏宝图 

function ItemUse_Map_LK ( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local Has_GoldenMap = CheckBagItem ( role , 2998 )
	if Has_GoldenMap >= 1 then
		SystemNotice ( role , "同时只能携带一个海盗罗盘" )
		UseItemFailed ( role )
		return
	end
	GiveItem ( role , 0 , 2998 , 1 , 0 )
end


-- 海盗罗盘


function ItemUse_HDLP ( role , Item )
	SystemNotice(role ,"罗盘阿.....")
 	local Item_CanGet = GetChaFreeBagGridNum ( role )
	 if Item_CanGet < 1 then
		SystemNotice(role ,"You need to have at least 1 empty inventory slot")
		UseItemFailed ( role )
		return
	end 
	local Has_GoldenMap = CheckBagItem ( role , 2998 )
	if Has_GoldenMap >= 2 then
		SystemNotice ( role , "所携带的海盗罗盘超过一个,你太贪心了,寻宝失败.多余的藏宝图可以暂时存放到银行里" )
		UseItemFailed ( role )
		return
	end
	local Item = GetChaItem2 ( role , 2 , 2998 )
	local Item_MAXURE = GetItemAttr ( Item , ITEMATTR_MAXURE )
	local Item_URE = GetItemAttr ( Item , ITEMATTR_URE )
	local Item_MAXENERGY = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
	local pos_x = Item_MAXURE
	local pos_y = Item_MAXENERGY
	local Themap = Item_URE
--	SystemNotice ( role , "pos_x"..pos_x )
--	SystemNotice ( role , "pos_y"..pos_y )
--	SystemNotice ( role , "Themap"..Themap )
	
	local MapList = { }
	
	MapList [0] = "NoMap"
	MapList [1] = "garner"
	MapList [2] = "magicsea"
	MapList [3] = "darkblue"

	local MapNameList = { }
	
	MapNameList [0] = "No map"
	MapNameList [1] = "Ascaron"
	MapNameList [2] = "Magical Ocean"
	MapNameList [3] = "Deep Blue"
	if pos_x == 0 or pos_y == 0 or Themap == 0 then
		pos_x , pos_y , Themap = GetTheMapPos ( role , 1 )		
--		pos_x,pos_y,Themap = GetMapRanPos ( role )
		Item_MAXURE = pos_x
		Item_URE = Themap
		Item_MAXENERGY = pos_y
		
		SetItemAttr ( Item , ITEMATTR_MAXENERGY , Item_MAXENERGY )
		SetItemAttr ( Item , ITEMATTR_MAXURE , Item_MAXURE )
		SetItemAttr ( Item , ITEMATTR_URE , Item_URE )
--		SystemNotice ( role , "Themap"..Themap )
--		Item_MAXENERGY = GetItemAttr ( Item , ITEMATTR_MAXENERGY )
--		SystemNotice ( role , "Item_MAXENERGY"..Item_MAXENERGY )
	end
	local GetPos = CheckGetMapPos ( role , pos_x , pos_y , MapList[Themap] )
--	SystemNotice ( role , "CheckPosOver"..GetPos ) 
	if GetPos == 0 then
		SystemNotice ( role , "Treasure is hidden at "..MapNameList[Themap].."Region"..pos_x..","..pos_y.." nearby" )
		UseItemFailed ( role )
		return
	elseif GetPos == 1 then
		local getrandom = math.random ( 1 , 3 )
		if getrandom==1 then
			GiveZNZItem ( role )
		else
			SystemNotice ( role , "好像没挖出来什么,继续在附近挖挖看吧" )
			UseItemFailed ( role )
			return
		end
	end
end

function Sk_Script_DS	( role , Item ) 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		UseItemFailed ( role ) 
		SystemNotice( role , "你至少需要一个空格来获得学生证")
		return 
	end 
	local sk_add = SK_DS  
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
	if form_sklv ~= 0  then 
		UseItemFailed ( role )  
		return 
	end 
	a = AddChaSkill ( role , sk_add, 1 , 1 , 1 ) 				--学会技能
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
	
	local r1 = 0
	local r2 = 0
	r1, r2 = MakeItem ( role , 3289 , 1 , 4 )				--给学生证
	local Itemnew = GetChaItem ( role , 2 , r2 )

	SetItemAttr(Itemnew, ITEMATTR_MAXENERGY , 120)           --设置最高存储经验
	SetItemAttr(Itemnew, ITEMATTR_ENERGY , 0 )              				 --设置当前存储经验
	SetItemAttr(Itemnew, ITEMATTR_URE,0)								 --设置当前存储学分
	SetItemAttr(Itemnew, ITEMATTR_MAXURE,150)						--设置当前最大学分，该值在每次升级考试后会变化
	SetItemAttr(Itemnew, ITEMATTR_FORGE,0)								--设置学历
	
	LiveSkillLearnLog(role, 461)
end 

function ItemUse_WisdomApple( role , Item )		-------智慧果使用效果
	local Lv = Lv( role )
	if Lv < 40 then
		SystemNotice(role ,"Only players Lv 40 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 1
	local ChaStateLv = GetChaStateLv ( role , STATE_APPLE )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_APPLE , statelv , statetime )
	else
		UseItemFailed ( role )
		SystemNotice( role , "海上无法食用智慧果")
	end
end

function ItemUse_GoldApple ( role , Item )
	local Lv = Lv( role )
	if Lv < 60 then
		SystemNotice(role ,"Only Lv 60 and above may use")
		UseItemFailed ( role )
		return
	end

	local statelv = 2
	local ChaStateLv = GetChaStateLv ( role , STATE_APPLE )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "Better fruit in effect. Please use it later" )
		UseItemFailed ( role )
		return
	end

	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
--	SystemNotice( role , Cha_Boat )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_APPLE , statelv , statetime )
	else
		UseItemFailed ( role )
		SystemNotice( role , "海上无法食用金苹果果")
	end
end


--------------------------------------------嘉宾宝箱
function ItemUse_JBBOX( role , Item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <1 then
		SystemNotice(role ,"To open a Chest requires 1 empty slot")
		UseItemFailed ( role )
		return
	end
	local r1,r2 =MakeItem ( role , 3078  , 1 , 4 )
	local Item_el = GetChaItem ( role , 2 , r2 )			--取新精灵道具指针

	local item_old = GetChaItem2 ( role , 2 , 3066 )

	local old_month = GetItemAttr(item_old, ITEMATTR_VAL_STA)		-------------月 	
	local old_day = GetItemAttr(item_old, ITEMATTR_VAL_STR)			-------------日  
	local old_hour = GetItemAttr(item_old, ITEMATTR_VAL_CON)			-------------时   
	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)		-------------分   
	
	--SystemNotice ( role , "old_month=="..old_month )
	--SystemNotice ( role , "old_day=="..old_day )       
	--SystemNotice ( role , "old_hour=="..old_hour )    
	--SystemNotice ( role , "old_miniute=="..old_miniute)

	SetItemAttr(Item_el, ITEMATTR_VAL_STA, old_month )	-------------月 	
	SetItemAttr(Item_el, ITEMATTR_VAL_STR, old_day )		-------------日  
	SetItemAttr(Item_el, ITEMATTR_VAL_CON, old_hour )		-------------时 
	SetItemAttr(Item_el, ITEMATTR_VAL_DEX, old_miniute )	-------------分

	local old_month2 = GetItemAttr(Item_el, ITEMATTR_VAL_STA)		-------------月 	
	local old_day2 = GetItemAttr(Item_el, ITEMATTR_VAL_STR)			-------------日  
	local old_hour2 = GetItemAttr(Item_el, ITEMATTR_VAL_CON)			-------------时   
	local old_miniute2 = GetItemAttr(Item_el, ITEMATTR_VAL_DEX)		-------------分 

	--SystemNotice ( role , "old_month2=="..old_month2 )
	--SystemNotice ( role , "old_day2=="..old_day2 )       
	--SystemNotice ( role , "old_hour2=="..old_hour2 )    
	--SystemNotice ( role , "old_miniute2=="..old_miniute2)

	SynChaKitbag(role,13)

end


------------------浪漫烟花
function ItemUse_LMYH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

------------------巨响烟花
function ItemUse_JXYH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

------------------豪华烟花
function ItemUse_HHLH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
end

---------教堂使用证书
function Jz_Script_jtsyzs (role, Item )
	
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	local NowMniuteNum= os.date("%M")	
	local NowMiniuteNum= tonumber(Now_Miniute)	 	
	local NowTimeNum = tonumber(Now_Time)
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local CheckDateNum = NowMonthNum * 1000000 + NowDayNum * 10000 + NowTimeNum*100+NowMniuteNum
	--SystemNotice ( role , "timing is now"..CheckDateNum)

	local item_old = GetChaItem2 ( role , 2 , 3066 )----教堂使用证
	local old_month = GetItemAttr(item_old, ITEMATTR_VAL_STA)			
	local old_day = GetItemAttr(item_old, ITEMATTR_VAL_STR)			  
	local old_hour = GetItemAttr(item_old, ITEMATTR_VAL_CON)			 
	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)  
	 
	local CheckBook1Num = old_month * 1000000 + old_day * 10000 + old_hour*100+old_miniute
	--SystemNotice ( role , "CheckBook1Num"..CheckBook1Num)
	local CheckBook2Num = old_month * 1000000 + old_day * 10000 + (old_hour+2)*100+old_miniute
	--SystemNotice ( role , "CheckBook2Num"..CheckBook2Num)
	
	local i = CheckBagItem(role,3066)
	local k = ChaIsBoat(role)
	if CheckDateNum >= CheckBook1Num  and CheckDateNum <= CheckBook2Num and k ==0 and  i >0 then
		 DelBagItem(role,3066,1)
		MoveCity(role,"Church")	
	else
		SystemNotice ( role , "咦?难道是时间不对")
		UseItemFailed ( role )
	end
end

------------请柬
function Jz_Script_qj (role, Item )
	--SystemNotice ( role , "Invitation Invitation Invitation" )
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local Now_Time = os.date("%H")
	--SystemNotice ( role , "Wahaha" )
	local NowMniuteNum= os.date("%M")	-------------分
	local NowMiniuteNum= tonumber(Now_Miniute)	 	-------------分
	local NowTimeNum = tonumber(Now_Time)
	--SystemNotice ( role , "huhuhuhu" )
	local NowDayNum = tonumber(Now_Day)
	--SystemNotice ( role , "hehehehe" )
	local NowMonthNum = tonumber(Now_Month)
	--SystemNotice ( role , "kekekeke" )
	local CheckDateNum = NowMonthNum * 1000000 + NowDayNum * 10000 + NowTimeNum*100+NowMniuteNum
	--SystemNotice ( role , "timing is now"..CheckDateNum)
	--local old_type = GetItemAttr(item_old, ITEMATTR_MAXENERGY)	----------------法式教堂

	local item_old = GetChaItem2 ( role , 2 , 3078 )
	local old_month = GetItemAttr(item_old, ITEMATTR_VAL_STA)		-------------月 	
	local old_day = GetItemAttr(item_old, ITEMATTR_VAL_STR)			-------------日  
	local old_hour = GetItemAttr(item_old, ITEMATTR_VAL_CON)			-------------时 
	local old_miniute = GetItemAttr(item_old, ITEMATTR_VAL_DEX)  
	 

	local CheckBook1Num = old_month * 1000000 + old_day * 10000 + old_hour*100+old_miniute
	--SystemNotice ( role , "CheckBook1Num"..CheckBook1Num)
	local CheckBook2Num = old_month * 1000000 + old_day * 10000 + (old_hour+2)*100+old_miniute
	--SystemNotice ( role , "CheckBook2Num"..CheckBook2Num)
	
	if CheckDateNum < CheckBook1Num then
		SystemNotice ( role , "Please be patient, Church is not opened yet. Please come back according to the time listed" )
		UseItemFailed ( role )
		return
	end
	--SystemNotice ( role , "Mother")
	if CheckDateNum > CheckBook2Num then
		SystemNotice ( role , "The wedding you want to visit is already finished, too bad" )
		UseItemFailed ( role )
		return
	end
	--SystemNotice ( role , "Father")

	local i = CheckBagItem(role,3078)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Visiting the church is a tiring process, please keep your hp and sp at 100%")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3078,1)
			--if j == 1 and old_type=1 then
				--MoveCity(role,"French Wedding Hall")
			--elseif	j == 1 and old_type=2 then
				--MoveCity(role,"Chinese style church")
			if j == 1 then-------------elseif	j == 1 and old_type=3 then
				MoveCity(role,"Church")
				--SystemNotice ( role , "Grandfather")
			--elseif	j == 1 and old_type=4 then
				--MoveCity(role,"Ground type Church")
			end
		end
	else
		UseItemFailed ( role )
	end
	--SystemNotice ( role , "Granny")	
end
---------------------------召唤婚礼淘气鬼
function ItemUse_FLOWER ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1037
	local Refresh = 7300					--重生时间，秒单位
	local life = 7200000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end


---------------------------气球游戏券
function ItemUse_QQ ( role , Item  )
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end

	local el = 0
	el =IsChaInRegion( role, 2 )
	if el == 1 then
		SystemNotice( role , "Unable to summon monster in Safe Zone" )
		UseItemFailed ( role )
		return
	end
	local x, y = GetChaPos(role)
	local MonsterID = 1036
	local Refresh = 60					--重生时间，秒单位
	local life = 7200000					--生命时间，毫秒单位
	local new = CreateChaX( MonsterID , x , y , 145 , Refresh, role )
	SetChaLifeTime( new, life )
end
--伊式教堂参观门票
function Jz_Script_yszs (role, Item )
	
	local Now_Week = os.date("%w")
	local Now_WeekNum = tonumber(Now_Week)
	local Now_Time = os.date("%H")
	local Now_TimeNum = tonumber(Now_Time)
	local Now_Miniute= os.date("%M")	
	local Now_Miniute= tonumber(Now_Miniute)
	local CheckDateNum = Now_WeekNum * 10000 + Now_TimeNum * 100+Now_Miniute

	if CheckDateNum < 11700  then
		SystemNotice ( role , "不要着急哦，教堂还没开门，请在每星期一晚上17点到17点10分之间使用哦" )
		UseItemFailed ( role )
		return
	end
	
	if CheckDateNum > 11710 then
		SystemNotice ( role , "Church is now closed, please wait until next Monday night" )
		UseItemFailed ( role )
		return
	end

	local i = CheckBagItem(role,3024)
	local k = ChaIsBoat(role)
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Visiting the church is a tiring process, please keep your hp and sp at 100%")
		UseItemFailed ( role )
		return
	end 
	if k == 0 then
		if i > 0 then
			local j = DelBagItem(role,3024,1)
			if j == 1 then
				MoveCity(role,"Church")
				return
			end
		end
	else
		UseItemFailed ( role )
	end
		
end
-----------------------------红包：红包只有在（每周六\日晚18:00--22：10）打开才会有效

function ItemUse_RedBox( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"打开红包最少需要1个空位")
		UseItemFailed ( role )
		return
	end
	local now_week= os.date("%w")		-------------星期几（十进制） 
	local now_hour= os.date("%H")		-------------时 
	local now_miniute= os.date("%M")	-------------分
	now_week= tonumber(now_week)
	now_hour= tonumber(now_hour)		
	now_miniute= tonumber(now_miniute)
	local CheckDateNum = now_hour*100 +now_miniute
	local flag=0
      if now_week==6 or now_week==0 then
		flag=1
      end
	if 1800<=CheckDateNum and  CheckDateNum<=2210 and flag==1 then
		ItemUse_hongbaoBOX ( role , Item )
	else 
		SystemNotice(role ,"It is not time yet. Do not try to cheat!")
		UseItemFailed ( role )
		return
	end
end

function ItemUse_hongbaoBOX ( role , Item )
	local ChaName = GetChaDefaultName ( role )

	local el = math.random ( 1, 1000 )
	if  el>=1 and el<=5 then
		GiveItem ( role , 0 , 1012  , 1 , 4 ) -------------加纳之神        0.5
			local message ="恭喜玩家" ..ChaName.."人品爆发,打开红包获得 加纳之神" 
			Notice ( message )
	elseif el>=6 and el<=10 then
		GiveItem ( role , 0 , 1016  , 1 , 4 ) ---------------女神小包       0.5
			local message1 ="恭喜玩家" ..ChaName.."人品爆发,打开红包获得 女神小包" 
			Notice ( message1 )
	elseif el>=11 and el<=20 then
		GiveItem ( role , 0 , 0860  , 1 , 4 ) ---------------风灵         1
			local message2 ="恭喜玩家" ..ChaName.."人品爆发,打开红包获得 风灵石" 
			Notice ( message2 )
	elseif el>=21 and el<=30 then
		GiveItem ( role , 0 , 0861  , 1 , 4 ) ----------------鹰眼石     1
			local message3 ="恭喜玩家" ..ChaName.."人品爆发,打开红包获得 鹰眼石" 
			Notice ( message3 )
	elseif el>=31 and el<40 then
		GiveItem ( role , 0 , 0862  , 1 , 4 ) ----------------岩玉       1
			local message4 ="恭喜玩家" ..ChaName.."人品爆发,打开红包获得 岩玉" 
			Notice ( message4 )
	elseif el>=41 and el<=50 then
		GiveItem ( role , 0 , 0863  , 1 , 4 )-----------------炎玉       1
			local message5 ="恭喜玩家" ..ChaName.."人品爆发,打开红包获得 炎玉" 
			Notice ( message5 )
	elseif el>=51 and el<=270 then
		GiveItem ( role , 0 , 855  , 99 , 4 )-----------------精灵硬币       22
	elseif el>=271 and el<=500 then
		GiveItem ( role , 0 , 0227  , 5 , 4 )-----------------守护精灵饲料    23
	elseif el>=501 and el<=750 then
		GiveItem ( role , 0 , 3096  , 3 , 4 )-----------------财富增幅器3个   25
	elseif el>=751 and el<=1000 then
		GiveItem ( role , 0 , 3094  , 3 , 4 )-----------------努力增幅器3个   25
	end
end
------------------------------------------------可疑藏宝图(kokora)---------------------------------
function ItemUse_KYCBT (role, Item)
	local	sc = math.random ( 1,100 )
	if  sc <=50 then
	local cha_name = GetChaDefaultName ( role ) 
	local message1= cha_name.."人品爆发,根据洛克藏宝图探索到 船长之首" 
		Notice ( message1 )
	else 
	local cha_name = GetChaDefaultName ( role ) 
	local message2 = cha_name.."人品爆发,根据洛克藏宝图探索到 元帅之首" 
		Notice ( message2 )
	end
end
-----------------------------------------------------------kokora---------------------------------------------------------
------------------------------------------------兑换神泣宝箱(kokora)---------------------------------
function ItemUse_goddessBOX (role, Item)
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用神泣宝箱" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"打开神泣宝箱至少需要1个空位")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random ( 1, 43 )
	local ItemId = 0
	
	if sc <=14 then	
		local GoodItem = {}
		GoodItem[0] = 0111                                       -------------降魔杵          获得机率14%
		GoodItem[1] = 0150                                       -------------鱼肠             获得机率14%
	
		local Good_C = math.random ( 1, 2 )-1
		ItemId = GoodItem[Good_C]
	elseif sc <=26 then		
		local GoodItem = {}
		GoodItem[0] = 0109                                       -------------如意宝杖       获得机率12%
		GoodItem[1] = 0115                                       -------------裂岩             获得机率12%
		GoodItem[2] = 0117                                       -------------飞虹             获得机率12%
		GoodItem[3] = 0119                                       -------------流星火珠       获得机率12%
	
		local Good_C = math.random ( 1, 4 )-1
		ItemId = GoodItem[Good_C]
	elseif sc <=36 then
		ItemId = 0113                                       -------------龙泉          获得机率10%
	else  local GoodItem = {}
		GoodItem[0] = 0861                                       -------------鹰眼石          获得机率7%
		GoodItem[1] = 0860                                       -------------风灵石          获得机率7%
	
		local Good_C = math.random ( 1, 2 )-1
		ItemId = GoodItem[Good_C]
	end
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	GiveItem ( role , 0 , ItemId , 1 , 94 )
	local message = "恭喜玩家" ..cha_name.."打开神泣宝箱,惊喜的获得"..itemname  
	Notice ( message )
end
-----------------------------------------------------------kokora---------------------------------------------------------

------------------------------------------------兑换霸王宝箱(kokora)---------------------------------
function ItemUse_overlordBOX (role, Item)
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用霸王宝箱" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"打开霸王宝箱至少需要1个空位")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random ( 1, 43 )
	local ItemId = 0
	
	if  sc <=14 then	
		local GoodItem = {}
		GoodItem[0] = 0112                                       -------------试炼之杵          获得机率14%
		GoodItem[1] = 0151                                       -------------断魂                获得机率14%
	
		local Good_C = math.random ( 1, 2 )-1
		ItemId = GoodItem[Good_C]
	elseif sc <=26 then		
		local GoodItem = {}
		GoodItem[0] = 0110                                       -------------补天之杖       获得机率12%
		GoodItem[1] = 0116                                       -------------巨阙             获得机率12%
		GoodItem[2] = 0118                                       -------------落日             获得机率12%
		GoodItem[3] = 0120                                       -------------霹雳神雷       获得机率12%
	
		local Good_C = math.random ( 1, 4 )-1
		ItemId = GoodItem[Good_C]
	elseif sc <=36 then
		ItemId = 0114                                       -------------游龙          获得机率10%
	else local GoodItem = {}
		GoodItem[0] = 0863                                       -------------炎玉          获得机率7%
		GoodItem[1] = 0862                                       -------------岩玉          获得机率7%
	
		local Good_C = math.random ( 1, 2 )-1
		ItemId = GoodItem[Good_C]
	end
	local itemname = GetItemName ( ItemId ) 
	local cha_name = GetChaDefaultName ( role ) 
	GiveItem ( role , 0 , ItemId , 1 , 94 )
	local message = "恭喜玩家" ..cha_name.."打开霸王宝箱,惊喜的获得"..itemname  
	Notice ( message )
end
-----------------------------------------------------------kokora---------------------------------------------------------
function ItemUse_XiDianBook ( role , item )
	local zsskill_lv  = {} 							----取角色转生技能等级
	 zsskill_lv [0] = GetSkillLv ( role, 453 )
	 zsskill_lv [1] = GetSkillLv ( role, 454 )
	 zsskill_lv [2] = GetSkillLv ( role, 455 )
	 zsskill_lv [3] = GetSkillLv ( role, 456 )
	 zsskill_lv [4] = GetSkillLv ( role, 457 )
	 zsskill_lv [5] = GetSkillLv ( role, 458 )
	local n = 0
	local item_canget = GetChaFreeBagGridNum ( role )
	if item_canget < 2 then
		SystemNotice(role ,"背包里至少需要有2个空位")
		UseItemFailed ( role )
	else
		for i = 0, 5, 1 do
			if zsskill_lv [i] >= 1 then
				n = n+1
			end
		end
		local cha_skill_num=GetChaAttr(role, ATTR_TP  )				----取角色当前剩余战斗技能点
		local clear_skill_num=ClearFightSkill(role)				----取清除技能点
		cha_skill_num=cha_skill_num+clear_skill_num
		if n > 0 then							----有转生技能
			local job = GetChaAttr( role, ATTR_JOB)				----取职业
			local item_id = {}
			item_id [8] = 2957
			item_id [9] = 2956
			item_id [12] = 2961
			item_id [13] = 2959
			item_id [14] = 2958
			item_id [16] = 2960
			GiveItem ( role, 0, item_id [job] , 1, 4)
			GiveItem ( role, 0, 1572, 1, 4)
			cha_skill_num = cha_skill_num - 2
		end
		SetChaAttr(role, ATTR_TP ,cha_skill_num ) 
	end
end

function Sk_Script_ZSSL( role , item )
	local sk_add = SK_ZSSL 
	local form_sklv = GetSkillLv( role , sk_add ) 
	  
--	if form_sklv < 0 or form_sklv == nil then								--技能等级合法性检查
--		return 
--	end 
	if form_sklv >= 1  then 
		UseItemFailed ( role )  
		return 
	end 
	local zs_exp = GetChaAttr ( role , ATTR_CSAILEXP )
	if zs_exp <= 0 then
		UseItemFailed ( role )  
		return 
	end
	a = AddChaSkill ( role , sk_add, 1 , 1 , 0 ) 
	if a== 0 then 
		UseItemFailed ( role )  
		return 
	end 
end 

------------------------精灵硬币宝箱
function ItemUse_YingbiBox ( role , Item )
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "darkblue" then
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv >= 10 then
			local Item_CanGet = GetChaFreeBagGridNum ( role )
			if Item_CanGet < 4 then
				SystemNotice(role ,"开启精灵硬币宝箱至少需要4个格子")
				UseItemFailed ( role )
				return
			end
			local ChaName = GetChaDefaultName(role)
			if PlayUseBox1[ChaName] == nil then
				PlayUseBox1[ChaName] = 0
			end
			local Use_Num = PlayUseBox1[ChaName]
			local now_day= os.date("%d")		-------------日   
			local now_month= os.date("%m")		-------------月
			now_month= tonumber(now_month)		-------------月     
			now_day = tonumber(now_day)		-------------日
			local Date = JNSTime_Flag[now_month]+now_day
			local Yingbi_Num = 0
			if Use_Num == 0 then
				local Time = 1
				Use_Num = Date * 10 + Time
				Yingbi_Num = 20
				local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
					if j == 1 then 
						PlayUseBox1[ChaName] = Use_Num
						GiveBragiItem ( role , 1 )
						GiveItem ( role , 0 , 1872 , 1 , 4 )
					else
						UseItemFailed ( role )
						SystemNotice( role, "精灵硬币不足")
					end
			else
				local Date_Box = math.floor ( Use_Num / 10 )
				local a = Date - Date_Box
				local Time = Use_Num - Date_Box * 10
				--SystemNotice ( role , "a="..a)
				if a == 0 then
					Use_Num = Use_Num +1
					local time_new = Time + 1
					if time_new >= 1 and time_new <= 3 then
						Yingbi_Num = (time_new*5) + 15
						--SystemNotice ( role  , "Round"..time_new.."次开箱子，花费"..Yingbi_Num.."个硬币，品质为1")
						local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
						if j == 1 then
							GiveBragiItem ( role , 1 )
							PlayUseBox1[ChaName] = Use_Num
							GiveItem ( role , 0 , 1872 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵硬币不足")
						end
					elseif time_new >= 4 and time_new <= 6 then
						Yingbi_Num = Time * 15
						--SystemNotice ( role  , "Round"..time_new.."次开箱子，花费"..Yingbi_Num.."个硬币，品质为2")
						local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
						if j == 1 then
							GiveBragiItem ( role , 2 )
							PlayUseBox1[ChaName] = Use_Num
							GiveItem ( role , 0 , 1872 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵硬币不足")
						end
					else
						Yingbi_Num = 99
						--SystemNotice ( role  , "Round"..time_new.."次开箱子，花费"..Yingbi_Num.."个硬币，品质为3")
						local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
						if j == 1 then
							GiveBragiItem ( role , 3 )
							PlayUseBox1[ChaName] = Use_Num
							GiveItem ( role , 0 , 1872 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵硬币不足")
						end
					end
				elseif a == -1 then
					UseItemFailed ( role )
					SystemNotice ( role , "你今天已经开过10个精灵硬币宝箱了")
				else
					local Time = 1
					Use_Num = Date * 10 + Time
					Yingbi_Num = 20
					--SystemNotice ( role  , "Round"..Time.."开箱子，花费"..Yingbi_Num.."个硬币")
					local j = TakeItem ( role , 0 , 855 , Yingbi_Num )
					if j == 1 then
						PlayUseBox1[ChaName] = Use_Num
						GiveBragiItem ( role )
						GiveItem ( role , 0 , 1872 , 1 , 4 )
					else
						UseItemFailed ( role )
						SystemNotice( role, "精灵硬币不足")
					end
				end
			end
		else
			SystemNotice( role , "等级不到10，无法使用该道具")
			UseItemFailed ( role )
		end
	else
		SystemNotice( role , "该道具只能在深蓝群岛地图使用")
		UseItemFailed ( role )
	end
end

------------------------------------精灵辉印宝箱
function ItemUse_HuiYinBox ( role, Item )
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "darkblue" then
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv >= 60 then
			local Item_CanGet = GetChaFreeBagGridNum ( role )
			if Item_CanGet < 2 then
				SystemNotice(role ,"开启精灵辉印宝箱至少需要2个格子")
				UseItemFailed ( role )
				return
			end
			local ChaName = GetChaDefaultName(role)
			if PlayUseBox2[ChaName] == nil then
				PlayUseBox2[ChaName] = 0
			end
			local Use_Num = PlayUseBox2[ChaName]
			local now_day= os.date("%d")		-------------日   
			local now_month= os.date("%m")		-------------月
			now_month= tonumber(now_month)		-------------月     
			now_day = tonumber(now_day)		-------------日
			local Date = JNSTime_Flag[now_month]+now_day
			if Use_Num == 0 then
				local Time = 1
				Use_Num = Date * 10 + Time
				local j = TakeItem ( role , 0 , 2588 , 10 )
				if j == 1 then 
					PlayUseBox2[ChaName] = Use_Num
					GiveItem ( role , 0 , 3107 , 1 , 4 )
					GiveItem ( role , 0 , 1570 , 1 , 4 )
				else
					UseItemFailed ( role )
					SystemNotice( role, "精灵辉印不足")
				end
			else
				local Date_Box = math.floor ( Use_Num / 10 )
				local a = Date - Date_Box
				local Time = Use_Num - Date_Box * 10
				if a == 0 then
					local time_new = Time + 1
					if time_new == 1 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2588 , 10 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							GiveItem ( role , 0 , 3107 , 1 , 4 )
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵辉印不足")
						end
					elseif time_new == 2 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2588 , 20 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							AddExpAll ( role , 1 , 1, 2)
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵辉印不足")
						end
					elseif time_new == 3 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2588 , 30 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							GiveItem ( role , 0 , 850 , 1 , 4 )
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵辉印不足")
						end
					elseif time_new == 4 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2588 , 40 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							GiveItem ( role , 0 , 852 , 1 , 4 )
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵辉印不足")
						end
					elseif time_new == 5 then
						Use_Num = ( Date + 1 )*10
						local j = TakeItem ( role , 0 , 2588 , 50 )
						if j == 1 then 
							PlayUseBox2[ChaName] = Use_Num
							GiveItem ( role , 0 , 851 , 1 , 4 )
							GiveItem ( role , 0 , 1570 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵辉印不足")
						end
					end
				elseif a == -1 then
					UseItemFailed ( role )
					SystemNotice ( role , "你今天已经开过5个精灵辉印宝箱了")
				else
					local Time = 1
					Use_Num = Date * 10 + Time
					local j = TakeItem ( role , 0 , 2588 , 10 )
					if j == 1 then
						PlayUseBox2[ChaName] = Use_Num
						GiveItem ( role , 0 , 3107 , 1 , 4 )
						GiveItem ( role , 0 , 1570 , 1 , 4 )
					else
						UseItemFailed ( role )
						SystemNotice( role, "精灵辉印不足")
					end
				end
			end
		else
			SystemNotice( role , "等级不到60，无法使用该道具")
			UseItemFailed ( role )
		end
	else
		SystemNotice( role , "该道具只能在深蓝群岛地图使用")
		UseItemFailed ( role )
	end
end

-----------------------------精灵王辉印宝箱
function ItemUse_HuiYinKBox ( role, Item )
	local map_name_role = GetChaMapName ( role )
	if map_name_role == "darkblue" then
		local lv = GetChaAttr ( role , ATTR_LV )
		if lv >= 70 then
			local Item_CanGet = GetChaFreeBagGridNum ( role )
			if Item_CanGet < 2 then
				SystemNotice(role ,"开启精灵辉印王宝箱至少需要2个格子")
				UseItemFailed ( role )
				return
			end
			local ChaName = GetChaDefaultName(role)
			if PlayUseBox3[ChaName] == nil then
				PlayUseBox3[ChaName] = 0
			end
			local Use_Num = PlayUseBox3[ChaName]
			local now_day= os.date("%d")		-------------日   
			local now_month= os.date("%m")		-------------月
			now_month= tonumber(now_month)		-------------月     
			now_day = tonumber(now_day)		-------------日
			local Date = JNSTime_Flag[now_month]+now_day
			if Use_Num == 0 then
				local Time = 1
				Use_Num = Date * 10 + Time
				local j = TakeItem ( role , 0 , 2589 , 1 )
				if j == 1 then 
					PlayUseBox3[ChaName] = Use_Num
					AddExpAll ( role , 3 , 3, 2 )
					GiveItem ( role , 0 , 1571 , 1 , 4 )
				else
					UseItemFailed ( role )
					SystemNotice( role, "精灵王辉印不足")
				end
			else
				local Date_Box = math.floor ( Use_Num / 10 )
				local a = Date - Date_Box
				local Time = Use_Num - Date_Box * 10
				if a == 0 then
					local time_new = Time + 1
					if time_new == 1 then
						Use_Num = Use_Num + 1
						local j = TakeItem ( role , 0 , 2589 , 1 )
						if j == 1 then 
							PlayUseBox3[ChaName] = Use_Num
							AddExpAll ( role , 3 , 3, 2 )
							GiveItem ( role , 0 , 1571 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵王辉印不足")
						end
					elseif time_new == 2 then
						Use_Num = ( Date + 1 ) * 10
						local j = TakeItem ( role ,  0 , 2589 , 2 )
						if j == 1 then 
							PlayUseBox3[ChaName] = Use_Num
							GiveItem ( role , 0 , 3336 , 1 , 4 )
							GiveItem ( role , 0 , 1571 , 1 , 4 )
						else
							UseItemFailed ( role )
							SystemNotice( role, "精灵王辉印不足")
						end
					end
				elseif a == -1 then
					UseItemFailed ( role )
					SystemNotice ( role , "你今天已经开过2个精灵王辉印宝箱了")
				else
					local Time = 1
					Use_Num = Date * 10 + Time
					local j = TakeItem ( role , 0 , 2588 , 10 )
					if j == 1 then
						PlayUseBox3[ChaName] = Use_Num
						AddExpAll ( role , 3, 3, 2 )
						GiveItem ( role , 0 , 1571 , 1 , 4 )
					else
						UseItemFailed ( role )
						SystemNotice( role, "精灵王辉印不足")
					end
				end
			end
		else
			SystemNotice( role , "等级不到70，无法使用该道具")
			UseItemFailed ( role )
		end
	else
		SystemNotice( role , "该道具只能在深蓝群岛地图使用")
		UseItemFailed ( role )
	end
end


------------------------黑匣子
function ItemUse_BACKBOX ( role , Item )
	local Cha_Boat = 0
	local charLv=Lv ( role )
	local Exp_star=GetChaAttr (  role , ATTR_CEXP )----------当前等级经验
	local dif_exp_thalf = (DEXP[charLv+1] - DEXP[charLv])*0.15  +  Exp_star + 10
	local dif_exp_thalf_a = (DEXP[charLv+1] - DEXP[charLv])*0.12  +  Exp_star + 10
	local dif_exp_thalf_b = (DEXP[charLv+1] - DEXP[charLv])*0.08  +  Exp_star + 10
	local dif_exp_thalf_c = (DEXP[charLv+1] - DEXP[charLv])*0.05+Exp_star+ 10

	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	if charLv>=100 then
		SystemNotice( role , "100级及100级以上角色不能使用" )
		UseItemFailed ( role )
		return
	end
	local el = math.random ( 1, 100 )
	if  el>=1 and el<=40 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_c )
	elseif el>=41 and el<=70 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_b )
	elseif el>=71 and el<=90 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf_a )
	elseif el>=91 and el<=100 then
		SetChaAttrI( role , ATTR_CEXP , dif_exp_thalf )
        end
end
----------------经验瓶礼包
function ItemUse_jyplb( role , item )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"至少需要一个背包空格")
		UseItemFailed ( role )
		return
	end
	local r1 = 0
	local r2 = 0
	r1,r2 =MakeItem ( role , 171  , 1 , 4 )
	local Item = GetChaItem ( role , 2 , r2 )
	SetItemAttr(Item, ITEMATTR_VAL_PARAM1, 0 )		-------------秒  
	SynChaKitbag(role,13)
end

---------------------------幻之证明（kokora）浩方版本专用
function ItemUse_fancyprove ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用幻之证明" )
		UseItemFailed ( role )
		return
	end
	 local cha_name = GetChaDefaultName ( role )
	 local lv = GetChaAttr ( role , ATTR_LV )
	 if lv>=20 and lv<=54 then
		SetChaAttrI(role, ATTR_CEXP , 19674240)		
	 local message = "恭喜玩家" ..cha_name.."使用幻之证明后,等级由"..lv .."级升到55级!该幻之证明,海盗王商城内免费提供喔!" 
		Notice ( message )
	 else 
		SystemNotice( role , "幻之证明需使用等级在20级至54级之间,您的等级不符合使用幻之证明的要求" )
		UseItemFailed ( role )
	end
	return
end

---------------------------超人宝箱（kokora）浩方版本专用
function ItemUse_superBOX ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用超人宝箱" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	if Item_CanGet < 1 then
		SystemNotice(role ,"此")
		UseItemFailed ( role )
		return
	end
	local cha_name = GetChaDefaultName ( role ) 
	local lv = GetChaAttr ( role , ATTR_LV )	
	if lv>=70 then
	GiveItem ( role , 0 , 996 , 1 , 4 )
	local message = "恭喜玩家" ..cha_name.."打开超人宝箱,惊喜的获得超人证明,该超人宝箱,海盗王商城内免费提供喔!"
	Notice ( message )
	 else 
		SystemNotice( role , "超人宝箱需使用等级在70级以上,您的等级不符合使用超人宝箱的要求" )
		UseItemFailed ( role )
	end
	return
end

---------------------------超人证明（kokora）浩方版本专用
function ItemUse_superprove ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用超人证明" )
		UseItemFailed ( role )
		return
	end
	 local cha_name = GetChaDefaultName ( role ) 
	 local lv = GetChaAttr ( role , ATTR_LV )	
	 if lv>=55 and lv<=59 then
		SetChaAttrI(role, ATTR_CEXP , 37746418)
	 local message = "恭喜玩家" ..cha_name.."使用超人证明后,等级由"..lv .."级升到60级!该超人证明,海盗王商城内免费提供喔!" 
		Notice ( message )
	 else 
		SystemNotice( role , "超人证明需使用等级在55级至59级之间,您的等级不符合使用超人证明的要求" )
		UseItemFailed ( role )
	end
	return
end

---------------------------谜之证明（kokora）浩方版本专用
function ItemUse_riddleprove ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用谜之证明" )
		UseItemFailed ( role )
		return
	end
	local i= CheckBagItem( role, 3849 )                                                
	if i~=1 then
		SystemNotice(  role , "Please confirm you have Medal of Valor with you")
		UseItemFailed ( role )
		return LUA_FALSE
	end

	local credit = GetChaItem2 ( role , 2 , 3849 )
	local creditprove = GetItemAttr (credit , ITEMATTR_VAL_STR)
	if creditprove < 100 then
		SystemNotice ( role , "您的荣誉值未达到100点,不满足使用谜之证明的条件!" )
		UseItemFailed ( role )
		return LUA_FALSE
	end

	local meleeprove = GetItemAttr (credit , ITEMATTR_MAXENERGY)	
	if meleeprove < 11 then
		SystemNotice ( role , "您的乱斗点数未达到11点,不满足使用谜之证明的条件!" )
		UseItemFailed ( role )
		return LUA_FALSE
	end
															
	 local cha_name = GetChaDefaultName ( role ) 
	 local lv = GetChaAttr ( role , ATTR_LV )	
	 if lv>=60 and lv<=64 then
		SetChaAttrI(role, ATTR_CEXP , 116688304)
	 local message = "恭喜玩家" ..cha_name.."使用谜之证明后,等级由"..lv .."级升到65级!该谜之证明,海盗王商城内免费提供喔!" 
		Notice ( message )
	 else 
		SystemNotice( role , "谜之证明需使用等级在60级至64级之间,您的等级不符合使用谜之证明的要求" )
		UseItemFailed ( role )
	end
	return 
end

---------------------------谜之助推器（kokora）浩方版本专用
function ItemUse_riddleroll ( role , Item )
	local lv= GetChaAttr(role, ATTR_LV) 
	if lv < 65 or lv > 75  then
		SystemNotice ( role , "不能使用谜之助推器！" )
		UseItemFailed ( role )
		return	
	end

	local statelv = 5
	local ChaStateLv = GetChaStateLv ( role , STATE_SBJYGZ )
	
	if ChaStateLv > statelv then
		SystemNotice ( role , "已使用更高等级的同类物品，请稍候再用" )
		UseItemFailed ( role )
		return
	end
	local statetime = 1800
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ==  nil then
		AddState( role , role , STATE_SBJYGZ , statelv , statetime )
	else
		AddState( Cha_Boat , Cha_Boat , STATE_SBJYGZ , statelv , statetime )
	end
	SystemNotice ( role ,"感受到谜之助推器的效果,半小时内,打怪经验成10倍增长喔!" )
end

------------------------------------------------兑换百慕大宝箱(kokora)---------------------------------
function ItemUse_baimodabox (role, Item)
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用百慕大宝箱" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )	
	 if Item_CanGet < 1 then
		SystemNotice(role ,"打开百慕大宝箱至少需要1个空位")
		UseItemFailed ( role )
		return
	end
	local	sc = math.random ( 1, 100 )
	
	if  sc <=25 then	
		GiveItem ( role , 0 , 1036 , 50 , 4 )                    ---------------魔幻女神卡   获得机率25%
	elseif sc <=50 then		
		GiveItem ( role , 0 , 0578 , 99 , 4 )                    ---------------加速成长果   获得机率25%
	elseif sc <=75 then
		GiveItem ( role , 0 , 0850 , 99 , 4 )                    ---------------轻装药水   获得机率25%
	else   
		GiveItem ( role , 0 , 0852 , 99 , 4 )                    ---------------全身装甲   获得机率25%
	end
end

------------------------------------------------寂寞深处召唤券(kokora)---------------------------------
function ItemUse_monsterbec (role, Item)
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local sc = 0
	sc =IsChaInRegion( role, 2 )
	if sc == 1 then
		SystemNotice( role , "角色当前处于安全区不可以使用召唤券" )
		UseItemFailed ( role )
		return
	end

	local Monsterattr = {533,509,531,534,550,557,553,559,50,50}
	local	sc = math.random(1,10)
	local x, y = GetChaPos( role )
	local Refresh = 3700				--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( Monsterattr[sc] , x , y , 145 ,  Refresh, role )
	SetChaLifeTime( new, life )
end

------------------------------------------------废灵召唤券(kokora)---------------------------------
function ItemUse_bierbec (role, Item)
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local sc = 0
	sc =IsChaInRegion( role, 2 )
	if sc == 1 then
		SystemNotice( role , "角色当前处于安全区不可以使用召唤券" )
		UseItemFailed ( role )
		return
	end
	local Monsterattr = {687,686}
	local	sc = math.random(1,2)
	local x, y = GetChaPos( role )
	local Refresh = 3700				--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( Monsterattr[sc] , x , y , 145 ,  Refresh, role )
	SetChaLifeTime( new, life )
end

------------------------------------------------寂寞召唤券(kokora)---------------------------------
function ItemUse_loneybec (role, Item)
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "Cannot use while sailing" )
		UseItemFailed ( role )
		return
	end
	local sc = 0
	sc =IsChaInRegion( role, 2 )
	if sc == 1 then
		SystemNotice( role , "角色当前处于安全区不可以使用召唤券" )
		UseItemFailed ( role )
		return
	end

	local Monsterattr = {523,524,525,36,526,527,529,35,532,532}
	local	sc = math.random(1,10)
	local x, y = GetChaPos( role )
	local Refresh = 3700				--重生时间，秒单位
	local life = 3600000					--生命时间，毫秒单位
	local new = CreateChaX( Monsterattr[sc] , x , y , 145 ,  Refresh, role )
	SetChaLifeTime( new, life )
end

------------------------------------------------------圣诞情人烟花
function ItemUse_XmasQRYH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"道具使用失败，背包内至少要有一个空格")
		UseItemFailed ( role )
		return
	end
	if NowMonthNum == 12 and NowDayNum >= 25 and NowDayNum <= 31 then
		local el = math.random ( 1 , 5 )
		local Item_ID = 0
		if el == 1 then
			Item_ID = 3354
		elseif el == 2 then
			Item_ID = 3355
		elseif el == 3 then
			Item_ID = 3356
		elseif el == 4 then
			Item_ID = 3077
		else
			Item_ID = 3343
		end
		GiveItem ( role , 0 , Item_ID , 1 , 4 )
	else
		SystemNotice( role , "本道具只能在圣诞节期间使用哦")
		UseItemFailed ( role )
		return
	end
end

---------------------------------------------------------圣诞狂欢烟花
function ItemUse_XmasKHYH ( role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"道具使用失败，背包内至少要有一个空格")
		UseItemFailed ( role )
		return
	end
	if NowMonthNum == 12 and NowDayNum >= 25 and NowDayNum <= 31 then
		local el = math.random ( 1 , 10000 )
		local Item_ID = 0
		if el >= 1 and el <= 3000 then
			Item_ID = 2999
		elseif el >3000 and el <= 5000 then
			Item_ID = 1870
		elseif el > 5000 and el <= 7000 then
			Item_ID = 0145
		elseif el > 7000 and el <= 9000 then
			Item_ID = 1019
		elseif el == 9001 then
			Item_ID = 3000
		else
			Item_ID = 1036
		end
		GiveItem ( role , 0 , Item_ID , 1 , 4 )
	else
		SystemNotice( role , "本道具只能在圣诞节期间使用哦")
		UseItemFailed ( role )
		return
	end
end

------------------------------------------圣诞老人表情烟花
function ItemUse_SDLRYH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"道具使用失败，背包内至少要有一个空格")
		UseItemFailed ( role )
		return
	end
	if NowMonthNum == 12 and NowDayNum >= 17 and NowDayNum <= 31 then
	local cha_name = GetChaDefaultName ( role ) 
		local el = math.random ( 1 , 1000 )
		local Item_ID = 0
		local Item_Num = 0
		if el >= 1 and el <= 500 then
			Item_ID = 227
			Item_Num = 5
		elseif el == 501 then
			Item_ID = 1014
			Item_Num = 1
		else
			Item_ID = 3834
			Item_Num = 5
		end
		GiveItem ( role , 0 , Item_ID , Item_Num , 4 )
		Notice ( cha_name.."祝愿全服玩家圣诞快乐!")
	else
		SystemNotice( role , "本道具只能在圣诞节期间使用哦")
		UseItemFailed ( role )
		return
	end
end

-------------------------------------merry christmas烟花
function ItemUse_MCYH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"道具使用失败，背包内至少要有一个空格")
		UseItemFailed ( role )
		return
	end
	if NowMonthNum == 12 and NowDayNum >= 17 and NowDayNum <= 31 then
	local cha_name = GetChaDefaultName ( role ) 
		local el = math.random ( 1 , 100 )
		local Item_ID = 0
		local Item_Num = 0
		if el >= 1 and el <= 40 then
			Item_ID = 849
			Item_Num = 5
		elseif el > 40 and el <= 65 then
			Item_ID = 3097
			Item_Num = 2
		elseif el > 65 and el <= 90 then
			Item_ID = 3096
			Item_Num = 4
		else
			Item_ID = 3909
			Item_Num = 1
		end
		GiveItem ( role , 0 , Item_ID , Item_Num , 4 )
		Notice ( cha_name.."祝愿全服玩家Merry Christmas!")
	else
		SystemNotice( role , "本道具只能在圣诞节期间使用哦")
		UseItemFailed ( role )
		return
	end
end

-----------------------------------------------Happy NewYear烟花
function ItemUse_HNYH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"道具使用失败，背包内至少要有一个空格")
		UseItemFailed ( role )
		return
	end
	if NowMonthNum == 12 and NowDayNum >= 17 and NowDayNum <= 31 then
	local cha_name = GetChaDefaultName ( role ) 
		local el = math.random ( 1 , 100 )
		local Item_ID = 0
		local Item_Num = 0
		if el >= 1 and el <= 40 then
			Item_ID = 849
			Item_Num = 5
		elseif el > 40 and el <= 65 then
			Item_ID = 3097
			Item_Num = 2
		elseif el > 65 and el <= 90 then
			Item_ID = 3096
			Item_Num = 4
		else
			Item_ID = 3909
			Item_Num = 1
		end
		GiveItem ( role , 0 , Item_ID , Item_Num , 4 )
		Notice ( cha_name.."祝愿全服玩家Happy NewYear!")
	else
		SystemNotice( role , "本道具只能在圣诞节期间使用哦")
		UseItemFailed ( role )
		return
	end
end

--------------------------------------------------雪人表情烟花
function ItemUse_XRBQYH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"道具使用失败，背包内至少要有一个空格")
		UseItemFailed ( role )
		return
	end
	if NowMonthNum == 12 and NowDayNum >= 17 and NowDayNum <= 31 then
		local el = math.random ( 1 , 100 )
		local Item_ID = 0
		local Item_Num = 0
		if el >= 1 and el <= 50 then
			Item_ID = 3098
			Item_Num = 25
		elseif el == 51 then
			Item_ID = 333
			Item_Num = 1
		elseif el > 51 and el <= 81 then
			Item_ID = 227
			Item_Num = 15
		elseif el > 81 and el <= 91 then
			Item_ID = 3105
			Item_Num = 10
		else
			Item_ID = 3342
			Item_Num = 10
		end
		GiveItem ( role , 0 , Item_ID , Item_Num , 4 )
	else
		SystemNotice( role , "本道具只能在圣诞节期间使用哦")
		UseItemFailed ( role )
		return
	end
end

--------------------------------------------------麋鹿表情烟花
function ItemUse_MLBQYH ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"道具使用失败，背包内至少要有一个空格")
		UseItemFailed ( role )
		return
	end
	if NowMonthNum == 12 and NowDayNum >= 17 and NowDayNum <= 31 then
		local el = math.random ( 1 , 100 )
		local Item_ID = 0
		local Item_Num = 0
		if el >= 1 and el <= 61 then
			Item_ID = 885
			Item_Num = 1
		elseif el == 62 then
			Item_ID = 333
			Item_Num = 1
		elseif el >= 63 and el <= 64 then
			Item_ID = math.random ( 276 , 280 )
			Item_Num = 1
		elseif el > 64 and el <= 84 then
			Item_ID = 2312
			Item_Num = 15
		else
			Item_ID = 578
			Item_Num = 17
		end
		GiveItem ( role , 0 , Item_ID , Item_Num , 4 )
	else
		SystemNotice( role , "本道具只能在圣诞节期间使用哦")
		UseItemFailed ( role )
		return
	end
end

--------------------------------------------------圣诞老人的馈赠
function ItemUse_SDLRKZ ( role , Item )
	local Item_ID = {}
	local Item_Num = {}
	local Item_PZ = {}
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 3 then
		SystemNotice(role ,"道具使用失败，背包内至少要有三个空格")
		UseItemFailed ( role )
		return
	end
	local role_job = GetChaAttr ( role, ATTR_JOB)
	if role_job == 0 or role_job == 1 or role_job == 2 or role_job == 4 or role_job == 5 then
		SystemNotice( role , "只有2转职业的角色才可以使用本道具" )
		UseItemFailed ( role )
		return
	end
	local role_type = GetChaTypeID ( role )
	local a = math.random ( 1, 1000)
	if a >= 0 and a <= 300 then
		Item_ID[1] = 2872
		Item_Num[1] = 5
		Item_PZ[1] = 4
	elseif a >= 301 and a <= 600 then
		Item_ID[1] = 2873
		Item_Num [1]= 5
		Item_PZ[1] = 4
	elseif a >= 601 and a <= 650 then
		if role_type == 1 then
			Item_ID[1] = 5264
			Item_ID[2] = 5265
			Item_ID[3] = 5266
			Item_Num[1] = 1
			Item_Num[2] = 1
			Item_Num[3] = 1
			Item_PZ[1] = 4
			Item_PZ[2] = 4
			Item_PZ[3] = 4
		elseif role_type == 2 then
			Item_ID[1] = 5267
			Item_ID[2] = 5268
			Item_ID[3] = 5269
			Item_Num[1] = 1
			Item_Num[2] = 1
			Item_Num[3] = 1
			Item_PZ[1] = 4
			Item_PZ[2] = 4
			Item_PZ[3] = 4
		elseif role_type == 3 then
			Item_ID[1] = 5270
			Item_ID[2] = 5271
			Item_ID[3] = 5272
			Item_Num[1] = 1
			Item_Num[2] = 1
			Item_Num[3] = 1
			Item_PZ[1] = 4
			Item_PZ[2] = 4
			Item_PZ[3] = 4
		elseif role_type == 4 then
			Item_ID[1] = 5273
			Item_ID[2] = 5274
			Item_ID[3] = 5275
			Item_Num[1] = 1
			Item_Num[2] = 1
			Item_Num[3] = 1
			Item_PZ[1] = 4
			Item_PZ[2] = 4
			Item_PZ[3] = 4
		end
	elseif a >= 651 and a <= 700 then
		if role_job == 8 then
			Item_ID[1] = 1375
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 9 then
			Item_ID[1] = 1394
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 12 then
			Item_ID[1] = 42
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 13 then
			Item_ID[1] = 4198
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 14 then
			Item_ID[1] = 4204
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 16 then
			Item_ID[1] = 1421
			Item_Num[1] = 1
			Item_PZ[1] = 22
		end
	elseif a >= 701 and a <= 750 then
			Item_ID[1] = 2888
			Item_Num[1] = 3
			Item_PZ[1] = 4
	elseif a >= 751 and a <= 800 then
			Item_ID[1] = 2889
			Item_Num[1] = 3
			Item_PZ[1] = 4
	elseif a >= 801 and a <= 850 then
			Item_ID[1] = 2890
			Item_Num[1] = 3
			Item_PZ[1] = 4
	elseif a >= 851 and a <= 900 then
			Item_ID[1] = 2891
			Item_Num[1] = 3
			Item_PZ[1] = 4
	elseif a >= 901 and a <= 950 then
		if role_job == 8 then
			Item_ID[1] = 4148
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 9 then
			Item_ID[1] = 4150
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 12 then
			Item_ID[1] = 4152
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 13 then
			if role_type == 3 then
				Item_ID[1] = 4159
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4160
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		elseif role_job == 14 then
			if role_type == 4 then
				Item_ID[1] = 4164
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4163
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		elseif role_job == 16 then
			if role_type == 4 then
				Item_ID[1] = 4156
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4155
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		end
	elseif a >= 951 and a <= 975 then
		if role_job == 8 then
			Item_ID[1] = 653
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 9 then
			Item_ID[1] = 4182
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 12 then
			Item_ID[1] = 4184
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 13 then
			if role_type == 3 then
				Item_ID[1] = 4191
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4192
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		elseif role_job == 14 then
			if role_type == 4 then
				Item_ID[1] = 4196
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4195
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		elseif role_job == 16 then
			if role_type == 4 then
				Item_ID[1] = 4188
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4187
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		end
	else
		if role_job == 8 then
			Item_ID[1] = 477
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 9 then
			Item_ID[1] = 4166
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 12 then
			Item_ID[1] = 4168
			Item_Num[1] = 1
			Item_PZ[1] = 22
		elseif role_job == 13 then
			if role_type == 3 then
				Item_ID[1] = 4175
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4176
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		elseif role_job == 14 then
			if role_type == 4 then
				Item_ID[1] = 4180
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4179
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		elseif role_job == 16 then
			if role_type == 4 then
				Item_ID[1] = 4172
				Item_Num[1] = 1
				Item_PZ[1] = 22
			else
				Item_ID[1] = 4171
				Item_Num[1] = 1
				Item_PZ[1] = 22
			end
		end
	end
	for i = 1, 3, 1 do
		if Item_ID[i] ~= nil and Item_Num[i] ~= nil and Item_PZ[i] ~= nil then
			GiveItem ( role , 0 , Item_ID[i] , Item_Num[i] , Item_PZ[i] )
		end
	end
end

-------------------------------------圣诞礼包(小)
function ItemUse_XmasLB ( role, Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 1 then
		SystemNotice(role ,"道具使用失败，背包内至少要有一个空格")
		UseItemFailed ( role )
		return
	end
	local br = math.random( 1, 10)
	local Item_ID = 0
	local Item_Num = 0
	if br >= 1 and br <= 3 then
		Item_ID = 3343
		Item_Num = 10
	elseif br >= 4 and br <= 6 then
		Item_ID = 3344
		Item_Num = 10
	else
		Item_ID = 2883
		Item_Num = 5
	end
	GiveItem ( role , 0 , Item_ID , Item_Num , 4 )
end

--------------------------------------圣诞机票
function ItemUse_movexmas ( role , Item )
	local Cha_Boat = GetCtrlBoat ( role )
	if Cha_Boat ~=  nil then
		SystemNotice( role , "出海时不可使用" )
		UseItemFailed ( role )
		return
	end
	local hp = Hp(role)
	local mxhp = Mxhp(role)
	local sp = Sp(role)
	local mxsp = Mxsp(role)
	if sp < mxsp or hp < mxhp then 
		SystemNotice (role, "Teleportation is a tedious process. Please maintain full HP and SP")
		UseItemFailed ( role )
		return
	end 
	local Now_Day = os.date("%d")
	local Now_Month = os.date("%m")
	local NowDayNum = tonumber(Now_Day)
	local NowMonthNum = tonumber(Now_Month)
	if NowMonthNum == 12 and NowDayNum <= 31 then
		local j = DelBagItem(role,2883,1)
		if j == 1 then
			MoveCity(role,"圣诞村")
			return
		end
	else
		SystemNotice(role ,"圣诞节已经过了哦")
		UseItemFailed ( role )
		return
	end
end	
------------------------------------------------------------阿拉丁背包
function ItemUse_ALDXB ( role )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient space in inventory. Unable to open chest")
		UseItemFailed ( role )
		return
	end

	local cha_name = GetChaDefaultName ( role ) 
	local star=math.random ( 1, 20000 )
	--SystemNotice(role ,"star=="..star)
		if star<=3700 then
			GiveItem ( role , 0 , 2440  , 10 , 4  )
		elseif star>=3701 and star<=5700 then
			GiveItem ( role , 0 , 3885  , 1 , 4  )
		elseif star>=5701 and star<=7100 then
			GiveItem ( role , 0 , 3094  , 1 , 4  )
		elseif star>=7101 and star<=13100 then
			local el = math.random ( 1, 5 )
			if el==1  then
				GiveItem ( role , 0 , 2445  , 3 , 4 )
			elseif el==2	then
				GiveItem ( role , 0 , 3076  , 3 , 4 )
			elseif el==3	then
				GiveItem ( role , 0 , 0563  , 3 , 4 )
			elseif el==4	then	
				GiveItem ( role , 0 , 0583  , 3 , 4 )
			elseif el==5	then
				GiveItem ( role , 0 , 3050  , 3 , 4 )
			end
		elseif star>=13101 and star<=15100 then
			local el = math.random ( 1, 2 )
			if el==1  then
				GiveItem ( role , 0 , 0849  , 1 , 4 )
			elseif el==2  then
				GiveItem ( role , 0 , 0680  , 1 , 4 )
			end
		elseif star>=15101 and star<=19300 then
			local el1= math.random ( 1, 6 )
			if el1==1  then
				GiveItem ( role , 0 , 2438  , 5 , 4 )
			elseif el1==2 then
				GiveItem ( role , 0 , 2419  , 3 , 4 )
			elseif el1==3 then
				GiveItem ( role , 0 , 2386  , 4 , 4 )
			elseif el1==4 then
				GiveItem ( role , 0 , 0179  , 1 , 4 )
			elseif el1==5 then
				GiveItem ( role , 0 , 3084  , 1 , 4 )
			elseif el1==6 then
				GiveItem ( role , 0 , 3085  , 1 , 4 )
			end
		elseif star>=19301 and star<=19600 then
			local el1= math.random ( 1, 5 )
			if el1==1  then
				GiveItem ( role , 0 , 0863  , 1 , 4 )
				local message = cha_name.."open the Aladdin Parcel,he get the Gem of Rage" 
				Notice ( message )
			elseif el1==2 then
				GiveItem ( role , 0 , 0860  , 1 , 4 )
				local message1 = cha_name.."open the Aladdin Parcel,he get the Gem of the Wind" 
				Notice ( message1 )
			elseif el1==3 then
				GiveItem ( role , 0 , 0861  , 1 , 4 )
				local message2 = cha_name.."open the Aladdin Parcel,he get the Gem of Striking" 
				Notice ( message2 )
			elseif el1==4 then
				GiveItem ( role , 0 , 0862  , 1 , 4 )
				local message3 = cha_name.."open the Aladdin Parcel,he get the Gem of Colossus" 
				Notice ( message3 )
			elseif el1==5 then
				GiveItem ( role , 0 , 1012  , 1 , 4 )
				local message4 = cha_name.."open the Aladdin Parcel,he get the Gem of Soul" 
				Notice ( message4 )
			end

		elseif star==19601 then
			GiveItem ( role , 0 , 0192  , 1 , 4  )
			local message8= cha_name.."open the Aladdin Parcel,he get the Chest of Kylin" 
			Notice ( message8 )

		elseif star>=19601 and star<=20000 then	
			GiveItem ( role , 0 , 2224  , 1 , 4  )
			local message8= cha_name.."open the Aladdin Parcel,he get the Modern Apparel Chest" 
			Notice ( message8 )
		end
	
end