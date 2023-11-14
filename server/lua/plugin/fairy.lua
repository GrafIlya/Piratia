-- Credits: Angelix@pkodev.net, kong@pkodev.net

--Made slightly less terrible and converted to use pet equip slot by Billy

local ext = {}
ext.name = 'fairy.lua'
----------------------------------------------------------
-- вњ“ table for fairy level up rate
-- вњ“ variable for max Fairy level
-- вњ“ max fairy lv50
-- вњ“ lv46+ consumes great rations
-- вњ“ lv40+ consumes improved fruits to level up
-- вњ“ regular rations cannot be fed to angela/jr
-- вњ“ normal/great fruits cannot be fed to angela/jr (only improved)
-- вњ“ rations cannot be fed to fairys "level limit"+1
-- вњ“ autoration will not work on angela/jr
-- вњ“ all second gen pet have x2 drop/exp (variable to enable)
-- вњ“ angela jr have red possession
-- вњ“ Fix fairy possesion cooldown time
-- вњ“ added top2 rations
-- вњ“ added top2 fruits
-- вњ“ expert fairy poss should consume less rations than novice
-- вњ“ added top2 fruit of growth {6838,6839}
-- вњ“ Lv5 and above fairies will start producing fcoins
-- вњ“ Option to disable F.Coins
-- вњ“ 2nd gen fairy gains x2 less exp
-- вњ“ marriage configurations
-- вњ“ can no longer downgrade fairy skill
-- вњ“ new algorithm to add fairy skills (currently deletes other)
-- вњ“ fixed all expert fairy skills (medi in resume function)
-- TODO -> new fairy skill book {one that does x1.5 magic damage on mobs, one that increase hitrate?;TBD}
-- remove mordo from fairy box
----------------------------------------------------------
print('Loading '..ext.name);
pkoLG = pkoLG or print

----------------------------------------------------------
-- CONFIGURATIONS:
----------------------------------------------------------
ELEEXP_GETRAD = 9000		--> fairy exp rate
ELELFC_GETRAD = 10		--> fairy coin rate

local ELELFC_GETRAD = ELELFC_GETRAD

elf = elf or {}

	elf.conf	= {
		normal	= 500,	--> максимальный уровень сказки
		upgrade	= 1000,	--> максимальный уровень, когда обычный рацион больше не используется
		max		= 750,	--> максимальный уровень феи с улучшенными фруктами
		maximum = 1000
	}
	
	elf.FirstFairy = { 0231, 0232, 0233, 0234, 0235, 0236, 0237, 0681, 2679, 2680, 2681, 2682, 2683, 2684, 2685, 2686, 2687 }
	elf.SecondFairy = { 2688, 2689, 2690, 2691, 2692, 2693, 2694, 2695, 2696, 2697, 2698, 2699, 2700, 2701, 2702, 2703, 2704 }
	elf.ThirdFairy = { 2705, 2706, 2707, 2708, 2709, 2710, 2711, 2712, 2713, 2714, 2715, 2716, 2717, 2718, 2719, 2720, 2721 }
	elf.FourthFairy = { 2722, 2723, 2724, 2725, 2726, 2727, 2728, 2729, 2730, 2731, 2732, 2733, 2734, 2735, 2736, 2737, 2738 }
	elf.FifthFairy = { 2739, 2740, 2741, 2742, 2743, 2744, 2745, 2746, 2747, 2748, 2749, 2750, 2751, 2752, 2753, 2754, 2755 }
	elf.SixthFairy = { 2756, 2757, 2758, 2759, 2760, 2761, 2762, 2763, 2764, 2765, 2766, 2767, 2768, 2769, 2770, 2771, 2772 }
	elf.SeventhFairy = { 2773, 2774, 2775, 2776, 2777, 2778, 2779, 2780, 2781, 2782, 2783, 2784, 2785, 2786, 2787, 2788, 2789 }
	elf.EighthFairy = { 2790, 2791, 2792, 2793, 2794, 2795, 2796, 2797, 2798, 2799, 2800, 2801, 2802, 2803, 2804, 2805, 2806 }

	elf.LuckExpToAll = true;	--> Если это правда, все 2 -й поколение получают x2 exp/drop, когда возможно
	elf.minFairyCoin = 0;		--> Самая низкая сказочная LV, чтобы начать получать сказочные монеты
	elf.minToPossess = 50;		--> минимальная выносливость, чтобы
	elf.consumeStamP = false	--> Если это правда, когда Foss Fairy бросит выносливость
	elf.minFLvToPoss = 5;		--> Минимальный уровень для Fairy для использования POSS
	elf.disableFCoin = false	--> Если это правда, отключить фею, производящие F монеты

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
	Auto_Fruit(role, now_tick, Fairy )
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
			if fairyLv > 500 then
				fairyFreq = fairyFreq + (fairyLv - 500) * 5
			end
			-- 1nd gen .5 growth rate
			if IsSecondGen(cha, fairy) then
				fairyFreq = fairyFreq * 2
			end
			if IsFirstGen(cha, fairy) then
				fairyFreq = fairyFreq * 2
			end
			if IsThirdGen(cha, fairy) then
				fairyFreq = fairyFreq * 2
			end			
			if IsFourthGen(cha, fairy) then
				fairyFreq = fairyFreq * 2
			end			
			if IsFifthGen(cha, fairy) then
				fairyFreq = fairyFreq * 2
			end			
			if IsSixthGen(cha, fairy) then
				fairyFreq = fairyFreq * 2
			end			
			if IsSeventhGen(cha, fairy) then
				fairyFreq = fairyFreq * 2
			end			
			if IsEighthGen(cha, fairy) then
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
					Auto_Ration2(cha, fairy)
					Take_ElfURE(cha, fairy)
					Give_ElfEXP(cha, fairy)
					if not elf.disableFCoin then
						Give_FCoins(cha, fairy)
					end
				end
			end
		end
	end
end

----------------------------------------------------------
-- RATIONS:
----------------------------------------------------------
elf.ration = {}

	-- auto ration
	elf.ration[15849]	= {
		stam			= 50,
		prohibit		= {},
		max				= elf.conf['upgrade'],
		auto			= 1,
	}
	elf.ration[15848]	= {
		stam			= 50,
		prohibit		= {},
		max				= elf.conf['upgrade'],
	}
	elf.ration[0227]	= {
		stam			= 50,
		prohibit		= {},
		max				= elf.conf['upgrade'],
	}
	-- auto ration
	elf.ration[2312]	= {
		stam			= 50,
		prohibit		= {},
		max				= elf.conf['upgrade'],
		auto			= 1,
	}
	-- petfood
	elf.ration[3152]	= {
		stam			= 5,
		prohibit		= {},
		max				= elf.conf['upgrade'],
	}
	-- great fairy ration
	elf.ration[5380]	= {
		stam			= 100,
		prohibit		= {},
		max				= elf.conf['upgrade'],
	}
	-- great auto ration
	elf.ration[5381]	= {
		stam			= 100,
		prohibit		= {},
		max				= elf.conf['upgrade'],
		auto			= 1,
	}
	---- Happy Ration
	elf.ration[6841]	= {
		stam			= 50,
		prohibit		= {}, -- for 2gen pets
		max				= elf.conf['upgrade'],
		nodeduction		= 20 -- wont lose stamina for the next 20 minutes
	}
	---- Super Happy Ration
	elf.ration[6842]	= {
		stam			= 100,
		prohibit		= {}, -- for 2gen pets
		max				= elf.conf['upgrade'],
		nodeduction		= 40 -- wont lose stamina for the next 40 minutes
	}

-- AutoFairyRation+50(BOUND)
function ItemUse_50StamRation(role, Item, Item_Traget) elf.handleRation(role, Item, Item_Traget) end
-- FairyRation+50(BOUND)
function ItemUse_50AutoRation(role, Item, Item_Traget) elf.handleRation(role, Item, Item_Traget) end
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

