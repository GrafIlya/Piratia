--[[
	New pet system, using extNpc
		ALL NUMBERS ARE TEMPORARY.

	Max pet level is 10.("normal" fairy)
	Max pet level for 2nd gen is 25. (fairy of stats)
	Max pet level for 3rd gen is 50. (evil/darkness)
	Fairy marriage 
		Requires items same as on official.
		Requires pet to be max level.
		Demonic fruits would be replaced with other maze drops.
		After marriage, fairy is reset (becomes lv0, no stat, no skill, etc)
			
	Pet levels up by killing mobs, not just by AFKing.
	Required exp increases with level.
	Mob must be 2x the pets level to give it exp.
	1 exp per mob, plus 1 exp for every 10 levels higher the mob is than 2x the fairys level.
		eg lv0 fairy, lv1 mob = 1exp
		lv0 fairy, lv20 mob = 2 exp
		lv0 fairy, lv40 mob = 4 exp
		lv10 fairy, lv30 mob = 2 exp.
		lv15 fairy, lv30 mob = 1 exp
	Fruit of growth (mall item) doubles exp gain.
	Stat Fruits are no longer required, GUI for assigning stats.
		Fruits can be used to level up without needing exp, and give that stat.
		First few (10?) levels 100%, after that high fail chance.
		Only normal fruits, not gr8.
		Mall only.
	Skills TBD, but likely reworked
		unlock based on amount of a stat (5/10/20/35/50)
		Also unlocked based on fairy level
			So generic skill every X levels, and specialised every X amount of a stat.
		Most likely only skills applied to player, not on other players.
			eg no attacks.
	Fairy rations no longer required, stamina is now sp for fairy skills
		Rations still restore stamina, think of them like hp pots.
		This lets us put rations only in mall without annoying people.
		Stamina (slowly) restores over time.
	Skills can be toggled on/off in menu.
		eg turn on buff, costs 1 stamina a second.
	Some skills are use skills.
		eg click it in menu, costs 100 stamina, heals player slightly
	Stamina increases linearly per level
		
	Removed fairy poss - currently there is no reason to not be on poss
		Due to rations being worthless (if they are worth something benefits mall too much)
		Therefor remove
	Remove/rework self destruct

	Fairy can be 110%, as a normal equip.
		Only applied to the stats added, not to skills, exp etc.
	Fairy apparel exists, changes appearance.
	
	Mall items:
		Fruit of Growth: 2x fairy exp rate
		Reset books: remove str/acc/agi/con/spr so they can be put on different stat
		Fairy ration: restores fairy stamina
		Fairy Apparels: MJR, AJR, august pet etc, instead of being OP fairy is just apparel
		lv0 2nd gen pets
		Pet Fruits: Level up without exp, but fail chance is high (higher than pet leveling on official)
	


]]

--[[

	Fairy skill explanation:


	Name = "STR Skill 1", --The name shown in menu
	RequiredStat = 26, --the stat (str/agi etc) required to unlock the skill
	RequiredNum = 5, --number the stat has to be at/above to unlock skill (eg, requires 5 str)
	Type = "Toggle", --"Toggle" or "Use" , toggle is like ES, turns on/off with constant cost, "Use" is like berserk or heal, one time usage.
	State = 501, --state that gets added to player (can be left nil)
	StateTime = 10,--time of state that gets added to player (can be left nil, then will be infinate)
	StateLv = 1,--level of state that gets added to player (can be left nil, then will be 1)
	StartFunc = nil, --function that gets ran on skill cast (can be left nil)
	EndFunc = nil, --function that gets ran on skill end (can be left nil) (only for toggles)
	Cost = 5, -- mana cost on fairy. if "Use" type then only on cast, if "Toggle" then every second.

]]

if true then
	return --not using this system.
end
FairyObj = {
	Exp = ITEMATTR_ENERGY,
	MaxExp = ITEMATTR_MAXENERGY,
	Mana = ITEMATTR_URE,
	MaxMana = ITEMATTR_MAXURE,
	Level = ITEMATTR_FORGE,

	DoubleExpState = 500,

	ExpPerLevel = 500,
	ManaPerLevel = 50,

	MaxLevels = {
		--1st gen
		[191] = 10,--love
		[190] = 10,--woe
		[189] = 10,--hope
		[188] = 10,--valor
		[187] = 10,--faith
		[186] = 10,--kudos
		[185] = 10,--virtue
		[184] = 10,--darkness
		[183] = 10,--life
		--2nd gen
		[232] = 25,--str
		[233] = 25,--con
		[234] = 25,--spr
		[235] = 25,--acc
		[236] = 25,--agi
		--3rd gen
		[237] = 50,--evil
		[231] = 50,--luck
	},

	Skills = {
		{
			Name = "Generic Skill 1",
			RequiredStat = 55,
			RequiredNum = 5,
			Type = "Toggle",
			State = STATE_KB,
			StateTime = nil,
			StateLv = 1,
			StartFunc = nil,
			EndFunc = nil,
			Cost = 5,
		},
		
		{
			Name = "STR Skill 1",
			RequiredStat = 26,
			RequiredNum = 5,
			Type = "Toggle",
			State = STATE_KB,
			StateTime = nil,
			StateLv = 1,
			StartFunc = nil,
			EndFunc = nil,
			Cost = 5,
		},

		{
			Name = "STR Skill 2",
			RequiredStat = 26,
			RequiredNum = 10,
			Type = "Toggle",
			State = 502,
			StateTime = nil,
			StateLv = 1,
			StartFunc = nil,
			EndFunc = nil,
			Cost = 15,
		},
	},
}

