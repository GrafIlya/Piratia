print('Loading timerfunc.lua')

-- fix resume of boat
ResumeHook = Resume

function ResumeFuel(cha)
	cha = TurnToShip(cha);
	if(ChaIsBoat(cha) == 1)then
		local boat = TurnToShip(cha)
		local fuel,mxfuel,fuelrec = GetChaAttr(boat, ATTR_SP),GetChaAttr(boat, ATTR_MXSP),GetChaAttr(boat, ATTR_SREC) 
		local dura,mxdura,durarec = GetChaAttr(boat, ATTR_HP),GetChaAttr(boat, ATTR_MXHP),GetChaAttr(boat, ATTR_HREC)
		if(fuel <= 0)then
			if(dura > 0)then
				SystemNotice(boat, 'No more fuel! ['..GetChaDefaultName(boat)..'] is slowly getting damaged.')
				durarec = durarec - 0.025 * mxdura
				dura = math.min(mxdura, dura + durarec)
				SetCharaAttr(dura, boat, ATTR_HP)
			end
			if(dura <= 0)then
				return
			end
		else
			fuel = math.max(0, fuel - fuelrec)
			SetCharaAttr(fuel, boat, ATTR_SP)
		end
	end
end

function Resume(role)
	ResumeHook(role)
	ResumeFuel(role)
end

-- no touch
local
npcwalkname = {}
npcwalkdata = npcwalkdata or {} -- holds original x,y val of npc
local
npctalkname = npctalkname or {}

-- config here
npcwalkname['Tourist - Ja'] = true
npcwalkname['Youth - Tommy'] = true
npcwalkname['Berry'] = true
--[[
npcwalkname['[beta] Tailor - Lance'] = true
npcwalkname['[beta] Tailor - Carsise'] = true
npcwalkname['[beta] Tailor - Phyllis'] = true
npcwalkname['[beta] Tailor - Ami'] = true

npctalkname['[beta] Tailor - Ami'] = {
	'Come enjoy the beach, &CHA_NAME!',
	'I will sail across the 7 seas one day!',
};
npctalkname['[beta] Tailor - Phyllis'] = {
	'&CHA_NAME, come bathe in the sun with me!',
	'Stop staring at me!',
};
npctalkname['[beta] Tailor - Lance'] = {
	'kame... hame... haaaaaaaa!',
	'hakai!',
	'migatte no gokui...'
};

npctalkname['Navy Recruitment - Rachel'] = {
	'Join the Navy today, &CHA_NAME!',
	'Hey &CHA_NAME, you look fitted for the Navy!',
	'The Navy wants you, &CHA_NAME!'
};]]

npc_timerX = npc_timer

function npc_timer(role)
	npc_timerX(role)
	-- hooks here
	npc_walk(role)
	npc_talk(role)
end

function npc_walk(role)
	local name = GetChaDefaultName(role)
	local dummy, npc, id = FindNpc(name)
	if npcwalkname[name] then
		if npcwalkdata[id] == nil then
			npcwalkdata[id] = {}
			npcwalkdata[id].x,npcwalkdata[id].y = GetChaPos(npc)
		else
			npc_move(role, 300, id)
		end
	end
end

function npc_move(cha,range,id)
	-- 1/20 Chance of Movement
	local move_flag = Rand(30)
	if move_flag > 1 then 
		return 
	end
	x, y = npcwalkdata[id].x,npcwalkdata[id].y
	local a = math.random(1,2)
	if a == 1 then
		rx = x + range + Rand(range * 2)
		ry = y + range + Rand(range * 2)
	else
		rx = x + range - Rand(range * 2)
		ry = y + range - Rand(range * 2)
	end
	--Illegal destination for this character, then stop	
	if is_pos_valid(cha, x, y) == 0 then
		return 
	end
	-- custom
	if Dis(rx,ry,npcwalkdata[id].x,npcwalkdata[id].y) > (range * 2) then
		a = math.random(1,2)
		if a == 1 then
			rx = npcwalkdata[id].x + range + Rand(range * 2)	
			ry = npcwalkdata[id].y + range + Rand(range * 2)
		else
			rx = npcwalkdata[id].x + range - Rand(range * 2)	
			ry = npcwalkdata[id].y + range - Rand(range * 2)
		end
	end
	ChaMove(cha, rx, ry)
end

function npc_talk(npc)
	local name = GetChaDefaultName(npc)
	local target = find_target(npc, 400)
	if not target then
		return
	end
	local chaname = GetChaDefaultName(target)
	-- check if target is in offline stall state
	if npctalkname[name] ~= nil then
		local radsay = math.random(1, table.getn(npctalkname[name]))
		if target ~= nil and Rand(100) < 1 then
			local str = npctalkname[name][radsay]
			if string.find(str, "&CHA_NAME") ~= nil then
				str = str:gsub("&CHA_NAME", chaname)
			end
			Say(npc, str)
		end
	end
end