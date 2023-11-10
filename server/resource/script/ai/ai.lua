print( "Loading Ai.lua" )


dofile(GetResPath("script/ai/ai_sdk.lua"))


vvv = 0
function debugout(c, info)
    --if GetChaDefaultName(c)=="Demonic Snowman" then
       --ChaNotice("New age baby", info..vvv)
       --vvv = vvv + 1 
    --end
end


---------------------------- 涉及流程的AI处理函数 --------------------------------------------
--AITable = {}
--
--AITable[1] = {}
--AITable[1][1] = {}
--AITable["monster"] = {}
--AITable["monster"]["seearea"] = {}
--AITable["monster"]["seearea"]["type"] = "line"
--AITable["monster"]["seearea"].func = ai_idle
--AITable["monster"]["seearea"].func(c)

-----------------------------
-- 没有事情, 随机移动或者巡逻
-----------------------------
function ai_idle(c)

    if ai_host(c)==1 then return end

    if is_patrol(c)==0 then 
  
        birth_rand_move(c, 600)  --在出生点附近6米范围内随机移动 
  
    else
  
        local px, py = GetChaPatrolPos(c) --取出巡逻点
        
        local ox, oy = GetChaSpawnPos(c)  --取出出生点
     
        local patrol_state = GetChaPatrolState(c)
     
        if patrol_state==0 then 
        
            ChaMove(c, px, py)
            SetChaPatrolState(c, 2) --设置为移动中

        elseif patrol_state==1 then
        
            ChaMove(c, ox, oy)
            SetChaPatrolState(c, 3)
     
        elseif patrol_state==2 then 
        
            if is_near_pos(c, px, py, 40)==1 then
                SetChaPatrolState(c, 1)   
            end
     
        elseif patrol_state==3 then
     
            if is_near_pos(c, ox, oy, 40)==1 then
                SetChaPatrolState(c, 0)   
            end
     
        end
  
    end

end


-----------------------
-- 有主人时的处理
-----------------------
 function ai_host(c)
 
    if GetChaAIType(c)==AI_NONE then return 0 end  --水雷怪, 不移动
    
    local host = GetChaHost(c)
       
    if host~=nil then 
            
        local dis = get_distance(c, host)
        
        if dis > 400 then --保持在4米以内
            
            local hx, hy = GetChaPos(host)
            local rx = 200 - Rand(400)
            local ry = 200 - Rand(400)
            ChaMove(c, hx + rx, hy + ry)
            
        end
         
        return 1    
    end

  return 0
end

-----------------------
-- 碰到障碍时的处理
-----------------------
function ai_block(c, t)

    if GetChaBlockCnt(c) > 0 then --被障碍挡住
  		    
        local flee_flag = Rand(10)
        if t~=nil and flee_flag > 5 then
		   flee(c, t)           --有目标时有50%的几率反方向移动
 		else
		   local move_flag = 1--Rand(2)
           if move_flag==1 then rand_move(c, 400) end    --4米范围内随机移动 
    	end
		
        SetChaBlockCnt(c, 0)  --障碍计数清0
    
    end

end

-------------------------
-- 处理怪物有目标时的表现
-------------------------
function ai_target(c, t)
    
    local ai_type = GetChaAIType(c)
   
    if ai_type ~= 4 then
	    if ai_update_target(c, t, ai_type)==1 then --如果经过更新检查后, 目标已变, 则返回
	       return 
	    end 
    end
    
    --不同的ai类型对待目标有不同的方式

    if ai_type==AI_FLEE then             --被攻击后, 只会逃跑
        flee(c, t)
        return
    elseif ai_type==4 then             --被攻击后, 只会逃跑
        star_move_to(c, t)
        return
    elseif ai_type==AI_ATK_FLEE then     --被逼近后才逃跑
        if is_near(c, t, 400)==1 then    --目标已经靠近
            flee(c, t)
            return
        end
    end

--特殊AI战斗处理过程（主要针对Boss怪物）
	if ai_type>20 then          --20以上为BossAI
		special_ai(c, t,ai_type)
	else
		local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
		ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
	end
  
    --一般技能（填写在角色表中的技能）处理过程
  
    if is_cha_can_summon(c)==1 then 
        summon_monster(c, t)         --召集其他同类怪来攻击目标
    end

end



