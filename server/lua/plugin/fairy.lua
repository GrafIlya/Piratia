-- Credits: Angelix@pkodev.net, kong@pkodev.net

--Made slightly less terrible and converted to use pet equip slot by Billy

local ext = {}
ext.name = 'fairy.lua'
----------------------------------------------------------
-- ✓ table for fairy level up rate
-- ✓ variable for max Fairy level
-- ✓ max fairy lv50
-- ✓ lv46+ consumes great rations
-- ✓ lv40+ consumes improved fruits to level up
-- ✓ regular rations cannot be fed to angela/jr
-- ✓ normal/great fruits cannot be fed to angela/jr (only improved)
-- ✓ rations cannot be fed to fairys "level limit"+1
-- ✓ autoration will not work on angela/jr
-- ✓ all second gen pet have x2 drop/exp (variable to enable)
-- ✓ angela jr have red possession
-- ✓ Fix fairy possesion cooldown time
-- ✓ added top2 rations
-- ✓ added top2 fruits
-- ✓ expert fairy poss should consume less rations than novice
-- ✓ added top2 fruit of growth {6838,6839}
-- ✓ Lv5 and above fairies will start producing fcoins
-- ✓ Option to disable F.Coins
-- ✓ 2nd gen fairy gains x2 less exp
-- ✓ marriage configurations
-- ✓ can no longer downgrade fairy skill
-- ✓ new algorithm to add fairy skills (currently deletes other)
-- ✓ fixed all expert fairy skills (medi in resume function)
-- TODO -> new fairy skill book {one that does x1.5 magic damage on mobs, one that increase hitrate?;TBD}
-- remove mordo from fairy box
----------------------------------------------------------
print('Loading '..ext.name);
pkoLG = pkoLG or print

----------------------------------------------------------
-- CONFIGURATIONS:
----------------------------------------------------------
ELEEXP_GETRAD = 1		--> fairy exp rate
ELELFC_GETRAD = 1		--> fairy coin rate

local ELELFC_GETRAD = ELELFC_GETRAD

elf = elf or {}

	elf.conf	= {
		normal	= 40,	--> max level of fairy
		upgrade	= 46,	--> max level when regular ration no longer usable
		max		= 50	--> max level of fairy with improved fruits
	}
	elf.fairyId	= {
		mordo	= 0680,
		mordojr	= 0681,
		angela	= 7125,
		angelajr= 7126,
	}
	elf.specialFairy = { elf.fairyId['angela'], elf.fairyId['angelajr'] }
	elf.secondFairy = { 0231, 0232, 0233, 0234, 0235, 0236, 0237, 0680, 0681, 7125, 7126 }

	elf.LuckExpToAll = false;	--> if true, all 2nd gen receive x2 exp/drop when poss
	elf.minFairyCoin = 0;		--> lowest fairy lv to start receiving fairy coins
	elf.minToPossess = 100;		--> minimum stamina to poss
	elf.consumeStamP = true	--> if true, when poss fairy will drop stamina
	elf.minFLvToPoss = 5;		--> minimum level for fairy to use poss
	elf.disableFCoin = true		--> if true, disable Fairy producing F Coins

	elf.marriage = {}
	elf.hook = { tick = cha_timer }
	elf.growth = {}

----------------------------------------------------------
-- TIMER:
----------------------------------------------------------
function cha_timer(role, freq, time)
	elf.hook['tick'](role, freq, time)
	local tick = GetChaParam(role, 1)
	elf.timer(role, tick)
end

elf.timer = function(cha, tick)
	local fairyFreq = 60
	local fairy = GetEquipItemP(cha,16)--GetChaItem(cha, 2, 1)
	local fairyType = GetItemType(fairy)
	local playerAlive = -1
	
	local fairyId = GetItemID(fairy)
	if fairyId ~= 0 then
		if fairyType == 59 then
			local fairyLv = GetFairyLevel(fairy)
			if fairyLv > 27 then
				fairyFreq = fairyFreq + (fairyLv - 27) * 5
			end
			-- 2nd gen .5 growth rate
			if IsSecondGen(cha, fairy) then
				fairyFreq = fairyFreq * 2
			end
		end
		local fairyCycle = math.mod(tick, fairyFreq) == 0 and tick > 0
		if fairyCycle then
			if playerAlive == -1 then
				playerAlive = IsChaLiving(cha)
			end
			
			if playerAlive == 1 then
				if fairyType == 59 then
					Auto_Ration(cha, fairy)
					Take_ElfURE(cha, fairy)
					Give_ElfEXP(cha, fairy)
					--if not elf.disableFCoin then
						--Give_FCoins(cha, fairy)
					--end
				end
			end
		end
	end
end

----------------------------------------------------------
-- RATIONS:
----------------------------------------------------------
elf.ration = {}

	elf.ration[0227]	= {
		stam			= 50,
		prohibit		= elf.specialFairy,
		max				= elf.conf['upgrade'],
	}
	-- auto ration
	elf.ration[2312]	= {
		stam			= 50,
		prohibit		= elf.specialFairy,
		max				= elf.conf['upgrade'],
		auto			= 1,
	}
	-- petfood
	elf.ration[3152]	= {
		stam			= 5,
		prohibit		= elf.specialFairy,
		max				= elf.conf['upgrade'],
	}
	-- great fairy ration
	--elf.ration[5644]	= {
	--	stam			= 100,
	--	prohibit		= {},
	--	max				= elf.conf['max'],
	--}
	---- great auto ration
	--elf.ration[5645]	= {
	--	stam			= 100,
	--	prohibit		= {},
	--	max				= elf.conf['max'],
	--	auto			= 1,
	--}
	---- Fine Fairy Ration
	--elf.ration[6015]	= {
	--	stam			= 50,
	--	prohibit		= elf.specialFairy,
	--	max				= 3,
	--}
	---- Happy Ration
	--elf.ration[6841]	= {
	--	stam			= 50,
	--	prohibit		= elf.specialFairy,
	--	max				= elf.conf['upgrade'],
	--	nodeduction		= 20 -- wont lose stamina for the next 20 minutes
	--}
	---- Super Happy Ration
	--elf.ration[6841]	= {
	--	stam			= 100,
	--	prohibit		= {},
	--	max				= elf.conf['max'],
	--	nodeduction		= 40 -- wont lose stamina for the next 40 minutes
	--}

-- ration/auto
function ItemUse_SiLiao(role, Item, Item_Traget) elf.handleRation(role, Item, Item_Traget) end
-- great rations
function ItemUse_numeneat(role, Item, Item_Traget) elf.handleRation(role, Item, Item_Traget) end
-- Fine Fairy Ration
function ItemUse_NewSiLiao(role, Item, Item_Traget) elf.handleRation(role, Item, Item_Traget) end
-- Happy Ration
function ItemUse_HappySiLiao(role, Item, Item_Traget) elf.handleRation(role, Item, Item_Traget) end
-- Super Happy Ration
function ItemUse_AdvancedHappySiLiao(role, Item, Item_Traget) elf.handleRation(role, Item, Item_Traget) end

-- Default Item function for all rations
elf.handleRation = function(role, Item, fairy)
	-- check for boat
	local fairy = GetEquipItemP(role,16)
	
	if GetCtrlBoat(role) ~= nil then
		SystemNotice(role, 'Cannot feed fairy while using boat.')
		UseItemFailed(role)
		return
	end
	-- check fairy level
	local fairyLv = GetFairyLevel(fairy)
	local fairyId = GetItemID(fairy)
	if fairyLv > elf.conf['max'] then
		Notice('System detected player '..GetChaDefaultName(role)..' with Lv '..fairyLv..' '..GetItemName(fairyId)..'!')
		UseItemFailed(role)
		return
	end
	local rationId = GetItemID(Item)
	local rationName = GetItemName(rationId)
	if elf.ration[rationId] == nil then
		SystemNotice(role, GetItemName(rationId)..' has not yet been registered! Please try again...')
		UseItemFailed(role)
		return
	end
	if table.getn(elf.ration[rationId].prohibit) ~= 0 then
		for i = 1, table.getn(elf.ration[rationId].prohibit) do
			if fairyId == elf.ration[rationId].prohibit[i] then
				BickerNotice(role, 'Unable to feed '..GetItemName(rationId)..' to '..GetItemName(fairyId)..'!')
				UseItemFailed(role)
				return
			end
		end
	end
	if fairyLv >= elf.ration[rationId].max then
		SystemNotice(role, 'Fairies above level '..elf.conf['upgrade']..' must be fed with great rations!')
		UseItemFailed(role)
		return
	end
	local stam = elf.ration[rationId].stam * 50
	if GetItemType(Item) == 57 and GetItemType(fairy) == 59 then
		if GetItemAttr(fairy, ITEMATTR_URE) < GetItemAttr(fairy, ITEMATTR_MAXURE) then
			GiveFairyStamina(role, fairy, stam)
			-- top2
			if elf.ration[rationId].nodeduction ~= nil then
				elf.data[fairy] = os.time() + (elf.ration[rationId].nodeduction * 3600)
				SystemNotice(role, GetItemName(fairyId)..' will not lose stamina for the next '..elf.ration[rationId].nodeduction..' min(s)!')
			end
		else
			SystemNotice(role, GetItemName(fairyId)..' stamina is currently full.') 
			UseItemFailed(role)
			return
		end
	end