function FairyObj:Create(role)
	--local item = GetEquipItemP(role,PET_SLOT)
	local item = GetChaItem(role,2,1)
	if GetItemType(item) ~= 59 then
		return false
	end
	local object = {
		Fairy = item,
		Role = role,
	}
	setmetatable(object, self)
	self.__index = self
	return object
end

function FairyObj:GetSkills()
	local skills = {}
	for i,v in pairs(self.Skills) do
		if self:GetAttribute(v.RequiredStat) >= v.RequiredNum then
			skills[#skills+1] = v
			skills[#skills].ID = i
		end
	end
	return skills
end

function FairyObj:DisableSkill(id)
	local skill = self.Skills[id]
	if skill.Type ~= "Toggle" then
		return
	end
	if skill.State then
		if GetChaStateLv(self.Role,skill.State) ~= 0 then
			RemoveState(self.Role,skill.State)
		end
	end
	if skill.EndFunc then
		skill.EndFunc(self.Role)
	end
end

function FairyObj:UseSkill(id)
	local skill = self.Skills[id]
	if skill.Type == "Toggle" and skill.State and GetChaStateLv(self.Role,skill.State) ~= 0 then
		self:DisableSkill(id)
		return
	end
	if skill.Cost <= self:GetMana() then
		self:ReduceMana(skill.Cost)
		if skill.State then
			AddState(self.Role,self.Role,skill.State,skill.StateLv or 1, skill.StateTime or -1)
		end
		if skill.StartFunc then
			skill.StartFunc(self.Role)
		end
	end
end

function FairyObj:ReduceMana(mana)
	self:SetAttribute(self.Mana,self:GetAttribute(self.Mana)-mana)
end

function FairyObj:Refresh()
	SynChaKitbag( self.Role, 4 )
	SynChaKitbag( self.Role, 13 )
end

function FairyObj:GetStatPoints()
	return self:GetLevel() - self:GetAttribute(26)
	- self:GetAttribute(27)- self:GetAttribute(28)
	- self:GetAttribute(29)- self:GetAttribute(30)
end

function FairyObj:IsMaxLevel()
	local maxLevel = self.MaxLevels[GetItemID(self.Fairy)]
	if not maxLevel then
		return true
	end
	return maxLevel <= self:GetLevel()
end

function FairyObj:IncrementAttribute(stat,inc)
	if not inc then
		inc = 1
	end
	self:SetAttribute(stat,self:GetAttribute(stat)+inc)
end

function FairyObj:AddStat(stat)
	if self:GetStatPoints() < 1 or self:IsMaxLevel() then
		return false
	end
	AddItemEffect(self.Role , self.Fairy , 0  )
	self:IncrementAttribute(stat,1)	
	ResetItemFinalAttr(self.Fairy)
	AddItemEffect(self.Role , self.Fairy , 1  )
	ALLExAttrSet ( self.Role ) 
end

function FairyObj:SetAttribute(attr,num)
	SetItemAttr(self.Fairy,attr,num)
	self:Refresh()
end

function FairyObj:GetAttribute(attr)
	return GetItemAttr(self.Fairy,attr)
end

function FairyObj:SetLevel(num)
	self:SetAttribute(self.Level,num)
end

function FairyObj:GetLevel()
	return self:GetAttribute(self.Level)
end

function FairyObj:SetExp(num)
	self:SetAttribute(self.Exp,num)
end

function FairyObj:GetExp()
	return self:GetAttribute(self.Exp)
end

function FairyObj:SetMaxExp(num)
	self:SetAttribute(self.MaxExp,num)
end

function FairyObj:GetMaxExp()
	return self:GetAttribute(self.MaxExp)
end

function FairyObj:SetMana(num)
	self:SetAttribute(self.Mana,num)
end

function FairyObj:GetMana()
	return self:GetAttribute(self.Mana)
end

function FairyObj:SetMaxMana(num)
	self:SetAttribute(self.MaxMana,num)
end

function FairyObj:GetMaxMana()
	return self:GetAttribute(self.MaxMana)
end

function FairyObj:CalcExpGain(mob)
	if IsPlayer(mob) == 1 then
		return 0
	end
	local Lv = GetChaAttr(mob,ATTR_LV)
	local PetLv = self:GetLevel()
	if Lv < 2*PetLv then
		return 0
	end
	local exp = 1 + math.floor((Lv-(2*PetLv))/10)
	if GetChaStateLv(self.Role,self.DoubleExpState)>0 then
		exp = exp*2
	end
	return exp
end

function FairyObj:AddExp(num)
	if num < 1 then
		return false
	end
	local exptotal = self:GetExp() + num
	local maxexp = self:GetMaxExp()
	if exptotal >= maxexp then
		exptotal = exptotal - maxexp
		self:LevelUp()
		self:AddExp(exptotal)
	else
		self:SetExp(exptotal)
	end
	return true
end

function FairyObj:LevelUp()
	self:SetLevel(self:GetLevel()+1)
	self:SetExp(0)
	self:SetMaxExp(self:GetLevel() * self.ExpPerLevel)

	self:SetMaxMana(self:GetLevel() * self.ManaPerLevel)
	self:SetMana(self:GetMaxMana())
end

function FairyObj:Open()
	createExtNpcSession(self.Role,PetNpc,self.Role)
end

--Hooks

--hook on killing a mob
ShareTeamExpFairyHook = ShareTeamExpFairyHook or ShareTeamExp
function ShareTeamExp(dead , team_atker , dead_exp , role)
	local fairy = FairyObj:Create(role)
	if fairy then
		local expGain = fairy:CalcExpGain(dead)
		if fairy:AddExp(expGain) then
			SystemNotice(role,string.format("Fairy gained %d EXP.",expGain))
		end
	end
	ShareTeamExpFairyHook(dead , team_atker , dead_exp , role)
end

--NPC

function UpgradeStat(role,stat)
	local fairy = FairyObj:Create(role)
	if fairy then
		fairy:AddStat(stat)
		activeExtNpcs[role]:Open()
	end
end

function FairyAttributesTitle(role)
	local fairy = FairyObj:Create(role)
	if fairy then
		return string.format("You have %d points to upgrade the fairy.",fairy:GetStatPoints())
	else
		return "error"
	end
end

function GetPetSkills(role)
	local fairy = FairyObj:Create(role)
	if fairy then
		local skills = {}
		for i,v in ipairs(fairy:GetSkills()) do
			skills[#skills+1] = v.Name
		end
		return skills
	else
		return {}
	end
end

function CheckPetSkill(role,id)
	local fairy = FairyObj:Create(role)
	if not fairy then 
		return 0
	end
	local skills = fairy:GetSkills()
	local skill = skills[id]
	
	if skill.Type == "Use" then
		if fairy:GetMana() < skill.Cost then
			return 10
		else
			return 0
		end
	elseif skill.Type == "Toggle" then
		if GetChaStateLv(role,skill.State) == skill.StateLv then
			return 7
		else
			return 8
		end
	end
	return 0
end

function UsePetSkill(role,id)
	local fairy = FairyObj:Create(role)
	if not fairy then 
		return 
	end
	local skills = fairy:GetSkills()
	fairy:UseSkill(skills[id].ID)
	activeExtNpcs[role]:Open()
end




PetNpc = extNpc:Create()
local landingPage = PetNpc:AddPage('Pet Menu')
local statsPage = PetNpc:AddPage(FairyAttributesTitle)
local skillsPage = PetNpc:AddSelectPage("Pet Skills",GetPetSkills,{UsePetSkill,{"!role","!ID"}},{CheckPetSkill,{"!role","!ID"}})

PetNpc:AddListItem(landingPage, "Attributes", {ExtNpc,{"!role","JumpPage",statsPage}})
PetNpc:AddListItem(landingPage, "Skills", {ExtNpc,{"!role","JumpPage",skillsPage}})

--stat upgrade page.
PetNpc:AddListItem(statsPage, "Upgrade STR", {UpgradeStat,{"!role",26}})
PetNpc:AddListItem(statsPage, "Upgrade ACC", {UpgradeStat,{"!role",27}})
PetNpc:AddListItem(statsPage, "Upgrade AGI", {UpgradeStat,{"!role",28}})
PetNpc:AddListItem(statsPage, "Upgrade CON", {UpgradeStat,{"!role",29}})
PetNpc:AddListItem(statsPage, "Upgrade SPR", {UpgradeStat,{"!role",30}})
PetNpc:AddListItem(statsPage, "Back", {ExtNpc,{"!role","JumpPage",landingPage}})








