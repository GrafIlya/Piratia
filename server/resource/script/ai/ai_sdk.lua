print( "Loading Ai_Sdk.lua" )

dofile(GetResPath("script/help/help.lua"))
dofile(GetResPath("script/ai/ai_define.lua"))


--重新载入ai函数库
function reload_ai_sdk()
  dofile(GetResPath("script/ai/ai.lua"))
end

-------AI SDK函数------------------------------------------------------------------------

--对指定的角色检查目标点是否合法可达
function is_pos_valid(cha, x, y)
  can_move = IsPosValid(cha, x, y)
  if can_move==0 then
    LG("lua_ai", "Destination point", x, " ", y, " is it allow to reach")
  end
  return can_move
end

--查找附近的目标(对于休眠的怪物, 这个距离不应该太大, 否则客户端看不到表现)
--返回查找到的怪物
function find_target(cha, flag)
  x,y = GetChaPos(cha)
  vision = GetChaVision(cha)
  return GetChaByRange(cha, x, y, vision, flag) --默认为9米范围
end

--清除目标
function clear_target(c)
  LG("lua_ai", "clear target clear_target()")
  SetChaTarget(c, 0)
  SetChaPatrolState(c, 0)
end

--向目标移动, 只是移动而不攻击, 所以只会移动到附近的位置
--返回值 2 表示已经到达目标 
--       1 表示继续移动
--       0 表示无法移动
function move_to(cha, target, flag)
  if is_near(cha, target, 250)==1 then -- 如果距离足够近则不再移动
     return 2
  end
  
  x, y = GetChaPos(target)
  --在角色附近取一个随机点
  rx = 110 - Rand(220)
  ry = 110 - Rand(220)
  x = x + rx
  y = y + ry
  
  if is_pos_valid(cha, x, y)==0 then --目的地对于此角色不合法, 则不移动
    return 0 
  end 
  
  ChaMove(cha, x, y)
  
  return 1
end
------------------------------------
function star_move_to(cha, target)
	local host_cha = GetChaHost(cha)
	--local PetNum = GetPetNum(host_cha)
	
	--if PetNum == 0 then
	--	local life = 1
	--	SetChaLifeTime( cha, life )
	--	return 1
	--end
	
	local  x1, y1 = GetChaPos(host_cha)
	
	if is_near_pos(cha, x1, y1, 200)==1 then
		return 1
	end
	
	local rx = x1 + 200 - Rand(200 * 2)
	local ry = y1 + 200 - Rand(200 * 2)
	
	if is_pos_valid(cha, x1, y1)==0 then --目的地对于此角色不合法, 则不移动
	    return 0 
	end 
	
	ChaMove(cha, rx, ry)
	
	return 1
end
function star_delete_to(cha)
	--local PetNum = GetPetNum(host_cha)	
	--if PetNum == 0 then
	local life = 1
	SetChaLifeTime( cha, life )
	return 1
	--end
end
--向目标反方向移动
function flee(cha, target)
   x, y = GetChaFacePos(target)
   ChaMove(cha, x, y)
end

--随机移动
function rand_move(cha, range)
  x, y = GetChaPos(cha)
  rx = x + range - Rand(range * 2)
  ry = y + range - Rand(range * 2)
  if is_pos_valid(cha, x, y)==0 then return end --目的地对于此角色不合法, 则停止
  ChaMove(cha, rx, ry)
end

--在出生点附近随机移动
function birth_rand_move(cha, range)
  local move_flag = Rand(20)
  
  if move_flag > 1 then return end --只有1/18的几率产生随机移动, 限制随机移动的频率
  
  x, y = GetChaSpawnPos(cha)
  rx = x + range - Rand(range * 2)
  ry = y + range - Rand(range * 2)
  if is_pos_valid(cha, x, y)==0 then return end --目的地对于此角色不合法, 则停止
  ChaMove(cha, rx, ry)
end

--返回两个角色是否接近
function is_near(cha, target, r)
  if target==nil or target==0 then 
     LG("ai_error", "is_near() target = "..target)
     return 0
  end
  local x, y = GetChaPos(cha)
  local tx, ty = GetChaPos(target)
  if ((tx - x) * (tx - x) + (ty - y) * (ty - y)) < (r * r) then
    return 1
  end
  return 0
end

--返回角色是否接近坐标
function is_near_pos(cha, tx, ty, r)
  local x, y = GetChaPos(cha)
  local dis = math.sqrt((tx - x) * (tx - x) + (ty - y) * (ty - y))
  --LG("lua_ai1", "dis = ", tx - x, ty - y, dis)
  if dis < r then
    --LG("lua_ai1", "dis = ,r = ", dis, r)
    return 1
  end
  return 0
end

--返回两个角色的距离
function get_distance(c1, c2)
    local x, y = GetChaPos(c1)
    local tx, ty = GetChaPos(c2)
    return math.sqrt((tx - x) * (tx - x) + (ty - y) * (ty - y))
end

--返回角色是否应该追踪下去
function is_chase(cha)
   
   if GetChaTypeID(cha)==350 then return 1 end  --炮塔始终都是chase标记

   local chase_r = GetChaChaseRange(cha)
   LG("lua_ai", "Check chasing range: ", chase_r)
   if chase_r==0 then --如果追击范围填0, 表示会一直追下去
     return 1
   end
   
   local x, y = GetChaSpawnPos(cha)
   
   local host = GetChaHost(cha)

   if host~=nil then
       x, y = GetChaPos(host) --有主人的情况下, 取主人的当前坐标
   end
   
   local now_x, now_y = GetChaPos(cha)
   
   local dis = (now_x - x) * (now_x - x) + (now_y - y) * (now_y - y)
   LG("lua_ai", "Current distance birth point: ", dis)
   if dis > chase_r * chase_r then
     
     
     if is_patrol(cha)==1 then
        local x, y = GetChaPatrolPos(cha)
        local dis2 =  (now_x - x) * (now_x - x) + (now_y - y) * (now_y - y)
        if dis2 < chase_r * chase_r then
           return 1
        end
     end    

     return 0
   
   
   else
     return 1
   end
   return 0