---------------------------
-- 处理怪物没有目标时的表现
---------------------------
function ai_no_target(c)
	local ai_type = GetChaAIType(c)
	

	if ai_type==4 then             --被攻击后, 只会逃跑
		--Notice("ai_no_target&ai_type==4")
		star_delete_to(c)
		return
	end 
    local x, y = GetChaSpawnPos(c)

    if is_near_pos(c, x, y, 100)==1 then
       SetChaPatrolState(c, 0)
    end
    
    if ai_seek_target(c)==0 then       --没有找到目标
  
        if is_moving_back(c)==0 then   --没有往回走
           
   	   local now_x, now_y = GetChaPos(c)
   
           local dis = (now_x - x) * (now_x - x) + (now_y - y) * (now_y - y)
          
           if dis > 5000 then        
               ChaMove(c, x, y)
               debugout(c, "ai_no_target Snowman distance spawn further MoveToSleep")
           else
               ai_idle(c)
           end
       else
	    
	   local move_flag = Rand(2)
	   if move_flag==1 then
    	        ChaMove(c, x, y)
                debugout(c, "ai_no_target Snowman MoveToSleep")
           end
	
        end
    end
end


-----------------------------------
-- 主动攻击的怪，则为自己寻找一个目标
-----------------------------------
function ai_seek_target(c) 
    
    local ai_t = GetChaAIType(c)
    
    if ai_t<=AI_R_ATK then 
        return 0 
    end

    local host = GetChaHost(c)
    if host~=nil then
        
        local t = GetChaFirstTarget(host) --通过伤害判断取得优先目标
      	if t~=nil and is_near(c, t, GetChaVision(c))==1 then
           SetChaTarget(c, t)
           return 1
        end
    
    else
        
        local t = find_target(c, 0) --没有目标, 则寻找一个, 没有找到则t为空
        if t~=nil then
            SetChaTarget(c, t)
            return 1
        end
    
    end

    return 0
end

---------------------------------------------------------------
-- 检查目标的更新情况, return 1表示目标已变, return 0表示目标未变
---------------------------------------------------------------
function ai_update_target(c, t, ai_type)

    if ai_type<=AI_N_ATK or t==GetChaHost(c) then --如果目标为主人则清除
       clear_target(c) 
       return 1 
    end
  
    local tNew = nil
    
    if Rand(100) < CHANGE_TARGET_RATIO then
    	tNew = GetChaFirstTarget(c) --通过伤害判断取得优先目标
      	if tNew~=nil and tNew~=t then
        	clear_target(c)         --清除原目标
         	SetChaTarget(c, tNew)   --设置新目标
            return 1
    	end
	end
    
    local vision = GetChaVision(c)
    if is_near(c, t, vision)==0 then --目标距离已经太远
        clear_target(c)  --清除目标
        return 1
    end
    
    --目标已经离开追击范围, 不再追击
    if is_chase(c)==0 then --检查追击范围, 炮塔不执行
        clear_target(c)      --清除目标
        local x, y = GetChaSpawnPos(c)
        ChaMoveToSleep(c, x, y)
        set_moving_back(c, 1)
        return 1
    end

    return 0 --返回1表示目标不变

end



------------------------------------------------------------------------------------------------
---------------------------------------    逻辑循环  -------------------------------------------
------------------------------------------------------------------------------------------------


---------------------------------
--AI个体循环函数, 所有角色依次执行
---------------------------------
function ai_loop(c)
    
    local ai_type = GetChaAIType(c)

    if ai_type==AI_NONE then return end


    
    local t = GetChaTarget(c) --取出当前角色的目标

    if t~=nil then 
        ai_target(c, t) --有目标
    else
     	ai_no_target(c) --无目标
  	end
  	
    ai_tick(c, t) --每次都执行
  	
end


---------------------------
-- 每次ai_loop都要调用的过程
---------------------------
function ai_tick(c, t)

    --如果是反隐身怪, 则解除视野内角色的隐身状态
    local type_id = GetChaTypeID(c)
    if ai_flag_nohide[type_id]==1 then
        local vision = GetChaVision(c)
        ClearHideChaByRange(c, 0, 0, vision, 0)
    end

    --处理障碍
    ai_block(c, t)

end

---------------------------
-- Boss(特殊)AI处理过程
---------------------------

function special_ai(c, t,ai_type)

	if ai_type == MWHH then    --冥王幻皇如果不在圣眼区域，不在潜行，且目标不在眩晕状态则潜行，如果目标已经眩晕，普通攻击；如果不在圣眼区域已经潜行，目标不在眩晕状态则鬼舞，目标眩晕，普通攻击；如果在圣眼区域，普通攻击。
		local StateLv = GetChaStateLv ( c , STATE_SYZY )
		if StateLv == 0 then
			local StateLv = GetChaStateLv ( c , STATE_YS )
			if StateLv == 0 then
				local StateLv = GetChaStateLv ( t , STATE_XY )
				if StateLv == 0 then
					ChaUseSkill(c, c, 123)
					ChaUseSkill(c, t, 86)
					local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
					ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能

					return
				else
					local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
					ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
					return
				end
			else
				local StateLv = GetChaStateLv ( t , STATE_XY )
				if StateLv == 0 then
					ChaUseSkill(c, t, 86)
					local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
					ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
					return
				else
					local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
					ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
					return
				end
			end
		else
					local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
					ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
					return
		end
	end