-- Функция элемента по умолчанию для всех пайков
elf.handleRation = function(role, Item, fairy)
	-- check for boat
	local fairy = GetEquipItemP(role,16)
	
	if GetCtrlBoat(role) ~= nil then
		SystemNotice(role, 'Не возможно использовать во время плавания.')
		UseItemFailed(role)
		return
	end
	-- check fairy level
	local fairyLv = GetFairyLevel(fairy)
	local fairyId = GetItemID(fairy)
	--[[if fairyLv > elf.conf['max'] then
		Notice('System detected player '..GetChaDefaultName(role)..' with Lv '..fairyLv..' '..GetItemName(fairyId)..'!')
		UseItemFailed(role)
		return
	end]]
	local rationId = GetItemID(Item)
	local rationName = GetItemName(rationId)
	if elf.ration[rationId] == nil then
		SystemNotice(role, GetItemName(rationId)..' еще не был зарегистрирован!Пожалуйста, попробуйте еще раз...')
		UseItemFailed(role)
		return
	end
	if table.getn(elf.ration[rationId].prohibit) ~= 0 then
		for i = 1, table.getn(elf.ration[rationId].prohibit) do
			if fairyId == elf.ration[rationId].prohibit[i] then
				BickerNotice(role, 'Невозможно кормить '..GetItemName(rationId)..' к '..GetItemName(fairyId)..'!')
				UseItemFailed(role)
				return
			end
		end
	end
	if fairyLv >= elf.ration[rationId].max then
		SystemNotice(role, 'Феи выше уровня '..elf.conf['upgrade']..' Должена быть накормлена большими пайками!')
		UseItemFailed(role)
		return
	end
	local stam = elf.ration[rationId].stam * 50
	if GetItemType(Item) == 57 and GetItemType(fairy) == 59 then
		if GetItemAttr(fairy, ITEMATTR_URE) < GetItemAttr(fairy, ITEMATTR_MAXURE) then
			GiveFairyStamina(role, fairy, stam)
			-- top2
			if elf.ration[rationId].nodeduction ~= nil then
				if GetChaStateLv(role,200) >=  1 then 
					SystemNotice(role,"Счастливый рацион уже активен ")
					UseItemFailed(role)
				return
				
				end
				--elf.data[fairy] = os.time() + (elf.ration[rationId].nodeduction * 3600
				statstime = elf.ration[rationId].nodeduction * 60
			--	print(statstime)
				AddState ( role , role , 200 , 1 , statstime ) --happy rations stats --
				SystemNotice(role, GetItemName(fairyId)..' не потеряет выносливость на следующую '..elf.ration[rationId].nodeduction..' min(s)!')
			end
		else
			SystemNotice(role, GetItemName(fairyId)..' Выносливость в настоящее время заполнена.') 
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
	elf.fruit[0200]		= {
		level			= 1,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_STR
	}
	-- icespire plum
	elf.fruit[0201]		= {
		level			= 1,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_AGI
	}
	-- Zephyr fish floss
	elf.fruit[0202]		= {
		level			= 1,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_DEX
	}
	-- argent mango
	elf.fruit[0203]		= {
		level			= 1,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_CON
	}
	-- shaitan biscuit
	elf.fruit[0204]		= {
		level			= 1,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_STA
	}
	
	-- great snow dragon fruit
	elf.fruit[222]		= {
		level			= 2,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_STR
	}
	-- great icespire plum
	elf.fruit[223]		= {
		level			= 2,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_AGI
	}
	-- great Zephyr fish floss
	elf.fruit[224]		= {
		level			= 2,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_DEX
	}
	-- great argent mango
	elf.fruit[225]		= {
		level			= 2,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_CON
	}
	-- great shaitan biscuit
	elf.fruit[226]		= {
		level			= 2,
		max				= elf.conf['normal'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_STA
	}
	-- super snow dragon fruit
	elf.fruit[276]		= {
		level			= 2,
		max				= elf.conf['max'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_STR,
		super			= 1,	-- can be fed when growth is 50%+
	}
	-- super icespire plum
	elf.fruit[277]		= {
		level			= 2,
		max				= elf.conf['max'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_AGI,
		super			= 1
	}
	-- super Zephyr fish floss
	elf.fruit[278]		= {
		level			= 2,
		max				= elf.conf['max'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_DEX,
		super			= 1
	}
	-- super argent mango
	elf.fruit[279]		= {
		level			= 2,
		max				= elf.conf['max'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_CON,
		super			= 1
	}
	-- super shaitan biscuit
	elf.fruit[280]		= {
		level			= 2,
		max				= elf.conf['max'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_STA,
		super			= 1
	}
	-- Improved Strength Fruit
	elf.fruit[5000]		= {
		level			= 2,
		max				= elf.conf['maximum'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_STR,
	}
	-- Improved Agility Fruit
	elf.fruit[5001]		= {
		level			= 2,
		max				= elf.conf['maximum'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_AGI,
	}
	-- Improved Accuracy Fruit
	elf.fruit[5002]		= {
		level			= 1,
		max				= elf.conf['maximum'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_DEX,
	}
	-- Улучшенный конституционный фрукт
	elf.fruit[5003]		= {
		level			= 2,
		max				= elf.conf['maximum'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_CON,
		super			= 1
	}
	-- Улучшенный духовный фрукт
	elf.fruit[5004]		= {
		level			= 2,
		max				= elf.conf['maximum'],
		auto			= 1,
		prohibit		= {},
		stat			= ITEMATTR_VAL_STA,
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
function ItemUse_CJ_longguo2(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_koumei2(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_yusi2(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_guopu2(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_mibing2(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end

-- improved fruits
function ItemUse_CJ_longguo3(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_koumei3(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_yusi3(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_guopu3(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end
function ItemUse_CJ_mibing3(role, Item, Item_Traget) elf.handleFruits(role, Item, Item_Traget) end


elf.handleFruits = function(role, Item, fairy)
	local chaBoat = GetCtrlBoat(role)
	local fairy = GetEquipItemP(role,16)
	if chaBoat ~= nil then
		SystemNotice(role, 'Не может использовать сказочные фрукты во время плавания.')
		UseItemFailed(role)
		return
	end
	local fairyId = GetItemID(fairy)
	local fairyName = GetItemName(fairyId)
	if fairy ~= GetEquipItemP(role,16) then --GetChaItem(role, 2, 1) then
		SystemNotice(role, 'Фрукты могут быть поданы только феи находящейся в Слете Феи!')
		UseItemFailed(role)
		return
	end
	local fruitId = GetItemID(Item)
	if elf.fruit[fruitId] == nil then
		SystemNotice(role, GetItemName(fruitId)..' еще не был зарегистрирован!Пожалуйста, попробуйте еще раз...')
		UseItemFailed(role)
		return
	end
	-------check if slot empty or not---
    if fairyId == 0 then
        PopupNotice(role, 'В слоте для Феи отсутствует Фея!')
        UseItemFailed(role)
        return    
    end
	if GetFairyLevel(fairy) >= elf.fruit[fruitId].max then
		SystemNotice(role, fairyName..' достигла максимального уровня!')
		UseItemFailed(role)
		return
	end
	if table.getn(elf.fruit[fruitId].prohibit) ~= 0 then
		for i = 1, table.getn(elf.fruit[fruitId].prohibit) do
			if fairyId == elf.fruit[fruitId].prohibit[i] then
				SystemNotice(role, 'Невозможно кормить '..GetItemName(fruitId)..' к '..GetItemName(fairyId)..'...')
				UseItemFailed(role)
				return
			end
		end
	end
	if GetItemType(Item) == 58 and GetItemType(fairy) == 59 then
		local isSuper = elf.fruit[fruitId].super or 0
		if CheckFairyEXP(role, fairy, isSuper) == 0 then
			SystemNotice(role, fairyName..' не достиг максимального роста, неспособного кормить.') 
			UseItemFailed(role)
		else
			FairyLevelUp(role, fairy, elf.fruit[fruitId].stat, elf.fruit[fruitId].level, 0)
		end
	end
end



elf.useCustomRates = true;	--> if true, level up fairy rate will be as specified

elf.levelUpRate = {}
for i 							= 0, 1000 do						-- Lv1-300 Wings enchant rate.
	elf.levelUpRate[i]				= .8							-- 100%.
end


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

FirstGenFairy = {}
	FirstGenFairy[681] = true
	FirstGenFairy[231] = true
	FirstGenFairy[232] = true
	FirstGenFairy[233] = true
	FirstGenFairy[235] = true
	FirstGenFairy[234] = true
	FirstGenFairy[236] = true
	FirstGenFairy[237] = true
	FirstGenFairy[2679] = true
	FirstGenFairy[2680] = true
	FirstGenFairy[2681] = true
	FirstGenFairy[2682] = true
	FirstGenFairy[2683] = true
	FirstGenFairy[2684] = true
	FirstGenFairy[2685] = true
	FirstGenFairy[2686] = true
	FirstGenFairy[2687] = true
	

function IsFirstGen(cha, fairy)
	local fairyId = GetItemID(fairy)
	return FirstGenFairy[fairyId] or false
end

 function FixFirstGenFairy(role, fairy)
 	local fairyId = GetItemID(fairy)
 	if FirstGenFairy[fairyId] ~= nil then
		local Num_JL = GetItemForgeParam(fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
 		if Part1 ~= 1 then
			local num = GetItemForgeParam(fairy, 1)
			local i = 0
			num = SetNum_Part1(num, 1)
			i = SetItemForgeParam(fairy, 1, num)
			if i == 0 then
				pkoLG('FairySystem', 'Невозможно исправить '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end


SecondGenFairy = {}
	SecondGenFairy[2688] = true
	SecondGenFairy[2689] = true
	SecondGenFairy[2690] = true
	SecondGenFairy[2691] = true
	SecondGenFairy[2692] = true
	SecondGenFairy[2693] = true
	SecondGenFairy[2694] = true
	SecondGenFairy[2695] = true
	SecondGenFairy[2696] = true
	SecondGenFairy[2697] = true
	SecondGenFairy[2698] = true
	SecondGenFairy[2699] = true
	SecondGenFairy[2700] = true
	SecondGenFairy[2701] = true
	SecondGenFairy[2702] = true
	SecondGenFairy[2703] = true
	SecondGenFairy[2704] = true
	

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
				pkoLG('FairySystem', 'Невозможно исправить '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end

ThirdGenFairy = {}
	ThirdGenFairy[2705] = true
	ThirdGenFairy[2706] = true
	ThirdGenFairy[2707] = true
	ThirdGenFairy[2708] = true
	ThirdGenFairy[2709] = true
	ThirdGenFairy[2710] = true
	ThirdGenFairy[2711] = true
	ThirdGenFairy[2712] = true
	ThirdGenFairy[2713] = true
	ThirdGenFairy[2714] = true
	ThirdGenFairy[2715] = true
	ThirdGenFairy[2716] = true
	ThirdGenFairy[2717] = true
	ThirdGenFairy[2718] = true
	ThirdGenFairy[2719] = true
	ThirdGenFairy[2720] = true
	ThirdGenFairy[2721] = true
	

function IsThirdGen(cha, fairy)
	local fairyId = GetItemID(fairy)
	return ThirdGenFairy[fairyId] or false
end

 function FixThirdGenFairy(role, fairy)
 	local fairyId = GetItemID(fairy)
 	if ThirdGenFairy[fairyId] ~= nil then
		local Num_JL = GetItemForgeParam(fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
 		if Part1 ~= 1 then
			local num = GetItemForgeParam(fairy, 1)
			local i = 0
			num = SetNum_Part1(num, 1)
			i = SetItemForgeParam(fairy, 1, num)
			if i == 0 then
				pkoLG('FairySystem', 'Невозможно исправить '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end

FourthGenFairy = {}
	FourthGenFairy[2722] = true
	FourthGenFairy[2723] = true
	FourthGenFairy[2724] = true
	FourthGenFairy[2725] = true
	FourthGenFairy[2726] = true
	FourthGenFairy[2727] = true
	FourthGenFairy[2728] = true
	FourthGenFairy[2729] = true
	FourthGenFairy[2730] = true
	FourthGenFairy[2731] = true
	FourthGenFairy[2732] = true
	FourthGenFairy[2733] = true
	FourthGenFairy[2734] = true
	FourthGenFairy[2735] = true
	FourthGenFairy[2736] = true
	FourthGenFairy[2737] = true
	FourthGenFairy[2738] = true
	

function IsFourthGen(cha, fairy)
	local fairyId = GetItemID(fairy)
	return FourthGenFairy[fairyId] or false
end

 function FixFourthGenFairy(role, fairy)
 	local fairyId = GetItemID(fairy)
 	if FourthGenFairy[fairyId] ~= nil then
		local Num_JL = GetItemForgeParam(fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
 		if Part1 ~= 1 then
			local num = GetItemForgeParam(fairy, 1)
			local i = 0
			num = SetNum_Part1(num, 1)
			i = SetItemForgeParam(fairy, 1, num)
			if i == 0 then
				pkoLG('FairySystem', 'Невозможно исправить '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end

FifthGenFairy = {}
	FifthGenFairy[2739] = true
	FifthGenFairy[2740] = true
	FifthGenFairy[2741] = true
	FifthGenFairy[2742] = true
	FifthGenFairy[2743] = true
	FifthGenFairy[2744] = true
	FifthGenFairy[2745] = true
	FifthGenFairy[2746] = true
	FifthGenFairy[2747] = true
	FifthGenFairy[2748] = true
	FifthGenFairy[2749] = true
	FifthGenFairy[2750] = true
	FifthGenFairy[2751] = true
	FifthGenFairy[2752] = true
	FifthGenFairy[2753] = true
	FifthGenFairy[2754] = true
	FifthGenFairy[2755] = true
	

function IsFifthGen(cha, fairy)
	local fairyId = GetItemID(fairy)
	return FifthGenFairy[fairyId] or false
end

 function FixFifthGenFairy(role, fairy)
 	local fairyId = GetItemID(fairy)
 	if FifthGenFairy[fairyId] ~= nil then
		local Num_JL = GetItemForgeParam(fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
 		if Part1 ~= 1 then
			local num = GetItemForgeParam(fairy, 1)
			local i = 0
			num = SetNum_Part1(num, 1)
			i = SetItemForgeParam(fairy, 1, num)
			if i == 0 then
				pkoLG('FairySystem', 'Невозможно исправить '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end

SixthGenFairy = {}
	SixthGenFairy[2756] = true
	SixthGenFairy[2757] = true
	SixthGenFairy[2758] = true
	SixthGenFairy[2759] = true
	SixthGenFairy[2760] = true
	SixthGenFairy[2761] = true
	SixthGenFairy[2762] = true
	SixthGenFairy[2763] = true
	SixthGenFairy[2764] = true
	SixthGenFairy[2765] = true
	SixthGenFairy[2766] = true
	SixthGenFairy[2767] = true
	SixthGenFairy[2768] = true
	SixthGenFairy[2769] = true
	SixthGenFairy[2770] = true
	SixthGenFairy[2771] = true
	SixthGenFairy[2772] = true
	

function IsSixthGen(cha, fairy)
	local fairyId = GetItemID(fairy)
	return SixthGenFairy[fairyId] or false
end

 function FixSixthGenFairy(role, fairy)
 	local fairyId = GetItemID(fairy)
 	if SixthGenFairy[fairyId] ~= nil then
		local Num_JL = GetItemForgeParam(fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
 		if Part1 ~= 1 then
			local num = GetItemForgeParam(fairy, 1)
			local i = 0
			num = SetNum_Part1(num, 1)
			i = SetItemForgeParam(fairy, 1, num)
			if i == 0 then
				pkoLG('FairySystem', 'Невозможно исправить '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end

SeventhGenFairy = {}
	SeventhGenFairy[2773] = true
	SeventhGenFairy[2774] = true
	SeventhGenFairy[2775] = true
	SeventhGenFairy[2776] = true
	SeventhGenFairy[2777] = true
	SeventhGenFairy[2778] = true
	SeventhGenFairy[2779] = true
	SeventhGenFairy[2780] = true
	SeventhGenFairy[2781] = true
	SeventhGenFairy[2782] = true
	SeventhGenFairy[2783] = true
	SeventhGenFairy[2784] = true
	SeventhGenFairy[2785] = true
	SeventhGenFairy[2786] = true
	SeventhGenFairy[2787] = true
	SeventhGenFairy[2788] = true
	SeventhGenFairy[2789] = true
	

function IsSeventhGen(cha, fairy)
	local fairyId = GetItemID(fairy)
	return SeventhGenFairy[fairyId] or false
end

 function FixSeventhGenFairy(role, fairy)
 	local fairyId = GetItemID(fairy)
 	if SeventhGenFairy[fairyId] ~= nil then
		local Num_JL = GetItemForgeParam(fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
 		if Part1 ~= 1 then
			local num = GetItemForgeParam(fairy, 1)
			local i = 0
			num = SetNum_Part1(num, 1)
			i = SetItemForgeParam(fairy, 1, num)
			if i == 0 then
				pkoLG('FairySystem', 'Невозможно исправить '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end

EighthGenFairy = {}
	EighthGenFairy[2790] = true
	EighthGenFairy[2791] = true
	EighthGenFairy[2792] = true
	EighthGenFairy[2793] = true
	EighthGenFairy[2794] = true
	EighthGenFairy[2795] = true
	EighthGenFairy[2796] = true
	EighthGenFairy[2797] = true
	EighthGenFairy[2798] = true
	EighthGenFairy[2799] = true
	EighthGenFairy[2800] = true
	EighthGenFairy[2801] = true
	EighthGenFairy[2802] = true
	EighthGenFairy[2803] = true
	EighthGenFairy[2804] = true
	EighthGenFairy[2805] = true
	EighthGenFairy[2806] = true
	

function IsEighthGen(cha, fairy)
	local fairyId = GetItemID(fairy)
	return EighthGenFairy[fairyId] or false
end

 function FixEighthGenFairy(role, fairy)
 	local fairyId = GetItemID(fairy)
 	if EighthGenFairy[fairyId] ~= nil then
		local Num_JL = GetItemForgeParam(fairy, 1)
		local Part1 = GetNum_Part1(Num_JL)
 		if Part1 ~= 1 then
			local num = GetItemForgeParam(fairy, 1)
			local i = 0
			num = SetNum_Part1(num, 1)
			i = SetItemForgeParam(fairy, 1, num)
			if i == 0 then
				pkoLG('FairySystem', 'Невозможно исправить '..GetChaDefaultName(role)..'\'s '..GetItemName(fairyId)..'!')
			end
		end
	end
end



function SkillCooldown_JLFT(sklv)
	local Cooldown = 30000
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
	FixFirstGenFairy(role, item_elf)
	FixThirdGenFairy(role, item_elf)
	FixFourthGenFairy(role, fairy)
	FixFifthGenFairy(role, fairy)
	FixSixthGenFairy(role, fairy)
	FixSeventhGenFairy(role, fairy)
	FixEighthGenFairy(role, fairy)
	local Num_JL = GetItemForgeParam ( item_elf , 1 )
	local Part1 = GetNum_Part1(Num_JL)

	if item_elf_type ~= 59 or Part1 ~= 1 then
		SystemNotice(role, "Текущий навык доступен только в том случае, если новое поколение ПЭТ оснащено!" ) 
		SkillUnable(role) 
		return 
	end
	local str = GetItemAttr( item_elf ,ITEMATTR_VAL_STR )		-- Str Lv 
	local con = GetItemAttr( item_elf ,ITEMATTR_VAL_CON )		-- Con Lv 
	local agi = GetItemAttr( item_elf ,ITEMATTR_VAL_AGI )		-- Agi Lv 
	local dex = GetItemAttr( item_elf ,ITEMATTR_VAL_DEX )		-- Spr Lv 
	local sta = GetItemAttr( item_elf ,ITEMATTR_VAL_STA )		-- Acc Lv 
	local lv_JL = str + con + agi + dex + sta					-- Total Lv of Pet
	if lv_JL < elf.minFLvToPoss then
		SystemNotice ( role , "Фея должна быть как минимум уровня "..elf.minFLvToPoss.." что бы использовать Владение Фей!" ) 
		SkillUnable(role) 
		return
	end

	if item_elf_hp < (elf.minToPossess*50) then
		SystemNotice ( role , "Фея должна иметь хотя бы "..elf.minToPossess.." выносливости для активации этого навыка!" ) 
		SkillUnable(role) 
		return 
	end

	--elf.consumeStamP = elf.consumeStamP or true;
	--print(elf.consumeStamP)
	if elf.consumeStamP then
		local sub = item_elf_hp
		item_elf_hp = item_elf_hp - (6 * lv_JL / sklv) * 50
		sub = (sub - item_elf_hp) / 50
		SystemNotice(role, 'Владение Фей заняло '..GetItemName(GetItemID(item_elf))..' '..sub..' выносливости!')
		SetItemAttr(item_elf, ITEMATTR_URE, item_elf_hp)
		SynLook(role)
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

	if Item_ID == 231 or Item_ID == 232 or Item_ID == 233 or Item_ID == 234 or Item_ID == 235 or Item_ID == 236 or Item_ID == 237 or Item_ID == 681 or Item_ID == 2679 or Item_ID == 2680 or Item_ID == 2681 or Item_ID == 2682 or Item_ID == 2683 or Item_ID == 2684 or Item_ID == 2685 or Item_ID == 2686 or Item_ID == 2687 then
		AddState( ATKER, ATKER, STATE_JLFT8, statelv, statetime )
	end
	if Item_ID == 2688 or Item_ID == 2689 or Item_ID == 2690 or Item_ID == 2691 or Item_ID == 2692 or Item_ID == 2693 or Item_ID == 2694 or Item_ID == 2695 or Item_ID == 2696 or Item_ID == 2697 or Item_ID == 2698 or Item_ID == 2699 or Item_ID == 2700 or Item_ID == 2701 or Item_ID == 2702 or Item_ID == 2703 or Item_ID == 2704 then
		AddState( ATKER, ATKER, STATE_JLFT7, statelv, statetime )
	end
	if Item_ID == 2705 or Item_ID == 2706 or Item_ID == 2707 or Item_ID == 2708 or Item_ID == 2709 or Item_ID == 2710 or Item_ID == 2711 or Item_ID == 2712 or Item_ID == 2713 or Item_ID == 2714 or Item_ID == 2715 or Item_ID == 2716 or Item_ID == 2717 or Item_ID == 2718 or Item_ID == 2719 or Item_ID == 2720 or Item_ID == 2721 then
		AddState( ATKER, ATKER, STATE_JLFT6, statelv, statetime )
	end
	if Item_ID == 2722 or Item_ID == 2723 or Item_ID == 2724 or Item_ID == 2725 or Item_ID == 2726 or Item_ID == 2727 or Item_ID == 2728 or Item_ID == 2729 or Item_ID == 2730 or Item_ID == 2731 or Item_ID == 2732 or Item_ID == 2733 or Item_ID == 2734 or Item_ID == 2735 or Item_ID == 2736 or Item_ID == 2737 or Item_ID == 2738 then
		AddState( ATKER, ATKER, STATE_JLFT5, statelv, statetime )
	end
	if Item_ID == 2739 or Item_ID == 2740 or Item_ID == 2741 or Item_ID == 2742 or Item_ID == 2743 or Item_ID == 2744 or Item_ID == 2745 or Item_ID == 2746 or Item_ID == 2747 or Item_ID == 2748 or Item_ID == 2749 or Item_ID == 2750 or Item_ID == 2751 or Item_ID == 2752 or Item_ID == 2753 or Item_ID == 2754 or Item_ID == 2755 then
		AddState( ATKER, ATKER, STATE_JLFT4, statelv, statetime )
	end
	if Item_ID == 2756 or Item_ID == 2757 or Item_ID == 2758 or Item_ID == 2759 or Item_ID == 2760 or Item_ID == 2761 or Item_ID == 2762 or Item_ID == 2763 or Item_ID == 2764 or Item_ID == 2765 or Item_ID == 2766 or Item_ID == 2767 or Item_ID == 2768 or Item_ID == 2769 or Item_ID == 2770 or Item_ID == 2771 or Item_ID == 2772 then
		AddState( ATKER, ATKER, STATE_JLFT3, statelv, statetime )
	end
	if Item_ID == 2773 or Item_ID == 2774 or Item_ID == 2775 or Item_ID == 2776 or Item_ID == 2777 or Item_ID == 2778 or Item_ID == 2779 or Item_ID == 2780 or Item_ID == 2781 or Item_ID == 2782 or Item_ID == 2783 or Item_ID == 2784 or Item_ID == 2785 or Item_ID == 2786 or Item_ID == 2787 or Item_ID == 2788 or Item_ID == 2789 then
		AddState( ATKER, ATKER, STATE_JLFT2, statelv, statetime )
	end
	if Item_ID == 2790 or Item_ID == 2791 or Item_ID == 2792 or Item_ID == 2793 or Item_ID == 2794 or Item_ID == 2795 or Item_ID == 2796 or Item_ID == 2797 or Item_ID == 2798 or Item_ID == 2799 or Item_ID == 2800 or Item_ID == 2801 or Item_ID == 2802 or Item_ID == 2803 or Item_ID == 2804 or Item_ID == 2805 or Item_ID == 2806 then
		AddState( ATKER, ATKER, STATE_JLFT1, statelv, statetime )
	end
end 

function State_JLFT_Add(Player, Lv)
	local Fairy = GetEquipItemP(Player,16)--GetChaItem(Player, 2, 1)
	local FairyType = GetItemType(Fairy)	
	if FairyType == 59 then 
		local  FairyID = GetItemID ( Fairy )	
		local str = GetItemAttr( Fairy ,ITEMATTR_VAL_STR )
		local con = GetItemAttr( Fairy ,ITEMATTR_VAL_CON )
		local agi = GetItemAttr( Fairy ,ITEMATTR_VAL_AGI )
		local dex = GetItemAttr( Fairy ,ITEMATTR_VAL_DEX )
		local sta = GetItemAttr( Fairy ,ITEMATTR_VAL_STA )
		local URE = GetItemAttr( Fairy ,ITEMATTR_URE )
		local MAXURE = GetItemAttr( Fairy ,ITEMATTR_MAXURE )
		local FairyLv = GetFairyLevel(Fairy)
		local lv_JL = str + con + agi + dex + sta
		local Num_JL = GetItemForgeParam ( Fairy , 1 )

		-- No idea Wtf these are for
		local Part1 = 1

		-- cheaters
		if FairyLv > (elf.conf['maximum']+2) then
			pkoLG('FairySystem', '['..GetChaDefaultName(Player)..'] casted fairy possession with Lv'..FairyLv..' '..GetItemName(GetItemID(Fairy))..'!');
		end
		
		if Part1 == 1 then
			local star = 0
			local statelv = lv_JL * 0.025 * ( sklv + 1 ) * 0.05
			
---------------------------------------------------------------
---  					Феи 1 генерациии					---
---------------------------------------------------------------
if FairyID == 231 then
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 232 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 233 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 234 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 235 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 236 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 237 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 681 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2679 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2680 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2681 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2682 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2683 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2684 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2685 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2686 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
if FairyID == 2687 then 
				if str~=nil and str~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STR)
				end
				if con~=nil and con~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_CON)
				end
				if sta~=nil and sta~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_STA)
				end
				if dex~=nil and dex~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_DEX)
				end
				if agi~=nil and agi~=0 then
					local star = lv_JL
					SetCharaAttr(star, Player, ATTR_STATEV_AGI)
				end
				local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 1
				SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
			end
---------------------------------------------------------------
---  					Феи 2 генерациии					---
---------------------------------------------------------------
if FairyID == 2688 then 
	if str~=nil and str~=0 then
		local star = lv_JL *1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2689 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2690 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2691 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2692 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2693 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2694 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2695 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2696 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2697 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2698 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2699 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2700 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2701 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2702 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2703 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2704 then 
	if str~=nil and str~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*1.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 2
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
---------------------------------------------------------------
---  					Феи 3 генерациии					---
---------------------------------------------------------------
if FairyID == 2705 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2706 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2707 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2708 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2709 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2710 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2711 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2712 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2713 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2714 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2715 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2716 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2717 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2718 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2719 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2720 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2721 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 3
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
---------------------------------------------------------------
---  					Феи 4 генерациии					---
---------------------------------------------------------------
if FairyID == 2722 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2723 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2724 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2725 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2726 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2727 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2728 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2729 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2730 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2731 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2732 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2733 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2734 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2735 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2736 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2737 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2738 then 
	if str~=nil and str~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*2.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 4
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
---------------------------------------------------------------
---  					Феи 5 генерациии					---
---------------------------------------------------------------
if FairyID == 2739 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2740 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2741 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2742 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2743 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2744 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2745 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2746 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2747 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2748 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2749 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2750 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2751 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2752 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2753 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2754 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2755 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 5
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
---------------------------------------------------------------
---  					Феи 6 генерациии					---
---------------------------------------------------------------
if FairyID == 2756 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2757 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2758 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2759 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2760 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2761 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2762 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2763 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2764 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2765 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2766 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2767 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2768 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2769 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2770 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2771 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2772 then 
	if str~=nil and str~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*3.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 6
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
---------------------------------------------------------------
---  					Феи 7 генерациии					---
---------------------------------------------------------------
if FairyID == 2773 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2774 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2775 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2776 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2777 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2778 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2779 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2780 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2781 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2782 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2783 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2784 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2785 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2786 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2787 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2788 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2789 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 7
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
---------------------------------------------------------------
---  					Феи 8 генерациии					---
---------------------------------------------------------------
if FairyID == 2790 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2791 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2792 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2793 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2794 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2795 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2796 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2797 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2798 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2799 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2800 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2801 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2802 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2803 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2804 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2805 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end
if FairyID == 2806 then 
	if str~=nil and str~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STR)
	end
	if con~=nil and con~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_CON)
	end
	if sta~=nil and sta~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_STA)
	end
	if dex~=nil and dex~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_DEX)
	end
	if agi~=nil and agi~=0 then
		local star = lv_JL*4.5
		SetCharaAttr(star, Player, ATTR_STATEV_AGI)
	end
	local star = GetChaAttr( Player, ATTR_STATEV_PDEF ) + 8
	SetCharaAttr(star, Player, ATTR_STATEV_PDEF)
end

	RefreshCha(Player)
	ALLExAttrSet(Player)
end
end
end

function State_JLFT_Rem(Player, Lv)


	SetCharaAttr(0, Player, ATTR_STATEV_STR ) 
	SetCharaAttr(0, Player, ATTR_STATEV_AGI ) 
	SetCharaAttr(0, Player, ATTR_STATEV_DEX ) 
	SetCharaAttr(0, Player, ATTR_STATEV_CON ) 
	SetCharaAttr(0, Player, ATTR_STATEV_STA )
	SetCharaAttr(0, Player, ATTR_STATEV_PDEF )
	ALLExAttrSet(Player)
	RefreshCha(Player)
end

----------------------------------------------------------
-- MARRIAGE:
----------------------------------------------------------
function can_jlborn_item_main ( Table )
	local role = 0
	local ItemBag = {}
	local ItemCount = {}
	local ItemBagCount = {}
	local ItemBag_Now = 0
	local ItemCount_Now = 0
	local ItemBagCount_Num = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Now , ItemCount_Now , ItemBagCount_Num = Read_Table ( Table )

	if ItemCount [1] ~= 1 or ItemCount [2] ~= 1 or ItemBagCount [1] ~= 1 or ItemBagCount [2] ~= 1 then
		SystemNotice ( role ,"\205\229\231\224\234\238\237\237\238\229 \234\238\235\232\247\229\241\242\226\238 \238\225\238\240\243\228\238\226\224\237\232\255")
		--SystemNotice ( role ,"Незаконное количество оборудования")
		return 0
	end

	local Item_EMstone = GetChaItem ( role , 2 , ItemBag [0] )
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )
	local Item_JLother = GetChaItem ( role , 2 , ItemBag [2] )
	local Item_JLone_ID = GetItemID ( Item_JLone )
	local Item_JLother_ID = GetItemID ( Item_JLother )

	local str_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )
	local con_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )
	local agi_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )
	local dex_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )
	local sta_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )
	local URE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_URE )
	local MAXURE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_MAXURE )
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone

	local str_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )
	local con_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )
	local agi_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )
	local dex_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )
	local sta_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )
	local URE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_URE )
	local MAXURE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_MAXURE )
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother

	local Num_JLone = GetItemForgeParam ( Item_JLone , 1 )
	local Part1_JLone = GetNum_Part1 ( Num_JLone )
	local Part2_JLone = GetNum_Part2 ( Num_JLone )
	local Part3_JLone = GetNum_Part3 ( Num_JLone )
	local Part4_JLone = GetNum_Part4 ( Num_JLone )
	local Part5_JLone = GetNum_Part5 ( Num_JLone )
	local Part6_JLone = GetNum_Part6 ( Num_JLone )
	local Part7_JLone= GetNum_Part7 ( Num_JLone )

	local Num_JLother = GetItemForgeParam ( Item_JLother , 1 )
	local Part1_JLother = GetNum_Part1 ( Num_JLother )
	local Part2_JLother = GetNum_Part2 ( Num_JLother )
	local Part3_JLother = GetNum_Part3 ( Num_JLother )
	local Part4_JLother = GetNum_Part4 ( Num_JLother )
	local Part5_JLother = GetNum_Part5 ( Num_JLother )
	local Part6_JLother = GetNum_Part6 ( Num_JLother )
	local Part7_JLother= GetNum_Part7 ( Num_JLother )
	local Item_CanGet = GetChaFreeBagGridNum ( role )
	if Item_CanGet < 3 then
		SystemNotice(role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \242\240\229\225\243\229\242\241\255 \234\224\234 \236\232\237\232\236\243\236 3 \241\226\238\225\238\228\237\251\245 \241\235\238\242\224 \226 \232\237\226\229\237\242\224\240\229")
		--SystemNotice(role ,"Для Брака фей требуется как минимум 3 свободных слота в инвентаре")
		return 0
	end

	local  Item_EMstone_ID = GetItemID ( Item_EMstone )
	if Item_EMstone_ID ~= 3918 and Item_EMstone_ID ~= 3919 and Item_EMstone_ID ~= 3920 and Item_EMstone_ID ~= 3921 and Item_EMstone_ID ~= 3922 and Item_EMstone_ID ~= 3924 and Item_EMstone_ID ~= 3925 then
		SystemNotice( role ,"\206\248\232\225\234\224 \232\241\239\238\235\252\231\238\226\224\237\232\255 \196\229\236\238\237\232\247\229\241\234\238\227\238 \244\240\243\234\242\224")
		--SystemNotice( role ,"Ошибка использования Демонического фрукта")
		return 0
	end

	if Item_EMstone_ID == 3918 then
	local i1 = CheckBagItem( role, 4530 )
	local i2 = CheckBagItem( role,3434 )
	if Item_JLone_ID ~= Item_JLother_ID then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \238\228\232\237\224\234\238\226\238\227\238 \242\232\239\224 \244\229\233!")
			--SystemNotice( role ,"Для Брака фей необходимо иметь одинакового типа фей!")
			return 0
		end


		if i1 < 500 or i2 < 500 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3919 then
	local i1 = CheckBagItem( role, 4531 )
	local i2 = CheckBagItem( role, 3435 )
	if Item_JLone_ID ~= Item_JLother_ID then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \238\228\232\237\224\234\238\226\238\227\238 \242\232\239\224 \244\229\233!")
			--SystemNotice( role ,"Для Брака фей необходимо иметь одинакового типа фей!")
			return 0
		end

		if i1 < 500 or i2 < 500 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3920 then
	local i1 = CheckBagItem( role,1196 )
	local i2 = CheckBagItem( role,3436 )
	if Item_JLone_ID ~= Item_JLother_ID then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \238\228\232\237\224\234\238\226\238\227\238 \242\232\239\224 \244\229\233!")
			--SystemNotice( role ,"Для Брака фей необходимо иметь одинакового типа фей!")
			return 0
		end

		if i1 < 500 or i2 < 500 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3921 then
	local i1 = CheckBagItem( role, 4537  )
	local i2 = CheckBagItem( role, 3437 )
	if Item_JLone_ID ~= Item_JLother_ID then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \238\228\232\237\224\234\238\226\238\227\238 \242\232\239\224 \244\229\233!")
			--SystemNotice( role ,"Для Брака фей необходимо иметь одинакового типа фей!")
			return 0
		end

		if i1 < 500 or i2 < 500 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3922 then
	local i1 = CheckBagItem( role,4540 )
	local i2 = CheckBagItem( role,3443 )
	if Item_JLone_ID ~= Item_JLother_ID then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \238\228\232\237\224\234\238\226\238\227\238 \242\232\239\224 \244\229\233!")
			--SystemNotice( role ,"Для Брака фей необходимо иметь одинакового типа фей!")
			return 0
		end

		if i1 < 500 or i2 < 500 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3924 then
	local i1 = CheckBagItem( role, 1253 )
	local i2 = CheckBagItem( role, 3442 )
	if Item_JLone_ID ~= Item_JLother_ID then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \238\228\232\237\224\234\238\226\238\227\238 \242\232\239\224 \244\229\233!")
			--SystemNotice( role ,"Для Брака фей необходимо иметь одинакового типа фей!")
			return 0
		end

		if i1 < 500 or i2 < 500 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	if Item_EMstone_ID == 3925 then
	local i1 = CheckBagItem( role, 4533 )
	local i2 = CheckBagItem( role, 3444 )
	if Item_JLone_ID ~= Item_JLother_ID then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \237\229\238\225\245\238\228\232\236\238 \232\236\229\242\252 \238\228\232\237\224\234\238\226\238\227\238 \242\232\239\224 \244\229\233!")
			--SystemNotice( role ,"Для Брака фей необходимо иметь одинакового типа фей!")
			return 0
		end

		if i1 < 999 or i2 < 999 then
			SystemNotice( role ,"\196\235\255 \193\240\224\234\224 \244\229\233 \238\242\241\243\242\241\242\226\243\254\242 \237\229\234\238\242\238\240\251\229 \237\229\238\225\245\238\228\232\236\251\229 \253\235\229\236\229\237\242\251")
			--SystemNotice( role ,"Для Брака фей отсутствуют некоторые необходимые элементы")
			return 0
		end
	end

	local ItemType_JLone = GetItemType (Item_JLone)
	local ItemType_JLother = GetItemType (Item_JLother)
	if  ItemType_JLone ~=59 or ItemType_JLother ~=59  then
			SystemNotice( role ,"\194\251 \237\229 \239\238\236\229\241\242\232\235\232 \241\226\238\229\227\238 \239\232\242\238\236\246\224.")
			--SystemNotice( role ,"Вы не поместили своего питомца.")
		return 0
	end

	if ItemBag [1]==ItemBag [2] then
		SystemNotice( role ,"\204\232\235\251\233 \236\238\233 \240\229\225\184\237\238\234, \234\224\234 \236\238\230\237\238 \230\229\237\232\242\252\241\255 \237\224 \241\229\225\229?")
		--SystemNotice( role ,"Милый мой ребёнок, как можно жениться на себе?")
		return 0
	end

	--if  Part1_JLone ~=59 or Part1_JLother ~=59 and Part1_JLone ~=0 or Part1_JLother ~=0 then
		--SystemNotice( role ,"\210\238\235\252\234\238 \237\238\240\236\224\235\252\237\251\229 \244\229\232 \236\238\227\243\242 \226\241\242\243\239\224\242\252 \226 \225\240\224\234")
		--SystemNotice( role ,"Только нормальные феи могут вступать в брак")
		--return 0
	--end

	if  lv_JLone < 149 or lv_JLother < 149   then
		SystemNotice( role ,"\207\232\242\238\236\246\251 \237\232\230\229 150 \243\240\238\226\237\255 \237\229 \236\238\227\243\242 \230\229\237\232\242\252\241\255")
		--SystemNotice( role ,"Питомцы ниже 20 уровня не могут жениться")
		return 0
	end

	if URE_JLone < MAXURE_JLone or URE_JLone < MAXURE_JLone then
		SystemNotice( role ,"\193\240\224\234 \255\226\235\255\229\242\241\255 \242\240\243\228\238\229\236\234\232\236 \239\240\238\246\229\241\241\238\236. \207\238\230\224\235\243\233\241\242\224, \237\224\234\238\240\236\232\242\229 \239\238\235\237\238\241\242\252\254 \226\224\248\232\245 \239\232\242\238\236\246\229\226")
		--SystemNotice( role ,"Брак является трудоемким процессом. Пожалуйста, накормите полностью ваших питомцев")
		return 0
	end

	local Money_Need = getjlborn_money_main ( Table )
	local Money_Have = GetChaAttr ( role , ATTR_GD )
	if Money_Need > Money_Have then
		SystemNotice( role ,"\205\229\228\238\241\242\224\242\238\247\237\238 \231\238\235\238\242\224. \208\238\230\228\229\237\232\229 \237\238\226\238\227\238 \239\232\242\238\236\246\224 \237\229\226\238\231\236\238\230\237\238.")
		--SystemNotice( role ,"Недостаточно золота. Рождение нового питомца невозможно.")
		return 0
	end
	return 1
end


function jlborn_item ( Table )
	local role = 0
	local ItemBag = {}											
	local ItemCount = {}											
	local ItemBagCount = {}										
	local ItemBag_Num = 0
	local ItemCount_Num = 0
	local ItemBagCount_Num = 0
	local ItemID_Cuihuaji = 0
	role , ItemBag , ItemCount , ItemBagCount , ItemBag_Num , ItemCount_Num , ItemBagCount_Num = Read_Table ( Table )
	local Item_EMstone = GetChaItem ( role , 2 , ItemBag [0] )				
	local Item_JLone = GetChaItem ( role , 2 , ItemBag [1] )					
	local Item_JLother = GetChaItem ( role , 2 , ItemBag [2] )				
	local  Item_EMstone_ID = GetItemID ( Item_EMstone )					 
	local  Item_JLone_ID = GetItemID ( Item_JLone )						 
	local  Item_JLother_ID = GetItemID ( Item_JLother )					 
	local str_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STR )			  
	local con_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_CON )			 
	local agi_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_AGI )			 
	local dex_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_DEX )			  
	local sta_JLone = GetItemAttr( Item_JLone ,ITEMATTR_VAL_STA )			  
	local URE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_URE )			
	local MAXURE_JLone = GetItemAttr( Item_JLone ,ITEMATTR_MAXURE )		 
	local lv_JLone = str_JLone + con_JLone + agi_JLone + dex_JLone + sta_JLone	
	local str_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STR )		
	local con_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_CON )		  
	local agi_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_AGI )		 
	local dex_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_DEX )		 
	local sta_JLother = GetItemAttr( Item_JLother ,ITEMATTR_VAL_STA )		 
	local URE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_URE )			    
	local MAXURE_JLother = GetItemAttr( Item_JLother ,ITEMATTR_MAXURE )	 
	local lv_JLother = str_JLother + con_JLother + agi_JLother + dex_JLother + sta_JLother 
	local Num_JLone = GetItemForgeParam ( Item_JLone , 1 )
	local Part1_JLone = GetNum_Part1 ( Num_JLone )	
	local Part2_JLone = GetNum_Part2 ( Num_JLone )	
	local Part3_JLone = GetNum_Part3 ( Num_JLone )
	local Part4_JLone = GetNum_Part4 ( Num_JLone )
	local Part5_JLone = GetNum_Part5 ( Num_JLone )
	local Part6_JLone = GetNum_Part6 ( Num_JLone )
	local Part7_JLone= GetNum_Part7 ( Num_JLone )
	local Num_JLother = GetItemForgeParam ( Item_JLother , 1 )
	local Part1_JLother = GetNum_Part1 ( Num_JLother )	
	local Part2_JLother = GetNum_Part2 ( Num_JLother )	
	local Part3_JLother = GetNum_Part3 ( Num_JLother )
	local Part4_JLother = GetNum_Part4 ( Num_JLother )
	local Part5_JLother = GetNum_Part5 ( Num_JLother )
	local Part6_JLother = GetNum_Part6 ( Num_JLother )
	local Part7_JLother= GetNum_Part7 ( Num_JLother )
	local new_str = math.floor ((str_JLone+str_JLother)*0.125 )
	local new_con = math.floor ((con_JLone+con_JLother)*0.125 )
	local new_agi = math.floor ((agi_JLone+agi_JLother)*0.125 )
	local new_dex = math.floor ((dex_JLone+dex_JLother)*0.125 )
	local new_sta = math.floor ((sta_JLone+sta_JLother)*0.125 )
	local new_lv = new_str + new_con + new_agi + new_dex + new_sta
	local new_MAXENERGY = 240 * ( new_lv + 1 )
	if new_MAXENERGY > 6480 then
		new_MAXENERGY = 6480
	end
	local new_MAXURE = 5000 + 1000*new_lv
	if new_MAXURE > 32000 then
		new_MAXURE = 32000
	end	
	if Item_EMstone_ID ==3918 then	--Фрукт для спарки Анжелы
		local j1 = TakeItem( role, 0,4530, 500 )	--Первый лут для спарки
		local j2 = TakeItem( role, 0,3434, 500 )		--Второй лут для спарки
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local r1 = 0
		local r2 = 0

	if Item_JLone_ID ==231 or Item_JLother_ID ==231 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2688  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==232 or Item_JLother_ID ==232 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2689  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==233 or Item_JLother_ID ==233 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2690  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==234 or Item_JLother_ID ==234 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2691  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==235 or Item_JLother_ID ==235 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2692  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==236 or Item_JLother_ID ==236 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2693  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==237 or Item_JLother_ID ==237 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2694  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==681 or Item_JLother_ID ==681 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2695  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2679 or Item_JLother_ID ==2679 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2696  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2680 or Item_JLother_ID ==2680 then
		if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLother>=150 then
			--Проверка на 150+ лвл феи
				r1,r2 =MakeItem ( role , 2697  , 1 , 4 )--Фея 2 гена
			--id феи, которая дается
			end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2681 or Item_JLother_ID ==2681 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2698  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2682 or Item_JLother_ID ==2682 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2699  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2683 or Item_JLother_ID ==2683 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2700  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2684 or Item_JLother_ID ==2684 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2701  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2685 or Item_JLother_ID ==2685 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2702  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2686 or Item_JLother_ID ==2686 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2703  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	if Item_JLone_ID ==2687 or Item_JLother_ID ==2687 then
		if Item_JLone_ID==Item_JLother_ID then
		if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
		--Проверка на 150+ лвл феи
		r1,r2 =MakeItem ( role , 2704  , 1 , 4 )--Фея 2 гена
		--id феи, которая дается
		end
		end
	else
		SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
	end

	local Item_newJL = GetChaItem ( role , 2 , r2 )
	local Item_newJL_ID = GetItemID ( Item_newJL )
	local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
	local Part1_newJL = GetNum_Part1 ( Num_newJL )
	local Part2_newJL = GetNum_Part2 ( Num_newJL )
	local Part3_newJL = GetNum_Part3 ( Num_newJL )
	local Part4_newJL = GetNum_Part4 ( Num_newJL )
	local Part5_newJL = GetNum_Part5 ( Num_newJL )
	local Part6_newJL = GetNum_Part6 ( Num_newJL )
	local Part7_newJL = GetNum_Part7 ( Num_newJL )
	if lv_JLone>=20 and lv_JLother >=20 then
		Part2_newJL = 6
		Part3_newJL = 1
	end
	if lv_JLone>=25 and lv_JLother >=25 then
		Part2_newJL = 6
		Part3_newJL = 2
	end
	if lv_JLone>=35 and lv_JLother >=35 then
		Part2_newJL = 6
		Part3_newJL = 3
	end
	local rad1 = math.random ( 1, 100 )
	if Part3_newJL==3 then
		GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
	end
	if Part3_newJL==2 then
		if rad1 <=95 then
			GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
		elseif rad1 > 95 and rad1 <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
		end
	end
	if Part3_newJL==1 then
		if rad1 <=90 then
			GiveItem ( role , 0 , 239  , 1 , 4 )	--Начальное влад. феей
		elseif rad1 > 90 and rad1 <=98 then
			GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
		elseif rad1 > 98 and rad1 <=100 then
			GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
		end
	end
	Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
	Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
	Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
	Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
	Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
	Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
	Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
	SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
	SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
	SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY )
	SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
end
	-----------------------------------------------------------------------------------------
	------                 Спаривание 2 Ген----------->3 Ген							-----
	-----------------------------------------------------------------------------------------
	if Item_EMstone_ID ==3919 then--Фрукт для спарки мл. Анжелы
		local j1 = TakeItem( role, 0,4531, 500 )
		local j2 = TakeItem( role, 0,3435, 500 )

		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local r1 = 0
		local r2 = 0

		if Item_JLone_ID ==2688 or Item_JLother_ID ==2688 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2705  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2689 or Item_JLother_ID ==2689 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2706  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2690 or Item_JLother_ID ==2690 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2707  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2691 or Item_JLother_ID ==2691 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2708  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2692 or Item_JLother_ID ==2692 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2709  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2693 or Item_JLother_ID ==2693 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2710  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2694 or Item_JLother_ID ==2694 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2711  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2695 or Item_JLother_ID ==2695 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2712  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2696 or Item_JLother_ID ==2696 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2713  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2697 or Item_JLother_ID ==2697 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2714  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2698 or Item_JLother_ID ==2698 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2715  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2699 or Item_JLother_ID ==2699 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2716  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2700 or Item_JLother_ID ==2700 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2717  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2701 or Item_JLother_ID ==2701 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2718  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2702 or Item_JLother_ID ==2702 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2719  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2703 or Item_JLother_ID ==2703 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2720  , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2704 or Item_JLother_ID ==2704 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=150 and lv_JLone>=150 and lv_JLother>=150 and lv_JLother>=150 then
			r1,r2 =MakeItem ( role , 2721 , 1 , 4 )--Фея Анжела младшая
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 7
			Part3_newJL = 1
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 7
			Part3_newJL = 2
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 7
			Part3_newJL = 3
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 )	--Начальное влад. феей
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )	----------¶юЧЄ±кјЗ
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_DEX , new_dex )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
	end
	-----------------------------------------------------------------------------------------
	------                 Спаривание 3 Ген----------->4 Ген							-----
	-----------------------------------------------------------------------------------------
	if Item_EMstone_ID ==3920 then	--Фрукт для спарки дракона
		local j1 =TakeItem( role, 0, 1196, 500 )	--Первый лут для драка
		local j2 = TakeItem( role, 0,3436, 500 )	--Второй лут для драка
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0

		if Item_JLone_ID ==2705 or Item_JLother_ID ==2705 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2722  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2706 or Item_JLother_ID ==2706 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2723  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2707 or Item_JLother_ID ==2707 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2724  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2708 or Item_JLother_ID ==2708 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2725  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2709 or Item_JLother_ID ==2709 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2726  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2710 or Item_JLother_ID ==2710 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2727  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2711 or Item_JLother_ID ==2711 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2728  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2712 or Item_JLother_ID ==2712 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2729  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2713 or Item_JLother_ID ==2713 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2730  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2714 or Item_JLother_ID ==2714 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2731  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2715 or Item_JLother_ID ==2715 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2732  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2716 or Item_JLother_ID ==2716 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2733  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2717 or Item_JLother_ID ==2717 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2734  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2718 or Item_JLother_ID ==2718 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2735  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2719 or Item_JLother_ID ==2719 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2736  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2720 or Item_JLother_ID ==2720 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2737  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2721 or Item_JLother_ID ==2721 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2738  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 8
			Part3_newJL = 1
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 8
			Part3_newJL = 2
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 8
			Part3_newJL = 3
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 )	--Начальное влад. феей
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
	end

	-----------------------------------------------------------------------------------------
	------                 Спаривание 4 Ген----------->5 Ген							-----
	-----------------------------------------------------------------------------------------
	
	if Item_EMstone_ID ==3921 then	--Фрукт для спарки дракона
		local j1 =TakeItem( role, 0, 4537, 500 )	--Первый лут для драка
		local j2 = TakeItem( role, 0, 3437, 500 )	--Второй лут для драка
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0

		if Item_JLone_ID ==2722 or Item_JLother_ID ==2722 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2739  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2723 or Item_JLother_ID ==2723 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2740  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2724 or Item_JLother_ID ==2724 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2741  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2725 or Item_JLother_ID ==2725 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2742  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2726 or Item_JLother_ID ==2726 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2743  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2727 or Item_JLother_ID ==2727 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2744  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2728 or Item_JLother_ID ==2728 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2745  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2729 or Item_JLother_ID ==2729 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2746  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2730 or Item_JLother_ID ==2730 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2747 , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2731 or Item_JLother_ID ==2731 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2748  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2732 or Item_JLother_ID ==2732 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2749  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2733 or Item_JLother_ID ==2733 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2750  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2734 or Item_JLother_ID ==2734 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2751  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2735 or Item_JLother_ID ==2735 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2752  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2736 or Item_JLother_ID ==2736 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2753  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2737 or Item_JLother_ID ==2737 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2754  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2738 or Item_JLother_ID ==2738 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2755  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 9
			Part3_newJL = 1
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 9
			Part3_newJL = 2
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 9
			Part3_newJL = 3
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 )	--Начальное влад. феей
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
	end
	-----------------------------------------------------------------------------------------
	------                 Спаривание 5 Ген----------->6 Ген							-----
	-----------------------------------------------------------------------------------------
	if Item_EMstone_ID ==3922 then	--Фрукт для спарки дракона
		local j1 =TakeItem( role, 0, 4540, 500 )	--Первый лут для драка
		local j2 = TakeItem( role, 0, 3443, 500 )	--Второй лут для драка
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0

		if Item_JLone_ID ==2739 or Item_JLother_ID ==2739 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2756  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2740 or Item_JLother_ID ==2740 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2757  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2741 or Item_JLother_ID ==2741 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2758  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2742 or Item_JLother_ID ==2742 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2759  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2743 or Item_JLother_ID ==2743 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2760  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2744 or Item_JLother_ID ==2744 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2761  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2745 or Item_JLother_ID ==2745 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2762  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2746 or Item_JLother_ID ==2746 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2763  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2747 or Item_JLother_ID ==2747 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2764  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2748 or Item_JLother_ID ==2748 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2765  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2749 or Item_JLother_ID ==2749 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2766  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2750 or Item_JLother_ID ==2750 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2767  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2751 or Item_JLother_ID ==2751 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2768  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2752 or Item_JLother_ID ==2752 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2769  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2753 or Item_JLother_ID ==2753 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2770  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2754 or Item_JLother_ID ==2754 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2771  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2755 or Item_JLother_ID ==2755 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2772  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 10
			Part3_newJL = 1
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 10
			Part3_newJL = 2
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 10
			Part3_newJL = 3
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 )	--Начальное влад. феей
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
	end

	-----------------------------------------------------------------------------------------
	------                 Спаривание 6 Ген----------->7 Ген							-----
	-----------------------------------------------------------------------------------------
	if Item_EMstone_ID ==3924 then	--Фрукт для спарки дракона
		local j1 =TakeItem( role, 0, 1253, 500 )	--Первый лут для драка
		local j2 = TakeItem( role, 0, 3442, 500 )	--Второй лут для драка
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0

		if Item_JLone_ID ==2756 or Item_JLother_ID ==2756 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2773  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2757 or Item_JLother_ID ==2757 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2774  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2758 or Item_JLother_ID ==2759 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2775  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2759 or Item_JLother_ID ==2759 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2776  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2760 or Item_JLother_ID ==2760 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2777  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2761 or Item_JLother_ID ==2761 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2778  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2762 or Item_JLother_ID ==2762 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2779  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2763 or Item_JLother_ID ==2763 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2780  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2764 or Item_JLother_ID ==2764 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2781  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2765 or Item_JLother_ID ==2765 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2782  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2766 or Item_JLother_ID ==2766 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2783  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2767 or Item_JLother_ID ==2767 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2784  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2768 or Item_JLother_ID ==2768 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2785  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2769 or Item_JLother_ID ==2769 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2786  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2770 or Item_JLother_ID ==2770 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2787  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2771 or Item_JLother_ID ==2771 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2788  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2772 or Item_JLother_ID ==2772 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2789  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 11
			Part3_newJL = 1
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 11
			Part3_newJL = 2
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 11
			Part3_newJL = 3
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 )	--Начальное влад. феей
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
	end

	-----------------------------------------------------------------------------------------
	------                 Спаривание 7 Ген----------->8 Ген							-----
	-----------------------------------------------------------------------------------------
	if Item_EMstone_ID ==3925 then
		local j1 = TakeItem( role, 0,4533, 500 )
		local j2 = TakeItem( role, 0,3444, 500 )
		if j1==0 or j2==0 then
			SystemNotice ( role ,"\211\228\224\235\229\237\232\229 \236\224\242\229\240\232\224\235\238\226 \228\235\255 \240\238\230\228\229\237\232\255 \239\232\242\238\236\246\224 \237\229 \243\228\224\235\238\241\252")
			--SystemNotice ( role ,"Удаление материалов для рождения питомца не удалось")
			return
		end
		local rad = math.random ( 1, 100 )
		local r1 = 0
		local r2 = 0

		if Item_JLone_ID ==2773 or Item_JLother_ID ==2773 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2790  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2774 or Item_JLother_ID ==2774 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2791  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2775 or Item_JLother_ID ==2775 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2792  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2776 or Item_JLother_ID ==2776 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2793  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2777 or Item_JLother_ID ==2777 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2794  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2778 or Item_JLother_ID ==2778 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2795  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2779 or Item_JLother_ID ==2779 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2796  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2780 or Item_JLother_ID ==2780 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2797  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2781 or Item_JLother_ID ==2781 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2798  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2782 or Item_JLother_ID ==2782 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2799  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2783 or Item_JLother_ID ==2783 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2800  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2784 or Item_JLother_ID ==2784 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2801  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2785 or Item_JLother_ID ==2785 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2802  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2786 or Item_JLother_ID ==2786 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2803  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2787 or Item_JLother_ID ==2787 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2804  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2788 or Item_JLother_ID ==2788 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2805  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		if Item_JLone_ID ==2789 or Item_JLother_ID ==2789 then
			if Item_JLone_ID==Item_JLother_ID then
			if lv_JLone>=200 and lv_JLone>=200 and lv_JLother>=200 and lv_JLother>=200 then
			r1,r2 =MakeItem ( role , 2806  , 1 , 4 )--фея Дракона
			end
			end
		else
			SystemNotice ( role ,"Ошибка, Что то пошло не так. ")
		end

		local Item_newJL = GetChaItem ( role , 2 , r2 )
		local Num_newJL = GetItemForgeParam ( Item_newJL , 1 )
		local Part1_newJL = GetNum_Part1 ( Num_newJL )
		local Part2_newJL = GetNum_Part2 ( Num_newJL )
		local Part3_newJL = GetNum_Part3 ( Num_newJL )
		local Part4_newJL = GetNum_Part4 ( Num_newJL )
		local Part5_newJL = GetNum_Part5 ( Num_newJL )
		local Part6_newJL = GetNum_Part6 ( Num_newJL )
		local Part7_newJL = GetNum_Part7 ( Num_newJL )
		if lv_JLone>=20 and lv_JLother >=20 then
			Part2_newJL = 12
			Part3_newJL = 1
		end
		if lv_JLone>=25 and lv_JLother >=25 then
			Part2_newJL = 12
			Part3_newJL = 2
		end
		if lv_JLone>=35 and lv_JLother >=35 then
			Part2_newJL = 12
			Part3_newJL = 3
		end
		local rad1 = math.random ( 1, 100 )
		if Part3_newJL==3 then
			GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
		end
		if Part3_newJL==2 then
			if rad1 <=95 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 95 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		if Part3_newJL==1 then
			if rad1 <=90 then
				GiveItem ( role , 0 , 239  , 1 , 4 )	--Начальное влад. феей
			elseif rad1 > 90 and rad1 <=98 then
				GiveItem ( role , 0 , 608  , 1 , 4 )	--Станд. влад. феей
			elseif rad1 > 98 and rad1 <=100 then
				GiveItem ( role , 0 , 609  , 1 , 4 )	--Продвинутое влад. феей
			end
		end
		Num_newJL = SetNum_Part1 ( Num_newJL , 1 )
		Num_newJL = SetNum_Part2 ( Num_newJL , Part2_newJL )
		Num_newJL = SetNum_Part3 ( Num_newJL , Part3_newJL )
		Num_newJL = SetNum_Part4 ( Num_newJL , Part4_newJL )
		Num_newJL = SetNum_Part5 ( Num_newJL , Part5_newJL )
		Num_newJL = SetNum_Part6 ( Num_newJL , Part6_newJL )
		Num_newJL = SetNum_Part7 ( Num_newJL , Part7_newJL )
		SetItemForgeParam ( Item_newJL , 1 , Num_newJL )

		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STR , new_str )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_DEX , new_dex )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_STA , new_sta )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_AGI , new_agi )
		SetItemAttr ( Item_newJL , ITEMATTR_VAL_CON , new_con )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXENERGY , new_MAXENERGY )
		SetItemAttr ( Item_newJL , ITEMATTR_MAXURE , new_MAXURE )
	end
	local cha_name = GetChaDefaultName ( role )
	LG( "star_JLZS_lg" ,cha_name, Item_EMstone_ID , Item_JLone_ID , lv_JLone ,  Item_JLother_ID , lv_JLother , Item_newJL_ID )
	R1 = RemoveChaItem ( role , Item_EMstone_ID , 1 , 2 , ItemBag [0] , 2 , 1 , 0 )		
	if R1 == 0  then
		--SystemNotice( role , "Deletion of Demonic Fruit failed")
		return
	end
	 Elf_Attr_cs ( role , Item_JLone , Item_JLother )	
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
		BickerNotice(cha, fairyname..' успешно изучил '..bookname..'!')
		return
	end
	if skillid[2] == skid then
		num = SetNum_Part5(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' успешно изучил '..bookname..'!')
		return
	end
	if skillid[3] == skid then
		num = SetNum_Part7(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' успешно изучил '..bookname..'!')
		return
	end
	if skillid[1] == 0000 then
		num = SetNum_Part2(num, skid)
		num = SetNum_Part3(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' успешно изучил '..bookname..'!')
		return
	end
	if skillid[2] == 0000 then
		num = SetNum_Part4(num, skid)
		num = SetNum_Part5(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' успешно изучил '..bookname..'!')
		return
	end
	if skillid[3] == 0000 then
		num = SetNum_Part6(num, skid)
		num = SetNum_Part7(num, sklv)
		SetItemForgeParam(elf, 1, num)
		BickerNotice(cha, fairyname..' успешно изучил '..bookname..'!')
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
		BickerNotice(cha, fairyname..' успешно изучил '..bookname..'!')
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
				SystemNotice(cha, fairyname..' уже освоил '..bookname..'!')
				return false
			else
				if sklv ~= (skilllv[i]+1) then
					SystemNotice(cha, fairyname..' должен научиться '..GetItemName((GetItemID(item)-1))..' первый!')
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
		SystemNotice(cha, fairyname..' должен научиться '..name..' first!')
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
		if GetChaStateLv(cha,200) >= 1 then --check if happy ration on or not
		--	Notice("stats on")
			return 
		end
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
			LG('FairyCoinsTrack', 'NUM1 '..GetChaDefaultName(cha)..'\'s 1 FC!')
		end
		if math.mod(num, 2) == 0 and stamina >= 50 and is2 ~= 1 then
			GiveItemX(cha, 0, 855, ELELFC_GETRAD, 4)
			LG('FairyCoinsTrack', 'NUM2 '..GetChaDefaultName(cha)..'\'s 1 FC!')
		end
		if math.mod(num, 5) == 0 and stamina >= 50 and is2 ~= 1 then
			GiveItemX(cha, 0, 855, ELELFC_GETRAD, 4)
			LG('FairyCoinsTrack', 'NUM3 '..GetChaDefaultName(cha)..'\'s 1 FC!')
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
			if isAuto == 1 and GetItemAttr(fairy,ITEMATTR_URE) < 5000 then
				elf.handleRation(cha,ration)
				TakeItem(cha, 0, rationId, 1)
			end
		end
	end
	SynLook(cha)
	RefreshCha(cha)
