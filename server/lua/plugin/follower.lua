print("Loading Follower.lua")
--[[
	Follower System.
	Summons a player to follow you.
	
	Currently summons a phyliss buffer.
	
	
	TODO:
		Add more classes/skills
		src work (eg saving equips to db, loading them etc)
		Add way to get equips onto them (client gui aswell)
		Management window (to set skills,targets etc?)

		
		
		
	Followers[GetPlayerByName('pppp')]:Equip(9,0)
]]

--Table of followers, role as index
Followers = Followers or {}
--table of followers, follower as index (points to same object as Followers)
FollowersChar = FollowersChar or {}



--condition functions for skills

--returns function to check if user has/hasnt a state
function hasState(ID,has)
	return function(role)
		return (GetChaStateLv(role,ID) > 0) == has
	end
end

--returns function to check if user has/hasnt a state from a group of states
function hasStates(tab,has)
	return function(role)
		for i,v in pairs(tab) do
			if (GetChaStateLv(role,v) > 0) == has then
				return true
			end
		end
		return false
	end
end

--checks current location against locations of active truesights
function trueSight(self)
	local x,y = GetChaPos(self.Char)
	local skilltime = 90 +  GetSkillLv(self.Char,116) * 9  
	local size = (600 + sklv * 20 )/2
	local removal = {}
	for i,v in ipairs(self.TrueSight) do
		if v.x < x+size and v.x > x-size and v.y < y+size and v.y > y-size and v.time + skilltime > os.time() then
			for i = #removal,0,-1 do
				table.remove(self.TrueSight,i)
			end
			return false
		end
		if v.time + skilltime < os.time() then
			removal[#removal+1] = i
		end
	end
	for i = #removal,0,-1 do
		table.remove(self.TrueSight,i)
	end
	return true
end

--check if hp is lower than max
function ShouldHeal(t)
	return Hp(t) < Mxhp(t)
end

--list of states that recover skill can remove
Recoverables = {STATE_ZD ,STATE_MB,STATE_ZZZH ,STATE_SYNZ,STATE_SDBZ ,STATE_TJ ,STATE_SJ ,STATE_JNJZ ,STATE_GJJZ ,STATE_BDJ ,STATE_XN ,STATE_NT ,STATE_DIZ ,STATE_SWCX ,STATE_JSDD ,	STATE_HYMH ,STATE_HLKJ  ,STATE_HLLM ,STATE_CRXSF,STATE_BlackHX  ,STATE_HLKJ}

Friend = 1
Enemy =2
AOE = 3


Follower = {
	SaveFields = {
		"LastSpeak",
		"AutoTarget",
		"CastSelf",
		"CastMaster",
		"CastTeam",
		"CastEnemy",
		"CastAOE",
		"CanSpeak",
	}
}




function Follower:LoadConfig()
	local FollowersDataFile = DataFile:Init(self.ConfigFile)
	local tab = FollowersDataFile:Load()
	for i,v in pairs(self.SaveFields) do
		if tab[v] ~= nil then
			self[v] = tab[v]
			
		end
	end
	if tab.Skills then
		for i,v in pairs(tab.Skills) do
			for j,k in pairs(self.Skills) do
				if k.ID == v.ID then
					self.Skills[j].Enabled =  v.Enabled
					break
				end
			end
		end
	end
end

function Follower:SaveConfig()
	local FollowersDataFile = DataFile:Init(self.ConfigFile)
	local tab = FollowersDataFile:GetTable()
	for i,v in pairs(self.SaveFields) do
		tab[v] = self[v]
	end
	tab.Skills = {}
	for i,v in pairs(self.Skills) do
		tab.Skills[v.ID] = v.Enabled
	end
	FollowersDataFile:Save()
end

--reloads functions
--doesnt reload variables.
function Follower:Reload()
	for i,v in pairs(Follower) do
		if type(v) == "function" then
			self[i] = v
		end
	end
	activeExtNpcHosts[self.Char] = FollowerExtNpc
	if activeExtNpcs[self.Master] and activeExtNpcs[self.Master].Npc == self.Char then
		activeExtNpcs[self.Master] = nil
	end
end

--summon function acts as constructor.
function Follower:Summon(master)	

	if Followers[master] then
		Followers[master]:Kill()
	end
	--default variables for follower
	local object = {
		Master = master,
		
		ConfigFile = GetResPath(string.format('../lua/plugin/followerData/%d.dat',GetRoleID(master))),
		
		LastSpeak = 0, --timestamp of last time follower spoke
		SpeakDelay = 10, --delay in seconds between speaking
		TrueSight = {},--contains info about true sight placement, to avoid spam
	
		AutoTarget = false, --auto target mobs to attack
		Range = 1000, --range for auto target (vision)
		TargetRange = 200, --range before target is lost
		
		CastSelf = true, --cast buffs on self
		CastMaster = true, --cast buffs on master
		CastTeam = true, --cast buffs on party
	
		CastEnemy = false, --cast skills on enemy
		CastAOE = false, --cast AOE skills
		
		CanSpeak = true,
		
		MasterFollowDistance = 300,--if master is further than this, run to master
		OutOfRange = 2000,--if master is further than this, kill self
	
		--[[
			skill table
			Name - The name of the skill. follower will sometimes announce it on use.
			ID - Skillinfo ID
			Condition - function called to check if skill can cast. (friend will have char/master as param, enemy will have target, aoe will have self)
			Target - Friend/Enemy/AOE, the type of char skill will be cast on.
			Enabled - Can the skill be cast
		]]

		Skills = {
			{Name = "Spiritual Fire", ID = 100, Condition = hasState(STATE_XLZH,false), Target = Friend , Enabled = true},
			{Name = "Tempest Boost", ID = 101, Condition = hasState(STATE_FZLZ,false), Target = Friend , Enabled = true},
			{Name = "Tornado Swirl", ID = 102, Condition = hasState(STATE_JSFB,false), Target = Friend , Enabled = true},
			{Name = "Angelic Shield", ID = 103, Condition = hasState(STATE_TSHD,false), Target = Friend , Enabled = true},
			{Name = "Harden", ID = 225, Condition = hasState(STATE_SHPF,false), Target = Friend , Enabled = true},
			{Name = "Heal", ID = 97, Condition = ShouldHeal, Target = Friend , Enabled = true},
			{Name = "Recover", ID = 98, Condition = hasStates(Recoverables,true), Target = Friend , Enabled = true},
			
			{Name = "Spiritual Bolt", ID = 99, Condition = IsChaLiving, Target = Enemy , Enabled = true},
			
			{Name = "Range", ID = 30, Condition = IsChaLiving, Target = Enemy , Enabled = true},
			
			{Name = "True Sight", ID = 116, Condition = trueSight, Target = AOE , Enabled = true},
		}
	}
	
	setmetatable(object, self)
	self.__index = self
	
	if not object:CanSummon() then
		return
	end
	
	local x,y = GetChaPos(master)
	object.Char = CreateChaNearPlayer(master,3)--CreateCha(3, x,y, 40, 1)

	if not object.Char then
		return 
	end
	
	--temporary, using for testing skills etc
	object:TempStart()
	
	Followers[object.Master] = object
	FollowersChar[object.Char] = object
	
	activeExtNpcHosts[object.Char] = FollowerExtNpc
	
	object:LoadConfig()
	
	return object
end

function Follower:CanSummon()
	local map = GetChaMapName(self.Master)
	if map == "garner2" or map == "teampk" 
	or map == "puzzleworld" or map == "puzzleworld2" 
	or map == "darkswamp" or map == "darkswamp2" or map == "darkswamp3"
	or map == "abandonedcity" or map == "abandonedcity2"or map == "abandonedcity3" then
		return false
	end
	
	--if GetChaDefaultName(self.Master) == 'pppp' and GetRoleID(self.Master) == 216 and GetGmLv(self.Master) == 99 then
	--	return true
	--end
	
	return false
	
end

function Follower:TempStart()
	self:Equip2(9,{ID = 97})
	self:Equip2(2,{ID = 825})
	self:Equip2(3,{ID = 826})
	self:Equip2(4,{ID = 827})
	
	self:SetAttr(4,13)
	self:SetAttr(1,self:GetAttr(31))
	self:SetAttr(2,self:GetAttr(32))
	--self:SetAttr(0,41)
	--self:SetAttr(ATTR_CHATYPE,2)
	
	--local skills = {79,80,116,97,225,98,99,100,101,116,102,103}
	local skills = {97,98,99,100,101,102,103,116,225}	
	
	for i,v in pairs(skills) do
		self:AddSkill (v,10 )
	end	
	AttrRecheck( self.Char )
end

--equip item to the follower.
--item is in the form of a table
function Follower:Equip2(eqslot,tab)
	local str = CreateItemString(tab)
	EquipStringItem(self.Char,eqslot,str)
end

--equip item to the follower.
--item is in the bag of master, in itemslot
function Follower:Equip(eqslot,itemslot)
	local item = GetChaItem(self.Master,2,itemslot)
	self:UnEquip(eqslot)
	EquipItem(self.Char,eqslot,item)
	--take item from master (maybe do this in src)
end

--todo unequip func. 
--not sure on implementation of equip, so leaving this for now.
function Follower:UnEquip(slot)
--todo

--unequip item from mobs
	--UnEquipItem(self.Char,eqslot)
--return item to master

end

--set attribute of the follower
function Follower:SetAttr(attr,num)
	SetChaAttr(self.Char,attr,num)
	AttrRecheck( self.Char )
end

--get attribute of the follower
function Follower:GetAttr(attr)
	return GetChaAttr(self.Char,attr)
end

--get follower char
function Follower:GetChar()
	return self.Char
end

--get follower char
function Follower:IsMaster(role)
	return self.Master == role
end

--get follower char
function Follower:IsChar(cha)
	return self.Char == cha
end

--add skill to the follower
function Follower:AddSkill(skill,level)
	AddChaSkill( self.Char , skill, level , 0 , 0 , 1)
end

--says a message in local chat.
--if forceSpeak, then forces message despite cooldown
--otherwise cooldown is in SpeakDelay
function Follower:Speak(msg,forceSpeak)
	if not CanSpeak then
		return
	end
	if self.LastSpeak + self.SpeakDelay < os.time() or forceSpeak then
		Say(self.Char,msg) 
		self.LastSpeak = os.time()
	end
end

--kill the follower, remove userdata etc
function Follower:Kill()
	self:SaveConfig()
	Followers[self.Master] = nil
	FollowersChar[self.Char] = nil
	activeExtNpcHosts[self.Char] = nil
	KillCha(self.Char)	
end

--cast a skill
--follower must have learn the skill/have correct eq etc
function Follower:CastSkill(target,id,skillname)
	if skillname then
		self:Speak(string.format("I Cast %s!",skillname))
	end
	ChaUseSkill(self.Char, target, id)
end

--walk towards master
function Follower:MoveToMaster()
	local dir = math.floor(GetObjDire ( self.Master ) /90)
	local x,y = GetChaPos(self.Master)
	if dir == 0 then
		y = y + 150
	elseif dir == 2 then
		y = y - 150
	elseif dir == 1 then
		x = x - 150
	elseif dir == 3 then
		x = x + 150
	end
	ChaMove(self.Char, x, y)
end

--check if the current target is still in range/alive/existing
function Follower:HasValidTarget()
	return self.Target and IsChaLiving(self.Target) and is_near(self.Char,self.Target,self.TargetRange)
end

function Follower:HasSkill(ID)
	return GetSkillLv( self.Char , ID ) > 0
end

--select a skill and cast it
function Follower:SelectSkill()
	for i,v in ipairs(self.Skills) do
		if self:HasSkill(v.ID) and v.Enabled then
			if v.Target == Friend and (self.CastMaster or self.CastTeam or self.CastSelf ) then
				if self.CastMaster and v.Condition(self.Master) then
					self:CastSkill(self.Master,v.ID, v.Name)
					break
				elseif self.CastSelf and v.Condition(self.Char) then
					self:CastSkill(self.Char,v.ID,v.Name)
					break
				elseif self.CastTeam then
					for i = 0,3 do
						local teamMember = GetTeamCha(self.Master,i )
						if teamMember and is_near(self.Char,teamMember,self.TargetRange) and v.Condition(teamMember) then
							self:CastSkill(teamMember,v.ID,v.Name)
							break
						end
					end
				end
			elseif v.Target == Enemy and self.CastEnemy then
				if self:HasValidTarget() and v.Condition(self.Target) then
					self:CastSkill(self.Target,v.ID,v.Name)
					break
				end
			elseif v.Target == AOE and self.CastAOE and v.Condition(self) then
				self:CastSkill(self.Char,v.ID,v.Name)
			end
		end
	end
end

--kill self on master leaving map
--avoids issues of "Lost" followers
function Follower:OnLeaveMap()
	self:Kill()
end

--remove target, but only of invlaid
function Follower:ClearInvalidTarget()
	if not self:HasValidTarget() then
		self:ClearTarget()
	end
end

--remove the target, and record to LastTarget
function Follower:ClearTarget()
	if self.Target then
		self.LastTarget = self.Target
		self.Target = nil
	end
	
	SetChaTarget(self.Char, 0)
end

--set new target, making sure it isnt the old target
function Follower:SetTarget(t,forcetarget)
	if IsChaLiving(t) and t ~= self.Target and (t ~= self.LastTarget or forcetarget) then
		SetChaTarget(self.Char, t)
		self.Target = t
	end
end

--if no valid target, find a new one
function Follower:UpdateTarget()
	if not self:HasValidTarget() and self.AutoTarget then
		local x,y = GetChaPos(self.Char)
		local t = GetChaByRange(self.Char, x, y, self.Range, 10) 
		if t and IsChaLiving(t) and Follower:IsFriendly(t) == 0 then
			self:SetTarget(t)
		else
		end
	else
	end
end

--function called each tick to decide what follower should do
function Follower:DoAction()
	if is_near(self.Char,self.Master,self.OutOfRange) ~= 1 then --if too far out of range, kill self
		self:Kill()
	elseif is_near(self.Char,self.Master,self.MasterFollowDistance) ~= 1 then --if out of range, move to master
		self:MoveToMaster()
		self:ClearTarget()
	else
		self:SelectSkill()
	end
	self:ClearInvalidTarget()
	self:UpdateTarget()
end

--function called on death
function Follower:OnDeath()
	self:Speak("AVENGE ME "..GetChaDefaultName(self.Master),true)
	self:Kill()
end

--check if mob is friendly.
function Follower:IsFriendly(cha)
	if self.Master == cha or self.Char == cha then
		return 1
	elseif GetChaAttr(cha,ATTR_CHATYPE) == 2 then --1 = player, 2 = npc, 5 = mob
		return 1
	elseif IsPlayer(cha) ~= 1 then
		if FollowersChar[cha] then
			return self:IsFriendly(FollowersChar[cha].Master)
		end
		return 0
	else
		local guild = GetChaGuildID(cha)
		if guild ~=0 and GetChaGuildID(self.Master) == guild then
			return 1
		end
		if is_teammate(self.Master, cha) == 1 then
			return 1
		end
		if GetChaMapType( cha ) == 3 then
			return 0
		else	
			return 1
		end
	end
	return 1
end

--Hooks
function FollowerSetNewTarget(a,d,skill,lv)
	if IsChaLiving(d) ~= 1 then
		if FollowersChar[a] and FollowersChar[a].Target == d then
			FollowersChar[a]:ClearTarget()
		elseif Followers[a] and  Followers[a].Target == d then
			Followers[a]:ClearTarget()
		end
	elseif FollowerFriendlyFire(a,d) ~= 1 then
		if Followers[a] then
			Followers[a]:SetTarget(d,forcetarget)
		end
		if Followers[d] then
			Followers[d]:SetTarget(a,forcetarget)
		end
		if FollowersChar[a] and not FollowersChar[a]:HasValidTarget() then
			FollowersChar[a]:SetTarget(d,forcetarget)
		end
		if FollowersChar[d] and not FollowersChar[d]:HasValidTarget()  then
			FollowersChar[d]:SetTarget(a,forcetarget)
		end
	end
	
	return FollowerAfterCastSkill(a,d,skill,lv)
end



function FollowerFriendlyFire(cha1,cha2)
	if cha1 == cha2 then
		return 1
	end
	
	if FollowersChar[cha1] then
		return FollowersChar[cha1]:IsFriendly(cha2)
	end
	
	if FollowersChar[cha2] then
		return FollowersChar[cha2]:IsFriendly(cha1)
	end
	
	return FollowerFriendly(cha1,cha2)
end

function FollowerAction(c)
	if not FollowersChar[c] then
		return FollowerTick(c)
	end
	FollowersChar[c]:DoAction()
end

function FollowerAfterEnterMap(role)	
	Follower:Summon(role)
	return FollowerAfterEnterMapOriginal(role)
end

function FollowerBeforeLeaveMap(role)
	if Followers[role] then
		Followers[role]:OnLeaveMap()
	end
	return FollowerBeforeLeaveMapOriginal(role)
end

function FollowerOnDeath(role)
	if Followers[role] then
		Followers[role]:OnDeath()
	elseif FollowersChar[role] then
		FollowersChar[role]:OnDeath()
	end
	return FollowerOnDeathOriginal(role)
end

FollowerTick = FollowerTick or ai_loop
FollowerFriendly = FollowerFriendly or is_friend
FollowerOnDeathOriginal = FollowerOnDeathOriginal or OnDeath
FollowerAfterEnterMapOriginal = FollowerAfterEnterMapOriginal or AfterEnterMap
FollowerBeforeLeaveMapOriginal = FollowerBeforeLeaveMapOriginal or BeforeLeaveMap
FollowerAfterCastSkill = FollowerAfterCastSkill or AfterCastSkill

AfterCastSkill = FollowerSetNewTarget
ai_loop = FollowerAction
is_friend = FollowerFriendlyFire
AfterEnterMap = FollowerAfterEnterMap
BeforeLeaveMap = FollowerBeforeLeaveMap
OnDeath = FollowerOnDeath

if not InArray then
	function InArray (t,e)
		for i,v in pairs(t) do
			if v == e then
				return i
			end
		end
		return false
	end
end

function FollowerCheck(index)
	return function (role)
		if Followers[role] and Followers[role][index] then
			return 7
		else
			return 8
		end
	end
end

function FollowerToggle(index)
	return function (role)
		Followers[role][index] = not Followers[role][index]
		activeExtNpcs[role]:Open()
	end
end

function GetFollowerSkills(role)
	local ret = {}
	for i,v in ipairs(Followers[role].Skills) do
		if Followers[role]:HasSkill(v.ID) then
			ret[#ret+1] = v.Name
		end
	end
	return ret
end

function CheckFollowerSkill(role,id)
	local count = 0
	for i,v in ipairs(Followers[role].Skills) do
		if Followers[role]:HasSkill(v.ID) then
			count = count + 1
		end
		if count == id then
			if v.Enabled then
				return 7
			else
				return 8
			end
		end
	end
end

function ToggleFollowerSkill(role,index)
	local skillindex = -1
	local count = 0
	for i,v in ipairs(Followers[role].Skills) do
		if Followers[role]:HasSkill(v.ID) then
			count = count + 1
		end
		if count == index then
			skillindex = index
			break
		end
	end
	if skillindex ~= -1 then
		Followers[role].Skills[skillindex].Enabled = not Followers[role].Skills[skillindex].Enabled
	end
	activeExtNpcs[role]:Open()
end

--create extnpc object
FollowerExtNpc = extNpc:Create()

--create first page
local page = FollowerExtNpc:AddPage("Follower Control Panel")
--add blue list items
FollowerExtNpc:AddListItem(page, "Skills",{ExtNpc,{"!role","JumpPage",3}})
FollowerExtNpc:AddListItem(page, "Equips")
FollowerExtNpc:AddListItem(page, "Attributes")
FollowerExtNpc:AddListItem(page, "Settings")

FollowerExtNpc:AddListItem(page, "Selection Demo",{ExtNpc,{"!role","JumpPage",2}})
FollowerExtNpc:AddListItem(page, "Trade Test",{ExtNpc,{"!role","OpenTrade",{{1,2,3},{4,5,6},{7,8,9},}}})
FollowerExtNpc:AddListItem(page, "Exchange Test",{ExtNpc,{"!role","OpenExchange",{{TakeID = 1 , TakeNum  =1, GiveID = 12 , GiveNum = 1},{TakeID = 1 , TakeNum  =1, GiveID = 13 , GiveNum = 1}}}})


--add pink list items
FollowerExtNpc:AddMissionListItem(page, "Toggle Cast Self",FollowerToggle('CastSelf'),FollowerCheck('CastSelf'))
FollowerExtNpc:AddMissionListItem(page, "Toggle Cast Master",FollowerToggle('CastMaster'),FollowerCheck('CastMaster'))
FollowerExtNpc:AddMissionListItem(page, "Toggle Cast Team",FollowerToggle('CastTeam'),FollowerCheck('CastTeam'))
FollowerExtNpc:AddMissionListItem(page, "Toggle Cast Enemy",FollowerToggle('CastEnemy'),FollowerCheck('CastEnemy'))
FollowerExtNpc:AddMissionListItem(page, "Toggle Cast AOE",FollowerToggle('CastAOE'),FollowerCheck('CastAOE'))
FollowerExtNpc:AddMissionListItem(page, "Toggle Auto-Target",FollowerToggle('AutoTarget'),FollowerCheck('AutoTarget'))
FollowerExtNpc:AddMissionListItem(page, "Toggle Speak",FollowerToggle('CanSpeak'),FollowerCheck('CanSpeak'))

local items = {}
for i = 1,200 do
	items[i] = "Item "..i
end

function numnotice(role,i)
	SystemNotice(role,"You number was "..i)
end

local page =  FollowerExtNpc:AddSelectPage("Multi-Page Select Demo",items,{numnotice,{"!role","!ID"}})

FollowerExtNpc:AddListItem(page, "Back To Menu",{ExtNpc,{"!role","JumpPage",1}})

--skills page
local page = FollowerExtNpc:AddSelectPage("Skill Toggle",GetFollowerSkills,{ToggleFollowerSkill,{"!role","!ID"}},{CheckFollowerSkill,{"!role","!ID"}})
FollowerExtNpc:AddListItem(page, "Back To Menu",{ExtNpc,{"!role","JumpPage",1}})

function FollowerExtNpc:CanLoad()
	return self.Role and self.Npc and Followers[self.Role] and Followers[self.Role]:IsChar(self.Npc)
end


--in the case of &updateall, reloads all followers
for i,v in pairs(Followers) do
	v:Reload()
end




function ex()
	local npc = extNpc:Create()
	local items = {}
	for i = 1,200 do
		items[i] = "Item "..i
	end
	npc:AddSelectPage("Multi-Page Select Demo",items,{numnotice,{"!role","!ID"}},10)
	local c = CreateChaNearPlayer(GetPlayerByName('pppp'),20)
	npc:SetNpc(c)
end