end

----------------------------------------------------------
-- FRUITS:
----------------------------------------------------------
elf.fruit = {}

	-- snow dragon fruit
	elf.fruit[0222]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_STR
	}
	-- icespire plum
	elf.fruit[0223]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_AGI
	}
	-- Zephyr fish floss
	elf.fruit[0224]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_DEX
	}
	-- argent mango
	elf.fruit[0225]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_CON
	}
	-- shaitan biscuit
	elf.fruit[0226]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_STA
	}
	-- great snow dragon fruit
	elf.fruit[0276]		= {
		level			= 2,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_STR
	}
	-- great icespire plum
	elf.fruit[0277]		= {
		level			= 2,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_AGI
	}
	-- great Zephyr fish floss
	elf.fruit[0278]		= {
		level			= 2,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_DEX
	}
	-- great argent mango
	elf.fruit[0279]		= {
		level			= 2,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_CON
	}
	-- great shaitan biscuit
	elf.fruit[0280]		= {
		level			= 2,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_STA
	}
	-- super snow dragon fruit
	elf.fruit[6842]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_STR,
		super			= 1,	-- can be fed when growth is 50%+
	}
	-- super icespire plum
	elf.fruit[6843]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_AGI,
		super			= 1
	}
	-- super Zephyr fish floss
	elf.fruit[6844]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_DEX,
		super			= 1
	}
	-- super argent mango
	elf.fruit[6845]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_CON,
		super			= 1
	}
	-- super shaitan biscuit
	elf.fruit[6846]		= {
		level			= 1,
		max				= elf.conf['normal'],
		prohibit		= elf.specialFairy,
		stat			= ITEMATTR_VAL_STA,
		super			= 1
	}
	-- Improved Strength Fruit
	elf.fruit[7003]		= {
		level			= 1,
		max				= elf.conf['max'],
		prohibit		= {},
		stat			= ITEMATTR_VAL_STR,
	}
	-- Improved Agility Fruit
	elf.fruit[7004]		= {
		level			= 1,
		max				= elf.conf['max'],
		prohibit		= {},
		stat			= ITEMATTR_VAL_AGI,
	}
	-- Improved Accuracy Fruit
	elf.fruit[7005]		= {
		level			= 1,
		max				= elf.conf['max'],
		prohibit		= {},
		stat			= ITEMATTR_VAL_DEX,
	}
	-- Improved Constitution Fruit
	elf.fruit[7006]		= {
		level			= 1,
		max				= elf.conf['max'],
		prohibit		= {},
		stat			= ITEMATTR_VAL_CON,
		super			= 1
	}
	-- Improved Spirit Fruit
	elf.fruit[6846]		= {
		level			= 1,
		max				= elf.conf['max'],
		prohibit		= {},
		stat			= ITEMATTR_VAL_STA,
	}
----------------------------------------------------------
-- mini fruits:
-- can only be used on first generation fairies
-- can only be used to level a fairy to at most lv12
----------------------------------------------------------
	-- mini snow dragon fruit
	elf.fruit[15001]	= {
		level			= 1,
		max				= 12,
		prohibit		= elf.secondFairy,
		stat			= ITEMATTR_VAL_STR,
	}
	-- mini icespire plum
	elf.fruit[15002]	= {
		level			= 1,
		max				= 12,
		prohibit		= elf.secondFairy,
		stat			= ITEMATTR_VAL_AGI
	}
	-- mini Zephyr fish floss
	elf.fruit[15003]	= {
		level			= 1,
		max				= 12,
		prohibit		= elf.secondFairy,
		stat			= ITEMATTR_VAL_DEX
	}
	-- mini argent mango
	elf.fruit[15004]	= {
		level			= 1,
		max				= 12,
		prohibit		= elf.secondFairy,
		stat			= ITEMATTR_VAL_CON
	}
	-- mini shaitan biscuit
	elf.fruit[15005]	= {
		level			= 1,
		max				= 12,
		prohibit		= elf.secondFairy,
		stat			= ITEMATTR_VAL_STA
	}