end

function Auto_Ration2(cha, fairy)
	local fairyLv = GetFairyLevel(fairy)
	local ration = GetChaItem2(cha,2, 5381)
	if ration ~= nil then
		local rationId = GetItemID(ration)
		if elf.ration[rationId] ~= nil then
			local isAuto = elf.ration[rationId].auto or 0
			if isAuto == 1 and GetItemAttr(fairy,ITEMATTR_URE) < 5000 then
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
			SystemNotice(Player, GetItemName(GetItemID(Fairy))..' Exp получено: '..gainExp)
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
	SystemNotice(Player, GetItemName(GetItemID(Item))..' восстанавливается '..recStam..' Выносливость!')
	if StaminaOriginal < 50 then
		SetChaEquipValid(Player, 16, 1)
	end
	SynLook(Player)
	RefreshCha(Player)
end

function GetFairyLevelUpRate(level, num)
	local a
	if elf.useCustomRates then
		a = elf.levelUpRate[level]
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
		SystemNotice(cha, "Повышение уровня выполнено успешно, рост обнулен.")
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
			SystemNotice(cha, 'Повышение уровня потерпело неудачу, рост обнулен.')
		else
			fairyExp = fairyExp * 0.5;
			SystemNotice(cha, 'Повышение уровня потерпело неудачу, рост уменьшился наполовину.')
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
			print('Err['..GetItemName(fairyid)..'] не фея!')
			return nil;
		end
	end
