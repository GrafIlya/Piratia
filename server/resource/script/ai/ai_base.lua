---  实现原则
---  1. 状态 + 条件 + 事件
---  2. 条件满足则产生事件
---  3. 通过任意的组合条件和事件, 来得到简单的状态集合
---  4. 通过选择不同的状态集合, 来实现不同类型的AI
print( "Loading Ai_Base.lua" )


-----AI 类型定义-------------------------------------------------------------------------

AI_NONE			=  0  --不移动
AI_N_ATK			=  1  --不攻击
AI_FLEE			=  2  --被攻击后反方向逃跑
AI_MOVETOHOST  		=  4  --跟随主人
AI_R_ATK			=  5  --被攻击后反击
AI_ATK			= 10  --主动攻击 
AI_ATK_FLEE		= 11  --主动攻击+敌人逼近后逃跑(只有远程攻击的怪物可以填成此类型)




------------------------------------------------------------------------------
--------------------------AI状态条件集 : 警戒------------------------------------
------------------------------------------------------------------------------
as_guard = {}
as_guard[aic_seek_target] = ai_event_find_target

------------------------------------------------------------------------------




------------------------------------------------------------------------------
--------------------------AI状态条件集 : 休息(随机移动)---------------------------
------------------------------------------------------------------------------
as_idle = {}
as_idle[aic_rand_5_1] = ai_event_rand_move

------------------------------------------------------------------------------





------------------------------------------------------------------------------
--------------------------AI状态条件集 : 巡逻------------------------------------
------------------------------------------------------------------------------
--如果回到巡逻起点, 则开始在起点休息
--如果休息结束, 应该开始巡逻了, 则开始巡逻
--如果抵达巡逻目标点, 则在目标点开始休息
--巡逻的同时, 保持警戒
as_patrol = {}
as_patrol[aic_at_spawnpos]   = ai_event_patrol_start_idle
as_patrol[aic_patrol_begin]  = ai_event_patrol_begin
as_patrol[aic_patrol_arrive] = ai_event_patrol_end_idle
as_patrol[aic_patrol_return] = ai_event_patrol_return
as_patrol[aic_seek_target]   = ai_event_find_target
------------------------------------------------------------------------------







------------------------------------------------------------------------------
--------------------------AI状态条件集 : 追击------------------------------------
------------------------------------------------------------------------------
--如果距离出生点太远, 则往回走
--如果目标已经超出视野, 则清除目标
as_chase = {}
as_chase[aic_at_spawn_toofar] 	= ai_event_go_home
as_chase[aic_target_outofsight] = ai_event_clear_target
as_chase[aic_update_target]   	= ai_event_update_target
------------------------------------------------------------------------------




--ai类型 : 废材型
ai_type[1]  = { no_target = as_idle,	has_target = nil      , tick = nil 	}

--ai类型 : 标准型
ai_type[5]  = { no_target = as_guard,	has_target = as_chase , tick = nil 	}

--ai类型 : 胆小型
ai_type[2]  = { no_target = as_idle,	has_target = as_flee  , tick = nil 	}

--ai类型 : 机智型
ai_type[11] = { no_target = as_guard,	has_target = as_around, tick = nil	}

--ai类型 : 巡逻型
ai_type[6]  = { no_target = as_patrol,	has_target = as_chase , tick = nil 	}


function handle_state(c, state)
	
	if state==nil then return end
	
	for con, event in pairs(state) do
		
		if con(c)==1 then event(c) end
			
	end
	
end


function ai_loop(c)
    
 	local ai_def = GetChaAIType(c)
 	if ai_def==AI_NONE then return end
  
    local ai_t = ai_type[ai_def]
    local t    = GetChaTarget(c) --取出当前角色的目标
	if t~=nil then
        handle_state(c, ai_t.has_target)
    else
    	handle_state(c, ai_t.no_target)
    end
  	
    handle_state(c, ai_t.tick)
 
end