-- normal fruits
function ItemUse_LS_longguo(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_LS_koumei(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_LS_yusi(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_LS_guopu(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_LS_mibing(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
-- great fruits
function ItemUse_CJ_longguo(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_koumei(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_yusi(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_guopu(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_mibing(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
-- super fruits
function ItemUse_StrSpeedLVUP(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_AgiSpeedLVUP(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_ConSpeedLVUP(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_DexSpeedLVUP(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_StaSpeedLVUP(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
-- improved fruits
function ItemUse_Great_Strup(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_Great_Agiup(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_Great_Dexup(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_Great_Conup(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_Great_Staup(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end

elf.handleFruits = function(role, Item, fairy)
	local chaBoat = GetCtrlBoat(role)
	local fairy = GetEquipItemP(role,16)
	if chaBoat ~= nil then
		SystemNotie(role, 'Cannot use fairy fruits while sailing.')
		UseItemFailed(role)
		return
	end
	local fairyId = GetItemID(fairy)
	local fairyName = GetItemName(fairyId)
	if fairy ~= GetEquipItemP(role,16) then --GetChaItem(role, 2, 1) then
		SystemNotice(role, 'Fruits can only be fed to fairies in second slot!')
		UseItemFailed(role)
		return
	end
	local fruitId = GetItemID(Item)
	if elf.fruit[fruitId] == nil then
		SystemNotice(role, GetItemName(fruitId)..' has not yet been registered! Please try again...')
		UseItemFailed(role)
		return
	end
	if GetFairyLevel(fairy) >= elf.fruit[fruitId].max then
		SystemNotice(role, fairyName..' has reached the max fairy level!')
		UseItemFailed(role)
		return
	end
	if table.getn(elf.fruit[fruitId].prohibit) ~= 0 then
		for i = 1, table.getn(elf.fruit[fruitId].prohibit) do
			if fairyId == elf.fruit[fruitId].prohibit[i] then
				SystemNotice(role, 'Unable to feed '..GetItemName(fruitId)..' to '..GetItemName(fairyId)..'...')
				UseItemFailed(role)
				return
			end
		end
	end
	if GetItemType(Item) == 58 and GetItemType(fairy) == 59 then
		local isSuper = elf.fruit[fruitId].super or 0
		if CheckFairyEXP(role, fairy, isSuper) == 0 then
			SystemNotice(role, fairyName..' hasn\'t reached maximum growth, unable to feed.') 
			UseItemFailed(role)
		else
			FairyLevelUp(role, fairy, elf.fruit[fruitId].stat, elf.fruit[fruitId].level, 0)
		end
	end
end

elf.useCustomRates = false;	--> if true, level up fairy rate will be as specified

elf.levelUpRate = {}
	elf.levelUpRate[00] = 1
	elf.levelUpRate[01] = 1
	elf.levelUpRate[02] = 1
	elf.levelUpRate[03] = 1
	elf.levelUpRate[04] = 1
	elf.levelUpRate[05] = 1
	elf.levelUpRate[06] = .95
	elf.levelUpRate[07] = .95
	elf.levelUpRate[08] = .95
	elf.levelUpRate[09] = .95
	elf.levelUpRate[10] = .95
	elf.levelUpRate[11] = .90
	elf.levelUpRate[12] = .90
	elf.levelUpRate[13] = .90
	elf.levelUpRate[14] = .90
	elf.levelUpRate[15] = .90
	elf.levelUpRate[16] = .90
	elf.levelUpRate[17] = .90
	elf.levelUpRate[18] = .90
	elf.levelUpRate[19] = .90
	elf.levelUpRate[20] = .90
	elf.levelUpRate[21] = .80
	elf.levelUpRate[22] = .80
	elf.levelUpRate[23] = .80
	elf.levelUpRate[24] = .80
	elf.levelUpRate[25] = .70
	elf.levelUpRate[26] = .70
	elf.levelUpRate[27] = .70
	elf.levelUpRate[28] = .70
	elf.levelUpRate[29] = .70
	elf.levelUpRate[30] = .70
	elf.levelUpRate[31] = .50
	elf.levelUpRate[32] = .40
	elf.levelUpRate[33] = .40
	elf.levelUpRate[34] = .40
	elf.levelUpRate[35] = .35
	elf.levelUpRate[36] = .35
	elf.levelUpRate[37] = .35
	elf.levelUpRate[38] = .35
	elf.levelUpRate[39] = .30
	elf.levelUpRate[40] = .30
	elf.levelUpRate[41] = .80
	elf.levelUpRate[42] = .80
	elf.levelUpRate[43] = .80
	elf.levelUpRate[44] = .80
	elf.levelUpRate[45] = .85
	elf.levelUpRate[46] = .85
	elf.levelUpRate[47] = .95
	elf.levelUpRate[48] = .95
	elf.levelUpRate[49] = 1
	elf.levelUpRate[50] = 1

----------------------------------------------------------
-- POSSESSIONS/SKILLS:
----------------------------------------------------------
STATE_JLFT1			= 132
STATE_JLFT2			= 168
STATE_JLFT3			= 169
STATE_JLFT4			= 170
STATE_JLFT5			= 171
STATE_JLFT6			= 172
STATE_JLFT7			= 173
STATE_JLFT8			= 174

SecondGenFairy = {}
	SecondGenFairy[681] = true
	SecondGenFairy[elf.fairyId['angelajr']] = true
	SecondGenFairy[231] = true
	SecondGenFairy[232] = true
	SecondGenFairy[233] = true
	SecondGenFairy[235] = true
	SecondGenFairy[234] = true
	SecondGenFairy[236] = true
	SecondGenFairy[237] = true

function IsSecondGen(cha, fairy)
	local fairyId = GetItemID(fairy)
	return SecondGenFairy[fairyId] or false
end

 function FixSecondGenFairy(role, fairy)
 	local fairyId = GetItemID(fairy)
 	if SecondGenFairy[fairyId] ~= nil then
		local Num_JL = GetItemForgeParam(fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
 		if Part1 ~= 1 then
			local num = GetItemForgeParam(fairy, 1)
			local i = 0
			num = SetNum_Part1(num, 1)
			i = SetItemForgeParam(fairy, 1, num)
			if i == 0 then
				pkoLG('FairySystem', 'Unable to fix '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end

function SkillCooldown_JLFT(sklv)
	local Cooldown = 180000
	return Cooldown
end

function SkillSp_JLFT(sklv)
	local SP = 20
	return SP
end

function Skill_JLFT_BEGIN(role, sklv)			
	local item_elf = GetEquipItemP(role,16)--GetChaItem(role , 2, 1)						-- Pet Handle
	local item_elf_type = GetItemType ( item_elf )					-- Pet Type
	local item_elf_maxhp = GetItemAttr(item_elf,ITEMATTR_MAXURE)	-- Max Stamina	
	local item_elf_hp = GetItemAttr(item_elf,ITEMATTR_URE)			-- Current Stamina
	local role_hp = GetChaAttr(role, ATTR_HP)
	local role_mxhp = GetChaAttr(role, ATTR_MXHP)
	-- custom:
	FixSecondGenFairy(role, item_elf)
	local Num_JL = GetItemForgeParam ( item_elf , 1 )
	local Part1 = GetNum_Part1(Num_JL)

	if item_elf_type ~= 59 or Part1 ~= 1 then
		SystemNotice(role, "Current skill is only available if the new generation of pet is equipped!" ) 
		SkillUnable(role) 
		return 
	end
	local str = GetItemAttr( item_elf ,ITEMATTR_VAL_STR )		-- Str Lv 
	local con = GetItemAttr( item_elf ,ITEMATTR_VAL_CON )		-- Con Lv 
	local agi = GetItemAttr( item_elf ,ITEMATTR_VAL_AGI )		-- Agi Lv 
	local dex = GetItemAttr( item_elf ,ITEMATTR_VAL_DEX )		-- Spr Lv 
	local sta = GetItemAttr( item_elf ,ITEMATTR_VAL_STA )		-- Acc Lv 
	local lv_JL = str + con + agi + dex + sta					-- Total Lv of Pet
	--[[if lv_GL < elf.minFLvToPoss then
		SystemNotice ( role , "Fairy must be alteast level "..elf.minFLvToPoss.." to cast Fairy possession!" ) 
		SkillUnable(role) 
		return
	end]]

	if item_elf_hp < (elf.minToPossess*50) then
		SystemNotice ( role , "Fairy needs to have at least "..elf.minToPossess.." stamina to activate this skill!" ) 
		SkillUnable(role) 
		return 
	end

	--elf.consumeStamP = elf.consumeStamP or true;
	--print(elf.consumeStamP)
	if elf.consumeStamP then
		local sub = item_elf_hp
		item_elf_hp = item_elf_hp - (6 * lv_JL / sklv) * 50
		sub = (sub - item_elf_hp) / 50
		SystemNotice(role, 'Fairy possession took '..GetItemName(GetItemID(item_elf))..' '..sub..' stamina!')
		SetItemAttr(item_elf, ITEMATTR_URE, item_elf_hp)
	end
end 

function Skill_JLFT_End ( ATKER , DEFER , sklv )
	local statelv = sklv 
	--local statetime = 190 - sklv * 10
	-- Custom fix: Expert possession have shorter CD than novice
	local statetime = 150 + sklv * 10
	local item_elf = GetEquipItemP(ATKER,16)--GetChaItem(ATKER , 2, 1)				-- Pet Handle
	local item_elf_type = GetItemType ( item_elf )			-- Pet Type
	local Item_ID = GetItemID ( item_elf )					-- Pet ID 
	local aJr = elf.fairyId['angelajr'];

	if Item_ID==231 then		AddState( ATKER , ATKER , STATE_JLFT1, statelv , statetime ) 
	elseif Item_ID==232 then	AddState( ATKER , ATKER , STATE_JLFT2, statelv , statetime ) 
	elseif Item_ID==233 then	AddState( ATKER , ATKER , STATE_JLFT3, statelv , statetime ) 
	elseif Item_ID==235 then	AddState( ATKER , ATKER , STATE_JLFT4, statelv , statetime ) 
	elseif Item_ID==234 then	AddState( ATKER , ATKER , STATE_JLFT5, statelv , statetime ) 
	elseif Item_ID==236 then	AddState( ATKER , ATKER , STATE_JLFT6, statelv , statetime ) 
	elseif Item_ID==237 then	AddState( ATKER , ATKER , STATE_JLFT7, statelv , statetime ) 
	elseif Item_ID==681 then	AddState( ATKER , ATKER , STATE_JLFT8, statelv , statetime )
	elseif Item_ID==aJr then	AddState( ATKER , ATKER , STATE_JLFT1, statelv , statetime ) 
	end
end 

function State_JLFT_Add(Player, Lv)
	local Fairy = GetEquipItemP(Player,16)--GetChaItem(Player, 2, 1)
	local FairyType = GetItemType(Fairy)
	if FairyType == 59 then
		local FairyID = GetItemID(Fairy)
		local STR = GetItemAttr(Fairy, ITEMATTR_VAL_STR)
		local CON = GetItemAttr(Fairy, ITEMATTR_VAL_CON)
		local AGI = GetItemAttr(Fairy, ITEMATTR_VAL_AGI)
		local ACC = GetItemAttr(Fairy, ITEMATTR_VAL_DEX)
		local SPR = GetItemAttr(Fairy, ITEMATTR_VAL_STA)
		local FairyLv = GetFairyLevel(Fairy)
		local Num_JL = GetItemForgeParam(Fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
		-- cheaters
		if FairyLv > elf.conf['max'] then
			pkoLG('FairySystem', '['..GetChaDefaultName(Player)..'] casted fairy possession with Lv'..FairyLv..' '..GetItemName(GetItemID(Fairy))..'!');
		end
		if Part1 == 1 then
			local FLAG = 0
			-- Custom
			if elf.LuckExpToAll then
				if FairyID ~= elf.fairyId['angelajr'] then
					if STR ~= nil and STR ~= 0 then SetCharaAttr(STR, Player, ATTR_STATEV_STR) end
					if CON ~= nil and CON ~= 0 then SetCharaAttr(CON, Player, ATTR_STATEV_CON) end
					if SPR ~= nil and SPR ~= 0 then SetCharaAttr(SPR, Player, ATTR_STATEV_STA) end
					if ACC ~= nil and ACC ~= 0 then SetCharaAttr(ACC, Player, ATTR_STATEV_DEX) end
					if AGI ~= nil and AGI ~= 0 then SetCharaAttr(AGI, Player, ATTR_STATEV_AGI) end
					local DROP_S = GetChaAttr(Player, ATTR_BMF)
					local DROP_F = GetChaAttr(Player, ATTR_BMF) * FairyLv * 0.02
					local DROP = DROP_S + DROP_F
					SetCharaAttr(DROP, Player, ATTR_STATEV_MF)
				end
			else
			-- Original
				if FairyID == 232 then SetCharaAttr(FairyLv, Player, ATTR_STATEV_STR) end	
				if FairyID == 233 then SetCharaAttr(FairyLv, Player, ATTR_STATEV_CON) end
				if FairyID == 234 then SetCharaAttr(FairyLv, Player, ATTR_STATEV_STA) end
				if FairyID == 235 then SetCharaAttr(FairyLv, Player, ATTR_STATEV_DEX) end
				if FairyID == 236 then SetCharaAttr(FairyLv, Player, ATTR_STATEV_AGI) end
				-- x2 DROP for mJr and Luck
				if FairyID == 231 or FairyID == 681 then
					local DROP_S = GetChaAttr(Player, ATTR_BMF)
					local DROP_F = GetChaAttr(Player, ATTR_BMF) * FairyLv * 0.02
					local DROP = DROP_S + DROP_F
					SetCharaAttr(DROP, Player, ATTR_STATEV_MF)
				end
				-- Fairy of Luck, Fairy of Evil, mJr will have same stat bonuses
				if FairyID == 681 then
					if STR ~= nil and STR ~= 0 then SetCharaAttr(STR, Player, ATTR_STATEV_STR) end
					if CON ~= nil and CON ~= 0 then SetCharaAttr(CON, Player, ATTR_STATEV_CON) end
					if SPR ~= nil and SPR ~= 0 then SetCharaAttr(SPR, Player, ATTR_STATEV_STA) end
					if ACC ~= nil and ACC ~= 0 then SetCharaAttr(ACC, Player, ATTR_STATEV_DEX) end
					if AGI ~= nil and AGI ~= 0 then SetCharaAttr(AGI, Player, ATTR_STATEV_AGI) end
				end
			end
			-- Angela Jr configurations
			if FairyID == elf.fairyId['angelajr'] then
				if STR ~= nil and STR ~= 0 then	SetCharaAttr((STR * 1.2), Player, ATTR_STATEV_STR) end
				if CON ~= nil and CON ~= 0 then SetCharaAttr((CON * 1.2), Player, ATTR_STATEV_CON) end
				if SPR ~= nil and SPR ~= 0 then SetCharaAttr((SPR * 1.2), Player, ATTR_STATEV_STA) end
				if ACC ~= nil and ACC ~= 0 then SetCharaAttr((ACC * 1.2), Player, ATTR_STATEV_DEX) end
				if AGI ~= nil and AGI ~= 0 then SetCharaAttr((AGI * 1.2), Player, ATTR_STATEV_AGI) end
				local DROP = GetChaAttr(Player, ATTR_BMF) + (GetChaAttr(Player, ATTR_BMF) * 1.5)
				local PR = GetChaAttr(Player, ATTR_STATEV_PDEF) + 3
				SetCharaAttr(PR, Player, ATTR_STATEV_PDEF)
				SetCharaAttr(DROP, Player, ATTR_STATEV_MF)
			end
		end
	end
	RefreshCha(Player)
	ALLExAttrSet(Player)
end

function State_JLFT_Rem(Player, Lv)
	SetCharaAttr(0, Player, ATTR_STATEV_STR)
	SetCharaAttr(0, Player, ATTR_STATEV_CON)
	SetCharaAttr(0, Player, ATTR_STATEV_STA)
	SetCharaAttr(0, Player, ATTR_STATEV_DEX)
	SetCharaAttr(0, Player, ATTR_STATEV_AGI)
	SetCharaAttr(0, Player, ATTR_STATEV_MF)
	-- added for angela Jr
	SetCharaAttr(0, Player, ATTR_STATEV_LUK)
	SetCharaAttr(0, Player, ATTR_STATEV_PDEF)
	ALLExAttrSet(Player)
	RefreshCha(Player)
end

----------------------------------------------------------
-- MARRIAGE:
----------------------------------------------------------
do 	local ajid = elf.fairyId['angelajr']
	elf.marriage[3918] = {elf = 0231, ingr1 = 4530, ingr1qty = 10, ingr2 = 3434, ingr2qty = 10, n = 06}
	elf.marriage[3919] = {elf = 0233, ingr1 = 4531, ingr1qty = 10, ingr2 = 3435, ingr2qty = 10, n = 07}
	elf.marriage[3920] = {elf = 0232, ingr1 = 1196, ingr1qty = 10, ingr2 = 3436, ingr2qty = 10, n = 08}
	elf.marriage[3921] = {elf = 0234, ingr1 = 4533, ingr1qty = 10, ingr2 = 3437, ingr2qty = 10, n = 09}
	elf.marriage[3922] = {elf = 0235, ingr1 = 4537, ingr1qty = 10, ingr2 = 3444, ingr2qty = 10, n = 10}
	elf.marriage[3924] = {elf = 0236, ingr1 = 4540, ingr1qty = 10, ingr2 = 3443, ingr2qty = 10, n = 11}
	--elf.marriage[3925] = {elf = 0237, ingr1 = 1253, ingr1qty = 10, ingr2 = 3454, ingr2qty = 10, n = 12}
	elf.marriage[3925] = {elf = 0237, ingr1 = 1253, ingr1qty = 10, ingr2 = 3442, ingr2qty = 10, n = 12}
	elf.marriage[9998] = {elf = ajid, ingr1 = 3116, ingr1qty = 10, ingr2 = 3116, ingr2qty = 10, n = 12}
end

function can_jlborn_item_main(Table)
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role, ItemBag, ItemCount, ItemBagCount, ItemBag_Now, ItemCount_Now, ItemBagCount_Num = Read_Table(Table)
	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		SystemNotice(role, "equipment quantity illegal ")
		return 0
	end
	local Item_EMstone = GetChaItem(role, 2, ItemBag [0])
	local Item_JLone = GetChaItem(role, 2, ItemBag [1])
	local Item_JLother = GetChaItem(role, 2, ItemBag [2])
	local Item_JLone_ID = GetItemID(Item_JLone)
	local Item_JLother_ID = GetItemID(Item_JLother)
	local str_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_STR)
	local con_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_CON)
	local agi_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_AGI)
	local dex_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_DEX)
	local sta_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_STA)
	local URE_JLone = GetItemAttr(Item_JLone, ITEMATTR_URE)
	local MAXURE_JLone = GetItemAttr(Item_JLone, ITEMATTR_MAXURE)
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone
	local str_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_STR)
	local con_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_CON)
	local agi_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_AGI)
	local dex_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_DEX)
	local sta_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_STA)
	local URE_JLother = GetItemAttr(Item_JLother, ITEMATTR_URE)
	local MAXURE_JLother = GetItemAttr(Item_JLother, ITEMATTR_MAXURE)
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother
	local Num_JLone = GetItemForgeParam(Item_JLone, 1)
	local Part1_JLone = GetNum_Part1(Num_JLone)
	local Part2_JLone = GetNum_Part2(Num_JLone)
	local Part3_JLone = GetNum_Part3(Num_JLone)
	local Part4_JLone = GetNum_Part4(Num_JLone)
	local Part5_JLone = GetNum_Part5(Num_JLone)
	local Part6_JLone = GetNum_Part6(Num_JLone)
	local Part7_JLone = GetNum_Part7(Num_JLone)
	local Num_JLother = GetItemForgeParam(Item_JLother, 1)
	local Part1_JLother = GetNum_Part1(Num_JLother)
	local Part2_JLother = GetNum_Part2(Num_JLother)
	local Part3_JLother = GetNum_Part3(Num_JLother)
	local Part4_JLother = GetNum_Part4(Num_JLother)
	local Part5_JLother = GetNum_Part5(Num_JLother)
	local Part6_JLother = GetNum_Part6(Num_JLother)
	local Part7_JLother = GetNum_Part7(Num_JLother)
	local Item_CanGet = GetChaFreeBagGridNum(role)
	if Item_CanGet < 3 then
		SystemNotice(role, "Fairy marriage requires at least 3 empty inventory slots")
		return 0
	end	
	local Item_EMstone_ID = GetItemID(Item_EMstone)
	if elf.marriage[Item_EMstone_ID] == nil then
		SystemNotice(role, "Demonic Fruit usage error")
		return 0
	end
	local i1 = CheckBagItem(role, elf.marriage[Item_EMstone_ID].ingr1)
	local i2 = CheckBagItem(role, elf.marriage[Item_EMstone_ID].ingr2)
	if i1 < 10 or i2 < 10 then
		SystemNotice(role, "Fairy marriage lack some required items")
		return 0
	end
	local ItemType_JLone = GetItemType (Item_JLone)
	local ItemType_JLother = GetItemType (Item_JLother)
	if  ItemType_JLone ~=59 or ItemType_JLother ~=59  then
			SystemNotice(role, "You did not insert a pet fairy")
		return 0
	end
	if ItemBag [1]==ItemBag [2] then
		SystemNotice(role, "My dear child, how can one marry oneself?")
		return 0
	end
	if  Part1_JLone ~=0 or Part1_JLother ~=0  then
		SystemNotice(role, "Only normal fairy can get married at the moment")
		return 0
	end
	if  lv_JLone < 20 or lv_JLother < 20   then
		SystemNotice(role, "Pet Fairy below Lv 20 cannot get marry")
		return 0
	end
	if URE_JLone < MAXURE_JLone or URE_JLone < MAXURE_JLone then
		SystemNotice(role, "Marriage is a tedious process. Please maintain full stamina of pet fairy")
		return 0
	end
	local Money_Need = getjlborn_money_main(Table)
	local Money_Have = GetChaAttr(role, ATTR_GD)
	if Money_Need > Money_Have then
		SystemNotice(role, "Insufficient gold. Unable to reborn")
		return 0
	end
	return 1
end

function jlborn_item(Table)
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0
	role, ItemBag, ItemCount, ItemBagCount, ItemBag_Num, ItemCount_Num, ItemBagCount_Num = Read_Table(Table)
	local Item_EMstone = GetChaItem(role, 2, ItemBag [0])
	local Item_JLone = GetChaItem(role, 2, ItemBag [1])
	local Item_JLother = GetChaItem(role, 2, ItemBag [2])
	local Item_EMstone_ID = GetItemID(Item_EMstone)
	local Item_JLone_ID = GetItemID(Item_JLone)
	local Item_JLother_ID = GetItemID(Item_JLother)
	local str_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_STR)
	local con_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_CON)
	local agi_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_AGI) 
	local dex_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_DEX)
	local sta_JLone = GetItemAttr(Item_JLone, ITEMATTR_VAL_STA)
	local URE_JLone = GetItemAttr(Item_JLone, ITEMATTR_URE)
	local MAXURE_JLone = GetItemAttr(Item_JLone, ITEMATTR_MAXURE)
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone
	local str_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_STR)
	local con_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_CON)
	local agi_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_AGI)
	local dex_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_DEX)
	local sta_JLother = GetItemAttr(Item_JLother, ITEMATTR_VAL_STA)
	local URE_JLother = GetItemAttr(Item_JLother, ITEMATTR_URE)
	local MAXURE_JLother = GetItemAttr(Item_JLother, ITEMATTR_MAXURE)
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother
	local Num_JLone = GetItemForgeParam(Item_JLone, 1)
	local Part1_JLone = GetNum_Part1(Num_JLone)
	local Part2_JLone = GetNum_Part2(Num_JLone)
	local Part3_JLone = GetNum_Part3(Num_JLone)
	local Part4_JLone = GetNum_Part4(Num_JLone)
	local Part5_JLone = GetNum_Part5(Num_JLone)
	local Part6_JLone = GetNum_Part6(Num_JLone)
	local Part7_JLone= GetNum_Part7(Num_JLone)
	local Num_JLother = GetItemForgeParam(Item_JLother, 1)
	local Part1_JLother = GetNum_Part1(Num_JLother)
	local Part2_JLother = GetNum_Part2(Num_JLother)
	local Part3_JLother = GetNum_Part3(Num_JLother)
	local Part4_JLother = GetNum_Part4(Num_JLother)
	local Part5_JLother = GetNum_Part5(Num_JLother)
	local Part6_JLother = GetNum_Part6(Num_JLother)
	local Part7_JLother= GetNum_Part7(Num_JLother)
	local new_str = math.floor((str_JLone+str_JLother)*0.125)
	local new_con = math.floor((con_JLone+con_JLother)*0.125)
	local new_agi = math.floor((agi_JLone+agi_JLother)*0.125)
	local new_dex = math.floor((dex_JLone+dex_JLother)*0.125)
	local new_sta = math.floor((sta_JLone+sta_JLother)*0.125)
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 *(new_lv + 1)
	if new_MAXENERGY > 6480 then new_MAXENERGY = 6480 end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then new_MAXURE = 32000 end
	
	if elf.marriage[Item_EMstone_ID] ~= nil then
		local j1 = TakeItem(role, 0, elf.marriage[Item_EMstone_ID].ingr1, elf.marriage[Item_EMstone_ID].ingr1qty)
		local j2 = TakeItem(role, 0, elf.marriage[Item_EMstone_ID].ingr2, elf.marriage[Item_EMstone_ID].ingr2qty)
		if j1 == 0 or j2 == 0 then
			SystemNotice(role, "Deletion of pet fairy reborn tools failed")
			return
		end 
		local rad = math.random(1, 100)
		local r1 = 0
		local r2 = 0
		if Item_JLone_ID == 0680 or Item_JLother_ID == 0680 then
			if Item_JLone_ID == Item_JLother_ID then
				r1,r2 = MakeItem(role, 681, 1, 4)
			elseif lv_JLone >= 20 and lv_JLone < 25 and lv_JLother >= 20 and lv_JLother < 25 and rad >= 88 then
				r1,r2 = MakeItem(role, 681, 1, 4)
			elseif lv_JLone >= 25 and lv_JLone < 35 and lv_JLother >= 25 and lv_JLother < 35 and rad >= 50 then
				r1,r2 = MakeItem(role, 681, 1, 4)
			elseif lv_JLone >= 35 and lv_JLother >=35 and rad >= 10 then
				r1,r2 = MakeItem(role, 681, 1, 4)
			else
				r1,r2 = MakeItem(role, elf.marriage[Item_EMstone_ID].elf, 1, 4)
			end
		elseif Item_JLone_ID == elf.fairyId['angela'] or Item_JLother_ID == elf.fairyId['angela'] then
			if Item_JLone_ID == Item_JLother_ID then
				r1,r2 = MakeItem(role, elf.fairyId['angelajr'], 1, 4)
			elseif lv_JLone >= 20 and lv_JLone < 25 and lv_JLother >= 20 and lv_JLother < 25 and rad >= 88 then
				r1,r2 = MakeItem(role, elf.fairyId['angelajr'], 1, 4)
			elseif lv_JLone >= 25 and lv_JLone < 35 and lv_JLother >= 25 and lv_JLother < 35 and rad >= 50 then
				r1,r2 = MakeItem(role, elf.fairyId['angelajr'], 1, 4)
			elseif lv_JLone >= 35 and lv_JLother >=35 and rad >= 10 then
				r1,r2 = MakeItem(role, elf.fairyId['angelajr'], 1, 4)
			else
				r1,r2 = MakeItem(role, elf.marriage[Item_EMstone_ID].elf, 1, 4)
			end
		else
			r1,r2 = MakeItem(role, elf.marriage[Item_EMstone_ID].elf, 1, 4)
		end
		local Item_newJL = GetChaItem(role, 2, r2)
		local Item_newJL_ID = GetItemID(Item_newJL)
		local Num_newJL = GetItemForgeParam(Item_newJL, 1)
		local Part1_newJL = GetNum_Part1(Num_newJL)
		local Part2_newJL = GetNum_Part2(Num_newJL)
		local Part3_newJL = GetNum_Part3(Num_newJL)
		local Part4_newJL = GetNum_Part4(Num_newJL)
		local Part5_newJL = GetNum_Part5(Num_newJL)
		local Part6_newJL = GetNum_Part6(Num_newJL)
		local Part7_newJL = GetNum_Part7(Num_newJL)
		if lv_JLone >= 20 and lv_JLother >= 20 then Part2_newJL,Part3_newJL = 6,1 end
		if lv_JLone >= 25 and lv_JLother >= 25 then Part2_newJL,Part3_newJL = 6,2 end
		if lv_JLone >= 35 and lv_JLother >= 35 then Part2_newJL,Part3_newJL = 6,3 end
		local rad1 = math.random(1, 100)
		if Part3_newJL == 3 then 					GiveItem(role, 0, 609, 1, 4) end
		if Part3_newJL == 2 then
			if rad1 <= 95 then 						GiveItem(role, 0, 608, 1, 4)
			elseif rad1 > 95 and rad1 <=100 then 	GiveItem(role, 0, 609, 1, 4) end
		end
		if Part3_newJL == 1 then
			if rad1 <= 90 then 						GiveItem(role, 0, 239, 1, 4)
			elseif rad1 > 90 and rad1 <= 98 then 	GiveItem(role, 0, 608, 1, 4)
			elseif rad1 > 98 and rad1 <= 100 then 	GiveItem(role, 0, 609, 1, 4) end
		end
		Num_newJL = SetNum_Part1(Num_newJL, 1)
		--[[Num_newJL = SetNum_Part2(Num_newJL, Part2_newJL)
		Num_newJL = SetNum_Part3(Num_newJL, Part3_newJL)
		Num_newJL = SetNum_Part4(Num_newJL, Part4_newJL)
		Num_newJL = SetNum_Part5(Num_newJL, Part5_newJL)
		Num_newJL = SetNum_Part6(Num_newJL, Part6_newJL)
		Num_newJL = SetNum_Part7(Num_newJL, Part7_newJL)
		SetItemForgeParam(Item_newJL, 1, Num_newJL)]]
		SetItemAttr(Item_newJL, ITEMATTR_VAL_STR, new_str)
		SetItemAttr(Item_newJL, ITEMATTR_VAL_DEX, new_dex)
		SetItemAttr(Item_newJL, ITEMATTR_VAL_STA, new_sta)
		SetItemAttr(Item_newJL, ITEMATTR_VAL_AGI, new_agi)
		SetItemAttr(Item_newJL, ITEMATTR_VAL_CON, new_con)
		SetItemAttr(Item_newJL, ITEMATTR_MAXENERGY, new_MAXENERGY)
		SetItemAttr(Item_newJL, ITEMATTR_MAXURE, new_MAXURE)
	end
	local cha_name = GetChaDefaultName(role)
	R1 = RemoveChaItem(role, Item_EMstone_ID, 1, 2, ItemBag [0], 2, 1, 0)
	if R1 == 0  then
		SystemNotice(role, "Deletion of Demonic Fruit failed")
		return
	end
	Elf_Attr_cs(role, Item_JLone, Item_JLother)
end

----------------------------------------------------------
-- FAIRY SKILL BOOK:
----------------------------------------------------------
local ItemSkill = {}
	ItemSkill[243] = {ID = 1, Level = 1} -- protection
	ItemSkill[244] = {ID = 1, Level = 2}
	ItemSkill[245] = {ID = 1, Level = 3}
	ItemSkill[246] = {ID = 2, Level = 1} -- berserk
	ItemSkill[247] = {ID = 2, Level = 2}
	ItemSkill[248] = {ID = 2, Level = 3}
	ItemSkill[249] = {ID = 3, Level = 1} -- magic
	ItemSkill[250] = {ID = 3, Level = 2}
	ItemSkill[251] = {ID = 3, Level = 3}
	ItemSkill[252] = {ID = 4, Level = 1} -- recover
	ItemSkill[253] = {ID = 4, Level = 2}
	ItemSkill[254] = {ID = 4, Level = 3}
	ItemSkill[259] = {ID = 5, Level = 1} -- medi
	ItemSkill[260] = {ID = 5, Level = 2}
	ItemSkill[261] = {ID = 5, Level = 3}
	ItemSkill[1055] = {ID = 13, Level = 1} -- manu
	ItemSkill[1056] = {ID = 13, Level = 2}
	ItemSkill[1057] = {ID = 13, Level = 3}
	ItemSkill[1058] = {ID = 14, Level = 1} -- crafting
	ItemSkill[1059] = {ID = 14, Level = 2}
	ItemSkill[1060] = {ID = 14, Level = 3}
	ItemSkill[1061] = {ID = 15, Level = 1} -- analyze
	ItemSkill[1062] = {ID = 15, Level = 2}
	ItemSkill[1063] = {ID = 15, Level = 3}
	ItemSkill[1064] = {ID = 16, Level = 1} -- cooking
	ItemSkill[1065] = {ID = 16, Level = 2}
	ItemSkill[1066] = {ID = 16, Level = 3}

function ItemUse_HuDun_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_HuDun_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_HuDun_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_BaoJi_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_BaoJi_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_BaoJi_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_MoLi_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_MoLi_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_MoLi_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_HuiFu_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_HuiFu_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_HuiFu_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_ChenSi_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_ChenSi_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_ChenSi_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLZhiZ_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLZhiZ_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLZhiZ_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLZhuZ_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLZhuZ_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLZhuZ_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLFenJ_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLFenJ_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLFenJ_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLPengR_CJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLPengR_ZJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end
function ItemUse_JLPengR_GJ(role, Item, target) elf.HandleFairyBook(role, Item, target) end

--[[function AddElfSkill(Item, skLv, skid)
	local Num = GetItemForgeParam(Item, 1)
	local Part1 = GetNum_Part1(Num)
	local Part2 = GetNum_Part2(Num)
	local Part3 = GetNum_Part3(Num)
	local Part4 = GetNum_Part4(Num)
	local Part5 = GetNum_Part5(Num)
	local Part6 = GetNum_Part6(Num)
	local Part7 = GetNum_Part7(Num)
	if Part2 == skid then
		Part3 = skLv
		Num = SetNum_Part3(Num, Part3)
		Num = SetNum_Part2(Num, Part2)
		SetItemForgeParam(Item, 1, Num)
		return 
	end
	if Part4 == skid then
		Part5 = skLv
		Num = SetNum_Part5(Num, Part5)
		Num = SetNum_Part4(Num, Part4)
		SetItemForgeParam(Item, 1, Num)
		return 
	end
	if Part6 == skid then
		 Part7 = skLv
		Num = SetNum_Part7(Num, Part7)
		Num = SetNum_Part6(Num, Part6)
		SetItemForgeParam(Item, 1, Num)
		return 
	end
	local rad = math.random(1, 100)
	if Part2 == 0 and Part3 == 0 then
		Part2 = skid
		Part3 = skLv
		Num = SetNum_Part3(Num, Part3)
		Num = SetNum_Part2(Num, Part2)
		SetItemForgeParam(Item, 1, Num)
		return
	else
		if rad <= 30 then
			Part2 = skid
			Part3 = skLv
			Num = SetNum_Part3(Num, Part3)
			Num = SetNum_Part2(Num, Part2)
			SetItemForgeParam(Item, 1, Num)
			return
		end
	end
	if Part4 == 0 and Part5 == 0 then
		Part4 = skid
		Part5 = skLv
		Num = SetNum_Part5(Num, Part5)
		Num = SetNum_Part4(Num, Part4)
		SetItemForgeParam(Item, 1, Num)
		return
	else
		if rad > 30 and rad < 60 then
			Part4 = skid
			Part5 = skLv
			Num = SetNum_Part5(Num, Part5)
			Num = SetNum_Part4(Num, Part4)
			SetItemForgeParam(Item, 1, Num)
			return
		end
	end
	if Part6 == 0 and Part7 == 0 then
		Part6 = skid
		Part7 = skLv
		Num = SetNum_Part7(Num, Part7)
		Num = SetNum_Part6(Num, Part6)
		SetItemForgeParam(Item, 1, Num)
		return
	else
		Part6 = skid
		Part7 = skLv
		Num = SetNum_Part7(Num, Part7)
		Num = SetNum_Part6(Num, Part6)	
		SetItemForgeParam(Item, 1, Num)
		return
	end
end 

function CheckFairySkill(Num, SkillType, SkillNum)
	local Part2 = GetNum_Part2(Num)
	local Part3 = GetNum_Part3(Num)
	local Part4 = GetNum_Part4(Num)
	local Part5 = GetNum_Part5(Num)
	local Part6 = GetNum_Part6(Num)
	local Part7 = GetNum_Part7(Num)
	if Part3 >= SkillType and Part2 == SkillNum then 	return 1
	elseif Part2 == SkillNum then 						return 2 end
	if Part5 >= SkillType and Part4 == SkillNum then 	return 1
	elseif Part4 == SkillNum then 						return 2 end
	if Part7 >= SkillType and Part6 == SkillNum then 	return 1
	elseif Part6 == SkillNum then 						return 2 end
	return 0
end

elf.HandleFairyBook = function(Player, Item, Fairy)
	local ItemID = GetItemID(Item)
	local Num = GetItemForgeParam(Fairy, 1)
	if GetItemType(Item) == 58 and GetItemType(Fairy) == 59 then
		local Check = CheckFairySkill(Num, ItemSkill[ItemID].Level, ItemSkill[ItemID].ID)
		if Check == 1 then
			SystemNotice(Player, GetItemName(GetItemID(Fairy)).." already has this skill.") 
			UseItemFailed(Player)
		else
			AddElfSkill(Fairy, ItemSkill[ItemID].Level, ItemSkill[ItemID].ID)
		end
	end
end
]]

function AddElfSkill(cha, elf, item, skid, sklv)
	local num = GetItemForgeParam(elf, 1)
	local skillid = {GetNum_Part2(num), GetNum_Part4(num), GetNum_Part6(num)}
	local skilllv = {GetNum_Part3(num), GetNum_Part5(num), GetNum_Part7(num)}
	local fairyname = GetItemName(GetItemID(elf))
	local bookname = GetItemName(GetItemID(item))

	if skillid[1] == skid then
		num = SetNum_Part3(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' successfully learned '..bookname..'!')
		return
	end
	if skillid[2] == skid then
		num = SetNum_Part5(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' successfully learned '..bookname..'!')
		return
	end
	if skillid[3] == skid then
		num = SetNum_Part7(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' successfully learned '..bookname..'!')
		return
	end
	if skillid[1] == 0000 then
		num = SetNum_Part2(num, skid)
		num = SetNum_Part3(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' successfully learned '..bookname..'!')
		return
	end
	if skillid[2] == 0000 then
		num = SetNum_Part4(num, skid)
		num = SetNum_Part5(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' successfully learned '..bookname..'!')
		return
	end
	if skillid[3] == 0000 then
		num = SetNum_Part6(num, skid)
		num = SetNum_Part7(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' successfully learned '..bookname..'!')
		return
	-- end
	else
		-- QUEUE the skills
		num = SetNum_Part2(num, skillid[2])
		num = SetNum_Part3(num, skilllv[2])
		num = SetNum_Part4(num, skillid[3])
		num = SetNum_Part5(num, skilllv[3])
		num = SetNum_Part6(num, skid)
		num = SetNum_Part7(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' successfully learned '..bookname..'!')
		return
	end
end

function CanLevelFairySkill(cha, elf, item, skid, sklv)
	local num = GetItemForgeParam(elf, 1)
	local skillid = {GetNum_Part2(num), GetNum_Part4(num), GetNum_Part6(num)}
	local skilllv = {GetNum_Part3(num), GetNum_Part5(num), GetNum_Part7(num)}
	local fairyname = GetItemName(GetItemID(elf))
	local bookname = GetItemName(GetItemID(item))

	for i = 1, table.getn(skillid) do
		if skid == skillid[i] then
			if sklv <= skilllv[i] then
				SystemNotice(cha, fairyname..' already mastered '..bookname..'!')
				return false
			else
				if sklv ~= (skilllv[i]+1) then
					SystemNotice(cha, fairyname..' must learned '..GetItemName((GetItemID(item)-1))..' first!')
					return false
				else
					return true
				end
			end
		end
	end
	local name;
	if sklv ~= 1 then
		for i,v in pairs(ItemSkill) do
			if v.ID == skid and v.Level == 1 then
				name = GetItemName(i)
				break;
			end
		end
		SystemNotice(cha, fairyname..' must learned '..name..' first!')
		return false
	end
	--[[if skillid[1] ~= 0 and skillid[2] ~= 0 and skillid[3] ~= 0 then
		SystemNotice(cha, fairyname..' already have 3 skills! Unable to learn '..bookname..'!')
		return false
	end]]
	return true
end

elf.HandleFairyBook = function(Player, Item)
	local Fairy = GetEquipItemP(Player,16)
	if GetItemType(Item) == 58 and GetItemType(Fairy) == 59 then
		local ItemID = GetItemID(Item)
		local check = CanLevelFairySkill(Player, Fairy, Item, ItemSkill[ItemID].ID, ItemSkill[ItemID].Level)
		if not check then
			UseItemFailed(Player)
		else
			AddElfSkill(Player, Fairy, Item, ItemSkill[ItemID].ID, ItemSkill[ItemID].Level)
			-- sync bag
			PlayEffect(Player, 345)
			SynChaKitbag(Player, 13)
		end
		SynLook(Player)
	else
		UseItemFailed(Player)
	end
end

function GetSkillBookName(elf)
	local num = GetItemForgeParam(elf, 1)
	local skillid = {GetNum_Part2(num), GetNum_Part4(num), GetNum_Part6(num)}
	local skilllv = {GetNum_Part3(num), GetNum_Part5(num), GetNum_Part7(num)}
	Notice(skillid[1]..' '..skillid[2]..' '..skillid[3])
	Notice(skilllv[1]..' '..skilllv[2]..' '..skilllv[3])
end
----------------------------------------------------------
-- TIMER FUNCTIONS:
----------------------------------------------------------
function Take_ElfURE(cha, Item, Num)
	Num = Num or 50
	local Stamina = GetItemAttr(Item, ITEMATTR_URE) 
	if Stamina > 49 then
		Stamina = math.max((Stamina - Num), 49)
		SetItemAttr(Item, ITEMATTR_URE, Stamina)
	end
	
	if Stamina < 50 then
		SetChaEquipValid(cha, 16, 0)
	end
	RefreshCha(cha)
	SynLook(cha)
end

function Give_FCoins(cha, fairy)
	local fairyLv = GetFairyLevel(fairy)
	local stamina = GetItemAttr(fairy, ITEMATTR_URE)
	if fairyLv >= elf.minFairyCoin and fairyLv <= elf.conf['max'] then
		--local is2 = GetItemForgeParam(fairy, 1)
		local is2 = GetNum_Part1(GetItemForgeParam(fairy, 1))
		local num = GetItemAttr(fairy, ITEMATTR_VAL_FUSIONID)
		num = num + 1;
		if math.mod(num, 1) == 0 and stamina >= 50 and is2 == 1 then
			GiveItemX(cha, 0, 855, ELELFC_GETRAD, 4)
		end
		if math.mod(num, 2) == 0 and stamina >= 50 and is2 ~= 1 then
			GiveItemX(cha, 0, 855, ELELFC_GETRAD, 4)
		end
		if math.mod(num, 5) == 0 and stamina >= 50 and is2 ~= 1 then
			GiveItemX(cha, 0, 855, ELELFC_GETRAD, 4)
		end
		if math.mod(num, 30) == 0 and stamina >= 50 and is2 == 1 then
			GiveItemX(cha, 0, 2588, 1, 4)
		end
		if math.mod(num, 60) == 0 and stamina >= 50 and is2 ~= 1 then
			GiveItemX(cha, 0, 2588, 1, 4)
		end
		if math.mod(num, 120) == 0 and stamina >= 50 then
			GiveItemX(cha, 0, 2588, 1, 4)
		end
		if math.mod(num, 1200) == 0 and stamina >= 50 then
			GiveItemX(cha, 0, 2589, 1, 4)
		end
		if num == 1200 then num = 0 end
		SetItemAttr(fairy, ITEMATTR_VAL_FUSIONID, num)
	end
end

function Auto_Ration(cha, fairy)
	local fairyLv = GetFairyLevel(fairy)
	local ration = GetChaItem2(cha,2, 2312)
	if ration ~= nil then
		local rationId = GetItemID(ration)
		if elf.ration[rationId] ~= nil then
			local isAuto = elf.ration[rationId].auto or 0
			if isAuto == 1 and GetItemAttr(fairy,ITEMATTR_URE) < 2500 then
				elf.handleRation(cha,ration)
				TakeItem(cha, 0, rationId, 1)
			end
		end
	end
	SynLook(cha)
	RefreshCha(cha)
end


function Give_ElfEXP(Player, Fairy)
	local Elf_EXP = GetItemAttr(Fairy, ITEMATTR_ENERGY)
	local Elf_MaxEXP = GetItemAttr(Fairy, ITEMATTR_MAXENERGY)
	if GetItemAttr(Fairy, ITEMATTR_URE) > 49 then
		local gainExp = ELEEXP_GETRAD
		--[[if IsSecondGen(Player, Fairy) then
			gainExp = math.floor(gainExp / 2)
		end]]
		-- Fruit of Growth
		local state = GetChaStateLv(Player, STATE_JLJSGZ)
		if state == 1 then -- this is 1 only... (use for other fruits)
			gainExp = gainExp * 2
		elseif state == 2 then
			gainExp = gainExp * 3
		end
		Elf_EXP = Elf_EXP + gainExp
		if Elf_EXP >= Elf_MaxEXP then
			Elf_EXP = Elf_MaxEXP
		else
			SystemNotice(Player, GetItemName(GetItemID(Fairy))..' EXP Gained: '..gainExp)
		end
		SetItemAttr(Fairy, ITEMATTR_ENERGY, Elf_EXP)
		RefreshCha(Player)
	end
	SynLook(Player)
end

----------------------------------------------------------
-- UTILITIES:
----------------------------------------------------------
function GetFairyLevel(fairy)
	local STR = GetItemAttr(fairy, ITEMATTR_VAL_STR)
	local CON = GetItemAttr(fairy, ITEMATTR_VAL_CON)
	local AGI = GetItemAttr(fairy, ITEMATTR_VAL_AGI)
	local ACC = GetItemAttr(fairy, ITEMATTR_VAL_DEX)
	local SPR = GetItemAttr(fairy, ITEMATTR_VAL_STA)
	return (STR + CON + AGI + ACC + SPR)
end

function GiveFairyStamina(Player, Item, Num)
	local StaminaOriginal = GetItemAttr(Item, ITEMATTR_URE)
	local Elf_MaxURE = GetItemAttr(Item, ITEMATTR_MAXURE)
	local recStam = Num / 50;
	if (StaminaOriginal + Num) >= Elf_MaxURE then
		recStam = (function(num, idp)
					local mult = 10^(idp or 0)
					return math.floor(num * mult + 0.5) / mult;
		end)((Elf_MaxURE - StaminaOriginal) / 50);
	end
	Stamina = StaminaOriginal + Num
	if Stamina >= Elf_MaxURE then
		Stamina = Elf_MaxURE
	end
	SetItemAttr(Item, ITEMATTR_URE, Stamina)
	SystemNotice(Player, GetItemName(GetItemID(Item))..' recovers '..recStam..' Stamina!')
	if StaminaOriginal < 50 then
		SetChaEquipValid(Player, 16, 1)
	end
	SynLook(Player)
	RefreshCha(Player)
end

function GetFairyLevelUpRate(level, num)
	local a
	if elf.useCustomRates then
		a = elf.levelUpRate[level] or (1 / (math.floor((1 + (math.pow((level / 10), 3))) * 10) / 10) * math.max(0.01, (1 - num * 0.05)))
	else
		a = 1 / (math.floor((1 + (math.pow((level / 10), 3))) * 10) / 10 * math.max(0.01, (1 - num * 0.05)))
		if level >= (elf.conf['normal']+1) then
			a = a * 0.75 
		end
	end
	return a
end

function FairyLevelUp(cha, fairy, attrtype, level, verbose)
	local fairyLv = GetFairyLevel(fairy)
	local attrCount = GetItemAttr(fairy, attrtype)
	local a = GetFairyLevelUpRate(fairyLv, attrCount)
	local fairyExp = GetItemAttr(fairy, ITEMATTR_ENERGY)
	local b = Percentage_Random(a)
	if b == 1 then
		AddItemEffect(cha, fairy, 0)
		fairyExp = 0
		SystemNotice(cha, "Fairy leveled up successfully, growth depleted.")
		attrCount = attrCount + level
		SetItemAttr(fairy, attrtype, attrCount)
		-- calculate fairy stamina and fairy growth
		local fairyEnergy = 240*(fairyLv+level)
		if fairyEnergy > 6480 then fairyEnergy = 6480; end
		local fairyMaxure = GetItemAttr(fairy, ITEMATTR_MAXURE) + 1000 * level
		if fairyMaxure > 32000 then fairyMaxure = 32000; end
		if fairyMaxure == 25000 then fairyMaxure = 25000+1 end
		-- set fairy stamina and growth
		SetItemAttr(fairy, ITEMATTR_MAXENERGY, fairyEnergy)
		SetItemAttr(fairy, ITEMATTR_MAXURE, fairyMaxure)
		ResetItemFinalAttr(fairy)
		AddItemEffect(cha, fairy, 1)
	else
		if verbose == 1 then
			fairyExp = 0
			SystemNotice(cha, 'Fairy level up failed, growth depleted.')
		else
			fairyExp = fairyExp * 0.5;
			SystemNotice(cha, 'Fairy level up failed, growth reduced by half.')
		end
	end
	if verbose == 1 then
		SetItemAttr(fairy, ITEMATTR_URE, 0)
	end		
	SetItemAttr(fairy, ITEMATTR_ENERGY, fairyExp)
	SynLook(cha)
end

function CheckFairyEXP(cha, Item, super)
	super = super or 0
	if super == 0 then
		if GetItemAttr(Item, ITEMATTR_ENERGY) >= GetItemAttr(Item, ITEMATTR_MAXENERGY) then
			return 1
		end
	end
	-- top2 "super" fruits {6842-6846}
	if super == 1 then
		if GetItemAttr(Item, ITEMATTR_ENERGY) >= (GetItemAttr(Item, ITEMATTR_MAXENERGY)/2) then
			return 1
		end
	end
	return 0
end

-- usage: AddLvFairy(role, 681, 'STR', 61)
function AddLvFairy(role, fairyid, stat, lv)
	local j = {} 
	j.n = {ITEMATTR_VAL_STR,ITEMATTR_VAL_CON,ITEMATTR_VAL_AGI,ITEMATTR_VAL_DEX,ITEMATTR_VAL_STA}
	j.s = {STR = ITEMATTR_VAL_STR,CON = ITEMATTR_VAL_CON,AGI = ITEMATTR_VAL_AGI,ACC = ITEMATTR_VAL_DEX,SPR = ITEMATTR_VAL_STA}
	if fairyid ~= nil then
		local ELFATTR_VAL_STAT
		if type(stat) == 'string' then ELFATTR_VAL_STAT = j.s[string.upper(stat)]
		elseif type(stat) == 'number' then ELFATTR_VAL_STAT = j.n[tonumber(stat)]
		else return nil;
		end
		local r1, r2 = MakeItem(role, fairyid, 1, 4)
		local elf_p = GetChaItem(role, 2, r2)
		if GetItemType(elf_p) == 59 then
			local elf_m = GetItemAttr(elf_p, ITEMATTR_MAXURE) + 1000 * lv
			if elf_m > 32000 then elf_m = 32000
			end
			local elf_e = 240 * lv
			if elf_e > 6480 then elf_e = 6480
			end
			SetItemAttr(elf_p, ELFATTR_VAL_STAT, lv)
			SetItemAttr(elf_p, ITEMATTR_VAL_LV, lv)
			SetItemAttr(elf_p, ITEMATTR_MAXURE, elf_m)
			SetItemAttr(elf_p, ITEMATTR_URE, elf_m)
			SetItemAttr(elf_p, ITEMATTR_MAXENERGY, elf_e)
			SetItemAttr(elf_p, ITEMATTR_ENERGY, elf_e)
			RefreshCha(role)
		else
			print('Err['..GetItemName(fairyid)..'] isnt a Fairy!')
			return nil;
		end
	end
end

function IsSpecialFairy(itemId)
end

function TransferFairyLv()
end

----------------------------------------------------------
-- ITEM USAGE:
----------------------------------------------------------
-- fruit of growth
elf.growthFruit = {}

	elf.growthFruit[0578] = {
		statelv = 1,
		time = 15,
		multi = 2,
	}
	elf.growthFruit[6838] = {
		statelv = 1,
		time = 30,
		multi = 2,
	}
	elf.growthFruit[6839] = {
		statelv = 2,
		time = 30,
		multi = 3,
	}

elf.handleGrowthFruit = function(role, Item, Item_Traget)
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat(role)
	if Cha_Boat ~= nil then 
		SystemNotice(role, "Cannot use while sailing") 
		UseItemFailed(role) 
		return 
	end
	if elf.growthFruit[GetItemID(Item)] == nil then
		SystemNotice(role, "Fruit has not been registered!")
		UseItemFailed(role)
		return
	end
	local ChaStateLv = GetChaStateLv(role, STATE_JLJSGZ)
	local statelv = elf.growthFruit[GetItemID(Item)].statelv
	if ChaStateLv == statelv then
		SystemNotice(role, "Same fruit in effect. Please use it later...")
		UseItemFailed(role)
		return
	end
	if ChaStateLv > statelv then
		SystemNotice(role, "Better fruit in effect. Please use it later...")
		UseItemFailed(role)
		return
	end
	local statetime = elf.growthFruit[GetItemID(Item)].time * 60
	AddState(role, role, STATE_JLJSGZ, statelv, statetime)
	SystemNotice(role, 'Fairy growth has been multiplied by x'..elf.growthFruit[GetItemID(Item)].multi..' for '..elf.growthFruit[GetItemID(Item)].time..' min(s)!')
end

function ItemUse_JLJSGz(role, Item, Item_Traget) elf.handleGrowthFruit(role, Item) end
function ItemUse_2BChengZhang(role, Item, Item_Traget) elf.handleGrowthFruit(role, Item) end
function ItemUse_3BChengZhang(role, Item, Item_Traget) elf.handleGrowthFruit(role, Item) end

elf.handleEggs = function(cha, Item, fairyId, gen)
	gen = gen or 1
	if GetChaFreeBagGridNum(cha) < 2 then
		SystemNotice(cha, "You need at least two free slot.")
		UseItemFailed(cha)
		return
	end
	local possessionId = 609
	GiveItem(cha, 0, possessionId, 1, 4)
	-- gen1 fairies
	if gen == 1 then
		GiveItem(cha, 0, fairyId, 1, 4)
	-- gen2 fairies
	elseif gen == 2 then
		local r1,r2 = MakeItem(cha, fairyId, 1, 4)
		local fairy = GetChaItem(cha, 2, r2)
		-- for possession
		local NumElf = GetItemForgeParam(fairy, 1)
		local Part1Elf = GetNum_Part1(NumElf)
		local Part2Elf = GetNum_Part2(NumElf)	
		local Part3Elf = GetNum_Part3(NumElf)
		local Part4Elf = GetNum_Part4(NumElf)
		local Part5Elf = GetNum_Part5(NumElf)
		local Part6Elf = GetNum_Part6(NumElf)
		local Part7Elf = GetNum_Part7(NumElf)
		NumElf = SetNum_Part1(NumElf, 1)
		NumElf = SetNum_Part2(NumElf, Part2Elf)
		NumElf = SetNum_Part3(NumElf, Part3Elf)
		NumElf = SetNum_Part4(NumElf, Part4Elf)
		NumElf = SetNum_Part5(NumElf, Part5Elf)
		NumElf = SetNum_Part6(NumElf, Part6Elf)
		NumElf = SetNum_Part7(NumElf, Part7Elf)
		SetItemForgeParam(fairy, 1, NumElf)
	end
	pkoLG('FairySystem', 'Player ['..GetChaDefaultName(cha)..'] opened a '..GetItemName(GetItemID(Item))..' and obtained a '..GetItemName(fairyId)..'!')
end

-- ajr egg
function ItemUse_AQLJLD(role, Item) elf.handleEggs(role, Item, elf.fairyId['angelajr'], 2) end
function ItemUse_MDXZESJLD(role, Item) elf.handleEggs(role, Item, elf.fairyId['mordojr'], 2) end

----------------------------------------------------------
-- FAIRY BOX:
----------------------------------------------------------
function ItemUse_JingLingBOX ( role, Item )
	local item_type = BaoXiang_JingLingBOX 
	local item_type_rad = BaoXiang_JingLingBOX_Rad 
	local item_type_count = BaoXiang_JingLingBOX_Count 
	local maxitem = BaoXiang_JingLingBOX_Mxcount
	local item_quality = BaoXiang_JingLingBOX_Qua
	local General = 0  
	local ItemId = 0 
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet <= 0 then
		SystemNotice(role ,"Insufficient inventory space. Unable to use Fairy Box")
		UseItemFailed ( role )
		return
	end
	for i = 1 , maxitem , 1 do 
		General = item_type_rad [ i ] + General
	end   
	local a = math.random ( 1, General )
	local b = 0
	local d = 0 
	local c = -1
	for k = 1 , maxitem , 1 do
		d = item_type_rad [ k ] + b
		 if a <= d and a > b then
			c = k
			break
		end 
		b = d 
	end 
	if c == -1 then 
		ItemId = 3124 
	else 
		ItemId = item_type [c]  
		ItemCount = item_type_count [c] 
	end 
	GiveItem ( role , 0 , ItemId , ItemCount , item_quality ) 
end