end


function TransferFairyLv()
end

----------------------------------------------------------
-- Использование предмета:
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


function Auto_Fruit(role, now_tick, Fairy )
	local Fairy = GetEquipItemP(role,16)
	if Fairy==nil then
		return
	end
	local Get_Item_Type = GetItemType ( Fairy )
	local Item_AutoSpeed = GetChaItem ( role , 2 , 5 )
	local Item_AutoSpeed_ID = GetItemID ( Item_AutoSpeed )
	if Get_Item_Type == 59 then
		local ChaStateLv = GetChaStateLv ( role , STATE_JLJSGZ)
		if ChaStateLv > 1 then
			SystemNotice ( role , "Действие фрукта еще не прошло. Попробуйте позже " )
			UseItemFailed ( role )
		 return
		end
		local CheckLV = elf.conf['maximum']
		if ChaStateLv == 0 and Item_AutoSpeed_ID ==578 then
				if CheckLV == 0 then
					SystemNotice ( role , "Ксожалению после 1000го уровня нельзя ускорить рост ")
					return
				else
			local k = TakeItem(  role,0,578,1)
			if k==0 then
				SystemNotice ( role , "Невозможно удалить фрукт роста. " )
			else
				local statetime = 900
				local statelv =1
				AddState( role , role , STATE_JLJSGZ , statelv , statetime )
				SystemNotice ( role , "Автоматическое ускорение роста успешно!" )
				end
			end
		end
	end