end

--返回角色是否能够召集同类怪
function is_cha_can_summon(c1)
 	
    if GetChaPatrolState(c1)>=10 then
    	return 0
  	end

	local type_id = GetChaTypeID(c1)
	if ai_flag_summon[type_id]~=nil then 
		return 1
	end 
  
   	return 0
end

--返回角色是否能否捡东西
function is_cha_can_pick(c)
	--if ai_type<=5 then return 1 end --主动攻击的怪是不会捡的
	return 0
end


--召唤小怪来攻击
function summon_child(c, t)
   if Rand(25) > 1 then return end
   chaType = GetChaTypeID(c)
   x, y = GetChaPos(c)
   if chaType==206 then
       LG("lua_ai", "Mini Bees have been defeated, summon 3 Forest Spirits!")
       nx = x + 100 - Rand(200)
       ny = y + 100 - Rand(200)
       cha1 = CreateCha(103, nx, ny, 90, 1000)
       SetChaTarget(cha1, t)
       
       nx = x + 100 - Rand(200)
       ny = y + 100 - Rand(200)
       cha2 = CreateCha(103, nx, ny, 145, 1000)
       SetChaTarget(cha2, t)
       
       nx = x + 100 - Rand(200)
       ny = y + 100 - Rand(200)
       cha3 = CreateCha(103, nx, ny, 180, 1000)
       SetChaTarget(cha3, t)
   end
end


--角色选择当前要使用的技能
function select_skill(c)
   --LG("rand", "Begin----------------", GetChaDefaultName(c))
   --info = {}
   --info[0] = { a = 7, b = 20}
   --info[1] = { a = 8, b = 80}
   
   local num = GetChaSkillNum(c) - 1
   local s = 0
   local e = 0
   local r = Rand(100)
   --LG("rand", "r = ", r);
   local skill_id = 0
   for i = 0, num do
       --skill_id = info[i].a
       --ratio    = info[i].b --GetChaSkillInfo(c, i)           
       skill_id, ratio = GetChaSkillInfo(c, i)
       local e = s + ratio
       --LG("rand", "(", s, ",", e, "]")
       if r > s and r<=e then
          break
       end
       s = s + ratio
   end
   --LG("rand", "select skill_id = ", skill_id)
   --LG("rand", "=====================")
   return skill_id
end


--创建巡逻ai的怪
function CreatePatrolCha(t_id, x, y, dir, relive_time, px, py)
    local cha = CreateCha(t_id, x, y, dir, relive_time)
    SetChaPatrolPos(cha, px, py)
    return cha
end

--召唤其他怪来帮忙
function summon_monster(cnn, t)
  LG("lua_ai", "Check nearby monster, type", GetChaTypeID(cnn));
  SetChaEmotion(cnn, 10)
  SetChaPatrolState(cnn, 10) --设置为已经召唤过了
  local x,y = GetChaPos(cnn)
  local m_type = GetChaTypeID(cnn)
  local m = {}
  m[0], m[1],m[2], m[3] = GetChaSetByRange(cnn, x, y, 800, m_type)
  for id, monster in pairs(m) do
    if monster~=nil then
       name = GetChaDefaultName(monster)
       LG("lua_ai", name, " Come help me deal with target:", GetChaDefaultName(t))
       local skill_id = select_skill(monster) --怪物按照比率选择自己的技能
       SetChaTarget(monster, t)
       ChaUseSkill(monster, t, skill_id)
       SetChaEmotion(monster, 11)
       SetChaPatrolState(monster, 11) --设置为已经被召唤过了
    end
  end
end

--让周围的怪激活并攻击玩家, 用于道具诱惑怪物出现的场合
--参数为目标指针, 和怪物类型
function tempt_monster(cha, m_type)
  LG("lua_tempt", "Check nearby monster, type", GetChaTypeID(cha));
  x,y = GetChaPos(cha)
  local m = {}
  m[0], m[1], m[2], m[3] = GetChaSetByRange(cha, x, y, 900, m_type)
  for id, monster in pairs(m) do
    if monster~=nil then
       local name = GetChaDefaultName(monster)
       LG("lua_tempt", name, " There are things to eat, appear now, target:", GetChaDefaultName(cha))
       SetChaTarget(monster, cha)
       local skill_id = select_skill(monster) --怪物按照比率选择自己的技能
       ChaUseSkill(monster, cha, skill_id)
       SetChaEmotion(monster, 11)
    end
  end
end

--是否怪物会巡逻
function is_patrol(c)
  local px, py = GetChaPatrolPos(c)
  if px==0 then return 0 end
  return 1
end

--是否正在往回走
function is_moving_back(c)
   if GetChaPatrolState(c)==9 then --往回走 
       return 1
   end
   return 0
end

--设置为正在往回走
function set_moving_back(c, bFlag)
    if bFlag==1 then
       SetChaPatrolState(c, 9)
    else
       if is_moving_back(c)==1 then
          SetChaPatrolState(c, 0)
       end
    end
end

-------接口型 AI SDK 函数 结束-----------------------------------------------------------------------



