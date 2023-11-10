print('Loading timer.lua')

-- C++ no longer calls ai_loop
-- ai_timer is called instead.
-- ai_timer will call ai_loop
function ai_timer(c, freq, time)
	local resume_freq = 10 -- according to players, monster heals too fast (set to 10 instead 5) 
	local now_tick = GetChaParam(c, 1) 
	local is_role_living = -1

	SetChaParam(c, 1, now_tick + freq * time) 
	if math.mod(now_tick, resume_freq) == 0 and now_tick > 0 then 
		if is_role_living == -1 then
			is_role_living = IsChaLiving(c)
		end
		if is_role_living == 1 then
			local hp = GetChaAttr(c, ATTR_HP)
			local mxhp = GetChaAttr(c, ATTR_MXHP)
			if hp < mxhp then
				Resume(c)
			end
		end 
	end
	ai_loop(c)
end

function npc_timer(role)
end

function cha_timer(role, freq, time)
	local resume_freq = 5 
	local now_tick = GetChaParam(role, 1)
	local is_role_living = -1
	SetChaParam(role, 1, now_tick + freq * time)
	if math.mod(now_tick, resume_freq) == 0 and now_tick > 0 then
		if is_role_living == -1 then
			is_role_living = IsChaLiving(role)
		end
		if is_role_living == 1 then
			Resume(role)
		end
	end
end