end

elf.handleGrowthFruit = function(role, Item, Item_Traget)
	local Cha_Boat = 0
	Cha_Boat = GetCtrlBoat(role)
	if Cha_Boat ~= nil then 
		SystemNotice(role, "Не может быть использован во время плавания") 
		UseItemFailed(role) 
		return 
	end
	if elf.growthFruit[GetItemID(Item)] == nil then
		SystemNotice(role, "Фрукты не были зарегистрированы!")
		UseItemFailed(role)
		return
	end
	local ChaStateLv = GetChaStateLv(role, STATE_JLJSGZ)
	local statelv = elf.growthFruit[GetItemID(Item)].statelv
	if ChaStateLv == statelv then
		SystemNotice(role, "Тот же фрукт в действии.Пожалуйста, используйте его позже...")
		UseItemFailed(role)
		return
	end
	if ChaStateLv > statelv then
		SystemNotice(role, "Лучшие фрукты в действии.Пожалуйста, используйте его позже...")
		UseItemFailed(role)
		return
	end
	local statetime = elf.growthFruit[GetItemID(Item)].time * 60
	AddState(role, role, STATE_JLJSGZ, statelv, statetime)
	SystemNotice(role, 'Рост Феи был умножен на x'..elf.growthFruit[GetItemID(Item)].multi..' на '..elf.growthFruit[GetItemID(Item)].time..' минут!')
end

function ItemUse_JLJSGz(role, Item, Item_Traget) elf.handleGrowthFruit(role, Item) end
function ItemUse_2BChengZhang(role, Item, Item_Traget) elf.handleGrowthFruit(role, Item) end
function ItemUse_3BChengZhang(role, Item, Item_Traget) elf.handleGrowthFruit(role, Item) end

elf.handleEggs = function(cha, Item, fairyId, gen)
	gen = gen or 1
	if GetChaFreeBagGridNum(cha) < 2 then
		SystemNotice(cha, "Вам нужно по крайней мере два свободных слота.")
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
----###### fix super ration top2 ####--- mothannakh---
---superpet stats --
--STATE_super			= 200

function State_super_Add(role, statelv)
	--ALLExAttrSet(role) 
end 
function STATE_super_Rem ( role , statelv )
--	ALLExAttrSet(role) 
end