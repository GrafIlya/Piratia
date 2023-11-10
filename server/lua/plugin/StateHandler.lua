print("Loading StateHandler.lua")
--Glow Effects Object
StateHandler = {
	Effects = {
		--{
		--	State = 33,
		--	Level = 1,
		--	Equips = {
		--		[enumEQUIP_BODY] = 825,
		--		[enumEQUIP_GLOVE] = 826,
		--		[enumEQUIP_SHOES] = 827,
		--	},
		--},
	}
}

--function to iterate through the table and check each glow
function StateHandler.CheckGlows(role)
	local States = {}
	local PID = GetRoleID(role)
	for i,v in pairs(StateHandler.Effects) do
		if v.State ~= nil then
			local lvl = v.Level or 1
			if StateHandler.CheckGlow(role,i) then
				if GetChaStateLv ( role , v.State) < lvl then
					AddState(role,role,v.State,lvl,0)
				end
				States[v.State] = true
			end
		end
	end
	StateHandler.RemoveGlows(role,States)
end

function StateHandler.CheckGlow(role,ID)
	local Equips = StateHandler.GetEquips(role)
	for i,v in pairs(StateHandler.Effects[ID].Equips) do	
		Equips[i] = Equips[i] or 0
		if (not StateHandler.InArray (v , Equips[i])) then
			return false
		end
		
	end
	return true
end

--function to remove all glows that the user does not meet the requirements for.
function StateHandler.RemoveGlows(role,States)
	for i,v in pairs(StateHandler.Effects) do
		if GetChaStateLv ( role , v.State) > 0 and States[v.State] ~= true then
			RemoveState ( role ,  v.State )
		end
	end
end

--function to check if a data item is within an array
function StateHandler.InArray(array,str)
	if type(array) ~= "table" then
		return array == str
	end
	for i,v in pairs(array) do
		if v == str then
			return true
		end
	end
	return false
end

--returns a table of user equips
function  StateHandler.GetEquips(role)
	local ret = {}
	for i = 0,enumEQUIP_MAX do
		ret[i] = GetItemID(GetEquipItemP(role,i)) 
	end
	return ret
end

--Hook on updating stats to check states
AttrRecheckStateHandlerHook = AttrRecheckStateHandlerHook or AttrRecheck
function AttrRecheck(role,skipCheck)
	if not skipCheck then
		StateHandler.CheckGlows(role)
	end
	AttrRecheckStateHandlerHook(role,true)
end

--override this function, only change is setting 2nd param of AttrRecheck to true.
function ALLExAttrSet ( role )
	if IsPlayer ( role ) == 0 then
		ExAttrSet ( role ) 
		return 
	end 
	if ChaIsBoat ( role ) == 0 then
		AttrRecheck ( role,true ) 
	else
		local cha_role = GetMainCha ( role ) 
		ShipAttrRecheck ( cha_role , role ) 
	end 
end 