
-------------------------------------通用条件列表-----------------------------------
----------------------------------------------------------------------------------
print( "Loading Ai_Condition.lua" )

--条件 : 位于出生点
function aic_at_spawnpos(c)
	
	local x, y = GetChaSpawnPos(c)

    if is_near_pos(c, x, y, 100)==1 then
    	return 1
    end
    
    return 0
end

--条件 : 距离出生点太远
function aic_at_spawn_toofar(c)
	 
	local chase_r = GetChaChaseRange(c)
	local x, y = GetChaSpawnPos(c)
	local now_x, now_y = GetChaPos(c)
   	local dis = (now_x - x) * (now_x - x) + (now_y - y) * (now_y - y)
   	if dis > chase_r * chase_r then
   		return 1
   	end
   	return 0
	
end

--条件 : 目标超出视野
function aic_target_outofsight(c)

	local t = GetChaTarget(c) 			--取出当前角色的目标
	local vision = GetChaVision(c)		--取出角色的视野
	if is_near(c, t, vision)==0 then 	--目标距离已经太远
        return 1
    end
    return 0

end


--条件 : 发现目标
function aic_seek_target(c)
	
	local t = find_target(c, 0) --没有目标, 则寻找一个, 没有找到则t为空
    if t~=nil then
            return 1
    end
    
    return 0
end

--条件 : 5分之1的几率
function aic_rand_5_1(c)
	
	if Rand(5)==1 then
		return 1
	end

end
----------------------------------------------------------------------------------



----------------------------------巡逻专有条件列表-----------------------------------
----------------------------------------------------------------------------------
--条件 : 巡逻起点休息结束
function aic_patrol_begin(c)
	
	local patrol_state = GetChaPatrolState(c)
	if patrol_state==0 then return 1 end
	return 0
        
end

--条件 : 抵达巡逻目标点
function aic_patrol_arrive_end(c)
	
	local px, py = GetChaPatrolPos(c) --取出巡逻点
    if is_near_pos(c, px, py, 40)==1 then return 1 end
    return 0    

end

--条件 : 在巡逻目标点休息结束
function aic_patrol_return(c)

	local patrol_state = GetChaPatrolState(c)
	if patrol_state==1 then return 1 end
	return 0
        
end
----------------------------------------------------------------------------------


--条件 : 检测目标更新
function aic_update_target(c)
	
	if Rand(100) < CHANGE_TARGET_RATIO then
    	return 1
    end
    return 0
	
end

	