---------------------------------------------------------------------------------------------------------

	if ai_type == MWYH then  --妖火首先腿狙,然后手狙,再开始普通攻击
		local StateLv = GetChaStateLv ( t , SK_TJ )
		if StateLv ~= 0 then
			local StateLv = GetChaStateLv ( t , SK_SJ )
			if StateLv == 0 then
				ChaUseSkill(c, t, 95)
				local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
				ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
				return
			else
				local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
				ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
				return
			end
		else
			ChaUseSkill(c, t, 94)
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			return
		end
	end
---------------------------------------------------------------------------------------------------------

	if ai_type == MWXS then
		if is_near(c, t, 750)~=1 then    --目标已经靠近
			ChaUseSkill(c, t, 325)
		end
		local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
		ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
	end
---------------------------------------------------------------------------------------------------------
	if ai_type == MWBK then
		if is_near(c, t, 750)~=1 then    --目标已经靠近
			ChaUseSkill(c, t, 325)
		end
		local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
		ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能		
	end

---------------------------------------------------------------------------------------------------------
	if ai_type == MWFH then
		local StateLv = GetChaStateLv ( c , STATE_FNQ )
		if StateLv ~= 0 then
			local StateLv = GetChaStateLv ( t , STATE_BDJ )
			if StateLv == 0 then
				ChaUseSkill(c, t, 93)
				local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
				ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
				return
			else
				local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
				ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
				return
			end
		else
			ChaUseSkill(c, c, 223)
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			return
		end
	end
---------------------------------------------------------------------------------------------------------

	if ai_type == MWJW then
		local StateLv = GetChaStateLv ( c , STATE_MFD )
		if StateLv == 0 then
			local sp = GetChaAttr( c , ATTR_SP ) 
			local mxsp = GetChaAttr( c , ATTR_MXSP )
			local percent = sp/mxsp
			if percent>=0.1 then
				ChaUseSkill( c, c, 106 )
			else
				local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
				ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			end
			return
		end

		local StateLv = GetChaStateLv ( c , STATE_TSHD )
		if StateLv == 0 then
			ChaUseSkill(c, c, 103 ) 
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			return
		end

		local StateLv = GetChaStateLv ( c , STATE_FZLZ )
		if StateLv == 0 then
			ChaUseSkill(c, c, 101)
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			return
		end

		local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
		ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能

	end
---------------------------------------------------------------------------------------------------------

	if ai_type == MWLH then
		local StateLv = GetChaStateLv ( t , STATE_JNJZ )
		if StateLv == 0 then
			ChaUseSkill( c, t, 104 )
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			return
		end

		local StateLv = GetChaStateLv ( t , STATE_GJJZ )
		if StateLv == 0 then
			ChaUseSkill(c, t, 105 ) 
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			return
		end

		local StateLv = GetChaStateLv ( t , STATE_SYNZ )
		if StateLv == 0 then
			ChaUseSkill(c, t, 121)
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			return
		end

		local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
		ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
	end
---------------------------------------------------------------------------------------------------------

	if ai_type == MWHS then
		local job = GetChaAttr( t , ATTR_JOB )
		if job == 8 then
			ChaUseSkill(c, t, 213)
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
			return
		else
			local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
			ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
		end
	end
---------------------------------------------------------------------------------------------------------

	if ai_type == MWHDS then
		local StateLv = GetChaStateLv ( c , STATE_XY )
		if StateLv~=0 then
			State_Xy_Rem ( c , StateLv )
		end

		local StateLv = GetChaStateLv ( c , STATE_SJ )
		if StateLv~=0 then
			State_Sj_Rem ( c , StateLv )
		end

		local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
		ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能
	end
---------------------------------------------------------------------------------------------------------

	if ai_type == MHKL then

		local StateLv = GetChaStateLv ( c , STATE_XY )
		if StateLv~=0 then
			State_Xy_Rem ( c , StateLv )
		end

		local StateLv = GetChaStateLv ( c , STATE_SJ )
		if StateLv~=0 then
			State_Sj_Rem ( c , StateLv )
		end

		local skill_id = select_skill(c) --怪物按照比率选择自己的技能  
		ChaUseSkill(c, t, skill_id)      --向目标移动并使用技能

	end

end