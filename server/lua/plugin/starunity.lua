-- check kitbag if full before give
-- check energy before give weap

TEAMSTAR_EQ = {}
TEAMSTAR_EQ[12] = 1409
TEAMSTAR_EQ[09] = 1392
TEAMSTAR_EQ[16] = 1419
TEAMSTAR_EQ[08] = 1382
TEAMSTAR_EQ[13] = 1433
TEAMSTAR_EQ[14] = 1467

function Transfer_TeamStar(role, level)
	local TEAMSTAR_EQ = TEAMSTAR_EQ
	local cha = TurnToCha(role)
	local script_count = CheckBagItem(cha, 1034)
	local chaLV =  GetChaAttr(cha, ATTR_LV)
	local job = GetChaAttr(role, ATTR_JOB)
	if chaLV < 41 then
		SystemNotice(role,"Please come back after Lv41.")
		return
	end
	if script_count < 1 then
		SystemNotice(cha, "Need to possess Star of Unity to receive")
		return
	end
	if script_count > 1 then
		SystemNotice(cha, "Too many Star of Unity was found!")
		return
	end
	if script_count == 1 then
		if BankNoItem(role, 1034, 1) ~= LUA_TRUE then
			SystemNotice(cha, "Existing Star of Unity was found in bank!")
			return
		end
		if EquipNoItem(role, 1034, 1) ~= LUA_TRUE then
			SystemNotice(cha, "Existing Star of Unity was found in equipment slot!")
			return
		end
		-- check if energy full
		local chaunity = GetChaItem2 ( role , 2 , 1034 )
		local expItemNow = GetItemAttr(chaunity, ITEMATTR_URE)
		local expItemMax = GetItemAttr(chaunity, ITEMATTR_MAXURE)
		if expItemNow < expItemMax then
			SystemNotice(role, "Come back when the energy of the Star of Unity has been filled!")
			return
		end
		if TEAMSTAR_EQ[job] == nil then
			SystemNotice(role, "Can only be used by characters that have completed second advancement. Please look for class trainers NPC of each city to complete your rebirth quest before redemption.")
			return
		end
		local x_del = DelBagItem(cha, 1034, 1) 
		if x_del == 1 then
			GiveItem(role, 0, TEAMSTAR_EQ[job], 1, 22)
		else
			SystemNotice(cha, "Unable to deduct Star of Unity") 
		end
	end
end