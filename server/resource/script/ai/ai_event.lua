print( "Loading Ai_Event.lua" )

--事件 : 发现目标
function ai_event_find_target(c, t)
	
  SetChaTarget(c, t)	
	
end

--事件 : 随机移动
function ai_event_rand_move(c)
	
	rand_move(c, 400)

end

--事件 : 开始新一轮的巡逻
function ai_event_patrol_begin(c)

	local px, py = GetChaPatrolPos(c) --取出巡逻点
    ChaMove(c, px, py)
    SetChaPatrolState(c, 2) --修改巡逻标记, 设置为移动中

end


--事件 : 开始在巡逻目标点休息 
function ai_event_patrol_end_idle(c)
 
	SetChaPatrolState(c, 1)

end

--事件 : 从巡逻目标点返回
function ai_event_patrol_return(c)

    local ox, oy = GetChaSpawnPos(c)  --取出出生点
    ChaMove(c, ox, oy)
    SetChaPatrolState(c, 3)

end

--事件 : 开始在巡逻起始点休息
function ai_event_patrol_start_idle(c)
	
	SetChaPatrolState(c, 0)   
   
end

--事件 : 回出生点
function ai_event_go_home(c)
	
	clear_target(c)      --清除目标
    local x, y = GetChaSpawnPos(c)
    ChaMoveToSleep(c, x, y)
    set_moving_back(c, 1)

end


--事件 : 清除目标
function ai_event_clear_target(c)
	
	clear_target(c)  --清除目标

end


--事件 : 目标更新
function ai_event_update_target(c)
	
	local t = GetChaTarget(c) --取出当前角色的目标
	local tNew = GetChaFirstTarget(c) --通过伤害判断取得优先目标
   	if tNew~=nil and tNew~=t then
       	clear_target(c)         --清除原目标
       	SetChaTarget(c, tNew)   --设置新目标
        return 1
   	end
   	return 0

end

